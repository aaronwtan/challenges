# Write a simple linked list implementation. The linked list is
# a fundamental data structure in computer science, often used
# in the implementation of other data structures.

# The simplest kind of linked list is a singly linked list.
# Each element in the list contains data and a "next" field pointing
# to the next element in the list of elements. This variant of linked lists
# is often used to represent sequences or push-down stacks
# (also called a LIFO stack; Last In, First Out).

# Let's create a singly linked list whose elements may contain a range of data
# such as the numbers 1-10. Provide methods to reverse the linked list and
# convert a linked list to and from an array.

class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :head

  def self.from_a(array)
    array = [] if array.nil?

    list = new
    array.reverse.each { |datum| list.push(datum) }
    list
  end

  def size
    element_count = 0
    each { |_| element_count += 1 }
    element_count
  end

  def empty?
    head.nil?
  end

  def push(datum)
    self.head = Element.new(datum, head)
  end

  def pop
    popped_element = head
    self.head = head.next
    popped_element.datum
  end

  def peek
    head.datum unless head.nil?
  end

  def reverse
    list = SimpleLinkedList.new
    each { |datum| list.push(datum) }
    list
  end

  def to_a
    array = []
    each { |datum| array.push(datum) }
    array
  end

  def each
    current_element = head

    until current_element.nil?
      yield(current_element.datum) if block_given?
      current_element = current_element.next
    end

    self
  end
end
