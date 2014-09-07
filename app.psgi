use strict;
use warnings;
use utf8;
use File::Spec;
use File::Basename;
use lib File::Spec->catdir(dirname(__FILE__), 'extlib', 'lib', 'perl5');
use lib File::Spec->catdir(dirname(__FILE__), 'lib');
use Amon2::Lite;
use List::AllUtils qw/shuffle/;

our $VERSION = '0.001';

my @text = shuffle qw/
    ナニソレイミワカンナイ
    ヴェェ
    去年までサンタさんが来てくれない事がなかったんだから!
    感激しちゃうなかきくけこ
    真姫ちゃんすごいなさしすせそ
    真姫ちゃんとびきりたちつてと
    真姫ちゃん人気だたちつてと
    あ、こう見えて彼氏いない暦17年よ!
    お断りします
/;

get '/' => sub {
    my $c = shift;
    @text = shuffle(@text);

    return $c->render('index.tt' => +{ text => $text[0] });
};

# load plugins
__PACKAGE__->load_plugin('Web::CSRFDefender' => {
    post_only => 1,
});

__PACKAGE__->enable_session();

__PACKAGE__->to_app(handle_static => 1);

__DATA__

@@ index.tt
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>真姫ちゃん</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script type="text/javascript" charset="utf-8" src="http://font.textar.tv/webfont.js"></script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="[% uri_for('/static/js/main.js') %]"></script>
  <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css" rel="stylesheet">
  <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="[% uri_for('/static/css/main.css') %]">
</head>
<body>
  <div class="container">
    <header><h1>真姫ちゃん可愛いかきくけこ</h1></header>
    <section class="row">
      [% text %]
    </section>
    <section class="row">
    <div class="entrytext textar-aa">
　　　　　　　　　　　　　　　　　　　　　　　　　　　　 . : : : : : : : : : : : : : : : : . .､<br />
　　　　　　　　　　　　　　 　 　 　 　 　 　 　 ／ : : : : : : : : : : : : : : : : : : : : : : ＼<br />
　　　　　　　　　　　　　　　　　　　　　　　／: : : : : : : : : : : : : : : : : : : : : : : : : : : ＼,_<br />
　　　　　　　　　　　　　　　　　　　　　　.. : : : : :／: : : : : : : : : : : : : : : : :´￣￣: : : : :＼<br />
　　　　　　　　　　　　　 　 　 　 　 　 /: : : : : :/: : : : : : : : : : :／: : : : : : : : : : : : : : : ト:. :.<br />
　　　　　　　　　　　　　　　　　　　　/: : : : : :/.: : : : : : : : :.／: : : : : : : : :´￣: : : : : : l : 小<br />
　　　　　　　　　　　　　　　　　　　　: : : : : : ′: : : : : : :／: : : : : : : : : : : : : : : : : : : ﾘ: : : : .<br />
　　　　　　　　　　　　　　　　　　　.′ : : : : i: : : : : : : /:.:／: : : : : : : : : : : : : : : :ノ:./: : : : : :l<br />
　　　　　　　　　　　　　　　　　 　 |.: : : : :. :.|: : : : : : /／: : : : : : : : : : : : : : : ／7:.∧: : : : : :|<br />
　　　　　　　　　　　　　　　　　 　 : : : : : : : |: : : : : /^ー─=-----､‐ 　 '"　／／　l: : : : : :|<br />
　　　　　　　　　　　　　　　 　 　 /: : : : : : :.l: : : : : |　灯¨¨i外､＼　丶 　 ／ '"　 　.: : : : : :|<br />
　　　　　　　　　　　　　　　 　 ／: :∧.:.: :.:从.: : :. :.| 　 トじ/ﾘ　＼　　 　 　 ＿＿ 　|.: : : : :.|<br />
　　　　　　　　　 　 　 　 　 ／: : :j : ∧: : : : :'，: : : 　　乂.ン　　　　　 　 　 __　　｀　.: : :.:ﾘ:.|<br />
　　　　　　　　　　　　　　 /: : ｨ : |:.: :.∧: : : : :＼: : :, .､:.､:.　　 　 　 　 　 ﾔ⌒芥、/: : : :/j/<br />
　　　　　　 　 　 　 　 　 / : / |: :.|: : : : : :、: : : : :＼:.，　　　　 　 　 　 　 ﾄじｸ_ノ^: : :./´./<br />
　　　　　　　　　　　　　/ : /　j: : |: : : : : : ＼: : : : : :＼､　　　　　　　　　 ｀¨´ ／ : : / ,ノ<br />
　　　　　　　　　　　 　 {:/{j　 i／i|.: .: : : : :.: :.＼: : : :.小⌒　　　 　 ´　　 :.:.:./: : : ／<br />
　　　　　　　　　　　　　|{　　/／∧: : : : : : : : : :丶: : ハト,　 r　 ｧ　　　　　/彡イ: ,<br />
　　　　　　　　　　　　　＿ ,.=‐＾＼ﾍ: : : : : : : : : : :': : :; j|/ ヘ　　　　　　イ: : : : : : :,<br />
　　　　　　　　　　/fく⌒i i i i i i i i ＼ ､: ＼: : : : : :く⌒/ / /　＼-=ﾆ　＿: : : : : |: : .,<br />
　　　　　　 　 　 ∧i i ＼ i i i i i i i i i ＼丶 ＼ : : : : ∨./ /　/_/　トt-t ⌒Y.: : :.| : :.ﾊ<br />
　　　　 　 　 　 ∧i i i i i ＼ i i i i i i i i i ＼).:.:.＼:.:. :.Ⅳ /〃⌒＼,_/__j_/　ﾉ.:. :.:.|: : :} }<br />
　　 　 　 　 　 ∧ i i i i i i i 丶i.i i i i i i i i. i.＼⌒丶: : :}/ i{{　　　ノK"⌒Y//: :/ j: :./<br />
　　　　　　 　 .′ i i i i i i i i i ’.i i i i i i i i i i i.＼/ ∧:.|　 ト-ｔ彡jハ､,__ノ}/:.ン　':.:/　　　　　　　　　　　　 　 　 r､<br />
　　　　　　　　|i i i ☆ i i i i i i i’ i i i i i i i i i i i i ＼ _):|　 |　i| i〃　|⌒}l人´　／ﾝ　　　　　　　　　　　 　 r j＼ |　,<br />
　　　　　　　　|i i i i i i i i i☆ i i.| i/i i i i i i i i i iく⌒＼j _ノ /　|ii 　 ! 〃⌒}　⌒　　　　　　　　　　　 ,.∠⌒､＼ヽ j<br />
　　　　　　　　|i i i i i i i i i i i i i.|/i/i i i i i i i i i i ',i Y⌒Yi｀＞-L|＿|イi i i∧　　　　　　　　　　ﾆ=‐"^ーｧ　)　/ У<br />
　　　　　　　　|i i i i i i i i i i i i i.|i/i i i i i i i i i i i i’人__ﾉi ／^⌒^ヽjヽi i|i ‐┐　　　　　　rv'"⌒ー──’ / ,/イ<br />
　　　　　　　　|i i i i i i i i i i i i i.|i i i i i i i i i i i i i i’i i i i i{　　　　　}⌒Y∧,.」　　 ／⌒//＼　　　＿,.　---'<br />
　　　　　　　　|i i i i i i i i i i i i i.|i i i i i i i i i i i i i i |i i i i人　　　　/　 人i∧ﾍ　　{　　 ＼　　　ｰ〔<br />
　　　　　　　　|i i i i i i i i i i i i i.′ii i i i i i i i i i i .i.|i i i i i i ー―'^ー' i i i ∧_}　 ∧　　＼ ー‐/⌒＼<br />
　　　　　　　　|i i i i i i i i i i i i./ii i i i i i i i i i i i i .i.|i i i i i i i i i i i ii iii i i i|i i}i 　/ i i＼　　＼,/ii＼ 　 Y<br />
　　　　　　　 ,. i i i i i i i i i i ii.′i i i i i i i i i i i i i i |i iY⌒Yi.i i i i i i i i i i.i|iﾘi.i∨i i i i i ＼　　｀ー‐'　　}<br />
　 　 　 　 　 ,.i i i i i i i i i i i./.i. i i i i i i i i i i i i i i.ii|i 人_,ノi i i i i i i ir‐､i ji'i ii/i i i i i i i i i)　　　　　　ﾉ<br />
　　　　　　　l.i i i i i i i i i i i,′ i i i i i i i i i i i i i i i |i i i i i i i i i i i i 人_ﾉi / /i i i i i i i i i/　 厂ﾆァｰ'<br />
　　　　　　　l.i i i i i i i i i i i{　| i i i i i i i i i i i i i i i |i i i i i i i i i i i i i i i i i|i i i i i i i i i i./　 / (,／<br />
　　　　　　　l.i i i i i i i i i i i ) | i i i i i i i i i i i i i i i |i i i i i i i i i i i i i i i i i| i i i i i i i ／　 ｲi ノ<br />
　　　　　　　l.i i i i i i i i i i iく_,}i i i i i i i／i / i /i i i|i i i i i i i i i i i i i i i i i| i i i i i i (__ ／i／<br />
　　　　　　　l.i i i i i i i i i i i i iji /i i i／i i / i /.i i i.i|i i i i i i i i i i☆i i i i i |i i i i i i i i i i i/<br />
　　 　 　 　 {i i i i i i i i i i i i i／☆〃i i i/ i /☆.i i.i|i Y⌒Yi i i i i i ／i i i i，ii. i i i i i i.i./<br />
　　 　 　 　 |i i i i i i i i i i i i ji i i i i i i.i/ i / i i i i i | 人__人i i i.i／i i i i i i ',i. i i i i i i.i/<br />
.　 　 　 　 八i i i i i i i i i i i/i i i i i☆i/ i / i i i i i i |i ☆i i i i ☆i i i i Y⌒Yi',i.i i i i i.i/<br />
　　　 　 　 　 ＞　i i i i i 〃 ☆i i i i ー‐'i i☆i i i i i| i i i i i i i i i i ☆人,..人i',i i i i i/<br />
　　　　　　　　　　￣⌒７i i i i i i i i i i i ☆i i☆i i ☆i i i i ☆i i ☆i i i i i i i i iト--彡<br />
<br />
    </div>
    </section>

    <footer></footer>
  </div>
</body>
<!--
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
真姫ちゃん
-->
</html>

@@ /static/js/main.js

@@ /static/css/main.css
footer {
    text-align: right;
}
