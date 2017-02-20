class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    #manage is can preform ANY action to given note, which users_id matches
    can :manage, Note, :user_id => user.id

    #this code in block won't always run unless there is guaranteed instance of user else it gets skipped
    can :read, Note do |note|
      note.readers.include? user
    end
    #they recommended, as it will always be run: oh, but we don't have note??? hmm
    #can :read, Note if note.readers.include? user
  end
end
