# Dosyayı UTF-8 kodlamasıyla açıyoruz
fin = open("config.xml", "rt", encoding="utf-8")
data = fin.read()
data = data.replace('<DM name="ViewName" val="IGD.AU1"/>' + "\n" + '<DM name="Enable" val="0"/>', '<DM name="ViewName" val="IGD.AU1"/>' + "\n" + '<DM name="Enable" val="1"/>')
data = data.replace('<DM name="SwitchShellEnable" val="0"/>', '<DM name="SwitchShellEnable" val="1"/>')
fin.close()

# Dosyayı yazarken de UTF-8 kodlamasını kullanıyoruz
fin = open("config.xml", "wt", encoding="utf-8")
fin.write(data)
fin.close()
