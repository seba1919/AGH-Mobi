# README #

## Konfifuracja projektu ##
1. Instalacja managera bibliotek Cocoapods ze strony https://cocoapods.org. Bez tego nie będzie możliwości skompilwoania projektu, gdyż korzystamy z zewętrznych bibliotek.
Wystarczy odpalić terminal i przekleić ze strony: sudo gem install cocoapods
-***Projekt należy otwierać przy pomocy pliku .xcworkspace (biała ikonka), a nie .xcproject (niebieska ikonka).
Otwieranie .xcproject spowoduje wtedy błąd kompilacji. 
BIAŁE = HERE WE GO BBY
NIEBIEAKIE = FUJ***  

2. Pobranie repozytorium
- utworzyć klucz SSH
- wprowadzić utworzony klucz do konta na GitLabie*
- pobrać (sklonować) repozytorium. Link repo dla SSH znajduje się po kliknieciu w przycisk ,,Clone” [na głównej stronie](https://gitlab.com/FilipKaminski/AGH_Mobile ). 
Aby pobrać repo, odpalamy terminal i wpisujemy komendę ’git clone TUTAJ_WKLEIĆ_LINK_SSH_DO_REPO’.

3. Zanim zacznę kodzić
- każdy task posiada u nas swojego oddzielnefo brancha, który, po zakończwniu pracy, merge’owany jest z master’em
- zanim zaczniesz pracę, utwórz proszę brancha z (ważne!) gałęzi master. W nazwie powinno się znaleźć ID taska z backlogu GitLaba np. AM-003 (tak, bez kwadratowych nawiasów 😃)
- pamiętaj, by statać się utworzyć commit po zakończeniu danej funkcjonalności (dobrą prakryką jesr trzymanie się SOLID’u również przy kontroli wersji)
- [jak pisać commit message](https://chris.beams.io/posts/git-commit/). Im więcej commitów, tym lepiej. Bardzo problematyczne poprawianie historii commitów (robienie dziesięć bardziej szczegółowych commitów z jednego pierwotnego), więc dobrze już od samego początku wyrabiać ten nawyk.
- [mogę już przejść wreszcie do kodzenia???](https://github.com/raywenderlich/swift-style-guide?fbclid=iwar1taxqg-pzhty9d6mdowln0glvwkcduz799nnh6j33ktlr7lpyqkxmprfs) No nie tak szybko. Projekt ma być utrzymywlny, więc stosujemy się do uznanych konwencji, zapoznaj się proszę dokladnie z tym artykułem :)

4. Zaraz zaraz, a macie jakieś makiety, mock-up’y, jak zwał tak zwał?
- tak, mamy i mamy nawet oddzielne repozytorium na nie - [tutaj szczegółowe info :)](https://www.mackn.agh.edu.pl/2019/04/10/zeplin-cos-ala-git-ale-do-makiet/)


## Stara Informacja o tym jaki kiedyś był projekt ##

Aplikacja „AGH Mobile” gromadzi w jednym miejscu, wszystkie najważniejsze informację dotyczące naszej uczelni.  
Użytkownik przy pomocy jednego dotknięcia ma dostęp do:  
-programów studiów z systemu Syllabus,  
-najważniejszych aktualności i planowych wydarzeń,  
-systemu SKOS,  
-mapy kampusu,  
-podstawowych informacji o uczelni i jej historii.  
Wszystkie informacje są dostępne w specjalnej dostosowanej do niewielkiego rozmiaru urządzenia formie.   
Do działania aplikacja wymaga jedynie połączenia z internetem oraz urządzeniach firmy Apple - telefonu iPhone,  
pracującego pod kontrolą systemu iOS 8.0 lub nowszego dzięki czemu można ją uruchomić na większości dostępnych modeli (4s i późniejsze).   
W przyszłości planowane jest także przygotowanie wersji dla tabletów iPad oraz implementacja funkcjonalności systemu Dziekanat XP.  



## Lista Zewnętrznych Bibliotek ##
-Alamofire,  
-SwiftyJSON,  
-Fuzi,  
-AlamofireObjectMapper,  
-Charts,  
