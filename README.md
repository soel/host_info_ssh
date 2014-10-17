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

    $ bundle exec ruby bin/host_ssh -n <host_name or ip_address> -u <user_name>

実行すると指定したホストへ接続し lib/host_info_ssh/command_list.txt に記述されたコマンドを実行し、  
host_info_ssh ディレクトリに <hostname or ip_address>.md というファイルが作成され、
取得した内容が markdown 形式で記録されます。  
  
また以下のオプションが使用でき、  
読み込む command_file の指定、ファイル出力の設定、SSHでの鍵/パスワードの使用などの設定が行えます。

```bash
Usage: host_info_ssh [options]
    -v, --version                    show program version
    -n, --nodename NODENAME          host_name or ip_address
    -u, --username USERNAME          user_name
    -c, --commandfile COMMANDLIST    commandlist_filename
    -o, --outputfile OUTPUTFILE      output_filename
    -i SSHIDENTITYFILE,              ssh_identity_file
        --identityfile
    -p, --password PASSWORD          password
```

### 出力例

```markdown
# 172.16.62.126
## hostname  
dep126  
## uname -a  
Linux dep126 2.6.32-431.29.2.el6.x86_64 #1 SMP Tue Sep 9 21:36:05 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux  
## cat /etc/sysconfig/network-scripts/ifcfg-eth0  
DEVICE="eth0"  
BOOTPROTO="static"  
DNS1="172.16.48.12"  
GATEWAY="172.16.62.254"  
HOSTNAME="dep126"  
IPADDR="172.16.62.126"  
IPV6INIT="no"  
MTU="1500"  
NETMASK="255.255.255.0"  
NM_CONTROLLED="yes"  
ONBOOT="yes"  
TYPE="Ethernet"  
## errors
error:cat: /etc/sysconfig/network-scripts/ifcfg-eth1: \u305d\u306e\u3088\u3046\u306a\u30d5\u30a1\u30a4\u30eb\u3084\u30c7\u30a3\u30ec\u30af\u30c8\u30ea\u306f\u3042\u308a\u307e\u305b\u3093
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/host_info_ssh/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
