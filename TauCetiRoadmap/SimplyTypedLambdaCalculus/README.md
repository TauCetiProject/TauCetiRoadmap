# Roadmap: the simply typed lambda calculus

**Summary.** The λ-calculus is a calculus of functions in which a term is a variable, an
application of one term to another, or an abstraction that binds a variable, and in which
computation is β-reduction: an applied abstraction `(λx. s) t` is replaced by `s` with `t`
substituted for `x`. This roadmap builds the untyped λ-calculus with variables written as de
Bruijn indices, so that bound variables have no names and renaming them is never needed. On top of
it, it builds simple types over an arbitrary set of base types, assigned to untyped terms by
typing rules in a context that lists the types of the free variables (typing in the style of
Curry). Every statement is about these terms, their reductions and their types; no reduction
strategy, evaluator or type-checking procedure is specified.

The main theorems are these.

- *The Church–Rosser theorem.* If a term reduces in finitely many β-steps to `u` and to `v`, then
  `u` and `v` reduce to a common term. Consequently two terms are β-convertible exactly when they
  have a common reduct, and two β-convertible terms without β-redexes are equal, so a term has at
  most one β-normal form. The first statement also holds for βη-reduction, where η contracts
  `λx. f x` to `f` when `x` is not free in `f`.
- *Subject reduction.* If a term has type `A` in a context `Γ`, every term it β-reduces or
  η-reduces to has type `A` in `Γ`. The converse fails: an untypable term can reduce to a typable
  one.
- *Strong normalization.* A term that has a simple type in some context admits no infinite
  β-reduction sequence. Hence every typed term reduces to exactly one β-normal form. Untyped terms
  need not normalize: `(λx. x x)(λx. x x)` reduces only to itself, and `λx. x x` has no simple
  type.

The roadmap builds on Mathlib's theory of binary relations: reflexive transitive closures,
joinability, equivalence closures and a criterion for the Church–Rosser property of an abstract
reduction relation. Strong normalization is Mathlib's accessibility predicate for the converse of
β-reduction, and Mathlib's characterization of accessibility by descending chains turns it into
the absence of infinite reduction sequences. Neither Mathlib nor Tau Ceti has λ-terms.

Layer 1 below defines terms, shifting of indices and substitution, and proves the substitution
lemmas. Layer 2 defines β-reduction and the parallel reduction of Tait and Martin-Löf, and proves
the Church–Rosser theorem. Layer 3 treats normal forms, strong normalization and β-convertibility.
Layer 4 introduces simple types and proves weakening, the typing substitution lemma and subject
reduction. Layer 5 proves strong normalization by Tait's reducibility method with Girard's
conditions on reducibility candidates. Layer 6 adds η-reduction, the Church–Rosser theorem for
βη-reduction and subject reduction for η.

## Conventions

- **Terms.** `Term` has three constructors: `Term.var i` for `i : ℕ`, `Term.app s t` and
  `Term.lam t`. The index `i` refers to the `i`-th enclosing `lam` counted outward from the
  occurrence, starting at `0`; an index at least the number of enclosing binders is free, and the
  free index `i` under `n` binders stands for the free variable numbered `i − n`. Two terms that
  differ only by the names of bound variables in the usual notation are equal as `Term`s. In
  examples, `λx. x` is `lam (var 0)`, `λx. λy. x` is `lam (lam (var 1))`, and the free variable `z`
  is `var 0` outside every binder.
- **Shifting and substitution.** `Term.shift t k` adds one to every free index of `t` that is at
  least `k`, where `k` is incremented under each binder. `Term.subst t s k` replaces the index `k`
  of `t` by `s`, lowers every index above `k` by one, and keeps every index below `k`; under a
  binder it substitutes `Term.shift s 0` for `k + 1`. So β-reduction contracts `app (lam s) t` to
  `Term.subst s t 0`: the bound index disappears, the free indices of `s` above it come down by one,
  and the free indices of `t` are protected from capture by the shifts. Natural-number subtraction
  occurs only as `i − 1` with `k < i`, where it does not truncate.
- **Relations.** Multi-step reduction is Mathlib's `Relation.ReflTransGen`, joinability is
  `Relation.Join`, and β-convertibility is `Relation.EqvGen Beta`. A term is β-normal, `IsNormal t`,
  when it has no β-reduct. It is strongly normalizing, `SN t`, when it is accessible (`Acc`) for the
  converse relation `fun u v => Beta v u`; by Mathlib's `not_acc_iff_exists_descending_chain` this
  holds exactly when no sequence `f : ℕ → Term` with `f 0 = t` has `Beta (f n) (f (n + 1))` for
  every `n`. A term is weakly normalizing when it reduces to some β-normal term.
- **Types and contexts.** `Ty ι` has constructors `Ty.base a` for `a : ι` and `Ty.arrow A B`; the
  type `ι` of base types is arbitrary. A context is a list `Γ : List (Ty ι)` whose entry `i`,
  `Γ[i]?`, is the type of the free index `i`; the head of the list is the most recently bound
  variable, and an index at least `Γ.length` has no type. `HasType Γ t A` is generated by three
  rules: an index has the type its entry gives; if `s` has type `Ty.arrow A B` and `t` has type `A`,
  then `app s t` has type `B`; if `t` has type `B` in `A :: Γ`, then `lam t` has type
  `Ty.arrow A B` in `Γ`. Abstractions carry no type, so one term may have many types. Inserting a
  type `B` at position `k` of a context is `Γ.insertIdx k B` from the Lean core library; for
  `k > Γ.length` it returns `Γ` unchanged.
- **Reading.** Under the Curry–Howard correspondence a simple type is a formula of minimal
  implicational logic, a typed term is a natural-deduction proof of its type from the assumptions in
  the context, and β-reduction removes an introduction of an implication immediately followed by its
  elimination; strong normalization then says that every such proof normalizes. This reading is
  background only: no statement below is about formulas or proofs.

## Layer 1: terms, shifting and substitution

### 1.1 Terms, shifting and substitution

Define `Term`, `Term.shift` and `Term.subst` as in the Conventions. These are the de Bruijn forms of
terms and of capture-avoiding substitution (Selinger, §2.3, pp. 15–17, for substitution on named
terms; the nameless notation is de Bruijn's, 1972). (Proved here.)

**Checks.**
- `Term.shift (lam (app (var 0) (var 1))) 0 = lam (app (var 0) (var 2))`: the bound index `0` is
  unchanged and the free index `1`, which is the free variable `0` seen under one binder, becomes
  `2`.
- `Term.subst (lam (var 1)) (var 0) 0 = lam (var 1)`. This is the β-reduct of
  `app (lam (lam (var 1))) (var 0)`, that is of `(λx. λy. x) z`, and it is `λy. z`. A substitution
  that did not shift `s` under the binder would give `lam (var 0)`, the identity `λy. y`: the
  variable `z` would be captured.
- `Term.subst (var 2) s 1 = var 1`, `Term.subst (var 1) s 1 = s` and `Term.subst (var 0) s 1 = var 0`
  for every `s`: indices above the substituted one come down, indices below it stay.

*Needs:* nothing beyond the definitions.

### 1.2 The substitution lemmas

Prove `Term.subst_subst`: for `i ≤ j` and all terms `t`, `u`, `v`,

    (t.subst (v.shift i) (j + 1)).subst (u.subst v j) i = (t.subst u i).subst v j.

This is the de Bruijn form of the named substitution lemma `t[u/x][v/y] = t[v/y][u[v/y]/x]` for
`x ≠ y` with `x` not free in `v`, which Selinger uses in the proof of Lemma 4.7, p. 34. Prove alongside
it the companion identities, each by induction on `t`:

- a substitution at `k` undoes a shift at `k`: `(t.shift k).subst s k = t` for every `s`;
- shifts commute: for `i ≤ k`, `(t.shift i).shift (k + 1) = (t.shift k).shift i`;
- shifts pass through substitutions: for `j ≤ i`,
  `(t.subst s j).shift i = (t.shift (i + 1)).subst (s.shift i) j`, and for `i ≤ j`,
  `(t.subst s j).shift i = (t.shift i).subst (s.shift i) (j + 1)`.

Define the simultaneous substitution `Term.substAll t σ` for `σ : ℕ → Term`: it replaces each free
index `i` of `t` by `σ i`, and under a binder it keeps the index `0` and sends `i + 1` to
`(σ i).shift 0`. It is the form of substitution used in Layer 5. Its API, each by induction on `t`:

- `t.substAll Term.var = t`;
- `t.subst s k = t.substAll σ` for the `σ` with `σ i = var i` for `i < k`, `σ k = s` and
  `σ i = var (i − 1)` for `i > k`;
- for every `σ` and `u`, substituting `u` for `0` in `t.substAll σ'`, where `σ'` is the map used
  under a binder (`σ' 0 = var 0`, `σ' (i + 1) = (σ i).shift 0`), gives `t.substAll σ''` with
  `σ'' 0 = u` and `σ'' (i + 1) = σ i`.

Route: induction on `t`, generalizing the indices. The variable case of `Term.subst_subst` uses
that a substitution at `k` undoes a shift at `k`; the abstraction case uses the commutation of
shifts with `i = 0`, applied to `v`, and the second shift–substitution identity with `i = 0`,
applied to `u`. The first shift–substitution identity is used in 2.1.
(Proved here.)

**Checks.**
- The hypothesis `i ≤ j` is needed: for `t = var 0`, `u = var 0`, `v = var 1`, `i = 1`, `j = 0`
  the left side is `var 0` and the right side is `var 1`.
- The shift of `v` is needed: for `t = var 1`, `u = var 0`, `v = var 1` and `i = j = 0` both sides
  are `var 1`, while the left side with `v` in place of `v.shift i` is `var 0`.
- The index `j + 1` is needed: for `t = var 0`, `u = var 1`, `v = var 1` and `i = j = 0` both
  sides are `var 0`, while the left side with `j` in place of `j + 1` is `var 1`.
- `(lam (lam (var 1))).substAll Term.var = lam (lam (var 1))` and
  `(lam (app (var 2) (var 0))).substAll (fun i => var (i + 10)) = lam (app (var 12) (var 0))`:
  the free index `2` under one binder is the free variable `1`, sent to `var 11` and shifted once.

*Needs:* 1.1. (Proved here.)

### Examples

The identity `λx. x`, the constants `λx. λy. x` and `λx. λy. y`, the term `S = λx. λy. λz. x z (y z)`,
which is `lam (lam (lam (app (app (var 2) (var 0)) (app (var 1) (var 0)))))`, and the
self-application `δ = λx. x x`, which is `lam (app (var 0) (var 0))`, with their shifts and
substitutions computed from the definitions.

### Dependencies

No library declaration beyond the natural numbers. No other layer.

## Layer 2: β-reduction and the Church–Rosser theorem

### 2.1 β-reduction

Define `Beta` as the least relation containing `Beta (app (lam s) t) (s.subst t 0)` and closed
under the three term formers: from `Beta s s'` infer `Beta (app s t) (app s' t)` and
`Beta (lam s) (lam s')`, and from `Beta t t'` infer `Beta (app s t) (app s t')` (Selinger, §2.5,
p. 18, rules (β), (cong1), (cong2) and (ξ)). Its API, each by induction on the reduction:

- β-reduction commutes with shifting: `Beta t u` implies `Beta (t.shift k) (u.shift k)`;
- β-reduction commutes with substitution in the first argument: `Beta t u` implies
  `Beta (t.subst s k) (u.subst s k)`;
- β-reduction of the substituted term gives multi-step reduction: `Beta s s'` implies that
  `t.subst s k` reduces in finitely many steps to `t.subst s' k` (several copies of `s`, or none,
  may occur).

Route: the redex case of the second item is `Term.subst_subst` with `i = 0`; the first item uses
the shift–substitution identity of 1.2 with `j = 0`. (Proved here.)

**Checks.**
- `Beta (app (lam (lam (var 1))) (var 0)) (lam (var 1))`, by the second Check of 1.1.
- `Ω = app δ δ` with `δ = lam (app (var 0) (var 0))` has exactly one β-reduct, `Ω` itself.
- One β-step does not close diamonds. The term `(λx. x x)((λy. y) z)`, which is
  `app δ (app (lam (var 0)) (var 0))`, has the two reducts `app δ (var 0)` and
  `app (app (lam (var 0)) (var 0)) (app (lam (var 0)) (var 0))`, and these have no common one-step
  reduct; both reach `app (var 0) (var 0)`, the first in one step and the second in two (Selinger,
  §4.3, p. 30, explains why this blocks the naive proof).

*Needs:* 1.1, 1.2 (`Term.subst_subst` and the shift identities). (Proved here.)

### 2.2 Parallel reduction and the complete development

Define `ParRed`, the parallel reduction of Tait and Martin-Löf: the least relation with
`ParRed (var i) (var i)`, closed under `app` and `lam` componentwise, and containing
`ParRed (app (lam s) t) (s'.subst t' 0)` whenever `ParRed s s'` and `ParRed t t'` (Selinger,
§4.4, p. 32, rules (1)–(4); rule (5) there is the η-case of Layer 6). Define the complete
development `develop t`, which contracts every redex present in `t`: it commutes with `var`, `lam`
and with `app s t` when `s` is not an abstraction, and sends `app (lam s) t` to
`(develop s).subst (develop t) 0`.

- `reflTransGen_parRed_iff`: `ReflTransGen ParRed t u ↔ ReflTransGen Beta t u` (Selinger,
  Lemma 4.6, pp. 32–33, for βη; the case of β alone drops rule (5)).
- `ParRed.parRed_develop`: if `ParRed t u`, then `ParRed u (develop t)`. So parallel reduction has
  the diamond property, with the complete development as a common reduct (Selinger, Lemmas 4.8 and
  4.9, pp. 35–36, for βη, where the maximal parallel reduct plays the role of `develop`; the
  complete development is Takahashi's, 1995).

API: `ParRed` is reflexive; `Beta` is contained in `ParRed`; `ParRed` is contained in
`ReflTransGen Beta`; `ParRed` commutes with shifting; and if `ParRed s s'` and `ParRed t t'` then
`ParRed (s.subst t k) (s'.subst t' k)` (Selinger, Lemma 4.7, p. 34, for named terms).

Route: reflexivity by induction on the term; the two inclusions by induction on the reduction,
with 2.1 for the second, give the equality of closures. The substitution property is by induction
on `ParRed s s'`, generalizing `k` and `t`, `t'`, with `Term.subst_subst` in the redex case. The
diamond is by induction on `ParRed t u`, using the substitution property where `develop` contracts
a redex. (Proved here.)

**Checks.**
- The term `app δ (app (lam (var 0)) (var 0))` of the last Check of 2.1 reduces in one parallel
  step to `app (var 0) (var 0)`, its complete development, closing the diamond that one β-step
  could not.
- `ParRed` is not transitive: `app δ (lam (var 0))` reduces in one parallel step to
  `app (lam (var 0)) (lam (var 0))` and in two β-steps to `lam (var 0)`, but not in one parallel
  step to `lam (var 0)`, because the redex `app (lam (var 0)) (lam (var 0))` is created by the
  first contraction. This is why the theorem compares closures.
- `develop (app (var 3) (app (lam (var 0)) (var 0))) = app (var 3) (var 0)`; a term without
  redexes is its own complete development.

*Needs:* 1.1, 1.2, 2.1; Mathlib `Relation.ReflTransGen`, `Relation.ReflTransGen.mono`. (Proved
here.)

### 2.3 The Church–Rosser theorem

Prove `church_rosser`: if `ReflTransGen Beta t u` and `ReflTransGen Beta t v`, then
`Relation.Join (ReflTransGen Beta) u v` (Church and Rosser, 1936, as stated in Selinger, §4.2,
p. 28, proof in §4.4, p. 36; Girard–Lafont–Taylor, §4.1, p. 22, state it without proof).

Route: apply Mathlib's `Relation.church_rosser` to `ParRed`, whose hypothesis holds by
`ParRed.parRed_develop` with `develop t` as the common reduct, and transport along
`reflTransGen_parRed_iff`. (Proved here, following Selinger's route.)

**Checks.**
- From `Ω` every reduction sequence stays at `Ω`, and the theorem holds there with common reduct
  `Ω`: confluence does not need normal forms.
- The term `app (lam (var 1)) Ω`, which is `(λx. y) Ω` with `y` the free variable `var 0`, reduces
  to `var 0` and to itself; `var 0` is a common reduct.

*Needs:* 2.2; Mathlib `Relation.church_rosser`, `Relation.Join`. (Proved here.)

### Examples

The diamond of `(λx. x x)((λy. y) z)` under β and under parallel reduction; the complete
developments of `S (λx. λy. x) (λx. λy. x)`, of `(λx. x x)(λy. y)` and of `Ω`.

### Dependencies

Layer 1; Mathlib `Relation.ReflTransGen`, `Relation.ReflTransGen.mono`, `Relation.church_rosser`,
`Relation.Join`.

## Layer 3: normal forms, normalization and convertibility

### 3.1 Normal forms and strong normalization

Define `IsNormal t` as `∀ u, ¬ Beta t u`, and `SN t` as `Acc (fun u v => Beta v u) t` (Selinger,
§7.1, p. 71, and Girard–Lafont–Taylor, §4.4, p. 26, define a strongly normalizing term as one with
no infinite reduction sequence). API:

- `SN t` holds if and only if no `f : ℕ → Term` has `f 0 = t` and `Beta (f n) (f (n + 1))` for
  every `n`; this is Mathlib's `not_acc_iff_exists_descending_chain` for the converse relation;
- a β-normal term is strongly normalizing, and a term all of whose β-reducts are strongly
  normalizing is strongly normalizing (`Acc.intro`);
- strong normalization passes to β-reducts (`Acc.inv`) and to multi-step reducts;
- a strongly normalizing term reduces in finitely many steps to a β-normal term, by well-founded
  induction along `SN`.

(Proved here.)

**Checks.**
- `Ω` is neither strongly nor weakly normalizing: its only reduct is itself (Selinger, §7.1,
  p. 72, example 1).
- `app (lam (var 1)) Ω` is weakly normalizing, with normal form `var 0`, and not strongly
  normalizing, since it reduces to itself (Selinger, §7.1, p. 72, example 2). So strong
  normalization is not the existence of one terminating reduction.
- Accessibility for `Beta` itself, instead of its converse, holds for no term: by 1.2, for every
  `t` the term `app (lam (t.shift 0)) (var 0)` β-reduces to `t`, so every term has an infinite
  chain of β-expansions.

*Needs:* 1.2 (for the last Check), 2.1; Mathlib `Relation.ReflTransGen`, `Acc`, `Acc.intro`, `Acc.inv`,
`not_acc_iff_exists_descending_chain`. (Proved here.)

### 3.2 Convertibility and uniqueness of normal forms

- `eqvGen_beta_iff_join`: `EqvGen Beta t u ↔ Join (ReflTransGen Beta) t u` (Selinger,
  Corollary 4.1, p. 28; Girard–Lafont–Taylor, §4.1, p. 23).
- `eq_of_eqvGen_of_isNormal`: if `EqvGen Beta u v`, `IsNormal u` and `IsNormal v`, then `u = v`
  (Selinger, Corollary 4.3, p. 29, where equality is α-equivalence; with de Bruijn indices it is
  equality of terms).

API: a term β-convertible to a β-normal term `v` reduces to `v` (Selinger, Corollary 4.2, p. 28);
two β-convertible terms are both weakly normalizing or both not (Selinger, Corollary 4.4, p. 29);
a term reduces to at most one β-normal term (Girard–Lafont–Taylor, §4.1, Corollary, p. 23).

Route: by `church_rosser`, `Join (ReflTransGen Beta)` is an equivalence relation
(`Relation.equivalence_join_reflTransGen`, whose hypothesis is supplied by `ParRed` as in 2.3, or
directly from `church_rosser`); it contains `Beta`, so it contains `EqvGen Beta`. Conversely it is
contained in `EqvGen Beta` by `Relation.join_le_of_equivalence_of_le` with
`Relation.EqvGen.is_equivalence` and `Relation.EqvGen.reflTransGen_le_eqvGen`. Two normal terms
with a common reduct are that reduct. (Proved here.)

**Checks.**
- `var 0` and `var 1` are distinct β-normal terms, so they are not β-convertible; so are
  `lam (lam (var 1))` and `lam (lam (var 0))`. So β-convertibility does not identify all terms.
- `Ω` and `app (lam (var 1)) Ω` are not β-convertible: the second reduces to the normal term
  `var 0`, and `Ω` does not.

*Needs:* 2.2, 2.3; Mathlib `Relation.EqvGen`, `Relation.EqvGen.is_equivalence`,
`Relation.EqvGen.reflTransGen_le_eqvGen`, `Relation.equivalence_join_reflTransGen`,
`Relation.join_le_of_equivalence_of_le`. (Proved here.)

### Examples

Reduction graphs of `Ω`, of `(λx. y) Ω`, of `(λx. x x x)(λx. x x x)`, which has an infinite reduction
sequence through ever larger terms, and of `(λx. y)((λx. x)(λx. x))`, which is strongly
normalizing.

### Dependencies

Layers 1 and 2; Mathlib `Acc`, `Acc.intro`, `Acc.inv`, `not_acc_iff_exists_descending_chain`,
`Relation.EqvGen`, `Relation.EqvGen.is_equivalence`, `Relation.EqvGen.reflTransGen_le_eqvGen`,
`Relation.equivalence_join_reflTransGen`, `Relation.join_le_of_equivalence_of_le`.

## Layer 4: simple types and subject reduction

### 4.1 Simple types and typing

Define `Ty ι` and `HasType` as in the Conventions (Selinger, §6.1, pp. 51–52, Table 4, with named
variables, product and unit types and typed binders; the typing here has arrows only and untyped
binders). API: every free index of a term typed in `Γ` is below `Γ.length`; a subterm of a typed
term is typed in the context extended by the types of the binders above it. (Proved here.)

**Checks.**
- `lam (var 0)` has type `Ty.arrow A A` in the empty context for every `A`, so a term may have
  many types; `lam (lam (var 1))` has type `Ty.arrow A (Ty.arrow B A)` for all `A`, `B`, and `S`
  of Layer 1 has type `(A → B → C) → (A → B) → A → C` for all `A`, `B`, `C`, writing `→` for
  `Ty.arrow` grouped to the right.
- `var 0` has no type in the empty context. In the context `[p, o]` of two base types, `var 0`
  has type `p` and `var 1` has type `o`: the index `0` is the head.
- `δ = lam (app (var 0) (var 0))` has no type in any context: a type `A` of the bound variable
  would satisfy `A = Ty.arrow A B` (Selinger, §6.1, p. 53). Hence `Ω` and every term containing
  `Ω` have no type.

*Needs:* 1.1. (Proved here.)

### 4.2 Weakening and the typing substitution lemma

- `HasType.shift`: if `HasType Γ t A`, then `HasType (Γ.insertIdx k B) (t.shift k) A` for all `k`
  and `B`.
- `HasType.subst`: if `HasType (Γ.insertIdx k B) t A` and `HasType Γ s B`, then
  `HasType Γ (t.subst s k) A`.

Neither needs `k ≤ Γ.length`: for larger `k` the list is unchanged and, by 4.1, the term has no
free index at least `k`, so shifting and substituting at `k` do not change it. API, strengthening:
if `HasType (Γ.insertIdx k B) (t.shift k) A`, then `HasType Γ t A`. (Selinger states the case
`k = 0` of `HasType.subst`, for named variables, in the proof of Theorem 6.1, p. 62.)

Route: induction on the typing derivation, generalizing `Γ` and `k`; the variable case compares
`Γ[i]?` with the entries of `Γ.insertIdx k B` by the core lemma `List.getElem?_insertIdx`, and
the abstraction case uses `(A :: Γ).insertIdx (k + 1) B = A :: Γ.insertIdx k B`
(`List.insertIdx_succ_cons`) and, for
`HasType.subst`, `HasType.shift` at `0` for `s`. (Proved here.)

**Checks.**
- The shift is needed: `var 0` has type `o` in `[o]`; after inserting `p` at `0` the context is
  `[p, o]`, in which `var 1 = (var 0).shift 0` has type `o` while `var 0` has type `p`.
- Inserting at `k = 1` instead gives `[o, p]` and `(var 0).shift 1 = var 0`, of type `o`.

*Needs:* 1.1, 4.1; Lean core `List.insertIdx`, `List.getElem?_insertIdx`,
`List.insertIdx_succ_cons`, `List.insertIdx_of_length_lt`. (Proved here.)

### 4.3 Subject reduction

Prove `HasType.of_beta`: if `HasType Γ t A` and `Beta t u`, then `HasType Γ u A` (Selinger,
Theorem 6.1, p. 62, for βη on terms with products and unit). By induction along the closure, the
same holds for `ReflTransGen Beta t u`.

Route: induction on `Beta t u`; in the redex case invert the typing of `app (lam s) t` and apply
`HasType.subst` with `k = 0`, where `Γ.insertIdx 0 B = B :: Γ`. (Proved here.)

**Checks.**
- Subject expansion fails: `app (lam (lam (var 0))) Ω` reduces in one step to `lam (var 0)`, which
  has type `Ty.arrow A A`, while the redex has no type, by the last Check of 4.1.
- In the context `[Ty.arrow o o, o]` the term `app (var 0) (app (lam (var 0)) (var 1))` has type
  `o` and reduces to `app (var 0) (var 1)`, again of type `o`.

*Needs:* 2.1, 4.1, 4.2. (Proved here.)

### Examples

Typing derivations of the identity, of the two constants and of `S`; the failure of typing for `δ`;
subject reduction along the reduction of `S (λx. λy. x) (λx. λy. x)` to the identity.

### Dependencies

Layers 1 and 2 (`Beta` for 4.3); Lean core `List.insertIdx`, `List.getElem?_insertIdx`,
`List.insertIdx_succ_cons`, `List.insertIdx_of_length_lt`.

## Layer 5: strong normalization

### 5.1 Reducibility and Girard's conditions

Define `Neutral t` (`t` is not an abstraction), `IsCandidate P` for `P : Term → Prop` as the
conjunction of Girard's three conditions

- (CR1) every member of `P` is strongly normalizing;
- (CR2) `P` is closed under β-reduction;
- (CR3) a neutral term all of whose β-reducts lie in `P` lies in `P`;

and Tait's reducibility predicates `Red A` by recursion on `A`: `Red (Ty.base a) t` is `SN t`, and
`Red (Ty.arrow A B) t` holds when `Red B (app t u)` for every `u` with `Red A u`
(Girard–Lafont–Taylor, §6.1, p. 41, and §6.2, p. 42, for terms with types and pairs; a set
satisfying (CR1)–(CR3) is called a reducibility candidate in §14.1.3, p. 115).

Prove `isCandidate_red`: `IsCandidate (Red A)` for every type `A` (Girard–Lafont–Taylor,
§6.2.1–6.2.3, pp. 42–44). Here the predicates are sets of untyped terms, and the argument is the
source's with the cases of pairs omitted.

Route: induction on `A`. At a base type, (CR1) is trivial, (CR2) is `Acc.inv` and (CR3) is
`Acc.intro`. At `Ty.arrow A B`: every variable lies in `Red A` by (CR3) for `A`, since it is neutral
and normal; so (CR1) follows from (CR1) for `B` applied to `app t (var 0)`, whose strong
normalization implies that of `t`. (CR2) is (CR2) for `B`. For (CR3), given `u` in `Red A`, show
`app t u` in `Red B` by induction on `SN u`: since `t` is neutral, the β-reducts of `app t u` are
`app t' u` and `app t u'`. (Proved here, following the cited route.)

**Checks.**
- Every candidate contains every `var i`, which is neutral and has no β-reduct; so the empty set
  satisfies (CR1) and (CR2) but is not a candidate.
- The set of all terms satisfies (CR2) and (CR3) but not (CR1), since it contains `Ω`.
- The set of strongly normalizing terms is `Red (Ty.base a)` and is a candidate.

*Needs:* 2.1, 3.1; Mathlib `Acc.intro`, `Acc.inv`. (Proved here.)

### 5.2 Adequacy

Prove `HasType.red_substAll`: if `HasType Γ t A` and `σ : ℕ → Term` has `Red B (σ i)` whenever
`Γ[i]? = some B`, then `Red A (t.substAll σ)` (Girard–Lafont–Taylor, §6.3.3, Proposition, p. 45,
with simultaneous substitution for the free variables).

Route: induction on the typing derivation. The variable case is the hypothesis, the application
case is the definition of `Red` at an arrow. For an abstraction `lam t` of type `Ty.arrow A B`,
given `u` in `Red A`, the term `app (lam (t.substAll σ')) u` is neutral, and its β-reducts are
`t.substAll σ''` (by the composition identity of 1.2, in `Red B` by the induction hypothesis) and
terms obtained by reducing inside `t.substAll σ'` or inside `u`; proceed by induction on the strong
normalization of the two parts and conclude by (CR3) and (CR2) (Girard–Lafont–Taylor, §6.3.2,
Lemma, p. 44). The strong normalization of `t.substAll σ'` follows from that of its instance
`t.substAll σ''`, since a β-step inside `s` gives a β-step inside `s.subst u 0` (2.1).
(Proved here, following the cited route.)

*Needs:* 1.2 (`Term.substAll` and its API), 2.1, 3.1, 4.1, 5.1. (Proved here.)

### 5.3 Strong normalization and normal forms

- `HasType.sn`: if `HasType Γ t A` for some context `Γ` and type `A`, then `SN t`
  (Girard–Lafont–Taylor, §6.3.3, Corollary, p. 45; Selinger, Theorem 7.2, p. 72, without proof).
- `HasType.existsUnique_isNormal`: if `HasType Γ t A`, then there is exactly one `u` with
  `ReflTransGen Beta t u` and `IsNormal u` (Girard–Lafont–Taylor, §4.1, p. 23, and §4.2, p. 24,
  for weak normalization).

API: two typed terms are β-convertible if and only if their β-normal forms are equal; every typed
term is weakly normalizing.

Route: `HasType.red_substAll` with `σ = Term.var`, admissible by the first Check of 5.1, and the
identity `t.substAll Term.var = t` of 1.2 give `Red A t`, hence `SN t` by (CR1). Existence of a
normal form is the last item of the API of 3.1, uniqueness is `eq_of_eqvGen_of_isNormal`.
(Proved here.)

**Checks.**
- In the empty context, `app (lam (lam (var 1))) (lam (var 0))` has type
  `Ty.arrow B (Ty.arrow A A)` and reduces in one step to its normal form `lam (lam (var 0))`.
- `Ω` and `app (lam (var 1)) Ω` are not strongly normalizing and, by 4.1, have no type: the
  theorem does not extend to untyped terms.

*Needs:* 1.2, 3.1, 3.2, 4.1, 5.1, 5.2. (Proved here.)

### Examples

The reducibility of the identity at `Ty.arrow A A` and of the constants, checked from the
definition of `Red`; the normal forms of `S (λx. λy. x) (λx. λy. x)` and of the Church numeral
`λf. λx. f (f x)` applied to itself, both typed.

### Dependencies

Layers 1–4; Mathlib `Acc.intro`, `Acc.inv`.

## Layer 6: η-reduction

### 6.1 η-reduction

Define `Eta` as the least relation containing `Eta (lam (app (s.shift 0) (var 0))) s` and closed
under the three term formers, and `BetaEta t u` as `Beta t u ∨ Eta t u` (Selinger, §4.1, p. 27).
The shift in the redex is the de Bruijn form of the side condition that the bound variable is not
free in the function part. API: η-reduction strictly decreases the number of constructors of a
term, so it has no infinite reduction sequence; it commutes with shifting and with substitution in
the first argument. (Proved here.)

**Checks.**
- `Eta (lam (app (var 1) (var 0))) (var 0)`, since `var 1 = (var 0).shift 0`; this is `λy. z y`
  reducing to `z`. Both terms are β-normal and distinct, so by 3.2 they are not β-convertible,
  while they are βη-convertible (Selinger, Corollary 4.5, p. 29).
- `δ = lam (app (var 0) (var 0))` is not an η-redex: its function part `var 0` is not of the form
  `s.shift 0`, because the bound variable occurs in it.

*Needs:* 1.1, 1.2, 2.1, 3.2 (for the first Check). (Proved here.)

### 6.2 The Church–Rosser theorem for βη

Prove `church_rosser_betaEta`: if `ReflTransGen BetaEta t u` and `ReflTransGen BetaEta t v`, then
`Relation.Join (ReflTransGen BetaEta) u v` (Selinger, §4.2, p. 28; proof in §4.4, Lemmas 4.6–4.9,
pp. 32–36).

Route: extend `ParRed` by Selinger's rule (5), which here reads: from `ParRed s s'` infer that
`lam (app (s.shift 0) (var 0))` reduces in parallel to `s'`, together with the maximal parallel
reduct that also contracts η-redexes, and repeat the argument of 2.2 and 2.3 (Selinger,
Lemmas 4.6–4.9). (Proved here, following the cited route.)

**Checks.**
- The term `lam (app (app (lam (var 0)) (var 1)) (var 0))`, which is `λy. (λx. x) z y`, β-reduces
  to `lam (app (var 1) (var 0))` and η-reduces to `app (lam (var 0)) (var 0)`; both reach `var 0`.

*Needs:* 1.2, 2.1, 2.2, 6.1; Mathlib `Relation.church_rosser`. (Proved here.)

### 6.3 Subject reduction for η

Prove `HasType.of_eta`: if `HasType Γ t A` and `Eta t u`, then `HasType Γ u A`. By 4.3 the same
holds for `BetaEta` and its reflexive transitive closure.

Route: induction on `Eta t u`; in the redex case the typing of `lam (app (s.shift 0) (var 0))` at
`Ty.arrow A B` gives `s.shift 0` of type `Ty.arrow A B` in `A :: Γ`, and strengthening (4.2) gives
`s` that type in `Γ`. (Proved here.)

**Checks.**
- In the context `[Ty.arrow o o]`, `lam (app (var 1) (var 0))` and its η-reduct `var 0` both have
  type `Ty.arrow o o`.

*Needs:* 4.1, 4.2 (strengthening), 4.3, 6.1. (Proved here.)

### Examples

The η-reductions of `λx. λy. f x y` to `f`, written in indices; the βη-normal forms of typed terms
that are β-normal, such as `λy. z y`.

### Dependencies

Layers 1–4 (Layer 3 only for the first Check of 6.1); Mathlib `Relation.church_rosser`.

## Scope and ownership

This roadmap owns the targets stated above: de Bruijn terms with shifting, substitution,
simultaneous substitution and the substitution lemmas; β-reduction, parallel reduction, the
complete development and the Church–Rosser theorem for β; normal forms, strong normalization and
the characterization of β-convertibility with the uniqueness of normal forms; simple types with
typing in the style of Curry, weakening, strengthening, the typing substitution lemma and subject
reduction; Tait's reducibility predicates, Girard's conditions, the adequacy theorem and strong
normalization of typed terms with the existence and uniqueness of their normal forms; η-reduction,
the Church–Rosser theorem for βη and subject reduction for η.

Already in the libraries and therefore not targets: the closure operations on relations, joinability
and the criterion for the Church–Rosser property of an abstract reduction relation
(`Relation.church_rosser`), together with the facts that joinability under a confluent closure is
an equivalence relation and is the equivalence closure; accessibility and its characterization by
descending chains; insertion into lists. The roadmap applies these to β-reduction and does not
restate them. Neither Mathlib nor Tau Ceti nor any roadmap on main defines λ-terms or a typed
λ-calculus, and none states a Church–Rosser or normalization theorem for one; Mathlib's
`FreeGroup.Red.church_rosser` concerns word reduction in free groups.

Outside the scope: typing in the style of Church with typed binders; product, sum and unit types,
for which βη fails to be confluent once the unit type has its η-rule (Selinger, §6.7, p. 63); the
weak normalization theorem by the degree argument as a separate proof (it follows from 5.3); the
bound on the lengths of reduction sequences of a strongly normalizing term (Girard–Lafont–Taylor,
§4.4, p. 27); strong normalization for βη; System F, Gödel's system T and dependent types;
typability, principal types, type inference and the decidability of typing or of convertibility;
reduction strategies, standardization and every evaluator; Böhm trees, combinatory logic, models
and denotational semantics; the Curry–Howard correspondence as a theorem; and cut elimination for
sequent calculi, which normalizes proofs rather than terms.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Logic/Relation.lean`: `Relation.ReflTransGen` (reflexive transitive closure);
  `Relation.ReflTransGen.mono` (`r ≤ p → ReflTransGen r ≤ ReflTransGen p`); `Relation.Join`
  (`Join r a b ↔ ∃ c, r a c ∧ r b c`, by definition); `Relation.church_rosser` (if every `a` with
  `r a b` and `r a c` has `d` with `ReflGen r b d` and `ReflTransGen r c d`, then
  `ReflTransGen r a b → ReflTransGen r a c → Join (ReflTransGen r) b c`);
  `Relation.equivalence_join_reflTransGen` (under the same hypothesis,
  `Equivalence (Join (ReflTransGen r))`); `Relation.join_le_of_equivalence_of_le`
  (`Equivalence r → r' ≤ r → Join r' ≤ r`); `Relation.EqvGen` (equivalence closure);
  `Relation.EqvGen.is_equivalence` (`Equivalence (EqvGen r)`);
  `Relation.EqvGen.reflTransGen_le_eqvGen` (`ReflTransGen r ≤ EqvGen r`).
- `Mathlib/Order/WellFounded.lean`: `not_acc_iff_exists_descending_chain`
  (`¬ Acc r x ↔ ∃ f : ℕ → α, f 0 = x ∧ ∀ n, r (f (n + 1)) (f n)`).
- Lean core, re-exported by Mathlib: `Acc`, `Acc.intro` (`(∀ y, r y x → Acc r y) → Acc r x`),
  `Acc.inv` (`Acc r x → r y x → Acc r y`); `List.insertIdx` (`l.insertIdx i a` inserts `a` before
  position `i`, and is `l` when `l.length < i`), `List.getElem?_insertIdx` (the entries of
  `l.insertIdx i x`: `l[j]?` for `j < i`, `some x` for `j = i ≤ l.length`, `l[j - 1]?` for `j > i`)
  `List.insertIdx_succ_cons` (`(a :: l).insertIdx (i + 1) x = a :: l.insertIdx i x`) and
  `List.insertIdx_of_length_lt`, in `Init/Data/List/Nat/InsertIdx.lean`.

### From Tau Ceti

Nothing.

## References

- P. Selinger, *Lecture notes on the lambda calculus*, arXiv:0804.3434, version 2 (2013). Cited by
  section, numbered result and printed page: §2.3 (pp. 15–17), §2.5 (p. 18), §4.1 (pp. 26–27),
  §4.2 with Corollaries 4.1–4.5 (pp. 28–29), §4.3 (pp. 30–31), §4.4 with Lemmas 4.6–4.9 (pp. 32–36),
  §6.1 with Table 4 (pp. 51–53), Theorem 6.1 (p. 62), §6.7 (p. 63), §7.1 (pp. 71–72) and
  Theorem 7.2 (p. 72).
- J.-Y. Girard, Y. Lafont and P. Taylor, *Proofs and Types*, Cambridge University Press, 1989; the
  edition reprinted for the web in 2003 and posted by P. Taylor (`www.paultaylor.eu/stable/prot.pdf`),
  with the printed page numbers. Cited: §4.1 (pp. 22–23), §4.2 (p. 24), §4.4 (pp. 26–27),
  §6.1–6.3 (pp. 41–45) and §14.1.3 (p. 115).
- The following are named as the two texts above attribute them, without locators: A. Church and
  J. B. Rosser (1936) for the Church–Rosser theorem; W. W. Tait (1967) for reducibility; J.-Y.
  Girard (1972) for the conditions on reducibility candidates; W. W. Tait and P. Martin-Löf for
  parallel reduction. N. G. de Bruijn (1972) for nameless indices and M. Takahashi (1995) for the
  complete development are attributed in prose and were not consulted.
