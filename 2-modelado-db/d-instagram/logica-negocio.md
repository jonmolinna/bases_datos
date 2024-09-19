# Instagram

## Listado de Entidades

### posts **(ED)**

- post_id
- post_date
- plot
- photo
- user **(FK)**

### user **(ED)**

- user **(PK)**
- user_date
- user_name
- email **(UQ)**
- password
- phone **(UQ)**
- bio
- web
- avatar
- birthdate
- genre
- country **(FK)**

### comments **(ED | EP)**

- comment_id **(PK)**
- comment_date
- comment
- post_id **(FK)**
- user **(FK)**

### hearts **(ED | EP)**

- heart_id **(PK)**
- heart_date
- post_id **(FK)**
- user **(FK)**

### follows

- follow_id **(PK)**
- follow_date
- follow_user **(Fk)** <!-- Ver a quien sigues  -->
- user **(Fk)** <!-- Ver quien te sigue  -->

### countries **(EC)**

- country_id **(PK)**
- country_name

## Relaciones

1. Los **users** publican **posts** (_1 - M_).
2. Los **users** escriben **comments** (_1 - M_).
3. Los **posts** tienen **comments** (_1 - 1_).
4. Los **users** otorgan **hearts** (_1 - 1_).
5. Los **posts** tienen **hearts** (_1 - M_).
6. Los **users** tienen **follows** (_1 - M_).
7. Los **users** siguen **follows** (_1 - M_).
8. Los **users** tienen un **countries** (_1 - M_).
