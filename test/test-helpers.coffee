window.expect = chai.expect

chai.Assertion.addMethod 'emberInstanceOf', (type) ->
  obj = @._obj

  new chai.Assertion(type.detectInstance(obj), "should be " + type.toString()).to.be.true

chai.Assertion.addMethod 'emberMixin', (type) ->
  obj = @._obj

  new chai.Assertion(type.detect(obj), "doesn't have the proper mixin").to.be.true
