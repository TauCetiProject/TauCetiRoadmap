# Roadmap: well-quasi-orders, Kruskal's tree theorem and path orders

**Summary.** A well-quasi-order is a relation in which every infinite sequence contains two
terms, the earlier related to the later. Higman's lemma, that finite words over a
well-quasi-ordered alphabet are well-quasi-ordered by embedding as subsequences, is in Mathlib,
together with Nash-Williams' minimal bad sequences. This roadmap carries the theory from words to
trees, and from trees to the termination of term rewriting.

The objects are finite rooted plane trees, whose nodes carry labels and whose children come in a
fixed order, and the first-order terms of Mathlib's model theory, over an arbitrary signature and
an arbitrary set of variables. One tree embeds homeomorphically into another when its nodes map
injectively to nodes with larger labels, in a way that respects ancestors, branching points and
the order of siblings.

The main results:

- *Kruskal's tree theorem.* For a preorder on the labels, homeomorphic embedding is a
  well-quasi-order on labelled plane trees exactly when the preorder on the labels is one.
- *Dershowitz's theorem.* Over finitely many function symbols and variables, every strict order on
  terms that is monotone (replacing an argument by a smaller term gives a smaller term) and has
  the subterm property (every argument lies below the term) is well-founded. A finite set of
  rewrite rules terminates if every rule decreases in such an order that is also stable under
  substitution, whatever the signature.
- *Reduction orders.* A set of rewrite rules terminates exactly when its rules decrease in some
  well-founded strict order on terms that is monotone and stable under substitution.
- *Path orders.* For a well-founded precedence on the function symbols, the recursive path order
  and the lexicographic path order are well-founded, over any signature and any set of variables.
  A set of rules terminates if all its rules decrease in the recursive path order, or all in the
  lexicographic path order. Associativity
  `f(f(x, y), z) → f(x, f(y, z))` decreases in the lexicographic path order and in no recursive
  path order of an irreflexive precedence.

The roadmap rests on Mathlib's well-quasi-orders, its Higman lemma and minimal bad sequences,
which carry the proof of Kruskal's theorem; on Mathlib's first-order terms and substitution, the
syntax that SequentCalculusAndCutElimination also builds on; and on Mathlib's well-foundedness of
multiset and lexicographic extensions, which carry the path orders.

Layer 1 defines plane trees and homeomorphic embedding. Layer 2 proves Kruskal's tree theorem.
Layer 3 defines monotone, stable and subterm-closed relations on terms and the rewrite relation,
and proves Dershowitz's theorems and the characterisation of termination by reduction orders.
Layer 4 defines the two path orders and proves that they are well-founded and prove termination.

## Conventions

The design choices below fix the objects; each comes with a Check.

- **Plane trees.** `PlaneTree α` is the nested inductive type with one constructor
  `node : α → List (PlaneTree α) → PlaneTree α`: a label and the ordered list of subtrees. Every
  tree is finite. A leaf is `node a []`. The size of a tree is its number of nodes. The order of
  the children is part of the tree: `node a [s, t]` and `node a [t, s]` are different trees when
  `s ≠ t`.
- **Homeomorphic embedding.** `PlaneTree.Embeds r s t` is the inductive relation with two rules,
  for a relation `r` on labels: a tree that embeds into one of the subtrees in `ts` embeds into
  `node b ts`; and `node a ss` embeds into `node b ts` when `r a b` holds and the list `ss` embeds
  entry by entry into a sublist of `ts`. "Entry by entry into a sublist" is Mathlib's
  `List.SublistForall₂`, the relation of Higman's lemma. This is Gallier (1991), Definition 4.4,
  p. 9, read for an arbitrary relation `r`. It respects the order of siblings; the version for
  unordered trees, in which the children of a node map injectively in any order, is a weaker
  relation (2.1 below).
- **Well-quasi-orders.** A relation `r` is a well-quasi-order when it is Mathlib's
  `WellQuasiOrdered r`: every sequence `f : ℕ → α` has `m < n` with `r (f m) (f n)`. Mathlib's
  definition assumes nothing of `r`; reflexivity and transitivity are stated as `IsPreorder α r`
  where a statement uses them.
- **Terms.** Terms are Mathlib's `L.Term α` for a first-order language `L` and a type `α` of
  variables: a term is a variable `var x` or `func f ts` with `f : L.Functions n` and
  `ts : Fin n → L.Term α`. Every function symbol has a fixed arity. The set of all function
  symbols is the type `Σ n, L.Functions n`, finite where a statement says so. Substitution is
  Mathlib's `Term.subst`, which replaces every variable at once.
- **Direction of relations.** A relation `r` on terms is read "`r s t`: `s` lies below `t`". Then
  Mathlib's `WellFounded r` says that there is no infinite sequence `t₀, t₁, …` with each term
  above the next. A precedence is a relation on `Σ n, L.Functions n` read the same way.
- **Rules and termination.** A set of rules is a relation `R` on terms, `R l r` standing for the
  rule `l → r`; it may be infinite, and its rules may have variables on the right that do not occur
  on the left. `Rewrites R s t` is the one-step rewrite relation. `R` terminates when
  `WellFounded (flip (Rewrites R))`: there is no infinite sequence of rewrite steps.

**Checks.**
- The number of plane trees with one label and `1, 2, 3, 4, 5, 6` nodes is
  `1, 1, 2, 5, 14, 42`, the Catalan numbers; unordered rooted trees give `1, 1, 2, 4, 9, 20`. The
  first difference is at four nodes: the two plane trees with a root, a leaf and a path of two
  nodes below it, in the two orders, are one unordered tree.
- With labels `a`, `b` compared by equality, `node a [node a [], node b []]` and
  `node a [node b [], node a []]` embed in neither direction, so embedding respects the order of
  siblings.
- With one label, the tree `node * [node * [], node * []]` with three nodes does not embed into
  the path with three nodes, although an injective map from its nodes to those of the path sends
  the root to the root and keeps every ancestor above its descendants: the two leaves would need
  disjoint branches below the image of the root. Embedding is stronger than such maps.
- With labels `a ≤ b`, `node a []` embeds into `node b []` and not conversely.

## Layer 1: plane trees and homeomorphic embedding

### 1.1 Plane trees

Define `PlaneTree` as in the conventions. Prove, as API: the size of a tree; the recursion and
induction principle on trees in which the hypothesis for `node a ts` may use every member of `ts`;
and that a tree is determined by its label and its list of children.

### 1.2 Homeomorphic embedding

Define `PlaneTree.Embeds r` as in the conventions. API:

- If `r` is reflexive, every tree embeds into itself; if `r` is transitive, so is embedding. Both
  by induction on trees, with the argument of Mathlib's instances `List.SublistForall₂.is_refl`
  and `List.SublistForall₂.is_trans` run for lists whose members already satisfy the induction
  hypothesis (the instances themselves need the relation reflexive or transitive on the whole
  type, which is what is being proved). So `Embeds r` is a
  preorder when `r` is (Gallier (1991), the remark after Definition 4.4, p. 9).
- If `s` embeds into `t`, the size of `s` is at most that of `t` (by induction on the
  embedding).
- If `r` is a partial order and `s` and `t` embed into each other, then `s = t` (Gallier (1991),
  the remark after Definition 4.4, p. 9).
- A tree that embeds into a child of `t` embeds into `t`; a leaf `node a []` embeds into `t`
  exactly when `r a b` for the label `b` of some node of `t`.

**Checks.**
- With one label, no two different plane trees with the same number of nodes, at most five, embed
  into each other in either direction; with labels `a`, `b` compared by equality the same holds
  for all 102 trees with at most four nodes, and embedding is reflexive and transitive on them
  (exhaustive computation, 690 embedded pairs).
- The one-node tree embeds into every tree when there is one label.
- `r` reflexive is needed for reflexivity: with `r` empty, nothing embeds into anything, since the
  first rule needs an embedding into a child and the second needs `r a b`.

### Examples

- `node * [node * [], node * []]` (three nodes) embeds into
  `node * [node * [node * []], node * []]` (four nodes): the first leaf goes to the first child
  (or to its own child) and the second leaf to the second child.

### Dependencies

1.1 uses nothing. 1.2 uses 1.1 and Mathlib's `List.SublistForall₂`.

## Layer 2: Kruskal's tree theorem

### 2.1 Kruskal's tree theorem

Prove `PlaneTree.wellQuasiOrdered_embeds_iff`: for a preorder `r` on a type `α` of labels
(`IsPreorder α r`), `WellQuasiOrdered (PlaneTree.Embeds r)` holds exactly when
`WellQuasiOrdered r` does. The direction from labels to trees is Kruskal's tree theorem in the
form of Gallier (1991), Theorem 4.5, p. 9, with its proof on pp. 9–10 (due to Nash-Williams);
Dershowitz (1987), Theorem 20, p. 93, states both directions, with a proof sketch.

Route.
- (Trees to labels.) A sequence of labels `a k` gives the leaves `node (a k) []`; a leaf embeds into
  a leaf only by the second rule, so an embedding between two of them is `r (a m) (a n)`.
- (Labels to trees.) Suppose a bad sequence of trees exists (Mathlib's
  `Set.PartiallyWellOrderedOn.IsBadSeq` on the whole type). By
  `Set.PartiallyWellOrderedOn.exists_min_bad_of_exists_bad` with the size as rank, there is a bad
  sequence `t` that is minimal at every index: no bad sequence agreeing with `t` before index `n`
  has a smaller tree at index `n`.
- Let `D` be the set of all children of all `t k`. Embedding is a well-quasi-order on `D`.
  Otherwise take a bad sequence `u` in `D`. Its members are pairwise distinct (embedding is
  reflexive), and each `t k` has finitely many children, so a subsequence has `u j` a child of
  `t (p j)` with `p` strictly increasing. Then `t 0, …, t (p 0 − 1), u 0, u 1, …` is bad: an
  embedding of `t k` (`k < p 0`) into `u j` would give an embedding of `t k` into `t (p j)` by
  the first rule, and `k < p j`. It agrees with `t` before `p 0` and has the smaller tree `u 0` at
  index `p 0`, against minimality.
- By `WellQuasiOrdered.exists_monotone_subseq` for `r`, a subsequence `t (g k)` has
  `r (label (t (g m))) (label (t (g n)))` for all `m ≤ n`. By Higman's lemma,
  `Set.PartiallyWellOrderedOn.partiallyWellOrderedOn_sublistForall₂`, applied to embedding on
  `D` (a preorder, by 1.2), the lists of children of the `t (g k)` contain two, `m < n`, related
  by `List.SublistForall₂ (PlaneTree.Embeds r)`. The second rule embeds `t (g m)` into `t (g n)`,
  and `t` was bad.

**Checks.**
- The hypothesis on the labels is needed: labels `ℕ` compared by equality are not a
  well-quasi-order, and the leaves `node k []` form a bad sequence of trees.
- With one label, the longest sequence of plane trees `t 1, t 2, …` in which `t i` has at most
  `i + 2` nodes and no earlier tree embeds into a later one has five terms (exhaustive search),
  for example the three-node tree with two leaves, the paths with four, three and two nodes, and
  the one-node tree. With `i + 1` nodes the longest has two terms, with `i` nodes one.
- Unordered trees: the relation in which children may map in any order contains `Embeds r`, so it
  is a well-quasi-order whenever `Embeds r` is; it is not a separate target.

*Needs:* 1.1, 1.2; Mathlib `WellQuasiOrdered`, `WellQuasiOrdered.exists_monotone_subseq`,
`Set.PartiallyWellOrderedOn.exists_min_bad_of_exists_bad`,
`Set.PartiallyWellOrderedOn.partiallyWellOrderedOn_sublistForall₂`.

### Examples

- Finite labels: for a finite type `α` and `r` equality, `r` is a well-quasi-order
  (`Finite.wellQuasiOrdered`), so plane trees over a finite alphabet under embedding with equal
  labels are well-quasi-ordered (Gallier (1991), Theorem 4.12, p. 15). This is the case Layer 3
  uses.

### Dependencies

2.1 uses Layer 1 and Mathlib.

## Layer 3: simplification orderings and termination

### 3.1 Monotone, stable and subterm-closed relations; rewriting

Define, for a relation `r` on `L.Term α`:

- `IsMonotoneTermRel r`: for `f : L.Functions n`, `ts : Fin n → L.Term α`, an index `i` and a term
  `s` with `r s (ts i)`, the term `func f (Function.update ts i s)` lies below `func f ts`;
- `HasSubtermProperty r`: every `ts i` lies below `func f ts`;
- `IsStableTermRel r`: `r s t` implies `r (s.subst σ) (t.subst σ)` for every `σ : α → L.Term α`.

A strict order (`IsStrictOrder`) that is monotone and has the subterm property is a
simplification ordering (Gallier (1991), Definition 11.9, p. 49, where for symbols of fixed arity
the deletion property of the definition is superfluous, footnote 2, p. 49; Dershowitz (1987),
Definition 9, p. 80).

Define `Rewrites R`, the one-step rewrite relation of a set of rules `R`, inductively: a rule
instance `l.subst σ` rewrites to `r.subst σ` when `R l r`; and if `ts i` rewrites to `t`, then
`func f ts` rewrites to `func f (Function.update ts i t)` (Gallier (1991), Definition 11.7, p. 48,
for terms written as trees).

API, by induction on terms or on the rewrite step:
- substitution composes: `(t.subst σ).subst τ` is `t.subst` of the substitution `x ↦ (σ x).subst τ`;
- `Rewrites R` is monotone and stable in the sense above (read with "rewrites to" for "lies
  above");
- if every rule `l → r` of `R` has every variable of `r` in `l`, a rewrite step does not create
  variables, and every function symbol of the result occurs in the rewritten term or in a rule.

**Checks.**
- The order of the arguments is respected: `Rewrites R` for the single rule `f(x, a) → a`
  rewrites `f(a, a)` to `a` and does not rewrite `f(a, b)` for constants `a ≠ b`.
- Rules with extra variables are allowed and need not terminate: the rule `a → x` rewrites `a` to
  every term, `a` itself among them.

### 3.2 Dershowitz's theorem

Prove `wellFounded_of_isSimplification`: if `Σ n, L.Functions n` and `α` are finite and `r` is a
strict order on `L.Term α` that is monotone and has the subterm property, then `r` is
well-founded (Gallier (1991), Theorem 11.11, p. 50, for trees with deletion, its proof citing
Proposition 4.8, p. 13, whose finite-alphabet form is Proposition 4.9, p. 13; Dershowitz (1987),
Theorem 8, p. 81, as "well-founded for derivations", without proof). The source's trees have finitely many labels; here the finitely many variables
count as labels. (Proved here.)

Route.
- Write `φ : L.Term α → PlaneTree ((Σ n, L.Functions n) ⊕ α)`, sending `var x` to the leaf
  labelled `x` and `func f ts` to the node labelled `⟨n, f⟩` with children `φ (ts 0), …,
  φ (ts (n − 1))` in order.
- Key lemma: if `PlaneTree.Embeds (· = ·) (φ s) (φ t)`, then `s = t` or `r s t`. By induction on
  the embedding. First rule: `φ s` embeds into `φ (ts i)` for an argument `ts i` of `t`; by
  induction `s = ts i` or `r s (ts i)`, and with the subterm property and transitivity
  `r s t`. Second rule: equal labels; a variable label gives `s = t`; a symbol label `⟨n, f⟩`
  gives `s = func f ss`, `t = func f ts`, and the children lists both have length `n`, so the
  sublist of `List.SublistForall₂` is the whole list (`List.sublistForall₂_iff`,
  `List.Sublist.eq_of_length`) and each `ss i` equals or lies below `ts i`. Replacing the
  arguments of `s` one at a time by those of `t`, monotonicity and transitivity give `s = t` or
  `r s t`. (For symbols of fixed arity this length argument is what makes the deletion property
  unnecessary.)
- The labels form a finite type, so equality is a well-quasi-order on them
  (`Finite.wellQuasiOrdered`) and by 2.1 `Embeds (· = ·)` is one on trees. If `t₀, t₁, …` had
  `r t (k+1) t k` for all `k`, there would be `i < j` with `φ (t i)` embedded into `φ (t j)`, so
  `t i = t j` or `r (t i) (t j)`; transitivity gives `r (t j) (t i)`, and either case gives
  `r (t i) (t i)`, against irreflexivity (`wellFounded_iff_isEmpty_descending_chain`).

**Checks.**
- Monotonicity is needed: over a unary `f`, a unary `g` and a constant `a`, let `r` be the
  transitive closure of "proper subterm of" together with the pairs placing
  `g(f^j(a))` below `g(f^k(a))` for `k < j`. It is irreflexive (no term of the form `g(f^k(a))`
  is a proper subterm of another, and the added pairs only lead to such terms), it has the
  subterm property, and `g(a), g(f(a)), g(f(f(a))), …` descends forever; `f(g(a))` and
  `f(g(f(a)))` are unrelated, so `r` is not monotone.
- The subterm property is needed: "`s` lies below `t` when `s` has more symbols than `t`" is a
  monotone strict order, and `a, f(a), f(f(a)), …` descends forever.
- Finitely many variables are needed: with `α = ℕ` and no function symbols, the terms are the
  variables, every relation is vacuously monotone with the subterm property, and placing
  `var (k + 1)` below `var k` gives an infinite descent. Finitely many symbols are needed in the
  same way, with infinitely many constants `c k` and no variables.

*Needs:* 2.1, 3.1; Mathlib `Finite.wellQuasiOrdered`, `List.sublistForall₂_iff`,
`List.Sublist.eq_of_length`, `wellFounded_iff_isEmpty_descending_chain`.

### 3.3 Termination and reduction orders

Prove `wellFounded_rewrites_iff`: a set of rules `R` terminates if and only if some strict order
`r` on `L.Term α` is well-founded, monotone and stable and has `r r' l` for every rule `l → r'`
(Gallier (1991), Lemma 11.10, p. 49, without proof; Dershowitz (1987), the Corollary to Theorem 5,
p. 76, and Theorem 6, p. 77, both without proof). (Proved here.)

Route. (If) By induction on the rewrite step, `Rewrites R s t` implies `r t s`: at the root by
stability, inside an argument by monotonicity. So `flip (Rewrites R)` is contained in the
well-founded `r` (`Subrelation.wf`). (Only if) Take for `r` the transitive closure of
`flip (Rewrites R)`. It is well-founded (`WellFounded.transGen`), hence irreflexive, and it is
transitive; it is monotone and stable because each rewrite step is (3.1, using that substitution
commutes with `Function.update`), and each rule instance is one step.

**Checks.**
- Stability is needed in the "if" direction: for the rule `g(x, y) → g(y, x)` with variables
  `x ≠ y`, let `r` be the transitive closure of "replace one occurrence of `g(x, y)` by `g(y, x)`".
  It is monotone and well-founded (the number of occurrences of `g(x, y)` drops), and the rule
  decreases, but `g(x, y)` rewrites to `g(y, x)` and back (substitute `y` for `x` and `x` for `y`),
  so the rule does not terminate; `r` is not stable.
- The rule `a → f(a)` does not terminate, and no monotone well-founded order has `f(a)` below `a`:
  monotonicity would give the descent `a, f(a), f(f(a)), …`.

*Needs:* 3.1; Mathlib `Relation.TransGen`, `WellFounded.transGen`, `Subrelation.wf`.

### 3.4 Dershowitz's termination theorem

Prove `wellFounded_rewrites_of_isSimplification`: if the set of rules `R` is finite, `r` is a
strict order on `L.Term α` that is monotone, stable and has the subterm property, and `r r' l` for
every rule `l → r'`, then `R` terminates; the signature and the set of variables are arbitrary
(Gallier (1991), Corollary 11.13 with Definition 11.12, p. 50, without proof; Dershowitz (1987),
Theorem 8, p. 81, and Lemma 2, p. 80, without proof). (Proved here.)

Route.
- Every variable of `r'` occurs in `l`, for each rule. Otherwise substitute `l` for a variable `x`
  of `r'` not in `l`: `l` is unchanged and `l` is a subterm of the instance of `r'`, so by the
  subterm property and transitivity (or equality, if `r' = x`) `l` lies below or equals that
  instance, which lies below `l` by stability; this contradicts irreflexivity.
- Along an infinite rewrite sequence `t₀ → t₁ → …` (3.3, "if" direction: each step descends in
  `r`), no variable outside the finite set of variables of `t₀` and no symbol outside the finite
  set of symbols of `t₀` and of the rules appears (3.1).
- These finitely many symbols and variables label the trees `φ (t k)` of 3.2, which therefore lie
  in plane trees over a finite set of labels; by 2.1 (with equality on that finite set) two of
  them, `i < j`, embed, and the key lemma of 3.2 (which uses only transitivity, monotonicity and
  the subterm property, over any signature) gives `t i = t j` or `r (t i) (t j)`, a contradiction
  as in 3.2.

**Checks.**
- Finiteness of `R` is needed: with infinitely many constants `c k`, no other symbols and no
  variables, placing `c j` below `c k` for `j > k` is a stable strict order, vacuously monotone
  with the subterm property, every rule `c k → c (k + 1)` decreases, and the rules do not
  terminate.
- With the rule `g(f(x, y)) → f(g(x), g(y))`, a binary `f` and a unary `g`, the recursive path
  order of 4.1 with `f` below `g` places the right side below the left (computed from the
  definition), so this one-rule system terminates by 4.4.

*Needs:* 2.1, 3.1, the key lemma of 3.2, 3.3.

### Examples

- Interpret each symbol of arity `n` as `(v₁, …, vₙ) ↦ v₁ + … + vₙ + 1` on the positive
  integers, and place `s` below `t` when the value of `s` is smaller than that of `t` at every
  assignment of positive integers to the variables. This is a stable, monotone strict order with
  the subterm property, the simplest of the polynomial interpretations of Dershowitz (1987), §3,
  pp. 78–79.

### Dependencies

3.1 uses Mathlib's terms. 3.2 uses 2.1 and 3.1. 3.3 uses 3.1. 3.4 uses 2.1, 3.1, 3.2 and 3.3.

## Layer 4: the recursive and lexicographic path orders

### 4.1 The two path orders

Fix a precedence `prec` on `Σ n, L.Functions n` (`prec g f`: `g` below `f`). Define
`RpoLT prec` inductively; `RpoLT prec s t` says that `s` lies below `t`:

- each argument `ts i` lies below `func f ts`, and so does everything below an argument;
- `func g ss` lies below `func f ts` if `g` lies below `f` in the precedence and every `ss j` lies
  below `func f ts`;
- `func f ss` lies below `func f ts` (same symbol) if the multiset of the `ss j` lies below that of
  the `ts i` in the Dershowitz–Manna extension: the arguments of `t` are `Z + X` with `X ≠ 0`, those
  of `s` are `Z + Y`, and each `y ∈ Y` lies below some `c y ∈ X`.

Define `LpoLT prec` by the same first two clauses and, for the same symbol, `func f ss` below
`func f ts` if every `ss j` lies below `func f ts` and, at some index `i` with `ss k = ts k` for
all `k < i`, `ss i` lies below `ts i`.

`LpoLT prec` is the lexicographic path order of Gallier (1991), Definition 11.26, clause (i'),
pp. 55–56 (Dershowitz (1987), Definition 19, p. 97), for a strict precedence (symbols are
equivalent only when equal). `RpoLT prec` is the strict recursive path order in the variant that
Gallier (1991), footnote 6, p. 53, attributes to other authors (also called the multiset path
order): in the multiset comparison only syntactically equal arguments cancel. The recursive path
order of Dershowitz (1987), Definition 18, p. 94, and Gallier (1991), Definition 11.21, p. 53,
compares arguments up to permutation of subterms (Dershowitz, p. 94; Gallier, p. 54), and is
strictly larger: it contains `RpoLT prec` (by induction on the derivation), and the Checks below
give a pair it relates and `RpoLT prec` does not. Variables are compared with nothing but their
superterms: nothing lies below a variable, and a variable lies below exactly the terms other than
itself that contain it.

API, by induction on the derivation of `RpoLT prec s t` (and the same for `LpoLT prec`):
- if `s` lies below `t`, every variable of `s` occurs in `t`;
- the relation is monotone and stable (3.1), and has the subterm property. For monotonicity of
  the recursive path order take `X = {ts i}`, `Y = {s}`; for the lexicographic path order, the
  first difference is at `i`, and every other argument lies below by the first clause. For
  stability, map the multisets and the choice `c` through the substitution (where two members of
  `Y` have the same image, choose either one's `c`);
- it grows with the precedence: a larger precedence gives a larger relation.

The sources prove more for their orders: they are transitive, hence simplification orderings
(Dershowitz (1987), Theorems 21–22, pp. 94 and 97, without proof; Gallier (1991), Theorem 11.22,
p. 53, with a proof sketch, and Theorem 11.27, p. 56, with a one-line proof referring to that of
Theorem 11.22). For `LpoLT prec` this is
their lexicographic path order; for `RpoLT prec` it is a statement about the larger order and is
not claimed here. Transitivity is not used below, and it is not a target.

**Checks.** With a constant `a`, a unary `g`, a binary `f`, the precedence `a` below `g` below `f`
(and its transitive consequence), and variables `x`, `y`, `z`:
- `f(x, f(g(x), y))` lies below `f(g(x), g(y))` in the lexicographic path order and not in the
  recursive one: the multiset `{x, f(g(x), y)}` is not below `{g(x), g(y)}`, since `f(g(x), y)`
  lies below neither `g(x)` nor `g(y)`.
- For associativity, `f(x, f(y, z))` lies below `f(f(x, y), z)` in the lexicographic path order
  and the two are unrelated in the recursive path order, in both directions.
- `f(x, y)` and `f(y, x)` are unrelated in both orders.
- `f(a, g(x))` lies below `f(g(x), a)` in the lexicographic path order (first arguments `a` below
  `g(x)`) and the two are unrelated in the recursive path order (equal multisets).
- `f(x, y)` does not lie below `g(f(y, x))` in `RpoLT prec`: it is not an argument, it does not lie
  below the argument `f(y, x)` (equal multisets of arguments), and `f` is not below `g`. In the
  order of Dershowitz (1987), Definition 18, it does, since the argument `f(y, x)` is equivalent
  to `f(x, y)` up to permutation. On the 159 terms below, that order relates 5896 pairs, the 5860
  of `RpoLT prec` and 36 more.
- On the 159 terms over `f`, `g`, `a`, `x`, `y` with at most five symbols, both relations are
  irreflexive and transitive, monotone, stable under the substitutions of `x` and `y` by terms
  with at most three symbols, and below-related terms satisfy the variable condition
  (exhaustive computation; 5860 related pairs for the recursive path order, 5186 for the
  lexicographic). `RpoLT prec` is also transitive on the 1875 terms with at most seven symbols.
- Without a transitive precedence neither order is transitive: with `a` below `f` and `f` below
  `g` only, `a` lies below `f(x, x)` and `f(x, x)` below `g(x)` in both, but `a` does not lie
  below `g(x)`. Theorems 4.2–4.5 assume only that the precedence is well-founded.

### 4.2 Well-foundedness of the recursive path order

Prove `wellFounded_rpoLT`: if `prec` is well-founded, so is `RpoLT prec`, for every language `L`
and type `α` (Dershowitz (1987), Theorem 23, p. 98, with a proof sketch on p. 99; Gallier (1991),
Theorem 11.22, p. 53, with a proof sketch on pp. 53–54; both by extending the precedence to a
well-order and applying Kruskal's theorem). The sources state it for their larger order (4.1),
which contains `RpoLT prec`. The route below is a direct accessibility argument. (Proved here.)

Route. Write `W` for the terms accessible for `RpoLT prec` (Mathlib's `Acc`).
- Variables lie in `W`, since nothing lies below a variable; and a term below a member of `W` is
  in `W`.
- On `W` the restricted relation is well-founded and irreflexive, so Mathlib's
  `WellFounded.cutExpand` and `WellFounded.transGen` make the transitive closure of
  `Relation.CutExpand` well-founded on `Multiset W`. A Dershowitz–Manna step from `Z + X` to
  `Z + Y` (with `c`) is a chain of `CutExpand` steps, one for each member of `X`, replacing it by
  the members `y` with `c y` equal to it (and the other copies of a repeated member by nothing).
- Main lemma: if all `ts i` lie in `W`, then `func f ts` does. By well-founded induction on the
  pair (`⟨n, f⟩`, multiset of the `ts i` in `Multiset W`), ordered lexicographically by `prec`
  and the relation of the previous step (`WellFounded.prod_lex`), show that every `u` below
  `s = func f ts` lies in `W`, by strong induction on the size of `u`. If `u` is an argument of
  `s` or lies below one, it is in `W`. If `u = func g us` with `g` below `f` and every `us j` below
  `s`, each `us j` is smaller than `u`, hence in `W`, and the pair of `u` is smaller in its first
  component. If `u = func f us` by the multiset clause, each `us j` is a member of `Z`, an
  argument of `s`, or lies below a member of `X`, an argument of `s`; so all are in `W`, and the
  pair of `u` is smaller in its second component.
- By induction on terms, every term is in `W`.

**Checks.**
- Well-foundedness of the precedence is needed: with constants `c k` and `c (k + 1)` below `c k`,
  the clause for smaller symbols (with no arguments to check) places `c (k + 1)` below `c k`, an
  infinite descent.
- The converse fails in general: when `α` is empty and every symbol has positive arity there are
  no terms at all, and the path order is well-founded for every precedence.

*Needs:* 4.1; Mathlib `Acc`, `Relation.CutExpand`, `WellFounded.cutExpand`,
`WellFounded.transGen`, `WellFounded.prod_lex`.

### 4.3 Well-foundedness of the lexicographic path order

Prove `wellFounded_lpoLT`: if `prec` is well-founded, so is `LpoLT prec`, for every language `L`
and type `α` (Dershowitz (1987), Theorem 24, p. 98, with a proof sketch on p. 99; Gallier (1991),
Theorem 11.27, p. 56, with a one-line proof referring to that of Theorem 11.22). The sources assume that equivalent symbols have the same
arity; with a strict precedence and symbols of fixed arity this holds. (Proved here.)

Route. As in 4.2, with the second component the tuple of arguments `ts : Fin n → W` ordered by
Mathlib's `Pi.Lex` of `<` on `Fin n` and the restricted relation (`Pi.Lex.wellFounded`), and the
pair ordered by `WellFounded.psigma_lex` (the type of tuples depends on the arity of the symbol).
In the case `u = func f us` by the lexicographic clause, every `us j` lies below `s` and is smaller
than `u`, hence in `W`, and `us` is below `ts` in `Pi.Lex` at the index of the clause.

**Checks.**
- The constants `c k` of 4.2 give the same infinite descent, so well-foundedness of `prec` is
  needed.
- With precedence `s` below `a` (a binary `a`, a unary `s`, a constant `0`), the three rules
  `a(0, y) → s(y)`, `a(s(x), 0) → a(x, s(0))`, `a(s(x), s(y)) → a(x, a(s(x), y))` for Ackermann's
  function decrease in the lexicographic path order (Dershowitz (1987), System (20), p. 98), so
  they terminate by 4.5. Only the first decreases in the recursive path order of this
  precedence.

*Needs:* 4.1; Mathlib `Acc`, `Pi.Lex`, `Pi.Lex.wellFounded`, `WellFounded.psigma_lex`.

### 4.4 Termination by the recursive path order

Prove `wellFounded_rewrites_of_rpoLT`: if `prec` is well-founded and every rule `l → r` of `R` has
`RpoLT prec r l`, then `R` terminates, for any `R`, finite or not (Gallier (1991), Theorem 11.22,
p. 53, with Lemma 11.10, p. 49, for the larger order of 4.1). (Proved here.)

Route. By induction on the rewrite step, with stability at the root and monotonicity inside an
argument (4.1), every rewrite step descends in `RpoLT prec`; 4.2 and `Subrelation.wf`.

**Checks.**
- `g(f(x, y)) → f(g(x), g(y))` with `f` below `g` (3.4) terminates by 4.4; with `g` below `f` the
  right side does not lie below the left in the recursive path order.

*Needs:* 4.1, 4.2; Mathlib `Subrelation.wf`.

### 4.5 Termination by the lexicographic path order

Prove `wellFounded_rewrites_of_lpoLT`: the statement of 4.4 with `LpoLT prec` (Gallier (1991),
Theorem 11.27, p. 56, with Lemma 11.10, p. 49). (Proved here.)

Route. As in 4.4, with 4.3.

**Checks.**
- Associativity `f(f(x, y), z) → f(x, f(y, z))` terminates by 4.5 (4.1, Checks) and cannot be
  shown to terminate by 4.4 for any well-founded precedence: such a precedence is irreflexive, so
  only the clauses for arguments and for the same symbol apply, and `f(y, z)` lies below neither
  `f(x, y)` (its arguments `y`, `z` against `x`, `y`) nor `z`.
- The two orders cannot be mixed: with `g` below `f`, the rule `f(g(a), a) → f(a, g(g(a)))`
  decreases in the lexicographic path order (first arguments `a` below `g(a)`, and `g(g(a))` lies
  below the left side since `g` is below `f`), the rule `f(a, g(g(a))) → f(g(a), a)` decreases in
  the recursive path order (`g(a)` below `g(g(a))`, `a` cancels), and the two rules rewrite
  `f(g(a), a)` back to itself in two steps.

*Needs:* 4.1, 4.3; Mathlib `Subrelation.wf`.

### Examples

- Free groups: with precedence `1` below `∗` below `I` (and `1` below `I`), the ten rules of Knuth
  and Bendix for free groups decrease in the lexicographic path order (Gallier (1991),
  Example 11.28, pp. 56–57; recomputed from 4.1), so they terminate by 4.5.

### Dependencies

4.1 uses Mathlib's terms and multisets. 4.2 and 4.3 use 4.1. 4.4 uses 4.1 and 4.2, and 4.5 uses
4.1 and 4.3; their routes repeat the argument of 3.3 ("if" direction) for these relations, which
are not shown to be transitive.

## Scope and ownership

This roadmap owns plane trees with homeomorphic embedding, Kruskal's tree theorem, Dershowitz's
theorems on simplification orderings, the characterisation of termination by reduction orders,
and the recursive and lexicographic path orders with their well-foundedness and termination
theorems, all stated above.

Already in the libraries, and consumed rather than restated:

- Mathlib's `WellQuasiOrdered`, Higman's lemma
  `Set.PartiallyWellOrderedOn.partiallyWellOrderedOn_sublistForall₂`, the minimal bad sequences
  `Set.PartiallyWellOrderedOn.exists_min_bad_of_exists_bad` and
  `Set.PartiallyWellOrderedOn.iff_not_exists_isMinBadSeq`, Dickson's lemma `Pi.wellQuasiOrderedLE`
  and `WellQuasiOrdered.pi`, and products `WellQuasiOrdered.prod`.
- Finite subsets of a well-quasi-order, compared by injective maps to larger elements, are
  well-quasi-ordered (Gallier (1991), Theorem 3.3, p. 7, Nash-Williams), and so are finite
  multisets. This
  follows from Higman's lemma in Mathlib through the map from lists to multisets, and it is not a
  target here. The Dershowitz–Manna multiset order is well-founded by Mathlib's
  `Multiset.wellFounded_isDershowitzMannaLT`.
- Mathlib's first-order terms `FirstOrder.Language.Term` with `Term.subst`; the roadmap on main
  SequentCalculusAndCutElimination builds its calculus on the same syntax, and no statement there
  concerns rewriting.

Not treated here: Kruskal's theorem for infinite trees and better-quasi-orders; Rado's example of
a well-quasi-order whose infinite subsets are not well-quasi-ordered by domination; the strength
of Kruskal's theorem in proof theory, the ordinal `Γ₀` and Friedman's finite forms; the graph
minor theorem; transitivity of the path orders; path orders with quasi-precedences; the
Knuth–Bendix order and polynomial interpretations as targets; confluence and completion; the
strong normalisation of the simply typed lambda calculus (SimplyTypedLambdaCalculus, an open
roadmap, not on main, proves it by Tait's reducibility method; this roadmap does not depend on that
one); every procedure that decides an order or completes
a rewrite system.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Order/WellQuasiOrder.lean`: `WellQuasiOrdered r` (every `f : ℕ → α` has `m < n` with
  `r (f m) (f n)`; no hypothesis on `r`), `WellQuasiOrdered.exists_monotone_subseq`
  (`[IsPreorder α r]`), `Finite.wellQuasiOrdered` (`[Finite α] [Std.Refl r]`),
  `WellQuasiOrdered.prod`, `WellQuasiOrdered.pi`, `Pi.wellQuasiOrderedLE` (named in the scope
  section).
- `Mathlib/Order/WellFoundedSet.lean`: `Set.PartiallyWellOrderedOn`,
  `Set.PartiallyWellOrderedOn.IsBadSeq`,
  `Set.PartiallyWellOrderedOn.exists_min_bad_of_exists_bad` (any `r`, a rank `rk : α → ℕ`),
  `Set.PartiallyWellOrderedOn.iff_not_exists_isMinBadSeq`,
  `Set.PartiallyWellOrderedOn.partiallyWellOrderedOn_sublistForall₂` (`[IsPreorder α r]`).
- `Mathlib/Data/List/Forall2.lean`: `List.SublistForall₂`, `List.sublistForall₂_iff`,
  `List.SublistForall₂.is_refl` (`[Std.Refl Rₐ]`), `List.SublistForall₂.is_trans`
  (`[IsTrans α Rₐ]`); core
  `List.Sublist.eq_of_length`.
- `Mathlib/ModelTheory/Syntax.lean`: `FirstOrder.Language.Term` (`var`, `func`), `Term.subst`.
- `Mathlib/Logic/Hydra.lean`: `Relation.CutExpand`, `WellFounded.cutExpand`
  (`[WellFounded r]`); `Mathlib/Data/Multiset/DershowitzManna.lean`:
  `Multiset.wellFounded_isDershowitzMannaLT` (named in the scope section).
- `Mathlib/Order/RelClasses.lean`: `WellFounded.prod_lex`, `WellFounded.psigma_lex`;
  `Mathlib/Data/DFinsupp/WellFounded.lean`: `Pi.Lex.wellFounded`
  (`[IsStrictTotalOrder ι r] [Finite ι]`, each component well-founded).
- `Mathlib/Order/WellFounded.lean`: `wellFounded_iff_isEmpty_descending_chain`; core
  `WellFounded.transGen`, `Subrelation.wf`, `Acc`.

### From Tau Ceti

Nothing is used.

## References

- J. H. Gallier, *What's so special about Kruskal's theorem and the ordinal Γ₀? A survey of some
  results in proof theory*, Annals of Pure and Applied Logic 53 (1991), 199–260; the author's
  version of 7 September 2012 at `cis.upenn.edu/~jean/kruskal.pdf`, cited by its own page
  numbers: Theorem 3.3 (p. 7), Definition 4.4 with the remarks after it and Theorem 4.5 (p. 9,
  proof pp. 9–10), Propositions 4.8–4.9 (p. 13), Theorem 4.12 (p. 15), Definitions 11.7 (p. 48)
  and 11.9 with footnote 2, Lemma 11.10 (p. 49), Theorem 11.11, Definition 11.12 and
  Corollary 11.13 (p. 50), Definition 11.21 with footnote 6 and Theorem 11.22 (p. 53, proof sketch
  pp. 53–54), Definition 11.26 (pp. 55–56),
  Theorem 11.27 and Example 11.28 (pp. 56–57).
- N. Dershowitz, *Termination of rewriting*, Journal of Symbolic Computation 3 (1987), 69–116;
  the author's copy at `cs.tau.ac.il/~nachumd/papers/termination.pdf`: Theorem 5 and its Corollary
  (p. 76), Theorem 6 (p. 77), Lemma 2 and Definition 9 (p. 80), Theorem 8 (p. 81), Theorem 20
  (p. 93), Definition 18 and Theorem 21 (p. 94), Definition 19 and Theorem 22 (p. 97),
  System (20) (p. 98), Theorems 23–24 (p. 98, proof sketch p. 99).
- J. B. Kruskal, *Well-quasi-ordering, the tree theorem, and Vázsonyi's conjecture*, Trans. Amer.
  Math. Soc. 95 (1960); C. St. J. A. Nash-Williams, *On well-quasi-ordering finite trees*, Proc.
  Cambridge Philos. Soc. 59 (1963); N. Dershowitz, *Orderings for term-rewriting systems*,
  Theoretical Computer Science 17 (1982); S. Kamin and J.-J. Lévy, *Two generalizations of the
  recursive path ordering* (1980): the original sources, as the two texts above cite them; they
  were not consulted.
