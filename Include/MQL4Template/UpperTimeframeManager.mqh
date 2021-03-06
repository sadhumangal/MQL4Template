//+------------------------------------------------------------------+
//|                                         UpperTimeframeManger.mqh |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, Keisuke Iwabuchi"
#property strict


/**
 * 上位時間足でのshiftを軽量に取得するためのクラス
 * 主にインジケーターの初期計算時に使用されることを想定
 */
class UpperTimeframeManger
{
    private:
        /**
         * @val status  正常に動作中か否か
         */
        bool status;
        
        /**
         * @val tf  上位時間足
         */
        ENUM_TIMEFRAMES tf;
        
        /**
         * @val year  最後に取得した時刻の年
         */
        int year;
        
        /**
         * @val month  最後に取得した時刻の月
         */
        int month;
        
        /**
         * @val day  最後に取得した時刻の日付
         */
        int day;
        
        /**
         * @val last_shift  最後に取得した時の上位時間足のshift
         */
        int last_shift;

    public:
        UpperTimeframeManger(const ENUM_TIMEFRAMES timeframe);
        bool GetStatus(void);
        bool SetTimeframe(const ENUM_TIMEFRAMES timeframe);
        int ShiftToUpperTFShift(const int shift);
        
    private:
        int GetUpperTFShift(const int shift);
};


/**
 * コンストラクタ
 *
 * @param magic  上位時間足
 */
UpperTimeframeManger::UpperTimeframeManger(const ENUM_TIMEFRAMES timeframe)
{
    this.status = (timeframe > Period());
    this.tf = timeframe;
    this.year = 0;
    this.month = 0;
    this.day = 0;
    this.last_shift = 0;
}


/**
 * インスタンスの現在の状態が正常か否かを取得
 *
 * @return  true: 正常, false: 以上
 */
bool UpperTimeframeManger::GetStatus(void)
{
    return(this.status);
}


/**
 * 使用する上位時間足を変更する
 *
 * @param timeframe  上位時間足
 *
 * @return  true: 変更完了(変更がなかった場合もtrue), false: 失敗
 */
bool UpperTimeframeManger::SetTimeframe(const ENUM_TIMEFRAMES timeframe)
{
    if (timeframe == this.tf) {
        return(true);
    }
    if (timeframe > Period()) {
        this.status = true;
        this.tf = timeframe;
        this.year = 0;
        this.month = 0;
        this.day = 0;
        this.last_shift = 0;
        
        return(true);
    }
    return(false);
}


/**
 * 現在時間足でのshiftを上位時間足でのshiftに変換する
 *
 * @param shift  現在時間足でのshift
 *
 * @return  上位時間足でのshift
 */
int UpperTimeframeManger::ShiftToUpperTFShift(const int shift)
{
    MqlDateTime server;
    TimeToStruct(Time[shift], server);
    
    if (server.day != this.day || 
        (server.day == this.day && server.mon != this.month) ||
        (server.day == this.day && server.mon != this.month && server.year != this.year)) {
        this.year = server.year;
        this.month = server.mon;
        this.day = server.day;
        this.last_shift = this.GetUpperTFShift(shift);
    }
    
    return(this.last_shift);
}


/**
 * 現在時間足でのshiftを上位時間足でのshiftに変換する
 *
 * @param shift  現在時間足でのshift
 *
 * @return  上位時間足でのshift
 */
int UpperTimeframeManger::GetUpperTFShift(const int shift)
{
    for (int time = shift; time >= 0; time--) {
        if (Time[shift] < iTime(Symbol(), this.tf, time)) {
            return(time + 1);
        }
    }
    return(0);
}
