//
//  KzshAnalyzer.h
//  KzshAnalyticalEngine
//
//  Created by user on 2016/07/11.
//  Copyright © 2016年 ISP. All rights reserved.
//

#ifndef KzshAnalyzer_h
#define KzshAnalyzer_h

/** 読取り大項目名最大文字数 */
#define KZSH_ANLZR_ITEM_NAME_LARGE_MAX 20
/** 読取り中項目名最大文字数 */
#define KZSH_ANLZR_ITEM_NAME_MIDDLE_MAX 20
/** 読取り小項目名最大文字数 */
#define KZSH_ANLZR_ITEM_NAME_SMALL_MAX 20
/** 読取り目最大文字数 */
#define KZSH_ANLZR_VALUE_MAX 120

/** 読取り項目最大数 */
#define KZSH_ANLZR_ITEM_COUNT_MAX 100

#define KZSH_INCORRECT_ENGINE_STATE_ERR	-1	//エンジン状態不正エラー
#define KZSH_INPUT_ERROR				-2	//入力値不正エラー
#define KZSH_MEMORY_ALLOCATE_ERROR		-3	//メモリ確保失敗エラー
#define KZSH_OCR_FAILED_ERROR			-4	//OCR失敗エラー
#define KZSH_FINISHED_EXEC_ERROR		-5	//かざし読み終了済みエラー
#define KZSH_EXPIRED_ERROR 				-20	//期限切れエラー
#define KZSH_ENGINE_STATE_PAUSE_IN_EXEC	99	//エンジン一時停止状態

typedef enum tagAnalyzerFormat {
    ANALYZER_FORMAT_50001 = 50001, // かざし読み：健康診断(タテ=回転あり)
    ANALYZER_FORMAT_50002 = 50002, // かざし読み：健康診断(ヨコ=回転なし)
} AnalyzerFormat;

//項目解析状態
typedef enum tagItemAnalyzerState{
    //キーワード未発見(初期値)
    ITEM_ANALYZER_STATE_NO_KEYWORD = 0,
    //値文字列未発見
    ITEM_ANALYZER_STATE_NO_VALUE_STRING = 1,
    //値チェックNG
    ITEM_ANALYZER_STATE_NG_VALUE = 2,
    //値解析成功
    ITEM_ANALYZER_STATE_ANALYZE_SUCCESS = 3,
}ItemAnalyzerState;

//値情報構造体
typedef struct tagKzshAnalysisValueInfo {
    /** itemNameの読取り結果(最大文字数は80文字) */
    char value[KZSH_ANLZR_VALUE_MAX + 1];
    /** 読取った値の座標情報 */
    int top;
    int bottom;
    int left;
    int right;
    int distanceWordNum;	//項目・値間距離文字数
} KzshAnalysisValueInfo;

/** 読取り項目構造体 */
typedef struct tagKzshAnalysisItemInfo {
    /** 読取り項目グループ番号 */
    int groupNum;
    /** 読取り項目名の大項目 */
    char itemNameLarge[KZSH_ANLZR_ITEM_NAME_LARGE_MAX + 1];
    /** 読取り項目名の中項目 */
    char itemNameMiddle[KZSH_ANLZR_ITEM_NAME_MIDDLE_MAX + 1];
    /** 読取り項目名の小項目 */
    char itemNameSmall[KZSH_ANLZR_ITEM_NAME_SMALL_MAX + 1];
    /** 読取り結果 */
    KzshAnalysisValueInfo value1;
    KzshAnalysisValueInfo value2;
    KzshAnalysisValueInfo value3;
    KzshAnalysisValueInfo value4;
    KzshAnalysisValueInfo value5;
    int completed;
    ItemAnalyzerState itemAnalyzerState;//項目解析状態
} KzshAnalysisItemInfo;

/** かざし読み結果構造体 */
typedef struct tagKzshAnalyzerInfo {
    /** トータル読み取り数 */
    int totalRcgNum;
    /** トータルグループ数 */
    int totalGroupNum;
    /** 読取り中グループ数 */
    int analyzeGroupNum;
    /** 次回解析する項目Index */
    int nextAnalyzeIndex;
    /** 読取り結果 */
    KzshAnalysisItemInfo rcgItems[KZSH_ANLZR_ITEM_COUNT_MAX];
} KzshAnalysisInfo;

typedef enum tagKzshAnalyzerState {
    /** 一時停止 -> 未実行 処理中 */
    KZSH_ANLZR_STATE_PAUSE_IDLE = -1,
    /** 未実行 */
    KZSH_ANLZR_STATE_IDLE = 0,
    /** 一時停止 */
    KZSH_ANLZR_STATE_PAUSE = 1,
    /** 認識中 */
    KZSH_ANLZR_STATE_EXEC = 2,
} KzshAnalyzerState;

#ifdef __cplusplus
extern "C" {
#endif
    
int InitKzshAnalyzer(const char *inputFilePath, KzshAnalysisInfo *analysisInfo, int width, int height, const char *outputFolderPath);

int FinalKzshAnalyzer();

int GetKzshAnalyzerState();

int reAnalyzerItem(int itemNum, KzshAnalysisInfo *analysisInfo);

int StartKzshAnalyzer();

int PauseKzshAnalyzer();

int execKzshAnalyzer(AnalyzerFormat analyzerFormat, unsigned int *img, int width, int height, int left, int top, int right, int bottom, KzshAnalysisInfo *analysisInfo);

int GetGroupNumAnalyzer();

int SetGroupNumAnalyzer(int itemNum, KzshAnalysisInfo *analysisInfo);

#ifdef __cplusplus
}
#endif

#endif /* KzshAnalyzer_h */
