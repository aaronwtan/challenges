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
  def self.from_a(array)
    list = new
    return list if array.nil?

    array.reverse.each { |datum| list.push(datum) }
    list
  end

  def initialize
    @list = []
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def push(datum)
    @list.push(Element.new(datum, head))
  end

  def pop
    @list.pop.datum
  end

  def peek
    head.datum if head
  end

  def head
    @list.last || nil
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  def to_a
    @list.reverse.map(&:datum)
  end
end