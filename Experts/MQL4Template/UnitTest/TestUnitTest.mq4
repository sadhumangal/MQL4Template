//+------------------------------------------------------------------+
//|                                             TestGetOrderLots.mq4 |
//|                                 Copyright 2018, Keisuke Iwabuchi |
//|                  https://github.com/KeisukeIwabuchi/MQL4Template |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, Keisuke Iwabuchi"
#property link      "https://github.com/KeisukeIwabuchi/MQL4Template"
#property version   "1.00"
#property strict


#include <MQL4Template\UnitTest.mqh>


class UnitTestTest : public UnitTest
{
public:
    // value is ...
    void TestAssertEquals(void);
    void TestAssertEqualsWithDigits(void);
    void TestAssertGreaterThan(void);
    void TestAssertGreaterThanOrEqual(void);
    void TestAssertLessThan(void);
    void TestAssertLessThanOrEqual(void);
    
    // string is ...
    void TestAssertNull(void);
    void TestAssertStringStartsWith(void);
    void TestAssertStringEndsWith(void);
    
    // boolean is ...
    void TestAssertTrue(void);
    void TestAssertFalse(void);
    
    // array is ...
    void TestAssertContains(void);
    void TestAssertCount(void);
    
    // file is ...
    void TestAssertFileExists(void);
    void TestAssertFileEquals(void);
    
    // comment is ...
    void TestAssertSeeComment(void);
    void TestAssertDontSeeComment(void);
    
    // object is ...
    void TestAssertHasObject(void);
    void TestAssertObjectAttribute(void);
    
    // order is ...
    void TestAssertOrderCount(void);
    void TestAssertHasOrderByTicket(void);
    void TestAssertHasOrderByMagicNumber(void);
    void TestAssertSymbol(void);
    void TestAssertType(void);
    void TestAssertLots(void);
    void TestAssertTP(void);
    void TestAssertSL(void);
    void TestAssertTPSL(void);
    void TestAssertComment(void);
    void TestAssertMagicNumber(void);
    void TestAssertExpiration(void);
};


// value is ...
void UnitTestTest::TestAssertEquals(void)
{
    this.Init("TestAssertEquals");
    
    // int value
    this.AssertEquals(0, 0);
    this.AssertEquals(1, 1);
    this.AssertEquals(-1, -1);
    
    // double value
    this.AssertEquals(0.0, 0.0);
    this.AssertEquals(1.5, 1.5);
    this.AssertEquals(-2.5, -2.5);
    
    // string value
    this.AssertEquals("", "");
    this.AssertEquals("hoge", "hoge");
    this.AssertEquals("123", "123");
    
    // boolean value
    this.AssertEquals(true, true);
    this.AssertEquals(false, false);
    
    // color value
    this.AssertEquals(clrRed, Red);
    
    // datetime value
    this.AssertEquals(D'2018.09.09', D'2018.09.09');
}


void UnitTestTest::TestAssertEqualsWithDigits(void)
{
    this.Init("TestAssertEqualsWithDigits");
    
    this.AssertEqualsWithDigits(0.0, 0.0, 0);
    this.AssertEqualsWithDigits(0.0, 0.0, 1);
    this.AssertEqualsWithDigits(0.0, 0.0, 8);
    this.AssertEqualsWithDigits(1.5, 1.5, 0);
    this.AssertEqualsWithDigits(1.5, 1.5, 1);
    this.AssertEqualsWithDigits(1.5, 1.5, 8);
    this.AssertEqualsWithDigits(-2.5, -2.5, 0);
    this.AssertEqualsWithDigits(-2.5, -2.5, 1);
    this.AssertEqualsWithDigits(-2.5, -2.5, 8);
}


void UnitTestTest::TestAssertGreaterThan(void)
{
    this.Init("TestAssertGreaterThan");

    // int value
    this.AssertGreaterThan(0, 1);
    this.AssertGreaterThan(-1, 0);
    this.AssertGreaterThan(-2, 2);
    
    // double value
    this.AssertGreaterThan(0.0, 1.5);
    this.AssertGreaterThan(-1.5, 0.0);
    this.AssertGreaterThan(-2.5, 2.5);
}


void UnitTestTest::TestAssertGreaterThanOrEqual(void)
{
    this.Init("TestAssertGreaterThanOrEqual");

    // int value
    this.AssertGreaterThanOrEqual(0, 1);
    this.AssertGreaterThanOrEqual(-1, 0);
    this.AssertGreaterThanOrEqual(-2, 2);
    this.AssertGreaterThanOrEqual(3, 3);
    this.AssertGreaterThanOrEqual(-4, -4);
    this.AssertGreaterThanOrEqual(0, 0);
    
    // double value
    this.AssertGreaterThanOrEqual(0.0, 1.5);
    this.AssertGreaterThanOrEqual(-1.5, 0.0);
    this.AssertGreaterThanOrEqual(-2.5, 2.5);
    this.AssertGreaterThanOrEqual(3.5, 3.5);
    this.AssertGreaterThanOrEqual(-4.5, -4.5);
    this.AssertGreaterThanOrEqual(0.0, 0.0);
}


void UnitTestTest::TestAssertLessThan(void)
{
    this.Init("TestAssertLessThan");

    // int value
    this.AssertLessThan(1, 0);
    this.AssertLessThan(0, -1);
    this.AssertLessThan(2, -2);
    
    // double value
    this.AssertLessThan(1.5, 0.0);
    this.AssertLessThan(0.0, -1.5);
    this.AssertLessThan(2.5, -2.5);
}


void UnitTestTest::TestAssertLessThanOrEqual(void)
{
    this.Init("TestAssertLessThanOrEqual");

    // int value
    this.AssertLessThanOrEqual(1, 0);
    this.AssertLessThanOrEqual(0, -1);
    this.AssertLessThanOrEqual(2, -2);
    this.AssertLessThanOrEqual(3, 3);
    this.AssertLessThanOrEqual(-4, -4);
    this.AssertLessThanOrEqual(0, 0);
    
    // double value
    this.AssertLessThanOrEqual(1.5, 0.0);
    this.AssertLessThanOrEqual(0.0, -1.5);
    this.AssertLessThanOrEqual(2.5, -2.5);
    this.AssertLessThanOrEqual(3.5, 3.5);
    this.AssertLessThanOrEqual(-4.5, -4.5);
    this.AssertLessThanOrEqual(0.0, 0.0);
}


// string is ...
void UnitTestTest::TestAssertNull(void)
{
    this.Init("TestAssertNull");

    // case 1
    this.AssertNull(NULL);
    
    // case 2
    string uga;
    this.AssertNull(uga);
    
    // case 3
    string hoge = NULL;
    this.AssertNull(hoge);
}


void UnitTestTest::TestAssertStringStartsWith(void)
{
    this.Init("TestAssertStringStartsWith");
    
    // case 1
    this.AssertStringStartsWith("abcdefg", "a");
    
    // case 2
    this.AssertStringStartsWith("abcdefg", "abc");
}


void UnitTestTest::TestAssertStringEndsWith(void)
{
    this.Init("TestAssertStringEndsWith");
    
    // case 1
    this.AssertStringEndsWith("abcdefg", "g");
    
    // case 2
    this.AssertStringEndsWith("abcdefg", "efg");
}


// boolean is ...
void UnitTestTest::TestAssertTrue(void)
{
    this.Init("TestAssertTrue");
    
    this.AssertTrue(true);
    this.AssertTrue(1 > 0);
}


void UnitTestTest::TestAssertFalse(void)
{
    this.Init("TestAssertFalse");
    
    this.AssertFalse(false);
    this.AssertFalse(1 < 0);
}


// array is ...
void UnitTestTest::TestAssertContains(void)
{
    this.Init("TestAssertContains");
    
    int int_arr[] = {1, 2, 3, 4, 5};
    this.AssertContains(1, int_arr);
    
    double double_arr[] = {1.1, 2.2, 3.3, 4.4, 5.5};
    this.AssertContains(3.3, double_arr);
    
    string str_arr[] = {"apple", "banana"};
    this.AssertContains("banana", str_arr);
}


void UnitTestTest::TestAssertCount(void)
{
    this.Init("TestAssertCount");
    
    int int_arr[] = {1, 2, 3, 4, 5};
    this.AssertCount(5, int_arr);
    
    double double_arr[] = {};
    this.AssertCount(0, double_arr);
    
    string str_arr[] = {"apple", "banana"};
    this.AssertCount(2, str_arr);
}


// file is ...
void UnitTestTest::TestAssertFileExists(void)
{
    this.Init("TestAssertFileExists");
    
    int file_handle1 = FileOpen("unit_test.txt", FILE_READ|FILE_WRITE|FILE_TXT|FILE_ANSI);
    if (file_handle1 != INVALID_HANDLE) {
        FileWriteString(file_handle1, "hoge");
        FileClose(file_handle1);
    }
    this.AssertFileExists("unit_test.txt");
    
    int file_handle2 = FileOpen("unit_test\\unit_test.txt", FILE_READ|FILE_WRITE|FILE_TXT|FILE_ANSI);
    if (file_handle2 != INVALID_HANDLE) {
        FileWriteString(file_handle2, "hoge");
        FileClose(file_handle2);
    }
    this.AssertFileExists("unit_test\\unit_test.txt");
}


void UnitTestTest::TestAssertFileEquals(void)
{
    this.Init("TestAssertFileEquals");
    
    int file_handle1 = FileOpen("unit_test1.txt", FILE_READ|FILE_WRITE|FILE_TXT|FILE_ANSI);
    if (file_handle1 != INVALID_HANDLE) {
        FileWriteString(file_handle1, "hoge");
        FileClose(file_handle1);
    }
    
    int file_handle2 = FileOpen("unit_test2.txt", FILE_READ|FILE_WRITE|FILE_TXT|FILE_ANSI);
    if (file_handle2 != INVALID_HANDLE) {
        FileWriteString(file_handle2, "hoge");
        FileClose(file_handle2);
    }

    this.AssertFileEquals("unit_test1.txt", "unit_test2.txt");
}


// comment is ...
void UnitTestTest::TestAssertSeeComment(void)
{
    this.Init("TestAssertSeeComment");
    
    Comment("abcde");
    
    test.AssertSeeComment("ab");
    test.AssertSeeComment("bcd");
    test.AssertSeeComment("de");
    test.AssertSeeComment("abcde");
    
    Comment("");
}


void UnitTestTest::TestAssertDontSeeComment(void)
{
    this.Init("TestAssertDontSeeComment");
    
    Comment("abcde");
    
    test.AssertDontSeeComment("123");
    test.AssertDontSeeComment("fgh");
    
    Comment("");
}


// object is ...
void UnitTestTest::TestAssertHasObject(void)
{
    this.Init("TestAssertHasObject");
    
    string obj_name = "UnitTestObj";
    ObjectCreate(0, obj_name, OBJ_HLINE, 0, Time[0], Close[0]);
    
    this.AssertHasObject(obj_name);
    
    ObjectDelete(0, obj_name);
}


void UnitTestTest::TestAssertObjectAttribute(void)
{
    this.Init("TestAssertObjectAttribute");
    
    string obj_name = "UnitTestObj";
    ObjectCreate(0, obj_name, OBJ_HLINE, 0, Time[0], Close[0]);
    ObjectSetInteger(0, obj_name, OBJPROP_WIDTH, 3);
    ObjectSetDouble(0, obj_name, OBJPROP_PRICE, 123.45);
    
    // int value
    this.AssertObjectAttribute(3, obj_name, OBJPROP_WIDTH);
    
    // double value
    this.AssertObjectAttribute(123.45, obj_name, OBJPROP_PRICE);
    
    // string value
    this.AssertObjectAttribute(obj_name, obj_name, OBJPROP_NAME);
    
    ObjectDelete(0, obj_name);
}


// order is ...
void UnitTestTest::TestAssertOrderCount(void)
{
    this.Init("TestAssertOrderCount");
    
    this.AssertOrderCount(0);
    
    this.MakeBuyOrder(1);
    
    this.AssertOrderCount(1);
}


void UnitTestTest::TestAssertHasOrderByTicket(void)
{
    this.Init("TestAssertHasOrderByTicket");
    
    int ticket = this.MakeOrder(Symbol(), OP_BUY, 0.1, Ask, 0, 0, "hoge", 0);
    this.AssertHasOrderByTicket(ticket);
}


void UnitTestTest::TestAssertHasOrderByMagicNumber(void)
{
    this.Init("TestAssertHasOrderByMagicNumber");
    
    int ticket = this.MakeOrder(Symbol(), OP_BUY, 0.1, Ask, 0, 0, "hoge", 123);
    this.AssertHasOrderByMagicNumber(123);
}


void UnitTestTest::TestAssertSymbol(void)
{
    this.Init("TestAssertSymbol");
    
    int ticket = this.MakeOrder(Symbol(), OP_BUY, 0.1, Ask, 0, 0, "hoge", 0);
    this.AssertSymbol(ticket, Symbol());
}


void UnitTestTest::TestAssertType(void)
{
    this.Init("TestAssertType");
    
    int ticket = this.MakeOrder(Symbol(), OP_BUY, 0.1, Ask, 0, 0, "hoge", 0);
    this.AssertType(ticket, OP_BUY);
}


void UnitTestTest::TestAssertLots(void)
{
    this.Init("TestAssertLots");
    
    int ticket = this.MakeOrder(Symbol(), OP_BUY, 0.1, Ask, 0, 0, "hoge", 0);
    this.AssertLots(ticket, 0.1);
}


void UnitTestTest::TestAssertSL(void)
{
    this.Init("TestAssertSL");
    
    int ticket = this.MakeOrder(Symbol(), OP_BUY, 0.1, Ask, 99.9, 0, "hoge", 0);
    this.AssertSL(ticket, 99.9);
}


void UnitTestTest::TestAssertTP(void)
{
    this.Init("TestAssertTP");
    
    int ticket = this.MakeOrder(Symbol(), OP_BUY, 0.1, Ask, 0, 123.4, "hoge", 0);
    this.AssertTP(ticket, 123.4);
}


void UnitTestTest::TestAssertTPSL(void)
{
    this.Init("TestAssertTPSL");
    
    int ticket = this.MakeOrder(Symbol(), OP_BUY, 0.1, Ask, 99.9, 123.4, "hoge", 0);
    this.AssertTPSL(ticket, 123.4, 99.9);
}


void UnitTestTest::TestAssertComment(void)
{
    this.Init("TestAssertComment");
    
    int ticket = this.MakeOrder(Symbol(), OP_BUY, 0.1, Ask, 0, 0, "hoge", 0);
    this.AssertComment(ticket, "hoge");
}


void UnitTestTest::TestAssertMagicNumber(void)
{
    this.Init("TestAssertMagicNumber");
    
   int ticket = this.MakeOrder(Symbol(), OP_BUY, 0.1, Ask, 0, 0, "hoge", 0);
    this.AssertMagicNumber(ticket, 0);
}


void UnitTestTest::TestAssertExpiration(void)
{
    this.Init("TestAssertExpiration");
    
    // 有効期限は分まで有効, 秒単位は切り捨てられるので確認する有効期限も合わせる
    datetime expiration = TimeCurrent() + 3600 * 24 * 7;
    int rest = (int)(expiration % 60);
    expiration -= rest;
    
    int ticket = this.MakeOrder(Symbol(), OP_BUYSTOP, 0.1, Ask + 1, 0, 0, "hoge", 0, expiration);
    this.AssertExpiration(ticket, expiration);
}


UnitTestTest *test;


int OnInit()
{
    test = new UnitTestTest();
    
    // value is ...
    test.TestAssertEquals();
    test.TestAssertEqualsWithDigits();
    test.TestAssertGreaterThan();
    test.TestAssertGreaterThanOrEqual();
    test.TestAssertLessThan();
    test.TestAssertLessThanOrEqual();
    
    // string is ...
    test.TestAssertNull();
    test.TestAssertStringStartsWith();
    test.TestAssertStringEndsWith();
    
    // boolean is ...
    test.TestAssertTrue();
    test.TestAssertFalse();
    
    // array is ...
    test.TestAssertContains();
    test.TestAssertCount();
    
    // file is ...
    test.TestAssertFileExists();
    test.TestAssertFileEquals();
    
    // comment is ...
    test.TestAssertSeeComment();
    test.TestAssertDontSeeComment();
    
    // object is ...
    test.TestAssertHasObject();
    test.TestAssertObjectAttribute();
    
    // order is ...
    test.TestAssertOrderCount();
    test.TestAssertHasOrderByTicket();
    test.TestAssertHasOrderByMagicNumber();
    test.TestAssertSymbol();
    test.TestAssertType();
    test.TestAssertLots();
    test.TestAssertSL();
    test.TestAssertTP();
    test.TestAssertTPSL();
    test.TestAssertComment();
    test.TestAssertMagicNumber();
    test.TestAssertExpiration();
    
    test.Result();
    // ExpertRemove();
    
    return(INIT_SUCCEEDED);
}


void OnDeinit(const int reason)
{
    delete test;
}


void OnTick()
{
    
}
