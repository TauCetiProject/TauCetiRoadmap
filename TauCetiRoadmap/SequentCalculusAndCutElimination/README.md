# Roadmap: sequent calculus and cut elimination

**Summary.** Gentzen's sequent calculus is a proof system for classical first-order logic in which
each logical rule introduces one connective or quantifier on the left or on the right of a sequent
`Γ ⇒ Δ`, read as "the conjunction of `Γ` implies the disjunction of `Δ`". Its central fact is that
the cut rule, which lets a proof pass through an arbitrary intermediate formula, can be removed. This
roadmap builds the calculus on Mathlib's first-order formulas over an arbitrary language, with
`⊥`, implication and the universal quantifier as primitives and equality treated as logical, and
proves the basic theorems about it. Sequents are pairs of finite sets of formulas whose free
variables are indexed by the natural numbers; equality enters through a reflexivity rule and a
replacement rule for atomic formulas.

The headline theorems are these.

- *Soundness and completeness of the cut-free calculus.* A sequent has a derivation if and only if
  it is valid, that is, true under every assignment of its free variables in every structure; and
  every valid sequent already has a derivation without cuts. In particular cut is admissible. A
  first-order theory entails a sentence, in the sense of Mathlib's semantic consequence, exactly
  when the sentence has a cut-free derivation from finitely many axioms of the theory.
- *Cut elimination with a height bound.* A derivation of height `h` whose cut formulas all have
  depth less than `c` can be transformed into a derivation of the same sequent without cuts whose
  height is at most a tower of `c` twos topped by `h`. A derivation without cuts has the subformula
  property: each of its formulas is atomic or an instance of a subformula of the end sequent.
- *Herbrand's theorem.* For a quantifier-free formula `φ`, the formula `∃ x₁ … xₖ, φ` is valid if
  and only if some finite disjunction of instances of `φ` at tuples of terms is valid; when `φ`
  contains no equation, this happens exactly when such a disjunction is a propositional tautology.

The roadmap builds on Mathlib's model theory, which provides the syntax, the semantics and the
compactness theorem but no proof system. The completeness proof uses the model existence theorem
for consistency properties that InfinitaryModelExistence specifies and Tau Ceti implements: the
sets of sentences that the cut-free calculus cannot refute form such a property. Craig
interpolation, which that roadmap proves model-theoretically, is not restated here.

## How to read the build

Layer 1 below defines instances of formulas, their depth, the derivations with their height and
cut rank, and proves the structural lemmas (weakening, substitution, inversion, identity) that the
other layers use. Layer 2 proves soundness and the completeness of the cut-free calculus, for
single sequents and for theories, and depends on Layer 1. Layer 3 proves syntactic cut elimination
with the height bound and the subformula property; it depends on Layer 1 and not on Layer 2.
Layer 4 proves Herbrand's theorem from Layers 2 and 3.

## Conventions

- **Languages and formulas.** `L : FirstOrder.Language.{u, v}` is arbitrary unless a statement says
  otherwise. Formulas are Mathlib's `L.Formula ℕ`, that is `L.BoundedFormula ℕ 0`: free variables are
  natural numbers and bound variables are the de Bruijn-style positions of
  `L.BoundedFormula ℕ n`, the quantifier `∀'` binding the last position. The primitives are
  `⊥`, equations `Term.equal`, relation atoms, implication `BoundedFormula.imp` and `∀'`; Mathlib
  defines `¬φ` as `φ → ⊥`, `φ ⊔ ψ` as `¬φ → ψ`, `φ ⊓ ψ` as `¬(φ → ¬ψ)` and `∃'φ` as `¬∀'¬φ`, and
  `BoundedFormula.exs` closes all bound positions existentially. Atomic means Mathlib's
  `BoundedFormula.IsAtomic` (equations and relation atoms, not `⊥`), quantifier-free means
  `BoundedFormula.IsQF`.
- **Sequents.** A sequent `Γ ⇒ Δ` is a pair of `Finset (L.Formula ℕ)`. Sets make exchange and
  contraction automatic; the principal formula of every logical rule stays available in the
  premises, and weakening is a lemma (1.3). Finite sets are needed: an infinite antecedent could use
  every variable and leave no eigenvariable for the right universal rule. Insertion of a formula
  uses classical decidable equality.
- **Instances.** For `φ : L.BoundedFormula ℕ k` and `ts : Fin k → L.Term ℕ`, `inst φ ts` replaces
  the bound positions by the terms; for one bound position it is written `φ[t]`. Since bound
  variables are positions, no capture can occur.
- **Semantics.** A sequent is valid when, in every structure `M` on a carrier in the universe
  `max u v`, every assignment `v : ℕ → M` that makes all of `Γ` true makes some formula of `Δ` true.
  An assignment `ℕ → M` exists only when `M` is nonempty, so validity is decided on nonempty
  structures, as Mathlib's `Theory.ModelsBoundedFormula` is; this is why `⇒ ∃x (x = x)` is valid
  and derivable.
- **Measures.** The depth of a formula counts nested implications and quantifiers, atoms and `⊥`
  having depth `0`. The cut rank of a derivation is the largest `depth φ + 1` over its cut formulas
  `φ`, and `0` when there is no cut. The height counts rules along the longest branch, initial
  sequents having height `0`. Depth and cut rank follow Gallier's degree and cut-rank, Definitions
  6.4.3 and 6.4.4, p. 262, adapted to these primitives.
- **Naming.** Every declaration lives in the namespace
  `TauCetiRoadmap.SequentCalculusAndCutElimination`; the derivation type is `LKDerivation`.

## Layer 1: the calculus

### 1.1 Instances and depth

Define `inst φ ts` as `φ.toFormula.subst (Sum.elim Term.var ts)`, and `depth` by recursion:
`depth (φ → ψ) = max (depth φ) (depth ψ) + 1`, `depth (∀'φ) = depth φ + 1`, and `0` otherwise.

- Realization of an instance: `(inst φ ts).Realize v` holds if and only if `φ.Realize v xs` with
  `xs i` the value of `ts i` under `v` (from Mathlib's `BoundedFormula.realize_subst` and
  `BoundedFormula.realize_toFormula`).
- Instances commute with substitution of terms for free variables, and the free variables of
  `inst φ ts` are those of `φ` together with those of the terms `ts i` at the bound positions `i`
  that occur in `φ` (for `φ = P(x₀)` with one vacuous bound position, `inst φ ![x₁]` has only `x₀`).
- `depth (inst φ ts) = depth φ`; an instance of an atomic formula is atomic, and an instance of a
  quantifier-free formula is quantifier-free.

**Checks.**
- `depth ⊥ = 0`, `depth (p → q) = 1` for atoms `p`, `q`, `depth ¬¬p = 2` and
  `depth (p ⊔ q) = depth ((p → ⊥) → q) = 2`: the defined connectives of Mathlib cost depth.
- For a binary relation `R` and `φ = R(x₀, #0)` with one bound position, `inst φ ![f(x₁)]` is
  `R(x₀, f(x₁))`; the free variable `x₀` is not touched.

*Needs:* Mathlib `BoundedFormula.toFormula`, `BoundedFormula.subst`,
`BoundedFormula.realize_subst`, `BoundedFormula.realize_toFormula`. (Proved here.)

### 1.2 Derivations

Define `LKDerivation Γ Δ`, a `Type`-valued inductive family with one constructor per rule:

- initial sequents `ax`: some atomic `φ` lies in `Γ` and in `Δ`; and `botL`: `⊥ ∈ Γ`;
- `impL`: if `φ → ψ ∈ Γ`, from `Γ ⇒ Δ, φ` and `Γ, ψ ⇒ Δ` infer `Γ ⇒ Δ`;
- `impR`: if `φ → ψ ∈ Δ`, from `Γ, φ ⇒ Δ, ψ` infer `Γ ⇒ Δ`;
- `allL`: if `∀'φ ∈ Γ`, from `Γ, φ[t] ⇒ Δ` infer `Γ ⇒ Δ`, for any term `t`;
- `allR`: if `∀'φ ∈ Δ` and the variable `y` occurs free in no formula of `Γ ∪ Δ`, from
  `Γ ⇒ Δ, φ[y]` infer `Γ ⇒ Δ`;
- the equality rules `ref`: from `Γ, t = t ⇒ Δ` infer `Γ ⇒ Δ`; and `repl`: if `s = t ∈ Γ`, `φ` is
  atomic with one bound position and `φ[s] ∈ Γ`, from `Γ, φ[t] ⇒ Δ` infer `Γ ⇒ Δ`;
- `cut`: from `Γ ⇒ Δ, φ` and `Γ, φ ⇒ Δ` infer `Γ ⇒ Δ`.

Here `Γ, φ` is `insert φ Γ`. Define `LKDerivation.height`, `LKDerivation.cutRank` and
`LKDerivation.formulas` (the formulas of all sequents of the derivation) by recursion. The rules for
`→` and `∀` are those of Buss's `LK` (Buss, Definition 2.3.2, p. 32, and §1.2 for the propositional
rules), with `⊥` handled by an initial sequent, written with sets of formulas as Gallier does for
`G1nnf`, where a principal formula may stay in the premise (Gallier, Definition 6.4.2, p. 259, and
the proof of Lemma 6.4.2, p. 261); the equality rules are reflexivity and replacement in
atomic formulas acting on the antecedent, in the form of Negri and von Plato's treatment of equality
in sequent calculus. Gallier's `G=` instead adds to the antecedent instances of the reflexivity and
congruence axioms (Gallier, Definition 5.6.2, pp. 227–228).

**Checks.**
- `p → q ⇒ p → q` is not an initial sequent, since initial sequents share an atomic formula; it has
  a derivation without cuts of height `2` (right implication, then left implication). With every
  formula allowed in initial sequents the inversion lemmas of 1.3 would fail on this sequent.
- `⇒ t = t` has a derivation of height `1` (`ref`, then `ax`), and `s = t ⇒ t = s` one of height `2`:
  `ref` adds `s = s`, and `repl` with `φ = (#0 = s)` rewrites `s = s` to `t = s`.
- Without the eigenvariable condition, `allR` with `y = 0` would derive `P(x₀) ⇒ ∀y P(y)` from the
  initial sequent `P(x₀) ⇒ ∀y P(y), P(x₀)` (the principal formula stays in the premise); that sequent is not valid (carrier `{0, 1}`, `P = {0}`,
  every variable sent to `0`).
- A derivation whose only cut is on `p → q` has cut rank `2`; one whose only cut is on an atom has
  cut rank `1`.

*Needs:* 1.1; Mathlib `BoundedFormula.IsAtomic`, `BoundedFormula.freeVarFinset`, `Term.equal`,
`Finset`. (Proved here.)

### 1.3 Structural lemmas

Prove, each for derivations of any cut rank and preserving both height and cut rank:

- *Weakening.* A derivation of `Γ ⇒ Δ` gives one of `Γ ∪ Γ' ⇒ Δ ∪ Δ'` (eigenvariables that occur
  in `Γ'` or `Δ'` are renamed first).
- *Substitution.* A derivation of `Γ ⇒ Δ` gives one of the sequent obtained by substituting a term
  `t` for a free variable `x` in every formula (after renaming the eigenvariables that occur in `t`
  or equal `x`).
- *Inversion.* From `Γ ⇒ Δ, φ → ψ` derive `Γ, φ ⇒ Δ, ψ`; from `Γ, φ → ψ ⇒ Δ` derive
  `Γ ⇒ Δ, φ` and `Γ, ψ ⇒ Δ`; from `Γ ⇒ Δ, ∀'φ` derive `Γ ⇒ Δ, φ[t]` for every term `t`. In each
  case the principal formula is removed from the given sequent, and the formulas inserted may
  already lie in `Γ` or `Δ`.

Prove also the *identity lemma*: `Γ ⇒ Δ` has a derivation without cuts whenever `Γ` and `Δ` share a
formula.

Route: induction on derivations (Gallier, Lemmas 6.4.4, 6.4.5 and 6.4.6, p. 265, for `G1nnf`).
Inversion uses that atoms, not compound formulas, close initial sequents; the right universal case
uses substitution to move the eigenvariable to `t`. The identity lemma is by induction on the depth of
the shared formula: an implication by right then left implication, a universal formula by the right rule at a
fresh variable and the left rule at that variable.

**Checks.**
- Inversion of `⇒ p → p` gives `p ⇒ p`, an initial sequent, in agreement with height preservation
  (`⇒ p → p` has height `1`).
- The left universal rule cannot be inverted at an arbitrary term with its principal formula
  removed: `∀x P(x) ⇒ P(x₀)` is derivable, while `P(x₁) ⇒ P(x₀)` is not valid (carrier `{0, 1}`,
  `P = {1}`, `x₁ ↦ 1`, `x₀ ↦ 0`); this is why the principal formula of `allL` stays in its premise.

*Needs:* 1.2. (Proved here, following the cited route.)

### Examples

The derivations named in the Checks: `p → q ⇒ p → q`, `⇒ t = t`, symmetry of equality, and the
failed derivation of `P(x₀) ⇒ ∀y P(y)` without the eigenvariable condition.

### Dependencies

Mathlib `BoundedFormula.toFormula`, `BoundedFormula.subst`, `BoundedFormula.realize_subst`,
`BoundedFormula.realize_toFormula`, `BoundedFormula.IsAtomic`, `BoundedFormula.freeVarFinset`,
`Term.equal`. No other layer.

## Layer 2: soundness and completeness

### 2.1 Validity and soundness

Define `Valid Γ Δ` as in the Conventions. Prove `LKDerivation.sound`: if `Γ ⇒ Δ` has a derivation,
then in every structure on a carrier in any universe, every assignment `v : ℕ → M` making all of `Γ`
true makes some formula of `Δ` true (Buss, Theorem 2.3.6 (1), p. 33; Gallier, Lemma 5.6.3, p. 230,
for his calculus with equality). In particular a derivable sequent is valid.

Route: induction on the derivation. For `allR`, the eigenvariable does not occur in the conclusion,
so the premise may be applied to the assignment updated at `y`; for `repl`, replacement holds
because the equation is interpreted as equality.

**Checks.**
- `P(x₀) ⇒ ∀y P(y)` and `⇒ x₀ = x₁` are not valid, so they have no derivation.
- `⇒ ∃x (x = x)`, that is `⇒ ¬∀x ¬(x = x)`, is valid because assignments exist only on nonempty
  carriers, and has a derivation of height `4`: right implication, left universal at `x₀`, left
  implication, and `ref` before the initial sequent `x₀ = x₀ ⇒ x₀ = x₀`.

*Needs:* 1.1, 1.2; Mathlib `Formula.Realize`, `BoundedFormula.realize_imp`,
`BoundedFormula.realize_all`, `Formula.realize_equal`. (Proved here.)

### 2.2 The consistency property of unrefutable sets

For a language with countably many function and relation symbols, let `C` be the family of finite
sets `s` of sentences of `L[[ℕ]]` (images of first-order sentences in Tau Ceti's infinitary syntax)
such that the sequent `s' ⇒ ∅`, where `s'` replaces each Henkin constant `c` by the free variable
`c`, has no derivation without cuts. Prove that `C` satisfies every clause of Tau Ceti's
`FirstOrder.Language.ConsistencyProperty`.

Route: the clauses for countable conjunctions and disjunctions are vacuous, since first-order
formulas have none. Each other clause is the contrapositive of a rule: `imp` and `not_imp` by
inversion and the implication rules, `all` by `allL`, `not_all` by inversion and `allR` at a Henkin
constant that does not occur in `s` (it exists because `s` is finite), `eq_refl` by `ref`,
`eq_subst` by `repl`, and `eq_name` by choosing a fresh constant `c`, substituting the term for `c`
(1.3) and applying `ref`. The clauses `no_falsum` and `no_contradiction` are `botL` and the
identity lemma. Henkin constants and free variables are matched by Mathlib's
`BoundedFormula.constantsVarsEquiv`.

**Checks.**
- The set `{∀x P(x), ¬P(c₀)}` is not in `C`: the left universal rule at `c₀`, then left implication,
  derives the corresponding sequent.
- The set `{¬∀x P(x)}` is in `C`; the clause `not_all` adds `¬P(c)` for a constant `c` that the set
  does not mention, and the structure `{0, 1}` with `P = {0}` and `c ↦ 1` satisfies the result.

*Needs:* 1.3, 2.1; Tau Ceti `FirstOrder.Language.ConsistencyProperty`, `BoundedFormula.toOmega`;
Mathlib `BoundedFormula.constantsVarsEquiv`. (Proved here, following the cited route.)

### 2.3 Completeness of the cut-free calculus

Prove `exists_cutRank_eq_zero_of_valid`: every valid sequent `Γ ⇒ Δ`, over any language, has a
derivation of cut rank `0` (Buss, Theorem 2.3.7 (1), p. 33, for languages without equality; Gallier,
Theorem 5.6.1, p. 232, for his calculus with equality).

Consequently cut is admissible: by 2.1 and this theorem, a sequent with a derivation has one without
cuts. Layer 3 gives the same conclusion syntactically, with a bound.

Route: the sequent mentions finitely many symbols; restrict it to Tau Ceti's `symbSublang` of those
symbols, a countable language (restriction of formulas extends `Term.restrictSymbols`). Suppose the
restricted sequent has no derivation without cuts. By inversion (1.3) neither has `Γ, ¬Δ ⇒ ∅`, where
`¬Δ` is the set of negations of the formulas of `Δ`. Hence the formulas of `Γ` and `¬Δ`, with
variables read as Henkin constants, form a member of the consistency property of 2.2, and Tau Ceti's `ConsistencyProperty.model_existence` gives a nonempty model in the
universe `max u v`. Reading the value of `x` as the interpretation of the constant `x`, every formula
of `Γ` is true and every formula of `Δ` false; expanding the model to `L` with arbitrary
interpretations of the other symbols (the carrier is nonempty) contradicts validity. A derivation in
the sublanguage maps to one in `L` along `symbSublangIncl` by `LHom.onFormula`.

**Checks.**
- `s = t, P(s) ⇒ P(t)` is valid; a derivation without cuts uses `repl`. Without the equality rules
  the calculus would be sound for structures that interpret `=` by an arbitrary binary relation,
  and such a structure falsifies this sequent; so the equality rules are needed for completeness.
- The excluded middle `⇒ p ⊔ ¬p` and Peirce's law `⇒ ((p → q) → p) → p` have derivations without
  cuts, the second of height `3`, which is its least height.

*Needs:* 1.3, 2.2; Tau Ceti `ConsistencyProperty.model_existence`, `BoundedFormula.realize_toInf`,
`symbSublang`, `symbSublangIncl`, `Term.restrictSymbols`; Mathlib `BoundedFormula.constantsVarsEquiv`,
`LHom.onFormula`, `LHom.realize_onFormula`.
(Proved here, following the cited route.)

### 2.4 Completeness for theories

Prove `models_iff_exists_cutRank_eq_zero`: for a theory `T` and a sentence `φ`, `T ⊨ᵇ φ` holds if
and only if some finite `T₀ ⊆ T` has a derivation of cut rank `0` of the sequent `T₀ ⇒ φ`, with
sentences read as formulas by `Formula.relabel Empty.elim` (Buss, Theorem 2.3.7 (2), p. 33, for
languages without equality).

Route: by Mathlib's `Theory.models_iff_finset_models` a finite `T₀` entails `φ`; the sequent is then
valid, and 2.3 applies. Conversely, 2.1 applied in a nonempty model of `T` and any assignment gives
`φ`.

**Checks.**
- With `T = ∅` and `φ = ∃x (x = x)`, both sides hold: Mathlib's models are nonempty, and the
  derivation of 2.1 applies.
- With `T = {∀x P(x)}` and `φ = ∀x P(x)`, the finite set `T₀ = T` works, with a derivation of
  height `2` (`allR` at a fresh variable, then `allL` at it).

*Needs:* 2.1, 2.3; Mathlib `Theory.ModelsBoundedFormula`, `Theory.models_iff_finset_models`,
`Formula.relabel`. (Proved here.)

### Examples

The sequents of the Checks: `⇒ ∃x (x = x)`, `s = t, P(s) ⇒ P(t)`, Peirce's law, and the members and
non-members of the consistency property of 2.2.

### Dependencies

Layer 1. Mathlib `Formula.Realize`, `BoundedFormula.realize_imp`, `BoundedFormula.realize_all`,
`Formula.realize_equal`, `BoundedFormula.constantsVarsEquiv`, `LHom.onFormula`,
`LHom.realize_onFormula`, `Theory.ModelsBoundedFormula`, `Theory.models_iff_finset_models`,
`Formula.relabel`; Tau Ceti `FirstOrder.Language.ConsistencyProperty`,
`ConsistencyProperty.model_existence`, `BoundedFormula.toOmega`, `BoundedFormula.realize_toInf`,
`symbSublang`, `symbSublangIncl`, `Term.restrictSymbols`.

## Layer 3: syntactic cut elimination

### 3.1 The reduction lemma

Let `A` be a formula, and let `d₁` derive `Γ ⇒ Δ, A` and `d₂` derive `Γ, A ⇒ Δ`, both of cut rank at
most `depth A`, of heights `h₁` and `h₂`. Prove that `Γ ⇒ Δ` has a derivation of cut rank at most
`depth A` and height at most `h₁ + h₂ + 1`.

Route: if `h₁ = 0` or `h₂ = 0` and `A` is compound, the initial sequent does not use `A`, so
`Γ ⇒ Δ` is initial. If `A` is atomic or `⊥`, it can occur on the right of `d₁` only through
initial sequents: induct on `d₁`, carrying weakenings of `d₂` (1.3) up the derivation and replacing
an initial sequent that uses `A` by the weakening of `d₂` with the same context (then `A` lies in
that antecedent). If `A = φ → ψ`, invert both derivations (1.3) and cut on `φ` and on `ψ`, both of
smaller depth: the height is at most `max h₁ h₂ + 2`. If `A = ∀'φ`, induct on `d₂`; at a left
universal rule on `A` with term `t`, cut on `φ[t]` against the inversion of `d₁` at `t`. Gallier
proves the bound `h₁ + h₂` for his calculus `G1nnf` of formulas in negation normal form, where every
principal case needs one cut (Gallier, Lemma 6.4.7, p. 266); here an implication needs two, and the
additional `1` absorbs the second.

**Checks.**
- On every sequent built from the eight formulas `p`, `q`, `⊥`, `p → q`, `(p → q) → p`,
  `((p → q) → p) → p`, `¬p`, `¬¬p`, with least heights computed over derivations using only these
  formulas, the least height of `Γ ⇒ Δ` at cut rank `depth A` is at most `h₁ + h₂` whenever `A` is
  one of them; so the bound holds there with room to spare.

*Needs:* 1.3. (Proved here, following the cited route.)

### 3.2 Lowering the cut rank by one

Prove: a derivation of height `h` and cut rank at most `c + 1` can be replaced by a derivation of
the same sequent of cut rank at most `c` and height at most `2 ^ h - 1`.

Route: induction on the derivation (Gallier, proof of Theorem 6.4.1, p. 268). A rule other than a cut
of depth `c` is applied to the transformed premises, of height at most `2 ^ (h - 1) - 1`, giving
height at most `2 ^ (h - 1) ≤ 2 ^ h - 1`. A cut of depth `c` is replaced by 3.1 applied to the
transformed premises: `2 * (2 ^ (h - 1) - 1) + 1 = 2 ^ h - 1`. An initial sequent keeps height `0`.

**Checks.**
- On the sequents of the Check of 3.1, the least height at cut rank `c` is at most `2 ^ h - 1`
  where `h` is the least height at cut rank `c + 1`, for `c ≤ 3`.

*Needs:* 3.1. (Proved here, following the cited route.)

### 3.3 Cut elimination

Define `tower` by `tower 0 h = h` and `tower (c + 1) h = 2 ^ tower c h`. Prove
`LKDerivation.exists_cutRank_eq_zero_height_le`: every derivation `d` of `Γ ⇒ Δ` can be replaced by
a derivation of `Γ ⇒ Δ` of cut rank `0` and height at most `tower (cutRank d) (height d)` (Gallier,
Theorem 6.4.1, p. 268, which states this bound, with his function `exp(2, c, h)`, for `G1nnf`
without equality; the size bound of Buss, Theorem 2.4.2, p. 37, measures proofs by their number of
strong inferences rather than their height and is not stated here).

Route: apply 3.2 `cutRank d` times; `tower` is monotone in `h`.

**Checks.**
- `tower 0 h = h`, `tower 1 3 = 8`, `tower 2 2 = 16`, `tower 2 3 = 256`.
- The identity sequent `¬¬p ⇒ ¬¬p` has least height `4` without cuts and a derivation of height `3`
  with one cut, on the atom `p` (cut rank `1`), through `¬¬p ⇒ p` and `p ⇒ ¬¬p`, each of height `2`;
  `4 ≤ tower 1 3 = 8`.
- On the sequents of the Check of 3.1 the least height without cuts is at most
  `tower c h` for every sequent of least height `h` at cut rank `c ≤ 4`.

*Needs:* 3.2. (Proved here, following the cited route.)

### 3.4 The subformula property

Define `IsSubformulaInstance S`: the least set of formulas containing `S`, both sides of each of its
implications, and every instance `φ[t]` of each of its universal formulas `∀'φ`. Prove
`LKDerivation.subformula_property`: every formula occurring in a derivation of cut rank `0` of
`Γ ⇒ Δ` is atomic or a subformula instance of `Γ ∪ Δ` (Buss, Proposition 1.2.4, p. 13, states the
subformula property for cut-free propositional proofs; Gallier, §5.6, p. 233, explains why equality
rules allow new atomic formulas, which is why atomic formulas are exempted here).

Route: induction on the derivation; every rule other than cut puts into its premises subformula
instances of its principal formula, and the equality rules put atomic formulas.

**Checks.**
- One cut-free derivation of `⇒ ∃x (P(x) → P(f(x)))` uses the instances `P(x₀) → P(f(x₀))` and
  `P(f(x₀)) → P(f(f(x₀)))`, whose terms do not occur in the end sequent: the property is about
  instances, not literal subformulas.
- With cuts it fails: a cut on a formula `θ` (from `⇒ p → p, θ` and `θ ⇒ p → p`, both
  derivable by weakening) puts `θ` into a derivation of `⇒ p → p`, and for `θ = ∀x P(x)` this
  formula is neither atomic nor a subformula instance of `p → p`.

*Needs:* 1.2. (Proved here.)

### Examples

The sequents `¬¬p ⇒ ¬¬p`, `¬¬p ⇒ p` and Peirce's law with their heights at each cut rank, and the
cut-free derivation of `⇒ ∃x (P(x) → P(f(x)))`.

### Dependencies

Layer 1. No other layer and no library declaration beyond those of Layer 1.

## Layer 4: Herbrand's theorem

### 4.1 Valid formulas, disjunctions and tautologies

Define `IsValid φ` as `Valid ∅ {φ}`; `disjunction l` as the right fold of Mathlib's `⊔` over the list
`l` ending in `⊥`; `truthValue τ φ` for `τ : (n : ℕ) → L.BoundedFormula ℕ n → Prop`, with `⊥` false,
implication material, and every other formula (atomic or universal) given its value by `τ`;
`IsTautology φ` as truth under every `τ`; and `IsEqualityFree φ`, no atomic subformula of `φ` being an
equation.

**Checks.**
- `IsTautology (disjunction [p, ¬p])` holds for a nullary relation atom `p`.
- `IsTautology (disjunction [t = t])` fails (give the atom `t = t` the value false), while
  `IsValid (t = t)` holds: an equation is an atom for truth values and true in every structure.
- `disjunction [] = ⊥`, which is not valid, since every structure with an assignment falsifies it.

*Needs:* 2.1; Mathlib `BoundedFormula.IsQF`. (Proved here.)

### 4.2 Herbrand's theorem

Prove `herbrand`: for `φ : L.BoundedFormula ℕ k` quantifier-free, `IsValid φ.exs` holds if and only
if some list `l` of `k`-tuples of terms has `IsValid (disjunction (l.map (inst φ)))` (Buss, Herbrand's
Theorem 2.5.1, p. 48, with the empty theory and the free variables in the role of his variables
`x⃗`; Gallier, Theorem 7.5.1, p. 330, for prenex sequents).

Route: the backward direction is semantic: an instance true under `v` gives a witness tuple. For the
forward direction take a derivation without cuts of `⇒ φ.exs` (2.3). By 3.4 every formula in it is
atomic, quantifier-free, or an instance of an existential stage `∃x ψ = ¬∀x ¬ψ` of `φ.exs`, of the
universal formula `∀x ¬ψ` inside it, or of the negation of a stage; the stages occur only in
succedents and the other two kinds only in antecedents. By induction on the derivation, removing
these formulas and collecting the terms introduced by left universal rules on them gives a
derivable sequent whose succedent is enlarged by finitely many instances of `φ` (Buss, proof of Theorem 2.5.1, pp. 48–49).

**Checks.**
- For `φ(x) = P(x) → P(f(x))` the formula `∃x φ` is valid; no single instance is valid, and the two
  instances at `x₀` and `f(x₀)` have a valid disjunction: if `P(x₀) → P(f(x₀))` fails then
  `P(f(x₀))` is false, so `P(f(x₀)) → P(f(f(x₀)))` holds.
- Quantifier-freeness is needed: in the language with one unary relation `P`, the drinker formula
  `∃x (P(x) → ∀y P(y))` is valid, but no finite disjunction of its instances `P(t) → ∀y P(y)` is
  (terms are variables; send them all to `0` in `{0, 1}` with `P = {0}`).

*Needs:* 1.1, 2.1, 2.3, 3.4; Mathlib `BoundedFormula.exs`, `BoundedFormula.realize_exs`,
`BoundedFormula.IsQF`. (Proved here, following the cited route.)

### 4.3 Herbrand's theorem for equality-free formulas

Prove `herbrand_isTautology`: for `φ` quantifier-free and equality-free, `IsValid φ.exs` holds if and
only if some list `l` of `k`-tuples of terms has `IsTautology (disjunction (l.map (inst φ)))` (Buss,
the paragraph after the proof of Theorem 2.5.1, p. 49: a quantifier-free consequence that does not
involve equality is tautologically valid).

Route: from 4.2. A tautology is valid, by evaluating atoms in the structure. Conversely, given `τ`,
take the structure on the terms `L.Term ℕ` (lifted to the universe `max u v`) in which function
symbols build terms and a relation holds of a tuple when `τ` makes the corresponding atom true; at
the assignment `x ↦ x` an equality-free quantifier-free formula is true exactly when `truthValue τ`
makes it true.

**Checks.**
- Equality-freeness is needed: `∃x (x = x)` is valid, and no disjunction of instances `t = t` is a
  tautology, by the Check of 4.1.
- The disjunction of the two instances in the first Check of 4.2 is a tautology in the three atoms
  `P(x₀)`, `P(f(x₀))`, `P(f(f(x₀)))`.

*Needs:* 4.2; Mathlib `Term.realize`, `BoundedFormula.IsQF`. (Proved here, following the cited
route.)

### Examples

`∃x (P(x) → P(f(x)))` with its two-instance Herbrand disjunction; the drinker formula, which has no
Herbrand disjunction because it is not quantifier-free; and `∃x (x = x)`, which has a valid but not
tautological one.

### Dependencies

Layers 1, 2 and 3 (3.4). Mathlib `BoundedFormula.exs`, `BoundedFormula.realize_exs`,
`BoundedFormula.IsQF`, `Term.realize`.

## Scope and ownership

This roadmap owns the targets stated above: instances and depth of Mathlib formulas, the derivations
of the sequent calculus with equality and their structural lemmas, soundness, the consistency
property of unrefutable sets, completeness of the cut-free calculus for sequents and for theories,
the reduction lemma, cut elimination with the tower bound on heights, the subformula property, and
Herbrand's theorem in its two forms.

Already in the libraries and therefore not targets:

- Mathlib's syntax and semantics of first-order logic, the compactness theorem
  (`Theory.isSatisfiable_iff_isFinitelySatisfiable`) and its consequence that semantic entailment
  is witnessed by finite subtheories (`Theory.models_iff_finset_models`). Mathlib has no proof system
  and no completeness theorem for one.
- Tau Ceti's consistency properties and their model existence theorem, the implementation of
  InfinitaryModelExistence Layer 3, which 2.2 and 2.3 consume; its infinitary syntax, which contains
  first-order logic through `BoundedFormula.toInf` and `BoundedFormula.toOmega`; and its symbol
  sublanguages.

Left to other roadmaps:

- InfinitaryModelExistence (on main) owns model existence for consistency properties (its Layer 3)
  and Craig, Lyndon and Malitz interpolation, proved model-theoretically (its Layer 7). Interpolation
  is not restated here, and neither is a deductive calculus for infinitary logic, which that roadmap
  excludes.
- Propositional resolution and its completeness for clause sets, the subject of
  PropositionalSatisfiability (an open roadmap, not on main), are not treated here. Nothing here
  concerns resolution or clauses; the propositional
  tautologies of 4.1 are truth under assignments to atoms of first-order formulas. This roadmap does
  not depend on that one.

Outside the scope: Gentzen's midsequent theorem, Craig and Beth through cut-free proofs, the size
bound of Buss, Theorem 2.4.2, and lower bounds on the length of cut-free proofs, Skolemization,
Herbrand's theorem for universal theories and for formulas that are not prenex, intuitionistic and
linear sequent calculi, ordinal analysis and arithmetic, infinitary calculi, resolution, and every
proof-search procedure.

An outside Lean 4 formalization of a sequent calculus with cut elimination and completeness over its
own syntax is FormalizedFormalLogic/Foundation (`Foundation/FirstOrder/LK/Hauptsatz.lean`,
`Foundation/FirstOrder/LK/Completeness/CanonicalModel.lean`); it is reference material only.

## Exact supplier contracts

### From Mathlib

- `Mathlib/ModelTheory/Syntax.lean`: `BoundedFormula` with `falsum`, `equal`, `rel`, `imp`, `all`;
  `Term.equal` (the equation of two terms as a formula); `BoundedFormula.toFormula` (bound positions
  become free variables `Sum.inr i`); `BoundedFormula.subst` (substitution of terms for free
  variables); `BoundedFormula.freeVarFinset` (for `[DecidableEq α]`, the free variables);
  `BoundedFormula.exs` (existential closure of all bound positions); `Formula.relabel`;
  `BoundedFormula.constantsVarsEquiv` (`L[[γ]].BoundedFormula α n ≃ L.BoundedFormula (γ ⊕ α) n`).
- `Mathlib/ModelTheory/Complexity.lean`: `BoundedFormula.IsAtomic` (equations and relation atoms),
  `BoundedFormula.IsQF`.
- `Mathlib/ModelTheory/Semantics.lean`: `Formula.Realize`, `BoundedFormula.realize_imp`,
  `BoundedFormula.realize_all`, `Formula.realize_equal`, `BoundedFormula.realize_subst`,
  `BoundedFormula.realize_toFormula`, `BoundedFormula.realize_exs`, `Term.realize`,
  `Theory.ModelsBoundedFormula` (`T ⊨ᵇ φ`: every nonempty model of `T` in the universe of `L`
  satisfies `φ` under every assignment).
- `Mathlib/ModelTheory/LanguageMap.lean`: `LHom.onFormula`, `LHom.realize_onFormula` (for an
  expansion, realization of the image equals realization of the formula).
- `Mathlib/ModelTheory/Satisfiability.lean`: `Theory.models_iff_finset_models`
  (`T ⊨ᵇ φ ↔ ∃ T₀ : Finset, ↑T₀ ⊆ T ∧ ↑T₀ ⊨ᵇ φ`).

### From Tau Ceti

- `TauCeti/ModelTheory/ModelExistence/ConsistencyProperty.lean`:
  `FirstOrder.Language.ConsistencyProperty` (families of sets of `L_{ω₁ω}` sentences of `L[[ℕ]]`
  without `⊥` or a sentence with its negation, closed under the clauses `imp`, `not_imp`, `iInf`,
  `not_iInf`, `iSup`, `not_iSup`, `all`, `not_all`, `eq_refl`, `eq_subst` for atomic formulas, and
  `eq_name`).
- `TauCeti/ModelTheory/ModelExistence/ModelExistence.lean`: `ConsistencyProperty.model_existence`
  (with `[Countable (Σ n, L.Functions n)]` and `[Countable (Σ n, L.Relations n)]`, a countable member
  has a countable nonempty model in any universe whose elements are all named by Henkin constants).
- `TauCeti/ModelTheory/Infinitary/Syntax.lean`: `BoundedFormula.toInf` (it sends the five
  first-order constructors to their infinitary counterparts, so its image has no countable
  conjunctions or disjunctions), `BoundedFormula.toOmega`; `TauCeti/ModelTheory/Infinitary/Semantics.lean`:
  `BoundedFormula.realize_toInf`.
- `TauCeti/ModelTheory/Sublanguage.lean`: `symbSublang` (the sublanguage with given symbols),
  `symbSublangIncl` (its injective inclusion), the countability instances for countable symbol
  sets, and `Term.restrictSymbols`.

## References

- Samuel R. Buss, *An introduction to proof theory*, in *Handbook of Proof Theory* (S. R. Buss, ed.),
  Elsevier, 1998, pp. 1–78; the author's copy (`mathweb.ucsd.edu/~sbuss/ResearchWeb/handbookI/`,
  `ChapterI.pdf`), with the printed page numbers: Proposition 1.2.4 (p. 13), Definition 2.3.2
  (p. 32), Theorems 2.3.6 and 2.3.7 (p. 33), Theorem 2.4.2 (p. 37), Theorem 2.5.1 and its proof
  with the following paragraph (pp. 48–49). The author's page records an erratum to the proof of
  Theorem 2.5.3, which is not used here.
- Jean H. Gallier, *Logic for Computer Science: Foundations of Automatic Theorem Proving*, second
  edition, Dover, 2015, the author's PDF (`www.seas.upenn.edu/~jean/Logic-for-CS-2015.pdf`):
  Definition 5.6.2 (pp. 227–228), Lemma 5.6.3 (p. 230), Theorem 5.6.1 (p. 232), §5.6 (p. 233),
  Definitions 6.4.2 (p. 259), 6.4.3 and 6.4.4 (p. 262), Lemmas 6.4.4–6.4.6 (p. 265), Lemma 6.4.7
  (p. 266), Theorem 6.4.1 and the function `exp(m, n, p)` (p. 268), Theorem 7.5.1 (p. 330).
- S. Negri and J. von Plato, *Cut elimination in the presence of axioms*, Bulletin of Symbolic
  Logic 4 (1998), the source of the reflexivity and replacement rules for equality; named in prose,
  without a locator.
- The results go back to Gentzen (1935) for cut elimination, Gödel (1930) for completeness and
  Herbrand (1930) for Herbrand's theorem, as the two texts above attribute them.
