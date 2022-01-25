
-----
--It can be called when using it
--Theme color configuration list
-----


--赋值
Primary="#FFF4A7B9"--主要
Secondary="#FFDCEEFF"--次要
Black="#FF1A1A1A"--黑色
Warning="#FFFFCC3D"--警告
Positive="#FF13CE66"--积极
Negative="#FFFF4949"--中立
White="#FFFFFFFF"--白色
Active="#FF2D8EFF"--活跃

--Necessary functions
function 转0x(n)
  if #n==7 then
    nn=n:match("#(.+)")
    nnn=tonumber("0xff"..nn)
   else
    nn=n:match("#(.+)")
    nnn=tonumber("0x"..nn)
  end
  return nnn
end


--Conversion format
Primaryx=转0x(Primary)
Secondaryx=转0x(Secondary)
Blackx=转0x(Black)
Warningx=转0x(Warning)
Positivex=转0x(Positive)
Negativex=转0x(Negative)
Whitex=转0x(White)
Activex=转0x(Active)






