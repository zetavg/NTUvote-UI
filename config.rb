##
# Middleman
##

set :source, "source"
set :build_dir, "build"

##
# Bower
##

@bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
ignore @bower_config["directory"].gsub(/source\//, "") + '/*'

###
# Compass
###

# Change Compass configuration
compass_config do |config|
  # Require additional compass plugins.
  config.add_import_path @bower_config["directory"].gsub(/source\//, "") + "/Han/sass"
  config.add_import_path @bower_config["directory"].gsub(/source\//, "") + "/foundation/scss"
  config.add_import_path @bower_config["directory"].gsub(/source\//, "") + "/susy/sass"
  # config.output_style = :compact
end

# Add bower's directory to sprockets asset path
sprockets.append_path File.join "#{root}", @bower_config["directory"]

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets
end

# Deploy-specific configuration
activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end

class FakeName < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
  end

  helpers do
    def fake_name
      %w(馮進義 李佩均 淩詩涵 張永月 謝石禮 許惠萱 周峻康 陳韋勇 陳思順 連佳雯 林艾修 林建謙 劉育華 黃盈君 鬱素良 黃雅馨 林冠宇 陳家源 陳淑輝 杜慧君 陳郁婷 盛怡君 郭富元 葉雅慧 簡旭淳 汪佳財 鄭凱琳 黃念湖 張明屏 衡欣儀 張政儒 張寶丞 林明哲 王耀德 陳韻屏 陳姿穎 李美士 黃明翰 吳昶隆 袁惠茹 陳柏宏 王心怡 陳弘玫 林俊雅 張誠合 邱淑堅 陳肇恆 陳淑瑞 連青菁 蔡秋香 賴孟能 涂兆平 劉盈君 林怡璇 王韻如 林素茂 林則亦 權健舜 莊雅能 翁智堯 楊登均 張致喜 謝宗哲 吳亞意 黃鈺仲 葉建文 謝緯仁 李子翔 吳榮春 林修義 夏彥儒 黎玉華 羅詩婷 鄭英信 吳立燦 杜俊偉 蕭宛康 賴威廷 白翠聿 王彥志 楊曉薇 劉美惠 鄭崇盛 黃士豪 楊鈺婷 李幸聿 詹建宏 黃思能 瞿玄誠 彭俊宏 李俊達 鄭于真 游秀娟 鄭佐一 王雅云 崔星正 謝嘉玲 吳怡修 牛小麟 林明宏 許偉婷 黃卉月 元恩菱 洪志忠 傅萱星 沈易正 張民儀 陳盈妮 溫怡君 阮尚岳 洪孟倫 蔡國函 陳鎮宇 吳威廷 李佩玲 方艾香 吳佩辰 林彥安 李秋恭 蘇穎茹 林雅君 葉耀德 黃尹胤 黃婉竹 黃美玲 陳凱穎 黃聖燦 林心映 封毅樂 劉建弘 黃偉成 游興燦 蕭伶新 謝雅玲 吳淑君 毛明瑜 蘇玟甫 洪嘉虹 沈宇昕 王立偉 楊芳映 張瑋雪 許佳慧 吳芝紋 焦常天 李孝舜 洪建佑 陳美容 陳奕亞 涂敬軍 林哲瑋 蘇家宏 丁艾紋 陳易瑤 陳珮旭 吳萱紋 陳倫如 許邦仲 方育廷 王初娥 林瑋純 林文達 羅益廷 謝雅婷 陳仰季 李怡欣 賴彥如 林剛政 柳雅婷 趙貴昀 黃慧夫 吳文傑 沈邦俊 劉禹能 陳宥喬 張書霖 郭君胤 周苑韻 陳牧冰 王育菁 路鈞婷 林宜智 鄧芸芷 徐如君 吳惠婷 劉燦芷 陳惠珠 楊東琪 何博鈞 李思蓮 陳良亮 郎成添 陳俊翔 趙杰松 賴昀帆 潘峻舜 黃光善 黃彥淑 林怡臻 王康蓁).sample
    end
  end
end

::Middleman::Extensions.register(:fake_name, FakeName)

activate :fake_name
