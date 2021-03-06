#property strict
#property version   "1.00"


#include <MQL4Template\Template_1.09.mqh>


// パラメーター
sinput double Lots = 0.1; // 取引数量
sinput int MagicNumber = 123; // マジックナンバー
input double TP = 100; // 利食い(pips)
input double SL = 100; // 損切り(pips)
sinput double Slippage = 1.0; // スリッページ(pips)
sinput int MaxSpread = 10;  // 最大スプレッド
sinput string CommentVal = "";  // コメント


int OnInit()
{
    mql4 = new MQL4();
    
    return(INIT_SUCCEEDED);
}


void OnTick()
{
    // ポジション情報の取得
    int pos = GetOrderCount(OPEN_POS, MagicNumber);

    if (pos == 0) {
        // エントリー
        EntryProcess(Lots, Slippage, SL, TP, CommentVal, MagicNumber, MaxSpread);
    } else {
        // 決済
        ExitProcess(Slippage, MagicNumber);
    }
}


void OnDeinit(const int reason)
{
    delete mql4;
}


// エントリー処理の実行
void EntryProcess(
    const double lots,
    const double slippage,
    const double sl,
    const double tp,
    const string comment,
    const int magic,
    const int max_spread)
{
    if (mql4.GetIsTrade() == false) {
        return; // 取引停止状態
    }
   
    if (mql4.GetTradeBar() == Bars) {
        return; // このローソク足でエントリー済み
    }

    if (SpreadFilter(max_spread) == false) {
        return;
    }


    TRADE_SIGNAL entry_signal = GetEntrySignal();
    int trade_type = -1;
    double trade_price = 0;
    
    if (entry_signal == BUY_SIGNAL && mql4.GetIsBuyTrade() == true) {
        trade_type = OP_BUY;
        trade_price = Ask;
    } else if (entry_signal == SELL_SIGNAL && mql4.GetIsSellTrade() == true) {
        trade_type = OP_SELL;
        trade_price = Bid;
    }
   
    if (trade_type == -1) {
        return; // 取引種別不正
    }
   

    int trade_result = EntryWithPips(
        trade_type,
        lots,
        trade_price,
        slippage,
        sl,
        tp,
        comment,
        magic);
    
    if (trade_result == 134 && IsTesting()) {
        mql4.SetFalseIsTrade();
    }
    
    mql4.SetTradeBar(Bars);
}


// エントリー条件の判定
TRADE_SIGNAL GetEntrySignal()
{
    return(EntrySignal());
}


TRADE_SIGNAL EntrySignal()
{
    if (Close[1] > Open[1]) {
        return(BUY_SIGNAL);
    } else if (Close[1] < Open[1]) {
        return(SELL_SIGNAL);
    }
    return(NO_SIGNAL);
}


// 決済処理の実行
void ExitProcess(const double slippage, const int magic)
{
    if (GetExitSignal() == true) {
        Exit(slippage, magic);
    }
}


// 決済条件の判定
bool GetExitSignal()
{
    return(false);
}
