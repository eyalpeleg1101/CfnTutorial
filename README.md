Exports
-------

In this section we will get acquainted with cfn outputs and exports.
Exports enable us to **pass values between stacks**.

e.g. after creating a Role in a given stack we can export its ARN and than other stacks that
might require this role could simply import and reference the value.

This way we can build a more **modular architecture** where each stack references
resources from other stacks by importing their exported values.


