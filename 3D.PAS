program rotating_sphere;

uses crt, graph;
var gd,gm: Smallint;
type
  Point3D = record
    x, y, z : real;
  end;
  Base2D = record
    u, v : integer;
  end;

var
  data : array [0..255, 0..255] of Point3D;
  t1, t2 : integer;
  base : Base2D;
  e : real;
  perspective : boolean;

const
  rad = Pi / 180;

procedure spher_to_cartesian (radius, a, b : integer; var p : Point3D);
var
  s1, s2, c1, c2 : real;
begin
  s1 := sin (a * rad);
  s2 := sin (b * rad);
  c1 := cos (a * rad);
  c2 := cos (b * rad);
  p.x := radius * c1 * c2;
  p.y := radius * c1 * s2;
  p.z := radius * s1;
end;

procedure Rotate (angleX, angleY, angleZ : integer; var p : Point3D);
var
  s1, s2, s3, c1, c2, c3 : real;
  Puit : Point3D;
begin
  s1 := sin (angleX * rad);
  s2 := sin (angleY * rad);
  s3 := sin (angleZ * rad);
  c1 := cos (angleX * rad);
  c2 := cos (angleY * rad);
  c3 := cos (angleZ * rad);
  Puit.X := p.x * (c2 * c3) + p.y * (c2 * s3) - p.z * s2;
  Puit.Y := p.x * (s1 * s2 * c3 - c1 * s3) + p.y * (s1 * s2 * s3 + c1 * c3) +
                                                            p.z * (s1 * c2);
  Puit.Z := p.x * (c1 * s2 * c3 + s1 * s3) + p.y * (c1 * s2 * s3 - s1 * c3) +
                                                            p.z * (c1 * c2);
  p := Puit;
end;

procedure init (radius, hor, ver : integer; hx, hy, hz : integer);
var
  p1, p2 : Point3D;
  a, b, hor_step, ver_step : real;
  i, j : byte;
begin
  for i := 0 to 25 do
    for j := 0 to 40 do
      begin
        data [i,j].x := 0.0;
        data [i,j].y := 0.0;
        data [i,j].z := 0.0;
      end;
  t1 := 0;
  hor_step := 180 / hor;
  ver_step := 360 / ver;
  for i := 0 to hor do
    begin
      b := 0;
      a := - 90 + i * hor_step;
      spher_to_cartesian (radius, trunc (a), trunc (b), p1);
      rotate (hx, hy, hz, p1);
      t2 := 0;
      inc (t1);
      data [t1,t2] := p1;
      for j := 0 to ver do
        begin
          inc (t2);
          b := j * ver_step;
          spher_to_cartesian (radius, trunc (a), trunc (b), p2);
          rotate (hx, hy, hz, p2);
          data [t1,t2] := p2;
        end;
     end;
end;

procedure Rotation (x, y, z : real);
var
  s1, s2, s3, c1, c2, c3 : real;
  p, Puit : Point3D;
  u, v : byte;
begin
  s1 := sin (X * rad);
  s2 := sin (Y * rad);
  s3 := sin (Z * rad);
  c1 := cos (X * rad);
  c2 := cos (Y * rad);
  c3 := cos (Z * rad);
  for u := 0 to t1 do
    for v := 0 to t2 do
      begin
        p := data [u,v];
        Puit.X := p.x * (c2 * c3) + p.y * (c2 * s3) - p.z * s2;
        Puit.Y := p.x * (s1 * s2 * c3 - c1 * s3) + p.y *
               (s1 * s2 * s3 + c1 * c3) + p.z * (s1 * c2);
        Puit.Z := p.x * (c1 * s2 * c3 + s1 * s3) + p.y *
               (c1 * s2 * s3 - s1 * c3) + p.z * (c1 * c2);
        data [u,v] := Puit;
     end;
end;

procedure TransForm (Pt3D : Point3D; var X2D, Y2D : integer);
var
  thit : real;
begin
  if perspective then
    begin
      thit := 1 / (1 - Pt3D.X / e);
      X2D := trunc (Base.u + Pt3D.y * thit);
      Y2D := trunc (Base.v + Pt3D.z * thit);
    end
    else
    begin
      X2D := Base.u + round (Pt3D.y);
      Y2D := Base.v + round (Pt3D.z);
    end;
end;

procedure LineC (x1, y1, x2, y2 : integer; color : byte);
begin
  SetColor (color);
  Line (x1, y1, x2, y2);
end;

procedure Line3 (point1, point2 : Point3D; color : integer);
var
  x1, x2, y1, y2 : integer;
begin
  TransForm (point1, x1, y1);
  TransForm (point2, x2, y2);
  LineC (x1, y1, x2, y2, color);
end;

procedure Draw (color : byte);
var
  u, v : byte;
begin
  for u := 1 to t2 - 1 do
    for v := 1 to t1 - 1 do
      begin
        Line3 (data [v,u], data [v + 1,u], color);
        Line3 (data [v,u], data [v,u + 1], color);
      end;
end;

begin
  gd:=vga; gm:=vgamed;
  initgraph(gd,gm,'');
  SetBkColor (blue);
  base.u := 320;
  base.v := 175;
  perspective := false;
  e := 150;
  init (140, 40, 40, 40, - 55, 14);
  repeat
	ClearViewPort;
	Rotation (- 0.5, 0.5, 3);
	Draw (14);
  until keypressed;

end.
