//Design patterns: singleton
//https://refactoring.guru/design-patterns/singleton

/* Some pseudocode-
// The Database class defines the `getInstance` method that lets
// clients access the same instance of a database connection
// throughout the program.
class Database is
	// The field for storing the singleton instance should be
	// declared static.
	private static field instance: Database

	// The singleton's constructor should always be private to
	// prevent direct construction calls with the `new`
	// operator.
	private constructor Database() is
		// Some initialization code, such as the actual
		// connection to a database server.
		// ...

	// The static method that controls access to the singleton
	// instance.
	public static method getInstance() is
		if (Database.instance == null) then
			acquireThreadLock() and then
				// Ensure that the instance hasn't yet been
				// initialized by another thread while this one
				// has been waiting for the lock's release.
				if (Database.instance == null) then
					Database.instance = new Database()
		return Database.instance

	// Finally, any singleton should define some business logic
	// which can be executed on its instance.
	public method query(sql) is
		// For instance, all database queries of an app go
		// through this method. Therefore, you can place
		// throttling or caching logic here.
		// ...

class Application is
	method main() is
		Database foo = Database.getInstance()
		foo.query("SELECT ...")
		// ...
		Database bar = Database.getInstance()
		bar.query("SELECT ...")
		// The variable `bar` will contain the same object as
		// the variable `foo`.
*/

//floats are faster than ints on modern cpus

//FLOPS - FLoating point Operations Per Second
//GLUT - OpenGL Utility Toolkit
//FreeGLUT - Open scource version of the GLUT
//GLEW - OpenGL Extension Wrangler -- I'll wrangle your extension ;)
//MathGL OpenGL Math Library for matrix math

