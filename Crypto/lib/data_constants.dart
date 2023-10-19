class DataConstants {
  static const appName = 'Crypto';
  static const fontFamily = 'NotoSans';

  static List<String> dataToShow = [
    'open',
    'high',
    'low',
    'last',
    'volume',
  ];

  static List<String> getAllowedVal() {
    String values =
        'btcusd, btceur, btcgbp, btcpax, gbpusd, gbpeur, eurusd, xrpusd, xrpeur, xrpbtc, xrpgbp, xrppax, ltcbtc, ltcusd, ltceur, ltcgbp, ethbtc, ethusd, etheur, ethgbp, ethpax, bchusd, bcheur, bchbtc, bchgbp, paxusd, paxeur, paxgbp, xlmbtc, xlmusd, xlmeur, xlmgbp, linkusd, linkeur, linkgbp, linkbtc, linketh, omgusd, omgeur, omggbp, omgbtc, usdcusd, usdceur, btcusdc, ethusdc, eth2eth, aaveusd, aaveeur, aavebtc, batusd, bateur, batbtc, umausd, umaeur, umabtc, daiusd, kncusd, knceur, kncbtc, mkrusd, mkreur, mkrbtc, zrxusd, zrxeur, zrxbtc, gusdusd, algousd, algoeur, algobtc, audiousd, audioeur, audiobtc, crvusd, crveur, crvbtc, snxusd, snxeur, snxbtc, uniusd, unieur, unibtc, yfiusd, yfieur, yfibtc, compusd, compeur, compbtc, grtusd, grteur, usdtusd, usdteur, usdcusdt, btcusdt, ethusdt, xrpusdt, eurteur, eurtusd, maticusd, maticeur, sushiusd, sushieur, chzusd, chzeur, enjusd, enjeur, hbarusd, hbareur, alphausd, alphaeur, axsusd, axseur, fttusd, ftteur, sandusd, sandeur, storjusd, storjeur, adausd, adaeur, adabtc, fetusd, feteur, rgtusd, rgteur, sklusd, skleur, celusd, celeur, slpusd, slpeur, sxpusd, sxpeur, sgbusd, sgbeur, dydxusd, dydxeur, galausd, galaeur, perpusd, perpeur';
    String val = values.replaceAll(' ', '');
    return val.split(',');
  }

  //Order Book ->
  static const showText = 'VIEW';
  static const hideText = 'HIDE';
  static const itemName = 'ORDER BOOK';
  static const col1 = 'BID PRICE';
  static const col2 = 'QTY';
  static const col3 = 'QTY';
  static const col4 = 'ASK PRICE';
}
