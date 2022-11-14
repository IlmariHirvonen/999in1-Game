# Game design document


### Projektin kuvaus
Projektin pääasiallinen tavoite on perehtyä Godot pelimoottoriin ja opetella sen käyttöä. Peliprojektimme on tarkoitus emuloida vanhanaikaista bootleg peliä missä on esim 999in1 peliä. Eli paljon pelejä yhdessä pelissä. 

### Projektin tavoitteet ja muita juttuja

##### Yleiset tavoitteet

Pelien tulisi tuntua suht hyvältä pelata. Tavoitteena ei ole tehdä tahallaan huonoja pelejä, vaan pyrkiä tekemään parhaansa jokaisen pelin eteen mahdollisemman pienessä ajassa. Jos tulee eteen jokin bugi mikä ei täysin riko peliä ja sitä ei saa nopeasti korjattua, sen voi peliin jättää. Ideana on siis määrä korvaa laadun.

Koska pelejä on ainakin tarkoitus tulla suht paljon, mahdollisesti jos halutaan vähentää [epäselvyyttä]? voidaan esimerkiksi pitää osaa peleistä lukittuina ja niitä voidaan esimerkiksi avata kolikoilla mitä kaikista peleistä voi kerätä. Eli ei anneta heti kaikkia pelejä pelattavaksi, jottei tule tunnetta ettei tiedä mistä aloittaa.

##### Tunne tavoitteet
Tavoitteena on saada pelaajalle sellainen olo, että peli on pelattavissa, mutta kuitenkin jotain on hieman väärin. Esimerkiksi musiikin voisi yrittää säveltää imitoimaan pelejä mitä yritämme imitoida. Erittäin lähellä, muttei kuitenkaan ihan.

Voisi myös olla hyvä idea pyrkiä käyttämään kaikkia assetteja mahdollisimman paljon uudestaan. Esim tilesetit kaikissa samat eri väreillä hahmot myös samat, myöskin eri väreillä. Äänieffektit myös voivat olla samoja. Sen lisäksi, että tämä antaa sellaista bootleg tuntumaa, säästetään myös aikaa taiteen teossa.

### Ehdottakaa lisää!!!

### Työkalut

Pelimoottorina käytetään Godot:ia, SCM(source control manager):ina on git ja käytetään git pilvipalveluna GitHubia. Kaikki asiat mitä tulee mieleen esimerkeiksi ideoita peleille ja muille ominaisuuksille voi laittaa "Issues" osioon kortteina.


### Pieni git cheat sheet
bash navigaatio:

ls | listaa tiedostot

cd kansion_nimi | menee nimettyyn kansioon

git juttuja:

git                    | kertoo kaikki komennot

git status            |listaa kaikki muutokset ja onko ne trackatty

muutosten laittaminen githubiin:

git add .              | lisää kaikki muutokset

git commit -m "viesti" | committaa kaikki lisätyt muutokset

git push               | Laittaa kaikki muutokset githubiin 
