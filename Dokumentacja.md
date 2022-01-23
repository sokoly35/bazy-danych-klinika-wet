# Dokumentacja Symulacji

<p align="center">
<img width="700" height="500" src="https://user-images.githubusercontent.com/58236634/150636812-4de16bb7-9ee8-42a5-a7c1-6aeaef611106.png" alt="APORT">
</p>
                                                                                                                                  

## Spis Treści 
* [Przegląd](#przegląd)
* [Instalacja i przygotowanie](#instalacja-i-przygotowanie)
  * [Pobieranie plików](#pobieranie-plików)
  * [Generowanie tabel](#generowanie-tabel)
  * [Zalogowanie do bazy](#zalogowanie-do-bazy)
  * [Stworzenie tabel](#stworzenie-tabel)
  * [Wypełnienie tabel](#wypełnienie-tabel)
  * [Analiza Danych](#analiza-danych)
  * [Generowanie raportu](#generowanie-raportu)
* [Technologie](#technologie)
* [Drużyna](#drużyna)



## Przegląd  <a name="przegląd"></a>

Klinika weterynaryjna APORT jest projektem na zaliczenie z kursu Bazy Danych z 2020 roku. Zadanie polegało na wysymulowaniu danych, jakie mogłyby się pojawić w bazie przykładowej kliniki weterynaryjnej. Do tego zadania wykorzystaliśmy język python. <br>
Następnie uzyskane dane należało eksportować i postawić na serwerze za pomocą MySQL. Na koniec drużyna miała za zadanie przeprowadzić analizę danych z wysymulowanego zbioru i sporządzić raport. Do wizualizacji wykorzystano biblioteki seaborn <br>
i matplotlib.

## Instalacja i przygotowanie  <a name="instalacja-i-przygotowanie"></a>

### Pobieranie plików  <a name="pobieranie-plików"></a>
Należy sklonować repozytorium lokalnie za pomocą polecenia w konsoli 
```
git clone https://github.com/sokoly35/bazy-danych-klinika-wet.git
```
### Generowanie tabel  <a name="generowanie-tabel"></a>
Przechodząc do folderu "Generowanie zbioru danych" możemy znaleźć notatniki jupytera odpowiedzialne za wygenerowanie konkretnych tabel do bazy danych. Wygenerowane pliki znajdują się również w "Eksport danych na serwer\INSERT" w plikach csv. Notatniki zawierają jednak ciekawą metodykę, z jaką trzeba było się zmierzyć generując obserwacje, założenia jakie zostały dokonane oraz sposób rozwiązania postawionego problemu. Specyfika niektórych danych wymagała utworzenia tabel ręcznie... 

### Zalogowanie do bazy  <a name="zalogowanie-do-bazy"></a>
W ramach projektu, w celu zalogowania się do bazy danych korzystaliśmy z rozszerzenia AppexSQL w edytorze VS Code, lecz użytkownik może skorzystać z innych narzędzi. Osoba chcąca postawić bazę danych wykorzystując nasze skrypty powinna posiadać następujące dane:
- nazwa serwera
- login 
- hasło
- nazwa bazy

### Stworzenie tabel  <a name="stworzenie-tabel"></a>
Po zalogowaniu się na serwerze, w celu utworzenia pustych tabel należy wykonać zapytania z pliku create_tables.sql.

### Wypełnienie tabel  <a name="wypełnienie-tabel"></a>
W notatniku "\Eksport danych na serwer\master.ipynb" znajduje się skrypt wypełniający stworzone tabele bazując na utworzonych wcześniej plikach csv w folderze INSERT. W notatniku w linijce
```
SQL_CONNECTOR = os.getenv('SQL_CONNECTOR')
```
użytkownik powinien wpisać formułę łączącą SQLAlchemy z bazą trzymając się konwencji:
```
silnik://<login>:<hasło>@<nazwa serwera>:<port>/<nazwa tabeli>?charset=utf8
```

### Analiza danych  <a name="analiza-danych"></a>
Celem projektu było sporządzenie stosownego raportu, który mógły w pewien sposób przydać się pracownikom ośrodka. Szablon takiej analizy danych znajduje się w notatniku "\Analiza danych\analiza_danych.ipynb" zawierające przydatne informacje dotyczące działań przychodni.

### Generowanie raportu  <a name="generowanie-raportu"></a>
W przypadku, gdyby baza była na bieżąco aktualizowana, a pracownicy o dziwo nie umieliby korzystać z pythona i jupytera :open_mouth: plik "\Analiza danych\generuj_raport.sh" zwróci raport w formacie pdf z wynikami analiz bazując na aktualnych danych w bazie. 

## Technologie  <a name="technologie"></a>
![Python](https://img.shields.io/badge/python-v3.8.8-blue.svg)

[<img target="_blanket" src="https://librosa.org/doc/latest/_static/librosa_logo_text.svg" width=300 height=100>](https://librosa.org/)
[<img target="_blanket" src="https://pandas.pydata.org/docs/_static/pandas.svg" width=300, height=100>](https://pandas.pydata.org/)
[<img target="_blank" src="https://seaborn.pydata.org/_static/logo-wide-lightbg.svg" width=300 height=100>](https://seaborn.pydata.org/) 
[<img target="_blank" src="https://user-images.githubusercontent.com/58236634/150637347-e2bf2129-5557-4169-8259-ee567372de21.png" width=300 height=100>](https://www.sqlalchemy.org/) 


## Drużyna  <a name="drużyna"></a>
| [<img target="_blanket" src="https://avatars.githubusercontent.com/u/58236634?v=4" width=200 height=200>](https://github.com/sokoly35) | [<img target="_blanket" src="https://user-images.githubusercontent.com/58236634/150647836-4d589a5f-ea53-437f-8620-6713bdedf5a3.png" width=200 height=200>](https://github.com/marszelka) | <img target="_blanket" src="https://user-images.githubusercontent.com/58236634/150647806-e102bd3d-cb29-4713-9ac7-2f554e6ce692.png" width=200 height=200> | <img target="_blanket" src="https://user-images.githubusercontent.com/58236634/150647353-102ac350-195e-4ffd-93ec-40ba943ce3af.png" width=200 height=200> |
| :---        | :---        | :---        | :---        | 
| [Rafał Sokołowski](https://github.com/sokoly35) | [Marta Jaworska](https://github.com/marszelka)  | Marta Kroczak | Agata Kawerska| 

