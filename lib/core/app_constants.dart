// ignore_for_file: constant_identifier_names
import 'package:flutter/foundation.dart';

const APP_V = "4.1.0";
const APP_VERSION = "beta$APP_V";

const ALLOW_PAYMENT = true;

const REFRESH_TIMEOUT_SECONDS = 10;
const REFRESH_TIMEOUT_SECONDS_INACTIVE = 300;
const REFRESH_TIMEOUT_SECONDS_BTC = 30;
const ALLOW_DOUBLE_MINTES = false;
const MIN_RBX_FOR_SC_ACTION = 0.001;
const DELETE_DRAFT_ON_MINT = true;
const USD_TO_RBX = 5.0;
const ASSURED_AMOUNT_TO_VALIDATE = 12000.0;
const ADNR_COST = 5.0;
// const ADNR_TRANSFER_COST = 1.0;
// const ADNR_DELETE_COST = 0.0;
const ADNR_TRANSFER_COST = 5.0;
const ADNR_DELETE_COST = 5.0;

const VOTE_TOPIC_COST = 10.0;
const MAX_COMPILE_QUANTITY = 10;
const MAX_ASSET_BYTES = 157286400;
const DEV_API_TOKEN = "devtoken";
const SHOP_PUBLISH_COST = 10.0;
const SHOP_DELETE_COST = 1.0;
const SHOP_UPDATE_COST = 1.0;
const RA_ACTIVATION_COST = 4.0;

const BTC_SATOSHI_MULTIPLIER = 0.00000001;
const BTC_TX_EXPECTED_BYTES = 140;
const BTC_MINIMUM_TX_AMOUNT = 0.00001;

class TxType {
  static const int rbxTransfer = 0;
  static const int node = 1;
  static const int nftMint = 2;
  static const int nftTx = 3;
  static const int nftBurn = 4;
  static const int nftSale = 5;
  static const int adnr = 6;
  static const int dstShop = 7;
  static const int voteTopic = 8;
  static const int vote = 9;
  static const int reserve = 10;
}

const DEFAULT_REJECTED_EXTENIONS = [
  "exe",
  "pif",
  "application",
  "gadget",
  "msi",
  "msp",
  "com",
  "scr",
  "hta",
  "cpl",
  "msc",
  "jar",
  "bat",
  "cmd",
  "vb",
  "vbs",
  "vbe",
  "js",
  "jse",
  "ws",
  "wsf",
  "wsc",
  "wsh",
  "ps1",
  "ps1xml",
  "ps2",
  "ps2xml",
  "psc1",
  "psc2",
  "msh",
  "msh1",
  "msh2",
  "mshxml",
  "msh1xml",
  "msh2xml",
  "scf",
  "lnk",
  "inf",
  "reg",
  "doc",
  "xls",
  "ppt",
  "docm",
  "dotm",
  "xlsm",
  "xltm",
  "xlam",
  "pptm",
  "potm",
  "ppam",
  "ppsm",
  "sldm",
  "sys",
  "dll",
  "zip",
  "rar",
];

const MALWARE_FILE_EXTENSIONS = [
  "xnxx",
  "ozd",
  "aur",
  "boo",
  "386",
  "sop",
  "dxz",
  "hlp",
  "tsa",
  "exe1",
  "bkd",
  "exe_",
  "rhk",
  "vbx",
  "lik",
  "osa",
  "9",
  "cih",
  "mjz",
  "dlb",
  "php3",
  "dyz",
  "wsc",
  "dom",
  "hlw",
  "s7p",
  "cla",
  "mjg",
  "mfu",
  "dyv",
  "kcd",
  "spam",
  "bup",
  "rsc_tmp",
  "mcq",
  "upa",
  "bxz",
  "dli",
  "txs",
  "xir",
  "cxq",
  "fnr",
  "xdu",
  "xlv",
  "wlpginstall",
  "ska",
  "tti",
  "cfxxe",
  "dllx",
  "smtmp",
  "vexe",
  "qrn",
  "xtbl",
  "fag",
  "oar",
  "ceo",
  "tko",
  "uzy",
  "bll",
  "dbd",
  "plc",
  "smm",
  "ssy",
  "blf",
  "zvz",
  "cc",
  "ce0",
  "nls",
  "ctbl",
  "crypt1",
  "hsq",
  "iws",
  "vzr",
  "lkh",
  "ezt",
  "rna",
  "aepl",
  "hts",
  "atm",
  "fuj",
  "aut",
  "fjl",
  "delf",
  "buk",
  "bmw",
  "capxml",
  "bps",
  "cyw",
  "iva",
  "pid",
  "lpaq5",
  "dx",
  "bqf",
  "qit",
  "pr",
  "lok",
  "xnt",
];
