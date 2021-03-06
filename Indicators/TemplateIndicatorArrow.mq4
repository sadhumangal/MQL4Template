#property version   "1.01"
#property strict
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_color1 Blue
#property indicator_color2 Red
#property indicator_width1 1
#property indicator_width2 1


#include <Template_1.04.mqh>


double UpArrow[];
double DownArrow[];


bool   IsAlert = false;
bool   IsMail = false;
int    InfoBar = 0;
int    Mult;


int OnInit()
{
   SetIndexStyle(0, DRAW_ARROW);
   SetIndexBuffer(0, UpArrow);
   SetIndexArrow(0, 233);
   SetIndexStyle(1, DRAW_ARROW);
   SetIndexBuffer(1, DownArrow);
   SetIndexArrow(1, 234);
   
   Mult = (Digits == 3 || Digits == 5) ? 10 : 1;
   
   return(INIT_SUCCEEDED);
}


int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
{
   double sma[2], lma[2];

   int limit = Bars - IndicatorCounted() - 1;
   int min_bars = 20;

   for (int i = limit; i >= 0; i--) {
      if (i > Bars - min_bars) {
         continue;
      }
      
      // 計算に必要なテクニカル指標の値を取得
      sma[0] = iMA(_Symbol, _Period, 10, 0, MODE_SMA, PRICE_CLOSE, i);
      sma[1] = iMA(_Symbol, _Period, 10, 0, MODE_SMA, PRICE_CLOSE, i + 1);
      lma[0] = iMA(_Symbol, _Period, 20, 0, MODE_SMA, PRICE_CLOSE, i);
      lma[1] = iMA(_Symbol, _Period, 20, 0, MODE_SMA, PRICE_CLOSE, i + 1);
      
      // 上矢印
      if (sma[0] > lma[0] && sma[1] <= lma[1]) {
         UpArrow[i] = low[i] - 5 * _Point;
         
         if (i == 0 && InfoBar != Bars) {
            if (IsAlert) {
               Alert(MQLInfoString(MQL_PROGRAM_NAME) + " Up " + Symbol() + " " + PeriodToString(Period()));
            }
            if (IsMail) {
               SendMail(
                  MQLInfoString(MQL_PROGRAM_NAME),
                  "Up " + _Symbol + " " + PeriodToString(Period())
               );
            }
         }
         InfoBar = Bars;
      }
      
      // 下矢印
      if (sma[0] < lma[0] && sma[1] >= lma[1]) {
         DownArrow[i] = high[i] + 5 * _Point;
         
         if (i == 0 && InfoBar != Bars) {
            if (IsAlert) {
               Alert(MQLInfoString(MQL_PROGRAM_NAME) + " Down " + Symbol() + " " + PeriodToString(Period()));
            }
            if (IsMail) {
               SendMail(
                  MQLInfoString(MQL_PROGRAM_NAME),
                  "Down " + _Symbol + " " + PeriodToString(Period())
               );
            }
         }
         InfoBar = Bars;
      }
   }

   return(rates_total);
}


void OnDeinit(const int reason)
{

}
