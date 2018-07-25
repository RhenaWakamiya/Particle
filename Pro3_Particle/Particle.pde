class ParticleRenderer {
  PVector pos;
  int pBrightness =5;
  float r, g, b, a, dis;
  int gain = 6;
  float[] cc = new float[3];
  PGraphics pg;

  ParticleRenderer(int w, int h) {
    pg = createGraphics(w, h);
    pos = new PVector();//パーティクルの位置
    for (int i=0; i<3; i++) {
      cc[i]=random(150,250);//パーティクルの大きさと色
    }
  }

  void update(PVector mouse) {
    pos.add(PVector.sub(mouse, pos));//位置+(マウス座標-位置)
  }

  PImage getImage() {
    pg.beginDraw();
    pg.loadPixels();// pixelsを読み込み
    //画像一つ一つのピクセルの色を設定する
    for (int y=0; y<pg.height; y++) {
      for (int x=0; x<pg.width; x++) {

        int pixelIndex = y*pg.width+x;//画面のピクセル一つ一つを示す
        color col = pg.pixels[pixelIndex];//color型の配列。(x, y)の情報は pixels[y*width + x] で得られる。
        //各pixelの色
        r = red(col);//pixelsのカラーデータ赤
        g = green(col);//pixelsのカラーデータ緑
        b = blue(col);//pixelsのカラーデータ青
        a = brightness(col);//pixelsのカラーデータ透明度

        //二点間の距離を求める
        PVector pixelPosition = new PVector(x, y);
        dis = PVector.dist(pos, pixelPosition);
        r += (cc[0] / dis - gain) * pBrightness;
        g += (cc[1] / dis - gain) * pBrightness;
        b += (cc[2] / dis - gain) * pBrightness;
        pg.pixels[pixelIndex]=color(r, g, b, a);//パーティクルの描画
      }
    }
    pg.updatePixels();//pixelsの更新
    pg.endDraw();
    return pg.get();
  }
}