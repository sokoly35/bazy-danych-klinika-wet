# Dokumentacja Symulacji

<p align="center">
<img width="700" height="500" src="https://user-images.githubusercontent.com/58236634/150636812-4de16bb7-9ee8-42a5-a7c1-6aeaef611106.png" alt="APORT">
</p>
                                                                                                                                  

## Spis Treści 
* [Opis](#przegląd)
* [Tabela Zwierzęta](#zwierzeta)
* [Tabela Wizyty](#wizyty)
* [Tabela Właściciele](#wlasciciele)
* [Tabela Pracownicy](#pracownicy)
* [Tabela Sprzęt](#sprzet)
* [Tabela Transakcje](#transakcje)



## Opis  <a name="przegląd"></a>

Plik opisuje w jaki sposób powstawały zasymulowane dane wykorzystywane do stworzenia bazy na serwerze.

## Tabela Zwierzęta <a name="zwierzeta"></a>

Kolumny:
- id_zwierzęcia
- id_właściciela
- Imię
- Data urodzenia
- Data rejestracji
- Gatunek
- Rasa
- Płeć

Imiona zostały pobrane z internetowego spisu imion dla zwierząt, są różne dla płci. Gatunki oraz rasy również zostały spisane <br> z internetowych stron dla najpopularniejszych zwierząt domowych. Założono, że każda rasa i gatunek zwierzęcia ma swoją maksymalną żywotność (zostało to sprawdzone na stronach internetowych). Założono, że najczęściej rejestrowane są zwierzęta młode oraz stare.

![image](https://user-images.githubusercontent.com/58236634/150676477-55508887-d20d-41e4-858e-3b6c325beb31.png)

Wiek zwierzęcia pochodzi z wygenerowania dwóch rozkładów normalnych widocznych na rysunku u góry - jeden z nich ma parametr mu_1 = ⅕ maksymalnej żywotności b ustalony subiektywnie, a drugi mu = ⅗ maksymalnej żywotności również ustawiony subiektywnie. Z prawdopodobieństwem p=0.3 wiek będzie pochodził z pierwszego rozkładu, a z prawdopodobieństwem q=0.7 z drugiego. Wykorzystując regułę 3-sigm ustalono, że 3-sigma nie powinno być większe niż odległość od zera do ⅕ maksymalnej żywotności dla pierwszego rozkładu. Jednocześnie 3-sigma nie powinno być większe niż odległość ⅗ maksymalnej żywotności do maksymalnej żywotności przy drugim rozkładzie. Pozwoliło to uzyskać odchylenie standardowe dla pierwszego rozkładu równe ⅓ mu_1 i ⅓(b-mu_2) dla drugiego. Ponieważ zmienna z rozkładu normalnego jest rzeczywista, wzięliśmy wartość bezwzględną i żeby uniknąć wieku równego  0, dodaliśmy 1/10 roku. Ten zabieg pozwala na podstawie odjęcia wieku od dzisiejszej daty (18.06.2021) otrzymania daty urodzenia. <br>
Data rejestracji do kliniki była losowana z rozkładu jednostajnego na horyzoncie zaczynającym się od daty urodzenia lub daty założenia przychodni w zależności od tego co miały większy sens do 05.06.2021. <br>
Id właściciela było losowo przypisywane do zwierzęcia z uwzględnieniem, aby właściciel był w posiadaniu co najmniej jednego zwierzęcia.

## Wizyty <a name="wizyty"></a>

Kolumny:
- id_wizyty
- Data
- Godzina
- id_pracownika
- Czas trwania wizyty
- Rodzaj wizyty
- id_zwierzęcia

Założono, że klinika działa od 05.10.2019. Godziny otwarcia kliniki to: 
-	poniedziałek - środa od 8 do 16, 
-	czwartek - piątek od 8 do 18, 
-	w weekendy od 9 do 13. 
Lekarze i pielęgniarki pracują 5 dni w tygodniu, a chirurg z racji trudnej pracy pracuje tylko 4 dni w tygodniu, od poniedziałku do czwartku. Lekarz 1 pracuje od poniedziałku do czwartku i w sobotę, a lekarz 2 od wtorku do piątku <br>  i niedzielę. Założono, że są 4 rodzaje wizyt:
-	15 min z p-stwem 0.4,
-	30 min z p-stwem 0.3,
-	1 h z p-stwem 0.2,
-	2 h z p-stwem 0.1,
Od 05.10.2019 do 09.05.2020 klinka się rozkręcała i prawdopodobieństwo, że klient przyjdzie na wizytę (czyli wcześniej ją zarezerwował) wynosi 0.3. W pozostałych dniach to p-stwo wzrosło do 0.6. W ciągu tygodnia są 3 dni gdy jest 3 lekarzy, 2 dni jak jest 2 lekarzy i 2 dni jak jest jeden lekarz. Rozkłady wizyt do lekarzy są takie same. Przerwy pracowników są pomijalne <br> i odbywają się ewentualnie jak nie ma żadnego pacjenta. Zdarzają się sytuacje, w których przez nagłe wypadki pracownicy zostają na nadgodzinach. <br>
W zależności od długości trwania wizyty i rodzaju specjalizacji lekarza badającego lub operującego dobrane zostały rodzaje wizyty. <br>
Id_zwierzęcia było dobierane losowo do wizyt w zależności od daty rejestracji w klinice. To znaczy zwierzę, które zostało zarejestrowane później niż dzień wizyty, nie było uwzględniane. Może zdarzać się tak, że zwierzęta zostały zarejestrowane, ale jeszcze nie były na żadnej wizycie. <br>
W tabeli przy każdej wizycie dołączony jest rodzaj wizyty. Uwzględniono, aby w momencie gdy na zwierzęciu została przeprowadzona eutanazja nie pojawiały się nowe wizyty.




## Tabela Właściciele <a name="wlasciciele"></a>

Kolumny:
- id_właściciela
- Imię 
- Nazwisko
- PESEL
- Telefon
- Email

Dane, którymi zostały uzupełnione kolumny Imię, Nazwisko zostały pobrane ze strony Głównego Urzędu Statystycznego. Użyto czterech różnych tabel zawierających odpowiednio najczęściej występujące w Polsce imiona męskie i żeńskie oraz najczęściej występujące w Polsce nazwiska męskie i żeńskie. Założono, że klinika ma 1000 klientów. Wylosowano liczbę mężczyzn i kobiet wśród klientów. Następnie przypisano do imion męskich odpowiednie prawdopodobieństwa odpowiadające liczbie wystąpień danego imienia i losowano ze zwracaniem imiona w zależności od prawdopodobieństwa występowania. To samo zostało powtórzone dla męskich nazwisk oraz żeńskich imion i nazwisk. Do generowania numerów PESEL został użyty generator numerów PESEL online dla zadanych płci i dat urodzenia od 01.01.1950 do 12.06.2003. Numery PESEL są unikalne. Numery Telefonów to losowe liczby o długości 9 cyfr. Numery telefonów są unikalne. Emaile zostały utworzone według schematu: imię + kropka + nazwisko + losowa liczba od 0 do 1000 + małpa + losowa domena wybrana z listy: gmail.com, wp.pl, onet.pl, o2.pl, interia.pl, yahoo.com, hotmail.com.



## Tabela Pracownicy <a name="pracownicy"></a>

Kolumny:
- id_pracownika
- Imię
- Nazwisko
- PESEL
- Telefon
- Email
- Data zatrudnienia
- Specjalizacja
- Pensja

W tabeli znajdują się dane na temat pracowników naszej kliniki. Założono, że pracuje w niej pięć osób, w tym dwóch lekarzy, dwie pielęgniarki i jeden chirurg. Dane do kolumn Imię, Nazwisko, Email, Specjalizacja zostały wpisane ręcznie. Do generowania numerów PESEL został użyty generator numerów PESEL online dla zadanych dat urodzenia i płci. Numery Telefonów to losowe liczby o długości 9 cyfr. Za datę zatrudnienia wszystkich pracowników przyjęto datę otwarcia kliniki.

## Tabela Sprzęt <a name="sprzet"></a>

Kolumny:
- id_sprzętu
- Nazwa
- Kategoria
- Wartość

Spis sprzętu, czyli kolumny Nazwa, Kategoria został sporządzony na podstawie list sprzętu dostępnych w internecie. Dane w kolumnie Wartość to ceny pobrane ze sklepów online oferujących sprzęt weterynaryjny


## Tabela Transakcje <a name="transakcje"></a>

Kolumny:
- id_transakcji
- Data
- Rodzaj_transakcji
- Kwota
- id_wizyta jeśli wizyta

Tabela zawiera koszty i przychody ponoszone od czasu powstania kliniki. Założono kilka rodzajów stałych kosztów ponoszonych pierwszego dnia każdego miesiąca, które nie zmieniły się od czasu powstania kliniki, są to: czynsz za wynajem lokalu (sprawdzona <br> w internecie średnia to 30 zł/mkw,  dla kliniki o powierzchni 150mkw to 4500zł); dodatkowe opłaty za media, prąd, wywóz śmieci, wodę <br> i inne ustalona na poziomie 1/5 czynszu; opłata dla zewnętrznej firmy sprzątającej na poziomie minimalnej krajowej pensji; opłata dla biura rachunkowego 500 zł i bankowa 140 zł przyjęta na podstawie informacji znalezionych w internecie. Przychody to wpłaty od klientów za dokonane usługi weterynaryjne, które zostały pobrane z tabeli wizyty. 

