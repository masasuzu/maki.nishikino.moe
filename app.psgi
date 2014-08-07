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
