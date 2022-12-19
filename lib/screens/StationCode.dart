// StationCode.dart  경로코 입력받는 페이지
import 'package:flutter/material.dart';
import 'package:subway_pro/screens/HomePage.dart';
import 'package:subway_pro/screens/StationserchPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:subway_pro/test1/route_subway_model.dart';

enum SubwayInfo {
  wangsimni(name: '왕십리', number: 0209),
  gangnam(name: '강남', number: 0222);

  final String name;
  final int number;

  const SubwayInfo({required this.name, required this.number});
}

String text = '''역코드  역이름     호선   
 0150   서울역   1   
 0151   시청   1   
 0152   종각   1   
 0153   종로3가   1   
 0154   종로5가   1   
 0155   동대문   1   
 0156   신설동   1   
 0157   제기동   1   
 0158   청량리   1   
 0159   동묘앞   1   
 0200   까치산   2   
 0201   시청   2   
 0202   을지로입구   2   
 0203   을지로3가   2   
 0204   을지로4가   2   
 0205   동대문역사문화공원   2   
 0206   신당   2   
 0207   상왕십리   2   
 0208   왕십리   2   
 0209   한양대   2   
 0210   뚝섬   2   
 0211   성수   2   
 0212   건대입구   2   
 0213   구의   2   
 0214   강변   2   
 0215   잠실나루   2   
 0216   잠실   2   
 0217   잠실새내   2   
 0218   종합운동장   2   
 0219   삼성   2   
 0220   선릉   2   
 0221   역삼   2   
 0222   강남   2   
 0223   교대   2   
 0224   서초   2   
 0225   방배   2   
 0226   사당   2   
 0227   낙성대   2   
 0228   서울대입구   2   
 0229   봉천   2   
 0230   신림   2   
 0231   신대방   2   
 0232   구로디지털단지   2   
 0233   대림   2   
 0234   신도림   2   
 0235   문래   2   
 0236   영등포구청   2   
 0237   당산   2   
 0238   합정   2   
 0239   홍대입구   2   
 0240   신촌   2   
 0241   이대   2   
 0242   아현   2   
 0243   충정로   2   
 0244   용답   2   
 0245   신답   2   
 0246   신설동   2   
 0247   도림천   2   
 0248   양천구청   2   
 0249   신정네거리   2   
 0250   용두   2   
 0300   대곡   경의선   
 0309   지축   3   
 0310   구파발   3   
 0311   연신내   3   
 0312   불광   3   
 0313   녹번   3   
 0314   홍제   3   
 0315   무악재   3   
 0316   독립문   3   
 0317   경복궁   3   
 0318   안국   3   
 0319   종로3가   3   
 0320   을지로3가   3   
 0321   충무로   3   
 0322   동대입구   3   
 0323   약수   3   
 0324   금호   3   
 0325   옥수   3   
 0326   압구정   3   
 0327   신사   3   
 0328   잠원   3   
 0329   고속터미널   3   
 0330   교대   3   
 0331   남부터미널   3   
 0332   양재   3   
 0333   매봉   3   
 0334   도곡   3   
 0335   대치   3   
 0336   학여울   3   
 0337   대청   3   
 0338   일원   3   
 0339   수서   3   
 0340   가락시장   3   
 0341   경찰병원   3   
 0342   오금   3   
 0409   당고개   4   
 0410   상계   4   
 0411   노원   4   
 0412   창동   4   
 0413   쌍문   4   
 0414   수유   4   
 0415   미아   4   
 0416   미아사거리   4   
 0417   길음   4   
 0418   성신여대입구   4   
 0419   한성대입구   4   
 0420   혜화   4   
 0421   동대문   4   
 0422   동대문역사문화공원   4   
 0423   충무로   4   
 0424   명동   4   
 0425   회현   4   
 0426   서울역   4   
 0427   숙대입구   4   
 0428   삼각지   4   
 0429   신용산   4   
 0430   이촌   4   
 0431   동작   4   
 0432   총신대입구   4   
 0433   사당   4   
 0434   남태령   4   
 1002   남영   1   
 1003   용산   1   
 1004   노량진   1   
 1005   대방   1   
 1006   영등포   1   
 1007   신도림   1   
 1008   이촌   경의선   
 1009   서빙고   경의선   
 100C   용산   경의선   
 1010   한남   경의선   
 1011   옥수   경의선   
 1012   응봉   경의선   
 1013   왕십리   경의선   
 1014   청량리   경의선   
 1015   회기   1   
 1016   외대앞   1   
 1017   신이문   1   
 1018   석계   1   
 1019   광운대   1   
 101C   회기   경의선   
 1020   월계   1   
 1021   녹천   1   
 1022   창동   1   
 1023   선릉   수인분당선   
 1024   한티   수인분당선   
 1025   도곡   수인분당선   
 1026   구룡   수인분당선   
 1027   개포동   수인분당선   
 1028   대모산입구   수인분당선   
 102C   왕십리   수인분당선   
 1030   수서   수인분당선   
 1031   복정   수인분당선   
 1032   신길   1   
 1201   중랑   경의선   
 1202   상봉   경의선   
 1203   망우   경의선   
 1204   양원   경의선   
 1205   구리   경의선   
 1206   도농   경의선   
 1207   양정   경의선   
 1208   덕소   경의선   
 1209   도심   경의선   
 1210   팔당   경의선   
 1211   운길산   경의선   
 1212   양수   경의선   
 1213   신원   경의선   
 1214   국수   경의선   
 1215   아신   경의선   
 1216   오빈   경의선   
 1217   양평   경의선   
 1218   원덕   경의선   
 1219   용문   경의선   
 1220   지평   경의선   
 1251   서울역   경의선   
 1252   신촌   경의선   
 1261   효창공원앞   경의선   
 1262   공덕   경의선   
 1263   서강대   경의선   
 1264   홍대입구   경의선   
 1265   가좌   경의선   
 1266   디지털미디어시티   경의선   
 1267   수색   경의선   
 1268   화전   경의선   
 1269   강매   경의선   
 1270   행신   경의선   
 1271   능곡   경의선   
 1272   곡산   경의선   
 1273   백마   경의선   
 1274   풍산   경의선   
 1275   일산   경의선   
 1276   탄현   경의선   
 1277   야당   경의선   
 1278   운정   경의선   
 1279   금릉   경의선   
 1280   금촌   경의선   
 1282   월롱   경의선   
 1283   파주   경의선   
 1284   문산   경의선   
 1285   임진강   경의선   
 1305   광운대   경춘선   
 1306   청량리   경춘선   
 1307   회기   경춘선   
 1308   중랑   경춘선   
 1309   상봉   경춘선   
 1310   망우   경춘선   
 1311   신내   경춘선   
 1312   갈매   경춘선   
 1313   별내   경춘선   
 1314   퇴계원   경춘선   
 1315   사릉   경춘선   
 1316   금곡   경춘선   
 1317   평내호평   경춘선   
 1318   천마산   경춘선   
 1319   마석   경춘선   
 1320   대성리   경춘선   
 1321   청평   경춘선   
 1322   상천   경춘선   
 1323   가평   경춘선   
 1324   굴봉산   경춘선   
 1325   백양리   경춘선   
 1326   강촌   경춘선   
 1327   김유정   경춘선   
 1328   남춘천   경춘선   
 1329   춘천   경춘선   
 1401   봉명   1   
 1402   쌍용   1   
 1403   아산   1   
 1405   배방   1   
 1407   온양온천   1   
 1408   신창   1   
 1450   선바위   4   
 1451   경마공원   4   
 1452   대공원   4   
 1453   과천   4   
 1454   정부과천청사   4   
 1455   인덕원   4   
 1456   평촌   4   
 1457   범계   4   
 1458   금정   4   
 1501   판교   경강선   
 1502   이매   경강선   
 1503   삼동   경강선   
 1504   경기광주   경강선   
 1505   초월   경강선   
 1506   곤지암   경강선   
 1507   신둔도예촌   경강선   
 1508   이천   경강선   
 1509   부발   경강선   
 1510   세종대왕릉   경강선   
 1511   여주   경강선   
 1701   구로   1   
 1702   가산디지털단지   1   
 1703   금천구청   1   
 1704   석수   1   
 1705   관악   1   
 1706   안양   1   
 1707   명학   1   
 1708   금정   1   
 1709   군포   1   
 1710   의왕   1   
 1711   성균관대   1   
 1712   화서   1   
 1713   수원   1   
 1714   독산   1   
 1715   세류   1   
 1716   병점   1   
 1717   세마   1   
 1718   오산대   1   
 1719   오산   1   
 1720   진위   1   
 1721   송탄   1   
 1722   서정리   1   
 1723   평택지제   1   
 1724   평택   1   
 1725   성환   1   
 1726   직산   1   
 1727   두정   1   
 1728   천안   1   
 1729   당정   1   
 1749   서동탄   1   
 1750   광명   1   
 1751   산본   4   
 1752   대야미   4   
 1753   반월   4   
 1754   상록수   4   
 1755   한대앞   4   
 1756   중앙   4   
 1757   고잔   4   
 1758   초지   4   
 1759   안산   4   
 1760   신길온천   4   
 1761   정왕   4   
 1762   오이도   4   
 1763   수리산   4   
 1800   오이도   수인분당선   
 1801   개봉   1   
 1802   오류동   1   
 1803   역곡   1   
 1804   부천   1   
 1805   송내   1   
 1806   부평   1   
 1807   백운   1   
 1808   동암   1   
 1809   주안   1   
 1810   제물포   1   
 1811   동인천   1   
 1812   인천   1   
 1813   구일   1   
 1814   소사   1   
 1815   부개   1   
 1816   간석   1   
 1817   도원   1   
 1821   온수   1   
 1822   중동   1   
 1823   도화   1   
 1830   한대앞   수인분당선   
 1831   중앙   수인분당선   
 1832   고잔   수인분당선   
 1833   초지   수인분당선   
 1834   안산   수인분당선   
 1835   신길온천   수인분당선   
 1836   정왕   수인분당선   
 1845   청량리   수인분당선   
 1846   수원   수인분당선   
 1847   서울숲   수인분당선   
 1848   압구정로데오   수인분당선   
 1849   강남구청   수인분당선   
 1850   선정릉   수인분당선   
 1851   가천대   수인분당선   
 1852   태평   수인분당선   
 1853   모란   수인분당선   
 1854   야탑   수인분당선   
 1855   서현   수인분당선   
 1856   수내   수인분당선   
 1857   정자   수인분당선   
 1858   미금   수인분당선   
 1859   오리   수인분당선   
 1860   이매   수인분당선   
 1861   보정   수인분당선   
 1862   죽전   수인분당선   
 1863   구성   수인분당선   
 1864   신갈   수인분당선   
 1865   기흥   수인분당선   
 1866   상갈   수인분당선   
 1867   청명   수인분당선   
 1868   영통   수인분당선   
 1869   망포   수인분당선   
 1870   매탄권선   수인분당선   
 1871   수원시청   수인분당선   
 1872   매교   수인분당선   
 1873   고색   수인분당선   
 1874   오목천   수인분당선   
 1875   어천   수인분당선   
 1876   야목   수인분당선   
 1877   사리   수인분당선   
 1878   달월   수인분당선   
 1879   월곶   수인분당선   
 1880   소래포구   수인분당선   
 1881   인천논현   수인분당선   
 1882   호구포   수인분당선   
 1883   남동인더스파크   수인분당선   
 1884   원인재   수인분당선   
 1885   연수   수인분당선   
 1886   송도   수인분당선   
 1888   인하대   수인분당선   
 1889   숭의   수인분당선   
 1890   신포   수인분당선   
 1891   인천   수인분당선   
 1901   방학   1   
 1902   도봉   1   
 1903   도봉산   1   
 1904   망월사   1   
 1905   회룡   1   
 1906   의정부   1   
 1907   가능   1   
 1908   녹양   1   
 1909   양주   1   
 1910   덕계   1   
 1911   덕정   1   
 1912   지행   1   
 1913   동두천중앙   1   
 1914   보산   1   
 1915   동두천   1   
 1916   소요산   1   
 1948   원흥   3   
 1950   삼송   3   
 1951   원당   3   
 1952   화정   3   
 1953   대곡   3   
 1954   백석   3   
 1955   마두   3   
 1956   정발산   3   
 1957   주엽   3   
 1958   대화   3   
 2511   방화   5   
 2512   개화산   5   
 2513   김포공항   5   
 2514   송정   5   
 2515   마곡   5   
 2516   발산   5   
 2517   우장산   5   
 2518   화곡   5   
 2519   까치산   5   
 2520   신정   5   
 2521   목동   5   
 2522   오목교   5   
 2523   양평   5   
 2524   영등포구청   5   
 2525   영등포시장   5   
 2526   신길   5   
 2527   여의도   5   
 2528   여의나루   5   
 2529   마포   5   
 2530   공덕   5   
 2531   애오개   5   
 2532   충정로   5   
 2533   서대문   5   
 2534   광화문   5   
 2535   종로3가   5   
 2536   을지로4가   5   
 2537   동대문역사문화공원   5   
 2538   청구   5   
 2539   신금호   5   
 2540   행당   5   
 2541   왕십리   5   
 2542   마장   5   
 2543   답십리   5   
 2544   장한평   5   
 2545   군자   5   
 2546   아차산   5   
 2547   광나루   5   
 2548   천호   5   
 2549   강동   5   
 2550   길동   5   
 2551   굽은다리   5   
 2552   명일   5   
 2553   고덕   5   
 2554   상일동   5   
 2555   둔촌동   5   
 2556   올림픽공원   5   
 2557   방이   5   
 2558   오금   5   
 2559   개롱   5   
 2560   거여   5   
 2561   마천   5   
 2562   강일   5   
 2563   미사   5   
 2564   하남풍산   5   
 2565   하남시청   5   
 2566   하남검단산   5   
 2611   응암   6   
 2612   역촌   6   
 2613   불광   6   
 2614   독바위   6   
 2615   연신내   6   
 2616   구산   6   
 2617   새절   6   
 2618   증산   6   
 2619   디지털미디어시티   6   
 2620   월드컵경기장   6   
 2621   마포구청   6   
 2622   망원   6   
 2623   합정   6   
 2624   상수   6   
 2625   광흥창   6   
 2626   대흥   6   
 2627   공덕   6   
 2628   효창공원앞   6   
 2629   삼각지   6   
 2630   녹사평   6   
 2631   이태원   6   
 2632   한강진   6   
 2633   버티고개   6   
 2634   약수   6   
 2635   청구   6   
 2636   신당   6   
 2637   동묘앞   6   
 2638   창신   6   
 2639   보문   6   
 2640   안암   6   
 2641   고려대   6   
 2642   월곡   6   
 2643   상월곡   6   
 2644   돌곶이   6   
 2645   석계   6   
 2646   태릉입구   6   
 2647   화랑대   6   
 2648   봉화산   6   
 2649   신내   6   
 2711   장암   7   
 2712   도봉산   7   
 2713   수락산   7   
 2714   마들   7   
 2715   노원   7   
 2716   중계   7   
 2717   하계   7   
 2718   공릉   7   
 2719   태릉입구   7   
 2720   먹골   7   
 2721   중화   7   
 2722   상봉   7   
 2723   면목   7   
 2724   사가정   7   
 2725   용마산   7   
 2726   중곡   7   
 2727   군자   7   
 2728   어린이대공원   7   
 2729   건대입구   7   
 2730   뚝섬유원지   7   
 2731   청담   7   
 2732   강남구청   7   
 2733   학동   7   
 2734   논현   7   
 2735   반포   7   
 2736   고속터미널   7   
 2737   내방   7   
 2738   이수   7   
 2739   남성   7   
 2740   숭실대입구   7   
 2741   상도   7   
 2742   장승배기   7   
 2743   신대방삼거리   7   
 2744   보라매   7   
 2745   신풍   7   
 2746   대림   7   
 2747   남구로   7   
 2748   가산디지털단지   7   
 2749   철산   7   
 2750   광명사거리   7   
 2751   천왕   7   
 2752   온수   7   
 2753   까치울   7   
 2754   부천종합운동장   7   
 2755   춘의   7   
 2756   신중동   7   
 2757   부천시청   7   
 2758   상동   7   
 2759   삼산체육관   7   
 2760   굴포천   7   
 2761   부평구청   7   
 2811   암사   8   
 2812   천호   8   
 2813   강동구청   8   
 2814   몽촌토성   8   
 2815   잠실   8   
 2816   석촌   8   
 2817   송파   8   
 2818   가락시장   8   
 2819   문정   8   
 2820   장지   8   
 2821   복정   8   
 2822   산성   8   
 2823   남한산성입구   8   
 2824   단대오거리   8   
 2825   신흥   8   
 2826   수진   8   
 2827   모란   8   
 3110   계양   인천1   
 3111   귤현   인천1   
 3112   박촌   인천1   
 3113   임학   인천1   
 3114   계산   인천1   
 3115   경인교대입구   인천1   
 3116   작전   인천1   
 3117   갈산   인천1   
 3118   부평구청   인천1   
 3119   부평시장   인천1   
 3120   부평   인천1   
 3121   동수   인천1   
 3122   부평삼거리   인천1   
 3123   간석오거리   인천1   
 3124   인천시청   인천1   
 3125   예술회관   인천1   
 3126   인천터미널   인천1   
 3127   문학경기장   인천1   
 3128   선학   인천1   
 3129   신연수   인천1   
 3130   원인재   인천1   
 3131   동춘   인천1   
 3132   동막   인천1   
 3133   캠퍼스타운   인천1   
 3134   테크노파크   인천1   
 3135   지식정보단지   인천1   
 3136   인천대입구   인천1   
 3137   센트럴파크   인천1   
 3138   국제업무지구   인천1   
 3139   송도달빛축제공원   인천1   
 3201   검단오류   인천2   
 3202   왕길   인천2   
 3203   검단사거리   인천2   
 3204   마전   인천2   
 3205   완정   인천2   
 3206   독정   인천2   
 3207   검암   인천2   
 3208   검바위   인천2   
 3209   아시아드경기장   인천2   
 3210   서구청   인천2   
 3211   가정   인천2   
 3212   가정중앙시장   인천2   
 3213   석남   인천2   
 3214   서부여성회관   인천2   
 3215   인천가좌   인천2   
 3216   가재울   인천2   
 3217   주안국가산단   인천2   
 3218   주안   인천2   
 3219   시민공원   인천2   
 3220   석바위시장   인천2   
 3221   인천시청   인천2   
 3222   석천사거리   인천2   
 3223   모래내시장   인천2   
 3224   만수   인천2   
 3225   남동구청   인천2   
 3226   인천대공원   인천2   
 3227   운연   인천2   
 3762   산곡   7   
 3763   석남   7   
 4101   개화   9   
 4102   김포공항   9   
 4103   공항시장   9   
 4104   신방화   9   
 4105   마곡나루   9   
 4106   양천향교   9   
 4107   가양   9   
 4108   증미   9   
 4109   등촌   9   
 4110   염창   9   
 4111   신목동   9   
 4112   선유도   9   
 4113   당산   9   
 4114   국회의사당   9   
 4115   여의도   9   
 4116   샛강   9   
 4117   노량진   9   
 4118   노들   9   
 4119   흑석   9   
 4120   동작   9   
 4121   구반포   9   
 4122   신반포   9   
 4123   고속터미널   9   
 4124   사평   9   
 4125   신논현   9   
 4126   언주   9   
 4127   선정릉   9   
 4128   삼성중앙   9   
 4129   봉은사   9   
 4130   종합운동장   9   
 4131   삼전   9   
 4132   석촌고분   9   
 4133   석촌   9   
 4134   송파나루   9   
 4135   한성백제   9   
 4136   올림픽공원   9   
 4137   둔촌오륜   9   
 4138   중앙보훈병원   9   
 4201   서울역   공항철도   
 4202   공덕   공항철도   
 4203   홍대입구   공항철도   
 4204   디지털미디어시티   공항철도   
 4206   마곡나루   공항철도   
 4207   김포공항   공항철도   
 4208   계양   공항철도   
 4209   검암   공항철도   
 4210   청라국제도시   공항철도   
 4211   운서   공항철도   
 4212   공항화물청사   공항철도   
 4213   인천공항1터미널   공항철도   
 4215   인천공항2터미널   공항철도   
 4217   영종   공항철도   
 4307   강남   신분당선   
 4308   양재   신분당선   
 4309   양재시민의숲   신분당선   
 4310   청계산입구   신분당선   
 4311   판교   신분당선   
 4312   정자   신분당선   
 4313   미금   신분당선   
 4314   동천   신분당선   
 4315   수지구청   신분당선   
 4316   성복   신분당선   
 4317   상현   신분당선   
 4318   광교중앙   신분당선   
 4319   광교   신분당선   
 4501   기흥   용인경전철   
 4502   강남대   용인경전철   
 4503   지석   용인경전철   
 4504   어정   용인경전철   
 4505   동백   용인경전철   
 4506   초당   용인경전철   
 4508   삼가   용인경전철   
 4509   시청.용인대   용인경전철   
 4510   명지대   용인경전철   
 4511   김량장   용인경전철   
 4512   운동장.송담대   용인경전철   
 4513   고진   용인경전철   
 4514   보평   용인경전철   
 4515   둔전   용인경전철   
 4517   전대.에버랜드   용인경전철   
 4601   발곡   의정부경전철   
 4602   회룡   의정부경전철   
 4603   범골   의정부경전철   
 4604   경전철의정부   의정부경전철   
 4605   의정부시청   의정부경전철   
 4606   흥선   의정부경전철   
 4607   의정부중앙   의정부경전철   
 4608   동오   의정부경전철   
 4609   새말   의정부경전철   
 4610   경기도청북부청사   의정부경전철   
 4611   효자   의정부경전철   
 4612   곤제   의정부경전철   
 4613   어룡   의정부경전철   
 4614   송산   의정부경전철   
 4615   탑석   의정부경전철   
 4701   북한산우이   우이신설경전철   
 4702   솔밭공원   우이신설경전철   
 4703   4·19민주묘지   우이신설경전철   
 4704   가오리   우이신설경전철   
 4705   화계   우이신설경전철   
 4706   삼양   우이신설경전철   
 4707   삼양사거리   우이신설경전철   
 4708   솔샘   우이신설경전철   
 4709   북한산보국문   우이신설경전철   
 4710   정릉   우이신설경전철   
 4711   성신여대입구   우이신설경전철   
 4712   보문   우이신설경전철   
 4713   신설동   우이신설경전철   
 4804   소사   서해선   
 4805   소새울   서해선   
 4806   시흥대야   서해선   
 4807   신천   서해선   
 4808   신현   서해선   
 4809   시흥시청   서해선   
 4810   시흥능곡   서해선   
 4811   달미   서해선   
 4812   선부   서해선   
 4813   초지   서해선   
 4814   시우   서해선   
 4815   원시   서해선   
 4920   양촌   김포도시철도   
 4921   구래   김포도시철도   
 4922   마산   김포도시철도   
 4923   장기   김포도시철도   
 4924   운양   김포도시철도   
 4925   걸포북변   김포도시철도   
 4926   사우   김포도시철도   
 4927   풍무   김포도시철도   
 4928   고촌   김포도시철도   
 4929   김포공항   김포도시철도   
''';

String? st_num = "";
String? ar_num = "";
String jsontext = "";

const apiKey =
    'fSYsW9vfF6O3YjnQSCOx2EKU3HYtjUM9E8a1%2FYcAjfFnVP9RaCFbllgzXd%2BX%2FwiX6yefRR8qE%2Fi0B3ers9Y4jw%3D%3D';

class SubwayDataSource {
  Future<List<RouteSubwayModel>> getSubway(
      SubwayInfo startInfo, SubwayInfo arrivalInfo) async {
    try {
      final response = await http.get(
          Uri.parse(
              'http://apis.data.go.kr/B553766/smt-path/path?serviceKey=$apiKey&numOfRows=10&pageNo=1&dept_station_code=${st_num}&dest_station_code=${ar_num}&week=DAY&search_type=FASTEST&dept_time=120001'),
          // startInfo.number  , arrivalInfo.number
          headers: {"Accept": "application/json"}).then(((value) {
        var content = jsonDecode(utf8.decode(value.bodyBytes));
        print('1-----------------------1');
        print(content['data']['route']);
        print('1-----------------------1');
      }));

      print('2-----------------------------2');
      var a = jsonDecode(utf8.decode(response.body));
      print(a['data']['route']);
      print('2-----------------------------2');

      // print(response.body);

      Iterable iterable =
          jsonDecode(response.body)['data'][0]['route']; //['data'][0]['route']
      return iterable.map((e) => RouteSubwayModel.fromJson(e)).toList();
    } catch (e) {
      throw (Exception('Failed to load'));
    }
  }
}

class StationCode extends StatefulWidget {
  const StationCode({super.key});

  @override
  State<StationCode> createState() => _StationCodeState();
}

class _StationCodeState extends State<StationCode> {
  final start1Contorller = TextEditingController();
  final arrival1Contorller = TextEditingController();

  late TextEditingController startController;
  late TextEditingController arrivalController;
  late SubwayDataSource subwayDataSource;
  List<RouteSubwayModel> routeSubwayModels = [];
  bool? isLoading;

  @override
  void dispose() {
    start1Contorller.dispose();
    arrival1Contorller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startController = TextEditingController(text: '왕십리');
    arrivalController = TextEditingController(text: '강남');
    subwayDataSource = SubwayDataSource();
  }

  var apiKey =
      "4fskVJh2CpFFANbJ0JCuuX0%2F90cRzEKtJAdFvkgjcZyq%2F6bd%2BWlBvJD8IZuwtFaTGK7ku4VvkcyJx05A9rK7cg%3D%3D";

  @override
  Widget build(BuildContext context) {
    // final String url = "apis.data.go.kr";
    // final String path = "/B553766/smt-path/path";

    // http.get(
    //     Uri.parse(
    //         "https://apis.data.go.kr/B553766/smt-path/path?serviceKey=$apiKey&pageNo=1&numOfRows=10&dept_station_code=${st_num}&dest_station_code=${ar_num}&week=DAY&search_type=FASTEST&dept_time=120001"),
    //     headers: {"Accept": "application/json"}).then(((value) {
    //   var content = jsonDecode(utf8.decode(value.bodyBytes));
    //   print(content['data']);
    //   print("기본 uri 출력");
    // }));

    return Scaffold(
        appBar: AppBar(
          title: const Text('출발 도착 역 입력'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 2, //비율차지
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.subway,
                          size: 50,
                        ),
                        const Text(
                          '지하철 노선도 검색',
                          style: TextStyle(fontSize: 30),
                        ),

                        // 출발역 코드 받는 Textfield
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: TextField(
                            controller: start1Contorller,
                            onChanged: (text) {
                              st_num = text;
                            },
                            decoration: InputDecoration(
                                labelText: '출발역을 입력해 주세요.',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                )),
                            maxLength: 10,
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),

                        // 도착역 코드받는 Textfield
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: TextField(
                            controller: arrival1Contorller,
                            onChanged: (text) {
                              ar_num = text;
                            },
                            decoration: InputDecoration(
                                labelText: '도착역을 입력해 주세요.',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                )),
                            maxLength: 10,
                          ),
                        ),

                        TextButton(
                            onPressed: () {
                              setState(
                                () {
                                  isLoading = true;
                                },
                              );
                              try {
                                List<SubwayInfo> values = SubwayInfo.values;
                                SubwayInfo startInfo = values.firstWhere(
                                    (e) => e.name == startController.text);
                                SubwayInfo arrivalInfo = values.firstWhere(
                                    (e) => e.name == arrivalController.text);
                                subwayDataSource
                                    .getSubway(startInfo, arrivalInfo)
                                    .then((value) {
                                  setState(() {
                                    routeSubwayModels = value;
                                  });
                                });

                                setState(() {
                                  isLoading = false;
                                });
                              } catch (e) {
                                setState(() {
                                  isLoading = null;
                                });
                              }
                            },
                            child: Text('검색하기')),
                        const SizedBox(height: 30.0),
                        if (isLoading != null) buildInfo(),

                        // 서치 페이지로 넘어가는 버튼
                        TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => Homepage()),
                              );
                            },
                            icon: const Icon(
                              Icons.add_box,
                              size: 40,
                              color: Colors.black,
                            ),

                            // ignore: prefer_const_constructors
                            label: Text('메인 홈페이지',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black)),
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                                // ignore: deprecated_member_use
                                primary: Colors.white,
                                minimumSize: Size(200, 50),
                                // ignore: deprecated_member_use
                                onSurface: Colors.white),
                          ),
                      ],
                    )),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                      child: ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: SelectableText(
                          text,
                          showCursor: true,
                          scrollPhysics: ClampingScrollPhysics(),
                          ),

                        // child: Center(
                        //   child: Text()),
                      );
                    },
                  )),
                )
              ],
            ),
          ),
        ));
  }

  Widget buildInfo() {
    if (routeSubwayModels.isEmpty) {
      return const SizedBox();
    }

    if (isLoading == true) {
      return const Center(child: CircularProgressIndicator());
    }

    return Expanded(
      child: ListView.separated(
        itemCount: routeSubwayModels.length,
        itemBuilder: (context, index) {
          return SubwayInfoChip(
            model: routeSubwayModels[index],
          );
        },
        separatorBuilder: (_, __) {
          return const Divider(height: 25);
        },
      ),
    );
  }
}

class SubwayInfoChip extends StatelessWidget {
  const SubwayInfoChip({Key? key, required this.model}) : super(key: key);
  final RouteSubwayModel model;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('${model.lineNum}호선'),
      const SizedBox(height: 10.0),
      Text('${model.stationNm}역'),
    ]);
  }
}
