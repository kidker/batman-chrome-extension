class Batbelt.AppModelTest extends Batman.ModelTestCase
  setup: ->
    @instance = new Batbelt.AppModelInstance
    @instance.appObserve = (@appObserveSpy = sinon.spy())
    @instance.fromJSON(Batbelt.Fixtures.AppModel.instance)

  @test 'instance properties should be a Batman.Hash', ->
    @assert @instance.get('properties') instanceof Batman.Hash

  @test 'each instance property should call appObserve', ->
    props = @instance.get('properties')
    @assertEqual props.length, @appObserveSpy.callCount
    @assert @appObserveSpy.calledWith('title')
    @assert @appObserveSpy.calledWith('complete')

(new Batbelt.AppModelTest).runTests()
