# ZXHN-H298A-V1.0-Modem-Root-Permission-Batch-Script
İşlem basamakları videolu olarak şu videoda mevcuttur.

[![Everything Is AWESOME](https://yt-embed.herokuapp.com/embed?v=G1BrJW67SMQ)](https://www.youtube.com/watch?v=G1BrJW67SMQ "Everything Is AWESOME")

<b>Yapılması gerekenler;</b>


1- Bu bat dosyalarını <a href="https://github.com/mkst/zte-config-utility" target="_blank">zte-config-utility-master</a> içine atınız.

2- 1-PRESS_HERE.bat dosyasını notepad++ vb. düzenleyici ile açınız ve Python Script klasör yolunuzu düzenleyin. 
   (Python yoksa indirip kurun. Link: https://www.python.org/downloads/ )
    Python kurarken **Add Phyton to Path** seçeneğini işaretleyin.
		
		
3- Sonrasında config.bin dosyasını da zte-config-utility klasörüne atıp 1-PRESS_HERE.bat dosyasına tıklayarak çalıştırın. 

5- xml dosyasını çıkardıktan sonra 600 saniye süreden geriye doğru saymaya başlayacak. Bu süre içerisinde;
	config.xml dosyasını açınız ve düzenlenmesi gereken 2 kod satırını düzenleyiniz.
	Bu kod satırları şunlar;
	
	Dosyada 	        <DM name="ViewName" val="IGD.AU1"/>     aratın
	Altında bulunan 	<DM name="Enable" val="0"/>             alanını;
	Şununla değiştirin	<DM name="Enable" val="1"/> 				
	
	<DM name="SwitchShellEnable" val="0"/>                     aratın ve değeri;
	<DM name="SwitchShellEnable" val="1"/>                     yapın.
	
	Dosyayı kaydedin.

6- Sonrasında cmd ekranından süreyi beklemeden tamamlayıp config.bin dosyasını modeminize geri yükleyebilirsiniz.
7- ;)
	
