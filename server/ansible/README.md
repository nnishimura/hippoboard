# AWS Wordpress server

URL：https://www.hippoboard.work/

## Getting Started
### 1. VPC(Virtual Private Cloud)の設定
* AWS console > VPC > Create VPCから新しいVPCを作る。
  * CIDR: `10.0.0.0/16` (Private IP), tenancy: `default`を選択。
VPCの設定↓
![vpc](https://user-images.githubusercontent.com/6326478/81143387-b4e0ce00-8fac-11ea-85f3-54559e4dc85b.png)

* Subnetを追加。さっき作ったVPCに紐付ける。
  * CIDR: `10.0.0.0/24`, AZ: `app-northeast-1a`に設定。

![subnet](https://user-images.githubusercontent.com/6326478/81143391-b90ceb80-8fac-11ea-9191-91412b01be1d.png)

* Internet gatewayを追加。さっき作ったVPCに紐付ける。
* Route Tableのルールを追加してインターネットから繋げるようにする。Destination: `0.0.0.0/0` (All IP address in this network) Target: さっき作ったinternet gatewayに紐付け
![rt](https://user-images.githubusercontent.com/6326478/81143393-b9a58200-8fac-11ea-9cd6-3a15d05c6c8e.png)

## 2. EC2の設定
* EC2 > Launch instanceからinstanceを新しく起動する。
  * OS: Amazon Linux
  * EC2 > Actions > Attach network interfaceからさっき作ったVPC/subnetと紐付ける
  ![ec2](https://user-images.githubusercontent.com/6326478/81143399-bc07dc00-8fac-11ea-8ecc-5721cf1360ac.png)

  * port80, 443, 22向けのsecurity groupを作る
  ![secg](https://user-images.githubusercontent.com/6326478/81143404-bd390900-8fac-11ea-8862-6eb776612d73.png)

## 3. EIPの設定
VPC > Elastic IPs > Allocate New AddressからEIPを追加する。これをさっき作ったEC2 instanceと紐づけて、サーバーのpublic IP(今回は`18.181.106.16`)を設定する。
![eip](https://user-images.githubusercontent.com/6326478/81143397-bad6af00-8fac-11ea-8c9f-17a03294ff6d.png)

この時点でEC2上で`systemctl nginx start`すれば、http://18.181.106.16 でwelcome pageが見えるはず。

### 4. DNS設定
* お名前.comでドメインを取る。今回は`nnishimura.work`で進める
* Route53 > Create Hosted Zoneでドメインを追加。
* NS名をコピってお名前.comでネームサーバーとして登録。反映されるまでちょっと待つ。。。
* A recordに先ほどのEIPを設定
![53](https://user-images.githubusercontent.com/6326478/81143402-bca07280-8fac-11ea-919d-a1605a278cf9.png)

* この時点で http://www.hippoboard.work にwelcome pageが見えるはず。残りのSSL化 & WP設定はansibleでやります−

## Provisioning
### 準備
* `hosts`ファイルにEC2の公開鍵パスを追加
* IAMでansibleのSSL証明書取得用(letsencrypt)の新しいユーザーを作る。
  * Route53の権限をつける
  * `aws_access_key`/`aws_secret_key` / `mackerel_apikey` をansible-vaultで登録する

```
ansible-vault create ./group_vars/web/pass.yml
```

mackerelインストール用の公式playbookをansible-galaxyでダウンロードしておく。

```
ansible-galaxy install mackerelio.mackerel-agent
```

### 実行

```
ansible-playbook -i hosts playbook.yml --ask-vault-pass
```
passwordは`ansible-vault`で先ほど設定したやつを使う

これで、https://www.hippoboard.work/ にWordpressが設置できました :tada: :tada:

## Reference
### EC2 + VPC settings
* https://qiita.com/hiroshik1985/items/9de2dd02c9c2f6911f3b
* https://qiita.com/toyokky/items/5b94c1fe9610663881c1
* https://docs.aws.amazon.com/ja_jp/vpc/latest/userguide/VPC_SecurityGroups.html
* https://linuxacademy.com/guide/19824-basic-security-of-your-vpc/

### DNS settings
* https://mel.onl/onamae-domain-aws-route-53/

### Provisioning on EC2
* https://qiita.com/karon9/items/875b8a0053fa1c685386
* https://medium.com/datadriveninvestor/devops-using-ansible-to-provision-aws-ec2-instances-3d70a1cb155f
* https://qiita.com/katsuhiko/items/5c73781bf2f4f2aeabef
* https://medium.com/datadriveninvestor/devops-using-ansible-to-provision-aws-ec2-instances-3d70a1cb155f

### IAM
* https://medium.com/datadriveninvestor/devops-using-ansible-to-provision-aws-ec2-instances-3d70a1cb155f
* https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html#id_users_create_console
* https://aws.amazon.com/jp/premiumsupport/knowledge-center/new-user-accounts-linux-instance/

## SSL
* https://qiita.com/komazarari/items/88c1ed18765fb7cab6c1
* https://github.com/mprahl/ansible-role-lets-encrypt-route-53/blob/master/tasks/main.yml

## marchel
* https://qiita.com/tanakahisateru/items/e493753905ca9d941fde
* https://qiita.com/katzueno/items/6c1111e3e61a269c8837
* https://github.com/mackerelio/ansible-mackerel-agent/blob/master/tasks/centos.yml
