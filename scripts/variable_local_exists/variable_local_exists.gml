// Returns whether a local variable with the given name (a string) exists for the current instance.
function variable_local_exists(name) {
	return variable_instance_exists(self, name);
}