# Roadmap: integral quadratic forms and lattices

**Summary.** This roadmap develops the arithmetic of integral symmetric lattices over `ℤ` and
`ℤ_p` on Tau Ceti's native `TauCeti.IntegralLattice` carrier. The archived
[integral-lattices foundation](../../Completed/IntegralLattices/README.md) stops at the carrier,
duality, discriminant groups and forms, overlattice gluing and the ADE discriminant
calculations, and Tau Ceti implements that foundation together with signature, radical quotient,
scale and norm ideals, level, minima, successive minima, bounded-norm finiteness, finiteness of
`O(L)` and Hermite's inequality (§*From Tau Ceti*). This roadmap starts there. It builds
Nikulin's classification of finite quadratic forms with its Gauss-sum calculus, Milgram's theorem
and van der Blij's congruence; Minkowski's second theorem and reduction theory; Jordan
splittings, the genus and Conway–Sloane symbols; the binary dictionary to quadratic orders; the
class, genus and spinor-genus interfaces; Nikulin's existence theorems and the existence theory of
primitive embeddings; the classification of indefinite unimodular lattices and of positive
definite unimodular lattices of rank at most 9, the rank-16 pair and `|O(E₈)|`; the local
densities; and the Euclidean volume of `SO(n)`.

The principal results of this roadmap are:

1. the classification of indefinite unimodular lattices and of positive definite unimodular
   lattices in rank at most 9, with the uniqueness of `E₈`;
2. the genus, its Conway–Sloane symbols, the class and spinor-genus dictionary, and the local
   densities that a mass formula is assembled from;
3. Nikulin's existence theory for even lattices and for primitive embeddings into even
   unimodular lattices.

**Where this roadmap stops.** Every result whose proof passes through Eichler's theorem is
outside it. That is Nikulin's uniqueness theorem 1.13.2 with Corollaries 1.13.3–1.13.5, the
surjectivity theorems 1.14.2 and 3.6.3, the uniqueness of primitive embeddings 1.14.4, and the
statement of Theorem 3.6.2 that the invariants determine an indefinite 2-elementary lattice up to
isometry. Eichler's theorem itself, strong approximation for `Spin`, the Smith–Minkowski–Siegel
mass formula and the dyadic smooth model belong to `OrthogonalTamagawaAndLatticeMass` (OTM), which
consumes this roadmap. The Eichler-dependent Nikulin theory is `IntegralLatticesPartII`, which
consumes this roadmap and OTM §0.3; nothing here consumes OTM, so the supply runs one way:
IntegralLattices, then OTM, then `IntegralLatticesPartII`.

Suggested homes, which follow Mathlib's directory conventions:

- `TauCeti/LinearAlgebra/IntegralLattice/` for Layers 1 and 2: finite quadratic forms,
  reduction theory and automorphism groups;
- `TauCeti/NumberTheory/IntegralLattice/` for Layers 3 to 7 and 9: localizations, Jordan
  theory, the genus and its symbols, class numbers, spinor genera, Nikulin's existence theory,
  the unimodular classification, and the local mass ingredients.

## Scope and ownership

In scope: the arithmetic of integral lattices over `ℤ` and `ℤ_p`, as listed in the layers
below, and the dyadic Jordan combinatorics of lattices over unramified extensions of `ℤ₂` that
3B and 3I state.

The arithmetic dependencies are `QuadraticFormInvariants`, `GlobalQuadraticForms`,
`GlobalNumberFields`, `ClassFieldTheory`, `RestrictedProducts`, `OrthogonalSpinGroups` and
`RepresentationTheory/RootSystems`. The real-volume construction additionally consumes the
native ball/radial measure, smooth metric and volume-density APIs, the early finite-dimensional
matrix Lie-group construction in `RepresentationTheory/LieGroups`, and `DifferentialGeometry`
12.1/12.4 for metric/density comparisons. Field, order, adelic, Spin and ADE carriers remain with
their owners.

[Theta Series](../ThetaSeries/README.md) is not among them, because its relation to this
roadmap runs the other way: it is a **consumer** of Layers 1, 2 and 6 here and supplies nothing
to this roadmap. Its `Suggested.lean` imports the native Tau Ceti integral-lattice modules
(the carrier, discriminant forms, orthogonal sums, overlattice index, rationalization and the ADE
root lattices), not this roadmap's file; it builds the theta series of a positive definite
lattice on its own real carrier and transports the rational carrier, the duality and
discriminant-form theory and the reference lattices across its own bridge. This roadmap imports
nothing from it, states no theta series, and has no milestone whose proof passes through one;
§*Theta series* and Layer 8 set out exactly what is exported. There is no reverse Theta Series
or `LFunctions` dependency. Real analysis does enter 7E through native sphere/ball measure, Gamma,
charts, Jacobians and Fubini. The local/formal density dictionary of 7C is distinct from the
successor's global Euler-product convergence and nonvanishing obligations.

### Ownership boundaries

Restricted products and orthogonal point groups alone do not supply strong approximation,
reduction, Tamagawa measures or integral smooth-model comparisons. Their generic arithmetic
contracts are in `AdelicAlgebraicGroups` (AA0–AA4). OTM owns the following orthogonal
specializations; the labels in the second column are used in this document only as names for
the OTM sections in the third:

| Orthogonal specialization | Label | Owner |
| --- | --- | --- |
| Eichler's theorem `cls⁺ L = spn⁺ L` for indefinite rank `≥ 3`, and the class-number finiteness that follows from it | 4D, and the rank-`≥ 3` half of 4E | OTM §0.3 |
| the adelic decomposition of `SO(V)(ℚ) \ SO(V)(𝔸)` into class-indexed pieces | 7B | OTM §1.1 |
| the identification of a local density with the Haar volume of a stabilizer in the Tamagawa normalization | one bullet of 7C | OTM §1.2 |
| the volume theorem `vol(SO(V)(ℚ) \ SO(V)(𝔸)) = 2` | 7F | OTM §1.3, over GeometryOfNumbersAndQuadraticArithmetic §3.3 |
| the Conway–Sloane mass formula and its checks | 7H | OTM §§2.3, 3.1 |
| the rank-16 completeness statement, that the genus of `E₈²` has exactly two classes | 7I | OTM §4.1 |
| Cho's smooth affine group scheme `𝒢_L` over `ℤ₂`, its special fibre and unipotent radical, and the closed formula it gives for the dyadic local density | 7D | OTM §§2.1–2.2 |

OTM consumes this roadmap: §§0–4 for the lattice, Jordan, genus and spinor-genus carriers, 6C–6D
for the reference lattices, 7A, 7C, 7E and 7G for masses, local counts, real volumes and low ranks,
B1–B8 for the binary branch, and 9B for exhaustion from a mass. No milestone of this roadmap
consumes OTM. The Nikulin results that need Eichler's theorem are therefore not milestones here;
they are `IntegralLatticesPartII`'s, in the table below.

This roadmap owns the Jordan types, the bound/free classification and Cho's exponents `N_M`, `N_Q`
and `N` in 3I; constructing the dyadic model `𝒢_L` from them is OTM §2.1.

Two more boundary facts about that successor are recorded here so that neither document drops
them. First, 6D and 7I are one classification split across the boundary: 6D here constructs
`E₈²` and `D₁₆⁺`, proves them even unimodular of rank 16, in one genus, and non-isometric, and
OTM §4.1 proves that they exhaust the genus; only the pair classifies rank 16. Second, OTM's
lattice masses and genus-exhaustion statements are positive definite; its Eichler and
class-finiteness statements concern indefinite lattices. The indefinite Siegel–Narain kernel, its
theta lifts and indefinite Siegel–Weil identities remain `IndefiniteThetaAndSiegelWeil`'s.

Out of scope, with the owner of each subject:

| Subject | Owner |
| --- | --- |
| local quadratic forms, square classes, Witt/Brauer/Hasse/Clifford invariants, the Hilbert symbol, and dyadic classification | [Quadratic Form Invariants](../QuadraticFormInvariants/README.md) |
| Hasse--Minkowski and global classification, representation, and realization of rational forms | [Global Quadratic Forms](../GlobalQuadraticForms/README.md) |
| the groups `O(Q)`, `SO(Q)`, and `Spin(Q)`, the spinor norm, transvections, and local and finite-adelic spin groups | [Orthogonal and Spin Groups](../../Completed/OrthogonalSpinGroups/README.md) |
| generic restricted products, compact-open families, and rational diagonals | [Restricted Products](../../Completed/RestrictedProducts/README.md) |
| generic algebraic-group adelic points, strong approximation, reduction theory, Tamagawa measures, and the central-isogeny volume comparison | `AdelicAlgebraicGroups` AA0–AA4 and its actual earlier local/model contracts |
| smoothening of an affine group scheme over `ℤ_p`, its special fibre, unipotent radical and reductive quotient, and the point counts of each | `OrthogonalTamagawaAndLatticeMass`, over the generic successors above |
| the orthogonal specialization: strong approximation for `Spin`, `τ(SO_Q) = 2`, Eichler's theorem, the genus/spinor-genus comparison in rank `≥ 3`, the dyadic local density of 7D, and the Smith–Minkowski–Siegel mass formula | `OrthogonalTamagawaAndLatticeMass`, the successor that Orthogonal and Spin Groups names |
| root systems, Weyl groups, `DynkinType`, the ADE classification | [Root Systems](../RepresentationTheory/RootSystems/README.md) |
| Nikulin's uniqueness theorem 1.13.2 and Corollaries 1.13.3–1.13.5 (uniqueness in a genus, stabilization by `U` and `E₈(−1)`, splitting off `U` and `E₈(−1)`), the surjectivity of `O(T) → O(q_T)` (Theorem 1.14.2 with Proposition 1.14.1, and Theorem 3.6.3), the uniqueness of primitive embeddings (Theorem 1.14.4), the isometry-class half of Theorem 3.6.2, and the odd `p`-elementary classification; each proof passes through Eichler's theorem, together with the local integral spinor-image computations those proofs make | `IntegralLatticesPartII`, which consumes Layers 1, 3, 4 and 5 here and OTM §0.3 |
| the 24 even unimodular positive definite lattices of rank 24: the 23 rootful glue constructions with their root sublattices, and the Leech lattice by Construction B with minimum 4 | [Rank-24 lattice constructions](../Rank24LatticeConstructions/README.md), Layers 3 and 6; this roadmap neither constructs nor consumes them |
| the theta series `Θ_L` and the coset series `θ_γ` of a positive definite lattice, their `q`-expansions, their `T` and `S` transformation laws, the vector-valued law on discriminant cosets, every modularity statement about them, and every conclusion drawn from one — the closed formula `r_L(2m) = 240 σ₃(m)` in even unimodular rank 8, the theta identity of the rank-16 pair, the rank-24 identities with the Leech representation numbers | [Theta Series](../ThetaSeries/README.md), which consumes this roadmap and supplies nothing to it; §*Theta series* below and Layer 8 record what it takes |
| Poisson summation for a full-rank `ℤ`-lattice in a real inner product space, and the Gaussian Fourier transform it is applied to | [Theta Series](../ThetaSeries/README.md), whose Layer 1 is the generic theorem; no milestone here consumes it |
| the number-field theta kernel of an ideal lattice in the mixed space, its Mellin transform, and the functional equations of zeta and Hecke `L`-functions | [L-functions](../LFunctions/README.md), which consumes Theta Series' Poisson summation and is not a dependency of this roadmap |
| number-field orders, conductors, raw proper fractional ideals, invertible proper fractional ideals, the ideal class monoid, `Pic`, and `NarrowPic` for the nonsplit binary branch | [Global Number Fields](../../Completed/GlobalNumberFields/README.md) |
| ring class fields and their Artin isomorphisms for nonsplit quadratic field orders | [Class Field Theory](../ClassFieldTheory/README.md) |
| modular forms of integral weight, Hecke theory, newforms | [Modular Forms](../ModularForms/README.md) |
| automorphism groups of indefinite lattices — reflection subgroups, the Eichler criteria for `O(L)`-orbits, arithmeticity and fundamental domains, and Borcherds' method | `IndefiniteLatticeAutomorphisms`, a successor this roadmap names; it consumes 4F, B4 and the discriminant-form machinery of Layer 5, and is not consumed here |
| the Siegel–Narain theta of an indefinite lattice — parametrized by a maximal positive definite subspace of `L ⊗ ℝ`, with convergence, the discriminant-coset refinement, the `S` and `T` laws, and `O(L)`-equivariance in the parameter — together with theta lifts, the indefinite Siegel–Weil theorem, and the genus averages it evaluates | `IndefiniteThetaAndSiegelWeil`, a successor this roadmap names; it consumes Layer 1 here, and Theta Series' Poisson summation and definite theory, and is not consumed here. ⚠ Theta Series is positive definite by construction — definiteness is the inner product of its ambient space, not a hypothesis it could drop — so the indefinite side is this successor's and is reached by no weakening of any Theta Series declaration |
| the Witt group of nondegenerate finite quadratic modules — orthogonal sum, metabolic reduction, the Gauss-sign homomorphism to `ℤ/8`, and the equivalence of the trivial Witt class with the existence of a Lagrangian subgroup | `FiniteQuadraticModuleWittTheory`, a successor this roadmap names; it consumes 1G and 1H, whose metabolic predicate and Gauss-sign vanishing are its exact lattice-side inputs, and is not consumed here |

The following subjects have no owner and are not part of this roadmap. They are listed so
that a reader can see the boundary.

- The Weil representation of `SL(2, ℤ)` on `ℂ[A_L]`, and the `SL(2, ℤ)` presentation
  `⟨S, T | S⁴ = 1, (ST)³ = S²⟩`. Neither is a milestone here and neither is a milestone of
  Theta Series, which proves its vector-valued law and its `Γ(N)`-modularity of the coset
  series directly. A roadmap for the Weil representation would consume 1G and 1H here — the
  finite-quadratic-module carrier and its Gauss-sign invariant are what the `S`-matrix is
  stated in — together with Theta Series' Gauss-sum layer and the local formulas of
  Scheithauer and Strömberg. No milestone of this roadmap acts on `ℂ[A_L]`.
- Half-integral weight modular forms, hence the modularity of the theta series of a lattice of
  **odd** rank. Theta Series carries an automorphy factor only in even rank `n = 2k`, where it
  is the honest integer power `(-i)^k τ^k`, and this roadmap states no automorphy factor at
  all; Modular Forms owns integral weight. No metaplectic group, theta multiplier or branch of
  `√τ` appears in this portfolio.
- The Siegel-Eisenstein/Weil-representation proof of the lattice mass formula is outside this
  roadmap. OTM assembles the mass from an orthogonal adelic volume comparison; selected
  generic numerical-volume inputs may have their own value-only Siegel–Weil proof. This does
  not move the indefinite theta kernel or its identities out of `IndefiniteThetaAndSiegelWeil`,
  and does not introduce a reverse Theta Series dependency.
- Alternating integral lattices. The carrier of this roadmap is symmetric-bilinear
  throughout — `isSymm` is a structure field of `IntegralLattice`, and every milestone reads
  through it — so integral symplectic lattices, `Sp(2n, ℤ)`, the alternating Dirac pairing of an
  electric–magnetic charge lattice, and Siegel modular forms are a different subject, not a gap
  in this one, and are not to be grafted onto this carrier by weakening `isSymm`.
- Lattices over the ring of integers of a number field. Every statement here is over `ℤ`
  or `ℤ_p`.
- Lattice reduction algorithms beyond the bounds that finiteness needs.
- Sphere packing optimality, and constructions of lattices from codes.

### Theta series

The theta series of a lattice is owned by [Theta Series](../ThetaSeries/README.md), and the
dependency between the two roadmaps runs one way: that roadmap consumes this one, and this one
consumes nothing from it.

**Owned there, and not consumed here.** `Θ_L` and the coset series `θ_γ` as holomorphic
functions on `ℍ`; their convergence, holomorphy and `q`-expansions; Poisson summation for a
full-rank `ℤ`-lattice in a real inner product space and the Gaussian Fourier transform it
applies to; the translation law under `T` and the inversion law under `S`, scalar, at a general
translate, and vector-valued on the discriminant group; the Gauss sums of a lattice with their
reciprocity law; the level-one theorem and the Hecke–Schoeneberg theorem
`Θ_L ∈ M_k(Γ₀(N), χ_L)`; every other modularity statement; and every conclusion drawn from one
of these — that the theta series of an even unimodular lattice of rank 8 is `E₄`, hence
`r_L(2m) = 240 σ₃(m)`; that the theta series of every even unimodular lattice of rank 16 is
`E₄²`, so that the theta series does not determine the lattice; and the rank-24 identities
with the Leech representation numbers. **This roadmap states no theta series of its own and
proves nothing from one.** No milestone of Layers 0 to 7, B or 9 has a theta series, a modular
form or a `q`-expansion among its inputs; `Suggested.lean` neither imports Theta Series nor
names any of its declarations. Where the two roadmaps arrive at the same number, this one
counts and that one expands: `r_{E₈}(2) = 240` here is the number of roots of `E₈` (2B, 6G),
and the same value there is the `m = 1` case of a `q`-expansion.

**Consumed there.** The carrier `IntegralLattice`, its predicates, the dual, the discriminant
group and forms, the overlattice correspondence, the ADE lattices with their discriminant forms,
shells, representation numbers and the covolume identity are Tau Ceti's native foundation, which
Theta Series imports directly (§*From Tau Ceti*). From this roadmap it takes the
generator classification of finite quadratic forms (1G), Milgram's theorem at every signature
(1I), Jordan splittings and the genus (Layer 3), Nikulin's existence theory (Layer 5), and the
unimodular classification in low rank, including the rank-16 pair `E₈²` and `D₁₆⁺` (6D). Theta
Series transports these across its own Layer-2 bridge and adds no competing definition of any of
them; its `D₁₆⁺` application is stated against 6D here. Layer 8 lists the exports row by row.

**The bridge is theirs.** The two carriers are genuinely different objects — this roadmap's is
a `ℤ`-submodule of a rational vector space with a rational bilinear form, in which
definiteness is a predicate and indefinite and degenerate lattices are objects of the same
type; theirs is a `Submodule ℤ E` in a real inner product space with `IsZLattice ℝ`, in which
positive definiteness is structural. The comparison that identifies the invariants, the
discriminant group and the discriminant forms across the two models lives in Theta Series
(its Layer 2), not here, and is the only place they are compared. This roadmap adds no
real-model carrier and no second dual-lattice notion.

**Two things that look like duplication and are not.** Milgram's theorem at every signature
(1I), proved arithmetically from the Gauss-sum invariant of 1H, is this roadmap's; Theta
Series proves the positive definite instance `∑_{γ ∈ A_L} e(q_L(γ)) = |A_L|^{1/2} e(n/8)` by
theta asymptotics, for its own Gauss-sum layer. Both are wanted, the bridge identifies them,
and neither is derived from the other. Likewise the shells `S_k(L)` and representation numbers
`r_L(k)` are Tau Ceti's native counts in the rational carrier (label 2B); that they are the
`q`-expansion coefficients of `Θ_L` is Theta Series' theorem, not a second definition here.

## Conventions

These decisions hold in every layer.

**The single lattice carrier.** The canonical object is Tau Ceti's embedded carrier
`TauCeti.IntegralLattice`: a full `ℤ`-submodule of a rational vector space, with a symmetric rational form
which is integer-valued on the carrier:

```lean
structure IntegralLattice (V : Type u) [AddCommGroup V] [Module ℚ V] where
  carrier : Submodule ℤ V
  [isLattice : carrier.IsLattice ℚ]
  form : LinearMap.BilinForm ℚ V
  isSymm : form.IsSymm
  integral : ∀ x ∈ carrier, ∀ y ∈ carrier, form x y ∈ (1 : Submodule ℤ ℚ)
```

`Submodule.IsLattice ℚ` supplies finite generation, freeness, full rational span, bases, and
rank. An abstract finite free `ℤ`-module with an integral symmetric form is an input view,
not a second carrier: rationalization embeds it as an `IntegralLattice`, and restriction of
an `IntegralLattice` to its carrier recovers the abstract form. Tau Ceti's rationalization (label 1A) proves these
constructions inverse up to isometry and transports every invariant. The prose writes `B`
for the rational form and `L` for the embedded lattice. Nondegeneracy and definiteness are
predicates, never structure fields.

**The bilinear form is the primary datum.** The norm of `x` is `B x x`. The roadmap never
halves a norm without saying so. `L` is even when `B(x,x) ∈ 2ℤ` for every `x ∈ L`, and
odd otherwise. Restricting `B` to the carrier gives an integral symmetric bilinear form;
an even restriction is `Q.polarBilin` for a unique `Q : QuadraticForm ℤ L` with
`Q x = B(x,x)/2`; the native `quadraticForm` and rationalization (labels 0B, 1A) carry this dictionary.

**Do not use the associated bilinear form over `ℤ`.** `QuadraticMap.associated` requires
`[Invertible (2 : Module.End R N)]`, which fails for `R = N = ℤ`.
`QuadraticForm.toMatrix`, `QuadraticForm.discr` and `QuadraticForm.baseChange` require
`[Invertible (2 : R)]`, which fails for `R = ℤ`. The polar and companion calculus and the
bilinear Gram and base-change API have no such hypothesis. This is why the roadmap states
everything through the bilinear form.

**Determinant.** The Gram matrix of `β` in a basis `b` is
`LinearMap.BilinForm.toMatrix b β`. A change of basis over `ℤ` has determinant `±1`. Gram
determinants are therefore equal, and not merely equal up to squares, so `det L : ℤ` is an
invariant. The word discriminant is reserved for the discriminant group `A_L` and the
discriminant form `q_L`.

**Signature and degeneracy.** The signature is the triple `(t₊, t₀, t₋)` over
`ℚ`: `t₊` and `t₋` are Mathlib's `sigPos` and `sigNeg` for `B.toQuadraticMap`, and `t₀`
is the dimension of `LinearMap.ker B`. They sum to the rank. The abbreviation `(t₊,t₋)`
is used only after nondegeneracy has supplied `t₀=0`; the signature index is then
`τ(L)=t₊−t₋`. Positive/negative semidefinite and indefinite are predicates in this same
vocabulary, so degenerate affine Cartan forms remain objects of the canonical carrier.

**Definiteness.** `PosDef` is `QuadraticMap.PosDef` of `B.toQuadraticMap`. `NegDef L`
means `PosDef (L(−1))`. Definite means positive definite or negative definite.
Indefinite means `t₊ > 0` and `t₋ > 0`; this condition itself implies nondegeneracy only
when `t₀=0` is separately known.

**Positive definite, not definite.** Sets of bounded norm, minima, shells and reduction
theory use the positive-definite convention. For a negative-definite form of positive rank
the sublevel `{x | β x x ≤ C}` is infinite; rank zero has a singleton carrier and is handled
separately. Fixed negative-definite shells are finite by sign reversal. A statement that is invariant under `β ⇝ −β`, such as
finiteness of the automorphism group, is proved for positive definite lattices and then
extended by that substitution. The same boundary is why Theta Series is positive definite by
construction: in positive rank a negative-definite or indefinite norm does not give the
convergent ordinary upper-half-plane theta series used there. The rank-zero series is `1`.

**Form twists, carrier dilations, and sums.** The form twist `L(a)`, Tau Ceti's
`TauCeti.IntegralLattice.scale` (written `a • L`), keeps
the carrier and replaces the form by `a • β`, so `E₈(−1)` is negative definite. This is
different from the scalar image `a • L.carrier` inside the rational ambient space. A
statement about a nondegenerate form twist assumes `a ≠ 0`, and positive definiteness assumes
`a > 0`. For nonzero integral `a`, the dual formula is the carrier identity
`dual_{aB}(L) = (a : ℚ)⁻¹ • dual_B(L)` (Tau Ceti's `TauCeti.IntegralLattice.dualCarrier_smul`), not a form
twist on the old dual carrier. The
orthogonal direct sum `L ⊕ M` carries the sum of the two forms, and its Gram matrix is the
block sum. Isometry is `LinearMap.BilinForm.Equivalent`. A class is an isometry class over
`ℤ`.

**Rational ambient space and abstract inputs.** The ambient space `V` and its rational
form `B` are part of `IntegralLattice`; they are not reconstructed independently in each
layer. For an abstract integral form the dictionary uses `V = ℚ ⊗ L` and
`B = β.baseChange ℚ`. The quotient group used by both discriminant pairings and quadratic
forms is `ℚ/ℤ = AddCircle (1 : ℚ)`.

**Dual lattice.** The dual lattice is `L^⋆ = LinearMap.BilinForm.dualSubmodule B L`.
Integrality of `β` is the statement `L ≤ L^⋆`. The discriminant group is `A_L = L^⋆/L`.

**Discriminant forms.** The discriminant bilinear form is `b_L : A_L × A_L → ℚ/ℤ`,
`b_L(x̄,ȳ)=B(x,y) mod ℤ`. For even `L` the canonical discriminant quadratic form uses the
half-norm convention
`q_L : A_L → ℚ/ℤ`, `q_L(x̄)=B(x,x)/2 mod ℤ`, so its polar is literally `b_L`.
Nikulin's equivalent full-norm convention has values in `ℚ/2ℤ`; every cited value in that
convention is divided by two at the boundary. No quadratic discriminant form is attached
to an odd lattice.

**Finite modules.** A finite bilinear module carries a symmetric biadditive
`A × A → ℚ/ℤ`; a finite quadratic module extends it with a Mathlib
`QuadraticMap ℤ A (AddCircle (1 : ℚ))` whose polar is the pairing. Nondegeneracy is a
predicate asserting that the adjoint `A → CharacterModule A` is an additive equivalence,
not a structure field. For `H ≤ A`, isotropic means the form vanishes on `H` — for a
quadratic module the vanishing form is `q` itself, not merely its polar pairing — and
Lagrangian means isotropic together with the equality `H=H^⊥`; a module with a Lagrangian
subgroup is metabolic. These carriers are also the
carriers used by the Nikulin programme; no `ℚ/2ℤ`-valued duplicate is introduced.

**Two invariants with different names.** The Gauss-sum invariant `sign q ∈ ℤ/8` of a
nondegenerate finite quadratic form is defined by
`∑_{a ∈ A} e^{2πi q(a)} = √#A · e^{2πi·sign(q)/8}`. The factor `2πi` is forced by the
half-norm codomain `ℚ/ℤ`; the factor `πi` belongs only to the full-norm `ℚ/2ℤ` convention.
It is a statement about finite quadratic
forms, and milestone 1H proves it. Milgram's theorem is the different statement that
`t₊ − t₋ ≡ sign q_L (mod 8)` for an even lattice, and milestone 1I proves it. The roadmap
does not use one name for both.

**Scale, norm ideal, level.** `𝔰(L)` is the ideal generated by the values `β x y`, and
`𝔫(L)` is the ideal generated by the values `β x x`. Then `2𝔰 ⊆ 𝔫 ⊆ 𝔰`, and `L` is even
exactly when `𝔫 ⊆ 2ℤ`. The level of a nondegenerate integral `L` is the least `N > 0` such
that `N·G⁻¹` is integral with even diagonal, for a Gram matrix `G`. For even `L` the level
is the least `N` with `N·q_L = 0`.

**Genus symbols.** The symbols are those of Conway–Sloane, SPLAG Chapter 15, in the
terminology of their mass formula paper. A symbol records the Jordan constituents at each
scale `p^i`, their ranks, and their signs `ε = (det f_q | p)`. At `p = 2` it also records
the type, which is I for odd and II for even, and the oddity, which is the trace mod 8.
Dyadic Jordan splittings are not unique, and the resulting moves on symbols are sign
walking and oddity fusion. The canonical 2-adic symbol is the corrected one of
Allcock–Gal–Mark, and not the one printed in SPLAG.

**Nikulin's notation.** `l(A)` is the least number of generators of a finite abelian group
`A`, and `l(A_q) = max_p l(A_{q_p})`. `K(q_p)` is a `p`-adic lattice of rank `l(A_{q_p})`
whose discriminant form is `q_p`. Record `v_p(det K(q_p))` together with the unit part modulo
unit squares: the integral-basis determinant class lies in `ℚ_pˣ/(ℤ_pˣ)²`, not in the unit
group unless its valuation is zero. Its image in `ℚ_pˣ/(ℚ_pˣ)²` is the rational square class.
The determinant conditions in 5B compare these data at equal valuation, so their ratio is a
unit square-class test; retain the valuation as well as that test. Such a `K(q_p)` always exists; it is unique up to isometry at odd `p`, and at
`p = 2` exactly when `q₂` has no summand `q_θ^{(2)}(2)` (Nikulin Theorem 1.9.1). In the
exceptional case there are two, whose determinants differ by the factor 5, a nonsquare in
`ℚ₂`, so `discr K(q₂)` is then not a function of `q₂`; condition 4 of 5B is switched off in
exactly that case, and 5B states the choice-independence with that exception.
The nondegenerate generating finite quadratic forms have `k ≥ 1` and `p ∤ θ`. They are
`q_θ^{(p)}(p^k)` on `ℤ/p^k`,
and `u^{(2)}(2^k)` and `v^{(2)}(2^k)` on `(ℤ/2^k)²`. They are the discriminant forms of the
`p`-adic lattices with Gram matrices `(θ p^k)`, `2^k·!![0,1;1,0]` and `2^k·!![2,1;1,2]`.
Nikulin's `E₈` is negative definite, and this roadmap's `E₈` is positive definite, so a
citation from his paper carries the twist `E₈(−1)`. The K3 lattice is
`Λ_{K3} = U³ ⊕ E₈(−1)²`, which is even unimodular of signature `(3,19)`.

**The character of `ℚ/ℤ`.** `e^{2πi·}` on `AddCircle (1 : ℚ)` is Tau Ceti's `TauCeti.expCircle`, and the factor
`2πi` is forced by the half-norm codomain of `q_L`, exactly as in the Gauss-sum invariant
above. Theta Series' character on its real model is the same character read on representatives
in a real inner product space; it is that roadmap's, and no second character is defined here.

**Theta series conventions are Theta Series'.** The exponent `π i ‖v‖² τ`, the nome
`q = e^{2πiτ}` for an even lattice, the automorphy factor `(-i)^k τ^k` in even rank `n = 2k`,
and the coefficient `(covolume L)⁻¹ = (det L)^{-1/2} = |A_L|^{-1/2}` are fixed there and are
not restated here. What this roadmap fixes, and that roadmap transports unchanged, is the
half-norm convention: `q_L(x̄) = B(x,x)/2 mod ℤ`, so that a discriminant-form value enters an
exponent with no factor of two to insert, and Nikulin's full-norm `ℚ/2ℤ` values are halved at
the boundary.

**Mass.** For a genus `G` of positive definite lattices, the full mass is
`m(G) = ∑_{cls L ∈ G} 1/|O(L)|`, and the proper mass is
`m⁺(G) = ∑_{cls⁺ L ∈ G} 1/|SO(L)|`. The normalization is that of Conway–Sloane, equation
(1) of their mass formula paper. Their sections 3 and 6 record that the formula, as usually
stated, is false in dimension at most 1, where a factor 2 becomes 1. The low rank values
are part of the statement of OTM's mass formula (the label 7H above), and 7G proves them here
independently of it.

## Exact supplier contracts

### From Mathlib

Each row is consumed by the milestones in the last column.

| Declarations | File | Consumed by |
| --- | --- | --- |
| `QuadraticMap`, `exists_companion'`, `polar`, `polarBilin`, `ofPolar`, `LinearMap.BilinMap.toQuadraticMap`, `polar_self`, `two_nsmul_associated`, `QuadraticMap.PosDef`, `Matrix.toQuadraticForm'` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` | 0A, 0B, 0E, 2A |
| `IsSymm`, `IsRefl`, `Nondegenerate`, `restrict`, `flip`, `Isometry`, `IsometryEquiv`, `Equivalent` | `Mathlib/LinearAlgebra/BilinearForm/` | 0A, 0G, 2G |
| `LinearMap.BilinForm.toMatrix`, `Matrix.toBilin`, `toMatrix_apply`, `toMatrix_mul_basis_toMatrix`, `nondegenerate_iff_det_ne_zero` | `Mathlib/LinearAlgebra/Matrix/BilinearForm.lean` | 0A, 0C |
| `LinearMap.BilinForm.baseChange`, `baseChange_tmul`, `IsSymm.baseChange` | `Mathlib/LinearAlgebra/BilinearForm/TensorProduct.lean` | 0E, 1A, 3A |
| `dualSubmodule`, `dualSubmodule_span_of_basis`, `dualSubmodule_dualSubmodule_of_basis`, `dualSubmoduleToDual` | `Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean` | 1B, 1C |
| `Submodule.basisOfPid`, `Module.Basis.SmithNormalForm`, `Submodule.smithNormalFormOfRankEq` | `Mathlib/LinearAlgebra/FreeModule/PID.lean` | 1C, 4F |
| `Submodule.natAbs_det_basis_change`, `AddSubgroup.index_eq_natAbs_det`, `AddSubgroup.relIndex_eq_natAbs_det`, `AddSubgroup.relIndex_eq_abs_det` | `Mathlib/LinearAlgebra/FreeModule/Finite/CardQuotient.lean` | 0C, 1C |
| `Submodule.quotientEquivPiZMod` | `Mathlib/LinearAlgebra/FreeModule/Finite/Quotient.lean` | 1C |
| `AddCommGroup.equiv_directSum_zmod_of_finite`, character duality | `Mathlib/GroupTheory/FiniteAbelian/Basic.lean`, `Duality.lean` | 1C, 1G |
| `AddCircle`, `AddCircle.equivAddCircle`, `equivAddCircle_apply_mk` | `Mathlib/Topology/Instances/AddCircle/Defs.lean` | 1D, 1G |
| `IsOrtho`, `iIsOrtho`, `orthogonal`, `nondegenerate_restrict_of_disjoint_orthogonal` | `Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean` | 0F, 3B |
| `IsZLattice`, `ZLattice.rank`, fundamental domains | `Mathlib/Algebra/Module/ZLattice/Basic.lean` | 2A, 2D |
| `ZLattice.covolume`, `covolume_eq_det`, `covolume_div_covolume_eq_relIndex`, `tendsto_card_div_pow` | `Mathlib/Algebra/Module/ZLattice/Covolume.lean` | 2D, 2E |
| `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` | `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean` | 2E |
| `sigPos`, `sigNeg`, `sigPos_add_sigNeg_add_radical`, `QuadraticForm.sigPos_of_equiv_weightedSumSquares`, `isometryEquivSignWeightedSumSquares` | `Mathlib/LinearAlgebra/QuadraticForm/Signature.lean`, `Real.lean` | 0E |
| `CartanMatrix.A`, `CartanMatrix.D`, `CartanMatrix.E 6`, `CartanMatrix.E 7`, `CartanMatrix.E 8` | `Mathlib/LinearAlgebra/Matrix/Cartan/Basic.lean` | 0G, 6C |
| `Matrix.PosDef`, `Matrix.PosSemidef`, congruence invariance | `Mathlib/LinearAlgebra/Matrix/PosDef.lean` | 0E |
| `ℤ_[p]`, `ℚ_[p]`, Hensel's lemma, `PadicInt.unitCoeff` | `Mathlib/NumberTheory/Padics/` | 3A |
| Gauss sums and quadratic characters | `Mathlib/NumberTheory/LegendreSymbol/GaussSum.lean` | 1H |
| `AddGroup.rank`, `AddGroup.rank_spec`, `AddGroup.rank_le` (the minimum size of a generating set; a finite group is finitely generated through `Monoid.fg_of_finite`) | `Mathlib/GroupTheory/Rank.lean`, `Mathlib/GroupTheory/Finiteness.lean` | 1G, 5B |
| `DoubleCoset.Quotient` | `Mathlib/GroupTheory/DoubleCoset.lean` | 4B |

Two limits of the Mathlib API shape this roadmap. The eigenvalue and determinant
characterizations of `Matrix.PosDef` require `RCLike`, so positivity is used over `ℚ` through the
native `isPosDef_iff` and `isPosDef_ofGramMatrix_iff`, and the real realization enters only
through the native covolume identity `covolume_range_sq_eq_determinant`. The splitting results in `BilinearForm/Orthogonal.lean` are stated
over a field, so the native splitting theorem (label 0F) proves the correct statement over `ℤ`, where the hypothesis
is unimodularity and not nondegeneracy.

### From Tau Ceti

| Declarations | Location | Consumed by |
| --- | --- | --- |
| `squareClass`, `squareClass_eq_zero_iff`, `linearIndependent_squareClass_iff` | `TauCeti/FieldTheory/SquareClassGroup.lean` | 3C, 4C |
| `orthogonalGroupToLinearIsometryEquiv` | `TauCeti/LinearAlgebra/OrthogonalGroup.lean` | 2C |
| box packing and doubling counts | `TauCeti/NumberTheory/GeometryOfNumbers/Doubling.lean` | 2E, 2G |
| `TauCeti.IntegralLattice.scale` (the `ℤ`-action `a • L`, the form twist `L(a)`), `TauCeti.IntegralLattice.dualCarrier_smul` | `TauCeti/LinearAlgebra/IntegralLattice/Scaling.lean`, `TauCeti/LinearAlgebra/IntegralLattice/Dual/Scaling.lean` | 0A, 1B, 5D |
| `TauCeti.IntegralLattice.restrictFull`, `TauCeti.IntegralLattice.restrict`, `TauCeti.IntegralLattice.restrictFullIsometry` | `TauCeti/LinearAlgebra/IntegralLattice/Restriction.lean` | 0A, B1 |
| `TauCeti.IntegralLattice.IsCharacteristicVector`, `TauCeti.IntegralLattice.isEven_iff_isCharacteristicVector_zero` | `TauCeti/LinearAlgebra/IntegralLattice/Characteristic/Basic.lean` | 1L, 6A, 6C |
| `TauCeti.expCircle`, `TauCeti.expCircle_coe` | `TauCeti/Analysis/SpecialFunctions/Complex/Circle.lean` | 1D, 1H |
| `TauCeti.FiniteQuadraticModule.IsMetabolic` | `TauCeti/LinearAlgebra/FiniteBilinearModule/Metabolic.lean` | 1G |
| `TauCeti.FiniteQuadraticModule.gaussSign`, `TauCeti.FiniteQuadraticModule.IsNondegenerate.gaussSum_eq`, `TauCeti.FiniteQuadraticModule.gaussSign_prod`, `TauCeti.FiniteQuadraticModule.gaussSign_eq_zero_of_isMetabolic` | `TauCeti/LinearAlgebra/FiniteBilinearModule/GaussSum.lean` | 1H, 1I, 5B |
| `TauCeti.IntegralLattice` with `ofSubmodule`, `ofBasis`, `ofGramMatrix`, `integralForm`, `IsNondegenerate`; `IntegralLattice.Isometry` and its group, `det`, `specialOrthogonalGroup` | `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean`, `Isometry/Basic.lean`, `Isometry/Group.lean` | 0A, 2C; every layer |
| `IsEven`, `quadraticForm`, `isEven_iff_exists_polarBilin_eq_integralForm`, `IsUnimodular` with `isUnimodular_iff_discriminant_eq_one` and `isUnimodular_iff_isUnit_gramDet` | `Even.lean`, `Quadratic.lean`, `Unimodular.lean` in `TauCeti/LinearAlgebra/IntegralLattice/` | 0A, 0B |
| `gramMatrix`, `gramDet`, `determinant`, `discriminant`, `determinant_eq_mul_relIndex_sq`, `rationalFormClass`, `discr_rationalFormClass`, `signedDiscr_rationalFormClass` | `Gram.lean`, `Index.lean`, `RationalInvariants.lean` | 0C |
| `scaleIdeal`, `normIdeal`, `isEven_iff_normIdeal_le_span_singleton_two`, `level`, `level_dvd_two_mul_determinant`, `IsEven.level_eq_addOrderOf` | `Ideals.lean`, `Level.lean` | 0D, 1J |
| `radical`, `sigPos`, `sigNull`, `sigNeg`, `signature`, `signature_sum_eq_finrank`, `IsPosDef`, `IsNegDef`, `IsIndefinite`, `isPosDef_iff_isPosSemidef_and_nondegenerate`, `radicalQuotient`, `signature_radicalQuotient` | `Signature.lean`, `RadicalQuotient.lean` | 0E |
| `orthogonalSum`, `determinant_orthogonalSum`, `orthogonalSplittingIsometry`, `unitNormSplittingIsometry`, `isCompl_orthogonal_of_restrict_bijective` | `Orthogonal/Sum.lean`, `Orthogonal/Isometry.lean`, `Orthogonal/UnitNorm.lean`, `Orthogonal/Splitting.lean` | 0F |
| `a1`, `negativeA1`, `hyperbolicPlane`, `affineA1`, `affineA1RadicalQuotientIsometry`, `rankOne`, `coordinatePower`, `typeARootLattice`, `checkerboardLattice`, `typeE₆RootLattice`, `typeE₇RootLattice`, `typeE₈RootLattice`, `d8PlusLattice`, `typeE₈IsometryD8Plus` | `Examples.lean`, `RankOne.lean`, `CoordinatePower.lean`, `RootLattice/` | 0G, 1K |
| `rationalizationIsometry`, `ofIntegralForm`, `carrierIsometry` | `Rationalization.lean` | 1A |
| `dualCarrier`, `dualPairingEquiv`, `isLattice_dualCarrier_iff_nondegenerate`, `dualCarrier_orthogonalSum` | `Dual/Basic.lean`, `Dual/Finiteness.lean`, `Discriminant/Operations.lean` | 1B |
| `DiscriminantGroup`, `finite_discriminantGroup_iff_nondegenerate`, `natCard_discriminantGroup_eq_natAbs_gramDet`, `discriminantGroupInvariantFactorsEquiv`, `discriminantPairing`, `discriminantBilinearModule`, `discriminantQuadraticMap`, `discriminantQuadraticModule`, `discriminantQuadraticIsometryOrthogonalSum` | `Discriminant/` | 1C, 1D |
| `IntermediateCarrier`, `intermediateCarrierOrderIsoDiscriminantSubgroup`, `isIntegral_iff_isIsotropic_discriminantSubgroup`, `isEven_iff_isIsotropic_discriminantSubgroup`, `IsIntegral.discriminant_mul_index_sq`, `isMetabolic_discriminantQuadraticModule_iff` | `Overlattice/` | 1E, 1F |
| `FiniteBilinearModule`, `FiniteQuadraticModule`, their isometries, `restrict`, `prod`, `primaryDecomposition`, `IsIsotropic`, `IsLagrangian`, the orthogonal quotient, and Nikulin's generator decomposition `FiniteQuadraticModule.exists_isometry_prod_pi_generators` (Proposition 1.8.1); `gaussSign_dyadicU`, `gaussSign_dyadicV`, `gaussSign_dyadicCyclic` | `TauCeti/LinearAlgebra/FiniteBilinearModule/` (`Decomposition.lean`, `Primary/`, `Orthogonal/`, `Dyadic/GaussSum.lean`) | 1G, 1H |
| `IsPosDef.finite_setOf_norm_le`, `IsPosDef.finite_vectorsOfNorm`, `IsPosDef.finite_isometry`, `vectorsOfNorm`, `representationNumber`, `minimum`, `kissingNumber`, `covolume_range_sq_eq_determinant`, `IsPosDef.minimum_le_rpow_mul_determinant_rpow`, `successiveMinimum`, `monotone_successiveMinimum`, `IsPosSemidef.exists_linearIndependent_integralNorm_eq_successiveMinimum` | `PosDef/Finite.lean`, `PosDef/RepresentationNumber.lean`, `PosDef/Minimum.lean`, `PosDef/Covolume.lean`, `PosDef/Hermite.lean`, `PosDef/SuccessiveMinima.lean` | 2A–2F |
| `TauCeti.IntegralLattice.LocalCarrier`, `TauCeti.IntegralLattice.localIntegralForm`, `TauCeti.IntegralLattice.completedRationalForm`, `TauCeti.IntegralLattice.localizationToCompletion`, `TauCeti.IntegralLattice.localizationToCompletion_injective`, `TauCeti.IntegralLattice.span_range_localizationToCompletion`, `TauCeti.IntegralLattice.completedRationalForm_localizationToCompletion` | `TauCeti/NumberTheory/IntegralLattice/Localization.lean` | 3A, 3C, N0 |
| `exists_basis_iIsOrtho_localIntegralForm`, `exists_basis_iIsOrtho_localIntegralForm_eq_unit_mul_pow` (an orthogonal basis of `L_p` at odd `p`, with entries `u·p^k`) | `TauCeti/NumberTheory/IntegralLattice/Diagonalization.lean` | 3C |
| `integralOrthogonalSubgroup`, `mem_integralOrthogonalSubgroup_iff_mem_span`, `isCompact_integralOrthogonalSubgroup`, `isOpen_integralOrthogonalSubgroup`, `integralOrthogonalSubgroup_eq_of_span_eq`, `eventually_mem_integralOrthogonalSubgroup`, `eventually_integralOrthogonalSubgroup_baseChange_eq`, `integralSpinSubgroup`, `OrthogonalCompactOpens` with `OrthogonalCompactOpens.integral` and `OrthogonalCompactOpens.specialOrthogonal`, `finiteAdelicOrthogonal`, `finiteAdelicSpecialOrthogonal`, `finiteAdelicSpin` | `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/Integral/Basic.lean`, `Integral/Spin.lean`, `Integral/CompactOpen.lean`, `CompactOpen.lean`, `FiniteAdelic.lean` | N0, 4B |
| `OrthogonalCompactOpens.localSpinorNormImage`, `isOpen_localSpinorNormImage`, `localSpinorNormImage_eq_bot_of_finrank_le_one`, `exists_localSpinorNormImage_ne_unitSquareClasses`, `eventually_localSpinorNormImage_integral_eq_unitSquareClasses`, `integralOrthogonalSubgroup_eq_closure_reflectionOrthogonal`, `map_spinorNorm_comap_integralOrthogonalSubgroup_eq_unitSquareClasses`, `adelicSpinorNorm`, `finiteAdelicSquareClasses` | `SpinorNormImage.lean`, `LowRank.lean`, `Integral/CompactOpen.lean`, `Integral/SpinorNorm.lean`, `AdelicSpinorNorm.lean` in `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/` | N1, 4C |
| `orthogonalGroup`, `spinorNorm`, `spinorNorm_reflectionPairSpecialOrthogonal`, `orthogonalGroupBaseChange`, `transvection` | `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean`, `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean`, `TauCeti/LinearAlgebra/QuadraticForm/BaseChange.lean`, `TauCeti/LinearAlgebra/QuadraticForm/Transvection/Basic.lean` | 4B, 4C, 4F, N1 |
| `RestrictedProductGroup`, `RestrictedProductGroupWithFactor`, `CompactOpenSubgroups`, `integralSubgroup`, `isCompact_integralSubgroup`, `rationalDiagonal` | `TauCeti/Topology/Algebra/RestrictedProduct/Basic.lean`, `Diagonal.lean` | 4B, B7 |
| `NumberFieldOrder`, `NumberFieldOrder.conductor`, `NumberFieldOrder.IsProperFractionalIdeal`, `NumberFieldOrder.properFractionalIdeals`, `NumberFieldOrder.invertibleProperFractionalIdeals`, `NumberFieldOrder.invertible_isProper`, `NumberFieldOrder.isProperFractionalIdeal_iff_isUnit_of_finrank_eq_two`, `IdealClassMonoid`, `NumberFieldOrder.mkIdealClassMonoid`, `Pic` (`ClassGroup` of the order), `NumberFieldOrder.mkPic`, `NumberFieldOrder.mkPic_surjective`, `NarrowPic`, `NumberFieldOrder.narrowPrincipal`, `NumberFieldOrder.narrowToPic`, `NumberFieldOrder.narrowToPic_surjective`, `finite_pic`, `card_narrowPic` | `TauCeti/NumberTheory/NumberField/Global/Orders/` (`Basic.lean`, `Conductor.lean`, `ProperIdeal.lean`, `Quadratic.lean`, `IdealClassMonoid.lean`, `Picard.lean`, `NarrowPic.lean`, `NarrowPic/Kernel.lean`, `RayClass.lean`) | B1–B5, 4E |
| `hasseInvariant`, `hilbertSymbol`, `localHasse`, `exists_of_realization`, `hilbertSymbol_eq_cohomological`, `equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq`, `atFinitePlace`, `atRealPlace`, `locallyEquivalent_iff_finrank_eq_and_discr_eq_and_finiteHasse_eq_and_realPositiveIndex_eq` | `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Hasse.lean`, `TauCeti/NumberTheory/HilbertSymbol/Basic.lean`, `TauCeti/NumberTheory/LocalField/QuadraticForm/Hasse.lean`, `Realization.lean`, `Classification.lean`, `TauCeti/FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean`, `TauCeti/NumberTheory/QuadraticForm/Global/Localization.lean`, `Classification.lean` | 0C, 3G, 3H, 5B, 6A |

The labels 0A–0G, 1A–1F, 1J, 1K and 2A–2E name the native declarations in the rows above:
the archived foundation roadmap and Tau Ceti own them, they are not targets here, and a later
prerequisite row that cites one of these labels cites Tau Ceti. Two comparisons are not native
and stay targets of this roadmap: the equality of the native `successiveMinimum` with the
real-length minima of the realization in `ℝⁿ` is not needed by any milestone and is not stated,
and Minkowski's second theorem is 2F below. 3A starts
from `TauCeti.IntegralLattice.localIntegralForm` and `TauCeti.IntegralLattice.localizationToCompletion`
rather than from a second localization map, the odd-prime splitting of 3C is stated on the
native local form, the restriction constructors of 0A are `TauCeti.IntegralLattice.restrictFull` and
`TauCeti.IntegralLattice.restrict` with comparison `TauCeti.IntegralLattice.restrictFullIsometry`, and the
characteristic-vector calculus of 1L, the metabolic predicate of 1G and the Gauss-sum invariant
of 1H with its additivity and metabolic vanishing are the native declarations listed.

### From other roadmaps

Each row fixes an owner and, where one exists, the exact Lean declaration consumed. A
README-only supplier milestone stays a milestone here; `Suggested.lean` does not fabricate a
structure or carrier for it.

| Consumer milestones | Supplier | Exact declaration or milestone | Contract |
| --- | --- | --- | --- |
| 3G | Quadratic Form Invariants | `hilbertSymbol_productFormula` | Hilbert reciprocity on the classical symbols; the symbol itself and its comparison with the cohomological pairing are native |
| 3H, 4B, 5B, 6A | Global Quadratic Forms | `hasseMinkowski_equivalent`, `equivalent_of_locallyEquivalent` | global equivalence of rational quadratic spaces from local equivalence; the localizations and the local classification at the places are native |
| B2--B5, `¬ IsSquare Δ` | Global Number Fields | `picEquivUnitsIdealClassMonoid`, `finite_narrowPic` | the unit classes of the ideal class monoid are `Pic`, and the narrow Picard group is finite; the orders, conductors, proper and invertible ideals, the monoid, `Pic` and `NarrowPic` with their quotient maps, and `finite_pic` are native. Only the invertible proper carrier enters `Pic` and `NarrowPic`, while raw noninvertible proper ideals remain in `IdealClassMonoid`; the square-discriminant split branch is elementary and does not use these carriers |
| B3, `Δ < 0` | Class Field Theory | `ringClassField`, `ringClassArtinMap`, `gal_ringClassField_equiv_pic` | the class-field interpretation in the nonsplit field case only. ⚠ Each of these takes an order in a number **field** together with `Module.finrank ℚ K = 2`, so the split algebra `ℚ × ℚ` cannot be supplied to any of them: it carries no `Field` instance and is the `K` of no `NumberFieldOrder K`. There is no split ring-class-field claim |
| 3G | Class Field Theory | `hilbertProductFormula` | cohomological Hilbert reciprocity, reached on classical symbols through QFI's comparison |
| B7 | Restricted Products | Layers 1–3 | the generic restricted products, compact open reference families and rational diagonals are native (§*From Tau Ceti*); Restricted Products is cited for its change-of-family and away-`S` statements. ⚠ Quotient measures and Tamagawa normalization are **not** exported by Restricted Products and are not cited here; they belong to `TamagawaMeasures` and reach the lattice mass only through `OrthogonalTamagawaAndLatticeMass` |
| 4B, 4C, 4F, B7 | Orthogonal and Spin Groups | 0C, 2C, 2F; `orthogonalBaseChangeReal`, `spinorNorm_reflection`, `transvectionLiftHom` | the bilinear/quadratic dictionary, the real base change, the spinor norm of a single reflection and the transvection homomorphism; the groups, the spinor norm of a pair of reflections, the `p`-adic base change, the compact-open families and the finite adelic groups are native (§*From Tau Ceti*). ⚠ `strongApproximation_finiteAdelicSpin` and the orthogonal volume theorem are **not** exports of Orthogonal and Spin Groups and are not cited; its README states that only `OrthogonalTamagawaAndLatticeMass` may export them |
| 6C, 6G | Root Systems | Layer 5 ADE classification and `Nat.card P.weylGroup` | the rank-eight root system with the `E8` Cartan matrix is of type `E8` |

`ThetaSeries` and `LFunctions` are **not** dependencies of this roadmap, and neither has a row
above. Theta Series is a consumer: its `Suggested.lean` imports the native Tau Ceti carrier,
discriminant-form, orthogonal-sum, overlattice and root-lattice modules, it takes the results of
Layers 1, 5 and 6 named in Layer 8 across its own bridge, and nothing comes back. L-functions owns the number-field theta kernel of an ideal lattice in the
mixed space, its Mellin transform and the resulting functional equations, and it consumes
generic lattice Poisson summation from Theta Series. No milestone here consumes anything from
either roadmap, and `Suggested.lean` imports neither and `#check`s no declaration of either.
The dependency graph through this roadmap is a chain, not a cycle:

```text
IntegralLattices -> ThetaSeries -> LFunctions
```

Nothing is defined twice: the real-model carrier and the bridge between the two models are
Theta Series', the rational carrier and its discriminant-form invariants are Tau Ceti's native foundation,
and §*Scope and ownership*, §*Theta series* and Layer 8 record what crosses the boundary and in which
direction.

---

## How to read the build

Each layer states its milestones with a label, such as `3E`. Other roadmaps and the tables
below cite these labels. One layer carries a letter instead of a number: Layer B holds the
binary theory, and its milestones are `B1` to `B8`. Each layer ends with its Examples and a
Dependencies table of direct prerequisites. Every prerequisite has one of four kinds:

- **M**: a declaration that exists in Mathlib.
- **T**: a declaration that exists in Tau Ceti.
- **L**: an earlier milestone of this roadmap.
- **R**: a prerequisite from another roadmap. Where that roadmap has fixed a Lean name, the
  row names the **declaration**, and §*From other roadmaps* carries its type; a subject is
  then never a prerequisite, so "the Picard group of an order" is not one and `Pic` is. Where the
  supplier has fixed a milestone but no name, the row cites the layer, and the supplier table
  gives the provisional name marked with an asterisk.

No prerequisite has any other kind. A Mathlib pull request, an external repository, a
branch, and a future Mathlib version are all excluded.

Layer 0 is the native foundation and has no targets. Layer 1 completes the finite quadratic
forms (relations, Gauss-sum values) and proves Milgram's theorem and van der Blij's congruence.
Layer 2 proves Minkowski's second theorem and reduction finiteness. Layer 3 localizes, builds
Jordan splittings over local integers, the genus and its symbols, and the dyadic exponents.
Layer B is the binary theory through quadratic orders. Layer 4 builds the class, genus and
spinor-genus interfaces that OTM's Eichler theorem consumes. Layer 5 is Nikulin's existence
theory. Layer 6 classifies unimodular lattices in low rank and in the indefinite case. Layer 7
supplies the masses, local densities and real volumes from which OTM assembles the mass formula.
Layer 8 records what Theta Series takes, and Layer 9 proves completeness of a list of classes
from the mass.


## Layer 0: the native foundation

Layer 0 has no targets. Tau Ceti implements the carrier `IntegralLattice` with its predicates,
isometries and the isometry group; the even/quadratic dictionary; Gram matrices, determinants and
the index formula `det L' = [L : L']²·det L`; the rational square-class invariants; scale and norm
ideals and the level; radical, signature and the radical quotient; orthogonal sums and the
unimodular splitting; and the standard examples `⟨a⟩`, `U`, `A₁(−1)`, affine `Ã₁` and the
root lattices. The rows of §*From Tau Ceti* name each declaration and file, under the
labels 0A–0G that later prerequisite rows cite.

Layer 0 has no targets of its own; the failure of cancellation over `ℤ`, which shows that the
native splitting theorem needs unimodularity of the summand, is 6H.

### Examples

`⟨1⟩ ⊕ ⟨−1⟩` and `U` are both unimodular of signature `(1, 1)` and are not isometric, because
`U` is even and `⟨1⟩ ⊕ ⟨−1⟩` is odd; after adding `⟨1⟩` both become `I_{2,1}`, a second
cancellation failure, of parity.

### Dependencies

Layer 0 has no milestones; every row of §*From Tau Ceti* labelled 0A–0G is consumed
as stated there.

## Layer 1: finite quadratic forms, the Gauss-sum invariant, and signature mod 8

The dual lattice, the discriminant group with `#A_L = |det L|` and its invariant factors, the
discriminant pairing `b_L` and the half-norm form `q_L`, the integral and even overlattice
correspondences with the orthogonal-quotient formula, the level, the rank-one discriminant forms,
the ADE root lattices and the `D₈⁺ ≅ E₈` isometry are native (labels 1A–1F, 1J, 1K in
§*From Tau Ceti*). So is Nikulin's generator decomposition, Proposition 1.8.1:
`FiniteQuadraticModule.exists_isometry_prod_pi_generators` writes every nondegenerate finite
quadratic module as an orthogonal sum of `q_θ^{(p)}(p^k)`, `q_θ^{(2)}(2^k)`, `u^{(2)}(2^k)` and
`v^{(2)}(2^k)`.

**1G. Relations among the generators and the length `l(A)`.** Nikulin's `l(A)`, the least number
of generators of a finite abelian group, is Mathlib's `AddGroup.rank`, defined for every finitely
generated group and so for every finite one; prove `l(A_q) = max_p l(A_{q_p})` over the primary
components. Prove Nikulin's relations among the generators for nondegenerate forms (Nikulin
Proposition 1.8.2): the eleven identities between orthogonal sums of `q_θ^{(p)}(p^k)`,
`q_θ^{(2)}(2^k)`, `u^{(2)}(2^k)` and `v^{(2)}(2^k)`, each an isometry to be constructed. Nikulin
states them as a calculation and does not claim that they generate all relations, and this roadmap
claims it nowhere: a generator list is not an invariant of the module. The classification of
nondegenerate finite quadratic forms is reached in two steps. First the bilinear forms: a
nondegenerate symmetric pairing on a finite abelian `p`-group is, at odd `p`, the orthogonal sum
over `k` of the pairings `b_θ^{(p)}(p^k)` on homogeneous summands `(ℤ/p^k)^{n_k}`, classified by
the ranks `n_k` and the unit determinant classes `θ ∈ ℤ_pˣ/(ℤ_pˣ)²` of the homogeneous pieces, the
same invariants as 3C's unimodular `ℤ_p`-lattices scaled by `p^k`; at `p = 2` the classification of
nondegenerate symmetric pairings on finite `2`-groups is Kawauchi–Kojima's (*Algebraic
classification of linking pairings on 3-manifolds*, Math. Ann. 253 (1980) 29–42, uncertified),
and both are targets of this milestone. Second, Theorem 1.11.3 of 1H: a nondegenerate quadratic
form is determined by its bilinear form together with `sign q mod 8`, and at odd `p` by the
bilinear form alone. Record a decomposition as a list of admissible generators with an actual
isometry (`FiniteQuadraticModule.NikulinDecomposition`, over the labels `NikulinGenerator` with
`NikulinGenerator.IsAdmissible`, their modules `NikulinGenerator.toFiniteQuadraticModule`, the
determinants `NikulinGenerator.realizationDet` of their minimal `p`-adic realizations, and the
orthogonal sum `orthogonalSumNikulinGenerators`); the native existence theorem produces one.
*Needs:* native generator decomposition and primary decomposition; Mathlib `AddGroup.rank`,
`AddCommGroup.equiv_directSum_zmod_of_finite`; 1H for the second step.

**Checks.**

- `l` of `(ℤ/2)² ⊕ ℤ/3` is 2, attained at `p = 2`; the maximum over primes and not the sum
  (which would give 3) is the convention, and `AddGroup.rank` gives `0`, `1`, `2` on `0`, `ℤ/6`
  and `(ℤ/2)²`.
- The pairing `b_1^{(3)}(3) ⊕ b_1^{(3)}(3)` and `b_2^{(3)}(3) ⊕ b_2^{(3)}(3)` on `(ℤ/3)²` are
  isometric (determinants `1` and `4` are both squares mod 3) while `b_1^{(3)}(3)` and
  `b_2^{(3)}(3)` are not (`(2|3) = −1`): at odd `p` the rank and the determinant class of each
  homogeneous summand, not the list of `θ`'s, are the invariants.
- `q_1^{(2)}(2) ≅ q_5^{(2)}(2)`: both are `ℤ/2` with half-norm value `1/4 = 5/4` in `ℚ/ℤ`, so a
  classification that distinguishes generators by the integer `θ` instead of `θ` modulo the
  relation is wrong.
- `u^{(2)}(2)` and `v^{(2)}(2)` live on the same group `(ℤ/2)²` with the same pairing type but
  are not isometric: `u` takes the half-norm values `0, 0, 1/2` on its three nonzero elements and
  `v` takes `1/2, 1/2, 1/2`, so their Gauss sums are `2` and `−2` and their invariants `0` and `4`.
  Yet `u^{(2)}(2) ⊕ u^{(2)}(2) ≅ v^{(2)}(2) ⊕ v^{(2)}(2)` (both Gauss sums `4`), one of the
  relations of Proposition 1.8.2: the generator list of a module is not unique, so the
  decomposition alone is not a classification.

**1H. The Gauss-sum invariant on the generators.** For nondegenerate `(A, q)` the native
`gaussSign` is defined by `∑_{a ∈ A} e^{2πi q(a)} = √#A · e^{2πi·sign(q)/8}`, additive over
orthogonal sums and zero on metabolic modules. Its dyadic values `sign u^{(2)}(2^k) = 0`,
`sign v^{(2)}(2^k) ≡ 4k` and the dyadic cyclic value are native. Prove the odd-prime value
`sign q_θ^{(p)}(p^k) ≡ k²(1 − p) + 4kη (mod 8)`, where `(θ|p) = (−1)^η` (Nikulin Proposition
1.11.2), and Nikulin Theorem 1.11.3 (`FiniteQuadraticModule.nonempty_isometry_iff_gaussSign_eq`):
two nondegenerate finite quadratic forms with isometric bilinear forms are isometric exactly
when their invariants agree mod 8; with the classification of the bilinear forms in 1G this
classifies nondegenerate finite quadratic forms. The converse of metabolic
vanishing is false, and the Witt group that repairs it is `FiniteQuadraticModuleWittTheory`'s
(§*Scope and ownership*). *Needs:* native `gaussSign`, `IsNondegenerate.gaussSum_eq`,
`gaussSign_prod`; Mathlib quadratic Gauss sums; 1G.

**Checks.**

- Tau Ceti's `oddCyclic 3 _ θ` has `b(1,1) = θ/3` and `q(1) = 2θ/3`. For `θ = 1`, the Gauss sum is
  `1 + 2e(2/3) = −i√3 = √3·e(−2/8)`, so `sign = 6`, and the formula gives `k²(1 − p) + 4kη =
  −2 + 0 ≡ 6` with `(1|3) = 1`. For `θ = 2`, `q(1) = 1/3`, the Gauss sum is `i√3` and
  `sign = 2 = −2 + 4` with `(2|3) = −1`. This module is the discriminant form of `A₂`, whose
  signature is 2, so the check also pins Milgram's sign.
- `q_θ^{(5)}(5)` with `(θ|5) = −1`: `sign ≡ 1·(−4) + 4 = 0`, yet the order 5 is not a square, so
  the module is not metabolic; the converse of metabolic vanishing fails.
- The discriminant form of `A₁ ⊕ A₁`: `(ℤ/2)²` with `q = 1/4` on both generators has Gauss sum
  `(1 + i)² = 2i`, so `sign = 2`; the glue subgroup has `H = H^⊥` and `b|_H = 0` but `q = 1/2` on
  it, so a Lagrangian notion read on `b` alone would contradict metabolic vanishing.

**1I. Milgram's theorem.** For an even nondegenerate lattice, `t₊ − t₋ ≡ sign q_L (mod 8)`
(`milgram`, stated with the native `gaussSign` of `discriminantQuadraticModule`; Nikulin Theorem
1.3.3; Milnor–Husemoller, Appendix 4). An even unimodular lattice has `A_L = 0`, so
`8 ∣ t₊ − t₋`. *Needs:* native signature and discriminant quadratic module; 1H.

**Checks.**

- `⟨2⟩`: `A = ℤ/2`, `q = 1/4`, Gauss sum `1 + i = √2·e^{2πi/8}`, `sign = 1 = t₊ − t₋`.
- `⟨−2⟩`: `q = −1/4`, Gauss sum `1 − i`, `sign = −1 = t₊ − t₋`; a statement that drops the sign
  of the form gives `+1` and fails here.
- `⟨1⟩` is unimodular and odd with `t₊ − t₋ = 1`, so evenness is needed for `8 ∣ t₊ − t₋`.

**1L. Van der Blij's congruence.** Characteristic vectors and their calculus, existence for
unimodular lattices, the single coset modulo `2L` and the invariance of `β(w,w) mod 8` are native
(`IsCharacteristicVector`, `IsUnimodular.exists_isCharacteristicVector`,
`IsUnimodular.characteristicVector_integralNorm_modEq`). The target is **van der Blij's theorem**
(`vanDerBlij`): for a nondegenerate unimodular lattice and any characteristic `w`,
`t₊ − t₋ ≡ β(w,w) (mod 8)` (van der Blij 1959; Milnor–Husemoller, Appendix 4). At `w = 0` it
recovers the corollary of 1I for even unimodular lattices. *Needs:* the native characteristic
calculus; either 1I applied to the even sublattice, or the odd classification of 6A applied to
`L ⊕ ⟨1⟩ ⊕ ⟨−1⟩` as in the 6A construction below.

**Checks.**

- `⟨1⟩`: the characteristic vectors are the odd integers and `w² ≡ 1 = t₊ − t₋ (mod 8)`.
- `⟨2⟩`: every vector is characteristic, `t₊ − t₋ = 1` and every `β(w,w) = 2k²` is even, so the
  statement with nondegeneracy in place of unimodularity is false.
- `E₈`: `w = 0` is characteristic and `t₊ − t₋ = 8 ≡ 0`; `I₈`: `w = (1,…,1)` has `w² = 8 ≡ 0`,
  again `t₊ − t₋ = 8`.

### Examples

`A₂`: `A ≅ ℤ/3` with `q = 1/3`, `sign = 2 = t₊ − t₋`. `E₈ ⊕ ⟨1⟩`: unimodular, odd, characteristic
vector `(0, 1)` of norm 1, signature 9 ≡ 1.

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| 1G | T `FiniteQuadraticModule.exists_isometry_prod_pi_generators`, `primaryDecomposition`; M `AddGroup.rank`, `AddCommGroup.equiv_directSum_zmod_of_finite`; L 1H for the quadratic step |
| 1H | T `gaussSign`, `IsNondegenerate.gaussSum_eq`, `gaussSign_prod`, `gaussSign_dyadicU`, `gaussSign_dyadicV`, `gaussSign_dyadicCyclic`; M Gauss sums and quadratic characters; L 1G |
| 1I | T `signature`, `discriminantQuadraticModule`; L 1H |
| 1L | T `IsCharacteristicVector`, `IsUnimodular.characteristicVector_integralNorm_modEq`; L 1I or 6A odd |

## Layer 2: Minkowski's second theorem and reduction

Bounded-norm finiteness, shells, representation numbers, minimum and kissing number, finiteness
of `O(L)` for definite `L`, the covolume identity `covolume(L)² = det L` and Hermite's inequality
`min L ≤ (4/3)^{(n−1)/2} (det L)^{1/n}` are native (labels 2A–2E). So are the squared-norm
successive minima `successiveMinimum`, their monotonicity and simultaneous attainment by linearly
independent vectors.

**2F. Minkowski's second theorem.** For positive definite `L` of rank `n ≥ 1` with native
successive minima `λ₁ ≤ … ≤ λₙ` (values of `β x x`), prove

    vol(Bₙ) · ∏_i λ_i^{1/2} ≤ 2ⁿ · (det L)^{1/2},

where `vol(Bₙ) = π^{n/2}/Γ(n/2 + 1)` is the volume of the Euclidean unit ball and
`(det L)^{1/2}` is the covolume of the real realization
(`IntegralLattice.IsPosDef.volume_ball_mul_prod_sqrt_successiveMinimum_le`; Cassels, *An
Introduction to the Geometry of Numbers*, Chapter VIII, uncertified). Minkowski's first bound
`vol(Bₙ)·(min L)^{n/2} ≤ 2ⁿ (det L)^{1/2}` is the case read off `λ_i ≥ λ₁`. *Needs:* native
`successiveMinimum`, `covolume_range_sq_eq_determinant`; Mathlib
`exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`, `InnerProductSpace.volume_ball`.

**Checks.**

- `⟨a⟩`, `n = 1`: `λ₁ = a`, `vol(B₁) = 2`, and `2√a ≤ 2√a` holds with equality; a version with
  `λ_i` read as lengths squared twice (`∏ λ_i`) would give `2a ≤ 2√a`, false for `a ≥ 2`.
- `ℤ²`: `λ = (1, 1)`, `π ≤ 4`; `diag(1, 4)`: `λ = (1, 4)`, `π·2 ≤ 4·2`.
- `A₂`: `λ = (2, 2)`, `2π ≈ 6.28 ≤ 4√3 ≈ 6.93`. The lattice `2ℤ⁵ + ℤ(1,…,1)` (determinant
  `4⁵/2² = 256`) has every `λ_i = 4`, attained only by `±2e_i`, which span a sublattice of index 2:
  vectors attaining the successive minima need not form a basis, and 2F claims no basis; the
  inequality reads `(8π²/15)·32 ≈ 168 ≤ 32·16 = 512`.

**2G. Reduction and finiteness of classes.** Minkowski-reduced bases exist. A reduced Gram
matrix of given rank and determinant has entries bounded explicitly in terms of the rank and the
determinant. There are therefore finitely many isometry classes of positive definite lattices of
a given rank and determinant (`finite_classes_of_posDef`; O'Meara 103:4 in the definite case).
This is the positive definite branch of class-number finiteness. *Needs:* native
`IsPosDef.finite_setOf_norm_le`, `successiveMinimum`, Hermite's inequality.

**Checks.**

- Rank 1, determinant `d > 0`: exactly one class `⟨d⟩`; determinant `d ≤ 0` has none.
- Rank 2, determinant 3: the reduced Gram matrices `[a, b; b, c]` with `|2b| ≤ a ≤ c` and
  `ac − b² = 3` are `[1,0;0,3]` and `[2,±1;±1,2]`, so there are two classes. Without definiteness
  no entry bound holds within a class: `[0,1;1,2k]` is a Gram matrix of `U` for every `k` (basis
  `e₁, e₂ + k e₁`), so the reduction argument has no indefinite analogue.
- Rank 8, determinant 1: the classes are `I₈` and `E₈` (6C), so the finite set has two elements.

### Examples

`E₈`: successive minima all 2, `vol(B₈) = π⁴/24`, and `π⁴/24·16 ≈ 64.9 ≤ 256`. `U` is indefinite,
so neither 2F nor 2G applies to it.

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| 2F | T `successiveMinimum`, `covolume_range_sq_eq_determinant`; M `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`, `InnerProductSpace.volume_ball` |
| 2G | T `IsPosDef.finite_setOf_norm_le`, `IsPosDef.minimum_le_rpow_mul_determinant_rpow`; L 2F |

## Layer 3: localization, Jordan splittings, the genus, and the dyadic density data

**3A. The embedded-to-local bridge.** First restrict the accepted rational form to an
actual integral form
`L.integralForm : LinearMap.BilinForm ℤ L.carrier`, characterized by
`((L.integralForm x y : ℤ) : ℚ) = L.form x y`. Then form the integral localization

```text
L_p = ℤ_p ⊗[ℤ] L.carrier,
B_{L,p} = L.integralForm.baseChange ℤ_p.
```

Independently form the completed rational quadratic space

```text
V_p = ℚ_p ⊗[ℚ] V,
B_{V,p} = L.form.baseChange ℚ_p.
```

The canonical `ℤ_p`-linear map `L_p → V_p`, its injectivity, its fullness after extension to
`ℚ_p`, the statement that `B_{L,p}` is the restriction of `B_{V,p}`, the Gram-matrix comparison
and naturality in isometries are Tau Ceti's (`TauCeti.IntegralLattice.LocalCarrier`,
`TauCeti.IntegralLattice.localIntegralForm`, `TauCeti.IntegralLattice.completedRationalForm`,
`TauCeti.IntegralLattice.localizationToCompletion` and its theorems), and every later local statement is made on
those declarations. Prove compatibility with direct sums, form twists, carrier dilations, duality, and isometries.
The integral `ℤ_p`-lattice carries scale, norm, Jordan, and integral-duality data; the
rational `ℚ_p`-space carries dimension, determinant square class, Hasse invariant, and
Witt data. No statement silently passes between these two objects. The construction works
at `p = 2` as well: bilinear-form base change needs no inverse of 2. The splitting result
0F holds over `ℤ_p`, and it is stronger there: a unimodular summand of maximal scale
splits off.

**3B. Lattices over local integers, and Jordan splittings.** Let `K` be a finite extension of
`ℚ_p`, for any prime `p`, with valuation ring `𝒪`, uniformizer `π` and residue field of
cardinality `f`. An **`𝒪`-lattice** is a finite free `𝒪`-module `M` with a symmetric bilinear
form `B : LinearMap.BilinForm 𝒪 M` whose base change to `K` is nondegenerate (Mathlib
`Module.Free`, `Module.Finite`, `LinearMap.BilinForm.IsSymm`, `LinearMap.BilinForm.baseChange`
and `Nondegenerate`). Define its scale `𝔰(M)`, the ideal generated by all `B(x, y)`; its norm
`𝔫(M)`, the ideal generated by all `B(x, x)`, with `2𝔰(M) ⊆ 𝔫(M) ⊆ 𝔰(M)`; its dual
`M^# = {x ∈ K ⊗ M : B(x, M) ⊆ 𝒪}` (Mathlib `LinearMap.BilinForm.dualSubmodule` over `K`); and
call `M` **`π^i`-modular** when `M^# = π^{−i}M`. For `𝒪 = ℤ_p` and `M = L_p` these are the native
local carrier of 3A and its scale and norm. Prove:

- every `𝒪`-lattice is an orthogonal sum `⊕_i L_i` with `L_i` a `π^i`-modular lattice of rank
  `n_i` (a Jordan splitting), and the rescaling `M_i = L_i(π^{−i})` is unimodular
  (O'Meara 91:9);
- the ranks `n_i` and scales `π^i` of the constituents of any two Jordan splittings agree
  (O'Meara 91:9);
- for `p = 2` and `K/ℚ₂` unramified, the norm ideals `𝔫(L_i)`, hence the parity types of 3I, also
  agree (O'Meara 93:28 and 93:29).

**Checks.**

- `𝒪 = ℤ₂[ζ₃]`, the integers of the unramified quadratic extension, with `f = 4`, and `M = 𝒪`
  with Gram `[2]`: rank 1, `𝔰 = 𝔫 = 2𝒪`, a single `2`-modular constituent with unimodular rescaling
  `⟨1⟩`. Restriction of scalars to `ℤ₂` gives a rank-2 lattice and is not this object.
- `U` over `ℤ₂`: unimodular, `𝔰 = ℤ₂`, `𝔫 = 2ℤ₂`; a single constituent at `i = 0`, not split
  further, because `U` has no orthogonal basis over `ℤ₂`.
- `⟨1⟩ ⊕ ⟨3⟩` and `⟨5⟩ ⊕ ⟨7⟩` over `ℤ₂` are isometric (both odd unimodular of rank 2,
  determinants `3` and `35 ≡ 3 (mod 8)` in one square class, characteristic-vector norms
  `1 + 3 = 4` and `5 + 7 = 12 ≡ 4 (mod 8)`),
  so the diagonal entries of a dyadic Jordan constituent are not invariants while its rank, scale
  and norm are.

**3C. Odd `p`.** Let `p` be odd. The localized integral form of a lattice has an orthogonal
basis, and for nondegenerate `L` each diagonal entry is a unit times a power of `p`; both are
native (`exists_basis_iIsOrtho_localIntegralForm`,
`exists_basis_iIsOrtho_localIntegralForm_eq_unit_mul_pow`), and grouping the basis vectors by
their exponent is the Jordan splitting of 3B at odd `p` on the native carrier, with diagonal
constituents. The targets: a unimodular `ℤ_p`-lattice is determined up to isometry by its rank and
the square class of its unit determinant in `ℤ_pˣ/(ℤ_pˣ)²` (O'Meara 92:1 and 92:1a), so there are
exactly two of each positive rank and one of rank 0; the Jordan invariants, the ranks, scales and
unit determinant classes of the constituents, are unique (O'Meara 91:9); and two lattices over
`ℤ_p` are isometric exactly when their Jordan data agree. *Needs:* 3B; T the native
diagonalization, `squareClass`; M `PadicInt.unitCoeff`.

**Checks.**

- `p = 3`, rank 1: `⟨1⟩` and `⟨2⟩` are the two unimodular classes, because `2` is not a square mod
  3, and `⟨4⟩ ≅ ⟨1⟩`; in rank 0 there is one class, of determinant 1.
- `A₂` at `p = 3`: in the basis `e₁`, `e₁ + 2e₂` the form is diagonal with norms `2` and
  `2 − 4 + 8 = 6` (`β(e₁, e₁ + 2e₂) = 2 − 2 = 0`), so the Jordan splitting is `⟨2⟩ ⊕ ⟨6⟩`, with
  constituents of scales `1` and `3` and unit determinants `2` and `2`; a splitting `⟨1⟩ ⊕ ⟨3⟩`
  would have determinant class `3 ≠ 3·4 = 12` and is wrong.
- `U` at `p = 3`: the basis `e₁ + e₂`, `e₁ − e₂` is orthogonal with norms `2` and `−2`, so
  `U ≅ ⟨2⟩ ⊕ ⟨−2⟩ ≅ ⟨1⟩ ⊕ ⟨−1⟩` (rank 2, determinant class `−4 = −1·2²`); the isotropic `U` and
  the anisotropic `⟨1⟩ ⊕ ⟨−3⟩` have determinant classes `−1` and `−3`, different modulo squares,
  and are not isometric.

**3D. The dyadic case.** Over `ℤ_2` an orthogonal basis need not exist: the hyperbolic
plane `U` is not diagonalizable. Jordan splittings exist by 3B but are not unique, and the
invariants of a lattice are, for each constituent, its scale, rank and type, together with the
norm groups and weights of O'Meara's fundamental invariants (O'Meara §93, 93:28 and 93:29; the
unimodular case is 93:16). The order of work is: the unimodular classification first, then the
general dyadic classification. *Needs:* 3B; the scale and norm ideals of 0D.

**Checks.**

- `U` over `ℤ₂`: every vector `(a, b)` has norm `2ab`, even, while `det U = −1` is a unit, so no
  orthogonal basis exists, since a diagonal unimodular lattice has a unit on its diagonal.
- `⟨1⟩ ⊕ ⟨4⟩` over `ℤ₂`: the basis `e₁ + e₂`, `−4e₁ + e₂` is orthogonal (`−4 + 4 = 0`) with norms
  `5` and `20`, so `⟨1⟩ ⊕ ⟨4⟩ ≅ ⟨5⟩ ⊕ ⟨20⟩`. The constituents at scales `1` and `4` have unit
  determinants `1` and `5`, which differ in `ℤ₂ˣ/(ℤ₂ˣ)²` because unit squares are `≡ 1 (mod 8)`:
  unlike odd `p`, the unit determinant class of a constituent is not an invariant, while the ranks
  `1, 1`, the scales `1, 4` and the types I, I are.
- `⟨2⟩ ⊕ ⟨−2⟩` and `U(2)`: both of scale `2`, rank 2 and determinant `−4`, with norm ideals `2ℤ₂`
  and `4ℤ₂`, so of types I and II; they are not isometric, since every norm in `U(2)` is divisible
  by 4, and a classification that forgot the type would merge them.

**3E. Conway–Sloane 2-adic symbols.** The symbol of a dyadic lattice, with the scale, rank,
sign, type and oddity of each constituent, and with compartments and trains (Conway–Sloane,
SPLAG Chapter 15, §7). The theorem is that two symbols describe isometric lattices exactly when
sign walking and oddity fusion relate them, and the canonical form is the corrected one of
Allcock–Gal–Mark (Theorem 5.1 there, which proves the canonical symbol a complete invariant).
*Needs:* 3D; 0D.

**Checks.**

- `U` at 2: `1_{II}^{+2}`, since `det U = −1 ≡ 7 (mod 8)` has sign `+`; `E₈`: `1_{II}^{+8}`;
  `I₈`: `1_0^{+8}`, of oddity `8 ≡ 0`.
- Sign walking: `⟨1⟩ ⊕ ⟨4⟩ ≅ ⟨5⟩ ⊕ ⟨20⟩` (3D) has the two symbols `1_1^{+1} 4_1^{+1}` and
  `1_5^{−1} 4_5^{−1}`: both signs change and both oddities shift by 4, with total oddity `2` in
  each; a canonical form that compared the constituents one at a time would separate them.
- Oddity fusion: `⟨1⟩ ⊕ ⟨3⟩ ≅ ⟨5⟩ ⊕ ⟨7⟩` (3B) has the single symbol `1_4^{−2}`, from the
  determinants `3` and `35 ≡ 3 (mod 8)` of sign `−` and the oddities `1 + 3 = 4` and
  `5 + 7 = 12 ≡ 4`.

**3F. The genus.** `gen L = gen M` when `L_p ≅ M_p` for every `p` and the real signatures
agree (O'Meara §102A). For nondegenerate integral lattices, a finite test first compares the
global rank, ordinary determinant and real signature. Once these agree, only the primes dividing
`2 det L` need a further local comparison: outside that set both lattices are unimodular,
with the same rank and determinant square class, so 3C makes them isometric. Thus the finite
symbol records the global compatibility data as well as the local isometry classes at those
primes. Without the determinant check the finite test is false: `⟨1⟩` and `⟨17⟩` have the
same signature and are isometric over `ℤ₂`, but fail the local test at `17`. *Needs:* 0E, 3C, 3D.

**Checks.**

- `⟨1⟩` and `⟨17⟩`: isometric over `ℤ₂` (`17 ≡ 1 (mod 8)` is a square), of equal signature, with
  determinants `1 ≠ 17`; over `ℤ₁₇` the first is unimodular and the second has scale `17`.
- `⟨1⟩ ⊕ ⟨5⟩` and `!![2,1;1,3]`: rank 2, determinant 5 and signature `(2, 0)` agree, so the test
  continues at `p = 2` and `p = 5`; over `ℤ₅` the second is `⟨2⟩ ⊕ ⟨10⟩` in the basis `e₁`,
  `e₁ − 2e₂` (`2 − 2 = 0`, norm `2 − 4 + 12 = 10`), with unit part `2` against `1`, and
  `(2|5) = −1`, so the two genera differ.
- Rank 0: one genus and one class; a test that demanded a prime to compare would have none.

**3G. Genus symbols and their constraints.** The genus symbol is the family of `p`-adic
symbols for `p ∣ 2·det L`, and it determines the genus. Its well-formedness conditions are
the compatibilities of rank, determinant and oddity, together with the oddity formula
`signature + ∑_{p odd} p-excess ≡ oddity (mod 8)`, where the `p`-excess of a constituent
`q^{εn}` is `n(q − 1) + 4k` with `k = 1` exactly when `q` is not a square and `ε = −`, and the
sign product conditions (Conway–Sloane, SPLAG Chapter 15, §7). Those two are proved from the
Hilbert product formula, on the native `hilbertSymbol`. The resulting conditions on symbols are
decidable. *Needs:* 3E, 3F; T `hilbertSymbol`; R Class Field Theory `hilbertProductFormula`; R
Quadratic Form Invariants `hilbertSymbol_productFormula`.

**Checks.**

- `⟨1⟩`: the 2-adic symbol is `1_1^{+1}` and there is no odd constituent, so `1 + 0 ≡ 1`, the
  oddity; `U`: `1_{II}^{+2}` with signature `0` and oddity `0`.
- `⟨3⟩`: `1_3^{−1}` at 2 and `3^{+1}` at 3, whose 3-excess is `1·(3 − 1) = 2`; `1 + 2 = 3` is the
  oddity. The symbol `1_3^{+1} 3^{+1}` fails the determinant compatibility and `1_1^{−1} 3^{+1}`
  fails the oddity formula, so both clauses are needed.
- `⟨5⟩`: `1_5^{−1}` and `5^{+1}` with 5-excess `4`; `1 + 4 = 5` is the oddity.

**3H. The rational form of a genus.** Two lattices in one genus have equivalent forms over
`ℚ` and over every `ℚ_p`, in the invariants `(rank, d±, s_p, signature)`, by the native local
classification and Hasse–Minkowski (O'Meara 66:4). Conversely, rational equivalence together with
the integral local data gives membership in one genus: a lattice `M` in the genus of `L` may be
taken on the rational space of `L`, which 4B uses. *Needs:* 3F; T
`equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq`,
`locallyEquivalent_iff_finrank_eq_and_discr_eq_and_finiteHasse_eq_and_realPositiveIndex_eq`; R
Global Quadratic Forms `hasseMinkowski_equivalent`, `equivalent_of_locallyEquivalent`.

**Checks.**

- `E₈` and `I₈`: rank 8, determinant 1, signature `(8, 0)` and Hasse invariant `1` at every `p`,
  so equivalent over `ℚ` and over every `ℚ_p`, yet in different genera by parity at 2: rational
  equivalence alone does not give the genus.
- `⟨1⟩ ⊕ ⟨5⟩` and `!![2,1;1,3] ≅ ⟨2⟩ ⊕ ⟨10⟩` over `ℚ`: `(1, 5)_p = 1` everywhere while
  `(2, 10)_p = (2, 5)_p` is `−1` at `p = 2` and at `p = 5`, so they are not rationally equivalent
  and 3F's local separation at 5 has a rational reason.
- `U` and `⟨1⟩ ⊕ ⟨−1⟩`: rationally equivalent, both being the hyperbolic plane over `ℚ`, and in
  different genera.

**3I. Dyadic type, bound and free constituents, and the density exponents.** This is the
lattice-side combinatorics that the dyadic local density is read off. It is pure Jordan
arithmetic over `ℤ_2` and uses no group scheme; the density itself is 7D, which is
`OrthogonalTamagawaAndLatticeMass`'s.

Let `R` be the valuation ring of a finite unramified extension of `ℚ₂`, with residue field of
cardinality `f`, and let `L` be an `R`-lattice of rank `n` in the sense of 3B, with a Jordan
splitting `L = ⊕_i L_i` as in 3B, where `L_i = 2^i M_i` is the `2^i`-modular constituent, of rank `n_i`, and `M_i = L_i(2^{−i})`
is its unimodular rescaling. Following Cho, Definition 2.1 and §2.3:

- `L_i` is of **type I** when its unimodular rescaling `M_i` has norm ideal `𝔫(M_i) = R`, and
  of **type II** otherwise. Equivalently the norm ideal is compared with the constituent's own
  scale, never with `R`: type I is `𝔫(L_i) = 𝔰(L_i) = 2^i R` and type II is
  `𝔫(L_i) = 2𝔰(L_i) = 2^{i+1} R`. This is Cho's Definition 2.1(b), which gives a modular lattice
  the parity type of its unimodular rescaling, and it is the odd/even distinction of the 2-adic
  symbol in 3E. ⚠ Reading type I off `𝔫(L_i) = R` is correct only at scale `i = 0` and
  misclassifies every constituent of positive scale: `⟨2⟩` is a type I constituent of scale 2
  with `𝔫 = 2ℤ₂ ≠ ℤ₂`. Every scale-zero example passes the wrong criterion, so the rank-one
  constituent `⟨2⟩` at scale 2 is a mandatory test of the definition; the type feeds `t`, `b`,
  `c` and the bound/free distinction below, so the error would propagate into `N`.
- `L_i` is **bound** when `L_{i−1}` or `L_{i+1}` is of type I, and **free** when neither is.

Write `t` for the number of constituents of type I, `b` for the number of pairs of adjacent
constituents `L_i`, `L_{i+1}` both of type I, which is Conway–Sloane's `n(I, I)`, and `c` for
the sum of the ranks of the nonempty constituents of type II, which is their `n(II)`. Put
`d_i = i·n_i(n_i + 1)/2` and

    N_M = ∑_{L_i type I} (2n_i − 1) + ∑_{i<j} (j − i)·n_i·n_j + 2b,
    N_Q = ∑_{L_i type I} 2n_i + ∑_{i<j} j·n_i·n_j + ∑_i d_i + b + c.

This milestone asks for:

- the definitions above, with the convention in rank 0 and for an empty constituent, and the
  proof that type is an invariant of the lattice and not of the splitting, which is the
  invariance of the fundamental invariants (O'Meara 93:28, 93:29); the ranks `n_i` are
  invariants for the same reason, so `N_M`, `N_Q`, `t`, `b` and `c` are well defined even
  though the dyadic Jordan splitting itself is not unique;
- the identity, which is Cho's Lemma 5.1,

      N := N_Q − N_M = t + ∑_{i<j} i·n_i·n_j + ∑_i d_i − b + c;

- the behaviour of `N_M`, `N_Q` and `N` under orthogonal sums whose scales do not interleave,
  and under the scaling `L ↦ L(2)`, which shifts every index by one;
- the dictionary to the 2-adic symbol of 3E: `t` is the number of odd constituents, `b` is
  `n(I, I)` and `c` is `n(II)`, so the three exponents are computable from the symbol;
- worked values, each recomputed from the definitions above and checked against 7D's
  normalization, in which `α_2(L) = 2^{N − n(n−1)/2}·#𝒢̃_L(𝔽_2)` is the count of 7C:
  - a unimodular type II lattice of rank `n` is a single free constituent at `i = 0` with
    `t = 0`, `b = 0`, `c = n` and `d_0 = 0`, so **`N = n`**, and not `0`. For `U` this is
    `N = 2`; its quadratic-form orthogonal model for `q=β(x,x)/2` is smooth,
    `#O_2^+(𝔽_2) = 2`, and
    `α_2(U) = 2^{2−1}·2 = 4`, which is the direct count: the solutions of `XᵀAX ≡ A (mod 2^r)`
    for `r ≥ 2` and `A = !![0,1;1,0]` are the matrices `!![a,b;c,d]` with `a, d` units, `d ≡ a⁻¹` and
    `b, c ∈ {0, 2^{r−1}}`, and those with `b, c` units, `c ≡ b⁻¹` and `a, d ∈ {0, 2^{r−1}}`,
    `2^{r+1}` of each kind, so the stable count is `α_2(U) = 2^{−r}·2^{r+2} = 4`.
    At `r=1` the naive bilinear reduction instead gives `SL₂(𝔽₂)` with 6 elements and
    normalized count 3; it is not the smooth quadratic model or the stable density.
    For `E₈ ⊗ ℤ_2 = U⁴`, `N = 8`;
  - `⟨1⟩`: one type I constituent at `i = 0`, `t = 1`, so `N = 1`, and `α_2 = 2·#𝒢̃(𝔽_2) = 4`,
    the number of solutions of `x² ≡ 1 (mod 2^r)` for `r ≥ 3`;
  - `⟨2⟩`: one type I constituent at `i = 1`, `t = 1` and `d_1 = 1`, so `N = 2`, and `α_2 = 8`,
    the number of `x (mod 2^r)` with `2x² ≡ 2 (mod 2^r)` for `r ≥ 4`;
  - `⟨1⟩ ⊕ ⟨2⟩`: two adjacent type I constituents at `i = 0, 1`, so `t = 2`, `b = 1`, `c = 0`,
    `∑_{i<j} i·n_i·n_j = 0` and `d_1 = 1`, and `N = 2 + 0 + 1 − 1 + 0 = 2`;
  - over `R = ℤ₂[ζ₃]` (`f = 4`), the rank-one lattice with Gram `[2]`: one type I constituent at
    `i = 1` with `𝔫 = 𝔰 = 2R`, so `t = 1`, `b = c = 0`, `d_1 = 1` and `N = 2`, the same exponent as
    `⟨2⟩` over `ℤ₂`; the residue cardinality enters 7D only through `f^N = 16`, not through `N`.

  ⚠ The value `N = 0` for a type II unimodular lattice is the exponent of a *different*
  normalization: counting automorphisms of the quadratic form `q = ½β(x,x)` modulo `2^r`, which
  takes the diagonal congruence modulo `2^{r+1}`, gives `α_2^q(U) = 1` and, for an even
  unimodular lattice of rank `2m`, the same closed form `2(1 − ε2^{−m})∏(1 − 2^{−2i})` as the
  odd-prime display of 7C, because the smooth model is then the orthogonal group scheme of `q`
  itself. For a type II unimodular lattice that count is `2^{−c}` times 7C's, and the `+c` in
  `N_Q` is exactly the conversion. In this roadmap `α_2` is the bilinear count of 7C throughout,
  `N` is Cho's exponent for that count, and the two normalizations are never written under one
  symbol; the dictionary to the quadratic count, and to Conway–Sloane's `m_2(f)`, whose type
  factor `2^{n(I,I) − n(II)} = 2^{b − c}` is the same `−b + c` read on the reciprocal, is the
  successor's 7D and 7H.

⚠ `N` is generally nonzero. The formula of 7D carries `f^N`, and dropping it changes the
answer by a power of 2; this is why the exponents are pinned here rather than left inside the
statement that consumes them.

### Examples

`A₂` has bad primes 2 and 3; over `ℤ₃` its Jordan splitting is `⟨2⟩ ⊕ ⟨6⟩` up to unit squares, with constituents of scales 1 and 3, and over `ℤ₂` it is even unimodular of rank 2 with `N = 2`. `⟨1⟩` and `⟨17⟩` agree in rank, signature and over `ℤ₂` but differ at 17, so the determinant comparison of 3F is needed.

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| 3A | M `LinearMap.BilinForm.baseChange`, `TensorProduct`, `ℤ_[p]`, `ℚ_[p]`; L 0A, 1A, 1B |
| 3B | M `Module.Free`, `Module.Finite`, `LinearMap.BilinForm.IsSymm`, `LinearMap.BilinForm.baseChange`, `LinearMap.BilinForm.dualSubmodule`, `IsOrtho`, `iIsOrtho`; L 3A |
| 3C | M `PadicInt.unitCoeff`; T `exists_basis_iIsOrtho_localIntegralForm`, `exists_basis_iIsOrtho_localIntegralForm_eq_unit_mul_pow`, `squareClass`; L 3B |
| 3D | L 0D, 3B |
| 3E | L 0D, 3D |
| 3F | L 0E, 3C, 3D |
| 3G | T `hilbertSymbol`; L 3E, 3F; R Class Field Theory `hilbertProductFormula`; R Quadratic Form Invariants `hilbertSymbol_productFormula` |
| 3H | T `equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq`, `locallyEquivalent_iff_finrank_eq_and_discr_eq_and_finiteHasse_eq_and_realPositiveIndex_eq`; L 3F; R Global Quadratic Forms `hasseMinkowski_equivalent`, `equivalent_of_locallyEquivalent` |
| 3I | L 0D, 3B, 3D, 3E |

## Layer B: binary lattices and quadratic orders

Rank 2 is the exception in four places: 2C and 4F for automorphism groups, 4E for class
numbers, and 7G for the mass. Its theory is the arithmetic of quadratic orders, and it is
not the theory the other ranks use. This layer builds it, and its inputs are Layers 0 to 3
only; in particular B8 proves the rank-2 passage from the proper mass to the full mass
here, rather than waiting for 7A. Mathlib has `Zsqrtd` and Pell's equation, and it has no
theory of non-maximal quadratic orders or of binary form classes.

⚠ **The field-order and class-group branch is consumed, not built.** Global Number Fields
Layer 11 owns orders in number fields, conductors, raw proper fractional ideals, the group of
invertible proper fractional ideals, the separate ideal class monoid, `Pic`, and `NarrowPic`.
Class Field Theory owns ring class fields and their Artin isomorphisms, as
`ringClassField`, `ringClassArtinMap` and `gal_ringClassField_equiv_pic`.
Those interfaces apply only when `Δ` is nonsquare, and that is enforced by their types and not
only by this paragraph: each of them takes a `NumberFieldOrder K` with `[Field K]`, and the
split algebra `ℚ × ℚ` is not a field. If `Δ` is square, this layer uses a separate elementary
product-order route; it does not instantiate `NumberFieldOrder`, `Pic`, `NarrowPic`, or a ring
class field, and it defines no local substitute that would let a consumer ask for one. This layer owns the
**binary** side in both branches: the norm form, content and discriminant, form classes,
composition, automorphism groups, and the rank-2 mass.

**B1. The order of a binary lattice, with an explicit field/split branch.** Let `L` be
nondegenerate of rank 2, with Gram matrix
`!![A, B; B, C]` in a basis. Its norm form is `N_L(x, y) = A x² + 2B x y + C y²`, an integral
binary quadratic form with even middle coefficient and discriminant
`disc N_L = 4B² − 4AC = −4 det L`. Write `N_L = c·f` with `c > 0` the content and `f`
primitive. Then `Δ(L) := disc f` satisfies `Δ ≡ 0` or `1 (mod 4)`, is negative for definite
`L`, and is positive for indefinite `L`. The quadratic étale algebra is
`A_Δ = ℚ[t]/(t² − Δ)` and the order is `𝒪(L) = ℤ[(Δ + √Δ)/2] ⊆ A_Δ`, of discriminant
`Δ`. The milestone also fixes an orientation of `L` and proves that `c` and `Δ` do not depend
on the chosen basis, and that the **proper equivalence class** of `f` does not depend on the
chosen oriented basis. The polynomial `f` itself does: an oriented change of basis replaces it
by a properly equivalent form, and a change of orientation by an improperly equivalent one, so
the invariant attached to `L` is the proper class of `f`, not `f`.

For a full finite-index sublattice `M ≤ L`, restriction gives
`𝔰(M) ⊆ 𝔰(L)` and `𝔫(M) ⊆ 𝔫(L)`, a basis matrix `P` sends the Gram matrix to
`Pᵀ G P`, and `det M = [L:M]² det L`. The content of the binary norm form has no formula
depending only on `[L:M]`: restricting `x²+y²` to
`M = ⟨2e₁,e₂⟩ ≤ ℤ²` gives `4x²+y²`, still of content 1. By contrast, the separate form
twist by `a : ℤ` multiplies content by `|a|`.

If `¬ IsSquare Δ`, then `A_Δ` is the quadratic number field `K_Δ`; the construction returns
the supplier's actual `NumberFieldOrder K_Δ` and identifies its `conductor` with `f_Δ`.
If `IsSquare Δ`, then `A_Δ ≃ ℚ × ℚ`; the order is handled as an explicit product order
inside that algebra, with its unit and ideal arithmetic proved directly. In particular,
`Δ = 1` gives `𝒪_U ≃ ℤ × ℤ`. No field-order carrier is used in this branch. In the
nonsquare branch, `𝒪_Δ` is nonmaximal whenever `Δ` is not fundamental, which is why the
Global Number Fields order API, rather than `ClassGroup (𝓞 K)`, is required.

**B2. Forms and ideal classes.** For `Δ < 0`, the direct map below is on positive-definite
primitive forms. Negative-definite inputs of B1 first pass through `L ↦ L(−1)` and `f ↦ −f`.
Prove these are inverse equivalences between the positive and negative proper class sets,
preserving determinant, discriminant, content and all integral automorphisms. Transport the
Picard dictionary, genus and class computations back along this equivalence; do not apply a
positive field-norm isometry directly to the negative form. For `Δ > 0`, retain both signs of
`a` and the oriented narrow-class rule below.

First suppose `¬ IsSquare Δ`. Fix
`Δ ≡ 0` or `1 (mod 4)`, and let `f = (a, b, c)` be a primitive form of discriminant `Δ`.
Put `𝔞_f = aℤ + ((−b + √Δ)/2)ℤ`, an `𝒪_Δ`-submodule of `K_Δ` of norm `|a|`, and send `f` to

    𝔞_f            if a > 0,
    √Δ · 𝔞_f       if a < 0.

This map induces a bijection from proper equivalence classes of primitive forms of
discriminant `Δ` to the consumed ideal-class group named below. ⚠ **The sign clause is not
optional for `Δ > 0`.** The unoriented ideal `𝔞_f` alone forgets the sign of `a`, and the
narrow class of `𝔞_f` is not a function of the proper class of `f`: for `Δ = 12` the forms
`f = x² − 3y²` and `f' = −x² + 3y²` have `𝔞_f = ℤ + √3ℤ = 𝒪_{12}` and
`𝔞_{f'} = −ℤ + √3ℤ = 𝒪_{12}`, the same ideal, hence the identity of `NarrowPic 𝒪_{12}` as well
as of `Pic 𝒪_{12}`, while `f` and `f'` are not properly equivalent — not equivalent under any
unimodular integral change at all, since an equivalence would make `x² − 3y²` represent `−1`,
which is impossible modulo 3. Rotating `f'` by the orientation-preserving `(x, y) ↦ (y, −x)`
gives `3x² − y²`, whose ideal `(3, √3) = √3·𝒪_{12}` is the nontrivial narrow class, and that
is exactly the class the sign clause assigns to `f'`. Equivalently, the milestone may first
normalize: every proper class of an indefinite primitive form contains a form with `a > 0`
(an indefinite form represents some positive integer primitively, and a primitively
represented value can be moved to the leading coefficient by an oriented change of basis),
and two such representatives have narrowly equivalent `𝔞_f`; either the oriented construction
or the `a > 0` normalization is proved, together with the comparison between them, before the
ideal formula is applied. For `Δ < 0` the source is the positive definite forms, `a > 0`
holds throughout, and the clause is vacuous.

First exhibit `𝔞_f` in the supplier's raw carrier
`NumberFieldOrder.properFractionalIdeals`. Then use the quadratic-field hypothesis
`Module.finrank ℚ K_Δ = 2` and the supplier theorem
`NumberFieldOrder.isProperFractionalIdeal_iff_isUnit_of_finrank_eq_two` to place it in
`NumberFieldOrder.invertibleProperFractionalIdeals`. The equivalence is proved **into the
consumed group**, not into a target defined here:

- for `Δ < 0` the source is the set of positive definite classes and the target is
  `Pic 𝒪_Δ`, through the consumed `NumberFieldOrder.mkPic`;
- for `Δ > 0` the target is the consumed `NarrowPic 𝒪_Δ`, the quotient by the principal ideals
  with a generator of positive norm, and the map is the **oriented** one above: `𝔞_f` for
  `a > 0` and `√Δ·𝔞_f` for `a < 0`, `√Δ` being an element of negative norm. `Δ = 12` with
  `x² − 3y²` and `−x² + 3y²` landing in the two distinct narrow classes is a required test.

This use of the quadratic-order theorem is load-bearing. For a general number-field order,
properness is only the multiplier-ring condition and does not imply invertibility. Such raw
proper ideals map to the supplier's `IdealClassMonoid`; its unit classes correspond to `Pic`
through `picEquivUnitsIdealClassMonoid`. No noninvertible ideal is assigned a Picard class here.

⚠ The positive-discriminant target is `NarrowPic` and never `Pic`, and the map into it is the
oriented one. The two groups differ exactly when the fundamental unit has norm `+1`, and
`Δ = 12` is the smallest witness: `Pic 𝒪_{12}` is trivial while `NarrowPic 𝒪_{12}` has order 2,
and the two properly inequivalent forms `x² − 3y²` and `−x² + 3y²` are told apart only by the
sign clause, never by the unoriented ideal. A dictionary stated into `Pic` for `Δ > 0` is
false, a dictionary stated into `NarrowPic` through the unoriented `𝔞_f` is false too, and the
ownership of the narrow group is the supplier's so that no second narrow quotient exists to
state either into.

For square `Δ`, define proper classes and composition directly for the split product order.
Prove the elementary class behavior without mapping into `Pic` or `NarrowPic`; for `U` the
split proper class is principal. This branch is an explicit case split in every theorem that
otherwise mentions the supplier's ideal-class carriers.

For `Δ < 0` and positive definite primitive forms the bijection with `Pic 𝒪_Δ` is Cox,
*Primes of the form x² + ny²*, Theorem 7.7 (p. 137 of the 1989 edition; uncertified), which is
stated for orders in imaginary quadratic fields only. The oriented `Δ > 0` branch into
`NarrowPic 𝒪_Δ` and the split branch are proved here along the same route, with the sign clause
`𝔞_f ↦ √Δ·𝔞_f` for `a < 0` as the one new step; Cohen, *A Course in Computational Algebraic
Number Theory*, §5.2, states the correspondence for both signs (uncertified).

**Checks.**

- `Δ = −3`: one proper class, `x² + xy + y²`, and `Pic ℤ[ζ₃]` is trivial; this is inside Cox 7.7.
- `Δ = 12`: `x² − 3y²` and `−x² + 3y²` are two proper classes, `NarrowPic ℤ[√3]` has order 2
  (the fundamental unit `2 + √3` has norm `+1`) and `Pic ℤ[√3]` is trivial; the unoriented map
  sends both forms to `ℤ[√3]` and is not injective, the oriented one separates them.
- `Δ = 1` (`U`, primitive part `xy`): the split branch, with the single proper class principal
  and no `NumberFieldOrder` involved.

**B3. Compatibility, and the ring class field.** In the nonsquare branch, the bijection of
B2 — the oriented map, with its sign clause, for `Δ > 0` — carries Gauss composition
to multiplication **in the consumed group** — in `Pic 𝒪_Δ` for `Δ < 0` and in `NarrowPic 𝒪_Δ`
for `Δ > 0` — the opposite form to the inverse class, and the principal form to the trivial
class. It carries the genus of `L`, in the sense of 3F, to a coset of the subgroup of squares.
Discriminants agree on both sides.

In the square branch the same comparison is a separate theorem about the split classes of B2,
stated with the conductor. Let `Δ = m²` with `m > 0`, so that `𝒪_Δ` is the split order
`𝒪_m = {(a, b) ∈ ℤ × ℤ : a ≡ b (mod m)}` of index `m` in `ℤ × ℤ` and discriminant `m²`. Prove:

- the forms `(0, m, c) = m x y + c y²`, for `c` running over `(ℤ/mℤ)ˣ`, are a complete set of
  representatives of the proper classes of primitive forms of discriminant `m²`, so there are
  `φ(m)` of them, and the elementary composition law of B2 makes this class set a group
  isomorphic to `(ℤ/mℤ)ˣ`. One route is the adelic one: the proper classes correspond to
  `(ℤ̂ˣ × ℤ̂ˣ) / (𝒪̂_mˣ · {±(1, 1)})`, and `(a, b) ↦ a b⁻¹ mod m` identifies this with `(ℤ/mℤ)ˣ`;
- the genus of `L`, in the sense of 3F, is a coset of the subgroup of squares
  `((ℤ/mℤ)ˣ)²`, so there are `[(ℤ/mℤ)ˣ : ((ℤ/mℤ)ˣ)²]` genera of primitive forms of discriminant
  `m²`, each with `#((ℤ/mℤ)ˣ)²` proper classes;
- the torus of B6 detects one genus, not the whole class set. Its integral points depend on
  the conductor: `T_L(ℤ_p) = {(t, t⁻¹) : t ∈ ℤ_pˣ, t² ≡ 1 (mod p^{v_p(m)})}`, so that
  `T_L(ℚ) \ T_L(𝔸_f) / T_L(ℤ̂) ≅ (ℤ/mℤ)ˣ / {t : t² = 1}`, and squaring identifies this with
  `((ℤ/mℤ)ˣ)²`, which acts simply transitively on the proper classes in `gen L`.

For `m = 1` everything is trivial: `𝒪_1 = ℤ × ℤ`, the one class is that of `U`. The B2 inputs
of the nonsquare branch, `NumberFieldOrder`, `Pic` and `NarrowPic`, are not used.

**Checks (split branch).**

- `Δ = 25`, `m = 5`: the four forms `5xy + cy²`, `c = 1, 2, 3, 4`, are pairwise properly
  inequivalent; modulo 5 the form is `c y²`, so `{1, 4}` and `{2, 3}` are the two genera, each of
  two proper classes. The torus quotient is `(ℤ/5ℤ)ˣ / {±1}`, of order 2, equal to the number
  of proper classes in one genus and not to the four classes of discriminant 25. A statement
  that fibres the torus quotient over all classes of the discriminant fails here.
- `Δ = 64`, `m = 8`: four proper classes `8xy + cy²`, `c = 1, 3, 5, 7`, whose odd values are
  `≡ c (mod 8)`, so there are four genera of one class each. Every unit of `ℤ/8ℤ` squares to 1,
  so the torus quotient is trivial. Replacing `{t : t² = 1}` by `{±1}`, correct at `m = 5`,
  gives the wrong value 2 here.
- `Δ = 1`: one class, one genus, trivial torus quotient; the discriminant-one example cannot
  separate the class set from the genus and is not a test of this comparison.

Because the target is the supplier's group and not a copy of it, one further statement is
available and is a milestone here:

```text
Gal(H_{𝒪_Δ}/K_Δ) ≃ Pic 𝒪_Δ ≃ proper equivalence classes of primitive forms of discriminant Δ
```

for `Δ < 0` (hence automatically nonsquare), the first isomorphism being Class Field
Theory's ring-class-field milestone and
the second the dictionary of B2. This roadmap proves the composite, and neither half. It is the
statement that makes the classical `x² + ny²` criteria a fact about binary forms, and it is
exactly what a copy of the Picard group would not have delivered.

There is no ring-class-field corollary in the square-discriminant branch, and the API is
arranged so that one cannot be asked for. Class Field Theory's `ringClassField` takes an order
in a number **field** `K` together with `Module.finrank ℚ K = 2`, so its argument is a
`NumberFieldOrder K` with `[Field K]`; when `Δ` is a square the quadratic algebra `A_Δ` is
`ℚ × ℚ`, which is not a field — `(1,0)` is a nonzero nonunit — and is therefore the `K` of no
`NumberFieldOrder K`. The only route from a binary discriminant to such an order is B1's
nonsquare constructor, which carries `¬ IsSquare Δ` in its type, so the composite ring class
field of a binary lattice carries that hypothesis too and cannot be instantiated at a square
discriminant. This roadmap defines no split ring class field, no split analogue of one, and no
`Pic`- or `NarrowPic`-valued invariant of the split order; the split composition law is the
elementary law from B2, and its class set is a type of its own.

**B4. Automorphisms, ambiguous classes, and the Pell criterion.** For a nondegenerate
binary `L` of nonsquare discriminant, the supplier order gives

    SO(L) ≅ {u ∈ 𝒪(L)ˣ : N(u) = 1}.

The index `[O(L) : SO(L)]` is 1 or 2, and it is **not** always 2, so `|O(L)| = 2·#𝒪(L)ˣ` is
not a general formula. Which of the two values it takes is decided by an involution.
Conjugation `x + y√Δ ↦ x − y√Δ` of `K_Δ` carries an invertible `𝒪_Δ`-ideal `𝔞` to `𝔞̄`, with
`𝔞𝔞̄ = N(𝔞)·𝒪_Δ`; since `N(𝔞)` is a positive integer, it induces inversion on the proper
class group of B2, and under B2 it corresponds to `f = (a, b, c) ↦ f⁻ = (a, −b, c)`. The
milestone proves (Cox, Theorem 3.9, p. 50, uncertified, for the form side)

    [O(L) : SO(L)] = 2  ⟺  f and f⁻ are properly equivalent  ⟺  [𝔞_f]² = 1,

the class being taken in the consumed `Pic 𝒪_Δ` for `Δ < 0` and in the consumed `NarrowPic 𝒪_Δ`
for `Δ > 0`.
A nonsquare class satisfying this is called ambiguous, and an improper automorphism is then obtained
by composing the reflection `σ(x, y) = (x, −y)`, which carries `f` to `f⁻`, with any proper
equivalence from `f⁻` back to `f`.

The witness for the other case is `!![4, 1; 1, 6]`, of determinant 23, whose norm form is
`4x² + 2xy + 6y² = 2·(2x² + xy + 3y²)`, so `Δ = −23`. Its minimum is 4 and the only vectors
of that norm are `±e₁`, so an isometry sends `e₁` to `±e₁`, and preserving `β e₁ e₂` and
the norm of `e₂` then forces `±I`, the integrality of the remaining coefficient being what
rules out the other solution. Hence `O(L) = SO(L) = {±I}` has order 2, while `#𝒪ˣ = 2` and
`2·#𝒪ˣ = 4`. The class of `(2, 1, 3)` has order 3 in `Pic 𝒪_{−23} ≅ ℤ/3`, so it is not
ambiguous, which is the same statement on the ideal side.

Together with the direct split calculation, three cases follow:

- `Δ < 0`: the field norm is positive definite; for a negative-definite input first use the
  sign twist `L(−1)` in the form/ideal comparison. Its integral automorphism group is unchanged.
  Every unit has norm 1 and
  `SO(L) ≅ 𝒪(L)ˣ`. The unit group is finite, with `#𝒪(L)ˣ = 6` for `Δ = −3`, `4` for
  `Δ = −4`, and `2` otherwise. So `|SO(L)| = #𝒪(L)ˣ`, and `|O(L)|` is `#𝒪(L)ˣ` or
  `2·#𝒪(L)ˣ` according to whether the class is ambiguous;
- `Δ > 0` and `Δ` is not a square: the norm-one units are infinite, by Pell's equation, so
  `O(L)` is infinite. This is the branch that 4F consumes;
- `Δ > 0` and `Δ` is a square: this is the separate split branch. The product order and its
  norm are handled directly; its integral norm-one units are `{±1}` and `O(L)` is finite.
  The hyperbolic plane `U` has content 2, primitive part `xy`, `Δ = 1`, and
  `𝒪_U = ℤ × ℤ`; its single split proper class is ambiguous and
  `|O(U)| = 4 = 2·|SO(U)|`.

**B5. Reduction of forms, and the class number.** For nonsquare `Δ`, finiteness of
`Pic 𝒪_Δ` and of `NarrowPic 𝒪_Δ` is the consumed `finite_pic` and `finite_narrowPic`, and
is not proved again here. What this milestone owns is the **form-side** route, which the
supplier does not have and which is what a class-number computation runs: for `Δ < 0` every
primitive positive definite form is properly equivalent to a unique reduced form, `|b| ≤ a ≤ c`
with `b ≥ 0` when `|b| = a` or `a = c` (Cox, Theorem 2.8, p. 27, and Theorem 2.13, p. 29), and for
`Δ > 0` the reduced forms fall into finitely many cycles under the continued-fraction step
(Cohen, §5.6). Both give an explicit finite list of classes for each `Δ`, and B2
transports the count to the consumed group. For square `Δ = m²`, prove finiteness and the class
count directly in the split algebra, without citing either supplier finiteness theorem: the
count is `φ(m)`, with the representatives `(0, m, c)` of B3's split branch. This is the count of
all proper classes of discriminant `m²`; the count in one genus is B3's `#((ℤ/mℤ)ˣ)²`.

**B6. The norm-one torus and its points.** For a binary lattice `L` use its quadratic
étale algebra `A_Δ`: the norm-one group is
`T_L(R) = {u ∈ (A_Δ ⊗ R)ˣ : N(u) = 1}` for `R = ℚ`, `ℚ_p`, `ℝ` and `ℤ_p`, with
`T_L(ℤ_p)` defined through `𝒪(L) ⊗ ℤ_p`. In the nonsquare branch this is the norm-one
torus of `K_Δ`; in the square branch identify it explicitly with the split torus rather
than coercing `ℚ × ℚ` to a number field. Required: `T_L(ℤ_p)` is compact open in
`T_L(ℚ_p)`; the isomorphisms `SO(L_p) ≅ T_L(ℤ_p)` and `SO(V_p) ≅ T_L(ℚ_p)` transported from
B4; and the diagonal embedding of `T_L(ℚ)`.

**B7. Measures in rank 2.** At each finite prime normalize Haar measure by
`vol(T_L(ℤ_p))=1`. This does not determine the real scalar. For imaginary quadratic `Δ`,
identify `T_L(ℝ)` with the unit circle and use angular density `|dθ|`, of total volume `2π`.
For real quadratic or split `Δ`, use `dt/|t|` on `ℝˣ`, namely counting measure on its two
sign components times Lebesgue measure on `log |t|`. The other choice of real embedding
acts by inversion and preserves this density. Construct the product measure on the restricted product of the
`T_L(ℚ_p)` relative to the `T_L(ℤ_p)`, built on `RestrictedProductGroup` with the compact open
reference family of `CompactOpenSubgroups` and `isCompact_integralSubgroup`; the full adelic
group `T_L(𝔸) = T_L(𝔸_f) × T_L(ℝ)` with the product measure; and the diagonal `T_L(ℚ)`, built on
`rationalDiagonal`, which is discrete in `T_L(𝔸)`. The quotient statement splits with B1's
branch, and the two branches are different theorems:

- *Nonsquare `Δ`.* `T_L` is the norm-one torus of `K_Δ`, anisotropic over `ℚ`, and
  `T_L(ℚ) \ T_L(𝔸)` is **compact**, so `T_L(ℚ)` has finite covolume. The proof is from B5 and
  the unit group of B4, and not from any general reduction theory: the quotient fibres over the
  finite set `T_L(ℚ) \ T_L(𝔸_f) / T_L(ℤ̂)`, which is the subgroup of squares in `NarrowPic 𝒪_Δ`,
  the principal genus, acting simply transitively on the proper classes in `gen L` by B3, and
  each fibre is `T_L(ℤ̂) × T_L(ℝ)`
  modulo the norm-one units `T_L(ℤ) = T_L(ℚ) ∩ T_L(ℤ̂)`. For `Δ < 0` the factor `T_L(ℝ) ≅ S¹` is
  compact and `T_L(ℤ)` is the finite group of `w` roots of unity; for `Δ > 0` the factor
  `T_L(ℝ) ≅ ℝˣ` is not compact, and it is the fundamental norm-one unit of B4 that makes
  `T_L(ℝ)/T_L(ℤ)` compact. Both cases are milestones.
- *Square `Δ`.* `A_Δ = ℚ × ℚ`, the norm-one group is `T_L = {(t, t⁻¹)} ≅ 𝔾_m`, and
  `T_L(𝔸)/T_L(ℚ) ≅ 𝔸_ℚˣ/ℚˣ ≅ ℤ̂ˣ × ℝ_{>0}`. ⚠ **This has infinite volume.** The idele modulus
  `T_L(𝔸) → ℝ_{>0}`, `(t, t⁻¹) ↦ |t|_𝔸`, is surjective and trivial on `T_L(ℚ)`, so the real
  direction `dt/t` survives the quotient. Norm one in the split algebra is not modulus one, and
  the finiteness of B5's split class set does not remove the real direction. The statement in
  this branch is about the modulus kernel `T_L(𝔸)¹ = ker |·|_𝔸`, which contains `T_L(ℚ)`:
  `T_L(ℚ) \ T_L(𝔸)¹ ≅ ℚˣ \ 𝔸^{×,1}` is compact, fibred over the finite set
  `T_L(ℚ) \ T_L(𝔸_f) / T_L(ℤ̂)` with compact fibres. For `Δ = m²` that base is B3's split
  double quotient `(ℤ/mℤ)ˣ / {t : t² = 1} ≅ ((ℤ/mℤ)ˣ)²`, in simply transitive correspondence
  with the proper classes in `gen L`, with the conductor-dependent `T_L(ℤ_p)` of B3; it is not
  the set of all `φ(m)` proper classes of discriminant `m²` counted in B5, and `Δ = 25` (base of
  order 2, four classes) separates the two. Equivalently `T_L(ℚ) \ T_L(𝔸) / T_L(ℝ)⁰` is compact, where
  `T_L(ℝ)⁰ ≅ ℝ_{>0}` is the split real direction. The anisotropic covolume statement is never
  applied to this branch, and `U`, with `Δ = 1`, is its mandatory test.

The rank-2 mass of B8 is proved from B2 to B5 without any measure. What B7 supplies to 7G is the
normalization the successor's rank-2 specialization must reproduce, and it is stated for
`Δ < 0`, the only branch in which a positive definite binary genus arises. This torus measure is
the whole of the adelic measure theory this roadmap owns. The Tamagawa measure of `SO(V)` is not
built here and no milestone here normalizes one; the normalization above is stated so that the
successor's rank-2 specialization has to reproduce it, so that 7G here and the successor's 7H
speak of one measure rather than one deducing the other.

**B8. The mass of a positive definite binary genus.** Let `L` be positive definite of rank 2
with order `𝒪 = 𝒪(L)`, so `Δ < 0`, and write `w = #𝒪ˣ`. The content and the determinant are
genus invariants, so `Δ` and `w` are constant on `gen L`, and B4 gives `|SO(M)| = w` for
every `M` in `gen L`. The proper classes in the genus are finite in number by B5 and form a
coset of the squares by B3. Writing `h⁺(gen L)` for their number, the **proper** mass is

    m⁺(gen L) = h⁺(gen L) / w.

The full mass is obtained from that by a splitting, and not by putting the full class number
in place of `h⁺`. Two forms are improperly equivalent exactly when one is properly
equivalent to the opposite of the other, so by B2 and B3 the full classes in the genus are
the orbits of inversion on the proper classes; this is the rank-2 case of 7A, proved here
from Layer B so that this layer does not wait for Layer 7. By B4 an ambiguous proper class
is one full class with `|O(M)| = 2w`, and a pair of distinct inverse proper classes is one
full class with `|O(M)| = w`. With `a` ambiguous classes and `(h⁺ − a)/2` pairs,

    m(gen L) = a·(2w)⁻¹ + ((h⁺(gen L) − a)/2)·w⁻¹ = h⁺(gen L) / (2w),

for every value of `a`, so `m⁺ = 2m` as 7A states in general. The full class number is
`h(gen L) = (h⁺(gen L) + a)/2`, and it is `h⁺`, not `h`, that appears in the mass.

For `A₂` this gives `Δ = −3`, `w = 6`, `h⁺ = 1` with the principal class ambiguous, so
`h = 1`, `|O(A₂)| = 12` and `m = 1/12`. The genus of `!![4, 1; 1, 6]` separates the two
class numbers and is a required check: `Δ = −23`, `w = 2`, `h⁺ = 3` and `a = 1`, so `h = 2`,
the two classes are `!![2, 1; 1, 12]` with `|O| = 4` and `!![4, 1; 1, 6]` with `|O| = 2`,
and `m = 1/4 + 1/2 = 3/4 = h⁺/(2w)`, whereas `h/(2w)` would give `1/2`. The milestone also
proves that these values agree with the Conway–Sloane normalization that the successor's 7H
uses in rank 2, so the two documents cannot drift apart on the rank-2 constant.

### Examples

`A₂` (`Δ = −3`, `w = 6`, mass `1/12`), `!![4,1;1,6]` (`Δ = −23`, two classes, three proper classes, mass `3/4`), `x² − 3y²` (`Δ = 12`, `NarrowPic` of order 2) and `U` (`Δ = 1`, split) are the four test lattices of this layer.

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| B1 | M `Matrix.det`, `Zsqrtd`, product rings; L 0A, 0C; for `¬ IsSquare Δ` only, R Global Number Fields `NumberFieldOrder`, `NumberFieldOrder.conductor` |
| B2 | M `Ideal`, `Submodule`; L B1; for `¬ IsSquare Δ` only, R Global Number Fields `NumberFieldOrder.properFractionalIdeals`, `NumberFieldOrder.invertibleProperFractionalIdeals`, `NumberFieldOrder.isProperFractionalIdeal_iff_isUnit_of_finrank_eq_two`, `IdealClassMonoid`, `Pic`, `NumberFieldOrder.mkPic`, `NarrowPic`; split classes are local |
| B3 | L 3F, B2; for `¬ IsSquare Δ` only, R Global Number Fields `Pic`, `NarrowPic`; for `Δ < 0`, R Class Field Theory `ringClassField`, `ringClassArtinMap`, `gal_ringClassField_equiv_pic`; no split ring class field, and none is formable |
| B4 | M `Pell.Solution₁`, `Pell.exists_of_not_isSquare`; L 2C, B1, B2, B3 |
| B5 | L B2; for `¬ IsSquare Δ` only, R Global Number Fields `finite_pic`, `finite_narrowPic`; split finiteness is proved directly |
| B6 | M `ℤ_[p]`, `ℚ_[p]`, `LinearMap.BilinForm.baseChange`; L 3A, B4 |
| B7 | M `MeasureTheory.Measure.haar`; L B4, B5, B6; R Restricted Products `RestrictedProductGroup`, `CompactOpenSubgroups`, `integralSubgroup`, `isCompact_integralSubgroup`, `rationalDiagonal` |
| B8 | L 2C, 3F, B2, B3, B4, B5 |

## Layer 4: classes, spinor genera, and neighbors

Orthogonal and Spin Groups owns the quadratic-space groups, the spinor norm and the local
spinor norms. Restricted Products owns the generic restricted-product and rational-diagonal
substrate. This layer owns their specialization to integral lattices.

Eichler's theorem (`cls⁺ L = spn⁺ L` for indefinite `L` of rank at least 3) and the rank-`≥ 3`
half of 4E are OTM §0.3's (§*Scope and ownership*); they rest on strong approximation for `Spin`,
which neither supplier exports. OTM §0.3 consumes 4A–4C and N0–N1 below, so this layer states
those interfaces completely and nothing in it waits on OTM. The stabilizer family, the finite
adelic groups and the local and adelic spinor norms are Tau Ceti's; the targets of N0, N1, 4B
and 4C are the comparisons with the lattice carrier of 3A, the images at the bad primes, the two
double-coset bijections and the proper-spinor-genus count.

### N0. Integral and rational carriers

For a nondegenerate lattice `L` use its rational space `V`, the completion `V_p` and the full
`ℤ_p`-lattice `L_p` of 3A. Fix `B` and `Q = B/2` on `V` for the Clifford and spinor conventions;
integral parity is read on `B(x, x)`, and the discriminant half-norm `B(x, x)/2 mod ℤ` is used
only for even `L`. The local stabilizer family is Tau Ceti's. For a basis `b` of `V`, the
integral orthogonal subgroup `integralOrthogonalSubgroup` of `b ⊗ ℚ_p` is the group of isometries
of `V_p` whose matrix and inverse matrix in `b` are `p`-adically integral, which is the stabilizer
of the `ℤ_p`-span of `b` (`mem_integralOrthogonalSubgroup_iff_mem_span`); it is compact and open
(`isCompact_integralOrthogonalSubgroup`, `isOpen_integralOrthogonalSubgroup`), depends only on the
span (`integralOrthogonalSubgroup_eq_of_span_eq`), agrees for two rational bases at almost every
`p` (`eventually_integralOrthogonalSubgroup_baseChange_eq`), and contains the base change of a
rational isometry at almost every `p` (`eventually_mem_integralOrthogonalSubgroup`). The family
over all `p`, with the Spin references `integralSpinSubgroup` above it, is
`OrthogonalCompactOpens.integral`, and the determinant-one subgroups `K_p⁺(L)` are its derived
`OrthogonalCompactOpens.specialOrthogonal`. None of this is a target. N0 owns two comparisons:
for a `ℤ`-basis `b` of `L` the `ℤ_p`-span of `b ⊗ ℚ_p` is the image of `L_p` under
`localizationToCompletion`, so the native subgroup of `b` is
`K_p(L) = {g ∈ O(V_p) : g L_p = L_p}`; and the adelic reconstruction of a lattice: for a family of
full `ℤ_p`-lattices `M_p ⊆ V_p` with `M_p = L_p` for almost every `p`, the intersection
`M = V ∩ ⋂_p M_p` is a full finite free lattice on `V` with `M_p` as its completions, by clearing
denominators and weak approximation on the finitely many exceptional coordinates (O'Meara 81:14).
*Needs:* 3A; T `integralOrthogonalSubgroup` with the theorems named, `OrthogonalCompactOpens.integral`,
`localizationToCompletion`; Restricted Products Layers 1–3.

**Checks.**

- `⟨1⟩`: `O(V_p) = {±1}` and `K_p(L)` is all of it at every `p`; `K_p⁺(L)` is trivial.
- `U` with basis `e, f`: the rational isometry `e ↦ 2e, f ↦ f/2` lies in `K_p(U)` for every odd
  `p` and not in `K_2(U)`, since its matrix has the entry `1/2`; this is the native example of
  almost-everywhere integrality, and the exceptional set `{2}` is read off the denominators. For
  a nondegenerate form an integral isometry has determinant `±1`, so integrality of the inverse
  is automatic; the native definition asks for both so that the stabilizer is a subgroup for a
  degenerate form too.
- Reconstruction: for `L = ℤ²` with `x² + y²` and the family `M_5 = ` the `5`-neighbour of 4G
  (basis `(3/5, −4/5)`, `(−4/5, −3/5)`), `M_p = L_p` otherwise, the intersection is that
  neighbour: full, of determinant 1, not equal to `L` (`(3/5, −4/5) ∉ ℤ²`), with
  `[L : L ∩ M] = 5`.

### N1. Local integral spinor images

For every `p` the subgroup `H_p(L) = θ_p(K_p⁺(L))` of `ℚ_pˣ/(ℚ_pˣ)²` is Tau Ceti's
`OrthogonalCompactOpens.localSpinorNormImage` of the family of N0, the range of the spinor norm
restricted to `K_p⁺(L)`. Native with it: the image is open (`isOpen_localSpinorNormImage`); it is
trivial in rank at most 1 (`localSpinorNormImage_eq_bot_of_finrank_le_one`); it is the group of
unit square classes `ℤ_pˣ(ℚ_pˣ)²` at almost every `p`
(`eventually_localSpinorNormImage_integral_eq_unitSquareClasses`); and at an odd `p` where `L_p`
has an orthogonal basis of unit norms, that is, is unimodular of rank at least 2, `K_p(L)` is
generated by the reflections in integral vectors of unit norm and `H_p(L)` is exactly the unit
square classes (`integralOrthogonalSubgroup_eq_closure_reflectionOrthogonal`,
`map_spinorNorm_comap_integralOrthogonalSubgroup_eq_unitSquareClasses`; O'Meara 92:5). The
full-space surjectivity of the spinor norm (Orthogonal and Spin Groups 2F) is only the ambient
interface and does not compute `H_p(L)`. The targets are the images at the finitely many
`p ∣ 2 det L`, read off the Jordan data of 3C–3E: construct generators of `K_p(L)` as integral
isometries (products of reflections whose formulas preserve `L_p`), compute their images through
the Clifford reflection/norm comparison, and prove exhaustion by Jordan reduction of an arbitrary
integral isometry (O'Meara §92 at odd `p`). At `p = 2` keep the type I/type II blocks and the
oddity and sign-walking restrictions; the odd-prime diagonal argument is not used at 2. The
containment `H_p(L) ⊇ ℤ_pˣ(ℚ_pˣ)²` for `p ∤ 2 det L`, which makes the adelic image quotient of 4C
well formed, is the native almost-everywhere statement made exact: it holds at every odd `p` not
dividing `det L`. *Needs:* 3C–3E, N0; T `localSpinorNormImage` and the theorems named,
`spinorNorm`, `spinorNorm_reflectionPairSpecialOrthogonal`.

**Checks.**

- `p` odd, `L_p` unimodular of rank `≥ 2`: `H_p(L) = ℤ_pˣ(ℚ_pˣ)²`, of order 2, the native value; a
  definition through the full group `SO(V_p)` would give all of `ℚ_pˣ/(ℚ_pˣ)²`, of order 4, and
  lose the integral constraint.
- `L = ⟨1⟩ ⊕ ⟨1⟩` at `p = 2`: `K_2⁺(L)` is the rotation group of the Gaussian lattice and
  `H_2(L)` is the norm group of `ℚ₂(i)` modulo squares, `{1, 2, 5, 10}·(ℚ₂ˣ)²`, of index 2 in
  `ℚ₂ˣ/(ℚ₂ˣ)²`.
- Rank 1: `K_p⁺(L) = {1}`, so `H_p(L)` is trivial, which the native
  `exists_localSpinorNormImage_ne_unitSquareClasses` records against the unit square classes at
  every odd `p`; a convention giving it `ℤ_pˣ` would make the rank-one test of 4C fail.

**4A. Class sets.** The class `cls L`, the proper class `cls⁺ L`, the genus `gen L`, and
the proper genus, with the inclusions `cls ⊆ spn ⊆ gen` once 4C defines the middle term
(O'Meara §102A). The class number `h(L)` is the number of classes in `gen L`, and the proper class
number is its analogue. In rank 0 and rank 1 the class sets are computed directly. *Needs:* 2C,
2G, 3F; B2, B5 for the binary counts.

**Checks.**

- `⟨1⟩`: one class and one proper class, since `−1 ∈ O(L)` has determinant `−1`; rank 0 has one
  class.
- The genus of `!![4,1;1,6]` (`Δ = −23`): `h = 2` and `h⁺ = 3`, because the class of
  `!![4,1;1,6]` has `O(L) = SO(L)` and splits into two proper classes (B4), while `!![2,1;1,12]`
  has an improper automorphism; a definition identifying `cls` with `cls⁺` fails here.
- `U` and `⟨1⟩ ⊕ ⟨−1⟩`: different genera (parity), each of class number 1 (6A).

⚠ **Finiteness of the class number is three separate theorems with three different proofs, and
this roadmap owns two of them.** There is no theorem here whose statement is "the class number
of a nondegenerate lattice is finite": such a statement would silently claim the third branch,
which rests on strong approximation and is the successor's. The branches are:

| Branch | Proof | Owner |
| --- | --- | --- |
| positive definite, any rank | reduction: every class has a Minkowski-reduced Gram matrix, and reduced matrices of given rank and determinant have bounded entries | **here**, 2G; the definite case follows by `β ⇝ −β` |
| indefinite, rank 2 | ideal classes: B2 injects the classes in `gen L` into the invertible proper ideal classes of `𝒪(L)`, which are finite by B5 | **here**, 4E |
| indefinite, rank at least 3 | Eichler's theorem bounds the class number by the count of proper spinor genera in 4C | `OrthogonalTamagawaAndLatticeMass`, 4D and the rank-`≥ 3` half of 4E |

The first two proofs are unrelated, and neither generalizes to the third: reduction needs
definiteness, and the ideal-class argument needs the quadratic order of rank 2. Any Lean
statement of finiteness therefore carries the hypothesis of exactly one branch in its type.

**4B. Stabilizers and the adelic dictionary.** This roadmap is bilinear-first, and the supplier
states its groups for a quadratic form over a field. The first part of the milestone is the
transport. Over `ℚ_p` the element 2 is invertible, so the automorphism group of the bilinear
form `β_p` and the orthogonal group of the half-norm form `Q_p = ½ β_p(x, x)` are the same
group, by Orthogonal and Spin Groups 0C. The same holds for the determinant-one subgroups.
Everything below is stated for the transported group.

For `V = ℚ ⊗ L`, the stabilizers are `K_p(L) = {g ∈ O(V_p) : g L_p = L_p}` and
`K_p⁺(L) = K_p(L) ∩ SO(V_p)`, the native family of N0: compact, open, and for all but finitely
many `p` the stabilizer of the unimodular lattice `L_p`, in the form that makes the restricted
product well defined. The products `K_f(L) = ∏_p K_p(L)` and `K_f⁺(L)` are the native
`integralSubgroup` of the finite adelic groups `finiteAdelicOrthogonal` and
`finiteAdelicSpecialOrthogonal` of that family, compact (`isCompact_integralSubgroup`) and open,
and `O(V)(ℚ)` and `SO(V)(ℚ)` sit in them through the native `rationalDiagonal` of the base-change
maps `orthogonalGroupBaseChange`. The two correspondences are the targets, proved in both
directions:

    {classes in gen L}        ≃  O(V)(ℚ) \ O(V)(𝔸_f) / K_f(L),
    {proper classes in gen L} ≃  SO(V)(ℚ) \ SO(V)(𝔸_f) / K_f⁺(L).

At the level of Gram matrices the first is `exists_genusClasses_equiv_doubleCoset`: for a
nondegenerate symmetric `G`, with the rational form `gramForm`, the family `gramIntegralFamily` of
the standard basis and the diagonal `gramAdelicDiagonal`, a map from the Gram matrices in the
genus of `G` onto Mathlib's `DoubleCoset.Quotient` of the two subgroups, whose fibres are exactly
the integral isometry classes `GramIsometric`. The route: a Gram matrix `H` in the genus of `G`
is, by 3H, the Gram matrix of a lattice `M` on the one rational space `V`, and local isometries
`L_p ≅ M_p` (3F) extend to elements `g_p ∈ O(V_p)` with `g_p L_p = M_p`, with `g_p = 1` wherever
`M_p = L_p`; the double coset of `(g_p)` does not depend on the choices, and conversely an adele
determines `M = V ∩ ⋂_p g_p L_p` by N0's reconstruction, in the genus of `L` (O'Meara §§101–102).
*Needs:* 3A, 3F, 3H, N0; T `integralSubgroup`, `isCompact_integralSubgroup`, `rationalDiagonal`,
`orthogonalGroupBaseChange`, `finiteAdelicOrthogonal`, `finiteAdelicSpecialOrthogonal`; M
`DoubleCoset.Quotient`; R Orthogonal and Spin Groups 0C; R Global Quadratic Forms
`hasseMinkowski_equivalent`.

**Checks.**

- `⟨1⟩`: `K_p(L) = O(V_p) = {±1}` at every `p`, the double coset space is a point, and the genus
  is one class; the proper version has `SO(V_p) = 1` and one point as well.
- The genus of `!![4,1;1,6]`: the first double coset space has two points and the second three,
  the class and proper class numbers of B8; a version with `O(V_p)` in place of `K_p(L)` would
  give one point for every genus.
- `⟨1⟩ ⊕ ⟨1⟩`: one class and one proper class, so both double coset spaces are points although
  `K_2⁺(L) ≠ SO(V_2)` (N1); the spinor-norm image, not the stabilizer itself, is what 4C reads.

**4C. Spinor genera.** The images `θ_p(K_p⁺(L))` of the local spinor norm on the stabilizers,
computed from the Jordan data of Layer 3. The spinor genus `spn L` and the proper spinor genus
`spn⁺ L`. The definition through local spinor norms agrees with the definition through adelic
double cosets.

The count of proper spinor genera is a named group, with its image groups made explicit. Let
`J` be the idele group of `ℚ`, the restricted product of the groups `ℚ_pˣ` and `ℝˣ` relative to
the subgroups `ℤ_pˣ`, let `J²` be its subgroup of squares, and let `ℚˣ` sit in `J` diagonally.
The spinor norm takes values in square classes, so each local image is read as the subgroup of
`ℚ_pˣ` that it lifts to, which contains `(ℚ_pˣ)²`; at the real place `θ_∞(SO(V_∞))` is `ℝ_{>0}`
when `V` is definite and `ℝˣ` when it is indefinite. Put

    J_L = {j ∈ J : j_p ∈ θ_p(K_p⁺(L)) for every p, and j_∞ ∈ θ_∞(SO(V_∞))},

so that `J² ⊆ J_L`, and define

    ProperSpinorGenusClassGroup L = J / (ℚˣ · J_L).

The milestone proves the following, each with the rank hypothesis that carries it:

- for `rank L ≥ 2` the group is finite, and every element has order at most 2. The input is
  O'Meara 92:5: for `p ∤ 2 det L` the lattice `L_p` is unimodular of rank at least 2, so
  `θ_p(K_p⁺(L)) = ℤ_pˣ(ℚ_pˣ)²`, hence `ℚˣ J_L ⊇ ℚˣ · ∏_{p ∤ 2 det L} ℤ_pˣ · ℝ_{>0}` and the group is
  a quotient of `∏_{p ∣ 2 det L} ℤ_pˣ/(ℤ_pˣ)²`;
- for `rank L ≥ 3` the map sending a proper class in `gen L` to the spinor norm of an adele
  carrying `L` to it induces a bijection from the proper spinor genera in `gen L` to
  `ProperSpinorGenusClassGroup L`, whose order is the count in O'Meara 102:7. The two inputs are
  `θ_p(SO(V_p)) = ℚ_pˣ` at every finite `p` (91:6, rank at least 3) and
  `θ(SO(V)) = ℚˣ ∩ ∏_v θ_v(SO(V_v))` (101:8, rank at least 3). Together they give
  `J = ℚˣ · θ(J_V)` and `ℚˣ ∩ θ(J_V) = D := θ(SO(V))`, which identifies `J/(ℚˣ J_L)` with
  O'Meara's quotient of the adelic spinor-norm image `θ(J_V)` by `P_D · J_L`;
- **rank 2 is a different statement**, through the torus of B6. `SO(V) = T_L`, and the
  kernel of the spinor norm on `T_L(ℚ_p)` is the subgroup of squares. The proper classes in
  `gen L` are a torsor under the finite group `C_L = T_L(ℚ) \ T_L(𝔸_f) / T_L(ℤ̂)`, and the
  proper spinor genera in `gen L` are the cosets of `C_L²`, so their number is `[C_L : C_L²]`.
  What `C_L` is, and how `J/(ℚˣ J_L)` compares with this count, depends on B1's branch:
  - *nonsquare `Δ`*: the spinor norm of the rotation by `u = a/ā` is the norm `N(a)`, and
    `C_L` is the subgroup of squares in `NarrowPic 𝒪_Δ`, the principal genus, by B2 and B3. The
    group `J/(ℚˣ J_L)` is finite but is **not** the count `[C_L : C_L²]`: the local images
    `θ_p(SO(V_p))` are the norm groups of `K_Δ ⊗ ℚ_p`, so `J ≠ ℚˣ · θ(J_V)`, and the quotient
    is `[J : ℚˣ N(J_{K_Δ})] · [C_L : C_L²] = 2·[C_L : C_L²]`. Witness `x² + y²`: `Δ = −4`, one
    class and one proper spinor genus, while `θ_2(SO(L_2))` is the norm group
    `{1, 2, 5, 10}·(ℚ_2ˣ)²` of `ℚ_2(i)`, so that `J/(ℚˣ J_L) ≅ ℤ_2ˣ/⟨5⟩(ℤ_2ˣ)²` has order 2;
  - *square `Δ = m²`*: `C_L ≅ ((ℤ/mℤ)ˣ)²` by B3's split branch, the rotation `(t, t⁻¹)` has
    spinor norm `t` modulo squares, and the split norm `(a, b) ↦ ab` is surjective, so
    `θ_p(SO(V_p)) = ℚ_pˣ` at every `p` and `J = ℚˣ · θ(J_V)`. With
    `θ_p(K_p⁺(L)) = {t ∈ ℤ_pˣ : t² ≡ 1 (mod p^{v_p(m)})}·(ℚ_pˣ)²` and `θ_∞ = ℝˣ`, the quotient is
    `J/(ℚˣ J_L) ≅ G / (G[2]·G²)` for `G = (ℤ/mℤ)ˣ`, and squaring identifies it with
    `G²/G⁴ = C_L/C_L²`: here the two counts **agree**, and the factor 2 of the nonsquare branch
    is absent. Witnesses: `U` (`m = 1`), where both are trivial, and `5xy + y²` (`m = 5`), where
    `G ≅ ℤ/4`, `G[2]·G² = {±1}` and both have order 2;
- **ranks 0 and 1 are computed directly**: `gen L` is one class and `O(L)` contains `−1`, so
  there is one proper class and one proper spinor genus. The rank-one lattice `⟨1⟩` is a
  compulsory rejection test of the general formula: `SO(V_v) = 1` at every place, so `J_L = J²`,
  and `J/(ℚˣ J²)` is infinite. Restrict to the unit ideles `W = ∏_p ℤ_pˣ × ℝˣ`: if `q·j²` lies
  in `W` with `q ∈ ℚˣ` and `j ∈ J`, then `q` has even valuation at every prime, so `q = ±r²` with
  `r ∈ ℚˣ`, and `W ∩ ℚˣ J² = {±1}·W²`. Hence `W/(W ∩ ℚˣ J²)` is the infinite product of the
  groups `ℤ_pˣ/(ℤ_pˣ)²` of order 2 over odd `p`, together with the finite factors at 2 and `∞`,
  modulo the single global sign class; it is infinite. (A rational diagonal does not change
  only finitely many local square classes — `−1` is a nonsquare unit at every `p ≡ 3 (mod 4)` —
  but it removes at most one class from this product.)

The local images `θ_p(K_p⁺(L))` are N1's native `localSpinorNormImage`, and the adelic spinor norm
on `SO(V)(𝔸_f)` with values in the restricted product of the local square-class groups relative
to them is native (`adelicSpinorNorm`, `finiteAdelicSquareClasses`); the group `J/(ℚˣ·J_L)` and
the bijection are the targets. *Needs:* 3C, 3D, 4B, N1; T `squareClass`, `localSpinorNormImage`,
`adelicSpinorNorm`; for rank 2, B2, B3, B6; R Orthogonal and Spin Groups Layers 1 and 2.

**Checks.**

- `⟨1⟩`: one class, one proper class and one proper spinor genus, while `J/(ℚˣ J_L)` is the
  infinite group computed above; the rank hypothesis `rank L ≥ 2` of the finiteness statement
  cannot be dropped.
- `x² + y²` (`Δ = −4`): one class and one proper spinor genus, `[C_L : C_L²] = 1`, while
  `J/(ℚˣ J_L) ≅ ℤ₂ˣ/⟨5⟩(ℤ₂ˣ)²` has order 2: the rank-2 count is not `|J/(ℚˣ J_L)|`.
- `5xy + y²` (`Δ = 25`, split): `G = (ℤ/5)ˣ ≅ ℤ/4`, `G[2]·G² = {±1}`, so `J/(ℚˣ J_L)` and
  `C_L/C_L²` both have order 2; for `U` (`m = 1`) both are trivial.


**4E. Class numbers of indefinite binary lattices.** The rank-`≥ 3` statement is OTM §0.3's.
For rank 2 an indefinite `L` has `Δ > 0`, and the theorem
splits with B1's branch. For nonsquare `Δ`, B2's **oriented** map identifies the proper classes
of primitive forms of discriminant `Δ` with the consumed `NarrowPic 𝒪_Δ`, which is finite
(`finite_narrowPic`, or B5's cycle count); `Pic 𝒪_Δ` would not do, since `x² − 3y²` and
`−x² + 3y²` are two proper classes with the same ideal class (B2). For square `Δ = m²`, B5 counts
the split proper classes directly as `φ(m)`, with no ideal-class carrier. In both branches the
proper classes in `gen L` are finitely many, and the classes are their images under forgetting
the orientation, so they are finitely many too (`finite_genusClasses_rank_two`). The rank-2 proof
does not use strong approximation, and the proof for rank at least 3 does not cover rank 2.

**4F. Automorphism groups of indefinite lattices.** For an indefinite nondegenerate lattice
of rank at least 3, `O(L)` is infinite. The proof splits by whether `V = ℚ ⊗ L` has a nonzero
isotropic vector, because an indefinite rational space need not have one: the form
`x² + y² − 3z²` is indefinite over `ℝ` and anisotropic over `ℚ`, since a primitive integral
solution of `x² + y² = 3z²` forces `3 ∣ x` and `3 ∣ y`.

- **Isotropic case.** Choose a primitive isotropic `u ∈ L`, which exists because an
  isotropic rational vector can be scaled to a primitive lattice vector. For `w ∈ u^⊥ ∩ L`
  the Eichler transvection of Orthogonal and Spin Groups 2C is

      E_{u,w}(x) = x + β(x, u)·w − β(x, w)·u − ½N_L(w)·β(x, u)·u,

  the supplier's `Q(w)` being `½N_L(w)` in this roadmap's bilinear-first notation. The
  supplier already states `w ↦ E_{u,w}` as a homomorphism on `u^⊥/ℚu`, and the integral
  statement below is the specialization of that, not a strengthening of it: the parameter
  is **not** `w` itself. Since `N_L(u) = 0` and `β(u, w) = 0`, the substitution
  `w ↦ w + a·u` leaves every term unchanged, so `E_{u,w+au} = E_{u,w}` for every `a ∈ ℤ`,
  and every nonzero multiple of `u` lies in the kernel; no finite-index subgroup of
  `u^⊥ ∩ L` avoids those, so `w ↦ E_{u,w}` is injective on none of them. The parameter is
  the class of `w` in

      Λ_u = (u^⊥ ∩ L) / ℤu,

  which is free of rank `rank L − 2`, because `u` is primitive in `L` and therefore
  primitive in `u^⊥ ∩ L`. The milestone proves four statements:

  - `E_{u,w}` depends only on the class of `w` in `Λ_u`, and the induced map
    `Λ_u → O(V)` is a group homomorphism;
  - it is injective: if `E_{u,w} = E_{u,w'}`, evaluate at an `x` with `β(x, u) ≠ 0`, which
    exists because `β` is nondegenerate, to get `β(x, u)·(w − w') ∈ ℚu`; primitivity of `u`
    gives `ℚu ∩ L = ℤu`, and dividing by the nonzero integer `β(x, u)` inside `ℚu` puts
    `w − w'` in `ℤu`;
  - the integrality condition is on `N_L(w)`, not on `w`: for `w` in the sublattice
    `M_u = {w ∈ u^⊥ ∩ L : N_L(w) ∈ 2ℤ}`, which has index 1 or 2 because `N_L mod 2` is
    additive, every coefficient above is an integer, so `E_{u,w}` and its inverse
    `E_{u,−w}` preserve `L` and `E_{u,w} ∈ O(L)`;
  - the image of `M_u` in `Λ_u` has rank `rank L − 2 ≥ 1`, so it is infinite.

  Hence `O(L)` is infinite. In rank 2 the quotient `Λ_u` is trivial, which is the correct
  reason this argument stops there and B4 takes over.
- **Anisotropic case.** Choose a rational nondegenerate indefinite plane `W ⊆ V`, which
  exists because `t₊ > 0` and `t₋ > 0`. Put `M = L ∩ W` and `N = L ∩ W^⊥`. Then `M ⊕ N` has
  finite index in `L`, and `M` is an indefinite binary lattice whose norm form is
  anisotropic over `ℚ`, so `O(M)` is infinite by B4. The group `O(M) × O(N)` acts on the
  finite set of overlattices of `M ⊕ N` of that index, so the stabilizer of `L` has finite
  index in it and is again infinite, and it embeds in `O(L)`.

Together with B4 this settles the definiteness hypothesis in 2C, and it is why Layer 7
treats positive definite genera only.

**4G. Kneser neighbors.** Integral lattices `L` and `M` on `V` are `p`-neighbors when
`[L : L ∩ M] = [M : L ∩ M] = p`. This milestone asks for:

- the definition and its symmetry;
- equality of determinants for neighbors;
- equality of genus when `p ∤ 2 det L`;
- the construction of a neighbor from an isotropic vector mod `p`;
- a decidable check for one edge.

This milestone proves nothing about enumeration. Connectivity of the neighbor graph is not
claimed, and no consumer may infer a complete list of classes from neighbor steps. The
construction, for `p ∤ 2 det L`: choose `v ∈ L` primitive with `β(v, v) ≡ 0 (mod 2p²)`, which an
isotropic vector mod `p` can be adjusted to, put `L_v = {x ∈ L : β(x, v) ≡ 0 (mod p)}`, of index
`p` in `L`, and `M = L_v + ℤ·(v/p)`; then `M` is integral, `[M : L_v] = p`, and `M` is a
`p`-neighbour of `L` in the genus of `L` (Kneser; Voight, *Kneser's method of neighbors*, §2).
*Needs:* 0C, 3F; M `Submodule.basisOfPid`.

**Checks.**

- `L = M`: `[L : L ∩ M] = 1 ≠ p`, so a lattice is not its own neighbour, and `L`, `M` with
  `[L : L ∩ M] = p` but `[M : L ∩ M] = 1` (a sublattice of index `p`) are not neighbours either.
- `L = ℤ²` with `x² + y²` and `p = 5`: `v = (11, 2)` has `β(v, v) = 125 ≡ 0 (mod 50)`,
  `L_v = {(a, b) : a + 2b ≡ 0 (mod 5)}`, and `M = L_v + ℤ·(11/5, 2/5)` contains
  `(3/5, −4/5) = (5, 0) − 2·(11/5, 2/5)` and `(−4/5, −3/5)`, an orthonormal basis, so `M ≅ ℤ²` is a
  rotated copy of `L`: a neighbour in the genus, of the same determinant, and distinct from `L`.
- `L = ℤ²` with `x² + y²` and `p = 2`: no primitive `v` has `β(v, v) ≡ 0 (mod 8)`, since
  `(1 + 2a)² + (1 + 2b)² ≡ 2 (mod 4)`, so the construction produces nothing at `p = 2` and the
  genus claim is made only for `p ∤ 2 det L`.

### Examples

`⟨1⟩` has one class and an infinite `J/(ℚˣ J_L)`; `x² + y²` has one class and `J/(ℚˣ J_L)` of order 2; the genus of `!![4,1;1,6]` has two classes.

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| 4A | L 2C, 2G, 3F, B2, B5 |
| 4B | T `integralSubgroup`, `isCompact_integralSubgroup`, `rationalDiagonal`, `orthogonalGroupBaseChange`, `finiteAdelicOrthogonal`, `finiteAdelicSpecialOrthogonal`; M `DoubleCoset.Quotient`; L 3A, 3F, 3H, N0; R Orthogonal and Spin Groups 0C; R Global Quadratic Forms `hasseMinkowski_equivalent` |
| 4C | T `squareClass`, `localSpinorNormImage`, `adelicSpinorNorm`, `finiteAdelicSquareClasses`; L 3C, 3D, 4B, N1; rank 2 also L B2, B3, B6; R Orthogonal and Spin Groups Layers 1 and 2 |
| N0 | T `integralOrthogonalSubgroup`, `OrthogonalCompactOpens.integral`, `localizationToCompletion`; L 3A; R Restricted Products Layers 1--3 |
| N1 | T `localSpinorNormImage`, `eventually_localSpinorNormImage_integral_eq_unitSquareClasses`, `map_spinorNorm_comap_integralOrthogonalSubgroup_eq_unitSquareClasses`, `spinorNorm`, `spinorNorm_reflectionPairSpecialOrthogonal`; L 3C, 3D, 3E, N0 |
| 4E, rank 2 | L B2, B5 |
| 4F | L 0E, 2C, B4; R Orthogonal and Spin Groups Layer 2 |
| 4G | M `Submodule.basisOfPid`; L 0C, 3F |

## Layer 5: discriminant forms and Nikulin's theory

Citations are to Nikulin, *Integer symmetric bilinear forms and some of their geometric
applications*, where the numbering of the translation agrees with the original. His `E₈` is
negative definite, so each citation carries the twist.

This layer owns the existence half of Nikulin's theory: the genus of an even lattice from its
discriminant form, existence of an even lattice with given invariants, existence of primitive
embeddings, the gluing description of primitive embeddings, and the existence and genus theorem
for 2-elementary lattices. Every uniqueness, stabilization, splitting and surjectivity theorem of
Nikulin's §§1.13–1.14 and 3.6.3 is `IntegralLatticesPartII`'s (§*Scope and ownership*), because
its proof passes through Eichler's theorem.

The construction behind 5A and 5B is the following. For 5A, determine each local even lattice
from its `p`-primary finite quadratic form and its rational invariants using 3C and 3D and the
local determinant/Hasse dictionary, prove the odd bilinear-form analogue separately, and match
the local completions with the genus carrier of N0; the two symbol translations of 3E are part of
the milestone. For 5B, construct `K(q_p)` on a free `ℤ_p`-module of rank `l(A_{q_p})`, keep its
determinant valuation, and prove that its unit part modulo unit squares is independent of the
choice at odd `p`, and at `p = 2` exactly when `q₂` has no summand `q_θ^{(2)}(2)`. Prove the four
conditions of `NikulinExistenceConditions` necessary, from the completions, the determinant and
Milgram's theorem 1I. For sufficiency construct local Jordan lattices of rank `t₊ + t₋` with the
prescribed discriminant forms, enforcing both equality-case determinant clauses; choose the real
signature; convert the local invariants into a rational global form with the realization theorem
of Global Quadratic Forms and the Hilbert product formula (Quadratic Form Invariants, Class Field
Theory); and produce the integral lattice and its discriminant-form isometry by the adelic
reconstruction of N0.

**5A. The genus and the discriminant form.** For even lattices, `gen L` is determined by
`(t₊, t₋, q_L)`, which is Nikulin Corollary 1.9.4. The odd analogue is Corollary 1.16.3: the
genus of any nondegenerate lattice over `ℤ` is determined by its parity together with
`(t₊, t₋, b_L)`, where `b_L` is the discriminant bilinear form of 1D. Both statements are
milestones. So is the translation between the Conway–Sloane symbols of 3E and the invariants
`(t₊, t₋, q)`, in both directions, since the K3 work uses the second and the mass formula
uses the first. *Needs:* 1D, 1G, 3E, 3F.

**Checks.**

- `E₈ ⊕ E₈` and `D₁₆⁺`: both have invariants `(16, 0, 0)`, so Corollary 1.9.4 puts them in one
  genus, which is half of 6D.
- `I₈` and `E₈`: both have `(8, 0)` and `b_L = 0`, and they are in different genera, so parity is
  part of the data of Corollary 1.16.3 and cannot be dropped.
- `⟨1⟩ ⊕ ⟨5⟩` and `!![2,1;1,3]`: both odd with `A_L ≅ ℤ/5`, and `b_L` takes the values
  `{1/5, 4/5}` on the generators of the first and `{2/5, 3/5}` on those of the second (the dual
  generator `(3/5, −1/5)` of the second has norm `3/5`), so `b_L` separates the genera, in
  agreement with 3F's test at 5.

**5B. Existence.** An even lattice with invariants `(t₊, t₋, q)` exists if and only if:

1. `t₊ − t₋ ≡ sign q (mod 8)`;
2. `t₊ ≥ 0`, `t₋ ≥ 0`, and `t₊ + t₋ ≥ l(A_q)`;
3. `(−1)^{t₋} |A_q| ≡ discr K(q_p) (mod (ℤ_p^*)²)` for every odd prime `p` with
   `t₊ + t₋ = l(A_{q_p})`;
4. `|A_q| ≡ ± discr K(q₂) (mod (ℤ_2^*)²)`, whenever `t₊ + t₋ = l(A_{q₂})` and `q₂` has no
   summand `q_θ^{(2)}(2)`.

This is Theorem 1.10.1 (`exists_evenLattice_iff`, with the left side `EvenLatticeWithInvariants`
and the dyadic alternative `FiniteQuadraticModule.HasCyclicTwoSummand`). Corollary 1.10.2
(`exists_evenLattice_of_lt`) is the sufficient form: conditions 1 and 2 with
the strict inequality `t₊ + t₋ > l(A_q)`. Both are milestones, and the corollary does not
replace the theorem.

⚠ **The four conditions are a typed object, not a table.** The boundary conditions 3 and 4 are
the highest-risk part of this roadmap: each applies only at the equality `t₊ + t₋ = l(A_{q_p})`,
condition 4 additionally switches off when `q₂` has a summand `q_θ^{(2)}(2)`, and the two
determinant clauses differ — condition 3 carries the sign `(−1)^{t₋}` and condition 4 allows
either sign. Omitting one clause, or folding all four into a single named hypothesis, produces
a statement that is not Theorem 1.10.1 and that nothing in the review of an implementation would
catch. `Suggested.lean` therefore pins the predicate as `NikulinExistenceConditions`, with one
field per clause and with `l`, the `p`-primary components, the Gauss-sum invariant and the
square class `discr K(q_p)` all named; a predicate with one field standing for all the local
conditions is an explicit rejection test. The theorem is then stated as an `↔`: the predicate holds exactly when an even lattice
with those invariants exists.

The square class `discr K(q_p)` is Nikulin's, and 5B owns its construction as well as the
theorem: `K(q_p)` is a `p`-adic lattice of rank `l(A_{q_p})` whose discriminant form is `q_p`,
and `discr K(q_p)` is its determinant square class in `ℚ_p^*/(ℚ_p^*)²`. Existence is by 3C at
odd `p` and by 3D at `p = 2`. Uniqueness up to isometry, hence independence of the class from
the chosen `K(q_p)`, is a theorem of the milestone at odd `p` and, at `p = 2`, **exactly when
`q₂` has no summand `q_θ^{(2)}(2)`** (Nikulin Theorem 1.9.1). It is false without that
exception, and the failure is the reason condition 4 switches off: over `ℤ₂` the rank-one even
lattices `⟨2⟩` and `⟨10⟩` both have discriminant group of order 2, on whose generator the
half-norm forms take the values `1/4` and `5/4`, equal in `ℚ/ℤ`, so both are minimal
realizations of `q_1^{(2)}(2) = q_5^{(2)}(2)`; their determinants differ by 5, which is not a
square in `ℚ₂`, so the two determinant square classes differ. In the exceptional case the two
realizations always differ by exactly this factor 5, and `discr K(q₂)` is a choice between two
classes that condition 4 never reads. `Suggested.lean` computes `discr K(q_p)` from a generator
decomposition of `q` (`FiniteQuadraticModule.NikulinDecomposition.padicDiscriminant`): the minimal
realizations are `⟨θ·p^k⟩` for `q_θ^{(p)}(p^k)`, `⟨θ·2^k⟩` for `q_θ^{(2)}(2^k)`, `2^k·U` of
determinant `−4^k` for `u^{(2)}(2^k)` and `2^k·!![2,1;1,2]` of determinant `3·4^k` for
`v^{(2)}(2^k)`, and `discr K(q_p)` is the square class of the product over the `p`-primary
generators. It states the choice-independence with the
exception in its hypothesis (`padicDiscriminant_eq_squareClass_gramDet`); the pair `⟨2⟩`, `⟨10⟩`
above is the Check that refutes a version claiming unconditional independence.
The ratio in conditions 3 and 4 is a `p`-adic unit because `A_{K(q_p)} ≅ q_p` forces
`v_p(det K(q_p)) = v_p(|A_q|)`, and that observation is what makes the two conditions well
posed.

**5F. Primitivity.** An injection of finite free `ℤ`-modules has torsion-free cokernel
exactly when its image is a direct summand (Smith normal form, Mathlib
`Submodule.smithNormalFormOfRankEq`). A primitive embedding of integral lattices
(`IsPrimitiveEmbedding`) is an injective form-preserving map of the ambient spaces carrying one
carrier into the other with saturated image (Nikulin, §1, 5°). Every statement below quantifies
over primitive embeddings. *Needs:* M `Submodule.basisOfPid`, `IsCompl`.

**Checks.**

- `2ℤ ⊂ ℤ` is not primitive (cokernel `ℤ/2`), `ℤe₁ ⊂ ℤ²` is, and `ℤ(1, 1) ⊂ ℤ²` is while
  `ℤ(2, 2)` is not: primitivity is saturation, not the norm of the generator.
- The zero lattice embeds primitively into every lattice, and a lattice embeds primitively into
  itself by the identity, with trivial orthogonal complement.
- A map that doubles the ambient space, `ℚ → ℚ`, `x ↦ 2x`, carries `ℤ` into `ℤ` with cokernel
  `ℤ/2` and is excluded by the saturation clause although it is injective.

**5G. Primitive embeddings into an even unimodular lattice.** Theorem 1.12.2
(`exists_primitiveEmbedding_iff` states (1) ⇔ (2) under `t₊ ≤ l₊` and `t₋ ≤ l₋`, which (1)
forces and which keep the natural-number differences in (2) exact): for an even
lattice `S` with invariants `(t₊, t₋, q)` and integers `l₊`, `l₋`, the following are
equivalent:

1. `S` embeds primitively into some even unimodular lattice of signature `(l₊, l₋)`;
2. an even lattice with invariants `(l₊ − t₊, l₋ − t₋, −q)` exists;
3. all four of: `l₊ − l₋ ≡ 0 (mod 8)`; `l₊ − t₊ ≥ 0`, `l₋ − t₋ ≥ 0` and
   `l₊ + l₋ − t₊ − t₋ ≥ l(A_q)`; `(−1)^{l₊ − t₊} |A_q| ≡ discr K(q_p) (mod (ℤ_p^*)²)` for
   every odd `p` with `l₊ + l₋ − t₊ − t₋ = l(A_{q_p})`; and
   `|A_q| ≡ ± discr K(q₂) (mod (ℤ_2^*)²)` if `l₊ + l₋ − t₊ − t₋ = l(A_{q₂})` and `q₂` has no
   summand `q_θ^{(2)}(2)`.

Corollary 1.12.3 is the sufficient form with `l₊ + l₋ − t₊ − t₋ > l(A_q)`. Theorem 1.12.4
(`forall_exists_primitiveEmbedding_iff`) is the criterion in terms of the signatures alone: for nonnegative integers `t₊, t₋, l₊, l₋`,
every even lattice of signature `(t₊, t₋)` embeds primitively into some even unimodular
lattice of signature `(l₊, l₋)` if and only if `l₊ − l₋ ≡ 0 (mod 8)`, `t₊ ≤ l₊`, `t₋ ≤ l₋`,
and `2(t₊ + t₋) ≤ l₊ + l₋`.

**5I. Primitive embeddings into a general even lattice.** Proposition 1.15.1: primitive
embeddings of `S` into even lattices with invariants `(m₊, m₋, q)` correspond to tuples
`(H_S, H_q, γ; K, γ_K)`. The components are:

- subgroups `H_S ≤ A_S` and `H_q ≤ A_q`;
- an isometry `γ` from `q_S|H_S` to `q|H_q`;
- an even lattice `K` with invariants `(m₊ − t₊, m₋ − t₋, −δ)`, where
  `δ = (q_S ⊕ (−q))|Γ_γ^⊥ / Γ_γ` and `Γ_γ ⊆ A_S ⊕ A_q` is the graph of `γ`;
- an isometry `γ_K` from `q_K` to `−δ`.

Two tuples `(H_S, H_q, γ; K, γ_K)` and `(H'_S, H'_q, γ'; K', γ'_K)` give isomorphic
primitive embeddings exactly when `H_S = H'_S` and there are `ξ ∈ O(q)` and an isometry
`ψ : K ≅ K'` such that

1. `ξ(H_q) = H'_q`, so that `ξ` restricts to an isometry `ξ|_{H_q} : q|H_q ≅ q|H'_q`;
2. `γ' = ξ|_{H_q} ∘ γ`, an equation of isometries `q_S|H_S ≅ q|H'_q`, which is typed
   because `H'_S = H_S` makes the two sides share a source;
3. `ξ̄ ∘ γ_K = γ'_K ∘ ψ̄`, an equation of isometries `q_K ≅ −δ'`.

The two induced maps in the third equation are named, and neither is assumed. Condition 1
makes `id_{A_S} ⊕ ξ` an isometry of `q_S ⊕ (−q)` that carries the graph `Γ_γ` onto
`Γ_{γ'}`, hence `Γ_γ^⊥` onto `Γ_{γ'}^⊥`, hence induces the isometry `ξ̄ : δ ≅ δ'` of the
quotient forms, which is also an isometry `−δ ≅ −δ'`; and `ψ̄ : q_K ≅ q_{K'}` is the
isometry of discriminant forms induced by `ψ` through the functoriality of 1D. The same
tuples give isomorphic primitive sublattices under the weaker condition that `H_S` and
`H'_S` are conjugate by an automorphism of `S`.
The lattice `K` is the orthogonal complement of `S`. Corollary 1.15.2 states the genus-level
version. *Needs:* 1F, 5G.

**Checks.**

- `S = ⟨2⟩` in `A₂`, invariants `(2, 0, q_{A₂})`: `H_S = H_q = 0` since `A_S = ℤ/2` and
  `A_q = ℤ/3` share no subgroup, `K = ⟨6⟩` (spanned by `a + 2b` for roots `a, b`), and
  `δ = q_S ⊕ (−q_{A₂})` on `ℤ/2 ⊕ ℤ/3 ≅ ℤ/6` takes the value `1/4 − 1/3 = −1/12` on the
  generator, while `q_K(1/6) = 6/(2·36) = 1/12 = −δ`.
- `S = ⟨2d⟩` in `U`: `K = ⟨−2d⟩`, `δ = q_S` since `q_U = 0`, and `q_K = −q_S`.
- `S = 0`: `K` is the whole lattice, `δ = −q` and `γ_K` is the identity; `H_S = H'_S = 0` and the
  isomorphism condition reduces to `ξ ∈ O(q)` and an isometry `K ≅ K'`.

**5J. 2-elementary lattices** (`exists_twoElementaryLattice_iff`, with the left side
`TwoElementaryLatticeWithInvariants`). `S` is 2-elementary when `A_S ≅ (ℤ/2)^a`. Then `q_S` is an
orthogonal sum of forms `q_θ^{(2)}(2)`, `u^{(2)}(2)` and `v^{(2)}(2)`, and `δ_S` is 0 when
no summand `q_θ^{(2)}(2)` occurs and 1 otherwise. Theorem 3.6.2: the genus of an even
2-elementary lattice is determined by `(δ_S; t₊, t₋, a)`, and such a lattice exists, for `δ_S ∈ {0,1}` and
`a, t₊, t₋ ≥ 0`, if and only if (the genus statement follows from 5A; the statement that the
invariants determine an indefinite lattice up to isometry is `IntegralLatticesPartII`'s):

1. `a ≤ t₊ + t₋`;
2. `t₊ + t₋ + a ≡ 0 (mod 2)`;
3. `t₊ − t₋ ≡ 0 (mod 4)` when `δ_S = 0`;
4. `δ_S = 0` and `t₊ − t₋ ≡ 0 (mod 8)` when `a = 0`;
5. `t₊ − t₋ ≡ ±1 (mod 8)` when `a = 1`;
6. `δ_S = 0` when `a = 2` and `t₊ − t₋ ≡ 4 (mod 8)`;
7. `t₊ − t₋ ≡ 0 (mod 8)` when `δ_S = 0` and `a = t₊ + t₋`.

⚠ These seven conditions are a typed object for the same reason as 5B's four, and
`Suggested.lean` pins them as `TwoElementaryAdmissible`, one field per clause, with the
theorem stated as an `↔`. Conditions 4 to 7 are boundary clauses at `a = 0`, `a = 1`, `a = 2`
and `a = t₊ + t₋`, and each is independent of the ones before it. Four tuples
`(δ_S, t₊, t₋, a)` witness that, and the milestone checks them:

- `(0, 4, 0, 0)` passes 1 to 3 and is excluded only by 4. It must be excluded, because
  `a = 0` means unimodular and 1I gives `8 ∣ t₊ − t₋`;
- `(1, 3, 0, 1)` passes 1 to 4 and is excluded only by 5;
- `(1, 4, 0, 2)` passes 1 to 5 and is excluded only by 6;
- `(0, 4, 0, 4)` passes 1 to 6 and is excluded only by 7.

### Examples

`⟨2⟩` and `⟨10⟩` realize one `q₂` with determinant classes differing by 5; `Λ_{K3} = U³ ⊕ E₈(−1)²` contains a primitive `⟨2d⟩` for every `d > 0` by 5G; `(δ; t₊, t₋, a) = (1, 1, 0, 1)` is realized by `⟨2⟩`.

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| 5A | L 1D, 1G, 3E, 3F |
| 5B | L 1G, 1H, 3C, 3D, 5A |
| 5F | M `Submodule.basisOfPid`, `IsCompl` |
| 5G | L 1E, 1F, 5B, 5F |
| 5I | L 1F, 5G |
| 5J | L 1G, 5A, 5B |

## Layer 6: unimodular lattices in low rank

**6A. Indefinite classification.** Let `L` be indefinite unimodular of signature
`(t₊, t₋)`, and put `k = |t₊ − t₋| / 8`. If `L` is even, then `8 ∣ t₊ − t₋` by 1I, and the
signature determines `L`:

- if `t₊ ≥ t₋`, then `L ≅ U^{t₋} ⊕ E₈^{k}`, with the positive definite `E₈`;
- if `t₋ ≥ t₊`, then `L ≅ U^{t₊} ⊕ E₈(−1)^{k}`.

If `L` is odd, then `L ≅ ⟨1⟩^{t₊} ⊕ ⟨−1⟩^{t₋}` (Serre, *A Course in Arithmetic*, V.2.2;
Milnor–Husemoller, Chapter II). In Gram form: two even unimodular indefinite Gram matrices of
equal signature are integrally equivalent (`equivalent_of_isEven_unimodular_indefinite`), and two
odd ones are too (`equivalent_of_odd_unimodular_indefinite`).

**Checks.**

- `U` and `⟨1⟩ ⊕ ⟨−1⟩` have signature `(1, 1)` and determinant `−1` and are not equivalent: parity
  is a hypothesis of each statement, and a version that drops it is false.
- `E₈ ⊕ E₈` and `D₁₆⁺` are even unimodular of signature `(16, 0)` and are not isometric (6D): the
  indefiniteness hypothesis cannot be dropped.
- `U ⊕ E₈ ⊕ E₈(−1)` is even unimodular indefinite of signature `(9, 9)`, so it is isometric to
  `U⁹`: summands `E₈` of opposite signs are absorbed into hyperbolic planes, as the normal form
  `U^{min(t₊,t₋)} ⊕ E₈(±1)^k` with `k = 0` records.

**6B. Existence in the definite case.** An even unimodular positive definite lattice of
rank `n` exists exactly when `8 ∣ n` (`exists_isEven_isUnimodular_isPosDef_iff`). Existence is
Serre's construction V.1.4.3 of `Γ₈ = E₈`, taken to the power `n/8`, as the remark after V.2
Theorem 2 records; necessity is Corollary 2 of that theorem, which is 1I.

**Checks.**

- `n = 0`: the zero lattice is even, unimodular and positive definite, and `8 ∣ 0`.
- `n = 8`: `E₈` (native `typeE₈RootLattice`); `n = 4`: `D₄` is even and positive definite but has
  determinant 4, so it is not a counterexample.
- `I₈` is unimodular and positive definite of rank 8 but odd; the statement for all unimodular
  lattices would wrongly forbid `I₁`.

**6C. Rank at most 9.** A positive definite unimodular lattice of rank at most 9 is `Iₙ`,
`E₈`, or `E₈ ⊕ I₁` (O'Meara 106:13). The proof follows O'Meara: uniqueness of the decomposition
into indecomposable summands, and a count of the characteristic vectors of 1L; the alternative
proof through root systems, in which the minimal vectors form a root system of type `E₈`,
discharges the same milestone. The statements are: every even unimodular positive definite
lattice of rank 8 is isometric to the native `E₈`
(`nonempty_isometry_typeE₈RootLattice_of_isEven_of_finrank_eq_eight`); every odd unimodular
positive definite Gram matrix of size at most 8 is equivalent to the identity
(`equivalent_one_of_odd_unimodular_posDef_of_le_eight`); and in size 9 a unimodular positive
definite Gram matrix is equivalent to `I₉` or to the block sum of the `E₈` Cartan matrix and `I₁`
(`equivalent_one_or_e8_sum_one_of_unimodular_posDef_nine`).

**Checks.**

- Rank 8: `I₈` and `E₈` are both unimodular positive definite and are not isometric, because `E₈`
  is even and `I₈` is odd; the parity hypothesis separates the two rank-8 statements.
- Rank 9: `E₈ ⊕ I₁` and `I₉` are both odd unimodular; `E₈ ⊕ I₁` has 2 vectors of norm 1 and `I₉`
  has 18, so they are not isometric and both alternatives occur.
- Rank 12: `D₁₂⁺` is odd unimodular positive definite and is not `I₁₂` (it has no vector of norm
  1), so the bound `rank ≤ 9` (for the odd statement, `≤ 8` without the `E₈ ⊕ I₁` alternative)
  is needed.

**6D. Rank 16, the two classes.** `E₈²` and `D₁₆⁺` are even unimodular of rank 16, they lie
in one genus, and they are not isometric, because their root systems differ (Serre V.1.4.3 for
`Γ₁₆ = D₁₆⁺` and VII.6.6 for the non-isomorphism; the construction is the supplement below). This
milestone constructs both lattices and proves those four statements. It claims no completeness:
that the genus has no third class is 7I, which comes after the mass formula and belongs to
`OrthogonalTamagawaAndLatticeMass`. §*Scope and ownership* records 6D and 7I as a pair, and only
the pair is the rank-16 classification. *Needs:* 2C, 3F, 5A, 6B.

**Checks.**

- Determinants: `E₈ ⊕ E₈` has `1·1 = 1`; `D₁₆` has `4` and `D₁₆⁺ ⊃ D₁₆` has index 2, so `4/4 = 1`;
  both are even, `D₁₆⁺` because `h² = 16/4 = 4`, and both have signature `(16, 0)`, so they are in
  one genus by 5A.
- Roots: `E₈ ⊕ E₈` has `2·240 = 480` and `D₁₆⁺` has the `4·C(16,2) = 480` roots of `D₁₆`, the coset
  `h + D₁₆` having minimum norm `4`; counting roots does not separate them, the index of the root
  span does: `1` for `E₈ ⊕ E₈` and `2` for `D₁₆⁺`.
- At `n = 8` the same construction gives `D₈⁺ ≅ E₈` (native `typeE₈IsometryD8Plus`): there
  `h² = 2`, the coset `h + D₈` contributes `128` roots, `112 + 128 = 240`, and the root span is
  everything; the rank hypothesis `n = 16` of the non-isometry is used through `h² = 4`.

The 24 even unimodular positive definite lattices of rank 24 are constructed by
Rank-24 lattice constructions, Layers 3 and 6 (§*Scope and ownership*); no milestone here
constructs or consumes them.

**6F. Two models of `E₈`.** The Gram matrix model of 0G and the coordinate model
`{x ∈ ℤ⁸ ∪ (ℤ+½)⁸ : ∑ x ∈ 2ℤ}` are isometric (Serre V.1.4.3; Conway–Sloane, SPLAG Chapter 4).
The proof gives Tau Ceti one `E₈` and one isometry, rather than two unrelated lattices; the native
`typeE₈IsometryD8Plus` is that isometry for the spinor coset of `D₈`, and the milestone identifies
the coordinate model above with `D₈⁺`. *Needs:* 0G, 1K, 2B.

**Checks.**

- The coordinate model has determinant 1 (`D₈` has determinant 4 and index 2), minimum 2, and
  `112 + 128 = 240` roots, the `±e_i ± e_j` and the `(±½)⁸` with an even number of minus signs;
  the Cartan Gram matrix `CartanMatrix.E 8` has determinant 1 and 240 roots.
- The other even coset `h' + D₈` with `h' = (½, …, ½, −½)` gives a second lattice isometric to
  `E₈` by a sign change; the odd coset `e₁ + D₈` gives `ℤ⁸ = I₈`, which is not `E₈`, so the
  choice of coset is part of the definition.
- `D₈` itself is not unimodular and has only 112 roots.

**6G. The order of `O(E₈)`.** Reflections in the 240 roots of `E₈` generate `O(E₈)`, and
`−1` lies in that group, so `O(E₈) = W(E₈)`. The order is computed by orbits and
stabilizers: `W(E₈)` is transitive on the 240 roots with stabilizer `W(E₇)`; `W(E₇)` is
transitive on its 126 roots with stabilizer `W(D₆)`; and `|W(D₆)| = 2⁵·6! = 23040`. Hence

    |O(E₈)| = 240 · 126 · 23040 = 696729600.

The statement is `natCard_isometry_typeE₈RootLattice` on the native `E₈`. This milestone is owned
here. The Root Systems roadmap classifies root systems and defines the Weyl group order
abstractly, and it proves no type-specific value.

**Checks.**

- `240 · 126 · 23040 = 696729600 = 2¹⁴·3⁵·5²·7`; the orbit chain uses `|W(E₇)| = 126·23040 =
  2903040` and `|W(D₆)| = 2⁵·720`.
- A count that omits `−1`, or takes `SO(E₈)`, gives `348364800`; `−1 ∈ W(E₈)` and has determinant
  `+1` in rank 8, so `O(E₈) = W(E₈)` while `[O(E₈) : SO(E₈)] = 2` because reflections have
  determinant `−1`.
- `|O(A₂)| = 12 = 2·|W(A₂)|`: for `A₂` the root reflections do not give `−1`, so `O = W` is
  special to `E₈` and is part of the theorem.

**6H. The failure of cancellation over `ℤ`.** Prove that `E₈ ⊕ E₈ ⊕ U` and `D₁₆⁺ ⊕ U` are
isometric although `E₈ ⊕ E₈` and `D₁₆⁺` are not: both sums are even unimodular indefinite of
signature `(17, 1)`, so 6A identifies them, and 6D separates the summands (Milnor–Husemoller,
Chapter II, §5; Serre, V.2.2). This is why the native splitting theorem has unimodularity of the
summand, and not cancellation, as its form.

**Checks.**

- `ℤ` with `β(x, y) = xy` and `M = 2ℤ`: the restriction to `M` is nondegenerate, `M^⊥ = 0`, and
  `M ⊕ M^⊥ = 2ℤ ≠ ℤ`, so nondegeneracy of `β|_M` does not split `M` off.
- The two sides have rank 18, determinant `−1` and signature `(17, 1)`; dropping `U` would claim
  `E₈ ⊕ E₈ ≅ D₁₆⁺`, which 6D refutes through the root spans.
- `U ⊕ ⟨1⟩ ≅ ⟨1⟩ ⊕ ⟨−1⟩ ⊕ ⟨1⟩ = I_{2,1}` (6A odd) while `U ≇ ⟨1⟩ ⊕ ⟨−1⟩`: cancellation also fails
  for parity.

### Examples

`E₈` is the unique even unimodular positive definite lattice of rank 8, with `|O(E₈)| = 696729600`
and 240 roots; `U³ ⊕ E₈(−1)²` is the K3 lattice `Λ_{K3}` of signature `(3, 19)`, unique by 6A.

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| 6A odd | T `unitNormSplittingIsometry`, `equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq`; L 3C; R Quadratic Form Invariants `hilbertSymbol_productFormula`; R Global Quadratic Forms `hasseMinkowski_equivalent`; the rational-form and unit-splitting construction in the supplement below |
| 1L signature | the characteristic-coset construction, followed by the odd 6A theorem on `L ⊕ W` (supplement below) |
| 6A even | T overlattice correspondences (1E, 1F); the odd 6A theorem; the explicit neighbours of `W` and their model maps in the supplement below |
| 6B | L 1I, 0G |
| 6C | M `CartanMatrix.E 8`; L 0F, 1L, 2G; R Root Systems Layer 5 |
| 6D | L 2C, 3F, 5A, 6B |
| 6F | L 0G, 2B |
| 6G | M `CartanMatrix.E 8`; T `typeE₈RootLattice`, `IsPosDef.finite_isometry`; R Root Systems Layer 5 |
| 6H | L 6A, 6D; T `orthogonalSum`, `hyperbolicPlane` |

**6A/6D construction supplement: parity kernels, neighbours and model maps.**

Everything below is on the one native carrier, a full finite free `ℤ`-lattice in its rational
ambient space, with its native isometries. Degenerate, non-unimodular and definite lattices are
outside the indefinite classification. Each coordinate construction is its own API output and is
not obtained by invoking the final classification theorem.

*The lattices `D_n⁺`* (Serre V.1.4.3, where they are `Γ_n`). For `n = 4k` with `k ≥ 1`, let
`D_n = {z ∈ ℤⁿ : ∑ z_i ∈ 2ℤ}` and `h = (½, …, ½)`. The `n − 1` adjacent sums `e_i + e_{i+1}` are
independent and span a sublattice of rank `n − 1`, since the alternating functional
`∑ (−1)^i z_i` annihilates them, as it annihilates `h`; together with `e₁ − e₂` they are `n`
vectors of determinant `±2`, and they generate `D_n`, of index 2 in `ℤⁿ`. The lattice
`D_n⁺ = D_n ∪ (h + D_n)` has covolume 1, `h·z` is an integer for `z ∈ D_n`, and `h² = k`, so
`D_n⁺` is integral and unimodular, and even exactly when `k` is even. The norms of a set of
generators do not by themselves give the rank or the unimodularity of their span, so both are
proved and exported with the lattice, together with the witness that the adjacent sums alone
span rank `n − 1`. For `D₈⁺` the native `typeE₈IsometryD8Plus` (1K) is the explicit isometry with
the Cartan-matrix model, with its matrix, its integral inverse and its determinant; the name of
the theorem without that construction does not identify the two models. For `D₁₆⁺` the vectors
of norm 2 are the 480 roots of `D₁₆`, because `h + D₁₆` has minimum norm 4, and they generate the
index-2 sublattice `D₁₆`, whereas the 480 roots of `E₈ ⊕ E₈` generate the whole lattice; the
index of the root span is an isometry invariant, so `D₁₆⁺ ≇ E₈ ⊕ E₈` without counting roots.

*Parity kernels.* For an odd unimodular `L`, `L_even = ker(x ↦ B(x,x) mod 2)` is a sublattice
of index 2 and determinant 4; it is not `2L`, the subgroup on which every pairing is even, whose
index is `2^{rank L}`. A characteristic vector `w` exists by the perfect pairing mod 2, and
`L_even^⋆ = L + ℤ(w/2)`. The parity `w² ≡ rank L (mod 2)` is elementary: the nonsingular
symmetric pairing over `𝔽₂` splits into lines of norm 1 and an alternating remainder of even
rank, and the characteristic vector is the sum of the norm-one basis vectors; no signature and no
van der Blij input is used. Hence `A_{L_even}` is `ℤ/4` in odd rank, with one subgroup of order 2,
and `𝔽₂²` in even rank, with three. These subgroups enumerate the intermediate modules of index
2, which are not yet integral lattices.

*Intermediate lattices.* Each intermediate module is the preimage of its discriminant subgroup.
Isotropy for `b` is equivalent to integrality, isotropy for the half-norm `q` to evenness, and a
maximal isotropic subgroup gives a unimodular lattice, by the native dual and preimage maps of
1E and 1F. In even rank the two lines other than `L` have representatives `w/2` and `w/2 + e`
with `e` any vector of odd norm; their norms differ by `B(w, e) + e²`, which is even by the parity
above, so both preimages are integral exactly when `4 ∣ w²` and even exactly when `8 ∣ w²`. These
are tests on `w²` alone, independent of the signature. `A₁ ⊕ A₁` separates integral from even
gluing; for `W = ⟨1⟩ ⊕ ⟨−1⟩` the characteristic vector `w = (1, 1)` has `w² = 0` and gives both
`U`-neighbours directly. The reformulation through the signature is a separate output, obtained
after the odd classification and the characteristic-signature construction below; it is never
inferred from the existence or the choice-independence of characteristic cosets alone.

*The neighbours of `W = ⟨1⟩ ⊕ ⟨−1⟩`.* `W_even` is the set of pairs of equal parity, with basis
`(1, 1), (1, −1)` and Gram `!![0,2;2,0]`; its dual is the set of half-integral pairs `(x, y)`
with `x + y` and `x − y` integral. Adjoining `(½, ½)`, respectively `(−½, ½)`, gives the two even
unimodular neighbours, with bases `((½, ½), (1, −1))` and `((−½, ½), (−1, −1))`, each of Gram
`!![0,1;1,0]`: two explicit isometries with `U`, with the signs and the order of the basis
vectors kept. For an even unimodular `Y`, `(Y ⊕ W)_even = Y ⊕ W_even` and its dual is
`Y ⊕ W_even^⋆`; both identities use that `Y` is self-dual, not merely even. Applying the two
neighbour maps with the identity on `Y` shows that `Y ⊕ U` is an even neighbour of `Y ⊕ W`. When
`Y ⊕ W` is identified with a standard odd `I_{r,s}`, a sign change of one coordinate fixes the
even kernel and exchanges the two even-neighbour classes when `8 ∣ r − s`. The induced glue maps
are kept; no cancellation of integral summands is assumed. The rest of the argument is the
construction below, a target of this roadmap.

*The odd theorem of 6A.* Put `q(x) = B(x, x)`, the quadratic map of `B` with polar `2B`; its plain
discriminant is `[det B]`, not the signed determinant and not a half-norm. Unimodularity gives
`det B = (−1)^s` for the signature `(r, s)`. At every odd prime 3C diagonalizes the form in
units, so all pairwise Hilbert symbols and hence the classical Hasse sign are `1`; the standard
`I_{r,s}` has the same rank, determinant and odd-prime signs, both have the real sign
`(−1)^{s(s−1)/2}`, and the Hilbert product formula, with finite support, fixes the common dyadic
Hasse sign. The native local classification
(`equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq`, Quadratic Form Invariants Layer 6D)
and Hasse–Minkowski (Global Quadratic Forms 6.3, `hasseMinkowski_equivalent`) give an isometry of
rational forms with `I_{r,s}`, not a parity comparison at 2. For `r, s > 0` pull back
`e₊ + e₋`, clear denominators and divide by the gcd of the coordinates to obtain a primitive
integral isotropic `v`. The perfect pairing and Bézout give `w` with `B(v, w) = 1`; the plane
`(v, w)` has Gram `!![0,1;1,a]`, determinant `−1`, and splits off integrally (native 0F). If `a`
is even, its orthogonal complement is odd, and adding an odd vector of that complement to `w`
gives `w'` of odd norm `a'` with `B(v, w') = 1`. For `ε = ±1` put `u = w' + ((ε − a')/2)·v`; then
`u² = ε` and `B(u, v) = 1`, and `y = v − εu` lies in `u^⊥` with `y² = −ε`, so the unimodular
complement of `ℤu` is again odd. In rank above 2 choose `ε` so that the complement keeps both
signs, and induct on the rank; in signature `(1, 1)` the isotropic plane is the whole lattice
and `u, y` is a `⟨1⟩ ⊕ ⟨−1⟩` basis. Every projection, basis map and isometry is exported, so the
normal form is an isometry and not an equality of signatures. Neither strong approximation for
`Spin` nor a positive definite mass is a premise of this proof. Its inputs are 3C, Quadratic
Form Invariants Layers 6D and 7C, Global Quadratic Forms Layers 0–6, and the Hilbert product
formula of Class Field Theory (Serre V.2.2 and V.3.3; Milnor–Husemoller, Chapter II).

**Characteristic signature and the general signature-neighbour corollary, after the odd
theorem** (Serre, V.2.1 Theorem 2 with its corollaries, proved there through the same odd
classification; Milnor–Husemoller, Chapter II). For any unimodular `L`, of either parity and any
signature `(r, s)`, and any characteristic `w`, let `J = L ⊕ W` with `W = ⟨1⟩ ⊕ ⟨−1⟩`: it is odd,
unimodular and indefinite, of signature `(r + 1, s + 1)`. The vector `(w, 1, 1)` is characteristic
in `J` and has norm `w²`. The odd theorem, not the even classification, gives an integral
isometry of `J` with `I_{r+1,s+1}`, where the characteristic vectors are those with all
coordinates odd; every odd square is `1` modulo 8, hence `w² ≡ (r + 1) − (s + 1) = r − s (mod 8)`.
This proves the characteristic-signature statement of 1L by a route independent of 1I and of the
even classification, for definite `L` and rank 0 included; the orthogonal-sum isometry and the
transport of characteristic vectors are kept.

Only after that output are the tests `4 ∣ w²` and `8 ∣ w²` converted into signature conditions:
for odd unimodular `L` of even rank, `8 ∣ r − s` makes both non-`L` preimages even unimodular,
`r − s ≡ 2 (mod 4)` makes them non-integral, and `r − s ≡ 4 (mod 8)` makes them odd unimodular.
The distinction between module intermediates and integral or even lattices, every preimage
embedding, and the general Nikulin and Milgram targets are preserved; neither this corollary nor
the rational-form argument is a premise of the explicit neighbours of `W` or of the elementary
parity-kernel computation.

*The even theorem of 6A.* For an even unimodular indefinite `L`, the neighbour argument completes
the proof with the odd theorem. A primitive isotropic `v` has a partner `w` with `B(v, w) = 1`;
`a = w²` is even, and replacing `w` by `w − (a/2)·v` makes the plane a copy of `U`, which splits
off integrally: `L = Y ⊕ U`. Then `J = Y ⊕ W` is odd, indefinite and unimodular, of the same
signature `(r, s)`, so the odd theorem gives an integral isometry `J ≅ I_{r,s}`. The vector
`(0_Y, 1, 1)` is characteristic in `J` and has norm 0, and its image in the standard model has
every coordinate odd, so `8 ∣ r − s` directly, without the even classification or Milgram's
theorem. Now `J_even = Y ⊕ W_even` with dual `Y ⊕ W_even^⋆`, because `Y` is even and self-dual,
and the neighbours of `W` exhibit `L` as one of the even unimodular index-2 overlattices of
`J_even` other than `J`. In the standard `I_{r,s}` the four discriminant cosets of `I_even` are
`0`, `e`, `w/2` and `w/2 + e` with `w = (1, …, 1)`; both lines other than `I` have half-norm
`(r − s)/8` modulo 1, hence are isotropic for `q`, and a sign change of one coordinate preserves
`I_even` and exchanges the two lines, so their preimages are isometric. Transporting the
neighbour embeddings proves the uniqueness of the even indefinite class in each signature, and
the comparison with `U^{min(r,s)} ⊕ E₈(±1)^{|r−s|/8}`, through the native Cartan and `D₈⁺`
isometry, gives the normal form with explicit isometries in every case, `r = s` included. No
cancellation of arbitrary integral summands is used. The same stabilization by `U` extends the
corollary `8 ∣ r − s` to definite even unimodular lattices. Nikulin existence is Layer 5, Milgram
and van der Blij are 1I and 1L, and Nikulin's uniqueness and splitting theorems are
`IntegralLatticesPartII`'s.

## Layer 7: masses, local densities, and the archimedean factor

Every statement in this layer is about positive definite genera, and the Conway–Sloane mass
formula paper is the source for the normalization.

The mass formula itself, the adelic decomposition (7B), the dyadic density from Cho's smooth
model (7D), the volume theorem (7F), the Conway–Sloane evaluation (7H) and the rank-16 completeness
theorem (7I) are OTM's, in the sections named in §*Scope and ownership*. This layer owns what OTM
consumes from the lattice side: the two masses and their comparison (7A), the local density with
its stabilization at every prime and its values at odd `p` (7C), the Euclidean real factor (7E),
and the low-rank values (7G), together with the dyadic Jordan data and exponents of 3I. None of
them uses an adelic volume or a group scheme.

**7A. Proper mass and full mass.** The two sums are defined, and both are finite by 2C and
2G (Conway–Sloane, equation (1), and §6 for the proper mass). For `rank L ≥ 1` the relation
between them is proved, and not assumed. A class either stays one proper class, in which case
`|O(M)| = 2|SO(M)|`, or splits into two proper classes, in which case `O(M) = SO(M)`. In both
cases `m⁺ = 2m`. In rank 0 the relation fails, and 7G gives the values there. *Needs:* 2C, 2G,
4A.

There is no product formula for the mass of a direct sum, and that non-statement is
recorded. The mass of a twist `L(a)` is stated for `a > 0` only.

**Checks.**

- Rank 0: `O = SO = 1`, one class, `m = m⁺ = 1`, and `m⁺ = 2m` fails.
- Rank 1, `⟨a⟩` with `a > 0`: `O = {±1}`, `SO = 1`, `m = 1/2`, `m⁺ = 1 = 2m`.
- The genus of `!![4,1;1,6]`: `!![2,1;1,12]` has `|O| = 4`, `|SO| = 2`, and `!![4,1;1,6]` has
  `O = SO = {±I}` and splits into two proper classes, so `m = 1/4 + 1/2 = 3/4` and
  `m⁺ = 1/2 + 1/2 + 1/2 = 3/2 = 2m`; the formula `h/(2w) = 1/2` with the class number `h = 2` is
  wrong.

**7C. The local density: definition, stabilization, and the values at odd primes.** The
definition and the stabilization theorem below are for every prime, `p = 2` included; the
closed evaluation is proved here at odd `p`, and at `p = 2` it is the successor's 7D. Let `L`
be a nondegenerate `ℤ_p`-lattice of rank `n`
with Gram matrix `A` in a basis. The local automorphism density is

    α_p(L) = lim_{r→∞} p^{−r·n(n−1)/2} · #{X ∈ Mₙ(ℤ/p^r) : Xᵀ A X ≡ A (mod p^r)}.

This milestone asks for:

- stabilization (`localDensityCount_succ_eq`, on the count `localDensityCount`): the counting
  function equals `p^{r·n(n−1)/2}·α_p(L)` for every `r ≥ r₀`,
  with `r₀` given explicitly in terms of `n` and `v_p(2 det A)`, so the limit exists and is
  a positive rational number;
- independence of the basis, and dependence only on the isometry class of `L_p`;
- `[K_p(L) : K_p⁺(L)] = 2` exactly when `K_p(L)` contains an element of determinant `−1`.
  The comparison with a Haar volume is OTM's separate local-model/gauge theorem. It must
  specify O versus SO, `B` versus `B/2`, the integral model, conductor and all density factors;
  the raw count does not itself assert an unscaled Tamagawa-volume identity;
- the unramified value: for `p ∤ 2 det L`, so that `L_p` is unimodular,

      α_p(L) = 2 ∏_{i=1}^{m} (1 − p^{−2i})                      if n = 2m + 1 ≥ 1,
      α_p(L) = 2 (1 − ε p^{−m}) ∏_{i=1}^{m−1} (1 − p^{−2i})     if n = 2m ≥ 2.

  Rank 0 has `α_p=1` directly. Here `ε = ±1` is the **type** of the reduction of `L_p`, which is the split/nonsplit
  invariant of the orthogonal group and not the square class of the determinant. It is
  fixed by the signed determinant:

      ε = ((−1)^m · det L_p | p),

  the Legendre symbol. The value comes from `α_p(L) = #O(L_p ⊗ 𝔽_p)/p^{n(n−1)/2}` together
  with `#O^ε_{2m}(𝔽_p) = 2 p^{m(m−1)}(p^m − ε)∏_{i=1}^{m−1}(p^{2i} − 1)`, and `O^ε_{2m}` is
  split exactly when `(−1)^m det` is a square. The genus symbol of 3G records the Legendre
  symbol of the determinant itself, in the Conway–Sloane convention, so the translation
  between the two carries the factor `(−1 | p)^m` and the milestone states it that way;
- the mandatory test that separates the two conventions: the hyperbolic plane over `p = 3`
  has `m = 1` and `det = −1`, a nonsquare mod 3, yet it is split, `#O_2^+(𝔽_3) = 4`, and
  `α_3 = 4/3 = 2(1 − 3^{−1})`. Reading `ε` off the raw determinant would give `8/3`;
- for positive rank, the local/formal normalization dictionary for the product over `p`. ⚠ The raw product `∏_p α_p(L)⁻¹` is
  **not** a convergent Euler product and is not what any mass formula consumes: the displays
  give `α_p(L) → 2` as `p → ∞`, so its factors tend to `½` and its partial products tend to
  `0`, and no finite set of corrections at `p ∣ 2 det L` can repair a factor of two at every
  good prime. The factor that enters a mass is the **normalized** good-prime density
  `α_p(L)/2`, and

      ∏_{p ∤ 2 det L} (α_p(L)/2)⁻¹ = ∏_{i=1}^{m} ζ^{(S)}(2i)                       if n = 2m + 1,
      ∏_{p ∤ 2 det L} (α_p(L)/2)⁻¹ = ∏_{i=1}^{m−1} ζ^{(S)}(2i) · L^{(S)}(m, χ_L)   if n = 2m,

  with `S` the primes dividing `2 det L`, the superscript removing the Euler factors at `S`, and
  `χ_L(p) = ((−1)^m det L | p)` the character of the signed determinant. This is Conway–Sloane's
  `std_p(f) = α_p(L)⁻¹` in equation (6) of their paper, and the `2` in front of `m_p(f)` in
  their formula `∏_p 2 m_p(f)`, which the successor's 7H quotes, is exactly the `2/α_p(L)`
  above; Gan–Yu's and Cho's `β_{L_p} = α_p(L)/2` is the same normalization, as 7D records. What
  is proved here is the identity of the local factors, prime by prime; every statement about the
  convergence of the product over `p` and its value is the successor's (OTM §1.4 for the binary
  case, its Layer 3 for rank at least 3), and the regimes are recorded so that the local
  factors are stated in the form those statements consume:
  - `n ≥ 3`: every factor is a `ζ(2i)` with `2i ≥ 2` or an `L(m, χ_L)` with `m ≥ 2`, so the
    product converges absolutely to a nonzero value. The correction at `p = 2` is the number
    `α_2(L)` that the stabilization above defines and 7D evaluates, a single finite factor that
    convergence does not wait for;
  - `n = 2`: the good-prime product is `∏ (1 − χ_L(p) p⁻¹)⁻¹`. When `−det L` is not a square,
    which is every positive definite binary lattice and every indefinite one with nonsquare
    `Δ`, `χ_L` is a nontrivial quadratic character and the product converges conditionally, in
    the order of increasing `p`, to `L^{(S)}(1, χ_L) ≠ 0`; this is the value that B8's `h⁺/w`
    meets through the class number formula. When `−det L` is a square, `χ_L = 1` and the
    product `∏ (1 − p⁻¹)⁻¹` diverges, so there is no nonzero Euler product at all; this is the
    split branch of B7 seen from the local side, and `U` is its test;
  - `n = 1`: `m = 0` and `α_p(L) = 2` at every good prime, so the normalized product is empty
    and equal to `1`;
  - `n = 0`: `α_p(L) = 1` at every `p` and there is no factor of two to remove, the same rank-0
    exception that 7A and 7G record for the mass;
- the dictionary to the Conway–Sloane local mass `m_p` at odd `p`, in their section 12,
  including every factor of 2.

The values at odd `p` are computed from the Jordan decomposition of 3C.

**7E. The archimedean factor.** Construct the following Euclidean-volume lane
before any Tamagawa comparison. On the native real groups use the bi-invariant
metric whose Lie-algebra inner product is `-tr(XY)/2`, so each
`E_ij-E_ji`, i<j, has norm1. Keep this normalization explicit; the ambient
Frobenius metric has a different scalar. Define all total volumes by the
native Riemannian density, with finite-dimensional C1 charts, continuous
metric, Borel and Lindelof hypotheses (compact matrix groups and spheres
supply these). No orientation is required for density integration.

First compare the native round-sphere density with the native radial Haar
measure `volume.toSphere`. In a sphere chart phi and polar map `(r,y)↦r phi(y)`,
the radial column is unit normal and the tangent columns are r times the
sphere derivative, so the absolute Jacobian is
`r^(j-1)*sqrt(det Gram(Dphi))` for ambient dimension j>=1. Apply the actual
chart change-of-variables formula and Fubini; integration over0<r<1 gives
1/j. The defining sector formula for `toSphere` then proves equality with
the induced round Riemannian surface measure. A ball-volume theorem alone
does not establish this equality. Use the actual native ball/Gamma formula
and Gamma recurrence to deduce
`vol(S^(j-1))=2*pi^(j/2)/Gamma(j/2)` for j>=1. Include S0 with its two unit
point masses; the sphere in the zero vector space is empty, not this formula.

For n>=2 construct the last-column smooth locally trivial quotient
`SO(n)/SO(n-1) ≅ S^(n-1)` using oriented local orthonormal frames.
At the identity its vertical space is so(n-1) and the orthogonal horizontal
basis `E_in-E_ni` maps isometrically to the round tangent basis. Translate
this calculation to all points. In a local trivialization its Gram
matrix has the base and fibre determinants after a determinant1 shear
removes the connection cross terms. Prove the Riemannian density/Fubini
identity, so the fibre volume times base volume equals total volume;
a topological fibration or the group name alone does not give this metric
measure formula. Construct the chart, determinant and quotient-integration
comparisons at the actual native density and Haar carriers. Left/right
translations are differentiable isometries for this metric, so its density
is the correspondingly normalized Haar measure.

The Lean statements are `Archimedean.soEuclideanMeasure_univ` and
`Archimedean.oEuclideanMeasure_univ`, for the measures `Archimedean.soEuclideanMeasure` and
`Archimedean.oEuclideanMeasure` induced through the coordinate maps `Archimedean.soCoordinates`
and `Archimedean.oCoordinates` (entrywise coordinates divided by `√2`,
`Archimedean.skewMetricCoordinates`), with the values `Archimedean.sphereArea` and
`Archimedean.orthogonalSkewBasisVolume`.

Start with vol(SO(1))=1 and prove for n>=1

    vol(SO(n)) = product_(j=2..n) 2*pi^(j/2)/Gamma(j/2).

For n>=1 the two determinant components of O(n) are isometric by reflection,
so vol(O(n))=2*vol(SO(n)). At n=0 both groups are singletons with volume1;
the quotient-to-S0 assertion and component-factor2 are not used there.
Prove the Gamma-product identity for n>=1

    2*pi^(-n(n+1)/4)*product_(j=1..n)Gamma(j/2)
      = 2^(n+1)/vol(O(n)),

and verify its n0 instance directly with empty products. In particular
vol(SO(2))=2*pi and vol(SO(3))=8*pi^2 in this metric.

The relation to the pinned Tamagawa mass gauge is a SEPARATE successor
obligation: these Euclidean densities do not prove an unscaled equality.
OrthogonalTamagawaAndLatticeMass consumes this lane and proves its explicit
odd-rank scalar and global integral/real compatibility. Nothing here uses
an orthogonal Tamagawa value, positive-definite mass, strong approximation,
Cartan/KAN, or a later homotopy LES as a premise. The native covolume
identity `covolume(L)² = det L` (label 2D) is a separate theorem and is not a
proof of a sphere area or of this quotient-volume identity.

**7G. Low rank.** Three cases are proved directly, and none of them is a specialization of
the general derivation:

- rank 0: `O(L) = SO(L) = 1` and the genus has one class, so `m⁺ = m = 1`;
- rank 1: the genus of `⟨a⟩` with `a > 0` has one class, with `O(L) = {±1}` and `SO(L) = 1`,
  so `m = 1/2` and `m⁺ = 1`;
- rank 2: B8 gives `m⁺(gen L) = h⁺(gen L)/#𝒪(L)ˣ` and `m(gen L) = h⁺(gen L)/(2·#𝒪(L)ˣ)`,
  through the norm-one torus of B6 and its measures in B7. Both formulas use the **proper** class count `h⁺` in the numerator; the full class number `h(gen L)` is not what divides here, because
  `|O(M)|` is not constant on the genus.

OTM's general derivation is stated for rank at least 3, with its own branches for the low ranks;
7G is proved here without it. *Needs:* 2C, 4A, 7A, B6, B7, B8.

**Checks.**

- Rank 0: `(m, m⁺) = (1, 1)`; rank 1: `(1/2, 1)`, with `O(⟨a⟩) = {±1}` for every `a > 0`.
- `A₂`: `Δ = −3`, `w = 6`, `h⁺ = 1`, so `m⁺ = 1/6` and `m = 1/12`, agreeing with `|O(A₂)| = 12`.
- The genus of `!![4,1;1,6]`: `w = 2`, `h⁺ = 3`, so `m⁺ = 3/2` and `m = 3/4`, while the full class
  number `h = 2` would give `1/2`.

### Examples

Rank 0 and rank 1 masses `1` and `1/2` (7G); `α_3(U) = 4/3` and `α_2(U) = 4` (7C, 3I); `vol(SO(2)) = 2π`, `vol(SO(3)) = 8π²` and `vol(O(1)) = 2` (7E).

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| 7A | L 2C, 2G, 4A |
| 7C | L 3B, 3C, 4B |
| 7E | M native ball/radial measure and Gamma; T `inducedRiemannianMetric`, `riemannianVolume`; R RepresentationTheory/LieGroups finite-dimensional matrix Lie groups; R DifferentialGeometry 12.1 and 12.4 |
| 7G | L 2C, 4A, 7A, B6, B7, B8 |

## Layer 8: what this roadmap supplies to Theta Series

Layer 8 is a **contract, not a milestone list**, and it runs in one direction. The theta series
of a positive definite lattice is [Theta Series](../ThetaSeries/README.md)'s, and this roadmap
states none: no milestone here defines `Θ_L`, `θ_γ`, a `q`-expansion, a transformation law or a
modularity statement, none draws a conclusion from one, and none may be added. This roadmap
consumes nothing from Theta Series and `Suggested.lean` names none of its declarations. §*Scope and ownership*, §*Theta series* records the same boundary, and that roadmap's own
scope section records it from its side.

**8S. What this roadmap supplies to Theta Series.** The traffic is the arithmetic of the
rational lattice. Theta Series' bridge — its `ratModel`, which builds an
`IntegralLattice (ℚ ⊗[ℤ] L)` out of its real carrier — reads the following. Rows marked native
are Tau Ceti's foundation, which Theta Series imports directly; the others are milestones of this
roadmap:

| Milestone | Supplied | Declarations here |
| --- | --- | --- |
| 0A–0E, 1A–1F, 1J, 1K, 2A–2E (native) | the carrier and its predicates, the dual and discriminant group with `|A_L| = |det L|`, the discriminant forms in the half-norm convention, the overlattice correspondences, the level, the ADE lattices with `D₈⁺ ≅ E₈`, shells, representation numbers and the covolume identity | Tau Ceti's declarations in §*From Tau Ceti*, and the character `TauCeti.expCircle` |
| 1G | `l(A)`, the relations among Nikulin's generators, and generator decompositions | Mathlib's `AddGroup.rank`; `FiniteQuadraticModule.primaryComponent`, `FiniteQuadraticModule.NikulinDecomposition`, with the native generator decomposition |
| 1H, 1I | the Gauss-sum invariant on the generators, Nikulin's Theorem 1.11.3, and Milgram's theorem at every signature | native `gaussSign`; `FiniteQuadraticModule.nonempty_isometry_iff_gaussSign_eq` (1H); `milgram` (1I) |
| 6D | the rank-16 pair `E₈²` and `D₁₆⁺` — even unimodular, in one genus, non-isometric | milestone 6D |

Theta Series transports these across **its own** Layer-2 bridge from its real carrier
(`Submodule ℤ E` with `IsZLattice ℝ`) to this roadmap's rational one, and adds no competing
definition of any of them. That bridge lives there, not here: this roadmap defines no
real-model carrier, no second dual-lattice notion, and no comparison lemma between the two
models. Its `D₁₆⁺` application is stated against 6D; its rank-24 identities are stated in
lattice-free form — rank, evenness, unimodularity and rootlessness — and the rank-24 lattices
belong to Rank-24 lattice constructions.

⚠ **What is proved from a theta series is Theta Series', and is not restated here.** That
every even unimodular lattice of rank 8 has theta series `E₄`, hence `r_L(2m) = 240 σ₃(m)`;
that every even unimodular lattice of rank 16 has theta series `E₄²`, so that the theta series
does not determine the lattice; and the rank-24 identities with the Leech representation
numbers — each is a conclusion drawn from a modular form and belongs to that roadmap's Layer 8.
What this roadmap contributes to those statements is arithmetic: 6D constructs the two rank-16
witnesses and proves them non-isometric, and 2B counts `r_{E₈}(2) = 240` as the number of
roots of `E₈` (6G). No statement here is a corollary of a modular form, and none is stated in a
form that would need one.

⚠ **Milgram is not duplicated.** Milgram's theorem `t₊ − t₋ ≡ sign q_L (mod 8)` for an even
nondegenerate lattice of any signature is 1I here, proved from the Gauss-sum invariant of 1H
by finite arithmetic. Theta Series proves the positive definite instance
`∑_{γ ∈ A_L} e(q_L(γ)) = |A_L|^{1/2} e(n/8)` by theta asymptotics, because its Gauss-sum layer
needs it and because it wants an independent route to `8 ∣ n` for even unimodular lattices.
Both are wanted, the bridge identifies them, and neither is derived from the other. The same
holds for shells: the native `vectorsOfNorm` and `representationNumber` are counts in the rational carrier, and Theta
Series' shells are the same sets read in `E`.

⚠ **Positive definiteness is a boundary of the same kind on both sides.** Theta Series is
positive definite by construction — the form is the inner product of its ambient space, so
definiteness is structural and not a hypothesis it could drop — and this roadmap states no
theta series at all. The Siegel–Narain theta of an indefinite lattice, summed against a
maximal positive definite subspace `v ⊆ L ⊗ ℝ`, with convergence, the discriminant-coset
refinement, the `S` and `T` laws and `O(L)`-equivariance in `v`, is therefore reached from
neither roadmap by weakening a hypothesis. It is `IndefiniteThetaAndSiegelWeil`'s
(§*Scope and ownership*), together with theta lifts, the indefinite Siegel–Weil theorem and the genus
averages it evaluates; that successor consumes Layer 1 here and Theta Series' definite theory,
and neither roadmap consumes it.

| Milestone | Direct prerequisites |
| --- | --- |
| 8S | L 1G, 1H, 1I, 6D and the native rows above — supplied to Theta Series, consumed by no milestone here |

## Layer 9: completeness of a list of classes from the mass

**9B. Exhaustion from mass saturation.** Let `G` be a positive definite Gram matrix and suppose
the mass of its genus is known: there is a finite complete set of pairwise non-isometric
representatives of the positive definite classes in `gen G` whose reciprocal automorphism orders
sum to `m` (`IsGenusMass`, the Gram-level form of 7A's mass). If `S` is any finite set of pairwise
non-isometric positive definite Gram matrices in `gen G` with `∑_{H ∈ S} 1/|O(H)| = m`, then every
positive definite Gram matrix in `gen G` is isometric to a member of `S`
(`isometric_mem_of_sum_eq_genusMass`). The proof: each member of `S` is isometric to exactly one
member of the complete set, `1/|O(H)|` is an isometry invariant and is positive because `O(H)` is
finite and contains the identity (native `IsPosDef.finite_isometry`), so the induced injection of
`S` into the complete set preserves the summands, and a missing class would make the sum over
`S` strictly smaller than `m`. Isometry, local isometry and genus membership are written at the
level of Gram matrices (`GramIsometric`, `GramIsometricAt`, `GramSameGenus`: congruence over `ℤ`,
over every `ℤ_p`, and equality of the real signature). The mass `m` itself is supplied by OTM's
evaluation or by the direct low-rank values of 7G and B8; nothing here evaluates it.

**Checks.**

- The genus of `!![4,1;1,6]` (`Δ = −23`): the mass is `3/4` (B8), and `S = {!![2,1;1,12],
  !![4,1;1,6]}` gives `1/4 + 1/2 = 3/4`, so `S` is complete; the set `{!![4,1;1,6]}` alone sums to
  `1/2 < 3/4` and the hypothesis fails, as it must, since the class of `!![2,1;1,12]` is missing.
- Rank 0: the genus has one class with `|O| = 1`, the mass is 1, and the singleton is complete;
  the empty set sums to `0 ≠ 1`.
- Pairwise non-isometry is needed: the three distinct matrices `!![2,1;1,12]`, `!![2,−1;−1,12]`
  and `!![2,3;3,16]` are all Gram matrices of one lattice (bases `(e₁, e₂)`, `(e₁, −e₂)`,
  `(e₁, e₁ + e₂)`), lie in the genus of `!![4,1;1,6]`, and sum to `3·(1/4) = 3/4`, yet miss the class
  of `!![4,1;1,6]`.

### Examples

`A₂`: the mass of its genus is `1/12` (B8) and `|O(A₂)| = 12`, so `{A₂}` is complete and the genus
has one class. `E₈ ⊕ E₈` and `D₁₆⁺` with OTM's rank-16 mass give OTM §4.1's classification.

### Dependencies

| Milestone | Direct prerequisites |
| --- | --- |
| 9B | T `IsPosDef.finite_isometry`; L 2G, 3F, 7A |

---

## Basic API for each new object

A definition without lemmas is not a contribution. For each object below the roadmap asks
for the items listed, and each ends with its Checks. The layer that introduces the object owns
them. The carrier, the dual lattice, the discriminant group and forms, and shells are native
(§*From Tau Ceti*) and have their API there.

### Finite quadratic forms (1G)

- **Constructors.** From `(A, q)` with the two axioms; the generators `q_θ^{(p)}(p^k)`,
  `u^{(2)}(2^k)`, `v^{(2)}(2^k)`; the discriminant form of an even lattice.
- **Examples.** The forms listed for the standard lattices above.
- **Morphisms.** Isometries, and the group `O(q)`.
- **Functoriality.** Orthogonal sums; the `p`-primary decomposition; restriction to a
  subgroup; the quotient `H^⊥/H` for isotropic `H`.
- **Comparison lemmas.** For nondegenerate modules, the relations among generators
  (Nikulin 1.8.2), the Gauss-sum invariant of each generator (1H), and its vanishing on
  metabolic modules (1H).
- **Naturality.** On nondegenerate modules, `sign` is additive over orthogonal sums and
  invariant under isometry. Degenerate restrictions have no such invariant laws asserted.
- **Edge cases.** The trivial group; degenerate restrictions, which remain objects of the
  carrier but are excluded explicitly from the generator and Gauss-sum classifications.
- **Downstream.** 1H, 3E, 5A to 5J.

**Checks.**

- The zero module: `l = 0`, Gauss sum 1, `sign = 0`, metabolic with `H = 0`.
- `u^{(2)}(2)` against `v^{(2)}(2)`: same group and pairing, Gauss sums `2` and `−2`, so `sign`
  `0` and `4` separate them, while `u ⊕ u ≅ v ⊕ v`.
- The restriction of `q_1^{(2)}(4)` (`ℤ/4`, `q(x) = x²/8`) to its subgroup `{0, 2}` has
  `q(2) = 1/2` and `b(2, 2) = 0`, so it is degenerate; the generator classification is not applied
  to it.

### Lattices over `ℤ_p` and their Jordan data (3A, 3B)

- **Constructors.** `L.integralForm`; `L_p = ℤ_p ⊗[ℤ] L.carrier` with its localized
  integral form; `V_p = ℚ_p ⊗[ℚ] V` with its completed rational form; the embedding
  `L_p → V_p`; a Jordan splitting; a Gram matrix over `ℤ_p`.
- **Examples.** Unimodular `ℤ_p`-lattices at odd `p`; `U` over `ℤ_2`.
- **Morphisms.** Isometries over `ℤ_p`, and base change from `ℤ`.
- **Functoriality.** Sums, twists, and scaling by `p^i`.
- **Comparison lemmas.** `L.integralForm` casts to `L.form`; the canonical `L_p → V_p` is
  injective and full after scalar extension; its integral form is the restriction of the
  completed rational form. The Jordan invariants at odd `p` are unique (3C); at `p = 2`
  the splitting is not unique and the symbols of 3E replace it.
- **Naturality.** Localization commutes with sums, form twists, carrier dilations, duality,
  and isometries.
- **Edge cases.** `p = 2`; rank 0; a scale-zero constituent.
- **Downstream.** 3C to 3I, 4C, 7C; and OTM §2.1.

**Checks.**

- `⟨3⟩` at `p = 3`: one `3`-modular constituent of rank 1; at `p = 2` it is unimodular odd.
- `U` at `p = 2`: no orthogonal basis, one type II constituent at scale 0; `U` at `p = 3`:
  diagonalizable as `⟨1⟩ ⊕ ⟨−1⟩`.
- Rank 0: the empty splitting; `det = 1`, no constituents, every count of 3I is zero.

### Genus symbols (3E, 3G)

- **Constructors.** From a Jordan splitting; from a Gram matrix, through Jordan splittings of its
  localizations at the primes dividing `2·det`.
- **Examples.** The symbols of `A₂`, `U`, `E₈`, and one rank-4 lattice with a nontrivial
  2-adic part.
- **Morphisms.** The moves: sign walking and oddity fusion.
- **Functoriality.** The symbol of a direct sum, and of a twist.
- **Comparison lemmas.** Two symbols describe isometric lattices exactly when the moves
  relate them; the symbol determines the genus; the translation to `(t₊, t₋, q)` (5A).
- **Naturality.** The symbol depends only on the isometry class of `L_p`.
- **Edge cases.** `p = 2`; determinant `±1`, where the odd-prime bad-prime list is empty
  but the dyadic unimodular type/rank/oddity data remain (for example `E₈` versus `I₈`);
  rank 0 has the empty constituent list.
- **Downstream.** 3F, 3G, 3I, 5A, 7C; and OTM §2.2.

**Checks.**

- `E₈` and `I₈` at `p = 2`: both unimodular of rank 8 and determinant 1, types II and I, so the
  dyadic symbols `1_{II}^{+8}` and `1_{0}^{+8}`-type differ though the odd-prime lists are both
  empty.
- `A₂`: determinant 3, so the bad primes are 2 and 3; at 2 it is even unimodular of rank 2, at 3
  it has constituents of scales 1 and 3.
- `⟨1⟩ ⊕ ⟨3⟩` and `⟨5⟩ ⊕ ⟨7⟩` over `ℤ₂` give the same symbol although their diagonal entries
  differ (3B).

### Class, genus and spinor genus (4A, 4C)

- **Constructors.** `cls L`, `cls⁺ L`, `gen L`, `spn L`, `spn⁺ L`.
- **Examples.** Genera of class number 1; the rank-16 genus with two classes (6D — that they
  are the *only* two is the successor's 7I).
- **Morphisms.** The inclusions between the five sets, and the double-coset description
  (4B).
- **Functoriality.** Behavior under twists, and under orthogonal sums where it is defined.
- **Comparison lemmas.** The count of proper spinor genera (4C). Eichler's theorem (4D) is the
  successor's, and this API is what it consumes.
- **Naturality.** The double-coset description is compatible with a change of the base
  lattice inside a genus.
- **Edge cases.** Rank 0, 1 and 2; definite and indefinite.
- **Downstream.** 4E to 4G, 7A, 9B; and OTM §§0.3, 1.1.

**Checks.**

- `⟨1⟩`: one class, one proper class, one spinor genus, while `J/(ℚˣ J_L)` is infinite (the
  rank-one test of 4C).
- `x² + y²`: one class, but `J/(ℚˣ J_L)` has order 2; the binary count is `[C_L : C_L²] = 1`.
- The genus of `!![4,1;1,6]`: two classes and three proper classes, so `cls ⊊ gen` and
  `cls⁺` is strictly finer than `cls`.

### The quadratic order of a binary lattice (B1)

- **Constructors.** From a binary Gram matrix through the primitive part of the norm form;
  from a discriminant `Δ ≡ 0` or `1 (mod 4)`.
- **Examples.** `A₂` gives content 2, `Δ = −3` and `𝒪 = ℤ[ζ₃]`; `U` gives content 2,
  `Δ = 1` and the split algebra `ℤ × ℤ`; `⟨1,−2⟩` gives content 1, `Δ = 8` and `ℤ[√2]`;
  `!![4,1;1,6]` gives content 2 and `Δ = −23`.
- **Morphisms.** Isometries of binary lattices induce isomorphisms of the associated
  orders, and proper isometries act trivially on `Pic`. An improper isometry acts by the
  conjugation of B4, which is inversion on `Pic`.
- **Functoriality.** A basis matrix `P` sends `G` to `PᵀGP`; a finite-index sublattice
  satisfies `det M = [L:M]² det L`, `𝔰(M) ⊆ 𝔰(L)`, and `𝔫(M) ⊆ 𝔫(L)`. Content
  has no formula determined solely by the index. The distinct form twist `L(a)` multiplies
  content by `|a|`.
- **Comparison lemmas.** `Δ(L) = disc f` with `disc N_L = −4 det L`; forms and invertible
  proper ideal classes (B2); composition and multiplication (B3); `SO(L)` and the norm-one
  units (B4).
- **Naturality.** The correspondence of B2 commutes with the maps induced by isometries.
- **Edge cases.** Imprimitive norm forms; square discriminants, which use the separate
  product-order branch and never `NumberFieldOrder`, `Pic`, `NarrowPic`, or ring class fields;
  the two orders with extra units, `Δ = −3` and `Δ = −4`, and non-ambiguous classes, where
  `O(L) = SO(L)`.
- **Downstream.** 2C, 4E, 4F, 7G.

**Checks.**

- `A₂`: content 2, primitive part `x² + xy + y²`, `Δ = −3`, `𝒪 = ℤ[ζ₃]` with 6 units.
- `U`: content 2, primitive part `xy`, `Δ = 1`, split branch `ℤ × ℤ`, never a `NumberFieldOrder`.
- `⟨1, −2⟩`: content 1, `Δ = 8`, `ℤ[√2]`, infinite `O(L)` from the unit `1 + √2`.

### The mass (7A)

- **Constructors.** `m(gen L)` and `m⁺(gen L)`.
- **Examples.** Rank 0 gives 1 and rank 1 gives 1/2, both from 7G. The rank-8 even unimodular
  value `1/696729600` follows from the successor's 7H and is not proved here; what is proved
  here is `|O(E₈)| = 696729600` (6G), the number that value inverts.
- **Morphisms.** None: the mass is a rational number attached to a genus.
- **Functoriality.** Behavior under a positive twist. There is no formula for a direct sum,
  and that non-statement is recorded.
- **Comparison lemmas.** `m⁺ = 2m` for `rank L ≥ 1`, and `m⁺ = m = 1` in rank 0; the local
  factor 7C, whose dyadic evaluation is the successor's 7D. The dictionary to Siegel's `α_p` is
  stated with the successor's 7H.
- **Naturality.** The mass depends only on the genus.
- **Edge cases.** Ranks 0, 1 and 2 (7G).
- **Downstream.** OTM §§2.3, 3.1, 4.1 and 9B. Constructing and separating the 6D rank-16
  witnesses does not require a mass.

**Checks.**

- Rank 0: `O = SO = 1`, one class, `m = m⁺ = 1`; the relation `m⁺ = 2m` fails here.
- Rank 1, `⟨a⟩` with `a > 0`: `O = {±1}`, `SO = 1`, `m = 1/2`, `m⁺ = 1 = 2m`.
- The genus of `!![4,1;1,6]`: classes `!![2,1;1,12]` (`|O| = 4`, `|SO| = 2`) and `!![4,1;1,6]`
  (`O = SO = {±I}`, order 2, non-ambiguous, so it splits into two proper classes); `m = 3/4`,
  `m⁺ = 3·(1/2) = 3/2 = 2m`, while `h/(2w) = 1/2` would be wrong.

## Hard theorems: source, hypotheses, and a nearby false statement

| Theorem | Source | Hypotheses that carry the proof | A nearby false statement |
| --- | --- | --- | --- |
| Unimodular splitting (native, label 0F) | O'Meara §82 | the restriction of `β` to `M` is unimodular | "a nondegenerate restriction splits". Take `L = ℤ` with `β(x,y) = xy` and `M = 2ℤ`. Then `β\|_M` is nondegenerate, `M^⊥ = 0`, and `M ⊕ M^⊥ ≠ L`. |
| Content under sublattices (B1) | Gram-matrix change of basis | the full basis matrix is retained, not only its determinant | "a finite-index sublattice multiplies content by its index". Restrict `x²+y²` on `ℤ²` to `⟨2e₁,e₂⟩`: the index is 2 but the form `4x²+y²` still has content 1. Only a form twist has the `\|a\|` content formula. |
| Cancellation over `ℤ` (6H) | Milnor–Husemoller II §5; Serre V.2.2 | none: the statement is false | "`L ⊕ N ≅ M ⊕ N` implies `L ≅ M`". Take `N = U`, `L = E₈²`, `M = D₁₆⁺`. Both sums are even unimodular of signature `(17,1)`, hence isometric, while `E₈² ≇ D₁₆⁺`. |
| Milgram's theorem (1I) | Nikulin Thm 1.3.3; Milnor–Husemoller App. 4 | `L` is even and nondegenerate | "every unimodular lattice has `8 ∣ t₊ − t₋`". The odd lattice `⟨1⟩` is unimodular with `t₊ − t₋ = 1`. |
| Van der Blij's congruence (1L) | van der Blij, Indag. Math. 21 (1959); Milnor–Husemoller App. 4 | `L` is unimodular, and `w` is characteristic: `β(w,x) ≡ β(x,x) (mod 2)` for all `x` | "for nondegenerate integral `L` and characteristic `w`, `t₊ − t₋ ≡ β(w,w) (mod 8)`". For `⟨2⟩` every vector is characteristic, because every value of `β` is even; `t₊ − t₋ = 1` while every `β(w,w) = 2k²` is even, so the congruence fails for every characteristic `w`. |
| The Gauss sign of a metabolic module (1H) | Wall, Topology 2 (1963); Milnor–Husemoller App. 4 | the Lagrangian subgroup is isotropic for `q`, not merely for its polar `b` | "a subgroup with `H = H^⊥` on which `b` vanishes forces `sign q = 0`". The discriminant form of `A₁ ⊕ A₁` has such an `H` with `q = ½` on its generator and `sign = 2`. The converse "`sign q = 0` makes a nondegenerate module metabolic" is also false: `q_θ^{(5)}(5)` with `(θ\|5) = −1` has `sign = 0` and order 5, which is no `#H²`. |
| Finiteness of `O(L)` (2C) | O'Meara §102 | `L` is definite | "`O(L)` is finite for every nondegenerate `L`". `O(⟨1,−2⟩)` is infinite, being carried by the unit group of `ℤ[√2]` (B4), and 4F gives infinitude in every indefinite rank at least 3. |
| Diagonalization over `ℤ_p` (3C) | O'Meara 92:1 | `p` is odd | "every symmetric form over `ℤ_2` has an orthogonal basis". The hyperbolic plane `U` has none. |
| Two unimodular classes per rank (3C) | O'Meara 92:1a | `p` odd and rank at least 1 | "exactly two for every rank". In rank 0 there is one. |
| Uniqueness of Jordan invariants (3C) | O'Meara 91:9 | `p` is odd | "Jordan invariants are unique for every `p`". At `p = 2` they are not, which is why 3E states the moves. |
| Existence of an even lattice (5B) | Nikulin Thm 1.10.1 | conditions 3 and 4 apply exactly when `t₊ + t₋ = l(A_{q_p})` | "conditions 1 and 2 suffice". They suffice only under the strict inequality `t₊ + t₋ > l(A_q)`, which is Corollary 1.10.2. |
| Eichler's theorem (4D, not owned here) | O'Meara 104:5 | indefinite, and rank at least 3 | "every indefinite lattice satisfies `cls⁺ = spn⁺`". Rank 2 is excluded, and the rank-2 half of 4E — which stays here — proves that case by a different argument. |
| Strong approximation for `Spin` (not owned here) | O'Meara 104:4 | dimension at least 3, and a noncompact place | "it also proves the Tamagawa volume theorem". It does not: 7F is a separate theorem, and both belong to `OrthogonalTamagawaAndLatticeMass`. |
| The mass formula (7H, not owned here) | Conway–Sloane, eq. (2) | rank at least 2, in the stated normalization | "the formula holds in every rank". In rank at most 1 a factor 2 becomes 1, and `m` is 1/2 in rank 1 and 1 in rank 0 — which 7G proves here, so the successor must not re-derive it from the general formula. |
| The local density at 2 (7D, not owned here) | Cho, Compositio 151 (2015) | residue characteristic 2, with the smoothened model | "the Conway–Sloane dyadic table proves it". The table alone is not the smooth-model proof; 7D belongs to OTM over its actual general local/model prerequisites. |
| Classification in rank at most 9 (6C) | O'Meara 106:13 | rank at most 9, positive definite | "a positive definite unimodular lattice is determined by its rank and parity". Rank 16 has two even classes (6D). |
| Automorphisms of an indefinite lattice (4F) | O'Meara §104; Cassels ch. 13 | rank at least 3, and a case split on isotropy over `ℚ` | "an indefinite rational space has an isotropic vector". `x² + y² − 3z²` is indefinite over `ℝ` and anisotropic over `ℚ`, so the transvection proof covers only one case. |
| Automorphisms of a binary lattice (B4) | Pell's equation; Cassels ch. 13 | `Δ > 0` and `Δ` not a square | "an indefinite binary lattice has infinite `O(L)`". `U` has `Δ = 1`, a square, and `\|O(U)\| = 4`. |
| Improper binary automorphisms (B4) | Cox, Theorem 3.9, p. 50 (uncertified) | the proper class of the primitive part is fixed by inversion | "`[O(L) : SO(L)] = 2` for every nondegenerate binary `L`". `!![4,1;1,6]` has `Δ = −23` and only `±e₁` of norm 4, so `O(L) = SO(L) = {±I}` has order 2, while `2·#𝒪ˣ = 4`. |
| Forms to ideals for `Δ > 0` (B2) | Cohen, *Computational ANT*, §5.2 (uncertified); the oriented branch is proved here (B2) | the image of `f = (a,b,c)` is `𝔞_f` for `a > 0` and `√Δ·𝔞_f` for `a < 0` | "`f ↦ [𝔞_f] ∈ NarrowPic 𝒪_Δ` is well defined on proper classes". For `Δ = 12`, `x² − 3y²` and `−x² + 3y²` give the same ideal `𝒪_{12}`, hence the same narrow class, yet are not properly equivalent, since `x² − 3y²` does not represent `−1` modulo 3; the oriented map sends the second to `√3·𝒪_{12}`, the other narrow class. |
| The rank-2 mass (B8) | Conway–Sloane, equation (1) for the mass, with the proper/improper orbit count of B2–B4 | the count is of **proper** classes | "`m(gen L) = h(gen L)/(2·#𝒪ˣ)` with `h` the class number". The genus of `!![4,1;1,6]` has `h = 2`, `h⁺ = 3` and `w = 2`, and its mass is `1/4 + 1/2 = 3/4 = h⁺/(2w)`, not `1/2`. |
| Eichler transvections (4F) | O'Meara §104; Cassels ch. 13 | `w` is taken modulo `ℤu`, and `N_L(w)` is even | "`w ↦ E_{u,w}` is injective on a finite-index subgroup of `u^⊥ ∩ L`". `E_{u,w+au} = E_{u,w}` for every `a`, and every finite-index subgroup contains a nonzero multiple of `u`. |
| The odd local density type (7C) | Conway–Sloane §12; Gan–Yu Thm 7.3 | `ε` is the type of the reduction, `((−1)^m det \| p)` | "`ε = +1` exactly when `det L_p` is a square". The hyperbolic plane over `p = 3` has `det = −1`, a nonsquare, and is split, with `α_3 = 4/3`. |
| Cho's dyadic formula (7D, not owned here; 3I owns its exponents) | Cho Thm 5.2 with Lemma 5.1 | the exponent `N = N_Q − N_M` and the index `[O : SO]` | "`α_2(L) = 2^{−n(n−1)/2}·#𝒢̃_L(𝔽_2)`". `N` is generally nonzero, and `β_L` carries `[O(V,q) : SO(V,q)]⁻¹`. |
| Well-definedness of the dyadic exponents (3I) | O'Meara 93:28 and 93:29; Cho Lemma 5.1 | the ranks, scales and norms of the Jordan constituents are invariants of the lattice, although the splitting is not | "nothing attached to a dyadic Jordan splitting is an invariant". The signs and oddities are not, which is why 3E needs sign walking and oddity fusion; the ranks, scales and types are, and that is what makes `N_M`, `N_Q` and `N` well defined. |
| Proper against full mass (7A) | Conway–Sloane §6: the factor `2m_p(f)` is the proper `p`-mass, its `2` is `[O_n : SO_n]`, replaced by `1` in dimension 0 | `rank L ≥ 1` | "`m⁺ = 2m` always". In rank 0 both masses are 1, because `O(L) = SO(L) = 1`. |
| Choice-independence of `discr K(q₂)` (5B) | Nikulin Thm 1.9.1 | `q₂` has no summand `q_θ^{(2)}(2)` | "`K(q_p)` is unique up to isometry for every `p`, so `discr K(q_p)` is a function of `q_p`". `⟨2⟩` and `⟨10⟩` over `ℤ₂` both realize `q_1^{(2)}(2) = q_5^{(2)}(2)` in rank 1, and their determinants differ by 5, a nonsquare in `ℚ₂`. |
| The dyadic parity type (3I) | Cho Def. 2.1(b); O'Meara §93 | the type is that of the unimodular rescaling `M_i`, i.e. `𝔫(L_i)` is compared with `𝔰(L_i)` | "`L_i` is of type I when `𝔫(L_i) = ℤ₂`". `⟨2⟩` is a type I constituent of scale 2 with `𝔫 = 2ℤ₂`; the wrong criterion makes it type II and changes `t`, `b`, `c` and `N`. |
| The dyadic exponent of a type II lattice (3I) | Cho Lemma 5.1 | `N` is the exponent for 7C's bilinear count, `α_2 = 2^{N − n(n−1)/2}·#𝒢̃(𝔽₂)` | "`N = 0` for a unimodular type II lattice". `U` has `t = b = 0` and `c = 2`, so `N = 2` and `α_2(U) = 4`; `N = 0` is the exponent of the quadratic-form count, in which `α_2^q(U) = 1`. |
| Finite covolume of the binary torus (B7) | Dirichlet's unit theorem with B4 and B5 | `Δ` is not a square, so `T_L` is anisotropic | "`T_L(ℚ)` has finite covolume in `T_L(𝔸)` for every binary `L`". For `U`, `T_L ≅ 𝔾_m` and `T_L(𝔸)/T_L(ℚ) ≅ 𝔸ˣ/ℚˣ ≅ ℤ̂ˣ × ℝ_{>0}`, with the infinite `dt/t` direction of the idele modulus. |
| The proper-spinor-genus class group (4C) | O'Meara 102:7 with 91:6 and 101:8 | rank at least 3 | "`J/(ℚˣ J_L)` counts the proper spinor genera of every lattice". For `⟨1⟩` it is the infinite group `𝔸ˣ/ℚˣ𝔸^{×2}`; for `x² + y²` it has order 2 while the genus has one class. Rank 2 is `[C_L : C_L²]` through the torus. |
| Convergence of the local-density product (7C) | Conway–Sloane eq. (6); Siegel | the good-prime factors are normalized to `α_p(L)/2`, and `n ≥ 3` for absolute convergence | "`∏_p α_p(L)⁻¹` is a convergent nonzero Euler product". `α_p(L) → 2`, so the raw partial products tend to `0`; and in rank 2 with `−det L` a square even the normalized product diverges. |
| Rank-16 completeness (7I, not owned here) | Witt; Conway–Sloane §9 | the mass formula and both automorphism orders | "the two classes are known to exhaust the genus once they are constructed". 6D proves only that the two exist, lie in one genus, and differ; completeness waits for `OrthogonalTamagawaAndLatticeMass`. |
| Finiteness of shells (2A, 2B) | O'Meara §102; `ZLattice` discreteness | `L` is positive definite, not merely nondegenerate | "the shells of a nondegenerate lattice are finite". The hyperbolic plane `U` has `β(x,x) = 2ab` for `x = (a,b)`, so `S_0(U) ⊇ {(a,0) : a ∈ ℤ}` is infinite. This is the same hypothesis that makes representation numbers, minima and kissing numbers well defined, and it is why Theta Series is positive definite by construction. |

## Worked examples

Each example is discharged with the milestone that owns it. Each one catches a wrong
factor of 2, a wrong sign, or a vacuous definition.

- `⟨1⟩ = ℤ`: odd, unimodular, with the odd integers as its characteristic vectors and
  `w² ≡ 1 (mod 8)`, the odd case of van der Blij (0G, 1L). Its genus is one class and one
  proper spinor genus, while `J/(ℚˣ J_L) = 𝔸ˣ/ℚˣ𝔸^{×2}` is infinite, the rank-one rejection
  test of 4C; its good-prime densities are `α_p = 2`, with an empty normalized product (4C, 7C).
- `U`: even, `det = −1`, signature `(1,0,1)`, level 1, `A_U = 0`, and not diagonalizable over
  `ℤ_2`; its primitive binary discriminant is `1`, so its algebra/order branch is explicitly
  `ℚ × ℚ`/`ℤ × ℤ`, with one split proper class and `|O(U)| = 4` (0G, 3D, B1--B5). Over `ℤ_2`
  it is a single free type II constituent with `t = b = 0` and `c = 2`, so Cho's exponent is
  `N = 2` and `α_2(U) = 4` in 7C's count (3I). Its norm-one torus is the split `𝔾_m`, whose
  adelic quotient `𝔸ˣ/ℚˣ` has infinite volume, and `−det U = 1` is a square, so its good-prime
  product `∏ (1 − p⁻¹)⁻¹` diverges: it is the test of B7's split branch and of the rank-2
  exception in 7C (B7, 7C).
- The index-two sublattice `⟨2e₁,e₂⟩ ≤ ℤ²` restricts `x²+y²` to `4x²+y²`; its content
  remains 1 although the determinant is multiplied by 4 (0C, B1).
- `⟨-2⟩` is negative definite of signature `(0,0,1)`; the zero rank-one form is
  degenerate of signature `(0,1,0)` and has zero radical quotient (0G, 1K).
- `⟨2⟩`: every value of the form is even, so every vector is characteristic, and the
  congruence of 1L fails at every one of them — the witness that 1L requires
  unimodularity (1L). Over `ℤ_2` it is a type I constituent of scale 2 with `𝔫 = 2ℤ_2`, the
  test that the parity type is read on the unimodular rescaling, and it has `N = 2` and
  `α_2 = 8` (3I). Together with `⟨10⟩` it is one of the two minimal 2-adic realizations of
  `q_1^{(2)}(2) = q_5^{(2)}(2)`, of determinants differing by 5, so `discr K(q₂)` is not
  determined by `q₂` there (5B).
- `⟨1, −3⟩`, the form `x² − 3y²`: `Δ = 12`, `𝒪_{12} = ℤ[√3]`, fundamental unit `2 + √3` of norm
  `+1`, so `Pic` is trivial and `NarrowPic` has order 2. The forms `x² − 3y²` and `−x² + 3y²`
  are not properly equivalent, share the unoriented ideal `𝒪_{12}`, and are separated only by
  the sign clause of B2, which sends the second to the class of `√3·𝒪_{12}` (B2, B3).
- `⟨1⟩ ⊕ ⟨1⟩`: `Δ = −4`, `w = 4`, one class and one proper spinor genus, while `J/(ℚˣ J_L)`
  has order 2 because `θ_2(SO(L_2))` is the norm group of `ℚ_2(i)`; the rank-2 count is
  `[C_L : C_L²] = 1` through the torus (4C). Its good-prime factors are `α_p/2 = 1 − (−1|p)p⁻¹`,
  whose product over odd `p` is `L(1, χ_{−4})⁻¹ = 4/π` (7C).
- The discriminant form of `A₁ ⊕ A₁`: the glue class `h` satisfies `b(h,h) = 0` and
  `H = H^⊥` while `q(h) = ½` and `sign = 2` — the witness that Lagrangian means isotropic
  for `q` itself (1F, 1G, 1H).
- Affine `Ã₁` with Gram `!![2,-2;-2,2]` is even and positive-semidefinite of signature
  `(1,1,0)`, and its radical quotient is `A₁=⟨2⟩` (0E, 0G).
- `A₂`: even, `det = 3`, level 3, and `A_{A₂} ≅ ℤ/3` with half-norm
  `q = 1/3` in `ℚ/ℤ`. Its 3-adic
  Jordan splitting has two rank-one constituents, of scales 1 and 3. Equality holds in
  Hermite's bound, and the class number is 1 (0G, 1D, 2E, 3B, 4A). Its order is `ℤ[ζ₃]`,
  with `Δ = −3` and six units, and its class is ambiguous, so `|SO(A₂)| = 6`,
  `|O(A₂)| = 12` and the mass of its genus is `1/12` (B1, B4, B8).
- `!![4,1;1,6]`: content 2, `Δ = −23`, and `O(L) = SO(L) = {±I}`, so it has no improper
  automorphism. Its genus has three proper classes and two classes, `!![2,1;1,12]` with
  `|O| = 4` and `!![4,1;1,6]` with `|O| = 2`, and mass `3/4`. The lattice `!![3,1;1,4]`, of
  determinant 11 and `Δ = −44`, is the same phenomenon at the smallest determinant
  (B4, B8).
- The family `Aₙ`: `det(Aₙ) = n+1` and `A_{Aₙ} ≅ ℤ/(n+1)` (0G, 1C).
- `D₈⁺`: the preimage of the spinor subgroup in `A_{D₈}` is proved even and unimodular
  by the general isotropic-subgroup correspondence and Lagrangian criterion, then identified
  with `E₈` by an explicit isometry; its trivial discriminant group is also computed as
  `H^⊥/H` (1K).
- `E₈`: even, unimodular, positive definite, `min = 2`, 240 minimal vectors, signature
  `(8,0)`, `sign q_{E₈} = 0`, unique in rank 8, and `|O(E₈)| = 696729600` (0G, 2B, 2C, 6C, 6G).
  Its mass `1/696729600` is the successor's 7H.
- Even unimodular lattices have `8 ∣ t₊ − t₋`, so no even unimodular positive definite
  lattice has rank 1 to 7 (1I, 6B).
- Rank 16: `E₈²` and `D₁₆⁺` lie in one genus and are not isometric (6D). That they *exhaust* the
  genus is 7I, and is the successor's.
- `Λ_{K3} = U³ ⊕ E₈(−1)²`: even, unimodular, signature `(3,19)`, `det = −1`, and unique
  with that signature. For `d > 0` the lattice `⟨2d⟩` embeds primitively. Every even lattice of
  signature `(1, ρ−1)` with `ρ ≤ 11` embeds primitively, by Theorem 1.12.4:
  `2ρ ≤ 22`, `1 ≤ 3`, `ρ − 1 ≤ 19` (5G, 6A). Uniqueness of these embeddings up to `O(Λ_{K3})` is
  `IntegralLatticesPartII`'s.
- Mass conventions: rank 0 gives 1, and the genus of `⟨a⟩` gives 1/2 (7G).

## Ordering and parallelism

Layer 0 is native. Layers 1 and 2 can proceed independently on it; 3A follows the native
localization, and 3B–3E follow 3A.

The rest of the order follows the prerequisite tables:

- milestones 3F to 3H need Layer 1 and the two suppliers named in their table; 3I needs only
  3B, 3D and 3E, so it can be built in parallel with 3F to 3H;
- Layer B needs Layers 0 to 3; its nonsquare branch also needs the order and Picard carriers
  of Global Number Fields and, for negative discriminant, Class Field Theory's
  ring-class-field milestone. The square branch is elementary. Layers 4 and 7 use both
  rank-2 branches;
- Layer 4 needs Layers 2, 3 and B, and the Orthogonal and Spin Groups roadmap;
- Layer 5 (5A, 5B, 5F, 5G, 5I, 5J) needs Layers 1 and 3 and N0's adelic lattice
  reconstruction, together with the rational-form producers of Quadratic Form Invariants, Global
  Quadratic Forms and Class Field Theory named at the start of Layer 5;
- Layer 6 follows its separate odd/characteristic/even construction order above, and 6C
  additionally needs Root Systems;
- Layer 7 — 7A, 7C, 7E and 7G — needs Layers 2, 3, 4 and B, and nothing adelic;
- Layer 8 is a contract and orders nothing here: it imports nothing, no milestone of Layers 0
  to 7, B or 9 has a theta series among its prerequisites, and nothing here waits on Theta
  Series. What that roadmap waits on from here is 8S — 1G, 1H, 1I and 6D;
- Layer 9 needs 2G, 3F and 7A.

The K3 results run `1 → 3 → N0 → 5A, 5B, 5G`: existence of an even lattice with given signature
and discriminant form, the genus comparison and existence of primitive embeddings use the local
inputs 3C, 3D and 3E and the rational-form producers named at the start of Layer 5, no milestone
of Layers 2, 6 or 7, and of Layer 4 only N0. Their uniqueness statements are
`IntegralLatticesPartII`'s.

## Downstream consumers

- `OrthogonalTamagawaAndLatticeMass` consumes Layers 0–4, 6C–6D, 7A, 7C, 7E, 7G, B1–B8 and 9B,
  and owns Eichler's theorem, the mass formula and the dyadic smooth model.
- `IntegralLatticesPartII` consumes Layers 1, 3, 4 and 5 here and OTM §0.3 for Nikulin's
  uniqueness, splitting and surjectivity theorems.
- [Theta Series](../ThetaSeries/README.md) consumes Layer 8's exports.
- `IndefiniteLatticeAutomorphisms`, `IndefiniteThetaAndSiegelWeil` and
  `FiniteQuadraticModuleWittTheory` consume the layers named in §*Scope and ownership*.

## References

- J. H. Conway, N. J. A. Sloane, *Low-dimensional lattices. IV. The mass formula*, Proc. R.
  Soc. Lond. A 419 (1988) 259–286 (cited by locator). This is the source for Layer 7:
  - equation (1) for the mass, and equations (2) and (3) for the formula;
  - section 5 for the species and octane tables;
  - equations (6) to (9), (13), (15) and (16) for the standard mass;
  - sections 3 and 6 for the dimension guard;
  - section 12 for the dictionary to Siegel's densities.
- S. Cho, *Group schemes and local densities of quadratic lattices in residue characteristic
  2*, Compositio Math. 151 (2015) 793–827. The proof of the dyadic local density formula
  used in 7D, which `OrthogonalTamagawaAndLatticeMass` owns. Definition 2.1 for the parity
  types and section 2.3 for bound and free constituents are cited by **3I**, which is ours,
  as is Lemma 5.1 for `N_M`, `N_Q` and `N`. Theorem 4.12 with Remark 4.13 for the maximal
  reductive quotient of the special fiber, Theorem 5.2 for the density, and Remark 5.3 for
  the count `#𝒢̃_L(κ)` through the unipotent radical are the successor's.
- W. T. Gan, J.-K. Yu, *Group schemes and local densities*, Duke Math. J. 105 (2000)
  497–524. The smooth-model formulation of the local density that Cho extends to `p = 2`;
  its Theorem 7.3 is the odd-residue-characteristic value that pins the constant between Cho's
  normalization and the limit definition of 7C, and is cited by 7C for that reason.
- D. Allcock, I. Gal, A. Mark, *The Conway–Sloane calculus for 2-adic lattices*,
  arXiv:1511.04614. The proof of the symbol calculus and the corrected canonical form, used
  in 3E.
- V. V. Nikulin, *Integer symmetric bilinear forms and some of their geometric
  applications*, Izv. Akad. Nauk SSSR 43 (1979) 111–177; translation Math. USSR-Izv. 14
  (1980) 103–167. Source for Layers 1 and 5: Theorem 1.3.3 (1I); Propositions 1.8.1 and
  1.8.2 (1G); Proposition 1.11.2 and Theorem 1.11.3 (1H); Corollary 1.9.4 (5A); Theorem
  1.10.1 and Corollary 1.10.2 (5B); Theorems 1.13.1 and 1.13.2 with Corollary 1.13.3 (5C);
  Corollaries 1.13.4 and 1.13.5 (5D); Proposition 1.14.1 and Theorem 1.14.2 (5E); Theorems
  1.12.2 and 1.12.4 with Corollary 1.12.3 (5G); Theorem 1.14.4 (5H); Proposition 1.15.1 and
  Corollary 1.15.2 (5I); Theorems 3.6.2 and 3.6.3 (5J).
- O. T. O'Meara, *Introduction to Quadratic Forms*, Grundlehren 117, Springer (1963). This
  is the source for Layers 0, 3, 4 and 6:
  - section 82E (0D);
  - section 91C with 91:9 (3B, 3C), and 92:1 to 92:2 (3C);
  - sections 93A and 93E with 93:16, 93:28 and 93:29 (3D);
  - section 102A with 102:7 (4A, 4C);
  - 103:4 (2G, 4E), and 104:5 (4D);
  - 105:1 and 106:13 (6C), and 106:1 (6B).
- J.-P. Serre, *A Course in Arithmetic*, GTM 7, Springer (1973), Chapters V and VII. Source
  for 1I, 6A, 6B and 6D: V.1.3.5, V.1.4.3 (the lattices `Γ_n` for `4 ∣ n`, with `Γ₈ = E₈` and
  `Γ₁₆ = D₁₆⁺`), V.2 Theorem 2 with Corollaries 1 and 2 and the remark after it, V.2.2, and
  VII.6.6 (the two rank-16 lattices are not isomorphic). V.2.3 states the Minkowski–Siegel
  mass without proof; it is not a milestone here, and the uniqueness of `E₈` is derived there
  from that mass, so 6C uses O'Meara's proof instead.
- J. Milnor, D. Husemoller, *Symmetric Bilinear Forms*, Ergebnisse 73, Springer (1973).
  Chapter II for 6A, and Appendix 4 for 1H, 1I and 1L.
- F. van der Blij, *An invariant of quadratic forms mod 8*, Indag. Math. 21 (1959) 291–293.
  The signature congruence of 1L; Milnor–Husemoller Appendix 4 gives the Gauss-sum proof.
- A. Kawauchi, S. Kojima, *Algebraic classification of linking pairings on 3-manifolds*, Math.
  Ann. 253 (1980) 29–42. The classification of nondegenerate symmetric pairings on finite abelian
  `2`-groups, the bilinear half of 1G. Text uncertified; cited by locator.
- C. T. C. Wall, *Quadratic forms on finite groups, and related topics*, Topology 2 (1963)
  281–298. The metabolic Gauss-sign vanishing of 1H; the Witt group of finite quadratic
  modules built there is `FiniteQuadraticModuleWittTheory`'s charter, not a milestone here.
- J. H. Conway, N. J. A. Sloane, *Sphere Packings, Lattices and Groups*, 3rd ed.,
  Grundlehren 290, Springer (1999):
  - Chapter 4 for root lattices and the `Dₙ⁺` constructions;
  - Chapter 15 for genus symbols, with the correction cited above;
  - Chapter 16 for unimodular masses;
  - Chapters 17 and 18 for Niemeier lattices, and Chapters 26 and 27 for the Leech
    lattice.
- J. W. S. Cassels, *Rational Quadratic Forms*, Academic Press (1978). Chapters 8 and 9 for
  Layer 3, Chapters 10 and 11 for Layer 4, and Chapter 13 for the binary theory used in 4E.
- W. Ebeling, *Lattices and Codes*, 3rd ed., Springer (2013). Discriminant forms, the
  classification in rank at most 24, and Niemeier lattices through glue codes.
- Y. Kitaoka, *Arithmetic of Quadratic Forms*, Cambridge Tracts 106, CUP (1993). The
  Minkowski–Siegel apparatus for Layer 7.
- M. Kneser, *Quadratische Formen*, revised with R. Scharlau, Springer (2002). Neighbors and
  class numbers for Layer 4.
- J. Voight, *Kneser's method of neighbors*, arXiv:2308.11566. An algorithmic reference for
  4G.
- D. A. Cox, *Primes of the Form x² + ny²*, Wiley (1989): Theorem 2.8 (p. 27) and Theorem 2.13
  (p. 29) for reduced positive definite forms and the finiteness of `h(D)` (B5), Theorem 3.9
  (p. 50) for the opposite form as the inverse class and ambiguous forms (B4), and Theorem 7.7 (p. 137) for primitive positive definite forms and
  `Pic` of an imaginary quadratic order (B2). Text uncertified; cited by locator.
- H. Cohen, *A Course in Computational Algebraic Number Theory*, GTM 138, Springer (1993), §5.2
  for the correspondence of forms and ideal classes of both signs, and §5.6 for the reduction
  cycles of indefinite forms (B2, B5). Text uncertified; cited by section.
- J. W. S. Cassels, *An Introduction to the Geometry of Numbers*, Grundlehren 99, Springer
  (1959), Chapter VIII, for Minkowski's second theorem (2F). Text uncertified; cited by chapter.
