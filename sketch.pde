boolean switch_colors = false;
// ........................................................
color white = #ffffff;
color black = #101008;
color fg, bg;
float tile_x;
// ........................................................
void setup() {
  size(900, 900);
  rectMode(CENTER);
  //tile_x = int(random(3, 30));
  frameRate(24);
}
// ........................................................
void draw() {

  if (frameCount % 30 == 0) {
    switch_colors = !switch_colors;
    tile_x = 1 + frameCount / 13;
  }

  if (switch_colors == true) {
    fg = black;
    bg = white;
  } else {
    fg = white;
    bg = black;
  }

  background(bg);
  fill(fg);
  noStroke();

  int counter = 0;
  float tile_y = tile_x;
  float tile_w = width / tile_x;
  float tile_h = height / tile_y;

  translate(tile_w / 2, tile_h / 2);
  rectMode(CORNERS);

  //tile_x = 1 + frameCount / 66;
  //float tile_y = tile_x;
  //float tile_w = width / tile_x;
  //float tile_h = height / tile_y;
  //int selector = 0;
  //translate(tile_w / 2, tile_h / 2);

  for (int x = 0; x < tile_x; x++) {
    for (int y = 0; y < tile_y; y++) {


      float wave = tan(radians(frameCount * 0.05 * (x + y)));
      //float magnitude = 300;
      float pos_x = x * tile_w;
      float pos_y = y * tile_h;
      //pushMatrix();
      //translate(pos_x, pos_y);
      float rotation = frameCount;
      float scalar = .50;

      if (counter % 7 == 0) {
        pushMatrix();
        translate(pos_x, pos_y + wave);
        //translate(x * tile_w, y * tile_h);
        rotate(radians(rotation + wave));
        ellipse(0 + scalar * rotation, 0, tile_w / 2 * scalar, tile_h / 2);
        popMatrix();
      }
      if (counter % 6 == 0) {
        pushMatrix();
        translate(pos_x, pos_y);
        //translate(x * tile_w, y * tile_h);
        rotate(radians(rotation - wave * y));
        rect(0, 0 + scalar * wave, tile_w * 4, tile_h / 8 * scalar);
        popMatrix();
      }

      counter ++;
    }
  }
  //saveFrame("out_b/frame_####.jpg");
}
