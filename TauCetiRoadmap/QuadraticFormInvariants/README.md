# Roadmap: quadratic forms and cohomological invariants

**Summary.** The arithmetic theory of quadratic forms over a field in which `2` is invertible,
from diagonal forms to mod-2 Galois cohomology: Witt theory, quaternion algebras, the classical
invariants and the Witt ring (Layers 0–4); the Brauer-valued Hasse and Clifford invariants
(Layer 5); the quadratic defect, the Hilbert symbol and the classification of forms over a
nonarchimedean local field (Layer 6); the comparison of the Brauer group with `H²` and the
cup-norm theorem (Layer 7); Stiefel–Whitney classes in degrees one and two (Layer 8); and the
Scharlau transfer with the relative Stiefel–Whitney formula for a quadratic extension (Layer 9).
Its high points are:

- the four-fold splitting criterion for quaternion algebras (Layer 2);
- the classification of forms over a nonarchimedean local field by `(dim, d, s)` (Layer 6D);
- Kahn's relative Stiefel–Whitney formula for transferred forms, through the value of the Evens
  norm on a Kummer class (Layer 9).

## Scope and ownership

**What this roadmap covers.** Layers 0 to 9 below, over a base field `K` with
`[Invertible (2 : K)]`, in mod-2 Galois cohomology of degrees one and two. Every milestone of
every layer is implemented in Tau Ceti, and the supplier contracts below name the native
declaration and file for each one. The layers state each milestone and cite the declaration that
discharges it; a contributor extends the native files rather than building a second copy. This
roadmap therefore owns no open milestone. What it does own are the worked examples under each
layer's Examples that cite no Tau Ceti declaration. They are acceptance checks on the native
milestones, and one of them is a statement in its own right: the ramified-base control of
Layer 6's Examples, that `1 + π` is a norm from `K(√5)` over `K = ℚ_2(π)`, `π² = 2`, which pins
6B's maximal-order families of unit norms.

`Suggested.lean` states the five headline theorems as examples proved by Tau Ceti, and declares
the names that other roadmaps import from this namespace, each an abbreviation of a Tau Ceti
declaration, a definition read off one, or a theorem whose proof is a Tau Ceti theorem:

- `RegularFormClass` and `formClass` (exported from Tau Ceti) and `discr`
  (`GlobalQuadraticForms`);
- `hilbertSymbol` and `localHasse` (`GlobalQuadraticForms`, `OrthogonalSpinGroups`; and
  `ClassicalArithmeticCompletion` cites `hilbertSymbol`), and `hasseInvariant_eq_localHasse`
  (`OrthogonalSpinGroups`);
- `hilbertSymbol_neg_self`, `hilbertSymbol_mul` and `exists_hilbertSymbol_eq_neg_one`
  (`GlobalQuadraticForms`).

A consumer that moves to the Tau Ceti name of one of these needs nothing from this namespace.

Eleven names that other roadmaps cite from this namespace are Tau Ceti's declarations, and this
roadmap declares no copy of them; one line per name, old → new:

- `signedDiscr` → `TauCeti.RegularFormClass.signedDiscr`, valued in the additive
  `TauCeti.SquareClassGroup K`; it reads in `Kˣ ⧸ (Kˣ)²` through
  `TauCeti.multiplicativeSquareClassEquiv`, as `discr` does;
- `localHasse_congr` → `TauCeti.RegularFormClass.localHasse_congr`, stated on the classes of the
  two tuples; `TauCeti.RegularFormClass.localHasse_mk` turns it into the statement for this
  roadmap's `localHasse` of a tuple;
- `discr_mk` → `TauCeti.RegularFormClass.discr_mk`, read in `Kˣ ⧸ (Kˣ)²` through
  `TauCeti.multiplicativeSquareClassEquiv_mk`;
- `hilbertSign` → `TauCeti.hilbertSign`, the dictionary `ZMod 2 → ℤˣ` sending `0` to `+1` and `1`
  to `−1` (`TauCeti/Data/ZMod/IntUnitsPower.lean`);
- `wittRing` → `TauCeti.WittRing`, the Witt ring `W(K)` of Layer 4;
- `toWittRing` → `TauCeti.WittRing.mk`, the quotient map `Ŵ(K) →+* W(K)`;
- `hilbertSymbol_comm` → `TauCeti.hilbertSymbol_comm`, symmetry over every field in which `2` is
  invertible (6C item 3);
- `hilbertSymbol_unramified` → `TauCeti.exists_unramified_class`, which gives a nonsquare `Δ` of
  valuation zero whose norms from `K(√Δ)` are the elements of even valuation, followed by
  `TauCeti.hilbertSymbol_unramified`, which turns that norm criterion into
  `(Δ, b)_K = (−1)^(v_K(b))` (6B, evaluation against the unramified class);
- `exists_of_realization` → `TauCeti.RegularFormClass.exists_of_realization`, the realization of
  local invariants (6D);
- `hilbertSymbol_eq_cohomological` → `TauCeti.hilbertSymbol_eq_cohomological`, the comparison of
  the norm-equation symbol with the cohomological one (6C item 13);
- `hilbertSymbol_productFormula` → `TauCeti.hilbertSymbol_productFormula`, Hilbert reciprocity in
  sign form: over a number field the symbols at the finite places, read in the completions, and at
  the real places multiply to `1` (6C item 14).

**Excluded.** The exclusions are deliberate, and a separate roadmap for any of them is welcome.

- The characteristic-2 theory of quadratic and bilinear forms, that is the Arf invariant and
  quasilinear forms. EKM Ch. II §10 (totally singular forms, which are zero unless the
  characteristic is `2`) and Example 13.5 (2) (the discriminant in characteristic `2` is the Arf
  invariant) record how different that theory is, and every statement here assumes `2`
  invertible.
- The deep theory of Pfister forms: function-field methods, the Arason–Pfister Hauptsatz, the
  Milnor conjecture, the norm-residue theorem, and each classification statement that rests on
  them. Pfister forms in every degree, and the elementary generation statements for `I`, `I²` and
  `I³` that Layer 5 consumes, are in scope.
- The cohomological invariant theory of Garibaldi–Merkurjev–Serre beyond Stiefel–Whitney classes.
- Graded mod-2 Galois cohomology in every degree. Layers 7 to 9 work in degrees `1` and `2`, which
  is what the Brauer comparison, the Hasse and Clifford comparisons, and the relative
  Stiefel–Whitney formula for a quadratic extension need. The total Stiefel–Whitney class, the
  Evens norm in every degree, and Kahn's Théorème 2 for an arbitrary finite separable extension
  belong to a development of graded continuous cohomology, of which this roadmap's degree-one and
  degree-two statements are special cases.
- Hasse–Minkowski, weak approximation for global forms, local-global isotropy and isometry, and
  classification or realization of forms over number fields: these are
  [`GlobalQuadraticForms`](../GlobalQuadraticForms/README.md)'s, which consumes the local
  invariants and the product formula named above.

**Boundaries with neighbouring roadmaps.**

- [Class Field Theory](../ClassFieldTheory/README.md) owns the cohomological Kummer-cup Hilbert
  pairing, the local invariant and Hilbert reciprocity (its Layers 5 and 14). The norm-equation
  symbol of Layer 6C is compared with that pairing, and the dependency runs
  `ClassFieldTheory → QuadraticFormInvariants`, never the reverse. In Tau Ceti both the comparison
  (`TauCeti.hilbertSymbol_eq_cohomological`) and the sign form of reciprocity
  (`TauCeti.hilbertSymbol_productFormula`) are proved from the native class field theory, and a
  consumer cites both by their Tau Ceti names.
- [Profinite Cohomology](../ProfiniteCohomology/README.md) owns continuous cohomology and its
  operations: the carrier, the cup product, restriction, inflation, corestriction, Kummer theory
  and the index-two Evens norm (its Layers 1, 8–10, 12 and 13). Layers 7 to 9 here add only what
  is specific to `μ₂` and to quadratic forms.
- [Local Fields Ramification](../../Completed/LocalFieldsRamification/README.md) owns the general
  arithmetic of a nonarchimedean local field: finite extensions as local fields, the normalized
  valuation, the unit filtration, the Teichmüller section, ramification and residue degrees, power
  classes and unramified extensions. All of it is Tau Ceti's, recorded under the items *Finite
  extensions*, *Valuations and `e`, `f`*, *Units*, *Power classes* and *Unramified extensions* of
  that roadmap's *Exact supplier contracts*. Sublayer 6A defines no second valuation or
  filtration, and 6C no second local-field structure on a quadratic extension.
- [Semisimple Algebras](../RepresentationTheory/SemisimpleAlgebras/README.md) owns central simple
  algebras, Skolem–Noether, the Brauer group and splitting fields (its Layers 4–6). Layer 5 takes
  the quaternion and Clifford cases and the 2-torsion package; Layer 7B takes the crossed-product
  comparison. Where both roadmaps name the same fact, the semisimple-algebras statement is the
  statement of record.
- The [multiquadratic roadmap](../../Completed/Multiquadratic/README.md) owns multi-root towers of
  quadratic extensions. This roadmap covers the form theory of one quadratic step; the shared
  language is `TauCeti.SquareClassGroup`.
- Other formalizations cover overlapping ground, including a Hasse–Minkowski development over `ℚ`
  and a staging repository for the Brauer group. They are evidence that the statements are
  formalizable, not prescriptions of form and not ownership claims.

## Conventions

Each layer states its results against this list.

- **Base field.** `K` is a field with `[Invertible (2 : K)]`. Mathlib's own quadratic-form theory
  uses this hypothesis in `QuadraticForm/Basis.lean`, in `AlgClosed.lean`, and for the `associated`
  bilinear form, so this roadmap follows it rather than `[NeZero (2 : K)]`. Over a field the two
  hypotheses are interderivable. The multiquadratic roadmap states its material with
  `[NeZero (2 : K)]` or `[CharZero K]`, and the conversion between the two is part of the
  interface.
- **Forms and regularity.** A form is a `QuadraticForm K V`, that is a `QuadraticMap K V K`.
  Finiteness is `[FiniteDimensional K V]`, carried as an instance and never bundled. Regularity is
  `QuadraticMap.Nondegenerate Q`, the EKM-style predicate of `QuadraticForm/Radical.lean`. A proof
  that wants the bilinear form converts through `QuadraticMap.nondegenerate_associated_iff` or
  `(QuadraticMap.associated Q).SeparatingLeft`, which is the hypothesis of
  `QuadraticForm.equivalent_weightedSumSquares_units_of_nondegenerate'`. Anisotropy is
  `QuadraticMap.Anisotropic`, that is `∀ v, Q v = 0 → v = 0`. The word "isotropic" always means
  `¬ Q.Anisotropic`, the existence of a **nonzero** `v` with `Q v = 0`, and is never a new
  predicate. ⚠ Isotropy is not "represents `0`": every form represents `0` through the zero vector,
  an anisotropic form included.
- **Equivalence and diagonal forms.** Isometry classes use `QuadraticMap.Equivalent`, that is
  `Nonempty (Q₁.IsometryEquiv Q₂)`, which already compares forms on different spaces. The diagonal
  form `⟨a₁, …, aₙ⟩` is `QuadraticMap.weightedSumSquares K w` with `w : Fin n → K`; for a regular
  form the weights are units, `w : Fin n → Kˣ` coerced into `K`. The orthogonal sum of forms on
  different spaces is `QuadraticMap.prod`, and scaling is `a • Q`.
- **Square classes.** The square-class group is Tau Ceti's `TauCeti.SquareClassGroup K`, which is
  `Additive Kˣ ⧸ (Subgroup.square Kˣ).toAddSubgroup`, an `𝔽₂`-vector space, with the class
  `TauCeti.squareClass u` of a unit. Its multiplicative avatar is the literal quotient
  `Kˣ ⧸ Subgroup.square Kˣ`, and `TauCeti.multiplicativeSquareClassEquiv` identifies the two,
  sending the class of a unit to its `squareClass` (`TauCeti.multiplicativeSquareClassEquiv_mk`).
  In a quotient-free statement, "same square class" is `IsSquare (a * b)` for units `a b : Kˣ`, as
  in `TauCeti.squareClass_eq_iff_isSquare_mul`.
- **Representation and value sets.** Tau Ceti's `QuadraticMap.Represents Q a : Prop` is
  `∃ v, Q v = a` for `a : K`, and `QuadraticMap.unitValueSet Q : Set Kˣ` is
  `{a : Kˣ | Represents Q (a : K)}`, the classical `D(q)` of nonzero represented values. The two
  are kept apart. `Represents Q 0` is **always true**, for every `Q` and every space, because
  `Q 0 = 0`; it is never a nontrivial fact about `Q`. Every classification statement below means
  `D(q)`, and a value set that contains `0` makes several of them false.
- **Discriminant and signed discriminant.** For `q ≅ ⟨a₁, …, aₙ⟩` the *discriminant* is
  `d(q) = a₁ ⋯ aₙ` modulo squares, and the **signed discriminant** is
  `d±(q) = (−1)^(n(n−1)/2) · d(q)`. Both are Tau Ceti's, `TauCeti.RegularFormClass.discr` and
  `TauCeti.RegularFormClass.signedDiscr`, valued in the additive `SquareClassGroup K`, where the
  sign is written `n.choose 2 • squareClass (−1)`. This roadmap's `discr` is the first read in
  `Kˣ ⧸ (Kˣ)²` through `TauCeti.multiplicativeSquareClassEquiv`, under the name that
  `GlobalQuadraticForms` consumes; it is not a second construction. Serre's classification
  invariant and the Stiefel–Whitney class `w₁` use the plain `d`. The Witt-ring isomorphism
  `I/I² ≅ Kˣ/(Kˣ)²` and the quadratic-extension dictionary use `d±`. The translation is
  `TauCeti.RegularFormClass.signedDiscr_eq_sign_add_discr`, and every proof converts through it.
- **The symbol is a quaternion algebra first and a group element later.** For `a, b ∈ Kˣ` the
  symbol `(a, b)` is the quaternion algebra `ℍ[K, a, b]`, Mathlib's two-parameter notation for
  `QuaternionAlgebra K a 0 b`, with `i² = a`, `j² = b` and `ij = −ji = k`. Through Layer 4 the
  symbol is an algebra up to isomorphism: `(a,b) = (c,d)` means
  `Nonempty (ℍ[K,a,b] ≃ₐ[K] ℍ[K,c,d])`, and `(a,b) = 1` means
  `Nonempty (ℍ[K,a,b] ≃ₐ[K] Matrix (Fin 2) (Fin 2) K)`. In Layer 5, where the Brauer group is a
  group, `[(a,b)]` is an element that can be multiplied. In Layer 6 the local symbol `(a,b)_K`
  takes values in `{±1}`. No layer multiplies symbols before the layer that supplies the
  multiplication.
- **Two Hasse invariants, both named.** For `q ≅ ⟨a₁, …, aₙ⟩`, `s(q) = ∏_{i<j} (aᵢ, aⱼ)`, with the
  empty product for `n ≤ 1`. This is the Lam and Serre convention (Lam V.3.17; Serre's `ε` in
  *A Course in Arithmetic* IV.2.1). It occurs twice with two codomains:
  - `TauCeti.RegularFormClass.hasseInvariant q : BrauerGroup K` in Layer 5;
  - `TauCeti.RegularFormClass.localHasse q : ℤˣ` over a nonarchimedean local field in Layer 6,
    built from the `{±1}`-valued Hilbert symbol and independent of Layer 5; this roadmap's
    `localHasse` is the same product on a diagonal tuple.

  The theorem that the second is the image of the first is stated at the end of Layer 6 as
  `hasseInvariant_eq_localHasse`, and no earlier statement uses it. Two translations to other
  sources:
  - **O'Meara's Hasse symbol**, near 63:20, is `S(q) = ∏_{i≤j} (aᵢ, aⱼ) = s(q) · (d(q), −1)`;
  - the **Witt–Clifford invariant** `c(q)`, the Brauer class of `C(q)` or of `C₀(q)` by parity
    (Lam V.3.12), satisfies Lam V.3.20:
    `c = s · (−1, d)^((n−1)(n−2)/2) · (−1,−1)^((n+1)n(n−1)(n−2)/24)`, and
    `c = s · (−1,−1)^(m(m−1)/2)` on `I²` with `dim = 2m`.

  ⚠ Lam records that C. T. C. Wall's published version of the second translation is incorrect
  (Lam, p. 120, "Caution"). Do not import that formula from a secondary source.
- **Hilbert symbol.** `(a,b)_K = +1` when `b = x² − a y²` has a solution `x, y ∈ K`, and `−1`
  otherwise. This is a definition over every field (`TauCeti.hilbertSymbol`), not a consequence of
  a classification, because it needs only the norm equation; every theorem about it carries the
  local hypotheses it needs. It agrees with Serre's solvability form, the statement that
  `z² − ax² − by² = 0` has a nontrivial zero (*A Course in Arithmetic* III.1.1), and with the norm
  criterion `b ∈ N(K(√a)ˣ)`. After symmetry, the orientation by `b ∈ N(K(√a)ˣ)` and Serre's
  orientation `(a,b) = 1` iff `a ∈ N(K(√b)/K)` are interchangeable, so a source may be read in
  either. Values live in `ℤˣ = {±1}`; the additive avatar is `ZMod 2` through
  `TauCeti.hilbertSign`, and the cohomological avatar is `μ₂ ≃ ZMod 2` through
  `TauCeti.mu2EquivZMod2` in Layer 7.
- **Steinberg hypotheses.** Wherever `(a, 1−a)` or `(a) ∪ (1−a)` occurs, the statement carries
  `a : Kˣ` together with `h : (1 : K) − a ≠ 0`, so that `1 − a` has a unit coercion.
- **Pfister forms.** `⟨⟨a⟩⟩ = ⟨1, −a⟩` and `⟨⟨a, b⟩⟩ = ⟨1, −a⟩ ⊗ ⟨1, −b⟩ ≅ ⟨1, −a, −b, ab⟩`. This
  is the minus-sign convention of Lam Ch. X and of Elman–Karpenko–Merkurjev; some older sources use
  `⟨1, a⟩` factors, so flag the convention at each citation. The `n`-fold `⟨⟨a₁, …, aₙ⟩⟩` is
  `TauCeti.pfisterFormClass`, the product of the classes `1 + ⟨−aᵢ⟩`; its diagonal tuple
  `TauCeti.pfisterForm` carries `∏_{i ∈ S} (−aᵢ)` in slot `k`, where `S` is the set of positions
  at which the binary expansion of `k` has a `1`.
- **Transfer.** The Scharlau transfer `s_*(q)` of a form `q` over `L` is taken along a nonzero
  `K`-linear functional `s : L →ₗ[K] K`, for `L/K` finite separable
  (`QuadraticMap.scharlauTransfer`). The default functional is the trace `Algebra.trace K L`,
  written `Tr_*` (`QuadraticMap.traceTransfer`). Every theorem is stated for a general nonzero `s`,
  with the trace as the named instance. The nonzero functionals form a single `Lˣ`-orbit, and
  `s'_*(q) ≅ s_*(⟨λ⟩ ⊗ q)` when `s' = s ∘ (λ·)`.
- **Cohomological dictionary** for Layers 7 to 9. `Kˢ` is the separable closure and
  `G_K = Gal(Kˢ/K)`, Tau Ceti's `TauCeti.AbsoluteGaloisGroup K`. `H¹(G_K, μ₂) ≅ Kˣ/(Kˣ)²` is the
  Kummer isomorphism, and the class of `a` is written `(a)` (`TauCeti.kummerClass a`). The
  identification of `Br(K)[2]` with `H²(G_K, μ₂)` is proved in Layer 7B and is never assumed before
  it. The Stiefel–Whitney classes of `q ≅ ⟨a₁, …, aₙ⟩` in the two degrees used are
  `w₁(q) = ∑ᵢ (aᵢ)` and `w₂(q) = ∑_{i<j} (aᵢ)(aⱼ)`, the degree-one and degree-two parts of Delzant's
  total class `∏ᵢ (1 + (aᵢ))` (Delzant 1962; Kahn 1984, II.1.3). Here `w₁(q) = (d(q))` uses the
  plain discriminant and not `d±`.
- **The `Pin⁺` model and the explicit cochains** for Layer 9. The Clifford algebra of
  `(F², ⟨1, 1⟩)` is `M₂(F)` with `e₁ = diag(1, −1)`, `e₂ = [[0, 1], [1, 0]]` and
  `e₁² = e₂² = +1`, so that the lift of `C₂ ≀ C₂` is `D₁₆` and not `Q₁₆`; an orthogonal `x` acts
  on vectors by `v ↦ det(x) · x v xᵀ`; and `G_K` acts on the coordinates of the descended plane `W`
  by `ρ(g)ᵀ`, where `ρ` is the signed-permutation representation. An explicit `𝔽₂`-valued
  2-cocycle `f` of `G_K` satisfies `f(gh, j) + f(g, h) = f(h, j) + f(g, hj)`, a coboundary is
  `(g, h) ↦ ψ(h) − ψ(gh) + ψ(g)`, and the cup of two continuous homomorphisms is
  `(g, h) ↦ χ(g) ψ(h)`.
- **Additive against multiplicative.** Cohomology is additive and the Brauer group is a
  `CommGroup`. The coefficient modules are therefore `Additive Kˢˣ` and `μ₂ ≅ ZMod 2`, and every
  statement that compares the two worlds transports through `Additive`. The comparison of Layer 7B
  is an `≃+` out of `Additive (BrauerGroup K)`, and Layer 8's `w₂`, Clifford and Hasse identities
  are equations in `H²`, written additively. The prose keeps the multiplicative notation for
  Brauer classes and the product notation for the Hasse invariant.
- **The carrier for isometry classes.** Layers 3 to 9 speak of functions on isometry classes, and
  Layer 4 needs a ring whose elements are such classes. The carrier is Tau Ceti's
  `TauCeti.RegularFormClass K`, the quotient of the diagonal presentations
  `TauCeti.RegularFormPresentation K = Σ n, Fin n → Kˣ` by isometry of the forms
  `TauCeti.presentedForm p` that they present (`TauCeti.regularFormSetoid`). Only presentations of
  equal length are ever related (`TauCeti.fst_eq_of_presentedForm_equivalent`). Every regular form
  on a finite-dimensional space has a class `TauCeti.formClass Q hQ`, computed by any
  diagonalization (`TauCeti.formClass_mk`), and two regular forms are `Equivalent` exactly when
  their classes agree (`TauCeti.formClass_eq_iff`). Orthogonal sum and tensor product make the
  carrier a commutative semiring (`TauCeti.instCommSemiringRegularFormClass`) with the rank as a
  semiring map to `ℕ` (`TauCeti.RegularFormClass.rankHom`), and the class of a sum or a tensor
  product is the sum or product of the classes (`TauCeti.formClass_prod`,
  `TauCeti.formClass_tmul`). Scalar extension `TauCeti.RegularFormClass.baseChange` commutes with
  the rank and the discriminant (`TauCeti.RegularFormClass.rank_baseChange`,
  `TauCeti.RegularFormClass.discr_baseChange`). The descent principle
  `TauCeti.RegularFormClass.liftDiagonal` of Layer 0 turns a function of presentations into a
  function of classes; the Hasse invariants, `w₁` and `w₂` are descended through it.
  `QuadraticModuleCat` is the natural alternative, and this roadmap does not use it: a roadmap
  that offers two carriers makes the first implementer choose.

## Exact supplier contracts

- **From Mathlib.**
  - *Quadratic and bilinear forms* (`Mathlib/LinearAlgebra/QuadraticForm/`): `QuadraticMap`,
    `QuadraticForm`, `QuadraticMap.polar`, `QuadraticMap.associated`, `QuadraticMap.Anisotropic`,
    `QuadraticMap.weightedSumSquares`, `QuadraticMap.Equivalent`,
    `QuadraticForm.equivalent_weightedSumSquares` and its units version for nondegenerate forms
    (diagonalization is done, so consume it), `QuadraticMap.prod`, the tensor product of forms with
    `Invertible (2 : R)`, `QuadraticMap.radical` and `QuadraticMap.Nondegenerate`, and the
    classifications over `ℝ`, over `ℂ` and over an algebraically closed field, which are the model
    for the local classification. `LinearMap.BilinForm.Nondegenerate` and `SeparatingLeft` with
    orthogonality.
  - *Quaternion algebras* (`Mathlib/Algebra/Quaternion.lean`, `QuaternionBasis.lean`):
    `QuaternionAlgebra R c₁ c₂ c₃` with the notations `ℍ[R,c₁,c₂,c₃]`, `ℍ[R,c₁,c₂]` and `ℍ[R]`;
    `star` with `QuaternionAlgebra.mul_star_eq_coe`; `QuaternionAlgebra.Basis` and its `lift`,
    the universal property the splitting arguments use. `normSq` and the `DivisionRing` instance
    exist only for Hamilton's `ℍ[R]`, which is the archimedean instance `(−1,−1)_ℝ = −1`.
  - *Rank-2 algebras* (`Mathlib/Algebra/QuadraticAlgebra/`): `QuadraticAlgebra R a b` with `star`,
    `QuadraticAlgebra.norm`, `isUnit_iff_norm_isUnit` and the `Field` instance when
    `X² − bX − a` has no root. `QuadraticAlgebra K a 0` is the vehicle for `K(√a)` and its norm
    form `x² − ay²`; do not adjoin a square root by hand where this algebra serves.
  - *Central simple algebras and Clifford algebras*: `Algebra.IsCentral`, `CSA`,
    `IsBrauerEquivalent` and `BrauerGroup` as a quotient with no group structure
    (`Mathlib/Algebra/BrauerGroup/Defs.lean`); the Wedderburn theory; and
    `Mathlib/LinearAlgebra/CliffordAlgebra/`, which supplies base change, the grading, the even
    subalgebra and the quaternion equivalences but not central simplicity.
  - *Local fields* (`Mathlib/NumberTheory/LocalField/Basic.lean`): `IsNonarchimedeanLocalField K`
    for a field with a `ValuativeRel` and a topology, with `IsDiscreteValuationRing 𝒪[K]`,
    `Finite 𝓀[K]` and local compactness; `ℚ_[p]`, `ℤ_[p]` and Hensel's lemma; `legendreSym` and
    quadratic characters.
  - *Trace forms and cohomology*: `Algebra.traceForm` with `traceForm_nondegenerate` for a finite
    separable extension, which makes the trace a legitimate default functional in Layer 9;
    `continuousCohomology` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`);
    `SeparableClosure K` with the Krull topology.
- **From Tau Ceti.** These are the native files and declarations each layer cites; paths are
  under `TauCeti/`.

  | Layer | Native files | Principal declarations |
  |---|---|---|
  | 0 | `FieldTheory/SquareClassGroup/{Basic,Multiplicative}.lean`, `LinearAlgebra/QuadraticForm/RegularFormClass/{Basic,Descent,Semiring}.lean`, `LinearAlgebra/QuadraticForm/Diagonal/`, `LinearAlgebra/QuadraticForm/{Representation,Binary}.lean` | `TauCeti.SquareClassGroup`, `TauCeti.RegularFormClass`, `TauCeti.formClass`, `TauCeti.RegularFormClass.liftDiagonal`, `TauCeti.DiagonalChain`, `QuadraticMap.unitValueSet` |
  | 1 | `LinearAlgebra/QuadraticForm/Hyperbolic.lean`, `Witt/{Decomposition,Cancellation,Extension}.lean`, `OrthogonalGroup/Basic.lean`, `CartanDieudonne/Basic.lean` | `TauCeti.hyperbolicPlane`, `TauCeti.exists_hyperbolicPlane_prod_equivalent` |
  | 2 | `Algebra/Quaternion/{NormForm,Split,SquareSplit,Steinberg,SymbolEquiv,AlgEquiv,SplittingCriterion,Binary}.lean` | `QuaternionAlgebra.normForm`, `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae` |
  | 3 | `LinearAlgebra/QuadraticForm/RegularFormClass/{Discriminant,BaseChange}.lean` | `TauCeti.RegularFormClass.discr`, `TauCeti.RegularFormClass.signedDiscr` |
  | 4 | `LinearAlgebra/QuadraticForm/Witt/{Ring,FundamentalIdeal,Discriminant,Round}.lean`, `Witt/Pfister/` | `TauCeti.WittGrothendieckRing`, `TauCeti.WittRing`, `TauCeti.fundamentalIdeal`, `TauCeti.pfisterFormClass`, `TauCeti.oneFoldPfister_smul_equivalent_iff`, `TauCeti.twoFoldPfister_smul_equivalent_iff` |
  | 5 | `Algebra/BrauerGroup/Group.lean`, `Algebra/Quaternion/{BrauerClass,Subgroup}.lean`, `LinearAlgebra/QuadraticForm/RegularFormClass/{Hasse/Basic,Clifford}.lean`, `LinearAlgebra/QuadraticForm/Witt/Clifford.lean` | `TauCeti.BrauerGroup.instCommGroup`, `TauCeti.BrauerGroup.quaternionClass`, `TauCeti.RegularFormClass.hasseInvariant`, `TauCeti.RegularFormClass.cliffordInvariant`, `TauCeti.cliffordHomI2` |
  | 6 | `NumberTheory/LocalField/{Uniformizer,Squares,SquareClass}.lean`, `NumberTheory/HilbertSymbol/`, `NumberTheory/LocalField/QuadraticForm/` | `TauCeti.dyadicLevel`, `TauCeti.IsUniformizer`, `TauCeti.quadraticDefect`, `TauCeti.hilbertSymbol`, `TauCeti.hilbertSymbol_mul_right`, `TauCeti.RegularFormClass.localHasse`, `TauCeti.RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq`, `TauCeti.RegularFormClass.exists_of_realization`, `TauCeti.hilbertSymbol_padicTwo` |
  | 7 | `FieldTheory/GaloisCohomology/MuTwo/`, `Algebra/CrossedProduct/`, `Algebra/CentralSimple/FiniteGalois.lean` | `TauCeti.mu2EquivZMod2`, `TauCeti.kummerClass`, `TauCeti.h2MuToUnits`, `TauCeti.brauerCohomologyEquiv`, `TauCeti.brauer2EquivH2`, `TauCeti.brauerCohomologyEquiv_uliftEquiv`, `TauCeti.cup_kummerClass_eq_zero_iff`, `TauCeti.hilbertSymbol_eq_cohomological` |
  | 8 | `FieldTheory/QuadraticForm/StiefelWhitney/{Class,Hasse,Clifford}.lean` | `TauCeti.sw1Class`, `TauCeti.sw2Class` |
  | 9 | `LinearAlgebra/QuadraticForm/Transfer/`, `LinearAlgebra/Matrix/PinPlusPlane/`, `FieldTheory/GaloisCohomology/EvensNorm.lean`, `FieldTheory/QuadraticForm/StiefelWhitney/{Transfer,QuadraticExtension}.lean`, `StiefelWhitney/Evens/` | `QuadraticMap.scharlauTransfer`, `QuadraticMap.traceTransfer`, `TauCeti.galoisEvens`, `TauCeti.galoisEvens2_kummerClass`, `TauCeti.sw2Class_formClass_traceTransfer_smul_sq` |

  Treat these as fixed API: cite them in consuming files, and route an improvement through their
  own review rather than duplicating them. The mod-2 operations used throughout Layers 7 to 9 are
  Tau Ceti's `TauCeti.trivialF2TopPairing` cup on `TauCeti.AbsoluteGaloisGroup K`,
  `TauCeti.galoisRes`, `TauCeti.galoisCor` and `TauCeti.galoisEvens` along a `K`-embedding into
  `SeparableClosure K`, and the open subgroup `TauCeti.galoisSubgroup` of a finite extension.
- **From TauCetiRoadmap.LocalFieldsRamification**
  ([Exact supplier contracts](../../Completed/LocalFieldsRamification/README.md#exact-supplier-contracts),
  items *Finite extensions*, *Valuations and `e`, `f`*, *Units*, *Power classes* and *Unramified
  extensions*): the local-field structure on a finite extension, the normalized valuation, the
  unit filtration with its graded pieces, `natCastValuation` read at `2` (so that `e = v_K(2)`),
  ramification and inertia degrees, the Teichmüller section, the square-class counts and the
  unramified norm group.
  These are Tau Ceti's `TauCeti.algebraicExtensionValuativeRel`,
  `TauCeti.finiteExtension_isNonarchimedeanLocalField`, `TauCeti.normalizedValuation`,
  `TauCeti.unitFiltration`,
  `TauCeti.UnitFiltrationGraded`, `TauCeti.natCastValuation`, `TauCeti.ramificationIndex`,
  `TauCeti.inertiaDegree`, `TauCeti.absoluteRamificationIndex`, `TauCeti.teichmuller`,
  `TauCeti.card_squareClasses`, `TauCeti.normGroup`, `TauCeti.map_normUnits_unitFiltration` and
  `TauCeti.mem_normGroup_iff_dvd_normalizedValuation`, which that roadmap records there. Its
  *Names imported by other roadmaps* re-exports ten of them under its own namespace, the valuation,
  ramification, unit-filtration, Teichmüller and norm-group names; the two finite-extension
  declarations are Tau Ceti names only there, and `TauCeti.card_squareClasses` and
  `TauCeti.map_normUnits_unitFiltration` appear only through specializations (the non-dyadic and
  dyadic square-class counts, and the norm map at depth `0`). This roadmap imports no module of
  that roadmap and states everything on the Tau Ceti declarations.
- **From TauCetiRoadmap.ClassFieldTheory** ([Layers 5 and 14](../ClassFieldTheory/README.md)):
  the coefficient object `μ_n`, the Kummer class, the Kummer-cup pairing, the local symbol and the
  local invariant on `Br(K)` and on `H²(G_K, μ_n)` (Layer 5), and the local Hilbert invariants
  with Hilbert reciprocity (Layer 14). Both layers are proved in Tau Ceti. Of these, that
  roadmap's `Suggested.lean` re-exports `muNRep`, `kummerCupPairing` (Tau Ceti's for
  `n ≠ 0`, and `0` at `n = 0`), `finiteHilbertInvariantAt` and `hilbertProductFormula` under its
  own names (its README, §6 *Downstream consumers*, subsection *Names imported from
  `Suggested.lean`*, and Layer 14); the Kummer class, the local symbol and the invariant on
  `Br(K)` are Tau Ceti names only there, and the invariant on `H²(G_K, μ_n)` appears only as
  `h2MuEquivZMod_mixed`, for a finite extension of `ℚ_p` and `n ≠ 0`. This roadmap imports no
  module of it and consumes the Tau Ceti declarations `TauCeti.ClassFieldTheory.muNRep`,
  `TauCeti.ClassFieldTheory.kummerClass`, `TauCeti.ClassFieldTheory.kummerCupPairing`,
  `TauCeti.ClassFieldTheory.localSymbol`, `TauCeti.ClassFieldTheory.invMap`,
  `TauCeti.ClassFieldTheory.h2MuEquivZMod`,
  `TauCeti.ClassFieldTheory.finiteHilbertInvariantAt` and
  `TauCeti.ClassFieldTheory.hilbertProductFormula`
  (`TauCeti/NumberTheory/ClassFieldTheory/`, files `MuNRep.lean`, `Local/Symbol.lean`,
  `Brauer/Invariant.lean`, `Brauer/RootsOfUnity.lean` and `Global/Hilbert/`). The bridge
  `TauCeti.ClassFieldTheory.brauerGroupEquivBr : Additive (BrauerGroup F) ≃+ Br F`
  (`Brauer/CentralSimple/Basic.lean` there), along which the invariant evaluates the classes of
  central simple algebras, lies in the same namespace but is no part of that roadmap's layers: it
  is Layer 7B item 3's `TauCeti.brauerExplicitH2Equiv` followed by Tau Ceti's change of model
  `TauCeti.ClassFieldTheory.unitsRepH2Equiv` onto the carrier `Br F = H²(G_F, (Fˢ)ˣ)` of that
  roadmap's Layer 5. The comparisons of Layers 6C and 7C and the product formula are stated on Tau
  Ceti's objects (`TauCeti.hilbertSymbol_eq_cohomological`,
  `TauCeti.hilbertSymbol_productFormula`).
- **From TauCetiRoadmap.ProfiniteCohomology** ([Layers 0–4, 8–10, 12 and 13](../ProfiniteCohomology/README.md)):
  discrete modules, the openness of stabilizers and continuous sections of quotient maps, through
  which Layer 7B descends a continuous cocycle to a finite Galois level (Layer 0), the canonical
  carrier with restriction, inflation and coefficient maps (Layer 1), the explicit
  low-degree complex and its comparison (Layers 2–3), the finite-quotient description (Layer 4),
  low-degree cups (Layer 8), Hilbert 90 and Kummer theory (Layer 9), corestriction (Layer 10), the
  graded cup product (Layer 12) and the index-two Evens norm with its `D₁₆` pullback formula
  (Layer 13). Its `AbsoluteGaloisGroup`, `TopRep`, `trivialF2`, `res`, `infl`, `coeffMap`, the
  Kummer block (`KummerCoeff`, `kummerMap`, `kummerIso`, `kummerMapCanonical`), the multiplicative
  block (`UnitsCoeff`, `kummerShortExact`, `hilbert90`, `h2KummerToUnits`), `galoisSubgroup`, the
  explicit complex (`Z2`, `B2`, `H2`, `explicitH2IsoContinuousCohomology`, `explicitCup11`) and the
  finite-quotient colimit are Tau Ceti's declarations under that roadmap's names. Its
  `ProfiniteCohomology.cup`, `ProfiniteCohomology.f2Pairing`,
  `ProfiniteCohomology.inhomogeneousCochain2`, `ProfiniteCohomology.homClass`,
  `ProfiniteCohomology.cochainClass` and `ProfiniteCohomology.galoisF2Iso` are that roadmap's
  prototypes, as are the identities stated on them. Layers 7 to 9 are therefore stated on Tau
  Ceti's native operations listed above, never on those prototypes.
- **From TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras**
  ([Layers 4 to 6](../RepresentationTheory/SemisimpleAlgebras/README.md)): the tensor product of
  central simple algebras, `A ⊗_K Aᵒᵖ ≃ₐ[K] M_n(K)` (Layer 4), Skolem–Noether (Layer 5), through
  which Layer 7B makes a semilinear automorphism of `M_n(L)` inner, the Brauer group as a group
  under `⊗_K`, and splitting by a finite separable extension (Layer 6). The group law used here is
  Tau Ceti's `TauCeti.BrauerGroup.instCommGroup`, the actual tensor-product law, Skolem–Noether is
  Tau Ceti's `TauCeti/Algebra/CentralSimple/SkolemNoether.lean`, and the finite Galois splitting
  field is `TauCeti.Algebra.exists_finiteGalois_splittingField`.

## How to read the build

Layers 0 to 4 are free of cohomology and of the Brauer group. Layer 0 comes first, because
everything diagonal rests on it; Layer 1 follows it; Layer 2 uses Layer 1 for the isotropic
norm-form splitting argument; Layer 3 needs Layers 0 to 2, and Layer 4 needs Layers 1 to 3.
Layer 5 adds the tensor-product Brauer group and the Brauer-valued invariants.

Layer 6 first consumes the local-field substrate of 6A. The norm index of the symbol in 6C feeds
the classification of 6D through the quadratic-field square-class identity, not through the
defect tables of 6B; the defect and integral-basis computations of 6B precede the explicit
symbol tables of 6C. Sublayer 6E compares the two Hasse invariants and needs Layer 5 and 6D. The
identification of the Hasse invariant with the invariant map of local class field theory needs
Layer 7B and Class Field Theory's Layer 5, and is stated in 6E but built after Layer 7B; likewise
the comparison of the symbol with the cohomological pairing in 6C is built after Layer 7C.

Layer 7A depends on Layer 0 and on 6A; Layer 7B on Layers 5 and 7A and on the semisimple-algebras
roadmap's Layers 4 to 6; Layer 7C on Layers 2 and 7B. Layer 8 depends on Layer 7. Layer 9 splits:
the transfer half needs Layers 1 to 4, and the relative-formula half needs Layers 7C and 8 and the
index-two Evens norm.

Each milestone below states what it is, which Tau Ceti declaration discharges it, and what it
needs. `Suggested.lean` states the five headline theorems (Layers 2, 6D, 7C and twice 9) as
examples proved by Tau Ceti, and the aliases other roadmaps consume.

## Layer 0: square classes, diagonal calculus, and chain equivalence

Every milestone of this layer is Tau Ceti's, and the later layers consume it as stated here.
Each milestone names the declaration that discharges it and the file under `TauCeti/` that
holds it.

- **Square-class interop** (Tau Ceti's, consumed). The additive `TauCeti.SquareClassGroup`
  (`TauCeti/FieldTheory/SquareClassGroup/Basic.lean`) and the multiplicative
  `TauCeti.MultiplicativeSquareClassGroup = Kˣ ⧸ Subgroup.square Kˣ`
  (`TauCeti/FieldTheory/SquareClassGroup/Multiplicative.lean`), with the dictionary
  `TauCeti.multiplicativeSquareClassEquiv` and the `ZMod 2`-module comparison
  `TauCeti.elementaryTwoQuotientEquivSquareClassGroup`; pushforward along a field map
  (`RingHom.squareClassMap`, `RingHom.multiplicativeSquareClassMap`), compatible with the
  dictionary (`RingHom.multiplicativeSquareClassEquiv_map`); and the finiteness transfer
  through the `Nat.card` API (`TauCeti.finite_multiplicativeSquareClassGroup_iff`,
  `TauCeti.natCard_multiplicativeSquareClassGroup`), which is the interface that Layer 6
  consumes.

  *Needs:* Mathlib `Subgroup.square`, `QuotientGroup`, `Nat.card`.

- **Representation and value sets** (Tau Ceti's, consumed;
  `TauCeti/LinearAlgebra/QuadraticForm/Representation.lean`). `QuadraticMap.Represents` and
  `QuadraticMap.unitValueSet`, as fixed in the conventions, with the basic calculus:
  - `QuadraticMap.unitValueSet` is closed under multiplication by squares
    (`QuadraticMap.mem_unitValueSet_mul_sq_iff`), so it is a union of square classes;
  - `Represents Q 0` holds for **every** `Q`, by the zero vector, with no hypothesis on `Q`
    and none on its space (`QuadraticMap.represents_zero`). This is exactly what makes the
    full value set useless as an invariant, and the classification statements use the unit
    value set. It is not isotropy: `¬ Q.Anisotropic` asks for a nonzero `v` with `Q v = 0`,
    and an anisotropic form satisfies the first and fails the second;
  - the **representation criterion** (Lam I.2.3, I.3.5),
    `QuadraticMap.mem_unitValueSet_iff_not_anisotropic_prod`: for regular `Q` and `a : Kˣ`,
    `a` lies in the unit value set of `Q` if and only if `Q ⊥ ⟨−a⟩` is isotropic. The
    hypothesis `a : Kˣ` carries the whole content of the reduction: only for `a ≠ 0` can the
    last coordinate of an isotropic vector be normalized to `1` and the vector turned into a
    representation of `a` by `Q`. Read at `a = 0` both sides hold for every `Q`, so the
    criterion is a statement about units and is stated only there.

  Every later question about represented values is turned into an isotropy question through
  the criterion.

  *Needs:* Mathlib `QuadraticMap.Anisotropic`, `QuadraticMap.prod`, `weightedSumSquares`.

- **Binary forms in normal form** (Tau Ceti's, consumed;
  `TauCeti/LinearAlgebra/QuadraticForm/Binary.lean`), both about units `a b c d`:
  - **representation normal form** (Lam I.2.3 (2)),
    `TauCeti.mem_unitValueSet_binary_iff_equivalent`: `c` is represented by `⟨a,b⟩` if and
    only if `⟨a,b⟩ ≅ ⟨c, abc⟩`. The second coefficient is `abc` because its square class must
    be `ab/c`, and `ab/c = abc` modulo squares; the spelling with `ab c⁻¹` presents the same
    form (`TauCeti.equivalent_binaryNormalForm_inv`);
  - **binary equivalence criterion** (Lam I.5.1), `TauCeti.equivalent_binary_iff`:
    `⟨a,b⟩ ≅ ⟨c,d⟩` if and only if `IsSquare (a*b*(c*d))` and the two forms represent a
    common unit.

  *Needs:* the representation criterion above.

- **Chain equivalence** (Tau Ceti's, consumed;
  `TauCeti/LinearAlgebra/QuadraticForm/Diagonal/Chain/Basic.lean` and
  `TauCeti/LinearAlgebra/QuadraticForm/Diagonal/WittChain.lean`). Every diagonal invariant
  rests on this theorem. For `w w' : Fin n → Kˣ` the relations are:
  - `TauCeti.PermutationStep w w'`: there is `σ : Equiv.Perm (Fin n)` with `w' i = w (σ i)`;
  - `TauCeti.BinaryStep w w'`: there are distinct `i j : Fin n` with `w k = w' k` for
    `k ∉ {i,j}` and `⟨w i, w j⟩ ≅ ⟨w' i, w' j⟩`;
  - `TauCeti.DiagonalStep w w'` is the disjunction of the two;
  - `TauCeti.DiagonalChain` is `Relation.ReflTransGen` of `TauCeti.DiagonalStep`.

  A transposition is already a binary step, because `⟨a,b⟩ ≅ ⟨b,a⟩`, so permutation steps add
  no generating data (`TauCeti.PermutationStep.to_reflTransGen_binaryStep`). Both relations
  are kept, because permutation invariance is the form that later proofs apply.

  The comparison of chains with isometry depends on the rank `n`:
  - **`n ≥ 2`**: a chain joins `w` and `w'` exactly when their diagonal forms are isometric
    (`TauCeti.diagonalChain_iff_equivalent_of_two_le`). Left to right is elementary, because
    each step is an isometry (`TauCeti.DiagonalChain.equivalent`). Right to left is **Witt's
    chain-equivalence theorem** (Lam I.5.2), and it is the difficult direction;
  - **`n = 0`**: both sides hold (`TauCeti.diagonalChain_iff_equivalent_fin_zero`);
  - **`n = 1`**: a chain is equality of the coefficient
    (`TauCeti.diagonalChain_fin_one_iff_eq`), because a binary step needs two distinct slots,
    while `⟨a⟩ ≅ ⟨b⟩` exactly when `a * b` is a square. ⚠ So the equivalence is false in rank
    one: over `ℚ`, `⟨1⟩ ≅ ⟨4⟩` by halving the coordinate, and no chain joins them
    (`TauCeti.exists_rankOne_equivalent_not_diagonalChain`).

  *Needs:* the binary normal forms above; Mathlib `Relation.ReflTransGen`, `Equiv.Perm`.

- **Contiguous orthogonal bases** (Serre *CiA* IV.1.3 Thm 2 and IV.2.1 Thm 5; Tau Ceti's,
  consumed; `TauCeti/LinearAlgebra/QuadraticForm/Diagonal/Contiguous/`). Serre's
  contiguity of two orthogonal bases is `Module.Basis.IsContiguous`, an actual shared vector.
  A contiguous step gives a diagonal chain that fixes the common line
  (`Module.Basis.diagonalChain_tail_of_isOrtho_of_apply_eq`), and any two orthogonal bases of a
  regular space of dimension at least three are joined by contiguous orthogonal bases
  (`Module.Basis.reflTransGen_isOrtho_isContiguous`). This is a comparison with the chain
  relation above and never an alternative definition of it.

  *Needs:* chain equivalence above; Mathlib `LinearMap.IsOrthoᵢ`.

- **The descent principle** (Tau Ceti's, consumed;
  `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Descent.lean`),
  `TauCeti.RegularFormClass.liftDiagonal` with `TauCeti.RegularFormClass.liftDiagonal_mk` and
  `TauCeti.RegularFormClass.liftDiagonal_unique`. A function `f` on diagonal presentations
  descends uniquely along `Quotient.mk` to a function on `TauCeti.RegularFormClass K` that
  agrees with `f` on each presentation as soon as it satisfies three hypotheses:
  - `hperm`: `f` is invariant under `TauCeti.PermutationStep`;
  - `hbin`: `f` is invariant under `TauCeti.BinaryStep`;
  - `hone`: in rank one, `f ⟨a⟩ = f ⟨b⟩` whenever `a * b` is a square.

  Rank zero needs no hypothesis, having a single presentation. Ranks at least two need only
  `hperm` and `hbin`, by the chain theorem. Rank one needs `hone`, because no chain joins two
  isometric forms there. ⚠ Without `hone` the principle is false: the function
  `TauCeti.RegularFormPresentation.rankOneCoefficient`, which reads off the coefficient in rank
  one and is `1` in every other rank, satisfies `hperm` and `hbin` and separates `⟨1⟩` from
  `⟨4⟩` over `ℚ` (`TauCeti.not_exists_rankOneCoefficient_descend`,
  `TauCeti/LinearAlgebra/QuadraticForm/Diagonal/Chain/RankOne.lean`).

  The principle produces Tau Ceti's `TauCeti.RegularFormClass.hasseInvariant` (Layer 5),
  `TauCeti.RegularFormClass.localHasse` (Layer 6C), and `TauCeti.sw1Class` and
  `TauCeti.sw2Class` (Layer 8), and each records its `hone`:
  - the two Hasse invariants and `w₂` are products or sums over the pairs `i < j`, and in rank
    one there is no pair, so both sides of `hone` are `1` or `0`;
  - `w₁ = ∑ᵢ (aᵢ)` has `hone : (a) = (b)` whenever `a * b` is a square, which is the one case
    where the hypothesis has content.

  The discriminant and the signed discriminant do not go through the descent principle: Tau
  Ceti descends them directly, by the Gram-determinant argument
  `TauCeti.squareClass_prod_eq_of_equivalent`, which covers every rank at once.

  *Needs:* chain equivalence above; the carrier `TauCeti.RegularFormClass`
  (`TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Basic.lean`).

Basic API for the objects introduced here, all Tau Ceti's:

- constructors: `TauCeti.RegularFormPresentation`, `TauCeti.regularFormSetoid`,
  `TauCeti.RegularFormClass`, `QuadraticMap.Represents`, `QuadraticMap.unitValueSet`,
  `TauCeti.PermutationStep`, `TauCeti.BinaryStep`, `TauCeti.DiagonalChain`;
- morphisms: the quotient map from presentations to classes; the descent principle as the
  universal property (`TauCeti.RegularFormClass.liftDiagonal_unique`);
- functoriality: pushforward of square classes and of presentations along a field map
  `K →+* L`, with the rank and the discriminant commuting with it
  (`TauCeti.RegularFormClass.baseChange`, `TauCeti.RegularFormClass.rank_baseChange`,
  `TauCeti.RegularFormClass.discr_baseChange`,
  `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/BaseChange.lean`);
- comparison lemmas: the chain relation against isometry, rank by rank; `IsSquare (a*b)`
  against equality in the square-class group (`TauCeti.squareClass_eq_iff_isSquare_mul`);
  contiguous orthogonal bases against the chain relation;
- naturality: the descent principle commutes with pushforward along `K →+* L`
  (`TauCeti.RegularFormClass.liftDiagonal_baseChange`): if `g` on `L`-presentations and `f`
  on `K`-presentations satisfy the hypotheses and `g (p.baseChange L) = f p`, then the
  descended functions satisfy the same equation on `TauCeti.RegularFormClass.baseChange`;
- edge cases: rank `0` and rank `1`, where the empty and singleton products appear and
  where the chain theorem changes form; `Represents Q 0`, which holds for every `Q` and is
  not a statement about the unit value set.

⚠ Nearby false generalization. Equal length and equal discriminant do not give a chain, so
they do not give an isometry. Over `ℚ`, `⟨1,1⟩` and `⟨−1,−1⟩` have discriminant `[1]`, and
they are not isometric, because one is positive definite and the other is negative definite.

### Examples

- Chain equivalence in one instance: `⟨1,1⟩ ≅ ⟨2,2⟩` over `ℚ`, because both forms represent
  `2` and both have discriminant `1`, exhibited as a single binary step. Tau Ceti checks the
  isometry in `TauCeti/LinearAlgebra/QuadraticForm/Binary.lean`.
- The rank-one boundary: `⟨1⟩ ≅ ⟨4⟩` over `ℚ`, and no diagonal chain joins them
  (`TauCeti.exists_rankOne_equivalent_not_diagonalChain`); and the function that reads off
  the coefficient in rank one and is `1` in every other rank is invariant under both kinds of
  step and separates the two presentations
  (`TauCeti.not_exists_rankOneCoefficient_descend`). The first shows that the chain theorem
  needs rank at least two, and the second that the descent principle needs its rank-one
  hypothesis.
- `⟨1,1⟩` and `⟨−1,−1⟩` over `ℚ`: same rank, same discriminant, not isometric.

### Dependencies

Mathlib's `QuadraticMap`, `weightedSumSquares`, `QuadraticMap.Equivalent`,
`QuadraticMap.Anisotropic`, `Equiv.Perm` and `Relation.ReflTransGen`. Tau Ceti's
`TauCeti/FieldTheory/SquareClassGroup/`, `TauCeti/LinearAlgebra/QuadraticForm/Representation.lean`,
`TauCeti/LinearAlgebra/QuadraticForm/Binary.lean`,
`TauCeti/LinearAlgebra/QuadraticForm/Diagonal/` and
`TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/`. No other roadmap.

## Layer 1: hyperbolic planes and Witt theory

Every milestone of this layer is Tau Ceti's, and the later layers consume it as stated here.

- **The hyperbolic plane** (Tau Ceti's, consumed;
  `TauCeti/LinearAlgebra/QuadraticForm/Hyperbolic.lean`). `ℍ_q := ⟨1, −1⟩` is
  `TauCeti.hyperbolicPlane K`, equivalent to the `xy`-form because `2` is invertible
  (`TauCeti.equivalent_hyperbolicPlane_dualProd`), and its class is `TauCeti.hyperbolicClass K`.
  It represents every scalar (`TauCeti.represents_hyperbolicPlane`), `⟨a, −a⟩ ≅ ℍ_q`
  (`TauCeti.equivalent_weightedSumSquares_self_neg_hyperbolicPlane`), and a regular isotropic
  form splits off a hyperbolic plane (Lam I.3.4,
  `TauCeti.exists_hyperbolicPlane_prod_equivalent`), so a regular isotropic form is universal.

  *Needs:* Layer 0's representation criterion; Mathlib `QuadraticForm.dualProd`,
  `QuadraticMap.prod`.

- **Witt decomposition** (Lam I.4.1; Tau Ceti's, consumed;
  `TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean`) for regular forms. A regular
  form is `m` hyperbolic planes plus an anisotropic diagonal form, with `m` its Witt index
  (`QuadraticForm.exists_equivalent_hyperbolicPresentation_prod`). On the carrier,
  `c = m • [ℍ_q] + anisotropicPart c` (`TauCeti.RegularFormClass.wittDecomposition`), where the
  **Witt index** `TauCeti.RegularFormClass.wittIndex` and the **anisotropic part**
  `TauCeti.RegularFormClass.anisotropicPart` are determined by any such decomposition
  (`TauCeti.RegularFormClass.wittIndex_eq`, `TauCeti.RegularFormClass.anisotropicPart_eq`).
  For regular `q` the Witt index is the maximal dimension of a totally isotropic subspace
  (Lam I.4.4, `QuadraticForm.finrank_eq_wittIndex_of_maximal`,
  `TauCeti/LinearAlgebra/QuadraticForm/Witt/TotallyIsotropic.lean`).

  *Needs:* the hyperbolic plane above; Witt cancellation below.

- **Witt decomposition of a possibly degenerate form** (Lam I.4; Tau Ceti's, consumed;
  `TauCeti/LinearAlgebra/QuadraticForm/Witt/Degenerate.lean`). Choosing a complement to the
  radical gives `q ≅ q_t ⊥ (m × ℍ_q) ⊥ q_a` with `q_t` the zero form on the radical
  (`QuadraticForm.exists_equivalent_zero_radical_wittDecomposition`). The three parts are
  unique up to isometry: the zero summand lives on a copy of the radical, and `m` and the class
  of `q_a` are the Witt index and anisotropic part of the regular part
  (`TauCeti.wittIndex_formClass_lift_radical_eq`,
  `TauCeti.anisotropicPart_formClass_lift_radical_eq`).

  *Needs:* Witt decomposition for regular forms above; Mathlib `QuadraticMap.radical`.

- **Witt cancellation** (Lam I.4.2; Tau Ceti's, consumed;
  `TauCeti/LinearAlgebra/QuadraticForm/Witt/Cancellation.lean`): `q ⊥ q₁ ≅ q ⊥ q₂ → q₁ ≅ q₂`
  for regular finite-dimensional `q`, with no hypothesis on `q₁` and `q₂`
  (`TauCeti.equivalent_of_equivalent_prod`, and `TauCeti.equivalent_of_equivalent_prod_right`
  for the summand on the right). On the carrier it is the instance
  `IsCancelAdd (TauCeti.RegularFormClass K)`.

  *Needs:* the hyperbolic plane and its splitting above; Layer 0's representation criterion.

- **Reflections and Cartan–Dieudonné** (Lam I.7; Tau Ceti's, consumed;
  `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean` and
  `TauCeti/LinearAlgebra/QuadraticForm/CartanDieudonne/Basic.lean`). For `Q v` invertible the
  reflection `τ_v x = x − (polar Q x v / Q v) • v` is the element
  `TauCeti.QuadraticMap.reflectionOrthogonal Q v` of the orthogonal group
  `TauCeti.QuadraticMap.orthogonalGroup Q`. **Cartan–Dieudonné**: every isometry of a regular
  `n`-dimensional quadratic space is a product of at most `n` reflections
  (`TauCeti.QuadraticMap.exists_reflectionOrthogonal_list_prod_eq`), the identity being the
  empty product.

  *Needs:* Mathlib `QuadraticMap.polar`, `QuadraticMap.Nondegenerate`.

- **Witt's extension theorem** (Lam I.4.9; Tau Ceti's, consumed;
  `TauCeti/LinearAlgebra/QuadraticForm/Witt/Extension.lean`): an isometry between regular
  subspaces of a finite-dimensional quadratic space extends to the whole space, with no
  regularity hypothesis on the ambient form (`QuadraticMap.IsometryEquiv.exists_extension`,
  with the chosen extension `QuadraticMap.IsometryEquiv.extension`). Layers 6 and 9 both use
  it.

  *Needs:* Witt cancellation above.

Basic API, all Tau Ceti's:

- constructors: `TauCeti.hyperbolicPlane`, `TauCeti.hyperbolicClass`,
  `TauCeti.RegularFormClass.wittIndex`, `TauCeti.RegularFormClass.anisotropicPart`,
  `TauCeti.QuadraticMap.reflectionOrthogonal`;
- morphisms: reflections and the orthogonal group; the extension of an isometry from a
  subspace;
- functoriality: the Witt index and the anisotropic part are invariants of isometry. Under a
  field extension the Witt index cannot decrease
  (`TauCeti.RegularFormClass.wittIndex_le_wittIndex_baseChange`,
  `TauCeti/LinearAlgebra/QuadraticForm/Witt/BaseChange.lean`), and the extension of the
  anisotropic part need not stay anisotropic. An equality holds only under the
  anisotropy-preservation hypothesis of `TauCeti.RegularFormClass.anisotropicPart_baseChange`.
  ⚠ Do not claim that the anisotropic part commutes with base change: `⟨1,1⟩` over `ℝ` has
  Witt index `0`, and over `ℂ` it is hyperbolic with Witt index `1` and zero anisotropic part;
- comparison lemmas: the Witt index against the maximal totally isotropic dimension; the
  `xy`-form against `⟨1,−1⟩`;
- naturality: the anisotropic part of `q` represents its Witt class in the Witt ring of
  Layer 4 (`TauCeti.wittClass_anisotropicPart`);
- edge cases: the zero form; a form on the zero space; rank 1, where isotropy always fails.

⚠ Nearby false generalization. Cartan–Dieudonné has a classical counterexample in dimension
4 over `𝔽₂`, which the standing hypothesis `Invertible (2 : K)` excludes. Do not state the
theorem for a general field.

### Examples

- `⟨1,1⟩ ≇ ⟨1,−1⟩` over `ℚ`, because one form is anisotropic
  (`TauCeti.anisotropic_presentedForm_one_one`) and the other is the hyperbolic plane. Their
  Witt indices are `0` and `1` (the worked example after
  `TauCeti.anisotropic_presentedForm_one_one` in
  `TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean`). This is the smallest
  example in which the dimension alone does not classify.
- `ℍ_q = ⟨1,−1⟩` represents every `a ∈ ℚˣ`, with the witness
  `((a+1)/2)² − ((a−1)/2)² = a` (`TauCeti.represents_hyperbolicPlane`).
- `⟨1,1⟩` over `ℝ` and over `ℂ`: Witt index `0` and `1`, which is the base-change warning above.

### Dependencies

Layer 0. Mathlib's `QuadraticMap.prod`, `QuadraticMap.Nondegenerate`, `QuadraticMap.radical`,
`QuadraticMap.basisRepr`, `LinearMap.BilinForm.exists_orthogonal_basis` and `Module.finrank`. Tau
Ceti's `TauCeti/LinearAlgebra/QuadraticForm/Hyperbolic.lean`,
`TauCeti/LinearAlgebra/QuadraticForm/Witt/` (`Decomposition`, `Degenerate`, `Cancellation`,
`Extension`, `TotallyIsotropic`, `BaseChange`),
`TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/` and
`TauCeti/LinearAlgebra/QuadraticForm/CartanDieudonne/`. No other roadmap.

## Layer 2: quaternion algebras and the four-fold splitting criterion

The route through quaternion algebras, rather than through a cocycle computation, is
deliberate. Each equivalence of this layer is reusable, and a cocycle identity is not. Nothing
in this layer needs central simplicity, and no milestone here assumes it. Every milestone is
Tau Ceti's, in `TauCeti/Algebra/Quaternion/`, and the later layers consume it as stated here.

- **Norm form** (Tau Ceti's, consumed; `TauCeti/Algebra/Quaternion/NormForm.lean`). For
  `a, b ∈ Kˣ`, `Nrd(x) = x · star x` is scalar, by Mathlib's `QuaternionAlgebra.mul_star_eq_coe`,
  and `x ↦ (x * star x).re` is the quadratic form `QuaternionAlgebra.normForm a 0 b` on
  `ℍ[K,a,b]` (`QuaternionAlgebra.normForm_apply`). `Nrd ≅ ⟨1, −a, −b, ab⟩ = ⟨⟨a, b⟩⟩`, the
  2-fold Pfister form (`QuaternionAlgebra.equivalent_normForm_weightedSumSquares`); the
  **pure part** `QuaternionAlgebra.pureNormForm` on the trace-zero subspace is `⟨−a, −b, ab⟩`
  (`QuaternionAlgebra.equivalent_pureNormForm_weightedSumSquares`); and
  `Nrd(xy) = Nrd(x)·Nrd(y)` (`QuaternionAlgebra.normForm_mul`).

  *Needs:* Mathlib `QuaternionAlgebra`, `star`, `QuaternionAlgebra.mul_star_eq_coe`.

- **Split or division** (Lam III.2.2, III.2.7; Tau Ceti's, consumed). `ℍ[K,a,b]` is a
  division algebra exactly when `Nrd` is anisotropic (`QuaternionAlgebra.anisotropic_normForm_iff`),
  and otherwise it is isomorphic to `Matrix (Fin 2) (Fin 2) K`
  (`TauCeti.QuaternionAlgebra.forall_isUnit_or_nonempty_algEquiv_matrix`,
  `TauCeti/Algebra/Quaternion/SplittingCriterion.lean`). Both halves are computations with the
  norm form.

  *Needs:* the norm form above; Layer 1's hyperbolic plane and the splitting of an isotropic
  form.

- **Symbol relations at the algebra level** (Lam III.2.11; Tau Ceti's, consumed), each an
  `AlgEquiv`: `(a,b) ≅ (b,a)` is Mathlib's `QuaternionAlgebra.swapEquiv`; `(a, c²b) ≅ (a,b)`
  is `TauCeti.QuaternionAlgebra.rescaleJEquiv`, with `TauCeti.QuaternionAlgebra.rescaleIEquiv`
  in the first slot (`TauCeti/Algebra/Quaternion/SymbolEquiv.lean`); `(a, −a) ≅ M₂(K)` is
  `TauCeti.QuaternionAlgebra.aNegAEquivMatrix` and `(1, b) ≅ M₂(K)` is
  `TauCeti.QuaternionAlgebra.oneEquivMatrix` (`TauCeti/Algebra/Quaternion/Split.lean`);
  `(a, b²) ≅ M₂(K)` is `TauCeti.QuaternionAlgebra.secondSquareEquivMatrix`
  (`TauCeti/Algebra/Quaternion/SquareSplit.lean`); and the **Steinberg relation**
  `(a, 1−a) ≅ M₂(K)`, for `a` with `a` and `1 − a` units, is
  `TauCeti.QuaternionAlgebra.steinbergEquivMatrix` (`TauCeti/Algebra/Quaternion/Steinberg.lean`).

  *Needs:* Mathlib `QuaternionAlgebra.Basis` and `QuaternionAlgebra.Basis.lift`.

- **Naturality of quaternion equivalences** (Tau Ceti's, consumed;
  `TauCeti/Algebra/Quaternion/AlgEquiv.lean`). A `K`-algebra equivalence
  `f : ℍ[K,a,b] ≃ₐ[K] ℍ[K,c,d]` commutes with `star` (`QuaternionAlgebra.map_star_of_algEquiv`),
  preserves the reduced trace and the reduced norm (`QuaternionAlgebra.reducedTrace_eq_of_algEquiv`,
  `QuaternionAlgebra.normForm_eq_of_algEquiv`), maps the trace-zero subspace onto the
  trace-zero subspace (`QuaternionAlgebra.map_ker_reₗ_of_algEquiv`), and restricts to an
  isometry of pure norm forms `⟨−a,−b,ab⟩ ≅ ⟨−c,−d,cd⟩`
  (`QuaternionAlgebra.equivalent_weightedSumSquares_of_algEquiv`). Without this milestone,
  equality of quaternion invariants gives no isometry, and the dimension-3 classification of
  Layer 5 has no proof.

  *Needs:* the norm form above.

- **The four-fold splitting criterion** (Lam III.2.7 and III.4.2, Serre *CiA* III.1.1–1.2,
  Gille–Szamuely 1.1.9), the main theorem of the layer and a headline of this roadmap; Tau
  Ceti's `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae`
  (`TauCeti/Algebra/Quaternion/SplittingCriterion.lean`), stated as an example in
  `Suggested.lean`. For `a, b ∈ Kˣ` the following are equivalent:
  1. `ℍ[K,a,b]` splits, that is `≃ₐ[K] Matrix (Fin 2) (Fin 2) K`;
  2. `b` is a norm from the quadratic algebra `K(√a)`, that is
     `∃ z : QuadraticAlgebra K a 0, z.norm = b`;
  3. `b = x² − ay²` has a solution in `K`;
  4. `⟨1, −a, −b⟩` is isotropic;
  5. the norm form `⟨⟨a, b⟩⟩` is isotropic.

  Each condition against the first is a named theorem
  (`TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_iff_exists_norm_eq`,
  `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_iff_exists_eq_sq_sub_mul_sq`,
  `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_iff_not_anisotropic_weightedSumSquares`,
  `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_iff_not_anisotropic_normForm`). When `a`
  is a square all five conditions hold, so no hypothesis on `a` is carried; the norm form
  `x² − a y²` is then universal. A further equivalent condition, the vanishing of the Kummer
  cup `(a) ∪ (b)`, is Layer 7C, and is kept out of here so that Layers 0 to 6 need no
  cohomology.

  *Needs:* the norm form, split or division and the symbol relations above; Layer 0's binary
  normal forms; Layer 1's hyperbolic plane; Mathlib `QuadraticAlgebra K a 0` with its `norm`.

Basic API, all Tau Ceti's except where Mathlib's is named:

- constructors: `QuaternionAlgebra.normForm`, `QuaternionAlgebra.pureNormForm`, and the
  splitting predicate `Nonempty (ℍ[K,a,b] ≃ₐ[K] Matrix (Fin 2) (Fin 2) K)`;
- morphisms: `AlgEquiv` between quaternion algebras; the induced isometry of pure norm forms
  (`QuaternionAlgebra.pureNormFormIsometryEquivOfAlgEquiv`);
- functoriality: base change `ℍ[K,a,b] ⊗_K L ≃ₐ[L] ℍ[L,a,b]`
  (`TauCeti.QuaternionAlgebra.baseChangeTwoParams`, `TauCeti/Algebra/Quaternion/BaseChange.lean`),
  and the splitting predicate under a field map, which follows from it;
- comparison lemmas: the five conditions of the criterion against each other; `⟨⟨a,b⟩⟩`
  against `Nrd`; `QuadraticAlgebra K a 0` against `K(√a)`;
- naturality: `star` and the reduced norm commute with every `K`-algebra equivalence;
- edge cases: `a` a square; `b` a square; `a = 1`; the split case, where the norm form is
  hyperbolic.

⚠ Bimultiplicativity of the symbol is not provable at this layer. Over a general field, a
comparison of `(a, bc)` with `(a,b)` and `(a,c)` is a statement about a group law that does
not exist yet, and it has no `AlgEquiv` formulation. Do not substitute an ad hoc statement. It
is Layer 5 in `Br(K)`, and Layer 6C in `{±1}`, in each case after the codomain exists.

### Examples

All of these are Tau Ceti's, in `TauCeti/NumberTheory/LocalField/Quaternion/Examples.lean`.

- `ℍ[ℚ,−1,−1]` is a division algebra and does not split
  (`TauCeti.not_nonempty_algEquiv_matrix_neg_one_neg_one_rat`).
- `ℍ[ℚ,1,b] ≃ₐ M₂(ℚ)` for every `b ∈ ℚˣ` (`TauCeti.QuaternionAlgebra.oneEquivMatrix`).
- `ℍ[ℚ_2,2,5]` is a division algebra (`TauCeti.isUnit_of_ne_zero_two_five_padicTwo`), while
  `ℍ[ℚ_2,5,5]` splits (`TauCeti.nonempty_algEquiv_matrix_five_five_padicTwo`).
- The four-fold criterion over `ℚ_2` at two points: at `(a,b) = (2,5)`, where all five
  conditions fail (`TauCeti.nonempty_algEquiv_matrix_tfae_two_five_padicTwo`); and at
  `(a,b) = (5,5)`, where all five hold with the witness `5 = 5² − 5·2²`
  (`TauCeti.nonempty_algEquiv_matrix_tfae_five_five_padicTwo`,
  `TauCeti.exists_eq_sq_sub_mul_sq_five_five_padicTwo`). The value `(2,5)_{ℚ_2} = −1` is
  Layer 6C's.

### Dependencies

Layers 0 and 1. Mathlib's `QuaternionAlgebra`, `star`, `QuaternionAlgebra.mul_star_eq_coe`,
`QuaternionAlgebra.Basis` with `QuaternionAlgebra.Basis.lift`, `QuadraticAlgebra K a 0` with
its `norm`, and `Matrix (Fin 2) (Fin 2) K`. Tau Ceti's `TauCeti/Algebra/Quaternion/`
(`NormForm`, `Split`, `SquareSplit`, `Steinberg`, `SymbolEquiv`, `AlgEquiv`,
`SplittingCriterion`, `BaseChange`). No other roadmap.

## Layer 3: the classical invariants that need no Brauer group

Everything here is a function of a diagonalization, well defined on
`TauCeti.RegularFormClass K`, with values in `ℕ`, in `ZMod 2`, or in the square-class group.
The Hasse invariant is not in this layer, because its codomain is a group of Brauer classes,
which Layer 5 supplies. Every milestone is Tau Ceti's, and the later layers consume it as
stated here.

- **Dimension and dimension mod 2** (Tau Ceti's, consumed). The rank
  `TauCeti.RegularFormClass.rank`, invariant under isometry (`TauCeti.rank_formClass`) and a
  semiring map to `ℕ` (`TauCeti.RegularFormClass.rankHom`,
  `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Semiring.lean`); the ring map to
  `ZMod 2` that Layer 4 uses is its composite with `Nat.castRingHom (ZMod 2)`.

  *Needs:* Layer 0's carrier.

- **Discriminant and signed discriminant** (Tau Ceti's, consumed;
  `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Discriminant.lean`):
  `TauCeti.RegularFormClass.discr` and `TauCeti.RegularFormClass.signedDiscr`, valued in the
  additive `TauCeti.SquareClassGroup K`, with `TauCeti.RegularFormClass.discr_mk` and
  `TauCeti.RegularFormClass.signedDiscr_mk` on presentations and `TauCeti.discr_formClass` and
  `TauCeti.signedDiscr_formClass` on a regular form. Well-definedness is the Gram-determinant
  computation `TauCeti.squareClass_prod_eq_of_equivalent`, through Mathlib's `discr'`
  (`QuadraticForm.discr'_weightedSumSquares`). This roadmap's `discr` is the plain
  discriminant read in `Kˣ ⧸ (Kˣ)²` through `TauCeti.multiplicativeSquareClassEquiv`; it is
  declared in `Suggested.lean` with Tau Ceti's invariant as its body, because
  `GlobalQuadraticForms` consumes it under that name. The signed discriminant is consumed as
  Tau Ceti's additive `TauCeti.RegularFormClass.signedDiscr`, read through the same
  equivalence where a multiplicative value is wanted.

  **Checks.**

  - The rank-zero class has `discr` equal to the class of `1`, the empty product; a reading
    that takes the first weight of a diagonalization has no value there.
  - On the class of `⟨1, −1⟩` the value is the class of `−1`, and on the class of `⟨1, 1⟩` it
    is the class of `1`. The signed discriminant takes the opposite values on these two forms,
    `[1]` and `[−1]`, because the sign `(−1)^(2·1/2)` is `−1` in rank two; so `discr` is the
    plain convention and not the signed one.
  - Over `ℚ` the classes of `⟨1⟩` and `⟨4⟩` coincide and `discr` gives the class of `1` on
    both; a value in `Kˣ` instead of `Kˣ ⧸ (Kˣ)²` would separate two isometric forms.
  - On the class of `⟨a⟩` the value is the coset of `a`, the element that the square-class
    equivalence matches with Tau Ceti's additive `TauCeti.squareClass a`; the other candidate
    reading, the coset of `a⁻¹`, is the same coset because `a⁻¹ = a · (a⁻¹)²`, so the two
    square-class dictionaries cannot disagree here.

  *Needs:* Layer 0's carrier and square-class dictionary; Mathlib `QuadraticForm.discr'`.

- **The exact formulas** (Tau Ceti's, consumed), for `q` of rank `m` and `r` of rank `n`,
  written here multiplicatively in `Kˣ ⧸ (Kˣ)²`:
  - `d(q ⊥ r) = d(q) · d(r)` and `d±(q ⊥ r) = (−1)^{mn} · d±(q) · d±(r)`;
  - `d(λ • q) = λ^m · d(q)` and `d±(λ • q) = λ^m · d±(q)`;
  - `d(q ⊗ r) = d(q)^n · d(r)^m` and `d±(q ⊗ r) = (−1)^{mn(mn−1)/2} · d(q)^n · d(r)^m`.

  These are `TauCeti.RegularFormClass.discr_add`, `TauCeti.RegularFormClass.discr_mk_rankOne_mul`,
  `TauCeti.RegularFormClass.discr_mul`, `TauCeti.RegularFormClass.signedDiscr_add`,
  `TauCeti.RegularFormClass.signedDiscr_mk_rankOne_mul` and
  `TauCeti.RegularFormClass.signedDiscr_mul`, stated additively, with scaling by `λ` written as
  multiplication by the rank-one class `⟨λ⟩`. The conversion `d±(q) = (−1)^{m(m−1)/2} · d(q)`
  is `TauCeti.RegularFormClass.signedDiscr_eq_sign_add_discr`, and it is the only conversion
  that a later proof uses. Values on the standard forms: `d±⟨a⟩ = a`
  (`TauCeti.RegularFormClass.signedDiscr_mk_rankOne`), `d±(ℍ_q) = 1`
  (`TauCeti.RegularFormClass.signedDiscr_hyperbolicClass`), and `d±⟨⟨a,b⟩⟩ = 1`, which Tau
  Ceti states in the Witt ring (`TauCeti.WittRing.signedDiscr_oneFoldPfisterClass_mul`).

  *Needs:* the discriminants above; Layer 1's hyperbolic class.

- **The Gram-determinant description** (Tau Ceti's, consumed). For a nondegenerate
  finite-dimensional `Q`, any finite basis `b` and a unit `u` with `(u : K) = Q.discr b`, the
  class discriminant is the square class of `u` (`TauCeti.discr_formClass_eq_squareClass`), so
  the description applies to an arbitrary basis and not only to a diagonal one. Mathlib's
  `QuadraticForm.toMatrix` uses the half-polarization; the matrix of the full polarization is
  twice it, and its determinant differs from the quadratic discriminant by `2` to the
  dimension, dimension zero included (`QuadraticForm.toMatrix_polarBilin`,
  `QuadraticForm.det_toMatrix_polarBilin`, `TauCeti/LinearAlgebra/QuadraticForm/Matrix.lean`).
  Every Gram determinant in this roadmap is the quadratic one, with that factor explicit
  wherever the full polar form is used.

  *Needs:* the discriminants above; Mathlib `QuadraticForm.discr`, `Matrix.det`.

- **The binary quaternion lemma** (Lam III.2.11; Tau Ceti's, consumed;
  `TauCeti/Algebra/Quaternion/Binary.lean`),
  `TauCeti.QuaternionAlgebra.nonempty_algEquiv_of_equivalent_binary`: if `⟨a,b⟩ ≅ ⟨c,d⟩`, then
  `ℍ[K,a,b] ≃ₐ[K] ℍ[K,c,d]`, through the functoriality of Clifford algebras. This is the one
  nontrivial input to the well-definedness of the Hasse invariant in Layer 5 and of the local
  Hasse invariant in Layer 6C, and its codomain is only an isomorphism class of algebras.

  *Needs:* Layer 2's symbol relations; Mathlib `CliffordAlgebra` and its quaternion
  equivalences.

- **Chain induction, prepared** (Tau Ceti's, consumed;
  `TauCeti/LinearAlgebra/QuadraticForm/Diagonal/Chain/Induction.lean`). A function of the form
  `w ↦ ∏_{i<j} F (w i) (w j)` into a commutative monoid is:
  - permutation-step invariant as soon as `F` is symmetric
    (`TauCeti.PermutationStep.prod_prod_Ioi_eq`);
  - binary-step invariant as soon as `F` is multiplicative in its first argument and
    `F a b = F c d` whenever `⟨a,b⟩ ≅ ⟨c,d⟩` (`TauCeti.BinaryStep.prod_prod_Ioi_eq`).

  Both are stated for an abstract commutative monoid `M` and an abstract `F : Kˣ → Kˣ → M`.
  Layer 5 with `M = BrauerGroup K`, Layer 6C with `M = ℤˣ`, and Layer 8 with
  `M = H²(G_K, 𝔽₂)` written additively each invoke them instead of repeating the induction. In
  rank one such a product is empty, which discharges the rank-one hypothesis of the descent
  principle.

  *Needs:* Layer 0's chain relations.

- **The invariant dictionary** (Tau Ceti's, consumed). Each source's named invariant is
  recorded once, in the docstrings of
  `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Hasse/Basic.lean` and
  `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Clifford.lean`: O'Meara's `∏_{i≤j}`
  symbol, Serre's `ε`, Lam's `s`, and Lam's `c`, with the ⚠ Wall caution of the conventions.
  The translation of O'Meara's symbol is the theorem
  `TauCeti.RegularFormClass.omearaHasseSymbol_eq`, and it is Layer 5's, because it mentions a
  Brauer class.

Basic API, all Tau Ceti's except this roadmap's `discr`:

- constructors: `TauCeti.RegularFormClass.discr`, `TauCeti.RegularFormClass.signedDiscr`,
  `TauCeti.RegularFormClass.rank`, and the multiplicative `discr`;
- morphisms: the ring map from `TauCeti.RegularFormClass K` to `ZMod 2` given by the rank;
- functoriality: the discriminant commutes with base change along `K →+* L`
  (`TauCeti.RegularFormClass.discr_baseChange`), and so does the signed discriminant, because
  the rank does;
- comparison lemmas: `TauCeti.RegularFormClass.signedDiscr_eq_sign_add_discr`; the
  Gram-determinant description against the product description; the full-polar against the
  quadratic Gram determinant;
- naturality: the two chain-induction lemmas, stated for an abstract monoid, so that each
  later layer instantiates them;
- edge cases: rank `0` and rank `1`, where `d± = d`
  (`TauCeti.RegularFormClass.signedDiscr_eq_discr_of_rank_le_one`); scaling by a square.

### Examples

- `d±⟨a⟩ = a`; `d±(ℍ_q) = 1`; `d(⟨−1,−1⟩) = [1]`.
- `⟨1,1⟩` and `⟨−1,−1⟩` over `ℝ` have the same rank and discriminant, so Layer 3's invariants
  do not separate them; Layer 5's Hasse invariant does.
- The full-polar Gram determinant of `⟨1⟩` on `K` is `2`, the quadratic one is `1`: the factor
  `2` to the dimension is visible in rank one.

### Dependencies

Layers 0 to 2. Mathlib's `QuadraticForm.discr'`, `QuadraticMap.basisRepr`, `Matrix.det` and
`ZMod 2`. Tau Ceti's `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/` (`Basic`,
`Semiring`, `Discriminant`, `BaseChange`), `TauCeti/LinearAlgebra/QuadraticForm/Matrix.lean`,
`TauCeti/LinearAlgebra/QuadraticForm/Diagonal/Chain/Induction.lean` and
`TauCeti/Algebra/Quaternion/Binary.lean`. No other roadmap.

## Layer 4: the Witt ring and the fundamental ideal

This layer is free of the Brauer group. Everything below is about
`TauCeti.RegularFormClass K` and the rings built from it; the maps into `Br(K)[2]` are
Layer 5. Every milestone is Tau Ceti's, in `TauCeti/LinearAlgebra/QuadraticForm/Witt/`, and
the later layers consume it as stated here. No second ring, ideal, discriminant map or Pfister
form is declared anywhere in this roadmap.

- **`Ŵ(K)` and `W(K)`** (Lam II.1; Tau Ceti's, consumed;
  `TauCeti/LinearAlgebra/QuadraticForm/Witt/Ring.lean`). The commutative monoid
  `(TauCeti.RegularFormClass K, ⊥)` with the multiplication induced by `⊗` is the commutative
  semiring `TauCeti.instCommSemiringRegularFormClass`. Its Grothendieck group is the
  **Witt–Grothendieck ring** `TauCeti.WittGrothendieckRing K`, with the class map
  `TauCeti.toWittGrothendieck`, which is injective by Witt cancellation
  (`TauCeti.toWittGrothendieck_injective`). The **Witt ring** `TauCeti.WittRing K` is the
  quotient by the ideal `TauCeti.hyperbolicIdeal K` generated by `ℍ_q`, which is the cyclic
  subgroup `ℤ · [ℍ_q]` (`TauCeti.mem_hyperbolicIdeal_iff`), with the quotient map
  `TauCeti.WittRing.mk`. The Witt class of a form is `TauCeti.wittClass`, the class map
  followed by the quotient map. Every element of `W(K)` is a Witt class
  (`TauCeti.wittClass_surjective`), every regular form's Witt class is represented by its
  anisotropic part (`TauCeti.wittClass_anisotropicPart`), and two forms have the same Witt class
  exactly when their anisotropic parts are isometric
  (`TauCeti.wittClass_eq_iff_anisotropicPart_eq`). The dimension-mod-2 ring map is
  `TauCeti.WittRing.dimMod2`. Consumers use the two Tau Ceti names `TauCeti.WittRing` and
  `TauCeti.WittRing.mk` directly. General torsion theorems for `W(K)` are excluded.

  **Checks.**

  - Over `ℂ` every regular form is `⟨1, …, 1⟩` and `⟨1, 1⟩ ≅ ⟨1, −1⟩` is hyperbolic, so
    `W(ℂ) = ℤ/2` and the quotient map `Ŵ(ℂ) → W(ℂ)` sends the class of `⟨1, 1⟩` to `0`, while in
    `Ŵ(ℂ) ≅ ℤ` it is `2`; a quotient that omitted the hyperbolic ideal would keep it nonzero.
  - Over `ℝ` the signature `TauCeti.WittRing.equivInt` identifies `W(ℝ)` with `ℤ`: `⟨1⟩ ↦ 1`,
    `⟨−1⟩ ↦ −1` and `⟨1, −1⟩ ↦ 0`. The kernel of the quotient map on `Ŵ(ℝ) ≅ ℤ²` is the line
    through `⟨1⟩ + ⟨−1⟩`, the cyclic group `ℤ · [ℍ]` of `TauCeti.mem_hyperbolicIdeal_iff`.
  - Over `𝔽₃`, `−1` is not a square, so `x² + y² = 0` forces `x = y = 0` and `⟨1, 1⟩` is
    anisotropic: the class of `⟨1⟩` has additive order `4` (`⟨1, 1, 1, 1⟩ ≅ ⟨1, 1⟩ ⊥ ⟨−1, −1⟩`
    contains `⟨1, −1⟩` twice), and `W(𝔽₃) = ℤ/4`. Over `𝔽₅`, where `−1 = 2²`, the same class has
    order `2`, and `W(𝔽₅)`, also of order `4`, is `(ℤ/2)²` and not cyclic.

  `W` as a functor for field extensions is `TauCeti.WittRing.baseChange : W(K) →+* W(L)`
  (`TauCeti/LinearAlgebra/QuadraticForm/Witt/BaseChange.lean`), with its value on Witt classes
  `TauCeti.WittRing.baseChange_wittClass`, the functor laws `TauCeti.WittRing.baseChange_self`
  and `TauCeti.WittRing.baseChange_comp`, and `TauCeti.WittRing.map_fundamentalIdeal_pow_le`;
  these are the localization maps that `GlobalQuadraticForms` composes over the completions.

  *Needs:* Layer 1's Witt decomposition and cancellation; Mathlib `Algebra.GrothendieckAddGroup`,
  `Ideal.Quotient`.

- **The fundamental ideal** (Tau Ceti's, consumed;
  `TauCeti/LinearAlgebra/QuadraticForm/Witt/FundamentalIdeal.lean`,
  `TauCeti/LinearAlgebra/QuadraticForm/Witt/Discriminant.lean`). `I(K) = ker(W(K) → ZMod 2)` is
  `TauCeti.fundamentalIdeal K`, and a Witt class lies in it exactly when the rank is even
  (`TauCeti.wittClass_mem_fundamentalIdeal_iff`). The generation statements:
  - `I` is generated as an additive group, and so as an ideal, by the 1-fold Pfister classes
    `⟨⟨a⟩⟩ = ⟨1,−a⟩`, that is `TauCeti.oneFoldPfisterClass`
    (`TauCeti.fundamentalIdeal_toAddSubgroup_eq_closure_oneFoldPfisterClass`,
    `TauCeti.fundamentalIdeal_eq_span_oneFoldPfisterClass`);
  - `Iⁿ` is generated as an additive group by the `n`-fold Pfister classes for every `n ≥ 1`,
    `TauCeti.fundamentalIdeal_pow_eq_addClosure`, with the cases `n = 2` and `n = 3` that
    Layer 5 uses as `TauCeti.fundamentalIdeal_sq_eq_addClosure` and
    `TauCeti.fundamentalIdeal_cube_eq_addClosure`
    (`TauCeti/LinearAlgebra/QuadraticForm/Witt/Pfister/Basic.lean`). ⚠ It is false at `n = 0`:
    `I⁰ = W(K)` is not additively generated by `⟨1⟩`, the only `0`-fold Pfister form (over `ℚ`,
    `⟨2⟩` is not a multiple of `⟨1⟩`). ⚠ Additive generation is the statement Layer 5 needs;
    the weaker ideal generation does not let a homomorphism be defined by its values on the
    generators;
  - `I/I² ≅ Kˣ/(Kˣ)²` through `d±`, which is where the signed discriminant is forced:
    `TauCeti.signedDiscrHom` on `I(K)` is onto (`TauCeti.signedDiscrHom_surjective`) with
    kernel `I²` (`TauCeti.signedDiscrHom_eq_zero_iff`), and induces
    `TauCeti.fundamentalIdealCotangentEquiv`. A Witt class lies in `I²` exactly when it has even
    rank and trivial `d±` (`TauCeti.wittClass_mem_fundamentalIdeal_sq_iff`). These maps are
    valued in the additive `TauCeti.SquareClassGroup K`, and the signed discriminant of a Witt
    class is `TauCeti.WittRing.signedDiscr`; no second discriminant map is defined on `W(K)`.

  No statement about `I³/I⁴` or about the higher filtration is claimed.

  *Needs:* `Ŵ(K)` and `W(K)` above; Layer 3's discriminant formulas and the dimension map;
  Mathlib `Ideal`, `Ideal.Cotangent`, `AddSubgroup.closure`.

- **Pfister forms** (Tau Ceti's, consumed; `TauCeti/LinearAlgebra/QuadraticForm/Witt/Pfister/`
  and `TauCeti/LinearAlgebra/QuadraticForm/Witt/Round.lean`) in every degree, with the theory
  developed for `n ≤ 2`. The diagonal tuple is `TauCeti.pfisterForm a : Fin (2 ^ n) → Kˣ`,
  defined recursively so that slot `k` carries `∏_{i ∈ S} (−aᵢ)` over the positions `S` of the
  `1`s in the binary expansion of `k` (`TauCeti.pfisterForm_one`, `TauCeti.pfisterForm_two`); its
  isometry class is `TauCeti.pfisterFormClass a`, the product of the classes `1 + ⟨−aᵢ⟩`
  (`TauCeti.pfisterFormClass_eq_mk`); and its Witt class is `TauCeti.pfisterClass a`, the
  product of the one-fold classes (`TauCeti.pfisterClass_eq_prod`), which lies in `Iⁿ`
  (`TauCeti.pfisterClass_mem_fundamentalIdeal_pow`).
  - `⟨⟨a,b⟩⟩` is the norm form of `ℍ[K,a,b]` (Layer 2,
    `QuaternionAlgebra.equivalent_normForm_weightedSumSquares`);
  - **round**: for `n ≤ 2`, a unit `c` is a similarity factor of `⟨⟨a₁,…,aₙ⟩⟩`, that is
    `c • ⟨⟨a₁,…,aₙ⟩⟩ ≅ ⟨⟨a₁,…,aₙ⟩⟩`, exactly when the form represents `c`
    (`TauCeti.oneFoldPfister_smul_equivalent_iff`,
    `TauCeti.twoFoldPfister_smul_equivalent_iff`);
  - `⟨⟨a,b⟩⟩` is isotropic if and only if it is hyperbolic, if and only if `ℍ[K,a,b]` splits,
    which is the four-fold criterion stated in the Witt ring (`TauCeti.pfisterFormClass_two_tfae`,
    with `TauCeti.pfisterClass_two_eq_zero_iff`,
    `TauCeti/LinearAlgebra/QuadraticForm/Witt/Pfister/Hyperbolic.lean`).

  The general theory of `n`-fold Pfister forms, that is roundness in all degrees, the
  Arason–Pfister Hauptsatz, and function-field methods, is excluded. The items above are what
  Layers 5 and 8 consume.

  *Needs:* the fundamental ideal above; Layer 0's representation criterion and binary normal
  forms; Layer 2's norm form and four-fold criterion.

- **`W(ℝ) ≅ ℤ` through the signature** (Lam II.3; Tau Ceti's, consumed;
  `TauCeti/LinearAlgebra/QuadraticForm/Witt/Signature.lean`). Over an ordered field the
  integer signature is a ring map `TauCeti.WittRing.signature : W(K) →+* ℤ`; over an ordered
  real closed field, `ℝ` among them, it is the ring equivalence `TauCeti.WittRing.equivInt`, and
  two regular forms of the same rank are isometric exactly when their signatures agree
  (`TauCeti.RegularFormClass.eq_iff_rank_eq_and_signature_eq`,
  `TauCeti.wittClass_eq_iff_signature_eq`).

  *Needs:* `Ŵ(K)` and `W(K)` above; Mathlib's real closed instance on `ℝ`.

Basic API, all Tau Ceti's:

- constructors: `TauCeti.WittGrothendieckRing`, `TauCeti.WittRing`, `TauCeti.toWittGrothendieck`,
  `TauCeti.WittRing.mk`, `TauCeti.wittClass`, `TauCeti.fundamentalIdeal`,
  `TauCeti.oneFoldPfisterClass`, `TauCeti.pfisterForm`, `TauCeti.pfisterFormClass`,
  `TauCeti.pfisterClass`;
- morphisms: the dimension map `TauCeti.WittRing.dimMod2`; the discriminant map
  `I/I² → Kˣ/(Kˣ)²`; `TauCeti.WittRing.baseChange`; the signature;
- functoriality: `W` as a functor, with `I` and `Iⁿ` mapped into each other by a field
  extension (`TauCeti.WittRing.map_fundamentalIdeal_pow_le`);
- comparison lemmas: a Witt class against its anisotropic representative; a Pfister form
  against a quaternion norm form;
- naturality: Pfister classes are stable under a field extension
  (`TauCeti.WittRing.baseChange_pfisterClass`);
- edge cases: `n = 0`, where `⟨⟨⟩⟩ = ⟨1⟩` (`TauCeti.pfisterClass_zero`); the hyperbolic class,
  which is zero in `W(K)` (`TauCeti.wittClass_hyperbolicClass`); `⟨⟨1⟩⟩ = ⟨1,−1⟩`, which is zero
  in `W(K)` (`TauCeti.oneFoldPfisterClass_one`).

⚠ Nearby false statement. Roundness in the form used here is proved only for `n ≤ 2`. The
unrestricted statement, for every `n`-fold Pfister form, is true but is excluded, because the
proof needs the Pfister theory that this roadmap excludes. Do not cite the excluded general
statement in a proof.

### Examples

- `W(K) ≅ ZMod 2` for `K` separably closed, so `W(ℂ) ≅ ZMod 2`
  (`TauCeti.WittRing.equivZModTwoOfIsSepClosed`,
  `TauCeti/LinearAlgebra/QuadraticForm/Witt/SepClosed.lean`).
- `W(ℝ) ≅ ℤ` through the signature (`TauCeti.WittRing.equivInt`); in particular `⟨1,1⟩` and
  `⟨−1,−1⟩` over `ℝ` have signatures `2` and `−2` and different Witt classes.
- `⟨⟨1⟩⟩ = ⟨1,−1⟩` is zero in `W(K)` (`TauCeti.oneFoldPfisterClass_one`).
- `⟨2⟩` over `ℚ` is not an integer multiple of `⟨1⟩` in `W(ℚ)`, which is the `n = 0` warning
  above.

### Dependencies

Layers 0 to 3. Mathlib's `Ideal`, `Ideal.Cotangent`, `AddSubgroup.closure` and
`Algebra.GrothendieckAddGroup`. Tau Ceti's `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Semiring.lean`
and `TauCeti/LinearAlgebra/QuadraticForm/Witt/` (`Ring`, `FundamentalIdeal`, `Discriminant`,
`Pfister/`, `Round`, `BaseChange`, `SepClosed`, `Signature`). No other roadmap.

## Layer 5: the Brauer-valued invariants

This layer multiplies quaternion symbols in Mathlib's `BrauerGroup K` under Tau Ceti's
tensor-product group law `TauCeti.BrauerGroup.instCommGroup`
(`TauCeti/Algebra/BrauerGroup/Group.lean`). Every identity below is about that precise class and
that law, never about an arbitrary pairing or an admitted group structure on the quotient. The
whole layer is Tau Ceti's at the pin and is consumed here; the statements fix what a consumer may
cite.

**Quaternion algebras are central simple.** For `a b : Kˣ` with `2` invertible, `ℍ[K,a,b]` is
central, simple and four-dimensional: Tau Ceti's instances `TauCeti.QuaternionAlgebra.instIsCentral`
and `TauCeti.QuaternionAlgebra.instIsSimpleRing` (`TauCeti/Algebra/Quaternion/CentralSimple.lean`).
The general presentation `ℍ[K,a,b,c]` with `c·(b² + 4a) ≠ 0` is covered by
`TauCeti.QuaternionAlgebra.isSimpleRing_of_j_sq_mul_discr_ne_zero` and
`TauCeti.QuaternionAlgebra.isCentral_of_j_sq_ne_zero_or_discr_ne_zero`, and is identified with the
symbol with parameters `(b² + 4a, c)` by `TauCeti.QuaternionAlgebra.completeSquareEquiv`
(`TauCeti/Algebra/Quaternion/SymbolEquiv.lean`). The two-parameter `ℍ[K,a,b] = ℍ[K,a,0,b]`
satisfies the hypothesis because `b·4a ≠ 0`.

*Needs:* Layer 2's symbol relations and split-or-division dichotomy; Mathlib's `Algebra.IsCentral`
and `IsSimpleRing`.

**The quaternion symbol in `Br(K)`.** The class `[(a,b)] := ⟦ℍ[K,a,b]⟧` is Tau Ceti's
`TauCeti.BrauerGroup.quaternionClass` (`TauCeti/Algebra/Quaternion/BrauerClass.lean`), with the API
later layers cite:

- symmetry `[(a,b)] = [(b,a)]`, `TauCeti.BrauerGroup.quaternionClass_comm`;
- square-class invariance in each argument, `[(a, c²b)] = [(a,b)]`,
  `TauCeti.BrauerGroup.quaternionClass_mul_sq_right` and `TauCeti.BrauerGroup.quaternionClass_mul_sq_left`;
- two-torsion `[(a,b)]² = 1`, from `ℍ[K,a,b]ᵒᵖ ≃ₐ[K] ℍ[K,a,b]` through `star`,
  `TauCeti.BrauerGroup.quaternionClass_sq`;
- **bilinearity** `[(a, bc)] = [(a,b)]·[(a,c)]` and the same in the first argument, from the algebra
  relation `(a,b) ⊗ (a,c) ∼ (a,bc)` (Gille–Szamuely 1.5.2 for the statement, Lam III.2.11 for the
  linkage), `TauCeti.BrauerGroup.quaternionClass_mul` and `TauCeti.BrauerGroup.quaternionClass_mul_left`;
- the Steinberg relation `[(a, 1−a)] = 1` for `a : Kˣ` with `1 − a ≠ 0`, and `[(a,−a)] = 1`:
  `TauCeti.BrauerGroup.quaternionClass_one_sub` and `TauCeti.BrauerGroup.quaternionClass_neg_self`;
- the factorization through square classes, the biadditive map
  `Kˣ/(Kˣ)² × Kˣ/(Kˣ)² → Br(K)[2]`, which is `TauCeti.BrauerGroup.quaternionClassOnSquareClasses`;
- **invariance under binary equivalence**: `⟨a,b⟩ ≅ ⟨c,d⟩` gives `[(a,b)] = [(c,d)]`,
  `TauCeti.BrauerGroup.quaternionClass_congr`, which is Layer 3's binary quaternion lemma read in
  `Br(K)`. ⚠ It does not follow from symmetry, two-torsion and bilinearity alone: a symmetric
  bilinear pairing on the square-class group can take a nonzero value at `([2],[−1])` and still
  satisfy those three, while `⟨2,−1⟩ ≅ ⟨1,−2⟩` forces the value `1`.

*Needs:* the central-simplicity milestone above; Layer 2's symbol relations; Layer 3's binary
quaternion lemma; TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras Layer 4 (tensor products of
central simple algebras and the opposite-algebra package).

**The Hasse invariant.** `s : RegularFormClass K → BrauerGroup K`,
`s(⟨a₁,…,aₙ⟩) = ∏_{i<j} [(aᵢ, aⱼ)]` with the empty product for `n ≤ 1`, is Tau Ceti's
`TauCeti.RegularFormClass.hasseInvariant` (`TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Hasse/Basic.lean`).
Well-definedness is Layer 0's descent principle, whose two step hypotheses are Layer 3's
chain-induction lemmas with `M = BrauerGroup K` and `F a b = [(a,b)]`; symmetry and bilinearity are
the bullets above, and the binary condition is `TauCeti.BrauerGroup.quaternionClass_congr`. This is
Lam V.3.18. The rank-one hypothesis holds because in rank one the product is empty. For `q` of rank
`n` and `r` of rank `m`, the two formulas are:

- `s(q ⊥ r) = s(q) · s(r) · [(d(q), d(r))]` (Lam p. 119), `TauCeti.RegularFormClass.hasseInvariant_add`;
- `s(λ • q) = s(q) · [(λ, −1)]^{n(n−1)/2} · [(λ, d(q))]^{n−1}` (Lam V.3.16),
  `TauCeti.RegularFormClass.hasseInvariant_mk_rankOne_mul`.

The second follows from bilinearity and from `[(λ,λ)] = [(λ,−1)]`
(`TauCeti.BrauerGroup.quaternionClass_self`), and is written out because each source states it in a
different convention. O'Meara's symbol `∏_{i≤j}` is related to `s` by
`TauCeti.RegularFormClass.omearaHasseSymbol_eq`: `S(q) = s(q) · (d(q), −1)`.

*Needs:* the quaternion symbol above; Layer 0's descent principle; Layer 3's chain-induction lemmas
and discriminant.

**Classification in dimension at most three** (Lam V.3.21). Two regular forms of the same
dimension `≤ 3` are isometric if and only if they have the same `d` and the same `s`:
`TauCeti.RegularFormClass.eq_iff_discr_eq_and_hasseInvariant_eq` on classes and
`QuadraticForm.equivalent_iff_discr_eq_and_hasseInvariant_eq` on forms
(`TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/LowRank.lean`). The proof from the
invariants back to an isometry runs through Layer 2's naturality of quaternion equivalences on pure
norm forms.

*Needs:* the Hasse invariant above; Layer 1's Witt cancellation; Layer 2's quaternion equivalences.

**The Clifford invariant.** Mathlib supplies the Clifford algebra, its grading and its even
subalgebra. Tau Ceti supplies the central-simplicity theorems: for regular `q` on a
finite-dimensional space, `CliffordAlgebra q` is central simple in even dimension
(`CliffordAlgebra.isCentral_of_even_finrank`, `CliffordAlgebra.isSimpleRing_of_even_finrank`,
`TauCeti/LinearAlgebra/CliffordAlgebra/CentralSimple/Basic.lean`), and `CliffordAlgebra.even q` is
central simple in odd dimension (`TauCeti.CliffordAlgebra.isCentral_even_of_odd_finrank`,
`TauCeti.CliffordAlgebra.isSimpleRing_even_of_odd_finrank`,
`TauCeti/LinearAlgebra/CliffordAlgebra/CentralSimple/Even.lean`). Both constructions are invariant
under isometry (`CliffordAlgebra.evenEquivOfIsometry`), so `c(q)`, the Brauer class of the algebra
the parity selects, is Tau Ceti's `TauCeti.RegularFormClass.cliffordInvariant`
(`TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Clifford.lean`), computed on forms by
`TauCeti.RegularFormClass.cliffordInvariant_formClass_of_even` and
`TauCeti.RegularFormClass.cliffordInvariant_formClass_of_odd`. The Lam V.3.20 comparison with the
Hasse invariant is `TauCeti.RegularFormClass.cliffordInvariant_eq_hasseInvariant_mul`:

- `c(q) = s(q) · [(−1, d(q))]^{(n−1)(n−2)/2} · [(−1,−1)]^{(n+1)n(n−1)(n−2)/24}`,

with the ⚠ Wall caution of the convention table. On `I²`, where `dim = 2m`, it reduces to
`c = s · [(−1,−1)]^{m(m−1)/2}`, `TauCeti.RegularFormClass.cliffordInvariant_eq_hasseInvariant_mul_of_signedDiscr_eq_zero`.

*Needs:* the Hasse invariant above; Mathlib's `CliffordAlgebra` with its grading and even
subalgebra; Layer 3's signed discriminant.

**The `I²` homomorphism**, in six steps. Each is a separate statement, because the existence of
`c` on `I²` is a theorem about the Clifford invariant and not a formality. All six are Tau Ceti's
(`TauCeti/LinearAlgebra/QuadraticForm/Witt/Clifford.lean` and `Witt/Pfister/`).

1. **Additivity against `I²`**: `c(q ⊥ r) = c(q) · c(r)` when the Witt class of one summand, say
   `q`, lies in `TauCeti.fundamentalIdeal K ^ 2`, that is when `q` has even rank and trivial signed
   discriminant (`TauCeti.wittClass_mem_fundamentalIdeal_sq_iff`), and `r` is arbitrary:
   `TauCeti.RegularFormClass.cliffordInvariant_add_of_signedDiscr_eq_zero` and
   `TauCeti.WittRing.cliffordInvariant_add_of_mem_fundamentalIdeal_sq`. The dimension-dependent
   correction terms of Lam V.3.20 and of the orthogonal-sum formula cancel exactly then. Over `ℝ`,
   `⟨1,1,1,1⟩ ∈ I²` and `⟨1,1,1⟩ ∉ I²` give `c(⟨1⁷⟩) = 1 = [ℍ] · [ℍ]`, an instance with only one
   summand in `I²`. ⚠ When neither summand lies in `I²` the identity can fail, so the hypothesis is
   part of the statement, and `c` is not additive on `W(K)`: over `ℝ`,
   `c(⟨1,1⟩ ⊥ ⟨1⟩) = c(⟨1,1,1⟩) = [ℍ]` while `c(⟨1,1⟩) · c(⟨1⟩) = 1`.
2. **The value on a 2-fold Pfister generator**, `c(⟨⟨a,b⟩⟩) = [(a,b)]`:
   `TauCeti.RegularFormClass.cliffordInvariant_pfisterFormClass_two` and
   `TauCeti.WittRing.cliffordInvariant_pfisterClass_two`.
3. **Vanishing on a 3-fold Pfister generator**, `c(⟨⟨a,b,c⟩⟩) = 1` (Lam V.3.4):
   `TauCeti.RegularFormClass.cliffordInvariant_pfisterFormClass_three`, and on all of `I³`,
   `TauCeti.WittRing.cliffordInvariant_eq_one_of_mem_fundamentalIdeal_cube`.
4. **Generation of `I²` and of `I³`** by those forms: `TauCeti.fundamentalIdeal_sq_eq_addClosure`
   and `TauCeti.fundamentalIdeal_cube_eq_addClosure`, the cases `n = 2, 3` of
   `TauCeti.fundamentalIdeal_pow_eq_addClosure` (Layer 4). ⚠ Additive generation, not ideal
   generation: the ideal statement does not let a homomorphism be defined by its values on the
   generators.
5. **The homomorphism** `I² → Br(K)[2]`, `TauCeti.cliffordHomI2`, with
   `TauCeti.cliffordHomI2_pfisterClass` computing it on the generator, `TauCeti.cliffordHomI2_two_torsion`
   placing its image in the `2`-torsion, and `TauCeti.cliffordHomI2_eq_zero` its vanishing on `I³`.
6. **The quotient homomorphism** `c̄ : I²/I³ → Br(K)[2]`, `TauCeti.cliffordHomI2Bar` on
   `TauCeti.fundamentalI3InI2`, with `TauCeti.cliffordHomI2Bar_mk` computing it on a representative.

No injectivity, surjectivity or classification claim for `c̄` is a milestone. Injectivity is
Merkurjev's theorem, and it is an explicit exclusion of this roadmap's scope.

*Needs:* the Clifford invariant above; Layer 4's fundamental ideal, its powers and the additive
generation of `Iⁿ` by Pfister classes.

**Base change and the remaining API.** Base change `TauCeti.BrauerGroup.baseChange`
(`TauCeti/Algebra/BrauerGroup/BaseChange.lean`) commutes with the symbol
(`TauCeti.BrauerGroup.baseChange_quaternionClass`, `TauCeti/Algebra/Quaternion/BaseChange.lean`), with
the Hasse invariant (`TauCeti.RegularFormClass.hasseInvariant_baseChange`) and with the Clifford
invariant (`TauCeti.RegularFormClass.cliffordInvariant_baseChange`). Rank `0` and `1` give
`s = c = 1` (`TauCeti.RegularFormClass.hasseInvariant_eq_one_of_rank_le_one`,
`TauCeti.RegularFormClass.cliffordInvariant_eq_one_of_rank_le_one`); the hyperbolic class has
`s = c = 1`. Downstream, sublayer 6E compares `s` with the local Hasse invariant, and Layer 8
identifies `s` with `w₂` through Layer 7B.

*Needs:* the statements above; TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras Layer 6 for
the general theory of base change of central simple algebras.

### Examples

- `[(a, −a)] = 1` and `[(1,b)] = 1` for every `a, b ∈ Kˣ`; `s⟨a⟩ = 1`; `s⟨a,b⟩ = [(a,b)]`
  (`TauCeti.RegularFormClass.hasseInvariant_mk_rankOne`, `TauCeti.RegularFormClass.hasseInvariant_mk_binary`).
- The orthogonal-sum formula at `⟨a⟩ ⊥ ⟨b⟩`: the left side is `[(a,b)]` and the right side is
  `1 · 1 · [(a,b)]`.
- The Clifford invariant of `⟨1,…,1⟩` over `ℝ` for `n = 1, …, 8` is `1, 1, [ℍ], [ℍ], [ℍ], [ℍ], 1, 1`,
  matching the algebras `ℝ`, `M₂(ℝ)`, `ℍ`, `M₂(ℍ)`, `M₂(ℍ)`, `M₄(ℍ)`, `M₈(ℝ)`, `M₁₆(ℝ)`. Here `s = 1`
  and `d = [1]`, so the factor `[(−1, d)]^{(n−1)(n−2)/2}` is `1` whatever its exponent, and the list
  checks only the second correction exponent of Lam V.3.20: the values are `[(−1,−1)]^{C(n+1,4)}`
  with `C(n+1,4) = 0, 0, 1, 5, 15, 35, 70, 126`.
- The first correction exponent is checked by `⟨−1,−1,−1⟩` over `ℝ`. Its even Clifford algebra is
  generated by `e₁e₃` and `e₂e₃`, which square to `−1` and anticommute, so `C₀ ≅ ℍ` and `c = [ℍ]`.
  The formula has `s = [ℍ]³ = [ℍ]`, `d = [−1]` and both exponents equal to `1`, so it gives
  `[ℍ] · [ℍ] · [ℍ] = [ℍ]`; with the first factor dropped it would give `1`.

### Dependencies

Mathlib's `CSA`, `IsBrauerEquivalent`, `BrauerGroup`, `Algebra.IsCentral` and `CliffordAlgebra`;
Tau Ceti's `TauCeti/Algebra/BrauerGroup/`, `TauCeti/Algebra/Quaternion/`,
`TauCeti/LinearAlgebra/CliffordAlgebra/` and `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/` and `TauCeti/LinearAlgebra/QuadraticForm/Witt/`;
Layers 0 to 4 of this roadmap; TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras
Layers 4 and 6.

## Layer 6: forms over a nonarchimedean local field

Scope: `K` is a nonarchimedean local field with `2` invertible, with its actual `ValuativeRel`,
topology and `IsNonarchimedeanLocalField` instance. This includes finite extensions of `ℚ_p` for
every prime and local fields of positive odd characteristic. In residue characteristic two it is a
finite extension of `ℚ_2` (`𝔽₂((t))` has `2 = 0`); its square-class count, unit filtration and
computations depend on its actual ramification and residue degrees. Serre's closed formulas and the
`8 × 8` table over `ℚ_2` are the acceptance suite.

The content of this layer is independent of Layer 5. The theorems that relate them are sublayer 6E.
The whole layer is Tau Ceti's at the pin, under `TauCeti/NumberTheory/LocalField/` and
`TauCeti/NumberTheory/HilbertSymbol/`; the statements below fix what a consumer cites.

### 6A. The local-field substrate, consumed

The general arithmetic of a nonarchimedean local field is the subject of
TauCetiRoadmap.LocalFieldsRamification (its *Exact supplier contracts*, items *Valuations and
`e`, `f`*, *Units*, *Power classes* and *Unramified extensions*), whose objects are Tau Ceti's: the
normalized valuation `TauCeti.normalizedValuation`, the unit filtration `TauCeti.unitFiltration`
with its graded pieces, the value `TauCeti.natCastValuation K 2`, the Teichmüller section
`TauCeti.teichmuller`, the ramification and residue degrees, the power-class counts and the
unramified extensions with their norm groups. Nothing here defines a second valuation, a second
filtration or a second ramification index: a second one would need a comparison lemma at every use
site, and every statement of 6B, 6C and 6D is written against these objects.

- **Uniformizers.** `TauCeti.IsUniformizer π` says `v_K(π) = 1`
  (`TauCeti/NumberTheory/LocalField/Uniformizer.lean`), one exists (`TauCeti.exists_isUniformizer`),
  and `TauCeti.isUniformizer_iff_exists_irreducible` compares it with the `Irreducible` convention in
  `𝒪[K]`. It is a predicate and not a component of a package, because an element of valuation one is
  not unique: over `ℚ_2` both `2` and `−2` are uniformizers. A theorem that needs a uniformizer takes
  it, and a theorem whose statement is independent of the choice says so.
- **The level `e = v_K(2)`** is `TauCeti.dyadicLevel`, which is `TauCeti.natCastValuation K 2`
  (`TauCeti/NumberTheory/LocalField/Squares.lean`). Under `Invertible (2 : K)` the element `2` is a
  unit, and `TauCeti.natCastValuation_eq_zero_iff` says that `e = 0` is exactly odd residue
  characteristic. ⚠ It is deliberately **not** `absoluteRamificationIndex K 2`: that invariant is
  defined for a finite extension of `ℚ_p`, so reading it at `p = 2` forces `[Algebra ℚ_[2] K]`, and
  then the case `e = 0` on which every count below splits is unsatisfiable rather than false. The two
  agree where both are defined, by `TauCeti.absoluteRamificationIndex_eq_natCastValuation`.
- **The square-class dictionary.** Square classes are taken in `Subgroup.square Kˣ`; the power-class
  counts and the Kummer isomorphism are stated at `(powMonoidHom n).range`, and the identification at
  `n = 2` is `TauCeti.square_eq_range_powMonoidHom`.
- **The local square theorem in its sharp form** (O'Meara 63:1). `U(K, 2e+1) ⊆ (Kˣ)²`, and the bound
  is sharp: `U(K, 2e) ⊄ (Kˣ)²`. These are `TauCeti.unitFiltration_le_square` and
  `TauCeti.not_unitFiltration_le_square`, valid in both residue characteristics. 6B needs the
  sharpness and not only the containment, because a defect list built on a depth that is not attained
  would classify nothing.
- **The square-class counts.** `#(Kˣ/(Kˣ)²) = 4 · q^e` with `q = #𝓀[K]`, in both residue
  characteristics: `TauCeti.card_squareClass` (`TauCeti/NumberTheory/LocalField/SquareClass.lean`).
  So the group is finite, its order is `4` in odd residue characteristic
  (`TauCeti.card_squareClass_of_odd`), and for `K/ℚ_2` of degree `N = e·f` it is `2^{N+2}`, which is
  `8` over `ℚ_2`. In odd residue characteristic the four classes are represented by `1, u, π, uπ`,
  where `u` is a unit whose residue is a nonsquare (`TauCeti.squareClass_eq_representative_of_isUnit_two`,
  `TauCeti/NumberTheory/LocalField/SquareClasses.lean`); that choice of `u` is part of the statement.
- **The graded pieces.** `U(K,0)/U(K,1) ≃* 𝓀[K]ˣ` is `TauCeti.unitFiltrationGradedZeroEquivResidueFieldUnits`
  (`TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean`), and `U(K,i)/U(K,i+1) ≃ 𝓀[K]⁺` for
  `i ≥ 1` is `TauCeti.unitFiltrationGradedSuccEquivResidueField` (`UnitFiltration/Graded.lean`). ⚠ The
  depth-zero piece is multiplicative and the deeper pieces are additive, and the two statements stay
  apart. 6B uses the additive form: it improves an approximation `u = 1 + ε` with `v_K(ε) = d` by
  writing the residue of `ε` as a square, which is possible because the piece is `𝓀[K]⁺` and a finite
  field is perfect.
- **The unramified quadratic class, in norm-equation form.** There is a nonsquare unit `Δ`,
  `Δ ≡ 1 mod 4`, such that `b = x² − Δ y²` is solvable exactly when `v_K(b)` is even:
  `TauCeti.exists_unramified_class` (`TauCeti/NumberTheory/LocalField/QuadraticForm/UnramifiedClass.lean`).
  The norm criterion pins `Δ` to a single square class: `TauCeti.unramified_class_unique`
  (`QuadraticForm/Ramification/Dictionary.lean`). Uniqueness is what 6B's ramification dictionary
  needs, since it says that exactly one unit square class has defect `4𝒪[K]`, a statement about a
  class and not a chosen element. The extension-level statement
  `x ∈ normGroup L/K ↔ f ∣ v_K(x)` is `TauCeti.mem_normGroup_iff_dvd_normalizedValuation`
  (`TauCeti/NumberTheory/LocalField/Norm/Unramified/Basic.lean`); the norm-equation form needs no
  extension-building API.

⚠ Sharpness of the local square theorem. Over `ℚ_2`, `e = 1` and `U(ℚ_2, 2) = 1 + 4ℤ_2` contains
`5`, which is not a square, so `2e+1` cannot be lowered to `2e`.

*Needs:* Mathlib's `IsNonarchimedeanLocalField`, `ValuativeRel`, `𝒪[K]`, `𝓂[K]`, `𝓀[K]`, `ℚ_[p]`,
`ℤ_[p]` and Hensel's lemma; from TauCetiRoadmap.LocalFieldsRamification's *Exact supplier
contracts*, the item *Valuations and `e`, `f`* (normalized valuation, `natCastValuation`,
ramification and inertia degrees), *Units* (unit filtration, graded pieces, Teichmüller section),
*Power classes* (power-class counts, local square theorem) and *Unramified extensions* (unramified
extensions, `TauCeti.map_normUnits_unitFiltration`, the norm-group criterion); Layer 0's
square-class calculus.

### 6B. The quadratic defect

The quadratic defect carries the dyadic content of Layer 6. Throughout, `e = v_K(2)`, so `e = 0`
exactly when the residue characteristic is odd. It is required API and not only a proof device:
its carrier, its calculus and the classification of unit defects are deliverables of this
sublayer, whatever route is taken to bimultiplicativity. All of it is Tau Ceti's, in
`TauCeti/NumberTheory/LocalField/QuadraticForm/Defect/`, `Ramification/` and `Norm/`.

- **The carrier.** For `a : Kˣ` the defect `𝔡(a)` is a fractional ideal, because an element of
  negative odd valuation has `δ(a) = v_K(a) < 0`. Negative valuation alone does not force this: over
  `ℚ_2`, `a = 5/4` and `ξ = 1/2` give `a − ξ² = 1`, and `δ(5/4) = 0`. It is O'Meara's
  `𝔡(a) = ⋂_ξ (a − ξ²)·𝒪[K]`, Tau Ceti's `TauCeti.quadraticDefect a : FractionalIdeal 𝒪[K]⁰ K`,
  characterized as a greatest lower bound by `TauCeti.isGLB_quadraticDefect`, because Mathlib's
  `FractionalIdeal` has no infima of infinite families. It is `𝓂[K]^δ(a)` when the exponent is finite
  (`TauCeti.quadraticDefect_eq_maximalIdeal_zpow`) and `0` when it is not.
- **The defect exponent** `δ(a) = sup_ξ v_K(a − ξ²) : WithTop ℤ`, Tau Ceti's `TauCeti.defectExponent`,
  with `δ(a) = ⊤` if and only if `a` is a square (`TauCeti.defectExponent_eq_top_iff`) and attained for
  a nonsquare (`TauCeti.exists_defectExponent_eq`). Every statement about the parity of `δ` carries
  the hypothesis that `a` is not a square.
- **The calculus**, for `a c : Kˣ`:
  - `𝔡(a) = 0` if and only if `a` is a square, `TauCeti.quadraticDefect_eq_zero_iff`;
  - `𝔡(a c²) = (c)² · 𝔡(a)`, that is `δ(a c²) = δ(a) + 2 v_K(c)`: `TauCeti.quadraticDefect_mul_sq` and
    `TauCeti.defectExponent_mul_sq`. So the parity of `δ` is an invariant of the square class;
  - `𝔡(a) ≤ 1` when `a ∈ 𝒪[K]`, `TauCeti.quadraticDefect_le_one`, so for a unit the defect is an
    integral ideal;
  - `𝔡(a) = a·𝒪[K]` when `v_K(a)` is odd (`TauCeti.quadraticDefect_of_odd`,
    `TauCeti.defectExponent_of_odd`), because then `v_K(a − ξ²) = min(v_K(a), 2v_K(ξ))` for every `ξ`.
- **The possible defects of a unit** (O'Meara 63:2, on top of the local square theorem of 6A). The
  defect of a unit is one of `0`, `𝓂[K]^{2e} = 4𝒪[K]`, or `𝓂[K]^{2k+1}` for `0 ≤ k < e`, a list of
  length `e + 2`: `TauCeti.defectExponent_le_two_mul_natCastValuation`,
  `TauCeti.defectExponent_eq_two_mul_natCastValuation_or_odd` and
  `TauCeti.quadraticDefect_eq_maximalIdeal_zpow_or_odd`, with each odd value attained
  (`TauCeti.exists_unit_defectExponent_eq_odd`). In odd residue characteristic the list is
  `{0, 𝒪[K]}`, which is Hensel's lemma. Over `ℚ_2` it is `{0, 4ℤ_2, 2ℤ_2}`, the defects of `1`, `5`
  and `−1`.
- **The ramification dictionary.** For a nonsquare `a`, `K(√a)/K` is unramified exactly when `δ(a)`
  is even and ramified exactly when it is odd: `TauCeti.isUnramified_iff_even_defectExponent` and
  `TauCeti.ramificationIndex_eq_two_iff_odd_defectExponent` (`Ramification/Basic.lean`). Among the
  unit square classes exactly one has `𝔡(u) = 4𝒪[K]`, the class of the `Δ` of 6A:
  `TauCeti.unramified_class_iff_even_defectExponent` and
  `TauCeti.defectExponent_eq_two_mul_natCastValuation_iff_isSquare_mul`. For a unit of odd defect
  `d`, `K(√a)/K` has discriminant `𝓂[K]^{2e−d+1}`:
  `TauCeti.discriminantIdeal_eq_of_odd_defectExponent` (`Ramification/Discriminant.lean`).

*Needs:* Mathlib's `FractionalIdeal` with its lattice structure; 6A's level, local square theorem,
graded pieces and unramified class; TauCetiRoadmap.LocalFieldsRamification's *Exact supplier
contracts*, items *Valuations and `e`, `f`* and *Units*.

The three symbol computations of O'Meara 63:11 to 63:13 follow.

- **Evaluation against the unramified class** (O'Meara 63:11). There is a nonsquare unit `Δ`, of
  valuation zero, such that `(Δ, b)_K = (−1)^{v_K(b)}` for every `b : Kˣ`. The content is the
  existence of `Δ`, which is 6A's `TauCeti.exists_unramified_class`; for that `Δ` the evaluation is
  `TauCeti.hilbertSymbol_unramified` (`QuadraticForm/UnramifiedClass.lean`), which is 6A's
  norm-equation criterion read through the definition of the symbol. It is the only closed formula
  available at this generality. Over `ℚ_2` the class is that of `5`: `(5, 2) = −1` while
  `(5, −1) = (5, 5) = +1`. The nonsquare unit `−1` is not the class, since `(−1, −1)_{ℚ_2} = −1`
  although `v(−1) = 0`; a formula asserted for every nonsquare unit would fail there.
- **Multiplicativity, in the form in which it is proved: an index theorem.** For a nonsquare `a`,
  `(Kˣ : N(K(√a)ˣ)) = 2`, where `N(K(√a)ˣ)` is `TauCeti.quadraticNormSubgroup a`
  (`TauCeti/NumberTheory/HilbertSymbol/NormSubgroup.lean`), the values of `x² − a y²`:
  `TauCeti.quadraticNormSubgroup_index_eq_two_of_not_isSquare`
  (`QuadraticForm/Bimultiplicativity.lean`). Bimultiplicativity then follows by group theory: the map
  `b ↦ (a,b)_K` is the `{±1}`-valued indicator of the norm subgroup, and the indicator of a subgroup
  is a homomorphism exactly when its index divides `2`
  (`TauCeti.hilbertSymbol_mul_iff_quadraticNormSubgroup_index_dvd_two`, which contains no
  arithmetic). Two reductions make the index computation finite:
  - `(Kˣ)² ⊆ N(K(√a)ˣ)` and `−a ∈ N(K(√a)ˣ)`, the second because `−a = N(√a)`:
    `TauCeti.square_le_quadraticNormSubgroup` and `TauCeti.neg_radicand_mem_quadraticNormSubgroup`.
    So the norm group is a union of square classes and the index is computed inside the finite group
    `Kˣ/(Kˣ)²` of 6A;
  - normalize `a` in its square class so that `v_K(a) ∈ {0,1}`, and use an integral basis `(1, ω)` of
    the maximal order `𝒪[L]` of `L = K(√a)`, with `T = Tr ω` and `N = N ω`. The unit norms are exactly
    the units among `u²(1 + Tt + Nt²)` and `u²(N + Tt + t²)` with `u ∈ 𝒪[K]ˣ`, `t ∈ 𝒪[K]`:
    `Module.Basis.exists_norm_eq_iff_of_integerRing` (`TauCeti/NumberTheory/LocalField/Norm/Quadratic.lean`).
    A unit norm has valuation zero in `L`, so it is the norm of a unit of `𝒪[L]` whose coordinates
    are primitive; dividing by whichever coordinate is a unit gives one of the two families. ⚠ This
    uses the maximal order, not the generally smaller order `𝒪[K][√a]`.
    The bases are Tau Ceti's: for `v_K(a) = 1` the Eisenstein basis `(1, √a)` with `T = 0`, `N = −a`;
    for a unit of odd defect `2k + 1 < 2e`, `ω = (√a − b)/π^k` with `T = −2b/π^k` and
    `N = (b² − a)/π^{2k}` (`TauCeti.exists_basis_integerRing_of_defectExponent_eq_odd`,
    `Ramification/IntegralBasis.lean`); for the nonsquare unit of maximal defect `2e`, `ω = (√a − b)/π^e`
    (`TauCeti.exists_basis_integerRing_of_defectExponent_eq_two_mul_natCastValuation`,
    `Ramification/UnramifiedBasis.lean`); in odd residue characteristic the unit radicand's basis
    `TauCeti.exists_basis_integerRing_of_sq_eq_of_isUnit`
    (`TauCeti/NumberTheory/LocalField/Unramified/Quadratic.lean`). For a unit radicand of finite
    defect `d` the test is finite: a unit is a norm exactly when its residue is a value of the
    integral norm polynomial modulo `𝓂[K]^{2e−d+1}`
    (`Module.Basis.exists_norm_eq_iff_exists_quotient_normForm_of_defectExponent_eq`,
    `QuadraticForm/Norm/Residue.lean`).
- **Nondegeneracy.** For a nonsquare `a` there is `b` with `(a,b)_K = −1`, with the witness read off
  the defect in three cases:
  1. `v_K(a)` odd: `b = Δ`, `TauCeti.hilbertSymbol_eq_neg_one_of_unramified_class_of_odd` and
     `TauCeti.exists_hilbertSymbol_eq_neg_one_of_odd` (`QuadraticForm/OddValuation.lean`).
  2. `a` a unit with `𝔡(a) = 4𝒪[K]`: `b = π`, because `a` is `Δ` up to squares, and here
     `N(K(√a)ˣ) = {x : v_K(x) even}` exactly: `TauCeti.mem_quadraticNormSubgroup_iff_even_of_unramified_class`
     and `TauCeti.quadraticNormSubgroup_index_eq_two_of_unramified_class` (`QuadraticForm/Norm/Index.lean`).
  3. `a` a unit with `𝔡(a) = 𝓂[K]^d`, `d` odd, `0 < d < 2e`, which is empty unless the residue
     characteristic is `2`. Then `U(K, 2e−d+1) ⊆ N(K(√a)ˣ)` and `U(K, 2e−d) ⊄ N(K(√a)ˣ)`:
     `TauCeti.unitFiltration_le_quadraticNormSubgroup_of_defectExponent_eq`
     (`QuadraticForm/Norm/Filtration.lean`) and
     `TauCeti.not_unitFiltration_le_quadraticNormSubgroup_of_odd_defectExponent`, combined as
     `TauCeti.unitFiltration_le_quadraticNormSubgroup_iff_of_odd_defectExponent`
     (`QuadraticForm/Norm/Sharpness.lean`). The second half is the witness. Also the norm group
     contains an element of odd valuation `d`
     (`TauCeti.exists_mem_quadraticNormSubgroup_toAdd_normalizedValuation_eq_of_odd_defectExponent`),
     so it is not contained in the even-valuation subgroup and the unit part decides the index
     (`TauCeti.index_subgroupOf_unitFiltration_eq_quadraticNormSubgroup_index_of_odd_defectExponent`).
     ⚠ The containment does **not** identify the unit norms with `U(K, 2e−d+1) · (𝒪[K]ˣ)²`: that
     product can have index `4` or more in `𝒪[K]ˣ`, already for `K = ℚ_2(√2)` and `d = 1`.

  Over `ℚ_2` case 3 reads `a = −1`, `d = 1`, `e = 1`: `U(ℚ_2, 2) = 1 + 4ℤ_2` lies in the norms (the
  classes `[1]` and `[5]`, which are sums of two squares), and `3` is the non-norm that
  `U(ℚ_2, 1) ⊄ N` supplies.

⚠ Counterexample to multiplicativity of the defect. Over `ℚ_2`, `𝔡(−1) = 2ℤ_2` and `𝔡(5) = 4ℤ_2`,
and `−5 ≡ 3 mod 8` gives `𝔡(−5) = 2ℤ_2`, which is not `8ℤ_2`
(`TauCeti.quadraticDefect_neg_one_mul_five_ne_mul_padicTwo`). No proof may assume that `𝔡` is
multiplicative. ⚠ No base-change formula is claimed: a base change can turn a nonsquare into a
square, and then the defect becomes `0` rather than scaling.

*Needs:* the 6B calculus above; 6A's unramified class, local square theorem and square-class counts;
Mathlib's `QuadraticAlgebra K a 0` and its norm; TauCetiRoadmap.LocalFieldsRamification's *Exact
supplier contracts*, items *Finite extensions*, *Valuations and `e`, `f`* and *Unramified
extensions*, for integral closures, ramification indices and unramified norms.

### 6C. The Hilbert symbol and the local Hasse invariant

**The symbol.** `hilbertSymbol a b : ℤˣ`, for `a b : Kˣ`, is `+1` when `b = x² − a y²` has a
solution in `K` and `−1` otherwise. It is Tau Ceti's `TauCeti.hilbertSymbol`
(`TauCeti/NumberTheory/HilbertSymbol/Basic.lean`), defined over every field, and this roadmap's
`hilbertSymbol` is a reducible alias of it. Nothing about quaternion algebras or their classification
enters the definition, so nothing later is circular. The comparison with the cohomological pairing
is also Tau Ceti's, as item 13 records, so both halves of the symbol, the norm-equation
definition and its cohomological identification, are consumed here.

**Checks.**

- `(1, b) = +1` over every field in which `2` is invertible, with the solution
  `x = (b + 1)/2`, `y = (b − 1)/2`. Over `𝔽₂(t)`, where `2 = 0`, the definition still evaluates,
  and `(t, 1) = +1` (take `x = 1`, `y = 0`) while `(1, t) = −1`, since `x² − y² = (x + y)²` and
  `t` is not a square: symmetry needs `2` invertible, and item 3 carries that hypothesis.
- The value depends on the field and not only on the pair: `(−1, 3)` is `−1` over `ℚ_2`
  (for `x, y ∈ ℤ_2` not both even, `x² + y²` is `1`, `2` or `5 mod 8`, never `3`, and scaling
  changes the valuation by an even amount) and over `ℚ`, and `+1` over `ℚ_5`, where `3` and `−1`
  are units at an odd prime. A symbol read off the pair alone would give one value in all three.
- Over `ℝ`, `(−1, −1) = −1` (Hamilton's quaternions) and `(−1, 2) = +1` (`2 = 1² + 1²`); over
  `ℚ`, `(−1, 21) = −1` while `(−1, 3) = (−1, 7) = −1`, so the symbol is not multiplicative over a
  general field, and bimultiplicativity (item 5) is a theorem about local fields.

*Needs:* Mathlib's `Units`; nothing else.

**The classical construction, before any cohomological normalization.** The local results of this
sublayer are proved without the local invariant map, in this order.

- **The quadratic extension as a local field.** For a nonsquare `a`, take `L = K(s)` with `s² = a`,
  of degree `2`, separable because `2 ≠ 0`, Galois with group generated by `s ↦ −s`. Equip `L` with
  the spectral-norm structures `TauCeti.algebraicExtensionValuativeRel K L` and
  `TauCeti.algebraicExtensionNormedFieldTopology K L`, defined for `[Field K] [ValuativeRel K]
  [TopologicalSpace K] [IsNonarchimedeanLocalField K]` and `[Field L] [Algebra K L]
  [Algebra.IsAlgebraic K L]` (`TauCeti/NumberTheory/LocalField/AlgebraicExtension/Basic.lean`); with
  them `L` is a nonarchimedean local field, `TauCeti.finiteExtension_isNonarchimedeanLocalField`
  under `[Module.Finite K L]` (`TauCeti/NumberTheory/LocalField/FiniteExtension/Basic.lean`), and the
  valuative relation extends that of `K`, `TauCeti.algebraicExtension_valuativeExtension`.
  *Needs:* 6A; Mathlib's `IsNonarchimedeanLocalField` and spectral norms;
  TauCetiRoadmap.LocalFieldsRamification's *Exact supplier contracts*, item *Finite extensions*.
- **The norm form.** The `K`-algebra equivalence `QuadraticAlgebra K a 0 ≃ₐ[K] L`, `(x, y) ↦ x + ys`,
  carries Mathlib's `QuadraticAlgebra.norm` to the field norm, because multiplication by `x + ys` has
  matrix `[[x, ay], [y, x]]` (`QuadraticAlgebra.det_toLinearMap_eq_norm`). So the norm subgroup
  `TauCeti.normGroup K L`, the range of `TauCeti.Algebra.normUnits K`, is the set of `b = x² − a y²`
  with `(x, y) ≠ 0`, which is `TauCeti.quadraticNormSubgroup a`.
  *Needs:* the previous item; Mathlib's `QuadraticAlgebra`.
- **The index.** The index is `2`, by either of two Tau Ceti proofs: the square-class count of 6A,
  `TauCeti.quadraticNormSubgroup_index_eq_two_of_not_isSquare`, or the cyclic norm index
  `TauCeti.index_normGroup_of_isCyclic` for `L/K` with both fields local, `[ValuativeExtension K L]`,
  `[Module.Finite K L]`, `[IsGalois K L]` and `IsCyclic (L ≃ₐ[K] L)`, stated for `K L : Type`
  (`TauCeti/NumberTheory/ClassFieldTheory/Brauer/LocalH2Bound.lean`), whose proof is a finite cyclic
  cohomology and Herbrand-quotient computation with no reciprocity and no characteristic-zero
  premise. When `a` is a square the split algebra `K × K` has surjective norm and the symbol is `+1`;
  that case is not passed to the field-extension theorem.
  *Needs:* the previous item; 6A's square-class counts; TauCetiRoadmap.ClassFieldTheory Layer 5 for
  the local cyclic cohomology that the second proof uses.
- **Symmetry, bimultiplicativity, nondegeneracy and the Hasse invariant** then follow as items 3 to
  7 below, with no input from 6E or Layer 7B. The direct 6B tables and witnesses are separate
  computations, and no square-root-coordinate integrality is assumed anywhere. The cohomological sign
  is fixed only in 6E, after 6D's classical uniqueness of the quaternion division algebra, so there
  is no cycle between 6D and 6E.

Milestones, in this order, each Tau Ceti's:

1. **Definition**, as above: `TauCeti.hilbertSymbol_def`.
2. **Agreement with the other descriptions.** `(a,b)_K = 1` if and only if `b` is a norm from
   `K(√a)` (`TauCeti.hilbertSymbol_eq_one_iff_exists_norm_eq`), if and only if `⟨1, −a, −b⟩` is
   isotropic (`TauCeti.hilbertSymbol_eq_one_iff_not_anisotropic_weightedSumSquares`), if and only if
   `ℍ[K,a,b]` splits (`TauCeti.hilbertSymbol_eq_one_iff_nonempty_algEquiv_matrix`); this is Layer 2's
   four-fold criterion. Square-class invariance in each argument, `TauCeti.hilbertSymbol_congr_sq`,
   and `(a, −a) = +1`, this roadmap's `hilbertSymbol_neg_self` (Tau Ceti's
   `TauCeti.hilbertSymbol_neg_self`, with the witness `−a = 0² − a·1²`), hold over every field.
3. **Symmetry** `(a,b)_K = (b,a)_K`, `TauCeti.hilbertSymbol_comm`. After it the orientations
   `b ∈ N(K(√a)ˣ)` and `a ∈ N(K(√b)ˣ)` are interchangeable, so a source may be read in either.
4. **The norm index**, as above.
5. **Bimultiplicativity** `(a, bc)_K = (a,b)_K · (a,c)_K`, with the dyadic case included (O'Meara
   63:11 to 63:13; Serre III Thm 2 for `K = ℚ_p`): `TauCeti.hilbertSymbol_mul_right` and
   `TauCeti.hilbertSymbol_mul_left`, under `(2 : K) ≠ 0`. This roadmap's `hilbertSymbol_mul` is the
   second-argument form under `[Invertible (2 : K)]`.
6. **Nondegeneracy.** For a nonsquare `a` there is `b` with `(a,b)_K = −1`, from properness of the
   index-two subgroup: `TauCeti.exists_hilbertSymbol_eq_neg_one`, under this roadmap's name
   `exists_hilbertSymbol_eq_neg_one`. On square classes it is
   `TauCeti.exists_hilbertSymbolOnSquareClasses_eq_neg_one`. The explicit witnesses of 6B are separate
   outputs.
7. **The local Hasse invariant** `s(q) = ∏_{i<j} (aᵢ, aⱼ)_K ∈ ℤˣ` for `q ≅ ⟨a₁,…,aₙ⟩`, Tau Ceti's
   `TauCeti.RegularFormClass.localHasse` (`TauCeti/NumberTheory/LocalField/QuadraticForm/Hasse.lean`),
   computed on presentations by `TauCeti.RegularFormClass.localHasse_mk`. This roadmap's `localHasse`
   is the same product on a diagonal tuple `Fin n → Kˣ`. Well-definedness is Layer 0's descent
   principle with `M = ℤˣ`, through Layer 3's chain-induction lemmas
   (`TauCeti.RegularFormClass.localHasse_congr`); the rank-one hypothesis holds because the product
   is empty. The two Layer 5 formulas hold in `{±1}`: `TauCeti.RegularFormClass.localHasse_add` and
   `TauCeti.RegularFormClass.localHasse_mk_rankOne_mul`, and O'Meara's `∏_{i≤j}` symbol is
   `TauCeti.RegularFormClass.omearaLocalHasseSymbol_eq`.

   **Checks.**

   - In ranks `0` and `1` the value is `+1` for every tuple, the product being empty. Over `ℚ_2`
     the tuple `![−1]` has `(−1, −1)_2 = −1`, so a product that includes the diagonal pairs
     gives `−1` there and is excluded.
   - `localHasse ![a, −a] = +1` over every field, because `−a = 0² − a · 1²`.
   - Over `ℚ_2`, `localHasse ![−1, 2] = (−1, 2)_2 = +1`, since `2 = 1² + 1²`; O'Meara's `∏_{i≤j}`
     on the same tuple is `(−1,−1)_2 · (−1,2)_2 · (2,2)_2 = (−1) · (+1) · (+1) = −1`, with
     `(2, 2)_2 = +1` from `2 = 2² − 2 · 1²`. The two conventions differ here, and the translation
     `∏_{i≤j} = s · (d, −1)_2` holds with `d = −2` and `(−2, −1)_2 = −1`, since `x² + 2y² = −1`
     has no solution in `ℚ_2` (for `x` a unit and `y` integral, `x² + 2y²` is `1` or `3 mod 8`;
     otherwise its valuation is `2·v(x)` or `1 + 2·v(y)`, never `0`).
   - `localHasse ![−1, −1]` is `−1` over `ℚ_2` and over `ℝ`, and `+1` over `ℚ_3`, where
     `1² + 1² = 2 ≡ −1 mod 3` lifts; so the invariant is not constant, and the three values
     match the ramification of Hamilton's quaternions at `2`, `∞` and `3`.
8. **The symbol on a square-class basis.** Fix a uniformizer `π`. Then `Kˣ = π^ℤ × 𝒪[K]ˣ`, so by
   bimultiplicativity and square-class invariance the symbol is determined by `(u, u')_K` for units,
   `(u, π)_K` for a unit `u`, and `(π, π)_K = (π, −1)_K`, which is `TauCeti.hilbertSymbol_self`
   (`TauCeti/NumberTheory/HilbertSymbol/NormSubgroup.lean`), valid in every residue characteristic.
9. **The closed formula in odd residue characteristic**, for a general nonarchimedean local field.
   Let `χ` be the quadratic residue character of `𝓀[K]`, pulled back to `𝒪[K]ˣ`, Tau Ceti's
   `TauCeti.Units.oddResidueSign` (`QuadraticForm/OddResidue/Symbol.lean`); by Hensel's lemma
   `χ(u) = +1` exactly when `u` is a square. Then, for `e = 0`:
   - `(u, u')_K = +1` for units, `TauCeti.hilbertSymbol_unit_eq_quadraticChar_of_odd`;
   - `(u, π)_K = χ(ū)`, `TauCeti.hilbertSymbol_unit_uniformizer_eq_quadraticChar` and
     `TauCeti.hilbertSymbol_eq_one_iff_isSquare_of_valuation_zero_of_isUniformizer`;
   - `(π, π)_K = χ(−1) = (−1)^{(q−1)/2}` with `q = #𝓀[K]`, `TauCeti.hilbertSymbol_uniformizer_self`.

   Hence for `a = π^α u` and `b = π^β u'`:
   `(a,b)_K = (−1)^{αβ(q−1)/2} · χ(ū)^β · χ(ū')^α`, which is `TauCeti.hilbertSymbol_oddResidue_formula`
   (`QuadraticForm/OddResidue/Formula.lean`). At `K = ℚ_p` with `π = p` and `χ = legendreSym` this is
   Serre III Thm 1, `TauCeti.Padic.hilbertSymbol_formula_of_ne_two` (`QuadraticForm/OddResidue/Padic.lean`).
10. **The closed formula over `ℚ_2`** (Serre III Thm 1). For `a = 2^α u`, `b = 2^β v` with
    `u, v ∈ ℤ_2ˣ`, `(a,b) = (−1)^{ε(u)ε(v) + αω(v) + βω(u)}`, with `ε(u) = (u−1)/2 mod 2` and
    `ω(u) = (u²−1)/8 mod 2`: `TauCeti.hilbertSymbol_padicTwo` (`QuadraticForm/PadicTwo.lean`). The two
    sign functions are real data, `TauCeti.serreEps` and `TauCeti.serreOmega`
    (`TauCeti/NumberTheory/Padics/SerreSigns.lean`), functions of `u mod 8`: on the odd residues
    `1, 3, 5, 7` they are `ε = 0,1,0,1` and `ω = 0,1,1,0`. ⚠ The exponent is computed in `ZMod 2` and
    only then turned into a sign.
11. **A finite dyadic extension.** There is no closed formula of Serre's shape for a general finite
    extension of `ℚ_2`. What determines the symbol is that it is a **nondegenerate symmetric
    `𝔽₂`-bilinear form** on the finite group `Kˣ/(Kˣ)²` of order `4·q^e = 2^{[K:ℚ_2]+2}`:
    `TauCeti.hilbertSymbolForm` with `TauCeti.isSymm_hilbertSymbolForm` and
    `TauCeti.nondegenerate_hilbertSymbolForm` (`QuadraticForm/HilbertSymbolForm.lean`). The value
    against the unramified class is the closed `(Δ, b)_K = (−1)^{v_K(b)}` of 6B, and every remaining
    value is decided by 6B's norm-group description for a unit of defect exponent `d`.
12. **The `8 × 8` table over `ℚ_2`** on the representatives `{±1, ±5, ±2, ±10}`
    (`TauCeti.padicTwoSquareClassRep`), as decidable computations: `TauCeti.hilbertSymbol_padicTwoSquareClassRep`.
    Its content is the Gram matrix on the `𝔽₂`-basis `{−1, 2, 5}` of `ℚ_2ˣ/(ℚ_2ˣ)²`, writing `+1` as
    `0` and `−1` as `1`: rows `(1, 0, 0)`, `(0, 0, 1)`, `(0, 1, 0)`, that is `(−1,−1) = −1` and
    `(2,5) = −1` with every other basis pairing `+1`, `TauCeti.toMatrix_hilbertSymbolForm_padicTwo`. The
    matrix is nondegenerate over `𝔽₂`, which is item 6 on this basis.
13. **The symbol is the mod-2 specialization of the cohomological pairing.** With the dictionary
    `0 ↦ +1`, `1 ↦ −1` (`TauCeti.hilbertSign`), `(a,b)_K` is the sign of
    `TauCeti.ClassFieldTheory.localSymbol` at the Kummer cup pairing of `(a)` and `(b)`:
    `TauCeti.hilbertSymbol_eq_cohomological`, from the vanishing comparison
    `TauCeti.localSymbol_eq_zero_iff_cup` (`TauCeti/FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean`),
    over every field in which `2` is invertible. The comparison runs through Layer 7C's cup-norm
    theorem; 6E derives the same sign from the Hasse invariant.
14. **The global product formula.** Over a number field the symbols at the finite places, read in
    the completions, and at the real places multiply to `1`: Tau Ceti's
    `TauCeti.hilbertSymbol_productFormula` (`TauCeti/NumberTheory/QuadraticForm/Global/ProductFormula.lean`),
    obtained from `TauCeti.ClassFieldTheory.hilbertProductFormula` through the sign dictionary.
    It is the form of reciprocity that `GlobalQuadraticForms`, `IntegralLattices` and
    `ClassicalArithmeticCompletion` consume, and the name they cite is the Tau Ceti one. It
    constrains the local symbols; it is not a local-global classification theorem.
15. **The two Hasse invariants agree**, which is sublayer 6E.

⚠ Nearby false generalization. Bimultiplicativity fails over a general field. Take `K = ℚ` and
`a = −1`: `3` and `7` are not sums of two rational squares, and neither is `21`, so the indicator of
the norm group of `ℚ(i)` is not a homomorphism. The index-two theorem is the local input that makes
it one.

*Needs:* 6A and 6B; Layer 2's four-fold criterion; Layer 0's descent principle and Layer 3's
chain-induction lemmas and binary quaternion lemma; Mathlib's `legendreSym` and
`TauCeti/NumberTheory/LegendreSymbol/SquareClass.lean` for item 9; TauCetiRoadmap.ClassFieldTheory
Layers 5 and 14 for the local symbol of item 13 and the reciprocity of item 14.

### 6D. The classification and its corollaries

All of 6D is Tau Ceti's, in `TauCeti/NumberTheory/LocalField/QuadraticForm/`.

- **The classification** (O'Meara 63:20, Serre IV Thm 7). Two regular forms over `K` are isometric
  if and only if `(dim, d, s)` agree, where `d` is the plain discriminant in `Kˣ/(Kˣ)²` and `s` is the
  local Hasse invariant: `TauCeti.RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq` on
  classes and `QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq` on forms
  (`Classification.lean`). Because the dimension is part of the tuple, `(dim, d±, s)` is an
  equivalent complete invariant, `TauCeti.RegularFormClass.eq_iff_rank_eq_and_signedDiscr_eq_and_localHasse_eq`,
  through the conversion `TauCeti.RegularFormClass.signedDiscr_eq_sign_add_discr`. The plain `d` is the
  primary invariant of this roadmap. The bijection of classes with admissible triples is
  `TauCeti.RegularFormClass.localInvariantsEquiv` (`Invariants.lean`).
- **Realization** (O'Meara 63:23, Serre IV Prop 6). A triple `(n, d, s)` with `n ≥ 1` is realized by
  a regular form except when `n = 1` and `s = −1`, or `n = 2`, `d = [−1]` and `s = −1`:
  `TauCeti.RegularFormClass.exists_of_realization` and the exact criterion
  `TauCeti.RegularFormClass.exists_rank_eq_discr_eq_localHasse_eq_iff` (`Realization.lean`). Both
  exceptions are forced: the empty product gives `s = +1` in dimension 1, and `⟨a, −a⟩` has
  `s = (a, −a)_K = +1` (`TauCeti.RegularFormClass.localHasse_eq_one_of_rank_eq_two_of_discr_eq_neg_one`).
- **Isotropy by rank** (Serre IV Thm 6), in the fixed convention:
  - rank 1: never isotropic;
  - rank 2: isotropic if and only if `d = [−1]`,
    `TauCeti.RegularFormClass.not_anisotropic_iff_discr_eq_neg_one_of_rank_eq_two`, which holds over
    every field;
  - rank 3: isotropic if and only if `s = (−1, −d)_K`,
    `TauCeti.RegularFormClass.not_anisotropic_iff_localHasse_eq_of_rank_eq_three`;
  - rank 4: isotropic if and only if `d ≠ [1]`, or `d = [1]` and `s = (−1,−1)_K`,
    `TauCeti.RegularFormClass.not_anisotropic_iff_discr_ne_zero_or_localHasse_eq_of_rank_eq_four`;
  - rank at least 5: always isotropic, `TauCeti.RegularFormClass.not_anisotropic_of_five_le_rank`
    (`Isotropy.lean`).
- **Representation**, as a corollary. For regular `q` and `a : Kˣ`, `a` lies in the value set of `q`
  if and only if `q ⊥ ⟨−a⟩` is isotropic, and the rank list decides it rank by rank (O'Meara 63:21,
  Serre IV cor. to Thm 6): `QuadraticForm.mem_unitValueSet_iff_squareClass_eq_discr_of_finrank_eq_one`,
  `QuadraticForm.mem_unitValueSet_iff_hilbertSymbol_eq_localHasse_of_finrank_eq_two`,
  `QuadraticForm.mem_unitValueSet_iff_squareClass_ne_or_localHasse_eq_of_finrank_eq_three` and
  `QuadraticForm.mem_unitValueSet_of_four_le_finrank` (`Representation.lean`, `Binary.lean`).
- **`u(K) = 4`.** Every regular form of dimension at least `5` is isotropic, and there is an
  anisotropic form of dimension `4` (O'Meara 63:19): `QuadraticForm.not_anisotropic_of_five_le_finrank`
  and `TauCeti.RegularFormClass.exists_rank_eq_four_and_anisotropic`.
- **The anisotropic quaternary form is unique** up to isometry (O'Meara 63:17–18, Serre IV Thm 7
  cor.): `TauCeti.RegularFormClass.eq_of_rank_eq_four_of_anisotropic` and
  `QuadraticForm.equivalent_of_finrank_eq_four_of_anisotropic` (`AnisotropicQuaternary.lean`). It is
  the norm form of the unique quaternion division algebra,
  `TauCeti.RegularFormClass.anisotropic_iff_eq_pfisterFormClass_two`, and `⟨1,1,1,1⟩` realizes it over
  `ℚ_2`. Equivalently there are exactly two quaternion algebras up to isomorphism:
  `TauCeti.BrauerGroup.quaternionClass_eq_iff_hilbertSymbol_eq` and
  `TauCeti.BrauerGroup.natCard_quaternionSubgroup`. This consequence is never used to define the
  symbol; it is what makes the two-element group `Q(K)` of 6E available without cohomology.

⚠ Nearby false generalization. `(dim, d, s)` is not a complete invariant over a general field. Over
`ℝ`, `⟨1,1,1,1⟩` and `⟨−1,−1,−1,−1⟩` both have dimension `4`, discriminant `[1]` and Hasse invariant
`+1`, because `(−1,−1)_ℝ = −1` occurs six times, and they are not isometric. Likewise `u(K) = 4`
uses the local hypothesis: `u(ℝ) = ∞` and `u(𝔽_q) = 2`.

*Needs:* 6A's square-class counts and unramified class; 6C's symbol, bimultiplicativity,
nondegeneracy and local Hasse invariant; Layer 1's Witt decomposition, cancellation and extension
theorem; Layer 3's discriminants; Layer 4's Pfister forms.

### 6E. The two Hasse invariants agree, and both are the invariant map

**Milestone 1.** The subgroup `Q(K) ≤ BrauerGroup K` generated by the quaternion classes,
`TauCeti.BrauerGroup.quaternionSubgroup` (`TauCeti/Algebra/Quaternion/Subgroup.lean`), is
`{1, [D]}` with `D` the quaternion division algebra of 6D, so the sign isomorphism
`ε : Q(K) ≃* ℤˣ` with `ε [D] = −1` is well defined: `TauCeti.BrauerGroup.quaternionSubgroupSignEquiv`
(`TauCeti/NumberTheory/LocalField/Quaternion/Subgroup.lean`). Every Hasse invariant lies in `Q(K)`
(`TauCeti.RegularFormClass.hasseInvariant_mem_quaternionSubgroup`), and `ε(s_Br(q)) = s(q)` termwise
from Layer 2's four-fold criterion: `TauCeti.RegularFormClass.quaternionSubgroupSignEquiv_apply_hasseInvariant`
(`TauCeti/NumberTheory/LocalField/QuadraticForm/Brauer.lean`). On diagonal tuples this is this
roadmap's `hasseInvariant_eq_localHasse`, stated with `localHasse`. This milestone needs no
cohomology: 6C builds the local Hasse invariant from the Hilbert symbol alone and Layer 5 builds the
Brauer-valued one from the Brauer group alone.

*Needs:* Layer 5's quaternion symbol and Hasse invariant; 6C's local Hasse invariant; 6D's
uniqueness of the quaternion division algebra.

**Milestone 2.** `ε` is the degree-two local invariant. Precisely, `Q(K) = Br(K)[2]`
(`TauCeti.BrauerGroup.quaternionSubgroup_eq_twoTorsion`,
`TauCeti/NumberTheory/LocalField/Quaternion/Invariant.lean`), the local invariant
`TauCeti.ClassFieldTheory.invMap` carries the class of `[(a,b)]` to `1/2` exactly when
`(a,b)_K = −1` (`TauCeti.BrauerGroup.invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff`), and the
normalized invariant `TauCeti.ClassFieldTheory.h2MuEquivZMod` on `H²(G_K, μ₂)` sends that class to `1`
exactly when `(a,b)_K = −1` (`TauCeti.BrauerGroup.h2MuEquivZMod_eq_one_iff_hilbertSymbol_eq_neg_one`).
So, as an equality of signs and not only an equivalence of vanishings,
`(a,b)_K = hilbertSign (localSymbol (a) (b))`, which is `TauCeti.hilbertSymbol_eq_cohomological`, and
in Brauer form `TauCeti.hilbertSymbol_eq_hilbertSign_kummerBrauerClass`. The equality is what is
stated: the vanishing statement `localSymbol (a) (b) = 0 ↔ (a,b)_K = +1`
(`TauCeti.localSymbol_eq_zero_iff_hilbertSymbol_eq_one`) determines the sign only once one knows the
target has two elements, and a consumer that needs the sign should not have to reprove that.
Tau Ceti states the three declarations of this milestone, like `TauCeti.ClassFieldTheory.invMap`
itself, for a local field `K : Type` in universe `0`, the universe of the formations, class
formations and arithmetic layers of TauCetiRoadmap.ClassFieldTheory (its §2.1 *Formations*, which
exempts the generic statements of its Layer 0 and the comparison of valuations of its Layer 5);
Milestone 1, the cup compatibility below and
`TauCeti.hilbertSymbol_eq_cohomological` are universe-polymorphic. A consumer whose field lives in
a higher universe takes the sign identity from `TauCeti.hilbertSymbol_eq_cohomological` and
restates the invariant-map form of this milestone there; Layer 7B item 5's
`TauCeti.brauerCohomologyEquiv_uliftEquiv` is the compatibility of the Brauer side with the
universe lift.

**Compatibility with the cup product** at the same normalization is then one step. By Layer 7B's
`ι [(a,b)] = (a) ∪ (b)` and Milestone 1, the composite `ε ∘ ι⁻¹` carries `(a) ∪ (b)` to `(a,b)_K`; in
particular `(a) ∪ (b) = 0` exactly when `(a,b)_K = +1`, which agrees with Tau Ceti's cup-norm theorem
`TauCeti.cup_kummerClass_eq_zero_iff` (Layer 7C). No further normalization convention is introduced
anywhere in Layers 6 to 9.

This second milestone is the one place in Layers 0 to 6 that uses cohomology, and it comes after
Layer 7B in the build order.

*Needs:* Milestone 1; Layer 7B's comparisons `Additive (BrauerGroup K) ≃+ H²_cont(G_K, Kˢˣ)` (item 3)
and `Br(K)[2] ≅ H²(G_K, μ₂)` (item 4); TauCetiRoadmap.ClassFieldTheory Layer 5 for the local
invariant `TauCeti.ClassFieldTheory.invMap` on its carrier `Br F = H²(G_F, (Fˢ)ˣ)` and for the local
symbol; and Tau Ceti's bridge `TauCeti.ClassFieldTheory.brauerGroupEquivBr` from Brauer classes to
that carrier, which is item 3's `TauCeti.brauerExplicitH2Equiv` followed by the change of model
`TauCeti.ClassFieldTheory.unitsRepH2Equiv` and is not a target of ClassFieldTheory.

### Examples

- `(−1,−1)_{ℚ_2} = −1` (`TauCeti.hilbertSymbol_neg_one_neg_one_padicTwo`) and `(−1,−1)_{ℚ_p} = +1`
  for odd `p` (`Padic.hilbertSymbol_neg_one_neg_one_of_ne_two`,
  `TauCeti/NumberTheory/LocalField/Quaternion/Examples.lean`), so Hamilton's quaternions are ramified
  at `2` and at `∞` and nowhere else among these places. Over `ℝ`, `(−1,−1)_ℝ = −1`
  (`TauCeti.hilbertSymbol_neg_one_neg_one_real`, through `TauCeti.hilbertSymbol_real` and Mathlib's
  division ring `ℍ[ℝ]`).
- The full `8 × 8` Hilbert-symbol table over `ℚ_2` on `{±1, ±5, ±2, ±10}`, as decidable
  computations. Single entries worth naming: `(2,5) = −1` (`TauCeti.hilbertSymbol_two_five_padicTwo`);
  `(5,5) = +1` with the witness `5 = 5² − 5·2²`; `(2,−1) = +1`; `(−1,−1) = −1`; and `(−1, 3) = −1`,
  so `3` is a non-norm from `ℚ_2(i)` (`TauCeti.coe_hilbertSymbol_neg_one_natCast_padicTwo`).
- The four-fold criterion over `ℚ_2` at `(a,b) = (2,5)`, where all conditions fail, and at
  `(a,b) = (5,5)`, where all hold (shared with Layer 2's examples).
- Over `ℚ_2`, `𝔡(1) = 0`, `𝔡(5) = 4ℤ_2` and `𝔡(−1) = 2ℤ_2`
  (`TauCeti.quadraticDefect_five_padicTwo`, `TauCeti.quadraticDefect_neg_one_padicTwo`), and the
  non-multiplicativity `𝔡(−5) = 2ℤ_2 ≠ 8ℤ_2` (`TauCeti.quadraticDefect_neg_five_padicTwo`).
- Over `ℚ_2`, `e = 1` and `#(ℚ_2ˣ/(ℚ_2ˣ)²) = 8` on the basis `−1, 2, 5`.
- **The ramified-base control.** Over `K = ℚ_2(π)`, `π² = 2` (Tau Ceti's `TauCeti.DyadicSqrtTwo`,
  `TauCeti/NumberTheory/LocalField/WorkedExamples/DyadicSqrt/Two.lean`), with `a = 5`, the unit `1 + π`
  is a norm from `K(√5)`: `(π + 1/2)² − 5·(1/2)² = 1 + π`. The purported square-root-coordinate
  families `u²(1 − 5t²)` and `−5u²(1 − 5t²)` with integral `t` reduce to `1` modulo `(2)`, whereas
  `1 + π` reduces to `1 + ε` in `𝔽₂[ε]/(ε²)`, so they miss an actual unit norm. No Tau Ceti
  declaration states this example; it is the acceptance check of this roadmap named under Scope
  and ownership, and it pins the maximal-order families of 6B against the incorrect integrality
  claim in the basis `(1, √a)`.
- Exactly one anisotropic quaternary form over `ℚ_2` up to isometry, realized by `⟨1,1,1,1⟩` (the
  worked example in `TauCeti/NumberTheory/LocalField/QuadraticForm/AnisotropicQuaternary.lean`); and
  every form of dimension `5` over `ℚ_p` is isotropic.
- The realization exceptions are sharp: no regular form over `ℚ_2` has `(n, d, s) = (1, [1], −1)` or
  `(2, [−1], −1)`, while `(2, [1], −1)` is realized by `⟨−1,−1⟩`, whose discriminant is `[1]` and
  whose Hasse invariant is `(−1,−1)_{ℚ_2} = −1`
  (`TauCeti.RegularFormClass.localInvariants_neg_one_neg_one_padicTwo` and the worked example after
  it in `Invariants.lean`).
- `⟨a, −a⟩` has local Hasse invariant `(a, −a)_K = +1`, by `−a = 0² − a·1²`.
- Odd-residue formula check: for `a = π^α u`, `b = π^β u'`, bimultiplicativity gives
  `(π,π)^{αβ}(π,u')^α(u,π)^β(u,u')` with `(u,u') = 1` and `(π,π) = (π,−1)`, which is item 9.
- Serre's `ℚ_2` formula against the table: `(2,5)`, `(−1,−1)` give `−1`; `(5,5)`, `(2,−1)`, `(−1,5)`,
  `(2,2)`, `(−1,2)` give `+1`.

### Dependencies

Mathlib's local-field, `FractionalIdeal`, `QuadraticAlgebra`, `legendreSym` and `ℚ_[p]` APIs;
Tau Ceti's `TauCeti/NumberTheory/LocalField/` (`Uniformizer`, `Squares`, `SquareClass`,
`SquareClasses`, `UnitFiltration/`, `QuadraticForm/`, `Quaternion/`, `AlgebraicExtension/`,
`FiniteExtension/`), `TauCeti/NumberTheory/HilbertSymbol/`, `TauCeti/NumberTheory/Padics/SerreSigns.lean`
and `TauCeti/FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean`; Layers 0 to 5 of this roadmap,
with 6E's second milestone after Layer 7B; the items of TauCetiRoadmap.LocalFieldsRamification's
*Exact supplier contracts* that 6A, 6B and 6C cite;
TauCetiRoadmap.ClassFieldTheory Layers 5 and 14.

## Layer 7: the Brauer group in Galois cohomology

The comparison of the algebraic Brauer group with `H²` is a piece of mathematics, the theory of
crossed products, and not a formality. Tau Ceti implements this layer: the mod-2 coefficient
dictionary in `TauCeti/FieldTheory/GaloisCohomology/MuTwo/`, the crossed-product comparison in
`TauCeti/Algebra/CrossedProduct/`, and the cup-norm theorem in
`TauCeti/FieldTheory/GaloisCohomology/MuTwo/CupNorm.lean`. Each milestone below names the Tau Ceti
declaration that discharges it, and this roadmap consumes it.

Throughout Layers 7 to 9 the mod-2 cohomology is Tau Ceti's: the absolute Galois group
`TauCeti.AbsoluteGaloisGroup K` (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean`), the
cohomology `TauCeti.cohomF2` with trivial `𝔽₂` coefficients
(`TauCeti/RepresentationTheory/Homological/ContCohomology/TrivialF2.lean`), and the cup product
`(TauCeti.trivialF2TopPairing (TauCeti.AbsoluteGaloisGroup K)).cup 1 1`
(`TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/TrivialF2/Basic.lean`), written
`x ∪ y` below. TauCetiRoadmap.ProfiniteCohomology Layers 1, 9, 10, 12 and 13 specify these
operations. That roadmap's prototypes `ProfiniteCohomology.cup`, `ProfiniteCohomology.f2Pairing`,
`ProfiniteCohomology.homClass`, `ProfiniteCohomology.inhomogeneousCochain2` and
`ProfiniteCohomology.galoisF2Iso` are not Tau Ceti's declarations, so no statement of these layers
is phrased through them.

### 7A. The mod-2 operations, consumed, and the `μ₂` adapters

The continuous cohomology of a profinite group, with its cup product, its Kummer theory, its
restriction and corestriction, and its Evens norm, is consumed from Tau Ceti. This sublayer
defines no second cup product, restriction, corestriction, Kummer isomorphism or Evens norm: a
second copy of any of them would need a comparison theorem at every use site. What is specific to
`μ₂` is three milestones, each Tau Ceti's.

- **The coefficient identification specific to `μ₂`.** The Kummer coefficients are `μₙ(Kˢ)`
  written additively, and the `𝔽₂` cup product and Evens norm are stated on the trivial `𝔽₂`
  object. Under `Invertible (2 : K)` these agree at `n = 2`:
  - `TauCeti.mu2EquivZMod2 : μ₂ ≃+ ZMod 2`
    (`TauCeti/FieldTheory/GaloisCohomology/MuTwo/Basic.lean`). Its type pins it, because the only
    additive self-equivalence of `ZMod 2` is the identity, so no normalization law is needed;
  - the Galois action on `μ₂` is trivial, since `μ₂ = {±1} ⊆ K` (`TauCeti.mu2_smul_eq_self`,
    `TauCeti.kummerCoeffEquiv_equivariant`). At `n > 2` the corresponding statement is false, which
    is why every mod-2 statement of Layers 7 to 9 carries `Invertible (2 : K)` and not a general
    `n`;
  - hence the isomorphism of coefficient objects `TauCeti.kummerCoeffIsoTrivialF2`, which is the
    only coefficient transport used below.

  With it, the **Kummer class** `(a) ∈ H¹(G_K, 𝔽₂)` of a unit is `TauCeti.kummerClass a`, which is
  Tau Ceti's `TauCeti.kummerMapCanonical` at `n = 2`
  (`TauCeti/FieldTheory/GaloisCohomology/Kummer.lean`) read through that transport, and not a
  second Kummer cocycle. The **Kummer isomorphism on square classes**
  `Kˣ/(Kˣ)² ≃ H¹(G_K, 𝔽₂)` is `TauCeti.kummerSquareClassEquiv`, which sends a square class to the
  Kummer class of a representative (`TauCeti.kummerSquareClassEquiv_squareClass`). In particular
  `(a) = 0` exactly when `a` is a square (`TauCeti.kummerClass_eq_zero_iff_square`), and
  `(a) = (b)` exactly when `a * b` is a square
  (`TauCeti.kummerClass_eq_kummerClass_iff_isSquare_mul`).

  *Needs:* Layer 0's square-class group `TauCeti.SquareClassGroup`; Tau Ceti's Kummer theory
  (`TauCeti.kummerIso`, `TauCeti.kummerMapCanonical`); TauCetiRoadmap.ProfiniteCohomology Layers 9
  and 13.

- **The map from `H²(G_K, 𝔽₂)` into the cohomological Brauer group.** The coefficients
  `Additive Kˢˣ` are `TauCeti.UnitsCoeff K`
  (`TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean`). The injection of `H²(G_K, μₙ)` into
  `H²(G_K, Kˢˣ)` with image the `n`-torsion is `TauCeti.h2KummerToUnits`, with
  `TauCeti.h2KummerToUnits_injective` and `TauCeti.h2KummerToUnits_range`
  (`TauCeti/FieldTheory/GaloisCohomology/BrauerTorsion.lean`); it comes from the long exact
  sequence of `1 → μₙ → Kˢˣ → Kˢˣ → 1` together with Hilbert 90 (`TauCeti.hilbert90`). Its mod-2
  form, read through the `μ₂` transport, is `TauCeti.h2MuToUnits`, which is injective with image
  the 2-torsion (`TauCeti.h2MuToUnits_injective`, `TauCeti.h2MuToUnits_range`, in
  `TauCeti/FieldTheory/GaloisCohomology/MuTwo/BrauerTorsion.lean`). It is the form that Layers 7B
  and 8 name.

  *Needs:* the coefficient identification above; Tau Ceti's Kummer sequence and Hilbert 90;
  TauCetiRoadmap.ProfiniteCohomology Layer 9.

- **What the transfer along a finite separable `L/K` adds here.** Tau Ceti has the passage from a
  `K`-embedding `σ : L → Kˢ` to the open subgroup `G_L ≤ G_K`, which is `TauCeti.galoisSubgroup`
  with `TauCeti.mem_galoisSubgroup_iff`
  (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/FiniteExtension.lean`); the transport of its
  `𝔽₂`-cohomology, `TauCeti.galoisF2Iso`; and restriction, corestriction, the index-two Evens norm,
  the choice-free conjugate and the character of a quadratic extension, which are
  `TauCeti.galoisRes`, `TauCeti.galoisCor`, `TauCeti.galoisEvens`, `TauCeti.galoisConj` and
  `TauCeti.galoisCharacter` (`TauCeti/FieldTheory/GaloisCohomology/Restriction.lean`,
  `TauCeti/FieldTheory/GaloisCohomology/Corestriction/Basic.lean`,
  `TauCeti/FieldTheory/GaloisCohomology/EvensNorm.lean` and
  `TauCeti/FieldTheory/GaloisCohomology/Character.lean`). The Evens identities are
  - `res (N x) = x ∪ σ·x` (`TauCeti.galoisRes_galoisEvens`);
  - `N (x + y) = N x + N y + cor (x ∪ σ·y)` (`TauCeti.galoisEvens_add`);
  - `N (res y) = y ∪ y + χ ∪ y`, with `χ` the class of the character of `L/K`
    (`TauCeti.galoisEvens_galoisRes`).

  Tau Ceti also has the kernel of restriction in degree two (`TauCeti.galoisRes_eq_zero_iff`),
  functoriality in a tower (`TauCeti.galoisRes_comp`) and independence of the embedding
  (`TauCeti.galoisRes_embedding_independent` and its siblings). ⚠ The conjugate cannot be dropped:
  the cross term is a cup with `σ·y` and not with `y`. The part that mentions this roadmap's own
  notions is:
  - restriction on the multiplicative coefficients, `TauCeti.galoisResUnits`
    (`TauCeti/FieldTheory/GaloisCohomology/UnitsRestriction.lean`), which is not an instance of
    `TauCeti.galoisRes`, because `TauCeti.UnitsCoeff K` and `TauCeti.UnitsCoeff L` are coefficient objects over
    different groups;
  - restriction of a Kummer class is the Kummer class of the image
    (`TauCeti.galoisRes_kummerClass`), and corestriction of a Kummer class is the Kummer class of
    the norm (`TauCeti.galoisCor_kummerClass`), both in
    `TauCeti/FieldTheory/GaloisCohomology/MuTwo/Transfer.lean`;
  - compatibility of `TauCeti.h2MuToUnits` with restriction (`TauCeti.h2MuToUnits_galoisRes`).

  *Needs:* the two milestones above; Tau Ceti's Galois restriction, corestriction and Evens norm;
  TauCetiRoadmap.ProfiniteCohomology Layers 9, 10 and 13.

Edge cases: `L = K`, where restriction and corestriction are the identity; the Evens norm, the
conjugate and the character of `L/K` occur only at degree exactly two; a square `a`, where the
Kummer class vanishes.

### 7B. The comparison with `H²`

The crossed-product theory and the comparison built from it are Tau Ceti's
(`TauCeti/Algebra/CrossedProduct/`). The Brauer group law is the tensor-product law
`TauCeti.BrauerGroup.instCommGroup` of Layer 5.

1. **A finite Galois splitting field.** A finite-dimensional central simple `K`-algebra `A` is
   split by a finite separable intermediate field of `Kˢ/K`
   (`TauCeti.Algebra.exists_isSplittingField_finiteDimensional_isSeparable`,
   `TauCeti/Algebra/CentralSimple/FiniteSeparable.lean`), and the Galois closure of that field in
   `Kˢ` is finite Galois and still splits `A`, because an extension of a splitting field splits
   `A` (`TauCeti.Algebra.exists_finiteGalois_splittingField`,
   `TauCeti/Algebra/CentralSimple/FiniteGalois.lean`). Splitting is
   `TauCeti.Algebra.IsSplittingField`, the actual matrix-algebra predicate. The field is produced
   inside `Kˢ` because the passage from `L/K` to `G_L ≤ G_K` is indexed by a `K`-embedding into
   `Kˢ`; the Galois refinement is needed because the crossed-product construction indexes its
   cocycle by `Gal(L/K)`, which a merely separable splitting field does not have.

   *Needs:* TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras Layer 6 for the specification
   of splitting fields; Mathlib's `IntermediateField.normalClosure`.

2. **The crossed-product package** (Gille–Szamuely 4.4; Serre, *Local Fields* X). The comparison
   is built from eight separately citable theorems, each reusable on its own: a consumer that needs
   only "cohomologous cocycles have the same class" cites that statement.

   1. **The crossed-product algebra of a cocycle.** `TauCeti.TwoCocycle K L`
      (`TauCeti/Algebra/CrossedProduct/Basic.lean`) is a `c : Gal(L/K) × Gal(L/K) → Lˣ` with
      `σ(c(τ,ρ)) · c(σ,τρ) = c(σ,τ) · c(στ,ρ)`. The inhomogeneous normalization is pinned there,
      because the opposite one inverts the comparison. `TauCeti.CrossedProduct` is the free
      `L`-module on symbols `u_σ`, with `u_σ · x = σ(x) · u_σ`
      (`TauCeti.CrossedProduct.basis_mul_inc`) and `u_σ · u_τ = c(σ,τ) · u_στ`
      (`TauCeti.CrossedProduct.basis_mul_basis`); the cocycle identity is exactly associativity.
      Its dimension is `[L:K] · #Aut_K(L)` (`TauCeti.CrossedProduct.finrank_eq_finrank_mul_card`),
      and `[L:K]²` over a finite Galois extension (`TauCeti.CrossedProduct.finrank_eq_finrank_sq`).
      Cocycles need not be normalized: the identity is `c(1,1)⁻¹ u_1`, and the scalar embedding
      `TauCeti.CrossedProduct.inc` sends `x` to `x c(1,1)⁻¹ u_1`. It is central simple
      over `K` (`TauCeti/Algebra/CrossedProduct/CentralSimple.lean`), which is what makes its Brauer
      class `TauCeti.BrauerGroup.crossedProductClass`
      (`TauCeti/Algebra/CrossedProduct/BrauerClass.lean`) well formed.
   2. **Cohomologous cocycles give Brauer-equivalent algebras.** `TauCeti.TwoCocycle.Cohomologous`
      (`TauCeti/Algebra/CrossedProduct/Cohomologous.lean`) is
      `w(σ,τ) = z(σ,τ) · σ(b τ) · b(στ)⁻¹ · b(σ)` for some `b : Gal(L/K) → Lˣ`, and
      `TauCeti.BrauerGroup.crossedProductClass_eq_of_cohomologous` is the implication.
   3. **Multiplication of cocycles is tensor product of algebras.**
      `TauCeti.BrauerGroup.crossedProductClass_mul`
      (`TauCeti/Algebra/CrossedProduct/TensorProduct.lean`): the pointwise product of two cocycles
      presents the product of the two Brauer classes. This is what makes the comparison a
      homomorphism, and it is where the normalization of item 1 is felt.
   4. **The cocycle of a split algebra with chosen descent data.** `TauCeti.cocycleOfSplitting`
      (`TauCeti/Algebra/CrossedProduct/Splitting/Basic.lean`) takes a finite Galois `L/K` splitting
      `A` and a chosen `L`-algebra isomorphism `φ : L ⊗_K A ≅ M_n(L)`. Each `σ ∈ Gal(L/K)` moves
      `φ` by a `σ`-semilinear automorphism of `M_n(L)`, Skolem–Noether
      (`TauCeti/Algebra/CentralSimple/SkolemNoether.lean`) makes that automorphism inner, and the
      chosen conjugators multiply up to the cocycle. This is the only step of the comparison that
      uses Skolem–Noether.
   5. **Independence of the splitting field and of the choices.**
      `TauCeti.cohomologous_cocycleOfSplitting`: two choices of `φ` over the same `L` give
      cohomologous cocycles, because the conjugators of item 4 are determined only up to `Lˣ`.
      `TauCeti.TwoCocycle.comap` pulls a cocycle back along a compatible pair, a homomorphism
      `Gal(M/K) → Gal(L/K)` and an embedding `L → M` intertwining it, and
      `TauCeti.BrauerGroup.crossedProductClass_comap`
      (`TauCeti/Algebra/CrossedProduct/Comap.lean`) says the class is unchanged. ⚠ The
      intertwining hypothesis is carried in the type of the pullback: without it the inflated
      function is not a cocycle at all.
   6. **Every Brauer class is obtained.** `TauCeti.GaloisCocycle`
      (`TauCeti/Algebra/CrossedProduct/GaloisCocycle/Basic.lean`) bundles a finite Galois
      subextension of `Kˢ/K` with a cocycle of its Galois group, so that a statement can quantify
      over a splitting field without quantifying over instances, and
      `TauCeti.BrauerGroup.exists_galoisCocycle_brauerClass_eq` is surjectivity of
      `TauCeti.GaloisCocycle.brauerClass`.
   7. **The two maps are mutually inverse.**
      `TauCeti.BrauerGroup.crossedProductClass_cocycleOfSplitting`
      (`TauCeti/Algebra/CrossedProduct/Splitting/Class.lean`): the cocycle attached to a
      splitting of `A` presents `A`. `TauCeti.BrauerGroup.cohomologous_of_crossedProductClass_eq`
      (`TauCeti/Algebra/CrossedProduct/Injectivity.lean`): equal crossed-product classes over the
      same `L` come from cohomologous cocycles, which is injectivity; Hilbert 90 for the finite
      Galois `L/K` is its input.
   8. **Inflation into continuous cohomology.** Items 1 to 7 produce cocycles of the finite groups
      `Gal(L/K)`, while milestone 3 is a statement about `H²_cont(G_K, Kˢˣ)`. This item is the
      whole of the passage between them (`TauCeti/Algebra/CrossedProduct/Inflation.lean`).

      `TauCeti.TwoCocycle.inflate` is the pullback along the restriction
      `AlgEquiv.restrictNormalHom L` and the inclusion `L ⊆ Kˢ`, whose intertwining hypothesis is
      Mathlib's `AlgEquiv.restrictNormal_commutes`; it turns a cocycle of `Gal(L/K)` into one of
      `G_K`. It is read in the coefficient module `TauCeti.UnitsCoeff K`, which is `Additive Kˢˣ`,
      so the translation between the multiplicative and the additive conventions is
      `Additive.ofMul` and nothing else, and the normalization of item 1 is exactly Mathlib's
      `groupCohomology.IsCocycle₂`. The cochain factors through the discrete finite `Gal(L/K)`, so
      it is continuous; ⚠ finiteness of `L/K` is used here, and the same formula over an infinite
      normal subextension need not be continuous. `TauCeti.TwoCocycle.inflateZ2` is the resulting
      element of the explicit degree-two cocycles, `TauCeti.TwoCocycle.inflateH2` its explicit
      class, and `TauCeti.TwoCocycle.inflateClass` its continuous class, taken through
      `TauCeti.ContCohomology.explicitH2AddEquivContinuousCohomology` and through nothing else;
      `TauCeti.GaloisCocycle.inflateClass` is the bundled form.

      Three theorems pin that class. `TauCeti.TwoCocycle.inflateClass_eq_of_cohomologous`:
      cohomologous cocycles inflate to the same class, because the inflation of the coboundary of
      `b : Gal(L/K) → Lˣ` is the coboundary of the continuous `1`-cochain `g ↦ b(g|_L)`; this is
      independent of milestone 3. `TauCeti.TwoCocycle.inflateClass_comap` and
      `TauCeti.TwoCocycle.inflateClass_refine`: refining the splitting field does not change the
      class, and in fact `TauCeti.TwoCocycle.inflate_comap` says it does not change the cocycle,
      because a compatible pair whose embedding is the inclusion inside `Kˢ` computes the
      restriction homomorphism. ⚠ That hypothesis on the embedding cannot be dropped: composing it
      with a nontrivial element of `Gal(M/K)` gives another compatible pair for which the
      conclusion is false. `TauCeti.TwoCocycle.inflateClass_eq_finiteQuotientComparison`: the
      class is the image of `TauCeti.TwoCocycle.finiteLevelClass`, the class at the open normal
      subgroup `Gal(Kˢ/L)` with quotient `Gal(L/K)` and invariant coefficients, under the
      degree-two leg of the finite-quotient description of `H²_cont(G_K, Kˢˣ)`. Without it,
      inflation and the legs of the finite-quotient cocone would be two unrelated maps.

      **Exhaustion.** `TauCeti.exists_galoisCocycle_inflateZ2` says that every continuous
      `2`-cocycle is, on the nose and with no coboundary subtracted, inflated from a finite Galois
      subextension; with the isomorphism from explicit to continuous classes it gives
      `TauCeti.exists_galoisCocycle_inflateClass`, that every class of `H²_cont(G_K, Kˢˣ)` is
      `TauCeti.GaloisCocycle.inflateClass` of a bundled cocycle. This is the cohomological twin of
      item 6. The open normal subgroup that the descent produces is presented as `Gal(Kˢ/L)` for
      the finite Galois `L = (Kˢ)^U` by Mathlib's infinite Galois correspondence. ⚠ Compactness of
      `G_K`, and not total disconnectedness alone, is what descends a cocycle in both variables at
      once.

   *Needs:* Layer 5's tensor-product group law; Layer 7A's `TauCeti.UnitsCoeff`; Mathlib's
   infinite Galois correspondence and `groupCohomology.IsCocycle₂`;
   TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras Layers 4 to 6 for the central-simple
   theory; TauCetiRoadmap.ProfiniteCohomology Layers 0, 2, 3 and 4 for the specification of the
   explicit complex and of the finite-quotient description.

3. **The comparison isomorphism** `Additive (BrauerGroup K) ≃+ H²_cont(G_K, Kˢˣ)`, which is
   `TauCeti.brauerCohomologyEquiv` (`TauCeti/Algebra/CrossedProduct/Comparison.lean`), with its
   explicit-cocycle form `TauCeti.brauerExplicitH2Equiv`. Multiplication of Brauer classes goes to
   addition of cohomology classes, which is what `≃+` records. The equivalence is not the
   milestone on its own. What determines it is
   `TauCeti.brauerCohomologyEquiv_crossedProductClass`: on the class of the crossed product of a
   cocycle `z` of a finite Galois `L ⊆ Kˢ`, its value is the inflated class of `z`, with
   `TauCeti.brauerCohomologyEquiv_galoisCocycle_brauerClass` the bundled form. That equation is
   consistent, because both sides descend to cohomology classes (items 2.2 and 2.8) and both are
   unchanged by refining `L` (items 2.5 and 2.8); and it is rigid, because every Brauer class is a
   crossed-product class (item 2.6), which is `TauCeti.brauerCohomologyEquiv_unique`. A named
   equivalence carrying no such equation is not this milestone.

   *Needs:* milestone 2.

4. **The 2-torsion comparison** `ι : Br(K)[2] ≃ H²(G_K, μ₂)`. The 2-torsion subgroup is
   `TauCeti.BrauerGroup.twoTorsion` and `ι` is `TauCeti.brauer2EquivH2`
   (`TauCeti/Algebra/CrossedProduct/TwoTorsion.lean`), obtained from milestone 3 and from
   `TauCeti.h2MuToUnits`, whose image is the 2-torsion. The square
   `h2MuToUnits ∘ ι = (the comparison) ∘ (the inclusion of the 2-torsion)` is
   `TauCeti.brauer2EquivH2_h2MuToUnits`. Since `TauCeti.h2MuToUnits` is injective, that square
   determines `ι` (`TauCeti.brauer2EquivH2_unique`), so `ι` carries no normalization of its own and
   every statement about it below is derived from that square and the corresponding statement
   about milestone 3.

   *Needs:* milestone 3; Layer 7A's `TauCeti.h2MuToUnits`.

5. **Base-change naturality, and change of universe.** For `L/K` finite separable with a
   `K`-embedding `σ : L → Kˢ`, the comparison carries scalar extension of Brauer classes
   (`TauCeti.BrauerGroup.baseChange`, `TauCeti/Algebra/BrauerGroup/BaseChange.lean`) to
   restriction of cohomology classes: `TauCeti.brauerCohomologyEquiv_baseChange` on all classes,
   with restriction `TauCeti.galoisResUnits`, and `TauCeti.brauer2EquivH2_baseChange` on
   2-torsion, with restriction `TauCeti.galoisRes`
   (`TauCeti/Algebra/CrossedProduct/BaseChange/Naturality.lean`). For a field `K : Type u` and a
   universe lift, the comparison commutes with Tau Ceti's lift of Brauer classes
   `TauCeti.BrauerGroup.uliftEquiv` and the transport `RingEquiv.unitsH2Congr` of unit cohomology
   (`TauCeti/FieldTheory/GaloisCohomology/Congr.lean`): `TauCeti.brauerExplicitH2Equiv_uliftEquiv`
   and `TauCeti.brauerCohomologyEquiv_uliftEquiv`
   (`TauCeti/Algebra/CrossedProduct/BaseChange/ULift.lean`). No smallness hypothesis enters, and
   no field is replaced by an equivalent field in universe `0`.

   *Needs:* milestones 3 and 4; Layer 7A's restriction maps.

6. **The symbol as a cup product.** `ι [(a,b)] = (a) ∪ (b)`, with the quaternion class
   `TauCeti.BrauerGroup.quaternionClass` of Layer 5 and the Kummer classes of Layer 7A. The
   computation is made once, on the comparison of milestone 3, as
   `TauCeti.brauerCohomologyEquiv_quaternionClass`, and `TauCeti.brauer2EquivH2_quaternionClass`
   follows from it and from the square of milestone 4 by injectivity of `TauCeti.h2MuToUnits`
   (`TauCeti/Algebra/CrossedProduct/CupProduct.lean`). Its proof is the cyclic computation below,
   reached through `TauCeti.brauerCohomologyEquiv_crossedProductClass` at the cocycle of
   `K(√a)/K` whose only nontrivial value is `b`.

   *Needs:* milestones 3 and 4; Layer 5's quaternion class; the cyclic computation below.

7. **Compatibility of the two structures.** `ι` carries the product `[(a,b)] · [(a,c)]` to the sum
   `(a) ∪ (b) + (a) ∪ (c)`: `TauCeti.brauer2EquivH2` is additive, and it matches
   `TauCeti.BrauerGroup.quaternionClass_mul` on one side with the biadditivity of the cup on the
   other. Layer 5's bilinearity and Layer 8's additivity are then the same statement on two sides.

   *Needs:* milestone 6.

- **The cyclic computation, stated rather than implied.** The proof of milestone 6 is the one place
  where a cocycle meets an algebra, so its steps are separate statements. For `L = K(√a)` with `a`
  a nonsquare, `H²(Gal(L/K), Lˣ) ≃ Kˣ / N(Lˣ)` is the degree-two computation for a cyclic group of
  order two (`TauCeti.cyclicNormQuotientEquiv`, `TauCeti/FieldTheory/GaloisCohomology/Cyclic.lean`,
  and `TauCeti.quadraticNormQuotientEquiv_mk`, `TauCeti/Algebra/CrossedProduct/Quadratic.lean`).
  Under it, the class of `b` inflates to the image of `(a) ∪ (b)` under `TauCeti.h2MuToUnits`
  (`TauCeti.TwoCocycle.inflateClass_quadratic_eq_h2MuToUnits_cup`). Hence `(a) ∪ (b) = 0` if and
  only if `b` is a norm from `L`. The case where `a` is a square is separate and trivial.

  *Needs:* milestone 2.8; Layer 7A.

Surjectivity holds on both sides, `TauCeti.BrauerGroup.exists_galoisCocycle_brauerClass_eq` for
Brauer classes and `TauCeti.exists_galoisCocycle_inflateClass` for cohomology classes, and the two
uniqueness theorems `TauCeti.brauerCohomologyEquiv_unique` and `TauCeti.brauer2EquivH2_unique`
make the two comparisons carry one normalization between them.

### 7C. The cup-norm theorem

The Kummer-cup/norm-equation criterion is Tau Ceti's, consumed. It is stated over an arbitrary
field in which `2` is invertible, which is the right generality: no statement here carries a
local hypothesis, and none excludes the dyadic case. This sublayer's form has trivial `𝔽₂`
coefficients. The criterion for the local symbol with `μ_n` coefficients, for a field containing a
primitive `n`-th root of unity with `n` invertible, is Class Field Theory's (its Layer 5, Tau Ceti's
`TauCeti.ClassFieldTheory.localSymbol_eq_zero_iff_mem_normGroup`); it is cited and not restated,
and at `n = 2`, `ζ = −1` the comparison below identifies the two.

- The square-class dictionary `(·) : Kˣ/(Kˣ)² ≃ H¹(G_K, μ₂)` is Layer 7A's
  `TauCeti.kummerSquareClassEquiv`, compatible with `TauCeti.SquareClassGroup` by
  `TauCeti.kummerSquareClassEquiv_squareClass`.
- **The cup-norm theorem** (Serre, *Local Fields* XIV §2 Props. 4–5; Gille–Szamuely 4.7). For
  `a b : Kˣ`, `(a) ∪ (b) = 0` in `H²(G_K, μ₂)` if and only if `∃ x y : K, b = x² − a y²`. This is
  `TauCeti.cup_kummerClass_eq_zero_iff`
  (`TauCeti/FieldTheory/GaloisCohomology/MuTwo/CupNorm.lean`), with the cup the canonical one, so
  that a zero pairing cannot satisfy it. The hypothesis is `Invertible (2 : K)` and nothing
  further. Given 7B it is the last step of the cyclic computation together with Layer 2's
  four-fold criterion.

  *Needs:* Layer 2's four-fold criterion; Layer 7B milestone 6 and the cyclic computation; Layer
  7A.
- **The other four descriptions, each a named theorem.** The vanishing of `(a) ∪ (b)` is
  equivalent to each of:
  - the splitting of `ℍ[K,a,b]` (`TauCeti.cup_kummerClass_eq_zero_iff_nonempty_algEquiv_matrix`),
    the bridge a consumer uses to move between the algebra and the class;
  - the quadratic-algebra norm condition `∃ z : K(√a), N z = b`
    (`TauCeti.cup_kummerClass_eq_zero_iff_exists_norm_eq`);
  - the isotropy of `⟨1, −a, −b⟩`
    (`TauCeti.cup_kummerClass_eq_zero_iff_not_anisotropic_weightedSumSquares`);
  - `(a,b) = +1` for the norm-equation `hilbertSymbol` of Layer 6C
    (`TauCeti.cup_kummerClass_eq_zero_iff_hilbertSymbol_eq_one`), which over a nonarchimedean
    local field is the classical `{±1}`-valued symbol.

  Together with the theorem above these are the five-fold criterion, and each direction is
  available to a consumer as one named theorem rather than as a chain to be assembled.

  *Needs:* the cup-norm theorem; Layer 2's splitting criterion; Layer 6C's symbol.
- **The identification with Class Field Theory's local symbol.** Over every field in which `2` is
  invertible the cohomological local symbol `TauCeti.ClassFieldTheory.localSymbol` at the Kummer cup pairing
  `TauCeti.ClassFieldTheory.kummerCupPairing` vanishes exactly when `(a) ∪ (b)` does
  (`TauCeti.localSymbol_eq_zero_iff_cup`), so the norm-equation symbol is the sign of the
  cohomological one (`TauCeti.hilbertSymbol_eq_cohomological`), both in
  `TauCeti/FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean`. This is Layer 6C's comparison
  milestone; it is stated here because it runs through the cup-norm theorem.

  *Needs:* the five-fold criterion; TauCetiRoadmap.ClassFieldTheory Layer 5 for the
  specification of the local symbol.
- Corollaries, all in `TauCeti/FieldTheory/GaloisCohomology/MuTwo/CupNorm.lean`:
  `(a) ∪ (b) = 0` whenever `a + b = 1` (`TauCeti.cup_kummerClass_eq_zero_of_add_eq_one`), which is the Steinberg relation for `a : Kˣ`
  with `1 − a ≠ 0`; `(a) ∪ (−a) = 0` (`TauCeti.cup_kummerClass_neg_self`); `(a) ∪ (a) = (a) ∪ (−1)`
  (`TauCeti.cup_kummerClass_self`); the symmetry `x ∪ y = y ∪ x` in bidegree `(1,1)`
  (`TauCeti.trivialF2TopPairing_cup_one_one_comm`); and bilinearity, which is the biadditivity of
  the cup read through `TauCeti.kummerClass_mul` and is Layer 5's bimultiplicativity on the other
  side of `ι`.

### Examples

- `(a) = 0` exactly when `a` is a square; over `ℚ_2` the eight classes `(±1), (±5), (±2), (±10)`
  are pairwise distinct.
- `ι [(a,−a)] = 0` and `ι [(a, 1−a)] = 0`.
- Over `ℚ_2`, the cup-norm theorem at the two points of Layer 2's four-fold criterion:
  `(2) ∪ (5) ≠ 0`, because `5` is not of the form `x² − 2y²`; and `(5) ∪ (5) = 0`, with the
  witness `5 = 5² − 5·2²`.
- Over `ℝ`, `(−1) ∪ (−1) ≠ 0` (`TauCeti.cup_kummerClass_neg_one_neg_one_ne_zero_real`,
  `TauCeti/FieldTheory/GaloisCohomology/MuTwo/Real.lean`), the archimedean instance of Hamilton's
  quaternions.

### Dependencies

Layers 0, 2 and 5; Layer 6A for the square-class dictionary; Layer 6C for the local
identification only. Tau Ceti's `TauCeti/FieldTheory/GaloisCohomology/`,
`TauCeti/Algebra/CrossedProduct/`, `TauCeti/Algebra/CentralSimple/` and
`TauCeti/RepresentationTheory/Homological/ContCohomology/`. TauCetiRoadmap.ProfiniteCohomology
Layers 0 to 4, 9, 10, 12 and 13; TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras Layers 4
to 6; TauCetiRoadmap.ClassFieldTheory Layer 5 for the local identification.

## Layer 8: Stiefel-Whitney classes

The Stiefel–Whitney classes in degrees 1 and 2 are Tau Ceti's
(`TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/`):
`TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/Basic.lean` defines `TauCeti.sw1` and
`TauCeti.sw2` on tuples, and `TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/Class.lean` descends
them to `TauCeti.sw1Class` and `TauCeti.sw2Class` on `TauCeti.RegularFormClass K` for a field
`K : Type u`. This layer defines `w₁` and `w₂` only. The total class and the higher classes need a graded cohomology ring in every
degree, which is an exclusion of this roadmap; see "Scope and ownership".

- **Definition in degrees 1 and 2** (Delzant 1962; Kahn 1984, II.1.3; Milnor, *Algebraic K-theory
  and quadratic forms* §4). For a diagonal tuple, `w₁⟨a₁, …, aₙ⟩ = ∑ᵢ (aᵢ)` and
  `w₂⟨a₁, …, aₙ⟩ = ∑_{i<j} (aᵢ) ∪ (aⱼ)`,
  which are `TauCeti.sw1_def` and `TauCeti.sw2_def`.

  *Needs:* Layer 7A's Kummer class; Layer 7C's cup product.
- **Invariance under isometry, and the descended definitions.** The tuple-level definitions
  satisfy the three hypotheses of Layer 0's descent principle
  `TauCeti.RegularFormClass.liftDiagonal`, each a named statement:
  - for `w₁`: `TauCeti.PermutationStep.sw1_eq` and `TauCeti.BinaryStep.sw1_eq`, because `w₁` of a
    tuple is the Kummer class of its discriminant (`TauCeti.sw1_eq_kummerSquareClassEquiv`) and
    equivalent tuples of any rank have discriminants in the same square class
    (`TauCeti.isSquare_prod_mul_prod_of_equivalent`). In rank one the hypothesis is `(a) = (b)`
    whenever `a * b` is a square, and it does not follow from the two step conditions, since no
    chain joins `⟨a⟩` to `⟨b⟩`;
  - for `w₂`: `TauCeti.PermutationStep.sw2_eq` is the symmetry of the cup
    (`TauCeti.trivialF2TopPairing_cup_one_one_comm`); `TauCeti.BinaryStep.sw2_eq` is the cup
    identity `(a) ∪ (b) = (c) ∪ (d)` for `⟨a,b⟩ ≅ ⟨c,d⟩`, which is Layer 7C applied to the binary
    criterion (`TauCeti.cup_kummerClass_congr`); and in rank one both sides are the empty sum `0`.

  They therefore descend to the named functions `TauCeti.sw1Class` and `TauCeti.sw2Class`,
  agreeing with the tuple-level definitions on every presentation (`TauCeti.sw1Class_mk`,
  `TauCeti.sw2Class_mk`). Composed with `formClass`, they are what `w₁(q)` and `w₂(q)` mean for a
  form `q` throughout this roadmap; in particular two regular forms that are
  `QuadraticMap.Equivalent` have the same `w₁` and `w₂` (`TauCeti.sw1Class_formClass_congr`,
  `TauCeti.sw2Class_formClass_congr`), which is what lets Layer 9 apply to a form given by a
  construction rather than by a tuple.

  *Needs:* Layer 0's descent principle and chain theorem; Layer 3's discriminant; Layer 7C.
- **The two low-degree identities.** `w₁(q) = (d(q))` with the plain discriminant
  (`TauCeti.sw1Class_eq_kummerSquareClassEquiv_discr`); `w₁(q ⊥ r) = w₁(q) + w₁(r)`
  (`TauCeti.sw1Class_add`); and `w₂(q ⊥ r) = w₂(q) + w₂(r) + w₁(q) ∪ w₁(r)`
  (`TauCeti.sw2Class_add`, with `TauCeti.sw1_append` and `TauCeti.sw2_append` on tuples), which is
  the degree-2 part of the product formula for a total class, stated degreewise.

  *Needs:* the descended classes.
- **`w₂` is the image of the Hasse invariant.** `ι(s(q)) = w₂(q)` for the Brauer-valued Hasse
  invariant `s(q)` of Layer 5 (`TauCeti.brauer2EquivH2_hasseInvariant`, with the
  unit-coefficient form `TauCeti.brauerCohomologyEquiv_hasseInvariant`, in
  `TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/Hasse.lean`). It is immediate from 7B, because
  both sides are defined on a diagonalization. The Hasse invariant is a product and `w₂` is a sum,
  so the Lean statement applies `ι` to `Additive.ofMul` of the Hasse invariant; the same
  `Additive.ofMul` occurs in front of each Brauer class below.

  *Needs:* Layer 5; Layer 7B milestones 4 and 6.
- ⚠ **The comparison with the Clifford invariant, exact.** `c(q)` and `s(q)` differ by
  dimension-dependent terms, so a source that says "`w₂` is the Hasse–Witt invariant" must be read
  through the convention table first. Serre calls `w₂(q) = ∑_{i<j} (aᵢ)(aⱼ)` the Witt invariant
  of `q`, also called its Hasse invariant (Serre 1984, §1.2), which is `s` and not `c` in the
  convention table, and his trace-form formulas carry a correction term of `(2) ∪ (d)` type
  (Serre 1984, Théorème 1 and, for the twisted form, Théorème 1′). Write
  `A_n = C(n−1, 2) mod 2` and `B_n = C(n+1, 4) mod 2` for the binomial coefficients that are the
  exponents `(n−1)(n−2)/2` and `(n+1)n(n−1)(n−2)/24` of Lam V.3.20. The milestone is the identity
  `ι(c(q)) = w₂(q) + A_n · ((−1) ∪ (d(q))) + B_n · ((−1) ∪ (−1))` in `H²(G_K, μ₂)`, with `d(q)`
  the plain discriminant class and the whole identity written additively. It is
  `TauCeti.brauer2EquivH2_cliffordInvariant`
  (`TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/Clifford.lean`), stated with
  `w₁(q) = (d(q))`; on forms of even rank with trivial signed discriminant it specializes to
  `TauCeti.brauer2EquivH2_cliffordInvariant_of_signedDiscr_eq_zero`. A documentation note maps the
  Serre and Kahn statements onto it.

  *Needs:* Layer 5's Clifford invariant; Layer 7B milestones 4 and 6.

- **Functoriality.** `w₁` and `w₂` commute with restriction along a finite separable `L/K`, that
  is `res (wᵢ q) = wᵢ (q ⊗_K L)` (`TauCeti.galoisRes_sw1Class`, `TauCeti.galoisRes_sw2Class`, in
  `TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/BaseChange.lean`).

Edge cases: rank `0`, where both classes vanish; rank `1`, where `w₁⟨a⟩ = (a)`
(`TauCeti.sw1Class_mk_rankOne`) depends only on the square class of `a` and `w₂⟨a⟩ = 0`
(`TauCeti.sw2Class_eq_zero_of_rank_le_one`); the hyperbolic plane
(`TauCeti.sw1Class_hyperbolicClass`, `TauCeti.sw2Class_hyperbolicClass`); `a` a square, where
`(a) = 0`.

### Examples

- `w₁(⟨1⟩ⁿ) = 0` and `w₂(⟨1⟩ⁿ) = 0`; `w₁⟨a⟩ = (a)` and `w₂⟨a⟩ = 0`; `w₂⟨a,b⟩ = (a) ∪ (b)`
  (`TauCeti.sw2Class_mk_binary`); the values on Pfister forms (`TauCeti.sw1Class_pfisterFormClass`,
  `TauCeti.sw2Class_pfisterFormClass_two`).
- The table over `ℚ_2`, where `H²(G_ℚ₂, 𝔽₂) = {0, ν}` with `ν = (2) ∪ (5) = (−1) ∪ (−1)`, on the
  representatives `a ∈ {±1, ±5, ±2, ±10}`: `w₁⟨a⟩ = (a)` and `w₂⟨a⟩ = 0`; `w₁⟨1, a⟩ = (a)` and
  `w₂⟨1, a⟩ = 0`; `w₁⟨a, a⟩ = 0`, and `w₂⟨a, a⟩ = (a) ∪ (−1)`, which is `ν` for
  `a ∈ {−1, −5, −2, −10}` and `0` for `a ∈ {1, 5, 2, 10}`, the classes of sums of two squares.
  Also `w₂⟨2, 5⟩ = ν`. The row `⟨1, −1⟩` separates the conventions: `w₂⟨1, −1⟩ = 0`, while the
  product over `i ≤ j` of O'Meara's Hasse symbol would give `(−1) ∪ (−1) = ν`.
- The Clifford comparison at `n = 3`:
  `ι(c(q)) = w₂(q) + 1·((−1) ∪ (d(q))) + 1·((−1) ∪ (−1))`.

### Dependencies

Layers 0, 3 and 5; Layer 7. Tau Ceti's `TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/` and
`TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/`.

## Layer 9: transfer and the relative Stiefel-Whitney formula

The Scharlau transfer is Tau Ceti's (`TauCeti/LinearAlgebra/QuadraticForm/Transfer/`), and so are
the value of the Evens norm on a Kummer class and the relative Stiefel–Whitney formula in degrees
1 and 2 (`TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/`), with the `Pin⁺` model of the plane
`⟨1, 1⟩` in explicit `2 × 2` matrices (`TauCeti/LinearAlgebra/Matrix/PinPlusPlane/`).

### The Scharlau transfer and the trace form

- **Which functional.** For `L/K` finite, two nonzero `K`-linear functionals `s` and `t` on `L`
  differ by a unique unit: `t(x) = s(u x)` for exactly one `u : Lˣ`
  (`LinearMap.existsUnique_unit_apply_eq_apply_mul`,
  `TauCeti/Algebra/Algebra/Frobenius/DivisionRing.lean`). Without it, the change-of-functional
  theorem compares only a chosen family of functionals and not every two. For `L/K` finite
  separable the trace is nonzero, by Mathlib's `traceForm_nondegenerate`, so it is a legitimate
  default.

  *Needs:* Mathlib's `Algebra.trace` and `traceForm_nondegenerate`.
- **The Scharlau transfer** (Lam VII §1; Scharlau Ch. 2 §5). For `L/K` finite, a `K`-functional
  `s` and a form `q` over `L`, the transfer `s_*(q) = s ∘ q` on the `K`-space underlying the
  `L`-space of `q` is `QuadraticMap.scharlauTransfer`, with the form first, so that
  `q.scharlauTransfer s` is `s_*(q)`, and the trace instance is `QuadraticMap.traceTransfer`
  (`TauCeti/LinearAlgebra/QuadraticForm/Transfer/Basic.lean`). The milestones, all Tau Ceti's:
  `dim_K s_*(q) = [L:K] · dim_L q` (`TauCeti.RegularFormClass.rank_scharlauTransfer`); `s_*(q)` is
  regular for regular `q` and nonzero `s` (`QuadraticMap.nondegenerate_scharlauTransfer_iff_of_ne_zero`);
  additivity over `⊥` (`QuadraticMap.scharlauTransfer_prod`); transitivity in a tower
  (`QuadraticMap.scharlauTransfer_scharlauTransfer`); **Frobenius reciprocity**
  `s_*(q ⊗ res r) ≅ s_*(q) ⊗ r` (`QuadraticMap.IsometryEquiv.scharlauTransferTmulBaseChange`,
  `TauCeti/LinearAlgebra/QuadraticForm/Transfer/Frobenius.lean`); and **change of functional** `(λ · s)_* q ≅ s_*(⟨λ⟩ ⊗ q)`
  (`QuadraticForm.scharlauTransferCompMul` and
  `QuadraticMap.exists_unit_scharlauTransfer_equivalent_rankOneTensor`,
  `TauCeti/LinearAlgebra/QuadraticForm/Transfer/ChangeFunctional.lean`), which with the uniqueness above says exactly how much the
  transfer depends on `s`.

  *Needs:* Layers 1 to 3; the functional milestone.
- **The transfer respects isometry.** Isometric forms over `L` transfer to isometric forms over `K`
  (`QuadraticMap.Equivalent.scharlauTransfer`), so `s_*` is a function of the isometry class:
  `TauCeti.RegularFormClass.scharlauTransfer` and `TauCeti.RegularFormClass.traceTransfer`
  (`TauCeti/LinearAlgebra/QuadraticForm/Transfer/Class.lean`). Without it the transfer of a class is not defined, and the formula
  below would have to name a presentation of each side.
- **On Witt rings.** `s_*` takes a hyperbolic plane over `L` to a hyperbolic form over `K`, because
  a Lagrangian stays a Lagrangian (`TauCeti.RegularFormClass.scharlauTransfer_hyperbolicClass`,
  `TauCeti.WittGrothendieckRing.scharlauTransfer_mem_hyperbolicIdeal`), so it descends to
  `TauCeti.WittRing.scharlauTransfer : W(L) → W(K)` (`TauCeti/LinearAlgebra/QuadraticForm/Transfer/Witt/Basic.lean`). The descended map
  is additive, and by Frobenius reciprocity it is `W(K)`-linear
  (`TauCeti.WittRing.scharlauTransferLinear`). It is **not** a ring homomorphism, which is the
  usual mistaken expectation.

  *Needs:* Layer 4's Witt ring.
- **The trace form.** `Tr_*⟨1⟩` is the quadratic form of `Algebra.traceForm`
  (`QuadraticMap.traceTransfer_sq`), and for a quadratic `L = K(x)` with `x ∉ K` and `x² = d` it is
  `⟨2, 2d⟩` (`TauCeti.equivalent_traceTransfer_sq_weightedSumSquares_of_sq`,
  `TauCeti/LinearAlgebra/QuadraticForm/Transfer/QuadraticExtension.lean`; for the quadratic algebra `K[√d]`, the split one included,
  `TauCeti.equivalent_traceTransfer_sq_weightedSumSquares`, `TauCeti/LinearAlgebra/QuadraticForm/Transfer/TraceForm.lean`). It is proved
  through Tau Ceti's trace diagonalization on square-root bases
  (`TauCeti.Algebra.discr_one_elem_eq_of_sq_algebraMap`, `TauCeti/FieldTheory/Trace.lean`) rather
  than by re-deriving the trace computations. The twisted forms `Tr_*⟨a⟩` for `a : Lˣ` are the
  objects that Kahn's theorem evaluates.
- **The twisted trace form.** For `L = K(x)` with `x ∉ K` and `x² = d`, and `a : Lˣ`:
  - in square-root coordinates `N(u + v x) = u² − v² d` and `Tr(u + v x) = 2u`. These are
    `Algebra.IsQuadraticExtension.norm_algebraMap_add_algebraMap_mul` and
    `Algebra.IsQuadraticExtension.trace_algebraMap_add_algebraMap_mul`
    (`TauCeti/RingTheory/Norm/Quadratic.lean`) at `Tr x = 0`
    (`Algebra.IsQuadraticExtension.trace_eq_zero_of_sq_eq`) and `N x = −d`, which Mathlib's
    `Algebra.IsQuadraticExtension.sq_eq_trace_smul_sub_norm` gives from `x² = d`;
  - **Kahn's basis.** If `Tr a ≠ 0`, then `1` and `x/a` are orthogonal for `Tr_*⟨a⟩`, because
    `Tr(a · x/a) = Tr x = 0`, and their values are `Tr a` and `Tr(d/a) = d · Tr a / N a`; they are
    independent, because `x/a ∈ K` would put `a` in `K x` and force `Tr a = 0`. So
    `Tr_*⟨a⟩ ≅ ⟨Tr a, d · Tr a / N a⟩`
    (`TauCeti.equivalent_traceTransfer_smul_sq_weightedSumSquares_of_sq`). ⚠ The hypothesis
    `Tr a ≠ 0` cannot be dropped: at `Tr a = 0` both entries vanish, and the form is not `⟨0, 0⟩`;
  - if `Tr a = 0`, then `Tr_*⟨a⟩(1) = 0`, the regular binary form is isotropic, and
    `Tr_*⟨a⟩ ≅ ⟨1, −1⟩`, which is `TauCeti.hyperbolicPlane K`
    (`TauCeti.equivalent_traceTransfer_smul_sq_hyperbolicPlane`);
  - **the discriminant.** For every functional `s`, `d(s_*⟨a⟩) = d(s_*⟨1⟩) + (N a)` in
    `SquareClassGroup K` (`TauCeti.discr_formClass_scharlauTransfer_smul_sq`,
    `TauCeti/LinearAlgebra/QuadraticForm/Transfer/Discriminant.lean`), stated for Tau Ceti's discriminant
    `TauCeti.RegularFormClass.discr` of `formClass` of the transferred forms. At the trace, with
    `d(Tr_*⟨1⟩) = (d)`, this is `d(Tr_*⟨a⟩) = d · N a` modulo squares, which is the one step of the
    degree-1 formula that the transfer milestones above do not state.

  *Needs:* Layer 1's hyperbolic plane (`TauCeti.exists_hyperbolicPlane_prod_equivalent`); Layer 3's
  discriminant; Tau Ceti's quadratic normal form
  `Algebra.IsQuadraticExtension.exists_eq_algebraMap_add_algebraMap_mul`.

### The Galois setup and the transfer in cohomology

Fix a separable closure `Kˢ` and a `K`-embedding `σ : L → Kˢ`. The open subgroup `G_L ≤ G_K` is
`TauCeti.galoisSubgroup`, its `𝔽₂`-cohomology is transported by `TauCeti.galoisF2Iso`, and
restriction, corestriction, the index-two Evens norm and the conjugate attached to `L/K` are
`TauCeti.galoisRes`, `TauCeti.galoisCor`, `TauCeti.galoisEvens` and `TauCeti.galoisConj`, as in
Layer 7A. Three conventions are pinned, and a formula that gets any of them wrong is a different
statement:

- **The conjugation convention.** `TauCeti.galoisConj` is `res ∘ cor − id`, which agrees with
  conjugation by **every** `s ∈ G_K ∖ G_L` (`TauCeti.galoisConj_evensConj`, against
  `OpenSubgroup.evensConj`). So no element outside `G_L` is chosen, and `σ·x` below always means
  the conjugate of `x`.
- **The two Evens identities**, `TauCeti.galoisRes_galoisEvens` and `TauCeti.galoisEvens_add`:
  - `res (N x) = x ∪ σ·x`;
  - `N (x + y) = N x + N y + cor (x ∪ σ·y)`.

  ⚠ The Evens norm is not additive, and the cross term is exactly that failure. Its cup is formed
  **over `L`**, with the **conjugate** of the second argument, and only then corestricted to `K`.
  All three choices are load-bearing.
- **The sign convention of the cup.** In bidegree `(1,1)` graded commutativity gives the sign
  `(−1)^{1·1}`; with `𝔽₂` coefficients `−z = z`, and the coefficient pairing is multiplication,
  which is its own opposite, so the cup is symmetric
  (`TauCeti.trivialF2TopPairing_cup_one_one_comm`). That is what lets the orthogonal-sum formula
  for `w₂` and the cross term above be read in either order. ⚠ It is a mod-2 fact; the sign
  survives with odd-torsion coefficients.

Independence of `σ` is `TauCeti.galoisCor_embedding_independent` and
`TauCeti.galoisEvens_embedding_independent`: conjugate embeddings give conjugate subgroups and the
induced maps agree, so the formula below is about `L/K` and not about a chosen embedding. The
projection formula `cor (res x ∪ y) = x ∪ cor y` (`TauCeti.galoisCor_cup`) is what turns the last
term of the degree-2 formula into a statement over `K`.

*Needs:* Layer 7A; TauCetiRoadmap.ProfiniteCohomology Layers 9, 10, 12 and 13.

- **The norm of a restricted class, and the kernel of restriction.** Identity 1 determines
  `N^Ev` only modulo the kernel of restriction `H²(G_K, 𝔽₂) → H²(G_L, 𝔽₂)`, and for `L = K(√d)`
  that kernel is `(d) ∪ H¹(G_K, 𝔽₂)`. `TauCeti.galoisSubgroup K L σ` is the subgroup of `G_K`
  fixing `σ(L)` pointwise (`TauCeti.mem_galoisSubgroup_iff`), so the class of the character with
  kernel `G_L` is the Kummer class of `d` (`TauCeti.galoisCharacter_eq_kummerClass`); the kernel of
  restriction is `(d) ∪ H¹(G_K, 𝔽₂)` (`TauCeti.galoisRes2_eq_zero_iff`); and
  `N(res y) = y ∪ y + (d) ∪ y` evaluates the norm on the classes that come from `K`
  (`TauCeti.galoisEvens2_galoisRes1`, `TauCeti.galoisEvens2_kummerClass_algebraMap`), all in
  `TauCeti/FieldTheory/GaloisCohomology/MuTwo/QuadraticCharacter.lean`. A candidate value that
  differs from the true one by an element of `(d) ∪ H¹(G_K, 𝔽₂)` satisfies identity 1 equally
  well, which is why the value on every Kummer class is computed directly, in the next milestone.

  *Needs:* the Galois setup; Layer 7C.

### The value of the Evens norm on a Kummer class

**The value of the Evens norm on a Kummer class** (Kahn, Invent. Math. 78 (1984), Lemme II.2.1;
Serre, Comment. Math. Helv. 59 (1984), Théorème 1′ at `n = 2`). For `L = K(x)` with `x ∉ K`,
`x² = d`, and every `a : Lˣ`:

- `N^Ev((a)) = (Tr a) ∪ (−d · N a) + (2) ∪ (d)` if `Tr a ≠ 0`
  (`TauCeti.galoisEvens2_kummerClass`);
- `N^Ev((a)) = (2) ∪ (d)` if `Tr a = 0` (`TauCeti.galoisEvens2_kummerClass_of_trace_eq_zero`),

both in `TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/Evens/Kummer/Value.lean`. The two
instances that consumers name are corollaries: `N^Ev((1 + t√d)) = (2) ∪ (1 − dt²)`
(`TauCeti.galoisEvens2_kummerClass_one_add`: `Tr = 2`, `N = 1 − dt²`, and `(2) ∪ (−1) = 0`
because `−1 = 1² − 2 · 1²`) and `N^Ev((√d)) = (2) ∪ (d)`
(`TauCeti.galoisEvens2_kummerClass_sqrt`). The formula covers every `a` at once, so neither a
reduction to normalized elements nor the polarization enters.

*Needs:* the Galois setup; Layer 7C; the twisted trace form; the `Pin⁺` model below;
TauCetiRoadmap.ProfiniteCohomology Layer 13 for the specification of the index-two Evens norm and
its `D₁₆` pullback formula.

The proof is Serre's second proof at `n = 2`, in explicit `2 × 2` matrices over `Kˢ`, and it pins
three conventions, each against a wrong alternative that changes the answer:

- **`e_i² = +1`.** The Clifford algebra of `(F², ⟨1, 1⟩)` is `M₂(F)`, with `e₁ = diag(1, −1)` and
  `e₂ = [[0, 1], [1, 0]]` (`TauCeti.pinE1`, `TauCeti.pinE2`), `e₁² = e₂² = +1`, `e₁ e₂ = −e₂ e₁` and
  `(y₀ e₁ + y₁ e₂)² = (y₀² + y₁²) · 1` (`TauCeti.pinE1_mul_self`, `TauCeti.pinE2_mul_self`,
  `TauCeti.pinE1_mul_pinE2`, `TauCeti.pinVec_mul_self`, in
  `TauCeti/LinearAlgebra/Matrix/PinPlusPlane/Basic.lean`). These signs make the lift of `C₂ ≀ C₂`
  below the dihedral group `D₁₆` of `Pin⁺` and not the quaternion group `Q₁₆`, as the `D₁₆` class
  and Kahn's and Serre's `(2)(d)` require. ⚠ Mathlib's `pinGroup`, on which Tau
  Ceti's `CliffordAlgebra.pinToOrthogonal` and `CliffordAlgebra.pinDoubleCover` are built, has the
  other sign: a vector in it has `Q v = −1` and squares to `−1`, so it lifts a reflection by an
  element of order four and lifts `C₂ ≀ C₂` to `Q₁₆`. The model here is therefore stated in
  matrices and not through that group.
- **The twisted adjoint action.** An orthogonal `x ∈ M₂(F)` acts on vectors by
  `v ↦ det(x) · x v xᵀ`. An orthogonal `2 × 2` matrix is homogeneous, even when its determinant is
  `1` and odd when it is `−1`, so this is `v ↦ (−1)^{|x|} x v x⁻¹`. A **`Pin⁺` lift** of
  `w ∈ O₂(F)` is an orthogonal `x` whose action is `w` (`TauCeti.IsPinLift`). With the sign, a unit
  vector lifts its own reflection; without it, `e₁` would act as `diag(1, −1)`, the reflection in
  the wrong line.
- **The descent convention.** `g ∈ G_K` acts on the coordinates of a point of `W` below by
  `ρ_a(g)ᵀ`, which is an anti-homomorphism in `g`, while `ρ_a` itself is a homomorphism
  (`TauCeti.kummerPoint_galois`).

Fix `σ : L → Kˢ`, write `G_L` for `TauCeti.galoisSubgroup K L σ`, and choose `s ∈ G_K ∖ G_L`,
`r ∈ Kˢ` with `r² = σ(a)`, and a square root `√2 ∈ Kˢ`. For `r ∈ Kˢ` with `r² ∈ K`,
`TauCeti.rootSign r g ∈ 𝔽₂` records whether `g r = −r`
(`TauCeti/FieldTheory/GaloisCohomology/MuTwo/KummerCharacter.lean`). It is the Kummer character of
`r²` (`TauCeti.kummerCharacter`), that is Tau Ceti's Kummer cocycle `g ↦ g r / r ∈ μ₂`
(`TauCeti.kummerCocycle`) read in `𝔽₂`, and `TauCeti.kummerClass_eq_homClass` says that the
Kummer class is the class of this character, through
`TauCeti.kummerMap_eq_kummerCocycleClass`. The route:

1. **The norm as a pullback.** For every open `U` of index two, every `s ∉ U` and every continuous
   `α : U → 𝔽₂`, `N^Ev(α) = (Ind α)^* c` (`TauCeti.ContCohomology.evensNormIndexTwo_eq_ind_pullback`,
   `TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/DihedralPullback.lean`), with
   `Ind α : G → C₂ ≀ C₂` the induced map `TauCeti.ContCohomology.indexTwoInd` into
   `TauCeti.WreathC2`, and `c = TauCeti.wreathD16Cocycle` the factor set of
   `TauCeti.dihedralToWreath : D₁₆ → C₂ ≀ C₂` for the section `TauCeti.wreathSection`
   (`TauCeti/GroupTheory/GroupExtension/DihedralSixteen.lean`). The Kummer class of `a`, carried to
   `G_L`, is the class of `γ ↦ rootSign r γ` (`TauCeti.galoisKummerCharacter`,
   `TauCeti.galoisF2Iso_inv_kummerClass`), so `N^Ev((a))` is the class of `c ∘ (ρ_a × ρ_a)` for
   `ρ_a = Ind α_a : G_K → C₂ ≀ C₂` (`TauCeti.kummerInd`,
   `TauCeti.galoisEvens2_kummerClass_eq_pullback`, in `TauCeti/FieldTheory/GaloisCohomology/MuTwo/EvensNorm.lean`). An explicit
   continuous `𝔽₂`-valued 2-cocycle of `G_K` is read in `H²(G_K, 𝔽₂)` by
   `TauCeti.ContCohomology.f2CocycleClass`, the class of its inhomogeneous cochain
   `TauCeti.ContCohomology.inhomogeneousCochain2`; it kills coboundaries and is additive
   (`TauCeti.ContCohomology.f2CocycleClass_add`, `TauCeti.ContCohomology.f2CocycleClass_eq_add`, in
   `TauCeti/RepresentationTheory/Homological/ContCohomology/InhomogeneousF2.lean`). The cup of the classes of two continuous homomorphisms
   `χ`, `ψ` is the class of `(g, h) ↦ χ(g) ψ(h)` (`TauCeti.ContCohomology.cup11_homClass`).
2. **The representation on `W`.** `C₂ ≀ C₂` acts on `F²` by signed permutations,
   `(a, b, c) ↦ diag((−1)^a, (−1)^b) · e₂^c` (`TauCeti.wreathSignedPerm`). For `y ∈ L` put
   `φ(y) = (σ(y) r, s(σ(y) r)) ∈ (Kˢ)²` (`TauCeti.kummerPoint`). Then `φ(y) · φ(y') = Tr(a y y')`
   (`TauCeti.kummerPoint_dotProduct`, `TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/Evens/TracePlane.lean`), because `σ` and
   `s ∘ σ` are the two embeddings of `L` into `Kˢ`: so `W = φ(L)` with the unit form of `(Kˢ)²` is
   `Tr_*⟨a⟩`. And `g(φ(y)) = ρ_a(g)ᵀ φ(y)` (`TauCeti.kummerPoint_galois`): `ρ_a` is the
   representation of `G_K` on the roots `r, s r` of `X² − σ(a)` and `X² − s σ(a)`, that is, of
   `M = K(√d, √a, √σa)`, and the descent datum of `W`.
3. **The lift into `D̃₁₆` and the twisted boundary.** Put `t = (e₁ − e₂)/√2` (`TauCeti.pinT`;
   `t² = +1` by `TauCeti.pinT_mul_self`). The assignment `r ↦ e₁ t`, the rotation by `π/4`, and
   `f ↦ t` is a homomorphism from Mathlib's `DihedralGroup 8` onto `D̃₁₆ = ⟨e₁, t⟩`
   (`TauCeti.pinDihedral`), with `(e₁ t)⁴ = −1` (`TauCeti.pinE1_mul_pinT_pow_four`). It is Tau
   Ceti's `TauCeti.dihedralHom` at the involutions `t` and `t e₁ t` of the unit group of `M₂(F)`,
   whose product `e₁ t` has order `8` (`TauCeti.dihedralHom_r`, `TauCeti.dihedralHom_sr`). It lies
   over `TauCeti.dihedralToWreath`: `TauCeti.pinDihedral z` is a `Pin⁺` lift of the signed
   permutation of `TauCeti.dihedralToWreath z` (`TauCeti.isPinLift_pinDihedral`; `t` lifts the
   swap and `e₁` lifts `diag(−1, 1)`). Through `TauCeti.wreathSection` it gives
   `TauCeti.pinLift`, whose factor set is `c`:
   `pinLift(g) pinLift(h) pinLift(gh)⁻¹ = (−1)^{c(g, h)}` (`TauCeti.pinLift_mul_mul_inv`). The lift
   of `ρ_a` is `ρ̃_a = pinLift ∘ ρ_a` (`TauCeti.kummerIndLift`), and its **twisted boundary** is
   `δ(ρ̃_a)(g, h) = ρ̃_a(g) · g(ρ̃_a(h)) · ρ̃_a(gh)⁻¹`, with `g` acting on entries
   (`TauCeti.twistedBoundary`, and `TauCeti.twistedBoundaryF2` for its exponent in `𝔽₂`, in
   `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/TwistedBoundary.lean`). Since `g` fixes `e₁`
   and `e₂` and sends `t` to `(−1)^{rootSign √2 g} t`, it multiplies `pinLift w` by
   `(−1)^{rootSign √2 g · c(w)}`, where `c(w)` is the top coordinate
   (`TauCeti.map_pinLift_galois`); and the top coordinate of `ρ_a(h)` is `rootSign √d h`, for the
   square root `√d = σ(x)`. So, as matrices (`TauCeti.twistedBoundary_kummerIndLift`,
   `TauCeti/FieldTheory/GaloisCohomology/MuTwo/TwistedBoundary.lean`),
   `δ(ρ̃_a)(g, h) = (−1)^{c(ρ_a g, ρ_a h) + rootSign √2 g · rootSign √d h}`, that is,
   `δ(ρ̃_a) = ρ_a^* c + (2) ∪ (d)` at cochain level. This `(2) ∪ (d)` is Serre's `(2)(d_E)`: it is
   the discriminant of `L/K` that enters, and not that of `Tr_*⟨a⟩`.
4. **The diagonalization.** Let `(y₀, y₁)` be an orthogonal basis of `Tr_*⟨a⟩` with values
   `w_j = Tr(a y_j²) ∈ Kˣ`, and let `c_j ∈ Kˢ` with `c_j² = w_j`. The matrix `P` whose `j`-th
   column is `φ(y_j)/c_j` (`TauCeti.kummerFrame`) is orthogonal, and
   `P⁻¹ ρ_a(g) g(P) = diag((−1)^{rootSign c₀ g}, (−1)^{rootSign c₁ g})`
   (`TauCeti.kummerFrame_conj`, `TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/Evens/Kummer/Frame.lean`): `ρ_a` is cohomologous
   to the diagonal cocycle of the Kummer characters of `w₀` and `w₁`. In Kahn's basis
   `(w₀, w₁) = (Tr a, d · Tr a / N a)`; at trace zero a hyperbolic basis gives `(1, −1)`.
5. **Invariance, and the diagonal formula.** `P` has a `Pin⁺` lift `P̃` (`TauCeti.exists_isPinLift`,
   `TauCeti/LinearAlgebra/Matrix/PinPlusPlane/CartanDieudonne.lean`: by Tau Ceti's Cartan–Dieudonné theorem
   `TauCeti.QuadraticMap.exists_reflectionOrthogonal_list_prod_eq`, `P` is a product of at most two
   reflections in anisotropic vectors, which can be scaled to unit vectors because `Kˢ` contains
   the square roots, and a unit vector lifts its own reflection). Conjugation acts on twisted
   boundaries by `δ(g ↦ P̃⁻¹ x(g) g(P̃)) = P̃⁻¹ δ(x) P̃` (`TauCeti.twistedBoundary_conj`), which
   leaves the scalar `δ(ρ̃_a)` unchanged. The cochain `g ↦ P̃⁻¹ ρ̃_a(g) g(P̃)` lifts the diagonal
   cocycle (`TauCeti.IsPinLift.mul`, `TauCeti.IsPinLift.inv`, `TauCeti.IsPinLift.map`), and so does
   `g ↦ e₁^{rootSign c₀ g} e₂^{rootSign c₁ g}` (`TauCeti.pinDiagonalLift`,
   `TauCeti.isPinLift_pinDiagonalLift`). Two lifts differ by a sign
   (`TauCeti.IsPinLift.eq_or_eq_neg`), here a continuous `(−1)^{ψ(g)}`, which changes the twisted
   boundary by the coboundary of `ψ`. The diagonal lift has entries in `{0, ±1}`, and
   `e₁^a e₂^b · e₁^{a'} e₂^{b'} = (−1)^{b a'} e₁^{a + a'} e₂^{b + b'}`
   (`TauCeti.pinDiagonalLift_mul`; these are the three lines that use `e_i² = +1` and
   `e₁ e₂ = −e₂ e₁`), so its twisted boundary is `(g, h) ↦ rootSign c₁ g · rootSign c₀ h`. Hence
   `δ(ρ̃_a)` is cohomologous to the cup `(w₁) ∪ (w₀)` at cochain level
   (`TauCeti.twistedBoundaryF2_kummerIndLift_cohomologous`,
   `TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/Evens/Kummer/TwistedBoundary.lean`).
6. **The value.** Steps 3 and 5 give
   `c ∘ (ρ_a × ρ_a) = rootSign c₁ ∪ rootSign c₀ + rootSign √2 ∪ rootSign √d + ∂ψ`, so step 1 gives
   `N^Ev((a)) = (w₁) ∪ (w₀) + (2) ∪ (d)` (`TauCeti.galoisEvens2_kummerClass_eq_cup_add_cup`). Since
   `(w₀) ∪ (w₁) = w₂(Tr_*⟨a⟩)`, this is Serre's `w₂(Tr_*⟨a⟩) = N^Ev((a)) + (2) ∪ (d)`. In Kahn's
   basis `(Tr a) ∪ (d · Tr a / N a) = (Tr a) ∪ (Tr a) + (Tr a) ∪ (d · N a) = (Tr a) ∪ (−d · N a)`, by
   `1/N a ≡ N a` and `(t) ∪ (−t) = 0` (Layer 7C, since `−t = 0² − t · 1²`); at trace zero
   `(−1) ∪ (1) = 0`.

### The relative Stiefel-Whitney formula

- **The polarization convention for `w₁` and `w₂`.** `w₁` is additive over `⊥`; `w₂` is not, and
  its polarization is the cup: `w₂(q ⊥ r) = w₂(q) + w₂(r) + w₁(q) ∪ w₁(r)`, which is Layer 8's
  `TauCeti.sw2Class_add`. That is a different polarization from the Evens one above, and the
  degree-2 Kahn formula contains both: the `N^Ev(x)` term carries the Evens polarization and the
  `w₁(Tr_*⟨1⟩) ∪ cor(x)` term carries the `w₂` one. A source that writes a single "polarization"
  is using one of the two, and the convention table decides which.
- **The relative Stiefel–Whitney formula, on the forms themselves** (Kahn, *Classes de
  Stiefel-Whitney de formes quadratiques et de représentations galoisiennes réelles*, Invent. Math.
  78 (1984) 223–256, **Théorème 2**, read in degrees `≤ 2`, and Prop. II.3.5 at rank one;
  Kozlowski, Proc. AMS 91 (1984) 309–313, Thm 1.1, for the homotopy-level transfer; Evens, Trans.
  AMS 108 (1963) 54–65, for the norm). This is the milestone of the layer. For `L/K` quadratic and
  `a : Lˣ`, with `x = (a) ∈ H¹(G_L, 𝔽₂)`:
  - `w₁(Tr_*⟨a⟩) = w₁(Tr_*⟨1⟩) + cor(x)`
    (`TauCeti.sw1Class_formClass_traceTransfer_smul_sq`, for every finite `L/K`, and
    `TauCeti.sw1Class_traceTransfer_mk_rankOne` on classes for `L/K` finite separable, in
    `TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/Transfer.lean`);
  - `w₂(Tr_*⟨a⟩) = w₂(Tr_*⟨1⟩) + N^Ev(x) + w₁(Tr_*⟨1⟩) ∪ cor(x)`
    (`TauCeti.sw2Class_formClass_traceTransfer_smul_sq`,
    `TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/QuadraticExtension.lean`).

  Nothing in the statement is a chosen diagonalization. The left-hand sides are Layer 8's
  descended `w₁` and `w₂` applied to `formClass` of the two transferred forms themselves; the
  right-hand sides use the canonical corestriction, cup, and index-two Evens norm attached to
  `L/K`. A consumer applies it to a quadratic extension and its trace forms and supplies no
  presentation of either side. The hypotheses are a `K`-embedding `σ : L → Kˢ`,
  `Module.finrank K L = 2`, `Invertible (2 : L)`, and the regularity of the two transferred forms;
  separability of `L/K` follows from `Invertible (2 : K)`.

  The proof is Kahn's. Write `L = K(x)` with `x ∉ K` and `x² = d ∈ Kˣ`, which is possible because
  `2` is invertible.
  - Degree 1: `w₁(q) = (d(q))`, `d(Tr_*⟨a⟩) = d · N a` and `d(Tr_*⟨1⟩) = d`, and
    `cor(x) = (N a)` (`TauCeti.galoisCor_kummerClass`); both sides are `(d) + (N a)`.
  - Degree 2, the four-line computation. `Tr_*⟨1⟩ ≅ ⟨2, 2d⟩`, so `w₁(Tr_*⟨1⟩) = (d)` and
    `w₂(Tr_*⟨1⟩) = (2) ∪ (2d) = (2) ∪ (d)`, as `(2) ∪ (2) = (2) ∪ (−1) = 0`
    (`TauCeti.sw2Class_formClass_traceTransfer_sq_of_sq`). Next
    `w₁(Tr_*⟨1⟩) ∪ cor(x) = (d) ∪ (N a) = 0`, because `N a = u² − d v²` (Layer 7C;
    `TauCeti.cup_sw1Class_formClass_traceTransfer_sq_galoisCor_eq_zero`). So the right-hand side is
    `(2) ∪ (d) + N^Ev((a))`. If `Tr a ≠ 0`, the left-hand side is
    `w₂⟨Tr a, d · Tr a / N a⟩ = (Tr a) ∪ (−d · N a)`, and by the value of the norm so is the
    right-hand side. If `Tr a = 0`, the left-hand side is `w₂⟨1, −1⟩ = 0`, and the right-hand side
    is `(2) ∪ (d) + (2) ∪ (d) = 0`.

  *Needs:* Layer 8; the twisted trace form; the value of the Evens norm; the Galois setup.
- **The calculational corollary, on diagonal tuples.** The same identities with `w₁` and `w₂` read
  on tuples `t` and `b` that present `Tr_*⟨1⟩` and `Tr_*⟨a⟩`
  (`TauCeti.sw1_eq_add_galoisCor_of_equivalent_traceTransfer`,
  `TauCeti.sw2_eq_add_galoisEvens_add_cup_of_equivalent_traceTransfer`), which is the shape a
  computation over a fixed base uses; isometry with a diagonal form with unit coefficients makes
  both forms regular, so no regularity hypothesis is needed. It is a corollary and not the
  milestone: alone it would leave every consumer to produce two diagonalizations and to prove that
  the answer does not depend on them.
- ⚠ The total-class form `w(Tr_* q) = N^Ev(w(q)) · w(Tr_*⟨1⟩)^{rank q}`, that is Théorème 2 for an
  arbitrary finite separable `L/K` and an arbitrary `q`, is an exclusion of this roadmap. It needs
  a graded cohomology ring, an Evens norm in every degree, and the multiplicative extension
  `N^Ev(1 + x) = 1 + cor(x) + … + N^Ev(x)`, together with a target in which a class with constant
  term `1` is invertible. See "Scope and ownership".

The transfer is transitive in a tower `M/L/K` and compatible with base change
(`TauCeti.WittRing.scharlauTransfer_baseChange`), and `Pin⁺` lifts are carried by the Galois
action. The value of the norm does not depend on the choices of `r`, `s` and `√2` made in its
proof, and the form-level formula, not the diagonal corollary, is the layer's public statement.

⚠ Nearby false statements. The transfer is not a ring homomorphism on Witt rings. Kahn's
Théorème 2 needs `L/K` separable, and the transfer of forms has no such formula for an inseparable
extension. The Evens norm is not additive, and the corestriction term in the expansion above
records that failure. The cross term of that expansion is a cup with the **conjugate** class and
not with the class itself; a formula without the conjugate is a different statement, and nothing
here supplies it. The value of the norm on `(1 + t√d)` has no term from the kernel of restriction:
`(2) ∪ (1 − dt²) + (d) ∪ (−1)`, which is what the `SD₁₆` class would give, restricts to `L` exactly
as the true value does and is false; over `ℚ_2` with `d = −1` and `t = 2` it is `0`, while the
value is `(2) ∪ (5) ≠ 0`. The lift of `C₂ ≀ C₂` built with `e_i² = −1` is `Q₁₆`, and its class is
not the norm.

### Examples

- `Tr_*⟨1⟩ ≅ ⟨2, 2d⟩` for `ℚ(√d)/ℚ` and for `ℚ_2(√d)/ℚ_2`, which recovers the `ℂ/ℝ` computation of
  `TauCeti/NumberTheory/EffectiveBounds/TraceForm.lean` as the archimedean sibling.
- An instance of the relative formula in low degree: `K = ℚ_2`, `L = ℚ_2(√5)`, the unramified
  quadratic extension, so `d = 5`, and `q = ⟨a⟩` as `a` runs over the eight unit square classes of
  `L`, that is over the image of `𝒪[L]ˣ` in `Lˣ/(Lˣ)²`. That image is the kernel of the
  parity-of-valuation map and has order `8`, while `Lˣ/(Lˣ)²` has order `16` by Layer 6A with
  `[L : ℚ_2] = 2`. A uniformizer represents the missing coset and is excluded here deliberately.
  With `ω = (1 + √5)/2`, the eight classes are those of `±1`, `±ω`, `±√5` and `±√5·ω`: the norm
  sends the four pairs onto the four unit classes `[1]`, `[−1]`, `[−5]`, `[5]` of `ℚ_2`, and `−1` is
  not a square in `L` (neither `−1` nor `−5` is a square in `ℚ_2`). Write `ν` for the nonzero
  element `(2) ∪ (5)` of `H²(G_ℚ₂, 𝔽₂)`. Then `Tr_*⟨1⟩ ≅ ⟨2, 10⟩`, so `w₁(Tr_*⟨1⟩) = (5)` and
  `w₂(Tr_*⟨1⟩) = ν`, and the cross term `(5) ∪ (N a)` is `0` in every row because `N a` is a norm
  from `L`. The left-hand sides are computed on the forms, `Tr_*⟨a⟩ ≅ ⟨Tr a, 5 · Tr a · N a⟩` when
  `Tr a ≠ 0` and the hyperbolic plane when `Tr a = 0`; the norm is the value of the previous
  subsection.

  | `a` | `Tr a` | `N a` | `w₁(Tr_*⟨a⟩) = (5 · N a)` | `N^Ev((a))` | `w₂(Tr_*⟨a⟩) = ν + N^Ev((a))` |
  |---|---|---|---|---|---|
  | `1` | `2` | `1` | `(5)` | `0` | `ν` |
  | `−1` | `−2` | `1` | `(5)` | `ν` | `0` |
  | `ω` | `1` | `−1` | `(−5)` | `ν` | `0` |
  | `−ω` | `−1` | `−1` | `(−5)` | `ν` | `0` |
  | `√5` | `0` | `−5` | `(−1)` | `ν` | `0` |
  | `−√5` | `0` | `−5` | `(−1)` | `ν` | `0` |
  | `√5·ω` | `5` | `5` | `0` | `ν` | `0` |
  | `−√5·ω` | `−5` | `5` | `0` | `0` | `ν` |

  For instance `a = −√5·ω` gives `⟨−5, −125⟩ ≅ ⟨−5, −5⟩` with `w₂ = (−5) ∪ (−1) = ν`, while
  `N^Ev((a)) = (−5) ∪ (−25) + ν = 0`; and `a = √5` gives the hyperbolic plane, `w₂ = 0`, with
  `N^Ev((√5)) = (2) ∪ (5) = ν`. Every row separates the formula from the variant without the
  `w₂(Tr_*⟨1⟩)` term and from a value of the norm without its `(2) ∪ (d)` term, since each shifts
  the right-hand side by `ν`.
- The value of the Evens norm pins its sign. Over `ℚ_2`, with `d = −1`, `L = ℚ_2(i)` and
  `a = 1 + 2i`: `Tr a = 2` and `N a = 5`, so `N^Ev((a)) = (2) ∪ (5)`, which is nonzero because
  `(2,5)_ℚ₂ = −1`. Kahn's form `(Tr a) ∪ (−d · N a) + (2) ∪ (d)` is `(2) ∪ (5) + (2) ∪ (−1)`, the
  same class, because `(2,−1)_ℚ₂ = +1`. The candidate `(2) ∪ (5) + (d) ∪ (−1) = (2) ∪ (5) + (−1) ∪ (−1)`
  is `0`, because `(−1,−1)_ℚ₂ = −1` and `H²(G_ℚ₂, 𝔽₂)` has two elements (Layer 6E), although it
  restricts to `L` exactly as the value does.

### Dependencies

Layers 1 to 4 for the transfer half, which can be built together with Layer 5; Layers 7 and 8 for
the relative-formula half; Layer 6 (6A's square-class count and the symbols over `ℚ_2` of 6C
and 6E) for the `ℚ_2(√5)` example.
Mathlib's `Algebra.trace`, `Algebra.traceForm`, `traceForm_nondegenerate`, `Algebra.norm`, `Algebra.IsQuadraticExtension`, `Matrix`,
`DihedralGroup` and `IsSepClosed`. Tau Ceti's `TauCeti/LinearAlgebra/QuadraticForm/Transfer/`,
`TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/`, `TauCeti/LinearAlgebra/Matrix/PinPlusPlane/`,
`TauCeti/FieldTheory/GaloisCohomology/`, `TauCeti/GroupTheory/GroupExtension/DihedralSixteen.lean`,
`TauCeti/GroupTheory/SpecificGroups/Dihedral/Basic.lean`, `TauCeti/RingTheory/Norm/Quadratic.lean`
and `TauCeti/FieldTheory/Trace.lean`. TauCetiRoadmap.ProfiniteCohomology Layers 9, 10, 12 and 13
for the specification of the transfer along `L/K` and the `D₁₆` pullback formula.

## Downstream consumers

The names that these roadmaps import from this namespace, and the eleven names that are Tau
Ceti's, are listed under Scope and ownership. None of these roadmaps supplies an input to this one.

- GlobalQuadraticForms: the carrier and the discriminants of Layers 0 and 3, Layer 0's
  representation criterion, Layer 1's hyperbolic planes, Witt cancellation and Witt extension,
  Layer 4's Witt ring, the Hilbert symbol, the local Hasse invariant and the evaluation against the
  unramified class of 6B–6C, the realization theorem and the classification with its isotropy list
  of 6D, and the cohomological comparison and product formula of 6C.
- IntegralLattices: the square classes and the Witt, Brauer, Hasse and Clifford invariants of
  Layers 0 and 3 to 5, the local classification of 6D, and Hilbert reciprocity through Tau Ceti's
  `TauCeti.hilbertSymbol_productFormula` (its 3G and 6A).
- OrthogonalSpinGroups: Layer 0's orthogonal bases and multiplicative square-class quotient,
  Layer 1's reflections, Cartan–Dieudonné theorem and Witt extension, Layer 3's plain
  discriminant, and `hilbertSymbol`, `localHasse`, `hasseInvariant_eq_localHasse` and the
  classification over `ℚ_p` by `(dim, d, s)` of 6C to 6E.
- ClassicalArithmeticCompletion: 6C's Hilbert symbol `hilbertSymbol` (item 1), with which its
  degree-two norm-residue symbol is compared; the closed formulas of 6C items 9 and 10, the second
  with its exponent computed in `ZMod 2`; and the product formula
  `TauCeti.hilbertSymbol_productFormula` (item 14).
- SpinRepresentations: the reflection and Cartan–Dieudonné suppliers recorded in Layer 1.
- SchemeAndStackFoundations: the identification of the Brauer group of a field with `H²` of
  Layer 7B.
- QuadraticFormInvariantsPartII, which continues this roadmap past its exclusions: Layers 1, 4,
  7A, 7B and 9.
- GeometryOfNumbersAndQuadraticArithmeticPartII: the Witt theory of Layer 4, the local
  classification and the Hilbert symbol of Layer 6, and the transfer of Layer 9.

## References

- T. Y. Lam, *Introduction to Quadratic Forms over Fields*, GSM 67, AMS (2005),
  PRIMARY. Ch. I (diagonalization I.2, hyperbolic I.3, Witt decomposition and
  cancellation I.4, chain equivalence I.5.2, reflections I.7), Ch. II (Witt ring, square
  classes), Ch. III (quaternion algebras and norm forms, III.2.7, III.2.11), Ch. V §3
  (Clifford, Witt, and Hasse invariants, V.3.17-3.21, the Wall caution p. 120), Ch. VI
  (local fields, VI.2), Ch. VII (Scharlau transfer VII.1), Ch. X (Pfister forms).
- J.-P. Serre, *A Course in Arithmetic*, GTM 7, Springer (1973), PRIMARY for the local
  theory. Ch. II §3.3 (squares in `ℚ_p`, `ε` and `ω`), Ch. III (Hilbert symbol:
  III.1.1-1.2, Thm 1 formulas including `p = 2`, Thm 2 nondegeneracy), Ch. IV §2 (the
  invariants `d` and `ε`; Thm 5 well-definedness, Thm 6 isotropy, Prop 6 realization,
  Thm 7 classification and the unique anisotropic quaternary corollary).
- O. T. O'Meara, *Introduction to Quadratic Forms*, Springer (1963; Classics reprint
  2000), §63: §63A (the quadratic defect and the local square theorem), 63:11-13 (symbol
  computation, bimultiplicativity, nondegeneracy), 63:16 (unramified norms), 63:17-18
  (the anisotropic quaternary space), 63:19 (`u = 4`), 63:20 (classification), 63:21
  (representation), 63:23 (existence). ⚠ O'Meara's Hasse symbol is `∏_{i≤j}`, translated
  by the convention table.
- B. Kahn, *Classes de Stiefel-Whitney de formes quadratiques et de représentations
  galoisiennes réelles*, Invent. Math. 78 (1984) 223-256, Théorèmes 1-3, Lemme II.2.1
  and Prop. II.3.5; the source of Layer 9's relative formula and of the value of the
  Evens norm.
- J.-P. Serre, *L'invariant de Witt de la forme Tr(x²)*, Comment. Math. Helv. 59 (1984)
  651-676, Théorème 1′ and its second proof, which Layer 9 follows at `n = 2` in
  explicit matrices.
- A. Kozlowski, *The Evens-Kahn formula for the total Stiefel-Whitney class*, Proc. AMS
  91 (1984) 309-313, Thm 1.1.
- A. Delzant, *Définition des classes de Stiefel-Whitney d'un module quadratique sur un corps
  de caractéristique différente de 2*, C. R. Acad. Sci. Paris 255 (1962) 1366-1368: the
  definition of the total class `∏ᵢ (1 + (aᵢ))` on a diagonalization, which Kahn 1984 II.1.3
  restates.
- L. Evens, *A generalization of the transfer map in the cohomology of groups*, Trans.
  AMS 108 (1963) 54-65, the norm map.
- P. Guillot, *The computation of Stiefel-Whitney classes*, Ann. Inst. Fourier 60 (2010)
  565-606, a computational companion for Stiefel-Whitney classes of representations.
- J. Milnor, *Algebraic K-theory and quadratic forms*, Invent. Math. 9 (1970) 318-344,
  §4: `w` on square classes and the `I^n`-filtration picture.
- P. Gille, T. Szamuely, *Central Simple Algebras and Galois Cohomology*, CUP (2nd ed.
  2017): 1.1.9 (the four-fold criterion), 1.5 (symbol bilinearity), Ch. 2 and 4.4
  (crossed products, cyclic algebras, and `Br(K) ≅ H²`), Ch. 4 (cup products and the
  symbol). The reference of record for Layers 5 and 7.
- W. Scharlau, *Quadratic and Hermitian Forms*, Springer (1985), Ch. 2 §5 (transfer),
  Ch. 5 (local fields).
- R. Elman, N. Karpenko, A. Merkurjev, *The Algebraic and Geometric Theory of Quadratic
  Forms*, AMS Colloq. 56 (2008): II §7 is the source of Mathlib's `Nondegenerate`, and
  the modern reference for Layers 0 to 4; II §10 and Example 13.5 (2) for the
  characteristic-2 exclusion.
- J.-P. Serre, *Local Fields*, GTM 67, Springer (1979): Ch. X (crossed products and
  `H²`), XIV §2 (the symbol as a cup product and the norm criterion).
