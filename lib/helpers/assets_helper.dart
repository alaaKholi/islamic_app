class AssetsHelper {
  static const String image_path = "assets/images/";
  //static const String icon_path = "assets/icons/";
  static const String FONT_Avenir = "Avenir";

  static String getAssetPNG(String name) => image_path + name + ".png";

  static String getAssetJPG(String name) => image_path + name + ".jpg";

  static String getImage(String name) => image_path + name;

  static const String ic_tab_quran_svg = "${image_path}ic_tab_quran.svg";

  static const String ic_tab_pray_svg = "${image_path}ic_tab_pray.svg";

  static const String ic_tab_kabba_svg = "${image_path}ic_tab_kabba.svg";

  static const String img_qibla_arrow = "${image_path}qibla_arrow.png";

  static const String img_qibla_dial = "${image_path}qibla_dial.png";
}
