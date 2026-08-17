# Roadmap: global quadratic forms over number fields

## Scope

This roadmap builds the local-to-global theory of regular quadratic forms over an arbitrary
number field. It starts from the canonical finite and archimedean completions, the local
classification and invariant theory supplied by the Quadratic Form Invariants roadmap, weak
approximation supplied by Global Number Fields, and the Hasse norm and Hilbert reciprocity
theorems supplied by Class Field Theory. It ends with both halves of the global theory:

- Hasse–Minkowski for isotropy, representation, and isometry; and
- existence and classification of global forms by admissible local invariants.

The roadmap is not restricted to `ℚ`. Every theorem is stated for a number field `K`; examples
over `ℚ` are tests, not the generality of the implementation. The proof of Hasse–Minkowski keeps
the binary, ternary, quaternary, and rank-at-least-five cases separate. In the last case weak
approximation is applied to the coordinates of a vector in a binary summand, and the represented
scalar is defined from that vector. Approximating a scalar directly leaves a logical gap and is
not an accepted proof route.

This roadmap owns the global theory only. It does not own:

- diagonalization, Witt cancellation, local Hilbert symbols, or the classification over one
  nonarchimedean local field — those belong to Quadratic Form Invariants;
- weak approximation, moduli, adeles, or ideles — those belong to Global Number Fields;
- completion towers, decomposition groups, or the global-to-local ramification dictionary —
  those belong to Number Field Arithmetic;
- the Hasse norm theorem, local or global reciprocity, or the cohomological Hilbert pairing —
  those belong to Class Field Theory;
- nonabelian cohomology, algebraic groups, torsors, or Tate–Shafarevich sets — Orthogonal and
  Spin Groups makes the translation needed for `SO`;
- integral lattices, genera, spinor genera, or mass formulae;
- quadratic forms in characteristic two or over global function fields.

Suggested implementation home:
`TauCeti/NumberTheory/QuadraticForm/Global/`, with the headline theorems in
`HasseMinkowski.lean`, the invariant systems in `Invariants.lean`, and prescribed-local-behavior
existence in `Existence.lean`. Use the namespace `TauCeti.NumberField.QuadraticForm` for the
global form theory.

## How prerequisites are recorded

Each milestone lists its direct prerequisites in one of four classes.

- **M** is a named Mathlib declaration at the repository pin.
- **T** is a named declaration from landed Tau Ceti code.
- **R** is an exact declaration, or an exact numbered milestone where the supplier has not yet
  frozen a Lean name, from one of the four prerequisite roadmaps below.
- **L** is an earlier milestone in this roadmap.

A subject is not a contract. The tables below are the complete cross-roadmap boundary. An
implementation imports the suppliers; it does not replace an import by a structure containing
arbitrary local forms or by a duplicate opaque theorem.

## Cross-roadmap contracts

### Global Number Fields

Global Number Fields owns the arithmetic carrier of places and approximation. This roadmap uses
one theorem from it.

| Consumer here | Exact supplier declaration | Contract |
|---|---|---|
| 4.1, 5.4, 7.2 | `weakApproximation_denseRange` (Layer 0.2, density form) | For every finite family of pairwise inequivalent finite or real places of `K`, the diagonal image of `K` is dense in the product of the corresponding completions. The targets are arbitrary completion elements, not only congruences or signs. |

The name `weakApproximation_denseRange` is frozen by this consumer contract. The
congruence-and-sign corollary of Global Number Fields is not enough for Layer 5.4, which
approximates two coordinates of a vector at both finite and real places.

### Number Field Arithmetic

Number Field Arithmetic owns the finite-completion dictionary. This roadmap uses the completion
itself from Mathlib, and the following supplied instance and map.

| Consumer here | Exact supplier declaration or milestone | Contract |
|---|---|---|
| 0.1, 2.1, 5.4, 7.1 | `isNonarchimedeanLocalField_adicCompletion` (Layer 5.1) | The canonical instance `IsNonarchimedeanLocalField (v.adicCompletion K)` for every `v : HeightOneSpectrum (𝓞 K)`, with the topology and valuation induced by Mathlib's completion. |
| 0.1 | `completionAlgHom` (Layer 5.2) | The canonical continuous algebra homomorphism `K_v →ₐ[K] L_w` for a place `w` above `v`, compatible with the dense maps from `K` and `L` and functorial in towers. |

There is no new `FinitePlace`, completion, or valuation in this roadmap. The first name is the
public name required by this consumer contract.

### Class Field Theory

Class Field Theory supplies arithmetic reciprocity in cohomological form and has no dependency
on quadratic forms.

| Consumer here | Exact supplier declaration or milestone | Contract |
|---|---|---|
| 4.3, 5.1 | `cyclicHasseNorm` (Layer 5.5) | For a finite cyclic extension `L/K` and `a : Kˣ`, `a` lies in the global norm group exactly when it lies in the norm group at every place. The quadratic-extension instance is the ternary Hasse–Minkowski input. |
| 3.3, 4.4 | `hilbertProductFormula` (Hilbert reciprocity) | The product over all places of the cohomological Kummer-cup Hilbert pairing is `1`, with the arithmetic invariant-map normalization. |

The public names `cyclicHasseNorm` and `hilbertProductFormula` are part of this consumer contract.
`hilbertProductFormula` is cohomological. The equality between that pairing and the
norm-equation/quaternion symbol is supplied by Quadratic Form Invariants below, so the dependency
direction remains

```text
ClassFieldTheory → QuadraticFormInvariants → GlobalQuadraticForms.
```

### Quadratic Form Invariants

Quadratic Form Invariants owns all field-generic and nonarchimedean local form theory.

| Consumer here | Exact supplier declaration or milestone | Contract |
|---|---|---|
| all form-level invariants | `RegularFormClass`, `formClass`, `discr`, `signedDiscr` | The isometry-class carrier for regular finite-dimensional forms and the plain and signed discriminants, with plain `discr` primary here. |
| 5.3, 5.4, 6.1 | Layer 0 representation criterion | A regular form represents `a ∈ Kˣ` exactly when its orthogonal sum with `⟨−a⟩` is isotropic. |
| 5.1, 5.3, 6.2, 8.2 | Layer 1 hyperbolic-plane theory, Witt cancellation, and Witt extension | A regular binary form of discriminant `[-1]` is hyperbolic; a common regular summand cancels; an isometry of regular subspaces extends. |
| 2.1, 2.2, 3.3 | `localHasse`, `localHasse_congr`, `hilbertSymbol_unramified` | The `{±1}`-valued Hasse invariant `∏_{i<j}(a_i,a_j)` over a nonarchimedean local field, its descent to isometry classes, and its good-place computation. |
| 3.2, 7.1 | `exists_of_realization` | A finite-place triple `(n,d,s)` is realizable except exactly when `n = 1, s = -1`, or `n = 2, d = [-1], s = -1`. |
| 2.3, 5.1–5.4, 6.2, 7.2 | Layer 6D local classification and isotropy list | Regular forms over a nonarchimedean local field are classified by `(dim, discr, localHasse)`, with the rank-by-rank isotropy and representation criteria. |
| 4.4, 7.1 | `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula` | The norm-equation/quaternion symbol agrees with Class Field Theory's cohomological pairing, and therefore has the global product formula. These are the bridge declarations required by the acyclic ownership boundary. |
| 8.3 | `wittRing`, `toWittRing` and its real-signature API | The genuine Witt carrier and localization maps. The injectivity theorem is not stated against a placeholder carrier. |

Where Quadratic Form Invariants gives a numbered milestone rather than a Lean
name, this table cites that milestone exactly. The two cohomological comparison names are frozen
exports required by this roadmap, and keep the class-field/quadratic-form dependency acyclic.

## Conventions

Fix these before implementing any layer.

- `K` is a number field. A form is finite-dimensional and regular (`QuadraticForm.Nondegenerate`).
  The rank-zero form is handled by a separate uniqueness lemma. Arithmetic invariant systems
  have positive rank; the total classification adjoins the unique rank-zero class explicitly.
- Localization is always `QuadraticForm.baseChange` along the actual map into a completion or an
  archimedean embedding. A free family `v ↦ Q_v` is not the localization of a global form.
- The discriminant is the **plain** discriminant `d(q) = [det(q)] ∈ Kˣ/(Kˣ)²`. The signed
  discriminant is derived from rank and `d`; it is not a second classification convention.
- At a nonarchimedean place the Hasse invariant is
  `s_v(q) = ∏_{i<j}(a_i,a_j)_v ∈ {±1}`. This is the Lam–Serre convention used by
  `QuadraticFormInvariants.localHasse`, not O'Meara's `∏_{i≤j}` symbol without translation.
- At a real place the signature is recorded by the positive index `p_w`; the negative index is
  `n - p_w`. Its Hasse sign in the preceding convention is
  `(-1)^((n-p_w)(n-p_w-1)/2)`.
- A complex place contributes only the rank. Every regular form of rank at least two over `ℂ` is
  isotropic, and two regular complex forms of the same rank are isometric.
- Products over places are finite products in implementation: finite-place Hasse signs are `1`
  at almost every place and there are finitely many real places. Never ask Lean to multiply an
  unrestricted family without first proving finite support.
- “Locally” means every finite completion and every real completion. Complex clauses are omitted
  only after proving the two automaticity theorems of Layer 0.
- `Represents q r` means an isometric linear embedding of the regular form `q` into `r`, not only
  an equality of represented-value sets. Scalar representation is stated separately.

## What Mathlib supplies

Use Mathlib's existing objects and vocabulary:

- `QuadraticForm`, `QuadraticForm.baseChange`, `QuadraticMap.Anisotropic`,
  `QuadraticMap.Equivalent`, tensor-product scalar extension, and finite-dimensional linear
  algebra;
- `HeightOneSpectrum (𝓞 K)`, `v.adicCompletion K`, `v.adicCompletionIntegers K`, and the dense
  algebra map into a single completion;
- `NumberField.InfinitePlace`, `InfinitePlace.IsReal`,
  `InfinitePlace.embedding_of_isReal`, the count of archimedean places, and the product formula;
- real quadratic-form linear algebra and Sylvester's law where already available at the pin;
- `IsSquare`, `IsUnit`, finite-support functions, `Finset`, and the topology of finite products.

The implementation audit must search the pin again before adding local declarations. In
particular, use a landed Mathlib signature theorem or Witt carrier rather than preserving a Tau
Ceti prototype merely because this roadmap first named it.

## What is missing

At the inspected pin there is no unified number-field localization API for quadratic forms, no
Hasse–Minkowski theorem over number fields, no carrier for admissible global invariant systems,
no prescribed-local-behavior existence theorem, and no classification of global forms by local
invariants. The suppliers deliberately stop on their side of those boundaries.

## The build, in layers

### Layer 0: places, completions, and scalar extension

#### 0.1 Canonical localizations

Define one finite localization

```text
atFinitePlace (Q : QuadraticForm K V) (v : HeightOneSpectrum (𝓞 K))
  : QuadraticForm (v.adicCompletion K) (v.adicCompletion K ⊗[K] V)
```

and one real localization `atRealPlace Q w` using
`InfinitePlace.embedding_of_isReal`. Define the analogous complex base change for the theorems
that justify omitting complex places from later predicates. These are definitions around
`QuadraticForm.baseChange`, not new completion carriers.

Basic API:

- scalar extension of an isometry and of a representation;
- compatibility with `prod`, negation, and scalar multiplication;
- preservation of rank and regularity;
- repeated base change in a tower, using `completionAlgHom` at finite places;
- compatibility of discriminant, Hasse invariant, and real signature with localization;
- diagonal localization computes by applying the completion map to each coefficient.

*Prerequisites:* M `QuadraticForm.baseChange`, M `InfinitePlace.embedding_of_isReal`;
R Number Field Arithmetic `isNonarchimedeanLocalField_adicCompletion`, `completionAlgHom`.

#### 0.2 The local predicates

Define:

```text
IsLocallyIsotropic Q
LocallyRepresents Q R
LocallyRepresentsScalar Q a
LocallyEquivalent Q R
```

using every finite and every real place. Prove invariance under global isometry and the expected
implications between the predicates. A form locally equivalent to another has the same global
rank. Do not store localization as fields of a structure; the predicates compute the actual base
changes from 0.1.

*Prerequisites:* L 0.1; M `QuadraticMap.Anisotropic`, M `QuadraticMap.Equivalent`.

#### 0.3 Complex-place automaticity

Prove:

- a regular form over an algebraically closed field of rank at least two is isotropic;
- two regular forms over an algebraically closed field are isometric exactly when their ranks
  agree;
- scalar representation and form representation have the corresponding rank conditions.

Specialize to `ℂ` and prove that adjoining a complex clause to the predicates of 0.2 changes none
of the headline statements. Rank one is not isotropic over `ℂ`, so carry the rank hypothesis.

*Prerequisites:* M algebraic closure and square-root existence; R Quadratic Form Invariants
diagonalization and Witt theory.

### Layer 1: archimedean forms and signatures

#### 1.1 Positive and negative indices

Use Mathlib's signature carrier if one is present at implementation time. Otherwise define the
positive and negative indices of a regular real form from a diagonalization and prove
well-definedness by Sylvester's law. Package the signature as `(p,q)` with `p+q=n`, and give
`realPositiveIndex` as the projection used by the global invariant system.

Basic API includes orthogonal sums, negation, scaling by a positive or negative scalar, base
change along two representatives of the same real place, and the determinant-sign formula

```text
sign(det q) = (-1)^q.
```

*Prerequisites:* M real linear algebra and Sylvester's law; L 0.1.

#### 1.2 Real and complex classification

Prove that two regular real forms are isometric exactly when their signatures agree, and realize
every pair `(p,q)` with `p+q=n` by `p⟨1⟩ ⊥ q⟨-1⟩`. Compute its plain discriminant sign and its
Hasse sign `(-1)^(q(q-1)/2)`. Record complex classification by rank alongside it.

*Prerequisites:* L 1.1, L 0.3.

### Layer 2: finite-place invariants and finite support

#### 2.1 Localized discriminant and Hasse sign

For a regular global form define the discriminant square class at `v` by localizing its global
discriminant, and define `finiteHasse Q v` by applying the supplier's `localHasse` to
`atFinitePlace Q v`. Prove independence of diagonalization and compatibility with orthogonal sum,
negation, scaling, and isometry.

*Prerequisites:* L 0.1; R Quadratic Form Invariants `discr`, `localHasse`,
`localHasse_congr`.

#### 2.2 Almost-all triviality

For every regular global form prove

```text
finiteHasse Q v = 1
```

for all but finitely many finite places. Start from one global diagonalization. Outside the finite
set containing the dyadic places and the primes supporting its coefficients, every coefficient is
a unit and `hilbertSymbol_unramified` makes every pairwise symbol `1`. Package the exceptional set
as a finite support and prove that enlarging it does not change products.

Also prove that a fixed regular form of rank at least three is isotropic at almost every finite
place. This is the finiteness input for the rank-at-least-five Hasse–Minkowski argument; it is not
a consequence of the theorem being proved.

*Source:* O'Meara 63:14 and 66:6.

*Prerequisites:* L 2.1; R Quadratic Form Invariants `hilbertSymbol_unramified` and Layer 6D's
rank-by-rank isotropy list; R Number Field Arithmetic Layer 5.1.

#### 2.3 Local classification in global notation

Prove adapter theorems saying that at a finite place two localizations are isometric exactly when
their rank, localized discriminant, and finite Hasse sign agree. State the supplier's realization
exceptions in the same global-discriminant notation. The content is transport into the completion,
not a second proof of local classification.

*Prerequisites:* L 2.1; R Quadratic Form Invariants Layer 6D and `exists_of_realization`.

### Layer 3: admissible systems of local invariants

#### 3.1 The invariant carrier

Define `GlobalFormInvariants K` with:

- a positive rank `n`;
- one global discriminant class `d : Kˣ/(Kˣ)²`;
- a finite-place Hasse sign `s_v : {±1}`;
- a positive index `p_w` at each real place.

The global discriminant, rather than an unrelated local discriminant at every place, is part of
the carrier. Provide extensionality, restriction to one place, finite support for `s_v`, and the
local invariant triples derived at finite and real places.

*Prerequisites:* L 1.1, L 2.1; R Quadratic Form Invariants square-class carrier.

#### 3.2 Admissibility

Define `GlobalFormInvariants.IsAdmissible`. Its fields are the exact conditions:

1. `1 ≤ n`.
2. For every real `w`, `p_w ≤ n` and the sign of the localized discriminant is
   `(-1)^(n-p_w)`.
3. `s_v = 1` at all but finitely many finite places.
4. Every finite local triple `(n,d_v,s_v)` meets `exists_of_realization`'s two small-rank
   conditions: rank one forces `s_v=1`, and in rank two the discriminant `[-1]` forces
   `s_v=1`.
5. The product of all finite Hasse signs and the real Hasse signs
   `(-1)^((n-p_w)(n-p_w-1)/2)` is `1`.

Prove that these conditions are independent of the chosen finite support. Do not replace item 4
by the assertion that “the local data are compatible”; the two exceptions are load-bearing.

*Nearby false statement.* Finite support and product one alone do not imply realizability. In rank
one a local Hasse sign `-1` is impossible. In rank two a local form of discriminant `[-1]` is
hyperbolic and also cannot have Hasse sign `-1`.

*Prerequisites:* L 3.1, L 1.2; R Quadratic Form Invariants `exists_of_realization`.

#### 3.3 Invariants of a global form are admissible

Construct `globalInvariants Q` for a regular positive-rank global form and prove it admissible.
The product condition is the product formula applied coefficientwise to a global
diagonalization; finite support is 2.2; real determinant signs are 1.2; local realizability is
given by the localizations themselves.

*Prerequisites:* L 3.2, L 2.2, L 1.2; R Class Field Theory `hilbertProductFormula`;
R Quadratic Form Invariants `hilbertSymbol_eq_cohomological`.

### Layer 4: global square, norm, and approximation lemmas

#### 4.1 Vector weak approximation

From `weakApproximation_denseRange`, prove weak approximation on any finite-dimensional affine
space: after choosing a basis, one global vector can meet prescribed open neighborhoods in the
base changes at finitely many finite or real places. Prove basis independence and the product
topology statement. This is the exact form used in Layers 5.4 and 7.2.

*Prerequisites:* R Global Number Fields `weakApproximation_denseRange`; M finite-dimensional
coordinates and continuity of linear equivalences.

#### 4.2 The global square theorem

Prove that `a : Kˣ` is a square in `K` if it is a square in every completion; prove the stronger
O'Meara 65:15 form in which it is enough that `a` be a square at almost every place. One route is
to apply global class-field existence to the quadratic extension `K(√a)`: a nontrivial quadratic
extension cannot split at almost every place. State both forms and use the all-place corollary in
the binary case.

*Source:* O'Meara 65:15.

*Prerequisites:* R Class Field Theory global existence/reciprocity package; R Number Field
Arithmetic finite Frobenius and splitting package. The theorem belongs here because it is an
internal quadratic-form bridge, not a second class-field carrier.

#### 4.3 The quadratic Hasse norm adapter

Specialize `cyclicHasseNorm` to `K(√d)/K` and prove that its local norm condition agrees with
representation by `⟨1,-d⟩` at every finite, real, and complex place. Keep inseparable and
characteristic-two cases out: number fields have characteristic zero.

*Prerequisites:* R Class Field Theory `cyclicHasseNorm`; R Quadratic Form Invariants norm
equation and binary representation criterion.

#### 4.4 Hilbert sign prescription and the Hasse product

Prove the number-field sign-prescription theorem: for a finite even set of finite or real places
there exist `a,b ∈ Kˣ` whose local Hilbert symbol is `-1` exactly on that set. State the version
with a prescribed `b` nonsquare at every exceptional place. This is O'Meara 71:19 and 71:19a and
is used to correct finitely many Hasse signs in Layer 7.

Also prove the Hasse-invariant product formula for one global form from
`hilbertSymbol_productFormula` by multiplying over the pairs in a diagonalization.

*Prerequisites:* R Class Field Theory `hilbertProductFormula`; R Quadratic Form Invariants
`hilbertSymbol_productFormula`; L 4.1.

#### 4.5 Openness and continuity used in induction

Prove exactly the topological facts hidden by the phrase “choose sufficiently close”:

- a base-changed quadratic form is continuous in coordinates;
- `(K_vˣ)²` is open at every finite place;
- `ℝˣ² = ℝ_{>0}` is open in `ℝˣ`;
- represented nonzero values are stable under multiplication by a square.

At odd residue characteristic, openness follows from Hensel and `U_v(1) ⊆ (K_vˣ)²`. At a
dyadic place, consume the sharp local square theorem from Quadratic Form Invariants Layer 6A.
Do not apply a theorem carrying `[Algebra ℚ₂ K_v]` to an odd-residue field.

*Prerequisites:* R Quadratic Form Invariants Layers 1 and 6A; R Number Field Arithmetic Layer 5.1;
M Hensel's lemma; L 0.1.

### Layer 5: Hasse–Minkowski isotropy

#### 5.1 Binary, ternary, and quaternary cases

Build the three low-rank steps used by the theorem in 5.5. In each case assume that the regular
form is isotropic at every finite and real completion. These cases are separate submilestones,
not explanatory suggestions that an implementation may collapse.

**Binary.** Local isotropy makes the discriminant `[-1]` at every place. The global square theorem
makes it `[-1]` over `K`, and the supplier's binary criterion makes `Q` a hyperbolic plane.

**Ternary.** After scaling and diagonalization, write
`Q ≅ ⟨-a⟩ ⊥ ⟨1,-d⟩` with `d` a nonsquare. Local isotropy says that `a` is a local norm from
`K(√d)` at every place. The quadratic Hasse norm adapter makes it a global norm, so `Q` is
isotropic.

**Quaternary.** First suppose `d(Q)=[1]`. Take any regular ternary subspace `U`. Prove the
field-generic O'Meara 42:12 lemma: a regular ternary subspace of a regular quaternary space of
discriminant `[1]` is isotropic exactly when the ambient space is. It follows from the
representation criterion and the hyperbolic-plane criterion, not from a local classification.
Thus `U` is locally isotropic and the ternary case makes it globally isotropic.

For general quaternary discriminant, pass to `E=K(√d(Q))`; the discriminant becomes a square, so
the preceding subcase applies over `E`. Descend isotropy using O'Meara 58:7, which must be proved
as a field-generic quaternary descent lemma.

*Source:* O'Meara 66:1, with supporting results 42:12, 58:7, 63:14, 65:15, and 65:23.

*Prerequisites:* L 0.2, L 4.2, L 4.3; R Quadratic Form Invariants representation,
hyperbolic-plane, Witt, and local-classification milestones.

#### 5.2 Why rank four is not the general induction

Record and prove the finiteness boundary. In the higher-rank argument one splits
`Q=U⊥W` with `U` binary and needs the set of places where `W_v` is anisotropic to be finite. That
uses `dim W ≥ 3`. For quaternary `Q`, the complement `W` is binary and the exceptional set can be
infinite: `⟨1,1⟩` over `ℚ` is anisotropic at every prime `p ≡ 3 (mod 4)` and at the real place.
Therefore weak approximation cannot handle the quaternary case.

*Prerequisites:* L 2.2; R Quadratic Form Invariants Layer 6D.

#### 5.3 The local represented values in the higher-rank case

For `Q=U⊥W` with `U` binary and `dim W≥3`, let
`T={v | W_v is anisotropic}`, including real places. Prove `T` finite. At each `v∈T`, local
isotropy of `Q_v` supplies vectors `x_v∈U_v`, `y_v∈W_v` with

```text
b_v := Q(x_v) = -Q(y_v) ≠ 0.
```

If `U_v` is isotropic, use universality of the hyperbolic plane. If it is anisotropic, decompose a
nonzero isotropic vector of `U_v⊥W_v`; neither component can vanish.

*Prerequisites:* L 2.2; R Quadratic Form Invariants Layer 0 representation criterion and
Layer 1 hyperbolic-plane theory.

#### 5.4 Rank at least five: approximate the vector

For each `v∈T`, use 4.5 to choose a neighborhood `N_v` of `x_v` on which

```text
Q(z)/b_v ∈ (K_vˣ)²  and  Q(z) ≠ 0.
```

Use vector weak approximation on the two coordinates of `U` to choose one global `x∈U(K)` whose
image lies in every `N_v`, and **define** `b:=Q(x)`. Then `b` is globally represented by `U` by
construction. At every exceptional place `b/b_v` is a square, so scaling `y_v` shows that `-b` is
represented by `W_v`. Away from `T`, `W_v` is isotropic and hence universal. Therefore
`⟨b⟩⊥W` is locally isotropic; the induction hypothesis makes it globally isotropic and gives
`y∈W(K)` with `Q(y)=-b`. The pair `(x,y)` is a nonzero isotropic vector of `Q`.

⚠ Do not choose an arbitrary global scalar in prescribed local square classes. That would show
only that `-b` is globally represented by `W`; it would not show that `b` is globally represented
by `U`, and the final isotropic vector needs both equations.

*Prerequisites:* L 4.1, L 4.5, L 5.3, and the induction hypothesis at rank one less.

#### 5.5 Hasse–Minkowski isotropy and nearby false statements

For a finite-dimensional regular form `Q` over a number field, prove

```text
Q is isotropic over K ↔ IsLocallyIsotropic Q.
```

Ranks zero and one are immediate: a regular form of either rank is anisotropic globally and at
every completion. Thus a locally isotropic regular form has rank at least two. Use 5.1 in ranks
two through four and 5.2–5.4 for the rank-at-least-five induction. The forward implication is
scalar extension of a nonzero isotropic vector.

*Prerequisites:* L 0.2, L 5.1, L 5.2, L 5.3, L 5.4.

Alongside the theorem, prove or record counterexamples:

- isotropy at every real completion is not enough;
- isotropy at all but one completion is not enough;
- indefiniteness at one real embedding is not enough;
- the theorem is false for singular forms if “isotropic” is replaced by a classification claim
  without keeping radicals;
- no clause here extends the theorem to characteristic two.

The worked form `⟨1,1,-3⟩` over `ℚ` supplies the first counterexample and exhibits the obstruction
at `3`.

### Layer 6: representation and isometry

#### 6.1 Scalar representation

For regular `Q` and nonzero `a∈K`, prove

```text
Q represents a over K ↔ Q_v represents a at every finite and real place.
```

Apply Layer 5 to `⟨-a⟩⊥Q`. State the zero scalar separately: every quadratic form represents zero
at the zero vector, so folding it into the unit-valued theorem destroys the regular reduction.

*Prerequisites:* L 5.5; R Quadratic Form Invariants representation criterion.

#### 6.2 Representation of forms

For regular forms `Q` and `R`, prove

```text
Q is represented by R over K ↔ Q_v is represented by R_v at every finite and real place.
```

Induct on `rank Q`. Choose a nonzero value of `Q`, use 6.1 to represent it by `R`, split the same
one-dimensional regular form from both sides, use Witt extension/cancellation locally, and apply
the induction hypothesis to the complements.

*Source:* O'Meara 66:3.

*Prerequisites:* L 6.1; R Quadratic Form Invariants Witt extension and cancellation.

#### 6.3 Hasse–Minkowski isometry

For regular finite-dimensional `Q` and `R`, prove

```text
Q ≃ R over K ↔ LocallyEquivalent Q R.
```

Forward is scalar extension of an isometry. Reverse: local equivalence gives equal rank; 6.2 gives
a representation of one form by the other; a representation of regular forms of equal finite
dimension is an isometry.

Suggested name:
`TauCeti.NumberField.QuadraticForm.hasseMinkowski_equivalent`.

*Source:* O'Meara 66:4.

*Prerequisites:* L 6.2, L 0.2.

### Layer 7: existence from compatible local invariants

Before constructing positive-rank invariant systems, prove that every regular rank-zero form over
`K` and every completion is isometric to the zero form. This is the unique rank-zero global class;
it has no unit-valued discriminant representative and is not forced into the carrier below.

#### 7.1 Local forms attached to an admissible system

From an admissible `I : GlobalFormInvariants K`, construct at each finite place a regular local
form with invariants `(I.rank, I.discr_v, I.finiteHasse v)` using
`exists_of_realization`. At a real place take the diagonal signature form from 1.2; at a complex
place take the standard form of the prescribed rank. Prove that all local discriminants come from
the one global class `I.discr`, that the Hasse signs have finite support, and that their total
product is one.

The construction is noncanonical and should be exposed as an existence theorem, not as a
definition selected by `Classical.choose` that downstream mathematics must unfold.

*Prerequisites:* L 3.2, L 1.2; R Quadratic Form Invariants `exists_of_realization`.

#### 7.2 Existence with prescribed local behavior

Prove O'Meara 72:1 in number-field form. Given one regular rank-`n` form `U_v` over every finite,
real, and complex completion, assume:

1. their discriminants are the localizations of one `d₀∈Kˣ/(Kˣ)²`;
2. their finite Hasse signs are `1` almost everywhere;
3. the product of the finite and real Hasse signs is `1`.

Then there is a regular global form `V` whose localization is isometric to `U_v` at every place.
The reverse implication is 2.2 and 4.4.

Pin the constructive proof route.

1. Put all archimedean places and all places with nontrivial target Hasse sign into a finite set
   `T`. Diagonalize the target local forms on `T`.
2. Approximate the first `n-1` local coefficients by global `a₁,…,a_{n-1}` while preserving their
   local square classes. Choose the last global coefficient so the discriminant is `d₀`. This
   gives a global form `W` matching every target in `T`.
3. Let `R` be the finite set of remaining places where the Hasse signs of `W_v` and `U_v` differ.
   The product condition makes `R` even.
4. Use 4.4 to construct binary planes `P,P'` of the same discriminant which are locally isometric
   off `R` and nonisometric on `R`.
5. Use the local representation criterion and Layer 6.2 to represent `P'` by `P⊥W`, then take the
   regular orthogonal complement `V`. Witt cancellation and local classification show
   `V_v≃U_v` everywhere.

Do not replace this proof by “apply Hasse–Minkowski”: Layer 6 gives uniqueness/local-global
isometry once a global form exists; it does not manufacture the form from a family of local
spaces.

*Source:* O'Meara 72:1, with 71:19 and 66:3.

*Prerequisites:* L 4.1, L 4.4, L 6.2; R Quadratic Form Invariants local classification,
realization, and Witt cancellation.

#### 7.3 Realization of admissible invariant systems

Combine 7.1 and 7.2. Prove:

```text
I.IsAdmissible ↔ ∃ Q regular over K, globalInvariants Q = I.
```

The reverse implication is 3.3. The forward implication is the global existence theorem. Include
a form-level theorem returning local isometries, not merely equality of invariant records.

Suggested name: `exists_globalForm_of_isAdmissible`.

*Prerequisites:* L 3.3, L 7.1, L 7.2.

#### 7.4 Uniqueness

Any two global realizations of the same admissible invariant system are isometric. At finite
places use classification by `(n,d,s)`, at real places use signature, at complex places use rank,
and then apply 6.3.

*Prerequisites:* L 6.3, L 7.3; R Quadratic Form Invariants Layer 6D; L 1.2.

### Layer 8: global classification and Witt consequences

#### 8.1 Complete invariant theorem

Prove that regular positive-rank forms over `K` are classified by:

- dimension;
- the global plain discriminant;
- the positive index at each real place;
- the finite local Hasse invariant at each finite place;
- finite support and the single product compatibility relation.

Equivalently, `globalInvariants` induces a bijection from positive-rank global isometry classes to
admissible invariant systems. State both the extensional isometry criterion and the bijection,
then adjoin the unique rank-zero class to obtain the classification of all regular
finite-dimensional forms.

*Source:* O'Meara 66:5 for completeness and 72:1 for realization.

*Prerequisites:* L 7.3, L 7.4.

#### 8.2 Hyperbolicity and the global Witt kernel

Give invariant criteria for hyperbolicity and for two forms to have the same Witt class. Prove
that a regular form which is hyperbolic at every finite and real completion is hyperbolic over
`K`, by Hasse–Minkowski plus Witt cancellation. Keep parity explicit: a hyperbolic form has even
rank.

*Prerequisites:* L 6.3; R Quadratic Form Invariants hyperbolic-plane theory and Witt cancellation.

#### 8.3 Injectivity of the global-to-local Witt map

Only after the supplier's `wittRing K` and its localization maps are genuine carriers, define the
global-to-local map to the family of finite and real Witt groups and prove it injective. Its kernel
statement is 8.2. Do not define a `Prop`-valued stand-in for the Witt ring, and do not claim a
surjectivity or exact-sequence theorem here; realization is stated on the explicit admissible
invariant carrier of Layer 7.

*Prerequisites:* L 8.2; R Quadratic Form Invariants `wittRing`, `toWittRing` and localization API.

#### 8.4 The form-theoretic `SO` kernel consequence

Export the exact statement needed downstream: a regular form (or twist of a fixed regular form)
of the same dimension as `Q` which is isometric to `Q` at every finite and real place is globally
isometric to `Q`. This is a named corollary of 6.3.

Orthogonal and Spin Groups may identify its own `H¹(K,SO(Q))` classes with such twists and deduce
that the relevant localization kernel has one element. This roadmap defines no `H¹`, pointed set,
or Tate–Shafarevich set.

Suggested name: `equivalent_of_locallyEquivalent`.

*Prerequisites:* L 6.3.

### Layer 9: worked examples and regression tests

#### 9.1 A finite obstruction invisible over `ℝ`

For `q=⟨1,1,-3⟩` over `ℚ`, prove:

- `q` is isotropic over `ℝ`;
- `q` is anisotropic over `ℚ₃` (reduce modulo `3` and use descent);
- hence `q` is anisotropic over `ℚ` by Layer 5.

This is the regression test that real signatures alone are not a global classification.

#### 9.2 A positive isometry example

Prove `⟨1,1,-1⟩ ≃ ⟨1,2,-2⟩` over `ℚ` both by an explicit hyperbolic-plane calculation and by
the global invariant criterion. The two proofs test that the classification theorem agrees with
elementary Witt theory.

#### 9.3 Existence over a nontrivial number field

Let `K=ℚ(√5)`, with its two real places. Build an admissible rank-three system with discriminant
`[1]`, positive indices `3` and `1`, Hasse sign `-1` at one chosen finite place above `2`, and
Hasse sign `1` at all other finite places. The real Hasse signs are respectively `1` and `-1`, so
the total product is `1`. Use 7.3 to produce a global form and verify its two different real
signatures and its chosen finite obstruction.

This example is required: a roadmap whose only computed fields are `ℚ` can accidentally encode a
single-real-place theorem while claiming number-field generality.

#### 9.4 Small-rank nonexamples

Construct records that satisfy finite support and product one but violate the rank-one or rank-two
local realization condition, and prove they are not admissible. Include a rank-two local triple
with discriminant `[-1]` and Hasse sign `-1`.

#### 9.5 The quaternary finiteness trap

Prove that `⟨1,1⟩` over `ℚ` is anisotropic at every `p≡3 mod 4`. Use it to show explicitly that
the exceptional set in the rank-at-least-five induction can be infinite when the complement is
binary. This test prevents a refactor from silently folding the quaternary case into Layer 5.4.

## Ordering and parallel work

The dependency order is:

```text
0 ─→ 1 ─┐
│       ├→ 3 ───────────────→ 7 ─→ 8 ─→ 9
└→ 2 ───┘                    ↑
    │                        │
    └→ 4 ─→ 5 ─→ 6 ─────────┘
```

After Layer 0, the archimedean package (Layer 1) and finite-place package (Layer 2) can proceed in
parallel. Layer 4 can proceed beside the invariant carrier once the four supplier contracts are
fixed. Layer 7 consumes both the local-global isometry theorem and the invariant carrier.

## Acceptance criteria

- [ ] All headline theorems are over an arbitrary number field, with `ℚ` only as an example.
- [ ] Localization is actual `QuadraticForm.baseChange` at canonical finite and archimedean maps.
- [ ] Complex places are omitted only after automaticity is proved.
- [ ] Hasse–Minkowski has separate binary, ternary, quaternary, and rank-at-least-five proofs.
- [ ] The higher-rank proof approximates a vector and defines its scalar value afterward.
- [ ] The quaternary proof does not use finiteness of anisotropic places for a binary complement.
- [ ] Finite Hasse support is proved from one global diagonalization and good-place calculations.
- [ ] Admissibility states both small-rank local realization exceptions explicitly.
- [ ] Global existence proves O'Meara 72:1 and is not inferred from uniqueness.
- [ ] Classification includes dimension, global discriminant, all real signatures, all finite
      Hasse signs, finite support, and the product relation.
- [ ] The Witt injectivity theorem uses a genuine supplier carrier.
- [ ] The `SO` consumer receives only a form-theoretic corollary; no duplicate nonabelian
      cohomology is introduced.
- [ ] The `ℚ(√5)` example exercises more than one real place.
- [ ] No code, proof organization, or project-specific statement shape is copied from an external
      formalization without the coordination recorded in the private migration and provenance
      ledger.

## References

- O. T. O'Meara, *Introduction to Quadratic Forms*, Springer (1963; Classics reprint 2000),
  primary. 42:11–12 (representation and the quaternary/ternary lemma), 58:7 (quaternary
  descent), 63:14 and 63:20–23 (local theory), 65:15 and 65:23 (global square and Hasse norm),
  66:1 (isotropy), 66:3 (representation), 66:4 (isometry), 66:5–6 (complete invariants and finite
  support), 71:18–19a (Hilbert reciprocity and sign prescription), and 72:1 (existence with
  prescribed local behavior).
- T. Y. Lam, *Introduction to Quadratic Forms over Fields*, GSM 67, AMS (2005), especially the
  chapters on Witt theory, local fields, and quadratic forms over global fields.
- J.-P. Serre, *A Course in Arithmetic*, GTM 7, Springer (1973), Chapters III–IV. It is a
  companion for the `ℚ` examples and the local invariant convention, not the sole source for the
  arbitrary-number-field theorem.
- J. W. S. Cassels, *Rational Quadratic Forms*, Academic Press (1978), for rational examples and
  constructive comparison. Its scope is `ℚ` and does not ground number-field generality.
- J. Neukirch, *Algebraic Number Theory*, Springer (1999), the approximation and global class
  field theory inputs.
- J. Milnor and D. Husemoller, *Symmetric Bilinear Forms*, Springer (1973), for Witt groups and
  local-global structure.

## Ownership and coordination

- Global Number Fields supplies weak approximation and no quadratic-form carrier.
- Number Field Arithmetic supplies canonical completion infrastructure and no form invariant.
- Class Field Theory supplies the cohomological Hilbert product and Hasse norm theorem and never
  imports this roadmap or Quadratic Form Invariants.
- Quadratic Form Invariants supplies the local form theory and the comparison between its
  norm-equation Hilbert symbol and the cohomological pairing. It does not supply a global Hasse
  principle.
- Orthogonal and Spin Groups consumes `hasseMinkowski_equivalent` and
  `equivalent_of_locallyEquivalent` and owns the translation to `SO` torsors.
- Integral Lattices consumes the rational-form classification and owns integral localizations,
  genera, and spinor genera.
- Existing external Hasse-principle formalizations are prior art only. Revisions, licences, and
  contact conditions are recorded in the private migration and provenance ledger, not in the
  normative roadmap.
