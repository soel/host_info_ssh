# Host_Info_Ssh

## これは何?
host へ ssh で接続し、情報取得コマンドを実行して出力します。

## 特徴
- ruby で書かれています。
- 追加のソフトウェアを使うことなく、情報取得が可能です。

## インストール
あらかじめ ruby のインストールが必要です

    $ gem install bundler
    $ git clone 
    $ cd host_info_ssh
    $ bundle install

## 使い方

    $ bundle exec ruby bin/host_ssh -h <hostname or ip address> -u <username> -f <output_filename>

## Contributing

1. Fork it ( https://github.com/[my-github-username]/host_info_ssh/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
