# Tema pe care ne-am ales-o este "Car Dealership Database".

Echipa este formată din 2 studenți, baza de date va fi formată din 10 tabele cu următoarea structură:

Cars: descrie informații despre mașini disponibile la dealer.
Customers: păstrează detalii despre clienți și tranzacțiile lor.
Brands: detaliază informații despre mărcile de mașini disponibile.
Models: furnizează informații despre modelele specifice ale mașinilor.
Features: descrie caracteristici specifice ale mașinilor.
Sales: reține detaliile vânzărilor efectuate.
TestDrives: detaliază informațiile despre testele de conducere efectuate de clienți.
Showrooms: descrie starea sălilor de expunere (dacă sunt ocupate sau nu, și care mașini sunt expuse).
Employees: listează angajații dealerului auto.
Financing: ține evidența informațiilor legate de finanțare și împrumuturi.


Ca listă de atribute pentru fiecare tabel avem:

Cars: ID(PK), Brand(FK), Model(FK), An, Culoare, Pret, Disponibilitate. *(relatie one-to-many cu Customers, one-to-one cu Brands)*
Customers: ID(PK), Nume, Prenume, Varsta, Sex, Adresa, Telefon, Email.  *(relatie one-to-one cu Financing)*
Brands: ID(PK), Denumire.
Models: ID(PK), Denumire, An.
Features: ID(PK), Nume (ex. geamuri electrice, scaune incalzite,dezaburire,turbo - tip binar (y/n)) *(relație many-to-many cu Cars)*
Sales: ID(PK), Car(FK), Customer(FK), Dealer(FK), Data_vanzare, Suma.
TestDrives: ID(PK), Car(FK), Customer(FK), Dealership(FK), Date, Feedback. *(relatie many-to-one cu Customers)*
Showrooms: ID(PK), Nume, Adresă. *(relatie one-to-many cu Employees, Financing)*
Employees: ID(PK), Nume, Prenume, Pozitie, Vechime. *(relatie many-to-one cu Showrooms)*
Financing: ID(PK), Tranzactie(FK), Rata, Perioada, Dobanda. *(relație many to one cu Showrooms)*


# Importanta bazei de date

O bază de date pentru o asemenea afacere este imperativă dat fiind faptul că este imposibil ca o singură persoană să țină evidența atâtor părți importante pentru buna funcționare a busniess-ului.


Este evident că prin princina societății îndreptată spre libertatea adusă de către autovehicule, o bază de date de acest fel este mai mult decât de actualitate, așa că are o importanță prodigioasă.

Avantaje:

- streamlining a tuturor părților afacerii
- acces rapid la informații vitale
- actualizare în timp real a informației
- filtrarea eficientă a calupului exorbitant de informație



Dezavantaje:

- nevoie de echipă competentă pentru a ține pasul cu toate schimbările
- venit cheltuit pe echipa mai sus menționată
- venit cheltuit pe soluțiile software/hardware utilizate în creearea și mentenanța bazei de date

Autori: Bara și Brad

# TO-DO
sa respecte cele 3 forme normale
diagramele er , relation


# for relation model avem:

Cars - Customers

Relație: One-to-Many
Descriere: Un client poate avea mai multe tranzacții legate de achiziționarea sau testarea mașinilor.
Cars - Brands

Relație: One-to-One
Descriere: Fiecare mașină aparține unei singure mărci.
Customers - Financing

Relație: One-to-One
Descriere: Fiecare client poate avea o singură opțiune de finanțare.
Features - Cars

Relație: Many-to-Many
Descriere: O caracteristică specifică poate fi asociată cu mai multe mașini, iar o mașină poate avea mai multe caracteristici.
Sales - Cars, Customers, Employees

Relații: Many-to-One
Descriere: O vânzare este asociată cu o mașină vândută, un client care a achiziționat mașina și un dealer responsabil pentru vânzare.
TestDrives - Cars, Customers, Showrooms

Relație: Many-to-One (cu Customers)
Descriere: Un test de conducere este asociat cu o mașină testată, un client care a efectuat testul și un showroom unde s-a desfășurat testul.
Showrooms - Employees, Financing

Relații: One-to-Many (cu Employees), Many-to-One (cu Financing)
Descriere: Un showroom poate avea mai mulți angajați și poate oferi mai multe opțiuni de finanțare.
Employees - Showrooms

Relație: Many-to-One
Descriere: Un angajat lucrează într-un singur showroom.
Financing - Showrooms

Relație: Many-to-One
Descriere: Opțiunile de finanțare sunt asociate cu un showroom specific.



# Parte Stiintifica