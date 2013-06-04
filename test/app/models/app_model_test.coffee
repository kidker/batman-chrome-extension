class Batbelt.AppModelTest extends Batman.ModelTestCase
  oldAppObservable = Batbelt.AppObservable

  Batbelt.AppObservable =
    initialize: ->
      @appObserve = sinon.spy()

  setup: ->
    @instance = new Batbelt.AppModelInstance
    @instance.appObserve = (@appObserveSpy = sinon.spy())
    @instance.fromJSON(Batbelt.Fixtures.AppModel.instance)

  teardown: ->
    Batbelt.AppObservable = oldAppObservable

  @test 'instance properties should be a Batman.Hash', ->
    @assert @instance.get('properties') instanceof Batman.Hash

  @test 'each instance property should call appObserve', ->
    props = @instance.get('properties')
    @assertEqual props.length, @appObserveSpy.callCount
    @assert @appObserveSpy.calledWith('title')
    @assert @appObserveSpy.calledWith('complete')

(new Batbelt.AppModelTest).runTests()
