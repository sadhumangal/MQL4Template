# MQL4Template
EA・インジケーター開発のテンプレートです。  
最新版はversion1.09
  
  
  
  
## 定義値
+ OPEN_POS -> ポジション情報の取得に使用。エントリー中のポジション(OP_BUY + OP_SELL)を指す。
+ ALL_POS -> ポジション情報の取得に使用。全種類のポジションを指す。
+ PEND_POS -> ポジション情報の取得に使用。待機注文を指す。
+ RETRY_INTERVAL -> リトライ処理の間隔(ミリ秒)
+ RETRY_TIME_LIMIT -> リトライ処理の制限時間(ミリ秒)
  
  
  
  
## 列挙型
+ TRADE_SIGNAL -> 取引方向を表すための列挙型。主にエントリー判定に使用。
+ EROR -> 処理結果を3パターン受け取りたいときに使用。
+ SUMMER_TIME_MODE -> サマータイムの方式。
  
  
  
  
## 外部変数
+ __Symbol -> 通貨ペア名。Symbolは関数名なので特別に__を付けた命名を行う。異なる通貨ペアへの発注に対応するため外部変数にした。
+ __Point -> レートの最小単位。
+ __Digits -> レートの小数点以下の桁数。
+ TradeBar -> 最後にエントリーした時点でのBarsの値。連続エントリーの制御に使用。
+ Mult -> PointをPipsへ変換するための倍率。初期化時の算出以降、値を変更するべきではない。
+ IsTrade -> 取引をするか否か。基本はtrueだが、取引不能なエラーが発生した場合などはfalseとなる。
+ ObjectCount -> プログラムによって生成されたオブジェクトの総数。
+ GMTShift -> サーバー時刻とGMT時刻の時差が何時間あるか。
+ BuyTrade -> 買い取引の許可
+ SellTrade -> 売り取引の許可
