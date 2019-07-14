class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @node_count = 0
    @size
  end
  attr_accessor :tail, :head, :node_count

  def append
    @node_count += 1 
    if @head
      @tail.next_node = Node.new(@node_count)
      @tail = @tail.next_node
    else
      @head = Node.new(@node_count)
      @tail = @head
    end
  end

  def prepend
    @node_count += 1
    if @head
      temp = Node.new(@node_count, @head)
      @head = temp
    else
      @head = Node.new(@node_count)
    end
  end

  def size(node=@head, counter=1)
    return 0 if @head.nil?
    return counter if node.next_node.nil?
    size(node.next_node, counter += 1)
  end

  def at_index(i, node=@head)
    return node if i == 1
    at_index(i -=1, node.next_node)
  end

  def pop
    if @head == @tail
      @head = nil
      @tail = nil
    else 
      @tail = self.at_index(self.size - 1)
      @tail.next_node = nil
    end
  end

  def shift
    @head = @head.next_node
  end

  def contains?(val, node=@head)
    return false if node.nil?
    return true if val == node.value
    contains?(val, node.next_node)
  end

  def find(val, node=@head, i=1)
    return nil if node.nil?
    return i if val == node.value
    find(val, node.next_node, i+=1)
  end

  def to_s(node=@head)
    return nil if node.nil?
    puts node.value
    to_s(node.next_node)
  end

  def insert_at(i)
    if i <= 1
      prepend
      return
    elsif i >= size
      append
      return
    end

    @node_count += 1
    at_index(i - 1).next_node = Node.new(@node_count, at_index(i))
  end

  def remove_at(i)
    if i >= size
      pop
      return
    elsif i <= 1
      shift
      return
    end
    at_index(i - 1).next_node = at_index(i + 1)
  end
end

class Node
  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end
  attr_accessor :value, :next_node
end
