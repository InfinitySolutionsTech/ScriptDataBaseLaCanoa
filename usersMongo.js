use storepro;
db.createUser({
    user: "storepro_rw",
    pwd: "STorePro50lu7i8ns",
    roles: [{ role: "readWrite", db: "storepro" }]
  });
db.getUsers();