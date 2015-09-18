r1 = Role.create({name:"Admin", description:"Administrative User"});
r2 = Role.create({name:"Editor", description:"Editing User"});
r3 = Role.create({name:"Viewer", description:"Viewer User"});

u1 = User.create({name: "Default Admin", email: "admin@hbc-ky.com", password: "password", password_confirmation: "password", role_id: r1.id});
u2 = User.create({name: "Default Editor", email: "editor@hbc-ky.com", password: "password", password_confirmation: "password", role_id: r2.id});
u3 = User.create({name: "Default Viewer", email: "viewer@hbc-ky.com", password: "password", password_confirmation: "password", role_id: r3.id});
