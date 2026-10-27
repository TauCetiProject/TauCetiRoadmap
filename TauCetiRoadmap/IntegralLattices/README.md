# Roadmap: integral quadratic forms and lattices

This roadmap develops the arithmetic of integral symmetric lattices over `ℤ` and `ℤ_p`.
It uses the native IntegralLattice carrier, rational ambient space, duality, discriminant-form
and gluing interfaces. The broader Jordan, genus, spinor, mass-input and Nikulin programmes
extend those interfaces and preserve their conventions.

The native foundation includes quadratic maps without inverting 2, symmetric bilinear forms
and Gram/base-change calculus, Smith normal form and index determinants, real `ZLattice`
discreteness and covolume, and Cartan matrices. Tau Ceti's integral-lattice modules additionally
supply concrete even/unimodular, dual/discriminant, gluing and root-lattice constructions.
Use the actual declarations where available; the remaining milestones specify their extensions,
not replacement carriers or a claim that no library has this arithmetic.

`Suggested.lean` records native comparisons and typed targets. Its admitted declarations remain
proof obligations. `ArchimedeanVolume.lean` records the separate real metric/measure targets of
7E; neither file is a certificate that the entire programme is implemented.

The principal results of this roadmap are:

1. the classification of even unimodular lattices in low rank;
2. the genus, its Conway–Sloane symbols, the class and spinor-genus dictionary, and the local
   densities that a mass formula is assembled from;
3. Nikulin's theory of existence, uniqueness and primitive embeddings for even lattices.

The **Smith–Minkowski–Siegel mass formula** and **Eichler's theorem** belong to
`OrthogonalTamagawaAndLatticeMass` (OTM), with different earlier prerequisites. Positive-definite
mass uses quotient integration, local/infinite gauge comparisons and the normalized orthogonal
Tamagawa value. Eichler uses same-set-of-places strong approximation for Spin and the integral
spinor-image quotient. Strong approximation is not a premise of the positive mass branch.
Dyadic smooth models, their special fibres and the density comparison also belong to OTM,
over the actual general local/model contracts. This roadmap supplies the class/genus/spinor
dictionary, stabilizers, odd-prime densities, dyadic Jordan data and exponents, Euclidean real
volume factor and low-rank values. Later 5C–5D consume OTM's earlier Eichler output; this
phase dependency does not import the later mass formula.

Two projects consume the results. The LMFDB lattice section stores positive definite
integral lattices with their genus representatives. The K3 surface pipeline enumerates
genera and applies Nikulin's embedding criteria.

Suggested homes, which follow Mathlib's directory conventions:

- `TauCeti/LinearAlgebra/QuadraticForm/IntegralLattice/` for Layers 0 to 2. These layers
  hold the lattice structure, the bilinear and quadratic dictionary, dual lattices,
  discriminant groups, finite quadratic forms, reduction theory, and automorphism groups.
- `TauCeti/NumberTheory/IntegralLattice/` for Layers 3 to 7 and 9. These layers hold
  localizations, Jordan theory, the genus and its symbols, class numbers, spinor genera,
  Nikulin's theory, the unimodular classification, and the local mass ingredients.

## Scope

In scope: the arithmetic of integral lattices over `ℤ` and `ℤ_p`, as listed in the layers
below.

The arithmetic dependencies are `QuadraticFormInvariants`, `GlobalQuadraticForms`,
`GlobalNumberFields`, `ClassFieldTheory`, `RestrictedProducts`, `OrthogonalSpinGroups` and
`RepresentationTheory/RootSystems`. The real-volume construction additionally consumes the
native ball/radial measure, smooth metric and volume-density APIs, the early finite-dimensional
matrix Lie-group construction in `RepresentationTheory/LieGroups`, and `DifferentialGeometry`
12.1/12.4 for metric/density comparisons. Later Nikulin uniqueness consumes OTM0.3's Eichler
comparison over `AdelicAlgebraicGroups` AA4.2 and its actual earlier arithmetic/local-model
contracts. Use the selected producer's carrier, hypotheses and phase, rather than a whole-owner
title as entitlement. Field, order, adelic, Spin and ADE carriers remain with their actual owners.

[Theta Series](../ThetaSeries/README.md) is not among them, because its relation to this
roadmap runs the other way: it is a **consumer** of Layers 1, 2 and 6 here and supplies nothing
to this roadmap. It imports `TauCetiRoadmap.IntegralLattices.Suggested`, builds the theta series
of a positive definite lattice on its own real carrier, and transports the rational carrier, the
duality and discriminant-form theory and the reference lattices of this roadmap across its own
bridge. This roadmap imports nothing from it, states no theta series, and has no milestone whose
proof passes through one; the dependency is one-way, and §*Theta series* and Layer 8 set out
exactly what is exported. There is no reverse Theta Series or `LFunctions` roadmap dependency.
Real analysis does enter 7E through native sphere/ball measure, Gamma, charts, Jacobians and
Fubini. The local/formal density dictionary of 7C is distinct from the successor's global
Euler-product convergence and nonvanishing obligations. `Suggested.lean` imports neither
Theta Series nor `LFunctions`.

### Ownership and phase boundaries

Restricted products and orthogonal point groups alone do not supply strong approximation,
reduction, Tamagawa measures or integral smooth-model comparisons. Their actual generic
arithmetic contracts are in `AdelicAlgebraicGroups` (AA0–AA4), with the local/model contracts
it selects. OTM owns the following orthogonal specializations:

| Orthogonal specialization | Layer label | Exact owner |
| --- | --- | --- |
| Eichler's theorem `cls⁺ L = spn⁺ L` for indefinite rank `≥ 3`, and the class-number finiteness that follows from it | 4D, and the rank-`≥ 3` half of 4E | **`OrthogonalTamagawaAndLatticeMass`** |
| the adelic decomposition of `SO(V)(ℚ) \ SO(V)(𝔸)` into class-indexed pieces | 7B | **`OrthogonalTamagawaAndLatticeMass`** |
| the identification of a local density with the Haar volume of a stabilizer in the Tamagawa normalization | one bullet of 7C | **`OrthogonalTamagawaAndLatticeMass`** |
| the volume theorem `vol(SO(V)(ℚ) \ SO(V)(𝔸)) = 2` | 7F | **`OrthogonalTamagawaAndLatticeMass`**, over AA quotient/measure contracts |
| the Conway–Sloane mass formula and its checks | 7H | **`OrthogonalTamagawaAndLatticeMass`** |
| the rank-16 completeness statement, that the genus of `E₈²` has exactly two classes | 7I | **`OrthogonalTamagawaAndLatticeMass`** |
| Cho's smooth affine group scheme `𝒢_L` over `ℤ₂`, its special fibre and unipotent radical, and the closed formula it gives for the dyadic local density | 7D | **`OrthogonalTamagawaAndLatticeMass`** |

Constructing the dyadic model `𝒢_L` requires smoothening, its special fibre, unipotent radical
and reductive quotient, their point counts, and a comparison to the congruence-count limit.
OTM owns this orthogonal model calculation over the general local/model programme. Split
Chevalley–Demazure models alone do not supply it. This roadmap owns the Jordan types,
bound/free classification and Cho exponents `N_M`, `N_Q`, `N` in 3I.

The dependency order is by phase: early lattice 3/4A–4C feeds OTM0.3's same-S Spin/Eichler
construction; that output feeds the later lattice 5C–5D uniqueness/splitting route. The mass
branch consumes lattice 3I, 4A–4C, 7A, 7C, 7E and 7G without a reverse dependence from those
lattice inputs. Separate implementation modules follow this order; whole-file cyclic imports
are not a substitute for it. The legacy generic labels `AlgebraicGroupStrongApproximation`,
`ArithmeticReductionTheory` and `TamagawaMeasures` denote the corresponding AA contracts,
not three competing new carriers or obligations delegated to upstream.

Two more boundary facts about that successor are recorded here so that neither document drops
them. First, 6D and 7I are one classification split across the boundary: 6D here constructs
`E₈²` and `D₁₆⁺`, proves them even unimodular of rank 16, in one genus, and non-isometric, and
the successor's 7I proves that they exhaust the genus; only the pair classifies rank 16 — the
statement consumers quote as "there are exactly two even unimodular lattices of rank 16", and,
in its string-theoretic reading, as there being exactly two ten-dimensional heterotic strings.
Second, OTM's lattice masses and genus-exhaustion certificates are positive definite;
its earlier Eichler and class-finiteness statements concern indefinite lattices. Its own mass
assembly is a Tamagawa volume comparison. A selected shared construction of a numerical
Tamagawa value may use a rank-one Siegel–Weil argument at that supplier; that auxiliary proof
is not a theta-series construction in this roadmap. The indefinite Siegel–Narain kernel,
its theta lifts and indefinite Siegel–Weil identities remain `IndefiniteThetaAndSiegelWeil`'s.

Out of scope, with the owner of each subject:

| Subject | Owner |
| --- | --- |
| local quadratic forms, square classes, Witt/Brauer/Hasse/Clifford invariants, the Hilbert symbol, and dyadic classification | [Quadratic Form Invariants](../QuadraticFormInvariants/README.md) |
| Hasse--Minkowski and global classification, representation, and realization of rational forms | [Global Quadratic Forms](../GlobalQuadraticForms/README.md) |
| the groups `O(Q)`, `SO(Q)`, and `Spin(Q)`, the spinor norm, transvections, and local and finite-adelic spin groups | [Orthogonal and Spin Groups](../OrthogonalSpinGroups/README.md) |
| generic restricted products, compact-open families, and rational diagonals | [Restricted Products](../../Completed/RestrictedProducts/README.md) |
| generic algebraic-group adelic points, strong approximation, reduction theory, Tamagawa measures, and the central-isogeny volume comparison | `AdelicAlgebraicGroups` AA0–AA4 and its actual earlier local/model contracts |
| smoothening of an affine group scheme over `ℤ_p`, its special fibre, unipotent radical and reductive quotient, and the point counts of each | `OrthogonalTamagawaAndLatticeMass`, over the generic successors above |
| the orthogonal specialization: strong approximation for `Spin`, `τ(SO_Q) = 2`, Eichler's theorem, the genus/spinor-genus comparison in rank `≥ 3`, the dyadic local density of 7D, and the Smith–Minkowski–Siegel mass formula | `OrthogonalTamagawaAndLatticeMass`, the successor that Orthogonal and Spin Groups names |
| root systems, Weyl groups, `DynkinType`, the ADE classification | [Root Systems](../RepresentationTheory/RootSystems/README.md) |
| the theta series `Θ_L` and the coset series `θ_γ` of a positive definite lattice, their `q`-expansions, their `T` and `S` transformation laws, the vector-valued law on discriminant cosets, every modularity statement about them, and every conclusion drawn from one — the closed formula `r_L(2m) = 240 σ₃(m)` in even unimodular rank 8, the theta identity of the rank-16 pair, the rank-24 identities with the Leech representation numbers | [Theta Series](../ThetaSeries/README.md), which consumes this roadmap and supplies nothing to it; §*Theta series* below and Layer 8 record what it takes |
| Poisson summation for a full-rank `ℤ`-lattice in a real inner product space, and the Gaussian Fourier transform it is applied to | [Theta Series](../ThetaSeries/README.md), whose Layer 1 is the generic theorem; no milestone here consumes it |
| the number-field theta kernel of an ideal lattice in the mixed space, its Mellin transform, and the functional equations of zeta and Hecke `L`-functions | [L-functions](../LFunctions/README.md), which consumes Theta Series' Poisson summation and is not a dependency of this roadmap |
| number-field orders, conductors, raw proper fractional ideals, invertible proper fractional ideals, the ideal class monoid, `Pic`, and `NarrowPic` for the nonsplit binary branch | [Global Number Fields](../GlobalNumberFields/README.md) |
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
dependency between the two roadmaps runs one way: that roadmap imports this one, and this one
imports nothing from it.

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
names any of its declarations, and no such import may be added, because Theta Series imports
this file and Lean admits no cycle. Where the two roadmaps arrive at the same number, this one
counts and that one expands: `r_{E₈}(2) = 240` here is the number of roots of `E₈` (2B, 6G),
and the same value there is the `m = 1` case of a `q`-expansion.

**Owned here, consumed there.** Everything arithmetic about the rational lattice: the carrier
`IntegralLattice` and its predicates (0A), the dual `L^⋆` and the discriminant group `A_L` (1B,
1C), the discriminant bilinear form `b_L` and the half-norm quadratic form `q_L` (1D), the
finite bilinear and quadratic modules with their isotropic and Lagrangian subgroups, primary
decomposition and generator classification (1G), the Gauss-sum invariant `sign q` (1H),
Milgram's theorem at every signature (1I), the level (1J), the isotropic-subgroup/overlattice
correspondence (1E, 1F) and the ADE lattices with their discriminant forms (1K), the shells and
representation numbers (2B) and the covolume identity (2D), Jordan splittings and the genus
(Layer 3), Nikulin's theory (Layer 5), and the classification of unimodular lattices in low
rank, including the rank-16 pair `E₈²` and `D₁₆⁺` (6D) and the rank-24 reference lattices (6E).
Theta Series transports these across its own Layer-2 bridge and adds no competing definition of
any of them; its `D₁₆⁺` application is stated against 6D here. Layer 8 lists the exported
declarations row by row.

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
`r_L(k)` of 2B are counts in the rational carrier and are this roadmap's; that they are the
`q`-expansion coefficients of `Θ_L` is Theta Series' theorem, not a second definition here.

## How to read a milestone

Each layer states its milestones with a label, such as `3E`. Other roadmaps and the tables
below cite these labels. One layer carries a letter instead of a number: Layer B holds the
binary theory, and its milestones are `B1` to `B8`. Each layer ends with a table of direct
prerequisites. Every prerequisite has one of four kinds:

- **M**: a declaration that exists in Mathlib.
- **T**: a declaration that exists in Tau Ceti.
- **L**: an earlier milestone of this roadmap.
- **R**: a prerequisite from another roadmap. Where that roadmap has fixed a Lean name, the
  row names the **declaration**, and §What other roadmaps supply carries its type; a subject is
  then never a prerequisite, so "the Picard group of an order" is not one and `Pic` is. Where the
  supplier has fixed a milestone but no name, the row cites the layer, and the supplier table
  gives the provisional name marked with an asterisk.

No prerequisite has any other kind. A Mathlib pull request, an external repository, a
branch, and a future Mathlib version are all excluded.

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
an `IntegralLattice` to its carrier recovers the abstract form. Milestone 1A proves these
constructions inverse up to isometry and transports every invariant. The prose writes `B`
for the rational form and `L` for the embedded lattice. Nondegeneracy and definiteness are
predicates, never structure fields.

**The bilinear form is the primary datum.** The norm of `x` is `B x x`. The roadmap never
halves a norm without saying so. `L` is even when `B(x,x) ∈ 2ℤ` for every `x ∈ L`, and
odd otherwise. Restricting `B` to the carrier gives an integral symmetric bilinear form;
an even restriction is `Q.polarBilin` for a unique `Q : QuadraticForm ℤ L` with
`Q x = B(x,x)/2`. Milestones 0B and 1A prove this dictionary and its transport.

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

**Signature and degeneracy.** The signature is the reviewed triple `(t₊, t₀, t₋)` over
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
reviewed half-norm convention
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
subgroup is metabolic. These reviewed carriers are also the
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
are part of the statement of milestone 7H, and 7G proves them here independently of it.

## What Mathlib supplies

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
| `CartanMatrix.A`, `CartanMatrix.D`, `CartanMatrix.E₆`, `CartanMatrix.E₇`, `CartanMatrix.E₈` | `Mathlib/LinearAlgebra/Matrix/Cartan.lean` | 0G, 6C |
| `Matrix.PosDef`, `Matrix.PosSemidef`, congruence invariance | `Mathlib/LinearAlgebra/Matrix/PosDef.lean` | 0E |
| `ℤ_[p]`, `ℚ_[p]`, Hensel's lemma, `PadicInt.unitCoeff` | `Mathlib/NumberTheory/Padics/` | 3A |
| Gauss sums and quadratic characters | `Mathlib/NumberTheory/LegendreSymbol/GaussSum.lean` | 1H |

Two limits of the Mathlib API shape this roadmap. The eigenvalue and determinant
characterizations of `Matrix.PosDef` require `RCLike`, so milestone 0E builds the transfer
from `ℤ` to `ℝ` itself. The splitting results in `BilinearForm/Orthogonal.lean` are stated
over a field, so milestone 0F proves the correct statement over `ℤ`, where the hypothesis
is unimodularity and not nondegeneracy.

## What Tau Ceti supplies

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
| `TauCeti.IntegralLattice.LocalCarrier`, `TauCeti.IntegralLattice.localIntegralForm`, `TauCeti.IntegralLattice.completedRationalForm`, `TauCeti.IntegralLattice.localizationToCompletion`, `TauCeti.IntegralLattice.localizationToCompletion_injective`, `TauCeti.IntegralLattice.span_range_localizationToCompletion`, `TauCeti.IntegralLattice.completedRationalForm_localizationToCompletion` | `TauCeti/NumberTheory/IntegralLattice/Localization.lean` | 3A, 3C, N0 |

The milestones of this roadmap that these declarations cover are consumed from them: 3A starts
from `TauCeti.IntegralLattice.localIntegralForm` and `TauCeti.IntegralLattice.localizationToCompletion`
rather than from a second localization map, the odd-prime splitting of 3C is stated on the
native local form, the restriction constructors of 0A are `TauCeti.IntegralLattice.restrictFull` and
`TauCeti.IntegralLattice.restrict` with comparison `TauCeti.IntegralLattice.restrictFullIsometry`, and the
characteristic-vector calculus of 1L, the metabolic predicate of 1G and the Gauss-sum invariant
of 1H with its additivity and metabolic vanishing are the native declarations listed.

## What other roadmaps supply

Each row fixes an owner and, where one exists, the exact Lean declaration consumed. A
README-only supplier milestone stays a milestone here; `Suggested.lean` does not fabricate a
structure or carrier for it.

| Consumer milestones | Supplier | Exact declaration or milestone | Contract |
| --- | --- | --- | --- |
| 0C, 3H | Quadratic Form Invariants | `hasseInvariant`, `hilbertSymbol`, `localHasse`, `exists_of_realization`; Layer 6D classification | field and nonarchimedean local invariants, including the dyadic classification |
| 3G | Quadratic Form Invariants | `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula` | the norm-equation symbol agrees with CFT's pairing and inherits Hilbert reciprocity |
| 3H, 4A | Global Quadratic Forms | `atFinitePlace`, `atRealPlace`, `hasseMinkowski_equivalent`, `equivalent_of_locallyEquivalent` | localization and global equivalence of the underlying rational quadratic spaces |
| B1--B5, `¬ IsSquare Δ` | Global Number Fields | `NumberFieldOrder`, `NumberFieldOrder.conductor`, `NumberFieldOrder.IsProperFractionalIdeal`, `NumberFieldOrder.properFractionalIdeals`, `NumberFieldOrder.invertibleProperFractionalIdeals`, `NumberFieldOrder.invertible_isProper`, `NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two`, `IdealClassMonoid`, `NumberFieldOrder.mkIdealClassMonoid`, `picEquivUnitsIdealClassMonoid`, `Pic`, `NumberFieldOrder.mkPic`, `NumberFieldOrder.mkPic_surjective`, `NarrowPic`, `NumberFieldOrder.narrowPrincipal`, `NumberFieldOrder.narrowToPic`, `NumberFieldOrder.narrowToPic_surjective`, `finite_pic`, `finite_narrowPic` | field orders and their ideal-class monoids and wide and narrow Picard groups; only the invertible proper carrier enters `Pic` and `NarrowPic`, while raw noninvertible proper ideals remain in `IdealClassMonoid`; the square-discriminant split branch is elementary and does not use these carriers |
| B3, `Δ < 0` | Class Field Theory | `ringClassField`, `ringClassArtinMap`, `gal_ringClassField_equiv_pic` | the class-field interpretation in the nonsplit field case only. ⚠ Each of these takes an order in a number **field** together with `Module.finrank ℚ K = 2`, so the split algebra `ℚ × ℚ` cannot be supplied to any of them: it carries no `Field` instance and is the `K` of no `NumberFieldOrder K`. There is no split ring-class-field claim |
| 3G | Class Field Theory | `hilbertProductFormula` | cohomological Hilbert reciprocity, reached on classical symbols through QFI's comparison |
| 4B, B7 | Restricted Products | `RestrictedProductGroup`, `RestrictedProductGroupWithFactor`, `CompactOpenSubgroups`, `integralSubgroup`, `isCompact_integralSubgroup`, `rationalDiagonal` | generic restricted products, compact open reference families, and rational diagonals. ⚠ Quotient measures and Tamagawa normalization are **not** exported by Restricted Products and are not cited here; they belong to `TamagawaMeasures` and reach the lattice mass only through `OrthogonalTamagawaAndLatticeMass` |
| 4B, 4C, 4F, B7 | Orthogonal and Spin Groups | `orthogonalGroup`, `orthogonalBaseChange`, `orthogonalBaseChangeReal`, `spinorNorm`, `spinorNorm_reflection`, `OrthogonalCompactOpens`, `finiteAdelicOrthogonal`, `transvection`, `transvectionLiftHom` | orthogonal/spin-specific algebra, local spinor norms, and the finite-adelic point groups. ⚠ `strongApproximation_finiteAdelicSpin` and the orthogonal volume theorem are **not** exports of Orthogonal and Spin Groups and are not cited; its README states that only `OrthogonalTamagawaAndLatticeMass` may export them |
| 6C, 6G | Root Systems | Layer 5 ADE classification and `Nat.card P.weylGroup` | the rank-eight root system with the `E8` Cartan matrix is of type `E8` |

`ThetaSeries` and `LFunctions` are **not** dependencies of this roadmap, and neither has a row
above. Theta Series is a consumer: it imports `TauCetiRoadmap.IntegralLattices.Suggested` and
takes the rational carrier, the dual, the discriminant group and forms, the finite quadratic
modules, the overlattice correspondence, the ADE lattices and `D₁₆⁺` across its own bridge, and
nothing comes back. L-functions owns the number-field theta kernel of an ideal lattice in the
mixed space, its Mellin transform and the resulting functional equations, and it consumes
generic lattice Poisson summation from Theta Series. No milestone here consumes anything from
either roadmap, and `Suggested.lean` imports neither and `#check`s no declaration of either.
The dependency graph through this roadmap is a chain, not a cycle:

```text
IntegralLattices -> ThetaSeries -> LFunctions
```

Nothing is defined twice: the real-model carrier and the bridge between the two models are
Theta Series', the rational carrier and every discriminant-form invariant are this roadmap's,
and §*Scope*, §*Theta series* and Layer 8 record what crosses the boundary and in which
direction.

---

## The build, in layers

### Layer 0: lattices, the dictionary, and the first invariants

**0A. The lattice and its predicates.** The object is `IntegralLattice`, as fixed in the
conventions, with a genuine `[carrier.IsLattice ℚ]` instance. This milestone asks for:

- the predicates `IsEven`, `IsNondegenerate`, `IsUnimodular`, and `PosDef`, with
  `IsUnimodular` defined by `L = L^⋆`; determinant and quotient-cardinality criteria are
  equivalence theorems, not alternate definitions;
- the orthogonal direct sum, the twist `L(a)`, and isometry;
- the determinant of a direct sum is the product of the determinants, and the determinant
  of `L(a)` is `aⁿ det L`;
- the rank is additive over direct sums;
- two restriction constructors: a submodule of full rational span gives an
  `IntegralLattice` in the same `V`, while an arbitrary finite-free submodule gives one in
  its own ambient space `ℚ ⊗[ℤ] M`, and the two agree up to the canonical isometry when `M` is
  full. These are Tau Ceti's `TauCeti.IntegralLattice.restrictFull`, `TauCeti.IntegralLattice.restrict` and
  `TauCeti.IntegralLattice.restrictFullIsometry`, consumed rather than rebuilt. An arbitrary submodule is
  not silently treated as full.

An isometry is a rational linear equivalence preserving both carrier and form. Every
invariance theorem requires this structure; a bare additive or module equivalence is an
explicit rejection test.

For `a : ℤ`, the twist `L(a)` remains integral, and an even form remains even. Its rank-`n`
Gram determinant is `aⁿ det L`; the converse parity implication needs the expected unit or
coprimality hypothesis. Nondegeneracy needs `a ≠ 0`, and positive definiteness needs
`a > 0`. Discriminant groups and forms under a nonunit twist are related by
the induced inclusions and quotients; they are not claimed to be unchanged.

**0B. The even and quadratic dictionary.** An even symmetric `β` is the polar form of a
unique `Q : QuadraticForm ℤ L`. The polar form of any `Q` is symmetric and even, and
satisfies `Q.polarBilin x x = 2 * Q x`. Both round trips are proved. The dictionary is
transported to Gram matrices, where evenness is an even diagonal, and to direct sums and
twists.

**0C. Gram matrices and the determinant.** The Gram matrix of a basis, and equality of
Gram determinants under a change of basis. Then `det L : ℤ` is an invariant of the lattice.
Its behavior under direct sums and twists is proved. For a sublattice `L' ≤ L` of finite
index, `det L' = [L : L']² · det L`.

The comparison with the square-class invariants of the rational form is also proved:
`d(β ⊗ ℚ) = [det L]` and `d±(β ⊗ ℚ) = (−1)^{n(n−1)/2}·[det L]`.

**0D. Scale, norm ideal and level.** The ideals `𝔰(L)` and `𝔫(L)`, the inclusions
`2𝔰 ⊆ 𝔫 ⊆ 𝔰`, and the characterization of evenness by `𝔫 ⊆ 2ℤ`. The level of a
nondegenerate integral lattice, and its independence of the chosen basis.

**0E. Radical, definiteness, and signature.** Define the radical as `LinearMap.ker B` and
the signature triple `(t₊,t₀,t₋)`. Prove it sums to the rank, is invariant under isometry,
and characterizes positive/negative (semi)definiteness, degeneracy, and indefiniteness.
Nondegeneracy is equivalent to radical `⊥`, to `t₀=0`, and to nonzero Gram determinant.
`PosDef` over `ℤ` is equivalent to `PosDef` of the rational and real forms and to
`Matrix.PosDef` of the real Gram matrix. Construct the carrier image in the quotient by
the radical, prove it is a full integral nondegenerate lattice, transports evenness, and
has signature `(t₊,0,t₋)`. This is the only route from a degenerate affine Cartan lattice
to the later nondegenerate layers.

**0F. Unimodular orthogonal splitting.** If `M ≤ L` and the restriction of `β` to `M` is
unimodular, then `L = M ⊕ M^⊥`. Over `ℤ` the correct hypothesis is unimodularity, not
nondegeneracy. A vector of norm `±1` therefore splits off a summand `⟨±1⟩`. Cancellation
over `ℤ` is false, and the failure is stated with the counterexample given in the table of
hard theorems.

**0G. The standard and degeneracy examples.** The examples are `⟨a⟩`, `Iₙ`, the
hyperbolic plane `U` with Gram matrix `!![0,1;1,0]`, and the root lattices `Aₙ`, `Dₙ`,
`E₆`, `E₇` and `E₈`. For each one the milestone asks for rank, signed determinant,
nonnegative discriminant, parity, signature, and level. The Cartan matrices are the Gram
matrices of the root lattices. The coordinate models
`Aₙ={x∈ℤ^{n+1} | ∑x=0}` and `Dₙ={x∈ℤⁿ | ∑x even}` are constructed, and isometries with
the Gram models are proved. Three reviewed rejection tests are mandatory: `U` is even,
unimodular, and indefinite of signature `(1,0,1)`; `⟨-2⟩` is negative definite of
signature `(0,0,1)`; and affine `Ã₁` with Gram `!![2,-2;-2,2]` is even,
positive-semidefinite, degenerate of signature `(1,1,0)`, with radical quotient isometric
to `A₁=⟨2⟩`.

| Milestone | Direct prerequisites |
| --- | --- |
| 0A | M `LinearMap.BilinForm.IsSymm`, `Nondegenerate`, `nondegenerate_iff_det_ne_zero`, `QuadraticMap.PosDef` |
| 0B | M `polarBilin`, `exists_companion'`, `polar_self`, `two_nsmul_associated`; L 0A |
| 0C | M `BilinForm.toMatrix`, `toMatrix_mul_basis_toMatrix`, `Submodule.natAbs_det_basis_change`; L 0A; R Quadratic Form Invariants Layer 3 |
| 0D | L 0A, 0C |
| 0E | M `sigPos`, `sigNeg`, `sigPos_add_sigNeg_add_radical`, `Matrix.PosDef`, `LinearMap.BilinForm.baseChange`; L 0A, 0C |
| 0F | M `IsOrtho`, `orthogonal`, `nondegenerate_restrict_of_disjoint_orthogonal`; L 0A, 0C |
| 0G | M `CartanMatrix.A`, `CartanMatrix.D`, `CartanMatrix.E₆`, `CartanMatrix.E₇`, `CartanMatrix.E₈`; L 0A to 0F |

### Layer 1: dual lattices, discriminant groups, and finite quadratic forms

**1A. The abstract-form dictionary.** Starting from an abstract finite free `ℤ`-module
with symmetric integral `β`, construct the canonical `IntegralLattice` in
`V=ℚ⊗L` with `B=β.baseChange ℚ`. Conversely restrict the rational form of an
`IntegralLattice` to its carrier. Prove both round trips up to the reviewed isometry type
and transport every Layer-0 invariant. This is a dictionary around the one embedded
carrier, not a second public lattice structure. Integrality is `L ≤ L^⋆`.

**1B. The dual lattice.** `L^⋆ = B.dualSubmodule L`, with `L^{⋆⋆} = L` for symmetric
nondegenerate `B`. Duality reverses inclusions. For nonzero `a : ℤ`, twisting the form gives
the carrier identity `dual_{aB}(L) = (a : ℚ)⁻¹ • dual_B(L)` inside `V`; the right side is
scalar dilation of a submodule, not the form twist `L^⋆(a⁻¹)`. The Gram matrix of the dual
basis is `G⁻¹`, and `det L^⋆ = (det L)⁻¹` in `ℚ`. A
lattice is unimodular exactly when `L = L^⋆`. Prove the load-bearing statements that the
dual is a full lattice exactly when `B` is nondegenerate and that
`dualSubmoduleToDual : L^⋆ ≃ Module.Dual ℤ L` is an equivalence. Establish double duality
first with `B.flip`, then specialize using symmetry.

**1C. The discriminant group.** `A_L` is the actual quotient of the subtype `L^⋆` by the
inverse image of `L`, with quotient map, representatives, zero criterion, and isometry
functoriality. It is finite exactly when `L` is nondegenerate; in that case it has order
`|det L|`, and
`l(A_L) ≤ rank L`. Its invariant factors come from `Submodule.quotientEquivPiZMod`. The
pairing `A_L × A_L → ℚ/ℤ` is perfect. Mathlib states finite abelian duality for
homomorphisms into `Mˣ`, so the comparison with the `ℚ/ℤ`-valued dual is part of this
milestone. This discharges the two open requests in
`Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean`.

**1D. The discriminant forms.** `b_L` for a nondegenerate integral lattice, and the
half-norm `q_L : A_L → ℚ/ℤ` for an even lattice. The polar of `q_L` is exactly `b_L`.
Canonical isometries
`A_{L⊕M} ≅ A_L ⊕ A_M` carrying `q_{L⊕M}` to `q_L ⊕ q_M`, and `A_{L(−1)} ≅ A_L` carrying
`q_{L(−1)}` to `−q_L`. These are isometries of finite quadratic forms, and not equalities
of types.

**1E. Integral overlattices.** Let `L` be nondegenerate and integral. For an intermediate
module `L ≤ M ≤ L^⋆`, the quotient `M/L` is a subgroup of `A_L`, and `M` is integral exactly
when `b_L` vanishes on this subgroup. For an arbitrary finite-index overmodule in the rational
span first prove `M ≤ L^⋆` from integrality: `B(M,L) ⊆ B(M,M) ⊆ ℤ`. Without that containment
`M/L` has no asserted map to `A_L` (for example `L=⟨2⟩`, `M=(1/3)ℤ`).
This gives a bijection between integral overlattices and subgroups `H ≤ A_L` with
`b_L|_{H×H} = 0`. For such an `H`, `A_M ≅ H^⊥/H` with the induced form, and
`det M = det L / [M : L]²`. Construct this as an order isomorphism between intermediate
submodules and subgroups, not merely an existence theorem.

**1F. Even overlattices.** Let `L` be even. For `L ≤ M ≤ L^⋆`, the module `M` is even
exactly when `q_L` vanishes on `M/L`. An arbitrary even finite-index overmodule first lies in
`L^⋆` by integrality, as in 1E; evaluation of `q_L` is only made after this inclusion. This gives a bijection between even overlattices and
subgroups `H` with `q_L|_H = 0`, and `A_M ≅ H^⊥/H` carries the induced `q_M`. Isotropy for
`q_L` implies isotropy for `b_L`, so the even correspondence is a restriction of the
integral one. The two are different: milestone 1F is the one Layer 5 uses, and the smallest
lattice where they differ is `A₁ ⊕ A₁`. Prove that the glued lattice is unimodular exactly
when `H` is Lagrangian (`H=H^⊥`), and that its discriminant form is the orthogonal quotient
`H^⊥/H`.

**1G. Finite bilinear and quadratic modules.** Use the reviewed `FiniteBilinearModule` and
`FiniteQuadraticModule` carriers from the conventions. Nondegeneracy is bijectivity of the
adjoint `A → CharacterModule A`. Define `H^⊥`, isotropic and Lagrangian subgroups, and prove
`#H·#H^⊥=#A` for a nondegenerate module. Define the orthogonal quotient `H^⊥/H`, prove its
induced form nondegenerate, and then add:

- orthogonal sums, and the `p`-primary decomposition `q = ⊕_p q_p`;
- isometries, and the group `O(q)`;
- metabolic modules: `(A, q)` is metabolic when it has a Lagrangian subgroup, isotropic for
  `q` with `H = H^⊥`. By 1F, the discriminant form of an even lattice is metabolic exactly
  when the lattice has an even unimodular overlattice. ⚠ Isotropy for the polar pairing alone
  is strictly weaker and is not this notion: the discriminant form of `A₁ ⊕ A₁` has a subgroup
  equal to its own orthogonal complement on which `b` vanishes while `q = ½` on its generator,
  and 1H gives that module the invariant `2`, not `0`. The predicate is Tau Ceti's
  `TauCeti.FiniteQuadraticModule.IsMetabolic`;
- the generators `q_θ^{(p)}(p^k)`, `u^{(2)}(2^k)` and `v^{(2)}(2^k)` of Nikulin
  Proposition 1.8.1, with the theorem that every **nondegenerate** finite quadratic form
  is an orthogonal sum of them;
- the relations among the generators for nondegenerate forms, which are Nikulin
  Proposition 1.8.2.

Without the relations the list of generators is not a classification. Layers 3 and 5 need
the classification. The broad carrier still permits degenerate restrictions to subgroups;
nondegeneracy is an explicit hypothesis before the generator classification, its relations,
the Gauss-sum invariant, or the comparison theorem is invoked.

**1H. The Gauss-sum invariant.** For nondegenerate `(A,q)` in the canonical half-norm
convention,
`∑_{a ∈ A} e^{2πi q(a)} = √#A · e^{2πi·sign(q)/8}`, which defines `sign q ∈ ℤ/8`. The
invariant is additive over orthogonal sums of nondegenerate modules. The invariant, its
defining formula, additivity and the metabolic vanishing below are Tau Ceti's
`TauCeti.FiniteQuadraticModule.gaussSign`, `TauCeti.FiniteQuadraticModule.IsNondegenerate.gaussSum_eq`,
`TauCeti.FiniteQuadraticModule.gaussSign_prod` and `TauCeti.FiniteQuadraticModule.gaussSign_eq_zero_of_isMetabolic`; the
milestone is what follows. Its values on the generators are those of
Nikulin Proposition 1.11.2:

- `sign q_θ^{(p)}(p^k) ≡ k²(1−p) + 4kη (mod 8)` for odd `p`, where `(θ|p) = (−1)^η`;
- `sign q_θ^{(2)}(2^k) ≡ θ + 4kω(θ) (mod 8)`, where `ω(θ) ≡ (θ²−1)/8 (mod 2)`;
- `sign v^{(2)}(2^k) ≡ 4k (mod 8)`;
- `sign u^{(2)}(2^k) ≡ 0 (mod 8)`.

Nikulin Theorem 1.11.3 is proved with them: two **nondegenerate** finite quadratic forms
with isometric bilinear forms are isometric exactly when their invariants agree mod 8.

A nondegenerate metabolic module has `sign q = 0`: with `H` Lagrangian in the sense of 1G,
summing the Gauss sum over cosets of `H` collapses it to `#H = √#A`. The converse is false,
and the witness is in the table of hard theorems: `q_θ^{(5)}(5)` with `(θ|5) = −1` has
`sign = 0` by the table above, while its order 5 is not a square `#H²`, so no Lagrangian
subgroup exists. The statement that repairs the converse replaces `sign q = 0` by the
vanishing of the Witt class, and it is not a milestone here: the Witt group of nondegenerate
finite quadratic modules, with orthogonal sums, metabolic reduction, `sign` descending to a
homomorphism to `ℤ/8`, and the equivalence of the trivial Witt class with the existence of a
Lagrangian subgroup, is `FiniteQuadraticModuleWittTheory`'s (§*Scope*). No Witt-group carrier
is defined here; the metabolic predicate of 1G and the vanishing statement above are the exact
contract that successor consumes.

**1I. Milgram's theorem.** For an even nondegenerate lattice, `t₊ − t₋ ≡ sign q_L (mod 8)`
(`milgram`, stated with Tau Ceti's `gaussSign` of `discriminantQuadraticModule`). An even
unimodular lattice has `A_L = 0`, so `8 ∣ t₊ − t₋`.

**1J. Level.** For an even lattice the level is the exponent of the annihilator of `q_L`,
and it agrees with the definition through `N·G⁻¹`. The level divides `2·det L`, with the
divisibility calculus that follows.

**1K. Rank-one, ADE and gluing calculations.** Compute in the actual dual quotient,
including explicit representatives and induced forms. For `⟨2m⟩`, `m≠0`, prove
`L^⋆=(1/(2m))ℤ`, `A_L≃ℤ/(2m)`, `#A_L=|2m|`, and on its generator
`b(g,g)=1/(2m)`, `q(g)=1/(4m)` in `ℚ/ℤ`; verify the polar identity directly and both signs
of `m`. The excluded zero form is the degenerate signature `(0,1,0)` example and has no
finite discriminant group.

Construct the positive ADE lattices from Tau Ceti's Bourbaki-numbered root data and verify
the full finite quadratic modules below. Representatives, exhaustion of the quotient, all
pairings needed for isometry, and nondegeneracy are required; group order alone is not.

| lattice | discriminant group | checked half-norm values in `ℚ/ℤ` |
| --- | --- | --- |
| `A_n`, `n≥1` | `ℤ/(n+1)` | the first fundamental weight generates, `q=n/(2(n+1))` |
| `D_n`, odd `n≥5` | `ℤ/4` | a spinor class generates, `q(s)=n/8`; `v=2s`, `q(v)=1/2` |
| `D_n`, even `n≥4` | `(ℤ/2)²` | vector and spinor classes exhaust; `q(v)=1/2`, `q(s)=q(c)=n/8` |
| `E₆` | `ℤ/3` | a minuscule-weight class generates, `q=2/3` |
| `E₇` | `ℤ/2` | the minuscule-weight class generates, `q=3/4` |
| `E₈` | trivial | self-dual and the quadratic module is trivial |

Finally construct the `D₈→E₈` isometry. With
`D₈={x∈ℤ⁸ | ∑x_i even}` and `s=(1/2)∑e_i`, the class of `s` generates an order-two
quadratic-isotropic subgroup `H≤A_{D₈}` because `q(s)=8/8=0`. Identify its preimage as
`D₈⁺=D₈∪(s+D₈)`, prove `H=H^⊥`, and obtain evenness and unimodularity from the general
gluing theorem. Construct an explicit basis or rational isometry whose Gram matrix is the
positive `E₈` Cartan matrix, yielding an actual isometry `D₈⁺≅E₈`; determinant one alone is
not an acceptable argument. Check `A_{D₈⁺}≅H^⊥/H=0` against the direct `E₈` calculation.

**1L. Characteristic vectors and van der Blij's congruence.** A vector `w ∈ L` of an
integral lattice is **characteristic** when `β(w,x) ≡ β(x,x) (mod 2)` for every `x ∈ L`. The
predicate is exported: it is stated on the integral restriction of 1A, so the congruence is a
congruence of integers, and it is the predicate whose counts drive O'Meara's proof of 6C.
This milestone asks for:

- the definition, with its calculus: `L` is even exactly when `0` is characteristic, and
  `(w₁, w₂)` is characteristic for `L ⊕ M` exactly when `w₁` and `w₂` are;
- for unimodular `L`: characteristic vectors exist — mod 2 the norm map `x ↦ β(x,x)` is
  additive, and unimodularity makes every `ℤ/2`-functional a pairing against some `w` — they
  form a single coset of `2L`, and `β(w,w) mod 8` does not depend on the choice, by the
  elementary identity `β(w+2v, w+2v) − β(w,w) = 4(β(w,v) + β(v,v))`, whose right side the
  characteristic property makes divisible by 8. This bullet and the previous one are Tau Ceti's
  `TauCeti.IntegralLattice.IsCharacteristicVector` with its calculus in
  `TauCeti/LinearAlgebra/IntegralLattice/Characteristic/`, consumed here;
- **van der Blij's theorem**: for a nondegenerate unimodular lattice and any characteristic
  `w`, `t₊ − t₋ ≡ β(w,w) (mod 8)`. The odd unimodular case is the content — `⟨1⟩` has the odd
  integers as its characteristic vectors, and `w² ≡ 1 (mod 8)` — and at `w = 0` the even case
  recovers the corollary of 1I, `8 ∣ t₊ − t₋`, so the two milestones must agree rather than
  one restating the other.

⚠ Unimodularity is load-bearing, and the statement for a merely nondegenerate integral
lattice is false; the witness is in the table of hard theorems. For `⟨2⟩` every value of `β`
is even, so every vector — zero included — is characteristic, while `t₊ − t₋ = 1` is odd and
every `β(w,w) = 2k²` is even, so the congruence fails for every characteristic vector.

| Milestone | Direct prerequisites |
| --- | --- |
| 1A | M `LinearMap.BilinForm.baseChange`, `IsSymm.baseChange`; L 0A, 0C |
| 1B | M `dualSubmodule`, `dualSubmodule_span_of_basis`, `dualSubmodule_dualSubmodule_of_basis`; L 1A |
| 1C | M `AddSubgroup.relIndex_eq_abs_det`, `Submodule.quotientEquivPiZMod`, `AddCommGroup.equiv_directSum_zmod_of_finite`, `Mathlib/GroupTheory/FiniteAbelian/Duality.lean`; L 1B |
| 1D | M `AddCircle`, `AddCircle.equivAddCircle`; L 1C |
| 1E | L 1C, 1D |
| 1F | L 1E |
| 1G | M `AddCircle`, `AddCommGroup.equiv_directSum_zmod_of_finite`; L 1D |
| 1H | M Gauss sums and quadratic characters; L 1G |
| 1I | L 0E, 1D, 1H |
| 1J | L 0D, 1D |
| 1K | T Root Systems Layer 5 ADE bridge; L 0G, 1B to 1G |
| 1L early | L 0A, 0C, 0E, 1A, 1B: characteristic coset, parity and choice invariance |
| 1L signature | independent odd 6A theorem applied to `L ⊕ W`, as below; the Gauss-sum proof via 1H/1I remains a separate construction |

### Layer 2: positive definite lattices, reduction, and automorphisms

Every statement in this layer assumes that `L` is positive definite, unless it says
otherwise. Sign-invariant conclusions, such as finiteness of automorphisms or of each fixed shell,
extend to negative-definite lattices by replacing `β` with `−β`; positive minima and bounded-above
sublevel statements keep their positive-definite convention.

**2A. Sets of bounded norm are finite.** For positive definite `L` and any `C`, the set
`{x | β x x ≤ C}` is finite. Two proofs are acceptable: realization in `ℝⁿ` with
`ZLattice` discreteness, or an elementary bound from the Gram matrix.

**2B. Minimum, shells, kissing number.** `min L` is the least value of `β x x` over nonzero
`x`, and it is defined when `rank L ≥ 1`. The shell `S_k(L) = {x | β x x = k}` is defined
for every rank. In rank 0, `S_0 = {0}` and every other shell is empty. The kissing number
is `#S_{min L}(L)`, and `r_L(k) = #S_k(L)` are the **representation numbers**. They are counts
here, and every statement about them in this roadmap is a statement about a finite set: that
they are the `q`-expansion coefficients of `Θ_L`, and hence that `r_{L⊕M}` is the convolution
of `r_L` and `r_M` and `r_{L(a)}` is `r_L` reindexed, is Theta Series' theorem through the
bridge and is not restated here.

**2C. Automorphism groups.** `O(L)` is the group of isometries of `L`, and `SO(L)` is its
subgroup of elements of determinant 1. For definite `L`, `O(L)` is finite. Also
`O(L) × O(M) ≤ O(L ⊕ M)`, with the obstruction to equality identified. Definiteness is
needed: 4F gives an infinite `O(L)` for every indefinite lattice of rank at least 3, and B4
settles rank 2, where `O(L)` is infinite exactly when the norm form is anisotropic.

**2D. Covolume.** For a positive definite lattice realized in Euclidean space,
`covolume(L)² = det L`. This is the identity Theta Series' `S`-transformation quotes through
its bridge, restated there in the real model, and it is where the `√det`-versus-`det`
bookkeeping is fixed once.

**2E. Minkowski and Hermite bounds.** Both statements assume `rank L = n ≥ 1`, because `min L`
is defined only there. Minkowski's bound is `min L ≤ c_n (det L)^{1/n}`, with `c_n` the
explicit constant from the convex body theorem. Hermite's inequality is
`min L ≤ (4/3)^{(n−1)/2} (det L)^{1/n}`, with that constant. `A₂` attains equality in rank 2.

**2F. Successive minima.** For positive definite `L` of rank `n ≥ 1` and `1 ≤ i ≤ n`, the
`i`-th successive minimum is

    λ_i(L) = min {c : the set {x ∈ L : β x x ≤ c} spans a subgroup of rank at least i},

so `λ_i` is a value of the form `β x x`, and not a length. This milestone asks for: the
minimum exists, and `λ₁(L) = min L`; the sequence is nondecreasing; vectors `x₁, …, xₙ`
with `β x_i x_i = λ_i(L)` and `x₁, …, xₙ` linearly independent exist; and Minkowski's second
theorem `∏_i λ_i(L) ≤ γ_n^n det L` with the explicit constant. Vectors attaining the
successive minima need not form a `ℤ`-basis, and this roadmap does not claim that they do.
Milestone 2G produces the basis it needs by reduction, not from 2F.

**2G. Reduction and finiteness of classes.** Minkowski-reduced bases exist. A reduced Gram
matrix of given rank and determinant has entries bounded explicitly in terms of the rank
and the determinant. There are therefore finitely many isometry classes of positive
definite lattices of a given rank and determinant. This is the positive definite case of
class-number finiteness, and it is what the enumeration in the LMFDB rests on.

| Milestone | Direct prerequisites |
| --- | --- |
| 2A | M `IsZLattice`, `Matrix.PosDef`; L 0E |
| 2B | L 2A |
| 2C | M `IsZLattice`; T `orthogonalGroupToLinearIsometryEquiv`; L 2A |
| 2D | M `ZLattice.covolume`, `covolume_eq_det`; L 0C, 0E |
| 2E | M `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`, `ZLattice.covolume`; T doubling counts; L 2B, 2D |
| 2F | M `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`; L 2B, 2E |
| 2G | T doubling counts; L 2E, 2F |

### Layer 3: localization, Jordan splittings, the genus, and the dyadic density data

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

**3B. Jordan splittings exist.** Every nondegenerate `ℤ_p`-lattice is an orthogonal sum
`⊕_i p^i L_i` with each `L_i` unimodular.

**3C. Odd `p`.** A unimodular `ℤ_p`-lattice with `p` odd is diagonalizable. The rank and
the square class of the unit determinant classify such lattices. There are therefore
exactly two of each positive rank, and one of rank 0. The Jordan invariants are unique, and
two lattices are isometric exactly when their Jordan data agree.

**3D. The dyadic case.** Over `ℤ_2` an orthogonal basis need not exist: the hyperbolic
plane `U` is not diagonalizable. Jordan splittings are not unique. The invariants are the
type of each constituent, the norm group, and the weight. The order of work is: the
unimodular classification first, then the general dyadic classification.

**3E. Conway–Sloane 2-adic symbols.** The symbol of a dyadic lattice, with the scale, rank,
sign, type and oddity of each constituent, and with compartments and trains. The theorem is
that two symbols describe isometric lattices exactly when sign walking and oddity fusion
relate them. The canonical form is the corrected one of Allcock–Gal–Mark.

**3F. The genus.** `gen L = gen M` when `L_p ≅ M_p` for every `p` and the real signatures
agree. For nondegenerate integral lattices, a finite test first compares the global rank,
ordinary determinant and real signature. Once these agree, only the primes dividing
`2 det L` need a further local comparison: outside that set BOTH lattices are unimodular,
with the same rank and determinant square class, so 3C makes them isometric. Thus the finite
symbol records the global compatibility data as well as the local isometry classes at those
primes. Without the determinant check the finite test is false: `⟨1⟩` and `⟨17⟩` have the
same signature and are isometric over `ℤ₂`, but fail the local test at `17`.

**3G. Genus symbols and their constraints.** The genus symbol is the family of `p`-adic
symbols for `p ∣ 2·det L`, and it determines the genus. Its well-formedness conditions are
the compatibilities of rank, determinant and oddity, together with the oddity formula and
the sign product conditions. Those two are proved from the Hilbert product formula. The
resulting conditions on symbols are decidable.

**3H. The rational form of a genus.** Two lattices in one genus have equivalent forms over
`ℚ` and over every `ℚ_p`, in the invariants `(rank, d±, s_p, signature)`. Conversely,
rational equivalence together with the integral local data gives membership in one genus.

**3I. Dyadic type, bound and free constituents, and the density exponents.** This is the
lattice-side combinatorics that the dyadic local density is read off. It is pure Jordan
arithmetic over `ℤ_2` and uses no group scheme; the density itself is 7D, which is
`OrthogonalTamagawaAndLatticeMass`'s.

Let `R` be an unramified finite extension of `ℤ_2`, with residue field of cardinality `f`, and
let `L` be a nondegenerate `R`-lattice of rank `n` with a Jordan splitting `L = ⊕_i L_i` as in
3B, where `L_i = 2^i M_i` is the `2^i`-modular constituent, of rank `n_i`, and `M_i = L_i(2^{−i})`
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
    `∑_{i<j} i·n_i·n_j = 0` and `d_1 = 1`, and `N = 2 + 0 + 1 − 1 + 0 = 2`.

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

| Milestone | Direct prerequisites |
| --- | --- |
| 3A | M `LinearMap.BilinForm.baseChange`, `TensorProduct`, `ℤ_[p]`, `ℚ_[p]`; L 0A, 1A, 1B |
| 3B | M `IsOrtho`, `iIsOrtho`; L 3A |
| 3C | M `PadicInt.unitCoeff`; T `squareClass`; L 3B |
| 3D | L 3B |
| 3E | L 3D |
| 3F | L 0E, 3C, 3D |
| 3G | L 3E, 3F; R Class Field Theory `hilbertProductFormula`; R Quadratic Form Invariants `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula` |
| 3H | L 3F; R Quadratic Form Invariants Layers 1, 3 and 6; R Global Quadratic Forms `hasseMinkowski_equivalent`, `equivalent_of_locallyEquivalent` |
| 3I | L 0D, 3B, 3D, 3E |

### Layer B: binary lattices and quadratic orders

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
`NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two` to place it in
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

Cox, *Primes of the form x²+ny²*, Theorem 7.7 and its narrow analogue is the source.

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
milestone proves

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
supplier does not have and which is what a class-number computation runs: for `Δ < 0` the reduced forms satisfy
`|b| ≤ a ≤ c`, and for `Δ > 0` the reduced forms fall into finitely many cycles under the
continued-fraction step. Both give an explicit finite list of classes for each `Δ`, and B2
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

| Milestone | Direct prerequisites |
| --- | --- |
| B1 | M `Matrix.det`, `Zsqrtd`, product rings; L 0A, 0C; for `¬ IsSquare Δ` only, R Global Number Fields `NumberFieldOrder`, `NumberFieldOrder.conductor` |
| B2 | M `Ideal`, `Submodule`; L B1; for `¬ IsSquare Δ` only, R Global Number Fields `NumberFieldOrder.properFractionalIdeals`, `NumberFieldOrder.invertibleProperFractionalIdeals`, `NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two`, `IdealClassMonoid`, `Pic`, `NumberFieldOrder.mkPic`, `NarrowPic`; split classes are local |
| B3 | L 3F, B2; for `¬ IsSquare Δ` only, R Global Number Fields `Pic`, `NarrowPic`; for `Δ < 0`, R Class Field Theory `ringClassField`, `ringClassArtinMap`, `gal_ringClassField_equiv_pic`; no split ring class field, and none is formable |
| B4 | M `Pell.Solution₁`, `Pell.exists_of_not_isSquare`; L 2C, B1, B2, B3 |
| B5 | L B2; for `¬ IsSquare Δ` only, R Global Number Fields `finite_pic`, `finite_narrowPic`; split finiteness is proved directly |
| B6 | M `ℤ_[p]`, `ℚ_[p]`, `LinearMap.BilinForm.baseChange`; L 3A, B4 |
| B7 | M `MeasureTheory.Measure.haar`; L B4, B5, B6; R Restricted Products `RestrictedProductGroup`, `CompactOpenSubgroups`, `integralSubgroup`, `isCompact_integralSubgroup`, `rationalDiagonal` |
| B8 | L 2C, 3F, B2, B3, B4, B5 |

### Layer 4: classes, spinor genera, Eichler's theorem, and neighbors

Orthogonal and Spin Groups owns the quadratic-space groups, the spinor norm and the local
spinor norms. Restricted Products owns the generic restricted-product and rational-diagonal
substrate. This layer owns their specialization to integral lattices.

⚠ **4D and the rank-`≥ 3` half of 4E are not milestones of this roadmap.** They rest on strong
approximation for `Spin`, which neither supplier exports; their exact owner is
`OrthogonalTamagawaAndLatticeMass` (§*Scope*). They are stated below because this layer supplies
their lattice-side inputs and the successor must consume 4A–4C by name rather than rebuild them.

#### Earlier arithmetic constructions and later applications

The following explicit carrier, integral-spinor, approximation and Eichler contracts precede
the later general Nikulin applications. The separate rational-standard proof of 6A does not
require this approximation branch. Each listed construction remains a required target.

#### N0. Actual integral and rational carriers

For a finite free integral symmetric nondegenerate lattice L use its rational scalar extension V, its actual integral injection, completion V_p and full Z_p-lattice L_p. Fix B and Q=B/2 on V for the Clifford/spinor convention; integral parity is B(x,x), and discriminant half-norm is B(x,x)/2 modulo Z only for even L. Transport the determinant and signed-discriminant conventions explicitly. The local orthogonal stabilizers K_p(L), their determinant-one intersections K_p^+(L), and full-preimage Spin references are defined from this SAME family. Prove basis/refinement independence, compact openness, eventual reference equality and rational eventual integrality using IL3/4B and OG2/3. The adelic lattice reconstruction is the intersection of V with the local lattices inside the actual finite restricted product; prove it is finite free/full and recovers every completion, by denominator clearing and weak approximation on finitely many coordinates. No abstract finite discriminant is an integral lattice by declaration.

#### N1. Local integral spinor images, beyond the full-space table

Export for every p the subgroup H_p(L)=theta_p(K_p^+(L)) in `ℚ_pˣ/(ℚ_pˣ)²`, with actual evaluation and isometry/base-change compatibility. OG2F's full-space surjectivity is only the ambient interface: it does NOT compute H_p(L). IL3C/3D/3E Jordan decompositions provide the integral calculation. Construct generators as actual integral isometries (even products of reflections where their formulas preserve L_p), prove their images by the native Clifford reflection/norm comparison, and prove exhaustion by the Jordan reduction of an arbitrary integral isometry. At p=2 retain type-I/type-II blocks, oddity/sign-walking restrictions and actual integral denominators; the odd-prime diagonal argument is not used at 2. Export a finite square-class presentation and a membership decision independent of the chosen Jordan symbol. Prove the almost-all unramified unit-reference statement; it is required to form the adelic image quotient.

The precise 5C consequence is a separate theorem on the FULL class obstruction, not an unspecified local condition and not an unsupported proper-class strengthening. Under each stated odd-prime or dyadic alternative construct H_p(L)=theta(K_p^+(L)) and the determinant-minus-one integral-isometry cosets with their actual spinor-norm translates. Starting from IL4C's proper-spinor quotient J/(Q^* J_L), construct the equivalence relation induced by those determinant cosets and by rational improper isometries, and prove that its orbit set is the FULL spinor-genus obstruction. The identification, well-definedness and independence of chosen improper representatives are owned proof steps. Compute this orbit set under every exact5C local alternative and prove it has one element. Export representatives and the corresponding full-O factorization after the proper-kernel comparison; do not assert that the proper quotient itself is always trivial or infer an improper integral automorphism from notation.

One chosen proof programme computes the finite elementary-2 proper obstruction from the local Jordan presentations, then computes the subgroup/affine translates contributed by determinant changes. Prove the resulting orbit quotient presentation before dualizing it. A nonzero character of the resulting abelian quotient would give a continuous quadratic idele-class character. The separately selected actual CFT12 index-two Kummer/norm-correspondence producer identifies it with a quadratic field and its normalized local norm characters. Check each exact5C Jordan-block alternative against these local characters and the global Hilbert product to exclude a surviving nontrivial character. Retain real signs and both O/SO domains. This is an explicit owned local-block and global-obstruction proof programme; ambient full-space surjectivity and norm-index alone do not supply it. No blanket assertion that every dyadic H_p contains all units is made.

#### N2. Same-S Spin approximation

For the actual algebraic Spin(V) over Q identify the Hopf-algebra/group-scheme and native Clifford point groups, their rational/base-change maps, finite-dimensional module topologies and chosen compact opens. Prove the algebraic group is semisimple simply connected in rank >=3, with its actual almost-simple factor decomposition, and match its local point topology to OG's. For a finite S containing infinity require for EVERY Q-almost-simple factor H that the product of H(Q_v), v in S, is noncompact. Apply the EXISTING AA4.2 strong-approximation construction to get DenseRange(Spin(V)(Q) -> Spin(V)(A^S)). AA4.2's actual earlier floors are AA0/1 topology and reference-controlled restricted products, AA2 quotient integration, AA3.1–3.4 reduction/finite covolume and arithmetic density, AA4.1 weak approximation including its separately constructed torsor/Hasse inputs, and the RG2 local-point/model/Lang/Kneser–Tits contracts. These are construction targets, not an assertion that the pinned libraries implement them.

Keep the actual sufficient proof stages: p-adic closed-subgroup Lie algebra and openness from analytic charts/saturated lattices; S-arithmetic non-discreteness/Zariski density and finite-covolume projection argument; multi-place closure by Lie ideals and pro-p separation (not factorwise-surjectivity implying openness); Kneser–Tits elimination of finite-index closures in isotropic simply connected absolutely almost simple local factors; reductive models, finite-field Lang and weak approximation for anisotropic factors; restriction of scalars and factor products. RG2's isotropic no-finite-index statement is not applied to anisotropic groups, tori, PGL or a compact factor. AA4.1's weak approximation is constructed before strong approximation, avoiding a cycle.

Use OG3F's reference-controlled surjection Spin(A^S) -> ker(theta on the SAME SO(A^S)). Its almost-all integral-lifting hypothesis is discharged for the full-preimage Spin references, not assumed for arbitrary smaller references. Continuity of the projection and density then identify the closure of the projected rational Spin group with that kernel. The finite-adelic case is S={infinity} only when every factor satisfies that noncompactness hypothesis. Definite forms with a larger admissible S retain only the away-S statement; nothing gives them an unconditional finite-adelic density assertion.

#### N3. Eichler and the actual proper-spinor quotient

For an indefinite nondegenerate rational space of rank >=3, verify the noncompactness hypothesis for every Spin factor at infinity; handle ranks3 and4 explicitly (the rank4 factors/restriction-of-scalars forms cannot be silently treated as one absolutely simple group). The previous same-S result with S={infinity} implies that each proper spinor genus contains one proper integral class: given its actual adelic representative, absorb a spinor-kernel factor into a rational Spin approximation modulo the OPEN integral stabilizer, preserving the adelic coset. Write the rational SO element, integral stabilizer and their equality in the double-coset carrier. This is IL4D/Eichler and the separately required OTM0.3 output; it is not the positive-definite mass/certificate lane.

Combine with IL4C's explicit quotient J/(Q^* J_L), its archimedean sign conditions and the rational spinor-norm image of OG1H. Prove that this quotient represents proper spinor genera in rank >=3, then compute it from the N1 local integral images. To pass from proper to full classes, construct the determinant-minus-one coset action and quotient; do not identify O and SO class sets by notation. Rank2 uses the quadratic-order ideal/norm-torus programme, with its factor-two and orientation issues; ranks0/1 use direct lattice classification. None is a semisimple simply connected strong-approximation application.

**4A. Class sets.** The class `cls L`, the proper class `cls⁺ L`, the genus `gen L`, and
the proper genus, with the inclusions `cls ⊆ spn ⊆ gen` once 4C defines the middle term.
The class number `h(L)` is the number of classes in `gen L`, and the proper class number is
its analogue. In rank 0 and rank 1 the class sets are computed directly.

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
`K_p⁺(L) = K_p(L) ∩ SO(V_p)`. Prove that each is compact and open. For all but finitely many
`p` it is the stabilizer of a unimodular `ℤ_p`-lattice, in the form that makes the restricted
product well defined. The products `K_f(L)` and `K_f⁺(L)` are compact open subgroups. The two
correspondences are proved in both directions:

    {classes in gen L}        ≃  O(V)(ℚ) \ O(V)(𝔸_f) / K_f(L),
    {proper classes in gen L} ≃  SO(V)(ℚ) \ SO(V)(𝔸_f) / K_f⁺(L).

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


**4D. Eichler's theorem.** *Owner:* `OrthogonalTamagawaAndLatticeMass`. For an indefinite
nondegenerate lattice of rank at least 3, a proper spinor genus contains exactly one proper
class, so `cls⁺ L = spn⁺ L`. The passage from proper classes to classes needs the analysis of
when `O(L) ≠ SO(L)`, and that is part of the milestone. The input is strong approximation for
`Spin` in the noncompact-place form. Its generic construction is AA4.2 with the actual
local/model and arithmetic prerequisites; OTM0.3 owns this integral class comparison.
The point-group and restricted-product interfaces alone do not provide that theorem.

**4E. Class numbers of indefinite lattices.** *Rank 2 is owned here; rank at least 3 is owned by*
`OrthogonalTamagawaAndLatticeMass`. For rank 2 an indefinite `L` has `Δ > 0`, and the theorem
splits with B1's branch. For nonsquare `Δ`, B2's **oriented** map identifies the proper classes
of primitive forms of discriminant `Δ` with the consumed `NarrowPic 𝒪_Δ`, which is finite
(`finite_narrowPic`, or B5's cycle count); `Pic 𝒪_Δ` would not do, since `x² − 3y²` and
`−x² + 3y²` are two proper classes with the same ideal class (B2). For square `Δ = m²`, B5 counts
the split proper classes directly as `φ(m)`, with no ideal-class carrier. In both branches the
proper classes in `gen L` are finitely many, and the classes are their images under forgetting
the orientation, so they are finitely many too. The rank-2 proof does not use strong approximation,
and the proof for rank at least 3 does not cover rank 2 — so the split is not an accident of the
narrowing. For rank at least 3 the class number is finite and bounded by the count of 4C; that
argument runs through 4D and moves with it.

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
claimed, and no consumer may infer a complete list of classes from neighbor steps.

| Milestone | Direct prerequisites |
| --- | --- |
| 4A | L 2C, 2G, 3F, B2, B5 |
| 4B | L 3A, 3B, 4A; R Restricted Products Layers 1--3; R Orthogonal and Spin Groups Layers 0, 2 and 3 |
| 4C | T `squareClass`; L 3C, 3D, 4B; rank 2 also L B2, B3, B6; R Orthogonal and Spin Groups Layers 1 and 2 |
| 4D | *successor milestone*: L 4B, 4C; strong approximation for `Spin`, from `OrthogonalTamagawaAndLatticeMass` over `AlgebraicGroupStrongApproximation` |
| 4E, rank 2 | L B2, B5 |
| 4E, rank ≥ 3 | *successor milestone*: L 4C, 4D |
| 4F | L 0E, 2C, B4; R Orthogonal and Spin Groups Layer 2 |
| 4G | M `Submodule.basisOfPid`; L 0C, 3F |

### Layer 5: discriminant forms and Nikulin's theory

Citations are to Nikulin, *Integer symmetric bilinear forms and some of their geometric
applications*, where the numbering of the translation agrees with the original. His `E₈` is
negative definite, so each citation carries the twist.

#### N4. Full Nikulin5A–5D, including the boundary cases

5A: determine each local even lattice from its p-primary finite quadratic form and rational invariants using IL3C/3D and the actual local determinant/Hasse dictionary; prove the odd bilinear-form/parity analogue separately. Match the actual local completions with the genus carrier of N0. The two symbol translations in IL3E remain required.

5B: construct K(q_p) on an actual Z_p-free carrier of minimal length, retain its determinant valuation, and prove its unit-part class modulo unit squares is choice independent at odd p and at 2 EXACTLY when the q_theta(2) summand is absent. Keep the two <2>/<10> choices, differing by factor5, in the exceptional dyadic branch. Prove the four independent fields of NikulinExistenceConditions necessary from completions, determinant and Gauss–Milgram. For sufficiency construct local Jordan lattices of rank t_++t_- with the specified discriminant forms, enforcing BOTH equality-case determinant clauses with their different signs/switches; choose the real signature. Convert their invariants to a rational global form with the genuine CFT/QFI/Hasse product/realization producers. Prove finite support and the local Hasse product from the signature/Gauss condition, not from unconstrained arbitrary local forms. The N0 adelic lattice reconstruction produces the integral lattice and its actual discriminant-form isomorphism. This proves the equivalence and its strict-rank corollary without discarding the equality cases.

5C: retain exactly the stated indefinite, rank>=3, odd-prime and dyadic exceptional alternatives. Apply N1's local image consequences and N3's proper-spinor obstruction computation, then the O/SO comparison, to prove one class in the specified genus. The uniform rank-length-gap corollary follows but does not replace the full theorem. This chosen proof requires actual local spinor images and Eichler; native rational Hasse–Minkowski alone is insufficient.

5D: for stabilization show the actual U+T and E8(-1)+T satisfy 5C, carrying T's rank, signature, length and local discriminant form. For splitting first use 5B to construct the complementary lattice at the adjusted signature, checking all four conditions including boundary equalities; then use 5C to identify its sum with the given S. Retain both thresholds length+3 and length+9, the sign twist of Nikulin's E8, and all positive/negative-index hypotheses. Export chosen isometries/projections/inverses, not only cardinality-one class sets.

The full 5E–5J primitive-embedding, discriminant-automorphism and 2-elementary programmes remain required with their own later prerequisites. The 5A–5D construction is not an assertion of those later outputs. Mass, approximation and gauge statements are those of Layer 7 and of `OrthogonalTamagawaAndLatticeMass`, at the scope stated there.

**5A. The genus and the discriminant form.** For even lattices, `gen L` is determined by
`(t₊, t₋, q_L)`, which is Nikulin Corollary 1.9.4. The odd analogue is Corollary 1.16.3: the
genus of any nondegenerate lattice over `ℤ` is determined by its parity together with
`(t₊, t₋, b_L)`, where `b_L` is the discriminant bilinear form of 1D. Both statements are
milestones. So is the translation between the Conway–Sloane symbols of 3E and the invariants
`(t₊, t₋, q)`, in both directions, since the K3 work uses the second and the mass formula
uses the first.

**5B. Existence.** An even lattice with invariants `(t₊, t₋, q)` exists if and only if:

1. `t₊ − t₋ ≡ sign q (mod 8)`;
2. `t₊ ≥ 0`, `t₋ ≥ 0`, and `t₊ + t₋ ≥ l(A_q)`;
3. `(−1)^{t₋} |A_q| ≡ discr K(q_p) (mod (ℤ_p^*)²)` for every odd prime `p` with
   `t₊ + t₋ = l(A_{q_p})`;
4. `|A_q| ≡ ± discr K(q₂) (mod (ℤ_2^*)²)`, whenever `t₊ + t₋ = l(A_{q₂})` and `q₂` has no
   summand `q_θ^{(2)}(2)`.

This is Theorem 1.10.1. Corollary 1.10.2 is the sufficient form: conditions 1 and 2 with
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
square class `discr K(q_p)` all named; a field called `localConditions` is an explicit rejection
test. The theorem is then stated as an `↔`: the predicate holds exactly when an even lattice
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
exception in its hypothesis (`padicDiscriminant_eq_squareClass_gramDet`) and pins `⟨2⟩` against
`⟨10⟩` as a rejection test (`padicDiscriminant_not_determined_by_cyclicTwoSummand`), so that a
version of the helper claiming unconditional independence is refuted by a named declaration.
The ratio in conditions 3 and 4 is a `p`-adic unit because `A_{K(q_p)} ≅ q_p` forces
`v_p(det K(q_p)) = v_p(|A_q|)`, and that observation is what makes the two conditions well
posed.

**5C. Uniqueness.** An even lattice with invariants `(t₊, t₋, q)` is unique in its genus if:

1. `t₊ ≥ 1`, `t₋ ≥ 1`, and `t₊ + t₋ ≥ 3`;
2. for every odd `p`, either `rank ≥ l(A_{q_p}) + 2`, or
   `q_p ≅ q_{θ₁}^{(p)}(p^k) ⊕ q_{θ₂}^{(p)}(p^k) ⊕ q'`;
3. at `p = 2`, either `rank ≥ l(A_{q₂}) + 2`, or `q₂ ≅ u^{(2)}(2^k) ⊕ q'`, or
   `q₂ ≅ v^{(2)}(2^k) ⊕ q'`, or
   `q₂ ≅ q_{θ₁}^{(2)}(2^k) ⊕ q_{θ₂}^{(2)}(2^{k+1}) ⊕ q'`.

This is Theorem 1.13.2. With 5B it gives Corollary 1.13.3: an even lattice with invariants
`(t₊, t₋, q)` exists and is unique when `t₊ − t₋ ≡ sign q (mod 8)`,
`t₊ + t₋ ≥ l(A_q) + 2`, `t₊ ≥ 1` and `t₋ ≥ 1`.

**5D. Stabilization and splitting.** Corollary 1.13.4 has two parts. Let `T` be even with
invariants `(t₊, t₋, q)`. Then `U ⊕ T` is the unique even lattice with invariants
`(t₊+1, t₋+1, q)`. If in addition `t₊ > 0`, then `E₈(−1) ⊕ T` is the unique even lattice
with invariants `(t₊, t₋+8, q)`.

Corollary 1.13.5 also has two parts. Let `S` be an even lattice of signature `(t₊, t₋)`.
Then `S ≅ U ⊕ T` for some `T` when `t₊ ≥ 1`, `t₋ ≥ 1` and `t₊ + t₋ ≥ l(A_S) + 3`. And
`S ≅ E₈(−1) ⊕ T` for some `T` when `t₊ ≥ 1`, `t₋ ≥ 8` and `t₊ + t₋ ≥ l(A_S) + 9`.

**5E. The map from isometries to isometries of the discriminant form.** Theorem 1.14.2
assumes that `T` is an even indefinite lattice with two properties. First,
`rank T ≥ l(A_{T_p}) + 2` for every odd `p`. Second, if `rank T = l(A_{T₂})`, then
`q_{T₂} ≅ u^{(2)}(2) ⊕ q'` or `q_{T₂} ≅ v^{(2)}(2) ⊕ q'`. The conclusion is that the genus
of `T` has one class, and that `O(T) → O(q_T)` is surjective.

Proposition 1.14.1 is proved with it. It reduces the Witt-type statements to three
conditions on the orthogonal complement.

**5F. Primitivity.** An injection of finite free `ℤ`-modules has torsion-free cokernel
exactly when its image is a direct summand. Every statement below quantifies over primitive
embeddings.

**5G. Primitive embeddings into an even unimodular lattice.** Theorem 1.12.2: for an even
lattice `S` with invariants `(t₊, t₋, q)` and integers `l₊`, `l₋`, the following are
equivalent:

1. `S` embeds primitively into some even unimodular lattice of signature `(l₊, l₋)`;
2. an even lattice with invariants `(l₊ − t₊, l₋ − t₋, −q)` exists;
3. all four of: `l₊ − l₋ ≡ 0 (mod 8)`; `l₊ − t₊ ≥ 0`, `l₋ − t₋ ≥ 0` and
   `l₊ + l₋ − t₊ − t₋ ≥ l(A_q)`; `(−1)^{l₊ − t₊} |A_q| ≡ discr K(q_p) (mod (ℤ_p^*)²)` for
   every odd `p` with `l₊ + l₋ − t₊ − t₋ = l(A_{q_p})`; and
   `|A_q| ≡ ± discr K(q₂) (mod (ℤ_2^*)²)` if `l₊ + l₋ − t₊ − t₋ = l(A_{q₂})` and `q₂` has no
   summand `q_θ^{(2)}(2)`.

Corollary 1.12.3 is the sufficient form with `l₊ + l₋ − t₊ − t₋ > l(A_q)`. Theorem 1.12.4 is
the criterion in terms of the signatures alone: for nonnegative integers `t₊, t₋, l₊, l₋`,
every even lattice of signature `(t₊, t₋)` embeds primitively into some even unimodular
lattice of signature `(l₊, l₋)` if and only if `l₊ − l₋ ≡ 0 (mod 8)`, `t₊ ≤ l₊`, `t₋ ≤ l₋`,
and `2(t₊ + t₋) ≤ l₊ + l₋`.

**5H. Uniqueness of a primitive embedding.** Theorem 1.14.4 concerns a primitive embedding
of an even lattice `M` of signature `(t₊, t₋)` into an even unimodular lattice `L` of
signature `(l₊, l₋)`. The embedding is unique up to `O(L)` if:

1. `l₊ − t₊ > 0` and `l₋ − t₋ > 0`;
2. `l₊ + l₋ − t₊ − t₋ ≥ l(A_{M_p}) + 2` for every odd `p`;
3. `q_M ≅ u^{(2)}(2) ⊕ q'` or `q_M ≅ v^{(2)}(2) ⊕ q'`, in the case
   `l₊ + l₋ − t₊ − t₋ = l(A_{M₂})`.

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
version.

**5J. 2-elementary lattices.** `S` is 2-elementary when `A_S ≅ (ℤ/2)^a`. Then `q_S` is an
orthogonal sum of forms `q_θ^{(2)}(2)`, `u^{(2)}(2)` and `v^{(2)}(2)`, and `δ_S` is 0 when
no summand `q_θ^{(2)}(2)` occurs and 1 otherwise. Theorem 3.6.2: the genus of an even
2-elementary lattice is determined by `(δ_S; t₊, t₋, a)`, and when `t₊ > 0` and `t₋ > 0`
these invariants determine the isometry class. Such a lattice exists, for `δ_S ∈ {0,1}` and
`a, t₊, t₋ ≥ 0`, if and only if:

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

Theorem 3.6.3: for indefinite even 2-elementary `S`, the map `O(S) → O(q_S)` is surjective.
Nikulin's paper has no `p`-elementary theorem for odd `p`. For odd `p` the classification
follows from 5C, and the roadmap states it that way.

| Milestone | Direct prerequisites |
| --- | --- |
| 5A | L 1D, 1G, 3E, 3F |
| 5B | L 1G, 1H, 3C, 3D, 5A |
| 5C | L 5A, 5B, 4C integral-stabilizer spinor images and N1 full obstruction; OTM0.3 Eichler with the N2/N3 arithmetic floors |
| 5D | L 0G, 5B complement existence with boundary equalities, 5C uniqueness; N4 actual splitting maps |
| 5E | L 2C, 5C |
| 5F | M `Submodule.basisOfPid`, `IsCompl` |
| 5G | L 1E, 1F, 5B, 5F |
| 5H | L 5E, 5G |
| 5I | L 1F, 5G, 5H |
| 5J | L 1G, 5B, 5C, 5E |

### Layer 6: unimodular lattices in low rank

**6A. Indefinite classification.** Let `L` be indefinite unimodular of signature
`(t₊, t₋)`, and put `k = |t₊ − t₋| / 8`. If `L` is even, then `8 ∣ t₊ − t₋` by 1I, and the
signature determines `L`:

- if `t₊ ≥ t₋`, then `L ≅ U^{t₋} ⊕ E₈^{k}`, with the positive definite `E₈`;
- if `t₋ ≥ t₊`, then `L ≅ U^{t₊} ⊕ E₈(−1)^{k}`.

If `L` is odd, then `L ≅ ⟨1⟩^{t₊} ⊕ ⟨−1⟩^{t₋}`. Both statements are proved milestones; the even
uniqueness, two even unimodular indefinite Gram matrices of equal signature are integrally
equivalent, is `equivalent_of_isEven_unimodular_indefinite`.

**6B. Existence in the definite case.** An even unimodular positive definite lattice of
rank `n` exists exactly when `8 ∣ n`.

**6C. Rank at most 9.** A positive definite unimodular lattice of rank at most 9 is `Iₙ`,
`E₈`, or `E₈ ⊕ I₁`. The proof follows O'Meara: uniqueness of the decomposition into
indecomposable summands, and a count of the characteristic vectors of 1L. It follows that
`E₈` is the unique even unimodular lattice of rank 8. The alternative proof through root systems, in
which the minimal vectors form a root system of type `E₈`, discharges the same milestone.

**6D. Rank 16, the two classes.** `E₈²` and `D₁₆⁺` are even unimodular of rank 16, they lie
in one genus, and they are not isometric, because their root systems differ. This milestone
constructs both lattices and proves those four statements. It claims no completeness: that
the genus has no third class is 7I, which comes after the mass formula and belongs to
`OrthogonalTamagawaAndLatticeMass`. §*Scope* records 6D and 7I as a pair, and only the pair
is the rank-16 classification.

**6E. Rank 24 reference lattices.** The 24 Niemeier lattices are defined by explicit Gram
data or glue data. For each row the milestone proves evenness, unimodularity, rank 24, and
the stated root system. It also proves that the 24 rows are pairwise non-isometric: 23 of
them have pairwise distinct root systems, and the remaining row has no roots, so the root
system separates all 24. The name Leech denotes the row with no roots. This milestone states
no completeness theorem for rank 24, and it proves no characterization of the Leech row
beyond the ones listed here.

**6F. Two models of `E₈`.** The Gram matrix model of 0G and the coordinate model
`{x ∈ ℤ⁸ ∪ (ℤ+½)⁸ : ∑ x ∈ 2ℤ}` are isometric. The proof gives Tau Ceti one `E₈` and one
isometry, rather than two unrelated lattices.

**6G. The order of `O(E₈)`.** Reflections in the 240 roots of `E₈` generate `O(E₈)`, and
`−1` lies in that group, so `O(E₈) = W(E₈)`. The order is computed by orbits and
stabilizers: `W(E₈)` is transitive on the 240 roots with stabilizer `W(E₇)`; `W(E₇)` is
transitive on its 126 roots with stabilizer `W(D₆)`; and `|W(D₆)| = 2⁵·6! = 23040`. Hence

    |O(E₈)| = 240 · 126 · 23040 = 696729600.

This milestone is owned here. The Root Systems roadmap classifies root systems and defines
the Weyl group order abstractly, and it proves no type-specific value.

| Milestone | Direct prerequisites |
| --- | --- |
| 6A odd | L 0F, 3C; actual QFI local/Hilbert-product and GQF Hasse–Minkowski producers; rational-standard/unit-splitting construction below |
| 1L signature | early characteristic-coset construction, followed by the independent odd 6A theorem on `L ⊕ W` |
| 6A even | early 1E/1F and the odd 6A theorem; explicit `W` neighbors and their model maps below; the general 5C/5D route remains separately required |
| 6B | L 1I, 0G |
| 6C | M `CartanMatrix.E₈`; L 0F, 1L, 2G; R Root Systems Layer 5 |
| 6D | L 2C, 3F, 5A, 6B |
| 6E | L 0C, 1C, 2B |
| 6F | L 0G, 2B |
| 6G | M `CartanMatrix.E₈`; L 0G, 2B, 2C; R Root Systems Layer 5 |

**6A/6E construction supplement: parity kernels, neighbors and actual model maps.**

Use the one native IntegralLattice carrier, a full finite free Z-lattice in its rational ambient space, and its native rational isometry notion. Degenerate, nonunimodular or definite forms are not covered by the indefinite classification. All coordinate constructions below are separate API outputs, not obtained by simply invoking the final classification theorem.

For n=4k,k>=1, keep the literal span of adjacent SUMS and the half vector in its own rational span. Its rank is n-1: the adjacent vectors are independent and annihilated by alternating signs, as is the half vector. Build the corrected D_n-plus from D_n={z∈Z^n:sum z even} and h=(1/2,...,1/2). Adjacent sums TOGETHER WITH e1-e2 have determinant absolute2 and generate D_n. The two cosets D_n and h+D_n give covolume1; h·z is integral and h²=k. Therefore the corrected lattice is integral unimodular and its parity is k modulo2. Literal generator norms survive but do not imply full rank/unimodularity of the printed span. Export both carriers and the non-entailment witness. For D8-plus consume 1K's explicit Cartan-Gram isometry, including its actual matrix, inverse integral basis map and determinant; the theorem name without that construction does not identify models. For D16-plus the norm2 vectors generate its proper index2 D16 sublattice, whereas roots generate all of E8⊕E8. This intrinsic root-span-index invariant proves nonisometry without counting roots (both have480).

For any odd unimodular L define L_even=ker(x↦B(x,x) mod2). This is an index2 sublattice of determinant4, different from the all-pairings-even subgroup2L of index2^rank. Choose a characteristic w by the perfect integral pairing modulo2; L_even^dual=L+Z(w/2). Prove the elementary characteristic parity w²≡rank(L) mod2 by splitting the nonsingular symmetric pairing overF2 into norm-one lines and an alternating paired remainder; the characteristic vector is the sum of the norm-one basis vectors and the alternating remainder has even rank. This uses no signature or van der Blij theorem. Thus in odd rank the discriminant group is Z/4 and has one order2 subgroup; in even rank it is F2² and has exactly three such subgroups. These first enumerate module-index2 intermediates, not necessarily integral lattices.

Construct every intermediate as its actual discriminant-subgroup preimage. Bilinear isotropy is necessary and sufficient for integrality and half-norm q-isotropy is necessary and sufficient for evenness; maximal isotropy gives unimodularity by the actual1E/1F dual/preimage maps. For even rank, the two non-L lines have representatives w/2 and w/2+e with e any odd-norm vector of L. Their norm difference B(w,e)+e² is even by characteristic parity. Accordingly both non-L preimages are integral exactly when4 divides w², and are even exactly when8 divides w². These are EARLY characteristic-square tests, independent of signature. A1+A1 distinguishes integral from even gluing; W's explicit w=(1,1) has square0 and gives both displayed U neighbors directly. The signature reformulation is a separate output after the actual odd classification and the characteristic-signature construction below; it is never inferred from characteristic-coset existence or choice-invariance alone.

Compute W=<1>⊕<-1> explicitly. L_even consists of the same-parity pairs, with basis (1,1),(1,-1), Gram [[0,2],[2,0]]. Its dual has half-integral coordinates constrained by x+y,x-y integral. Adjoining (1/2,1/2), respectively (-1/2,1/2), gives the two even unimodular neighbors. Bases ((1/2,1/2),(1,-1)) and ((-1/2,1/2),(-1,-1)) each have Gram [[0,1],[1,0]], so give actual U isometries. Keep signed vectors/order in the basis maps. For even unimodular Y, (Y⊕W)_even=Y⊕W_even and its dual is Y⊕W_even^dual; these equalities require Y self-dual, not merely even. Apply the preceding explicit neighbor maps with id_Y. Thus Y⊕U is an even neighbor of Y⊕W. If the latter is identified with a standard odd I_(r,s), a sign change of one coordinate fixes its even kernel and exchanges the two even-neighbor classes when r-s is divisible by8. Retain the actual induced glue maps instead of assuming cancellation of integral summands. The rest of the argument is the construction below, a target of this roadmap.

Make 6A's ODD proof floor explicit by the following rational-standard-form and unit-splitting proof. The even 5C/5D uniqueness theorem is not itself an odd classification proof. Use q=B.toQuadraticMap, q(x)=B(x,x), with polar2B and associated form B over Q; its PLAIN discriminant is[det B], not the signed determinant and not a half-norm. Integral unimodularity gives det B=(-1)^s for signature(r,s). At every odd prime IL3C diagonalizes the integral pairing in units, so all pairwise Hilbert symbols and hence the classical Hasse sign are1. The standard I_(r,s) has the same rank/determinant and these same odd-prime signs. At infinity both have the actual real sign(-1)^(s(s-1)/2). The finite-support global Hilbert product formula fixes their common dyadic Hasse sign. Apply QFI6D local rational classification and GQF6.3 Hasse-Minkowski to obtain an ACTUAL rational form isometry to I_(r,s), not an integral parity comparison at2. For r,s>0 pull back e_positive+e_negative, clear denominators and divide coordinate gcd to get a primitive integral isotropic v.

Perfect integral pairing and Bezout give w with B(v,w)=1. The plane(v,w), Gram[[0,1],[1,a]], has determinant-1 and splits integrally. If a is even, its orthogonal complement is odd; add an odd vector of that complement to w. Thus obtain w' of odd norm a', still pairing1 with v. For epsilon=+/-1 let u=w'+((epsilon-a')/2)v. Then u^2=epsilon and B(u,v)=1. The explicit y=v-epsilon*u lies in uperp and has y^2=-epsilon, so the unimodular complement of Zu is still ODD. At rank>2 choose epsilon with the corresponding signature index>=2, preserving indefiniteness. Induct on rank; in signature(1,1), the original isotropic plane is already the full lattice, and u,y give an actual <1>+<-1> basis. Export every projection, basis map and isometry so the normal-form proof is not merely equality of signatures. Neither Spin strong approximation nor a positive-definite mass is a premise of this chosen proof. Its genuine lower contracts are IL3C, QFI6D/7C, GQF0-6 and the exact CFT norm/product producers used there, all with their existing proof programmes and native carriers.

**Characteristic signature and the general signature-neighbor corollary, after the odd theorem.** For ANY finite free integral unimodular L, of either parity and any real signature(r,s), and ANY characteristic w, form J=L⊕W with W=<1>⊕<-1>. It is odd, unimodular and indefinite of signature(r+1,s+1). The vector(w,1,1) is characteristic and has squarew². Apply the preceding ODD theorem, not the even classification, to obtain its actual integral isometry to I_(r+1,s+1). Characteristic vectors there have all coordinates odd; every odd square is1 modulo8, hence w²≡r−s modulo8. This proves the1L characteristic-signature output by a definite acyclic route, including definite L and rank0, without invoking full Gauss–Milgram or even classification. Keep the actual orthogonal-sum/isometry and characteristic transport maps.

Only AFTER this output convert the early non-L-line tests4|w² and8|w² to signature conditions. For odd unimodular L of even rank, signature divisible8 makes both non-L preimages even unimodular; signature2 modulo4 makes them nonintegral; signature4 modulo8 makes them integral odd unimodular. Preserve the source distinction between module intermediates and integral/even lattices, every actual preimage embedding, and all general Nikulin/Milgram targets. Neither this corollary nor the global arithmetic floor is a premise of W's directly calculated neighbors or the elementary parity-kernel/discriminant construction.

Retain the alternative arithmetic programme as a separate later context: IntegralLattices4C constructs the integral proper-stabilizer unit spinor images, including every dyadic oddity branch, consuming the actual OG reflection/Spin maps; OTM0.3 consumes AA4.2 with same-S reference control and every almost-simple factor noncompact to prove Eichler's comparison. This alternative remains an owned target and is not inferred from OG's all-point-group spinor image or almost-everywhere reference theorem. It is not a prerequisite of the preceding rational-standard/unit induction, nor does any positive mass prove indefinite classification. Both real signature indices are positive in that theorem.

For EVEN 6A complete the source neighbor proof using the preceding rational-standard and independent odd theorem. A primitive isotropic v has a perfect-pairing partner w; since a=w^2 is even, replace w by w-(a/2)v to get an actual U plane. Split L=Y+U integrally. Then J=Y+W is odd indefinite unimodular with the SAME signature(r,s), so obtain its actual integral isometry to I_(r,s) by the odd theorem. The vector(0_Y,1,1) is characteristic and norm0 in J. Its standard-model image has every coordinate odd, so its norm is r-s modulo8, proving8 divides r-s directly. This is not an invocation of the even classification or Gauss-Milgram.

J_even=Y+W_even and its dual is Y+W_even^dual because Y is even and self-dual. The explicit W0 neighbors give L as one EVEN unimodular index2 overlattice different from J. In standard I, the four discriminant cosets of I_even are0,e,w/2,w/2+e for w=(1,...,1). Both non-I subgroup lines have half-norm(r-s)/8 modulo1, hence are quadratic-isotropic. A sign flip of one coordinate preserves I_even and exchanges those two lines, so their actual preimage lattices are isometric. Transporting the displayed neighbor embeddings proves uniqueness of the even indefinite class at each signature. Compare to the constructed U^min(r,s)+(positive or negative E8)^(abs(r-s)/8), using the explicit native Cartan/D8 map, to obtain the normal form with actual isometries and all zero-power/binary cases. No cancellation of arbitrary integral summands is used. The full proof gives every map and also extends the even-unimodular signature-divisibility corollary to definite lattices by stabilizing with U. General Nikulin existence/uniqueness/splitting and the full finite-discriminant Milgram/characteristic congruence programmes remain separate owned targets; none is erased or silently claimed proved.

For the corrected Lorentzian source construction take v=(3,5,...,47,51;145) in I_(24,1). The printed3,...,49 instead requires the nonsquare20825 and is retained as a literal defect. Projection u↦u+B(u,v)v proves the integral orthogonal splitting because v²=-1. Its complement is positive, even, rank24 and unimodular by Cauchy, odd characteristic coordinates and determinant splitting. Export the exact v, kernel basis obtained by integer Smith reduction, projection, rank/signature/dual and parity maps. Implement the finite rootlessness certificate with B_y=2N²-Ny², N=21024, |y|<=205 and residuals d_i=Nx_i-145ya_i. A checker exhausts the exact integer residual boxes and the two original norm/dot equations; finite node counts alone are not certificates. Prove the checker sound from exact integer arithmetic and certify its exhaustive output; a computation without that soundness proof is not the theorem.

Construct the rootless reference row in 6E as the corrected Lorentz kernel with the following explicit Gram data. Write ell=(3,5,...,47,51,-145) on Z25, u=2e1-e2 and b=5e1-3e2. Then ell(u)=1 and ell(b)=0. For j=3,...,25 let c_j=ell(e_j), k_j=e_j-c_j*u. The25 columns[u,b,k3,...,k25] have determinant-1, so K=(b,k3,...,k25) is an ACTUAL integer basis of ker ell. Its Gram has G00=34, G0j=Gj0=-13*c_j and Gij=s_i*deltaij+5*c_i*c_j for i,j>0, with22 spatial signs+1 and the last sign-1. Construct the ONE reference row by native IntegralLattice.ofGramMatrix on the canonical rational Fin24 basis. Construct the native target lattice on the24-dimensional rational kernel (not full Q25) from K and the restricted Lorentz form. The basis map preserves the form on every basis pair and maps the integral carriers ONTO each other; it is an actual IntegralLattice.Isometry. Carry this matrix, its inverse coordinates, and the rational/integral subtype maps. Prove the displayed basis identity and every Gram entry, together with the inverse maps on the integral carriers.

This choice preserves ALL23 other IL6E rows and makes no rootless characterization theorem. Retain comparison with conventional Golay/glue and other standard Leech presentations as an explicit later owned model-map target. The complete OrthogonalTamagawaAndLatticeMass4.2 programme remains required: all24 actual Gram/glue rows and full automorphism certificates, exact normalized mass sum and positivity of each omitted class. Only that exhaustion, or a direct conventional-model matrix proof, can establish the later conventional-model/uniqueness conclusions. The entire arbitrary-genus mass/gauge/dyadic producer programme stays at its actual owner, separate from this elementary kernel-model map and from odd indefinite diagonalization. Rootlessness alone never supplies uniqueness or completeness. A vector with spatial coordinates `3, 5, …, 49` is not the target; the corrected vector above is.

### Layer 7: masses, local densities, and the archimedean factor

Every statement in this layer is about positive definite genera, and the Conway–Sloane mass
formula paper is the source for the normalization.

⚠ **The mass formula itself is not a milestone of this roadmap.** Assembling the local factors
into `m(f)` runs through the adelic volume of `SO(V)`, which needs a Tamagawa normalization and
the volume theorem; Restricted Products exports neither, and Orthogonal and Spin Groups states explicitly that only
`OrthogonalTamagawaAndLatticeMass` may export the orthogonal volume theorem. Milestones **7B,
7D, 7F, 7H and 7I are therefore that successor's**, and are stated here only as the boundary it
must meet. What this roadmap owns is everything the successor consumes from the lattice side:
the two masses and their comparison (7A), the local density with its stabilization and its
odd-`p` values (7C), the archimedean factor (7E), and the low-rank values (7G), together with
the dyadic Jordan data and density exponents of 3I. Those are lattice arithmetic and use no
adelic volume and no group scheme.

⚠ 7D is the successor's for a different reason from 7B, 7F, 7H and 7I. Those need a Tamagawa
measure; 7D needs a smooth affine group scheme over `ℤ₂` — its smoothening, its special fibre,
the unipotent radical of that fibre and the point count of the reductive quotient. OTM
owns the orthogonal specialization over the actual general local/model constructions. The
lattice Jordan data do not replace that smooth-model proof or its gauge comparison.

⚠ Do not conflate the two orthogonal inputs the successor needs. Strong approximation is an
finite-adelic theorem used for indefinite Spin at the infinite place; its general away-S
version retains its factorwise noncompactness hypotheses. The numerical volume theorem is
what positive-definite mass uses; neither input is inferred from the other.

**7A. Proper mass and full mass.** The two sums are defined, and both are finite by 2C and
2G. For `rank L ≥ 1` the relation between them is proved, and not assumed. A class either
stays one proper class, in which case `|O(M)| = 2|SO(M)|`, or splits into two proper classes,
in which case `O(M) = SO(M)`. In both cases `m⁺ = 2m`. In rank 0 the relation fails, and 7G
gives the values there.

There is no product formula for the mass of a direct sum, and that non-statement is
recorded. The mass of a twist `L(a)` is stated for `a > 0` only.

**7B. The adelic decomposition.** *Owner:* `OrthogonalTamagawaAndLatticeMass`. The inputs are
`TamagawaMeasures`' quotient and Tamagawa-measure substrate, that successor's own orthogonal
volume theorem, and the dictionary of 4B, which is ours. The quotient
`SO(V)(ℚ) \ SO(V)(𝔸)` is decomposed into measurable pieces, indexed by the proper classes.
The piece of the class of `M` has volume

    vol(K_∞) / |SO(M)| · ∏_p vol(K_p⁺(M)).

Every quotient and stabilizer in that formula is named.

**7C. The local density: definition, stabilization, and the values at odd primes.** The
definition and the stabilization theorem below are for every prime, `p = 2` included; the
closed evaluation is proved here at odd `p`, and at `p = 2` it is the successor's 7D. Let `L`
be a nondegenerate `ℤ_p`-lattice of rank `n`
with Gram matrix `A` in a basis. The local automorphism density is

    α_p(L) = lim_{r→∞} p^{−r·n(n−1)/2} · #{X ∈ Mₙ(ℤ/p^r) : Xᵀ A X ≡ A (mod p^r)}.

This milestone asks for:

- stabilization: the counting function equals `p^{r·n(n−1)/2}·α_p(L)` for every `r ≥ r₀`,
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
  above; Gan–Yu's and Cho's `β_{L_p} = α_p(L)/2` is the same normalization, as 7D records. The
  global analytic comparisons use distinct rank-specific producers. The displayed local
  factors are constructed here before any global convergence claim. For `n≥3`, the
  successor's actual global normalization producer proves the absolutely convergent
  factor identities and their gauge compatibility. For nonsplit `n=2`, the separate
  OTM1.4 binary analytic producer consumes the native nontrivial Dirichlet continuation/
  nonvanishing on the entire closed half-plane and TauberianBoundaryConvergence N2/N3's bounded ordinary-endpoint
  theorem. It proves ordered increasing-prime convergence, finite conductor deletions
  and the quadratic Dedekind/order/narrow-genus dictionary. AA split-measure compatibility
  alone does not supply this binary endpoint. The rank0/1 branches are elementary.
  These actual producers establish the following distinct regimes without substituting
  the divergent raw product:
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

**7D. The local density at 2, from Cho's smooth model.** *Owner:*
`OrthogonalTamagawaAndLatticeMass`. The closed evaluation of `α_2(L)` is read off a smooth
affine group scheme over `ℤ_2`, so it needs smoothening, special fibres, unipotent radicals and
reductive quotients of integral group schemes, together with point counts of each. That is a
programme in the algebraic-group theory the successors own, and not a lattice calculation. The
theorem is Cho, Theorem 5.2, and the successor must state it in the generality Cho proves and
in his normalization, because the exponent below is generally nonzero and dropping it changes
the answer by a power of 2. It is set out here as the boundary the successor must meet, and
because the lattice-side inputs are milestones of this roadmap.

Let `R` be an unramified finite extension of `ℤ_2`, with fraction field `F` and residue
field `κ` of cardinality `f`. Let
`(L, q)` be a quadratic `R`-lattice of rank `n` with `⟨x, y⟩ = ½(q(x+y) − q(x) − q(y))`
integral and `V = L ⊗_R F` nondegenerate; in this roadmap's vocabulary `⟨·,·⟩` is `β` and
`q` is the norm form `N_L`, since `⟨x, x⟩ = q(x)`. Take the Jordan splitting, the type and
bound/free classification, and the exponents `N_M`, `N_Q` and `N` from 3I, which is ours. Let
`𝒢_L` be the smooth affine group scheme
over `R` with generic fiber `O(V, q)` and `𝒢_L(R) = O(L)`, let `𝒢̃_L` be its special fiber
and `U_L` the unipotent radical of `𝒢̃_L`. Then Cho's local density of `(L, q)`, which he
writes `β_L` and which is not the bilinear form `β` of Layer 0, is

    β_L = [O(V, q) : SO(V, q)]⁻¹ · f^N · f^{−dim O(V,q)} · #𝒢̃_L(κ),      dim O(V,q) = n(n−1)/2,

and `#𝒢̃_L(κ) = #U_L(κ)·#(𝒢̃_L/U_L)(κ)` with `#U_L(κ) = f^{dim U_L}`, the reductive quotient
`𝒢̃_L/U_L` being `∏_i O(V̄_i, q̄_i)_red` times an elementary abelian 2-group whose rank is
the `α + β` of Cho's Lemma 4.2, by his Theorem 4.12.

The successor's milestone is:

- the construction of `𝒢_L` from the Jordan data of 3D and 3I, with the convention in rank 0;
- the proof that `𝒢_L` is smooth of relative dimension `n(n−1)/2`;
- the special fibre, its unipotent radical, the reductive quotient, and the point count of
  each;
- the displayed formula, over a general unramified `R`, with `R = ℤ_2` and `f = 2`
  specialized only afterwards, using 3I's exponents unchanged;
- the factor `[O(V, q) : SO(V, q)]⁻¹`: the index is 2 for `n ≥ 1` in characteristic zero,
  so the factor is `½`, and it is the reason `β_L` is a density for `SO` and not for `O`;
- the comparison with the limit definition of 7C, which is where `α_2` is fixed. That limit
  and its stabilization are ours, so what the successor proves is an evaluation of a number
  this roadmap has already constructed, not a second definition of it. The odd-prime case
  pins the expected constant: Gan–Yu give
  `β_{L_p} = ½·p^{−n(n−1)/2}·#O(L_p ⊗ 𝔽_p)`, which is half the `α_p` of 7C, so the target
  is `α_2(L) = 2·β_L = 2^{N − n(n−1)/2}·#𝒢̃_L(𝔽_2)`, and it is proved rather than assumed;
- the proof that the resulting factor is the Conway–Sloane dyadic factor, oddity and type
  included.

The Conway–Sloane dyadic tables are data, and not a proof.

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
Cartan/KAN, or a later homotopy LES as a premise. Retain the existing L2D
lattice covolume-squared determinant theorem separately; it is not a proof
of sphere area or this quotient-volume identity.

**7F. The volume theorem.** *Owner:* `OrthogonalTamagawaAndLatticeMass`.
`vol(SO(V)(ℚ) \ SO(V)(𝔸)) = 2`, with its dimension hypotheses and normalization, and with the
low-dimensional exceptions recorded. ⚠ This roadmap's low-rank branch 7G states the rank `0`,
`1` and `2` mass values directly and does not derive them from this theorem, so the two
documents must agree on the exceptions rather than one deducing them from the other.

**7G. Low rank.** Three cases are proved directly, and none of them is a specialization of
the general derivation:

- rank 0: `O(L) = SO(L) = 1` and the genus has one class, so `m⁺ = m = 1`;
- rank 1: the genus of `⟨a⟩` with `a > 0` has one class, with `O(L) = {±1}` and `SO(L) = 1`,
  so `m = 1/2` and `m⁺ = 1`;
- rank 2: B8 gives `m⁺(gen L) = h⁺(gen L)/#𝒪(L)ˣ` and `m(gen L) = h⁺(gen L)/(2·#𝒪(L)ˣ)`,
  through the norm-one torus of B6 and its measures in B7. Both formulas use the **proper** class count `h⁺` in the numerator; the full class number `h(gen L)` is not what divides here, because
  `|O(M)|` is not constant on the genus.

The derivation of 7B to 7F is stated for rank at least 3, and 7H packages all ranks with
explicit branches. 7G is proved here, without any of them.

**7H. The Conway–Sloane formula and its checks.** *Owner:*
`OrthogonalTamagawaAndLatticeMass`. The formula

    m(f) = 2 π^{−n(n+1)/4} ∏_{j=1}^{n} Γ(j/2) ∏_p 2 m_p(f)

with the dimension guard, together with the dictionary to Siegel's local density notation
`α_p`. Then the checks:

- the rank-8 even unimodular genus has mass `1/696729600`, class number 1, and
  `|O(E₈)| = |W(E₈)| = 696729600`;
- the genus of `A₂` has class number 1;
- in rank 16, `1/|O(E₈²)| + 1/|O(D₁₆⁺)| = m₁₆`, where `m₁₆` is the mass of the genus of 6D.

The third check is the input to 7I.

**7I. The rank-16 genus has two classes.** *Owner:* `OrthogonalTamagawaAndLatticeMass`; the two
automorphism orders it needs are computed here, in 6D and 6G. Both automorphism orders are
computed first. `E₈²`
has two indecomposable summands, both isometric to `E₈`, so `|O(E₈²)| = 2·|O(E₈)|²`, with
`|O(E₈)|` from 6G. The order `|O(D₁₆⁺)|` is computed from its root system `D₁₆` together
with the stabilizer of the glue vector. With `m₁₆` from 7H, the
equality `1/|O(E₈²)| + 1/|O(D₁₆⁺)| = m₁₆` and the finiteness of the class set prove that
`E₈²` and `D₁₆⁺` exhaust the genus. This is the completeness theorem that 6D does not claim.

| Milestone | Direct prerequisites |
| --- | --- |
| 7A | L 2C, 2G, 4A |
| 7B | *successor milestone*: L 4B, 7A; AA quotient-integration/measure substrate and chosen gauge; numerical volume 7F is used later in 7H, not to construct this decomposition |
| 7C | L 3B, 3C, 4B |
| 7D | *successor milestone*: L 3D, 3E, 3I, 7C; smoothening, special fibres, unipotent radicals and reductive quotients of affine group schemes over `ℤ_p`, from `OrthogonalTamagawaAndLatticeMass` over the successors Restricted Products names |
| 7E | native ball/radial measure, Gamma, smooth metric and density APIs; early LG finite-dimensional matrix Lie groups; DG12.1/12.4; the explicit polar Gram-Jacobian/Fubini and SO submersion/disintegration construction below; L2D is a separate covolume theorem |
| 7F | *successor milestone*: AA measure and numerical-volume contracts, and OTM's own gauge/model compatibility; preserve all rank guards |
| 7G | L 2C, 4A, 7A, B6, B7, B8 |
| 7H | *successor milestone*: L 2C, 3I, 6C, 6D, 6G, 7C, 7E, 7G; successor 7B, 7D, 7F |
| 7I | *successor milestone*: L 2G, 6D, 6G; successor 7H |

### Layer 8: what this roadmap supplies to Theta Series

Layer 8 is a **contract, not a milestone list**, and it runs in one direction. The theta series
of a positive definite lattice is [Theta Series](../ThetaSeries/README.md)'s, and this roadmap
states none: no milestone here defines `Θ_L`, `θ_γ`, a `q`-expansion, a transformation law or a
modularity statement, none draws a conclusion from one, and none may be added. Theta Series
imports `TauCetiRoadmap.IntegralLattices.Suggested`, so this roadmap imports nothing from it
and `Suggested.lean` names none of its declarations; a Lean import in this direction would
close a cycle. §*Scope*, §*Theta series* records the same boundary, and that roadmap's own
scope section records it from its side.

**8S. What this roadmap supplies to Theta Series.** The traffic is the arithmetic of the
rational lattice. Theta Series' bridge — its `ratModel`, which builds an
`IntegralLattice (ℚ ⊗[ℤ] L)` out of its real carrier — reads the following, and each row names
the declarations that carry it, Tau Ceti's native ones or those of `Suggested.lean`:

| Milestone | Supplied | Declarations here |
| --- | --- | --- |
| 0A | the carrier `IntegralLattice` and its predicates | `IntegralLattice`, `IntegralLattice.IsEven`, `IntegralLattice.IsNondegenerate`, `IntegralLattice.IsUnimodular`, `IntegralLattice.IsPosDef` |
| 1B, 1C | the dual `L^⋆` and the discriminant group `A_L`, with `|A_L| = |det L|` | `IntegralLattice.dual`, `dual_dual`, `DiscriminantGroup`, `discriminantGroup_finite`, `natCard_discriminantGroup_eq_natAbs_gramDet`, `unimodular_iff_natCard_discriminantGroup_eq_one` |
| 1D | the discriminant forms `b_L` and `q_L` in the half-norm convention, and the character `e^{2πi·}` of `ℚ/ℤ` | `discriminantPairing`, `discriminantQuadraticForm`, `discriminantQuadraticForm_mk`, `discriminantBilinearModule`, `discriminantQuadraticModule`; Tau Ceti's `TauCeti.expCircle` |
| 1G | finite bilinear and quadratic modules with orthogonal sums, primary decomposition, isotropic and Lagrangian subgroups, `l(A)` and the generator classification | `FiniteBilinearModule`, `FiniteQuadraticModule`, their `IsIsotropic` and `IsLagrangian`, `minGenerators`, `FiniteQuadraticModule.primaryComponent`, `FiniteQuadraticModule.NikulinDecomposition`, and Tau Ceti's orthogonal sum `FiniteQuadraticModule.prod` |
| 1H, 1I | the Gauss-sum invariant `sign q ∈ ℤ/8`, and Milgram's theorem at every signature | Tau Ceti's `TauCeti.FiniteQuadraticModule.gaussSign`, `TauCeti.FiniteQuadraticModule.IsNondegenerate.gaussSum_eq`, `TauCeti.FiniteQuadraticModule.gaussSign_prod`; `milgram` (1I) |
| 1E, 1F | the integral and even overlattice correspondences and the gluing theorem, through which `D₁₆⁺` is built | `integralOverlatticeEquivIsotropicSubgroup`, `evenOverlatticeEquivIsotropicSubgroup`, `ofIsotropicSubgroup`, `ofIsotropicSubgroup_isEven`, `FiniteQuadraticModule.orthogonalQuotient` |
| 1J, 1K | the level, and the ADE lattices with their discriminant forms and the `D₈⁺ ≅ E₈` calculation | milestone 1J; native `typeARootLattice`, `checkerboardLattice`, `typeE₈RootLattice`, `d8PlusLattice`, `e8IsometryD8Plus`, and the remaining ADE calculations of 1K |
| 2B, 2D | the shells `S_k(L)` and representation numbers `r_L(k)` as finite counts, and the covolume identity `covolume(L)² = det L` | milestone 2B; the Layer-2 covolume identity |
| 6D, 6E | the rank-16 pair `E₈²` and `D₁₆⁺` — even unimodular, in one genus, non-isometric — and the rank-24 reference lattices with their root systems | milestones 6D and 6E |

Theta Series transports these across **its own** Layer-2 bridge from its real carrier
(`Submodule ℤ E` with `IsZLattice ℝ`) to this roadmap's rational one, and adds no competing
definition of any of them. That bridge lives there, not here: this roadmap defines no
real-model carrier, no second dual-lattice notion, and no comparison lemma between the two
models. Its `D₁₆⁺` application is stated against 6D; its rank-24 identities are stated in
lattice-free form — rank, evenness, unimodularity and rootlessness — so 6E is available to it
on the same terms as 6D and is consumed by none of its current milestones.

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
holds for shells: 2B's `S_k(L)` and `r_L(k)` are counts in the rational carrier, and Theta
Series' shells are the same sets read in `E`.

⚠ **Positive definiteness is a boundary of the same kind on both sides.** Theta Series is
positive definite by construction — the form is the inner product of its ambient space, so
definiteness is structural and not a hypothesis it could drop — and this roadmap states no
theta series at all. The Siegel–Narain theta of an indefinite lattice, summed against a
maximal positive definite subspace `v ⊆ L ⊗ ℝ`, with convergence, the discriminant-coset
refinement, the `S` and `T` laws and `O(L)`-equivariance in `v`, is therefore reached from
neither roadmap by weakening a hypothesis. It is `IndefiniteThetaAndSiegelWeil`'s
(§*Scope*), together with theta lifts, the indefinite Siegel–Weil theorem and the genus
averages it evaluates; that successor consumes Layer 1 here and Theta Series' definite theory,
and neither roadmap consumes it.

| Milestone | Direct prerequisites |
| --- | --- |
| 8S | L 0A, 1B to 1K, 2B, 2D, 6D, 6E — supplied to Theta Series, consumed by no milestone here |

### Layer 9: what the LMFDB lattice columns assert

**9A. The stored columns.** A record of the LMFDB lattice section is a Gram matrix `G`, a
label `dim.det.level.class_number.index`, a list of Gram matrices called the genus
representatives, and the numerical columns. This milestone defines
`StoredGenusCertificate`, whose fields are the statements the record asserts about the stored
matrices themselves:

- `G` is integral, symmetric and positive definite, so 0A to 0E apply to the lattice `L` it
  defines;
- the dimension is the rank of 0A, the determinant is that of 0C, and the level is that of
  0D;
- the minimum and the kissing number are those of 2B, the automorphism group order is that
  of 2C, and the stored `theta_series` column is the sequence of representation numbers
  `r_L(k) = #S_k(L)` of 2B, asserted as shell **counts**;
- every listed Gram matrix defines a lattice in `gen L`, by 3F;
- the listed lattices are pairwise non-isometric, which is a decidable check for positive
  definite lattices by 2G.

Every one of these is a **semantic** assertion: it says what a stored column means, and each is
proved for a given record by a finite computation with the milestones named beside it. The fifth
label component has no mathematical content in this roadmap.

`StoredGenusCertificate` has no completeness or `class_number` field. Pairwise distinct
representatives in one genus do not establish exhaustion. The additional completeness
certificate must name an actual proof: finiteness alone is insufficient.

**9B. Completeness certificates.** `StoredClassNumberCertificate` extends the semantic record
with the mass data that prove exhaustion, and identifies the class number with the representative-list length.
A direct exhaustion proof also gives such data by forming its finite reciprocal-order sum.
There are three ways to supply that proof:

- an exact mass, together with equality between it and the sum of reciprocal automorphism
  orders of the distinct listed representatives;
- a neighbour-connectivity theorem in its stated regime, with a proved exhaustive search and
  no omitted vertices; 4G's edge relation alone is not connectivity;
- a direct classification or a certified bounded enumeration, with an explicit theorem that
  every genus class appears. Internal examples include 6C, the binary class calculation and
  the low-rank cases of 7G. A finite list or termination alone is not this theorem.

For the mass route, retain `mass`, `mass_isGenusMass` and `reps_exhaust_mass` as actual
hypothesis fields. Positivity of `1/|O(M)|` and isometry invariance then prove exhaustion:
a missing class would make the sum strictly smaller. The successor's 7H supplies a general
mass value; the direct low-rank values here can also discharge that route. Connectivity and
direct-enumeration adapters instead supply their own exhaustion proof. These adapters do not
weaken the semantic/completeness distinction or accept a `class_number` column by declaration.

`Suggested.lean` carries both structures, because every condition in them is expressible at the
current Mathlib: isometry is integral congruence of Gram matrices, and genus membership is
congruence over every `ℤ_p` together with the real signature, which is 3F written out. Nothing
in either certificate waits for the genus symbols of 3E.

| Milestone | Direct prerequisites |
| --- | --- |
| 9A | L 0A, 0C, 0D, 0E, 2B, 2C, 2G, 3F |
| 9B | L 2C, 2G, 4A, 9A and an actual exhaustion proof; mass route additionally 7A and an exact value (successor 7H or direct low-rank calculation); connectivity or direct classification/enumeration routes retain their own hypotheses |

---

## Basic API for each new object

A definition without lemmas is not a contribution. For each object below the roadmap asks
for the eight items listed. The layer that introduces the object owns them.

### The lattice form (0A)

- **Constructors.** From a symmetric bilinear form; from a Gram matrix over `ℤ`; from a
  quadratic form, when the lattice is even; by restriction to a full submodule in the same
  ambient space; from an arbitrary finite-free submodule in its rational span
  `ℚ ⊗[ℤ] M`.
- **Examples.** `⟨a⟩`, `Iₙ`, `U`, the root lattices, `Λ_{K3}` (0G).
- **Morphisms.** Isometries, isometric embeddings, and primitive embeddings (5F).
- **Functoriality.** Direct sums, twists, full sublattices of finite index, and orthogonal
  complements; arbitrary finite-free submodules are compared in their rational spans.
- **Comparison lemmas.** The Gram matrix in a basis; the real form; the rational form; the
  `ℤ_p`-form.
- **Naturality.** An isometry induces equality of determinant, signature, level, scale and
  norm ideal.
- **Edge cases.** Rank 0; degenerate forms; the zero form.
- **Downstream.** Every later layer.

### The dual lattice (1B)

- **Constructors.** `B.dualSubmodule L` in `V = ℚ ⊗ L`; the dual basis of a basis.
- **Examples.** `L^⋆ = L` for unimodular `L`; `(Aₙ)^⋆/Aₙ ≅ ℤ/(n+1)`.
- **Morphisms.** An isometry of `L` induces an isometry of `L^⋆`.
- **Functoriality.** `(L ⊕ M)^⋆ = L^⋆ ⊕ M^⋆`;
  `dual_{aB}(L) = (a : ℚ)⁻¹ • dual_B(L)` for nonzero integral `a`, with scalar
  dilation on the right; inclusion reversal.
- **Comparison lemmas.** The Gram matrix of the dual basis is `G⁻¹`;
  `det L^⋆ = (det L)⁻¹`. That the dual of the real model is the image of this submodule is
  Theta Series' bridge theorem, and lives there.
- **Naturality.** Biduality `L^{⋆⋆} = L`, and its compatibility with sums and twists.
- **Edge cases.** Degenerate `β`, where the dual is not a lattice; rank 0.
- **Downstream.** 1C, 1D, 5G; and Theta Series, through 8S.

### The discriminant group and its forms (1C, 1D)

- **Constructors.** `A_L = L^⋆/L`; `b_L` from `B`; `q_L` from `B` when `L` is even.
- **Examples.** `A_{E₈} = 0`; `A_{A₂} ≅ ℤ/3` with half-norm `q = 1/3`; `A_U = 0`.
- **Morphisms.** `O(L) → O(q_L)`, whose surjectivity is 5E.
- **Functoriality.** Sums and the sign twist `L(−1)`, as canonical isometries and not
  equalities (1D); nonunit twists instead use the induced inclusion/quotient comparison.
- **Comparison lemmas.** `#A_L = |det L|`; `l(A_L) ≤ rank L`; the polarization of `q_L` is
  `b_L`; the invariant-factor description.
- **Naturality.** An isometry of lattices induces an isometry of discriminant forms, and
  this assignment respects composition.
- **Edge cases.** Unimodular `L`, where `A_L = 0`; odd `L`, which has no `q_L`; rank 0.
- **Downstream.** 1E, 1F, 5A to 5J, 6A.

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
- **Downstream.** 3C to 3I, 4C, 7C; and the successor's 7D.

### Genus symbols (3E, 3G)

- **Constructors.** From a Jordan splitting; from a Gram matrix by an algorithm.
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
- **Downstream.** 3F, 3G, 3I, 5A, 7C, 9A; and the successor's 7D.

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
- **Downstream.** 4E to 4G, 7A, 9A, 9B; and the successor's 7B.

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
- **Downstream.** The successor's 7H–7I and the mass route to 9B completeness.
  Constructing and separating the 6D rank-16 witnesses does not require a mass.

### Shells and representation numbers (2B)

- **Constructors.** `S_k(L) = {x ∈ L | β x x = k}` for every rank, and `r_L(k) = #S_k(L)`,
  finite by 2A for positive definite `L`. `min L` and the kissing number `#S_{min L}(L)` for
  `rank L ≥ 1`.
- **Examples.** `r_{E₈}(2) = 240`; `r_L(0) = 1`; for even `L` every odd shell is empty.
- **Morphisms.** None on `r_L` itself. An isometry carries shells to shells, so `r_L` is an
  isometry invariant.
- **Functoriality.** `S_k(L ⊕ M)` is the disjoint union over `i + j = k` of
  `S_i(L) × S_j(M)`, and `S_k(L(a)) = S_{k/a}(L)` for `a > 0`, empty unless `a ∣ k`.
- **Comparison lemmas.** These are the numbers Theta Series identifies with the
  `q`-expansion coefficients of `Θ_L` through its bridge. That identification is **its**
  theorem, and this roadmap states no theta series to compare against.
- **Naturality.** `r_L` depends only on the isometry class.
- **Edge cases.** Rank 0, where `S_0 = {0}` and every other shell is empty. Every fixed
  shell of a negative-definite lattice is finite by sign reversal, although its nonpositive
  sublevel can be infinite; `⟨−1⟩` has two points of norm `−1`. Indefinite shells need not be
  finite: `S_0(U)` is infinite, while an anisotropic rational form has only zero in `S_0`.
  The positive-definite minimum/kissing convention of 2A is not applied to either branch.
- **Downstream.** 2C, 2E, 2G, 6D, 6E, 6F, 9A; and Theta Series, through 8S.

## Hard theorems: source, hypotheses, and a nearby false statement

| Theorem | Source | Hypotheses that carry the proof | A nearby false statement |
| --- | --- | --- | --- |
| Unimodular splitting (0F) | O'Meara §82 | the restriction of `β` to `M` is unimodular | "a nondegenerate restriction splits". Take `L = ℤ` with `β(x,y) = xy` and `M = 2ℤ`. Then `β\|_M` is nondegenerate, `M^⊥ = 0`, and `M ⊕ M^⊥ ≠ L`. |
| Content under sublattices (B1) | Gram-matrix change of basis | the full basis matrix is retained, not only its determinant | "a finite-index sublattice multiplies content by its index". Restrict `x²+y²` on `ℤ²` to `⟨2e₁,e₂⟩`: the index is 2 but the form `4x²+y²` still has content 1. Only a form twist has the `\|a\|` content formula. |
| Cancellation over `ℤ` (0F) | Milnor–Husemoller II §5; Serre V.2.2 | none: the statement is false | "`L ⊕ N ≅ M ⊕ N` implies `L ≅ M`". Take `N = U`, `L = E₈²`, `M = D₁₆⁺`. Both sums are even unimodular of signature `(17,1)`, hence isometric, while `E₈² ≇ D₁₆⁺`. |
| Milgram's theorem (1I) | Nikulin Thm 1.3.3; Milnor–Husemoller App. 4 | `L` is even and nondegenerate | "every unimodular lattice has `8 ∣ t₊ − t₋`". The odd lattice `⟨1⟩` is unimodular with `t₊ − t₋ = 1`. |
| Van der Blij's congruence (1L) | van der Blij, Indag. Math. 21 (1959); Milnor–Husemoller App. 4 | `L` is unimodular, and `w` is characteristic: `β(w,x) ≡ β(x,x) (mod 2)` for all `x` | "for nondegenerate integral `L` and characteristic `w`, `t₊ − t₋ ≡ β(w,w) (mod 8)`". For `⟨2⟩` every vector is characteristic, because every value of `β` is even; `t₊ − t₋ = 1` while every `β(w,w) = 2k²` is even, so the congruence fails for every characteristic `w`. |
| The Gauss sign of a metabolic module (1H) | Wall, Topology 2 (1963); Milnor–Husemoller App. 4 | the Lagrangian subgroup is isotropic for `q`, not merely for its polar `b` | "a subgroup with `H = H^⊥` on which `b` vanishes forces `sign q = 0`". The discriminant form of `A₁ ⊕ A₁` has such an `H` with `q = ½` on its generator and `sign = 2`. The converse "`sign q = 0` makes a nondegenerate module metabolic" is also false: `q_θ^{(5)}(5)` with `(θ\|5) = −1` has `sign = 0` and order 5, which is no `#H²`. |
| Finiteness of `O(L)` (2C) | O'Meara §102 | `L` is definite | "`O(L)` is finite for every nondegenerate `L`". `O(⟨1,−2⟩)` is infinite, being carried by the unit group of `ℤ[√2]` (B4), and 4F gives infinitude in every indefinite rank at least 3. |
| Diagonalization over `ℤ_p` (3C) | O'Meara 92:1 | `p` is odd | "every symmetric form over `ℤ_2` has an orthogonal basis". The hyperbolic plane `U` has none. |
| Two unimodular classes per rank (3C) | O'Meara 92:1a | `p` odd and rank at least 1 | "exactly two for every rank". In rank 0 there is one. |
| Uniqueness of Jordan invariants (3C) | O'Meara 91:9 | `p` is odd | "Jordan invariants are unique for every `p`". At `p = 2` they are not, which is why 3E states the moves. |
| Existence of an even lattice (5B) | Nikulin Thm 1.10.1 | conditions 3 and 4 apply exactly when `t₊ + t₋ = l(A_{q_p})` | "conditions 1 and 2 suffice". They suffice only under the strict inequality `t₊ + t₋ > l(A_q)`, which is Corollary 1.10.2. |
| Uniqueness in a genus (5C) | Nikulin Thm 1.13.2 | `t₊ ≥ 1` and `t₋ ≥ 1`, so `L` is indefinite | "the invariants `(t₊, t₋, q)` determine the isometry class". `E₈²` and `D₁₆⁺` share all three and are not isometric. |
| Surjectivity of `O(T) → O(q_T)` (5E) | Nikulin Thm 1.14.2 | `T` indefinite, and the two rank conditions | "the map is always surjective". It can fail for definite lattices, where the genus can have several classes. |
| Eichler's theorem (4D, not owned here) | O'Meara 104:5 | indefinite, and rank at least 3 | "every indefinite lattice satisfies `cls⁺ = spn⁺`". Rank 2 is excluded, and the rank-2 half of 4E — which stays here — proves that case by a different argument. |
| Strong approximation for `Spin` (not owned here) | O'Meara 104:4 | dimension at least 3, and a noncompact place | "it also proves the Tamagawa volume theorem". It does not: 7F is a separate theorem, and both belong to `OrthogonalTamagawaAndLatticeMass`. |
| The mass formula (7H, not owned here) | Conway–Sloane, eq. (2) | rank at least 2, in the stated normalization | "the formula holds in every rank". In rank at most 1 a factor 2 becomes 1, and `m` is 1/2 in rank 1 and 1 in rank 0 — which 7G proves here, so the successor must not re-derive it from the general formula. |
| The local density at 2 (7D, not owned here) | Cho, Compositio 151 (2015) | residue characteristic 2, with the smoothened model | "the Conway–Sloane dyadic table proves it". The table alone is not the smooth-model proof; 7D belongs to OTM over its actual general local/model prerequisites. |
| Classification in rank at most 9 (6C) | O'Meara 106:13 | rank at most 9, positive definite | "a positive definite unimodular lattice is determined by its rank and parity". Rank 16 has two even classes (6D). |
| Automorphisms of an indefinite lattice (4F) | O'Meara §104; Cassels ch. 13 | rank at least 3, and a case split on isotropy over `ℚ` | "an indefinite rational space has an isotropic vector". `x² + y² − 3z²` is indefinite over `ℝ` and anisotropic over `ℚ`, so the transvection proof covers only one case. |
| Automorphisms of a binary lattice (B4) | Pell's equation; Cassels ch. 13 | `Δ > 0` and `Δ` not a square | "an indefinite binary lattice has infinite `O(L)`". `U` has `Δ = 1`, a square, and `\|O(U)\| = 4`. |
| Improper binary automorphisms (B4) | Gauss; Cox §3 | the proper class of the primitive part is fixed by inversion | "`[O(L) : SO(L)] = 2` for every nondegenerate binary `L`". `!![4,1;1,6]` has `Δ = −23` and only `±e₁` of norm 4, so `O(L) = SO(L) = {±I}` has order 2, while `2·#𝒪ˣ = 4`. |
| Forms to ideals for `Δ > 0` (B2) | Cox Thm 7.7 and its narrow analogue; Cohen, *Computational ANT*, §5.2 | the image of `f = (a,b,c)` is `𝔞_f` for `a > 0` and `√Δ·𝔞_f` for `a < 0` | "`f ↦ [𝔞_f] ∈ NarrowPic 𝒪_Δ` is well defined on proper classes". For `Δ = 12`, `x² − 3y²` and `−x² + 3y²` give the same ideal `𝒪_{12}`, hence the same narrow class, yet are not properly equivalent, since `x² − 3y²` does not represent `−1` modulo 3; the oriented map sends the second to `√3·𝒪_{12}`, the other narrow class. |
| The rank-2 mass (B8) | Gauss; Conway–Sloane §2 | the count is of **proper** classes | "`m(gen L) = h(gen L)/(2·#𝒪ˣ)` with `h` the class number". The genus of `!![4,1;1,6]` has `h = 2`, `h⁺ = 3` and `w = 2`, and its mass is `1/4 + 1/2 = 3/4 = h⁺/(2w)`, not `1/2`. |
| Eichler transvections (4F) | O'Meara §104; Cassels ch. 13 | `w` is taken modulo `ℤu`, and `N_L(w)` is even | "`w ↦ E_{u,w}` is injective on a finite-index subgroup of `u^⊥ ∩ L`". `E_{u,w+au} = E_{u,w}` for every `a`, and every finite-index subgroup contains a nonzero multiple of `u`. |
| The odd local density type (7C) | Conway–Sloane §12; Gan–Yu Thm 7.3 | `ε` is the type of the reduction, `((−1)^m det \| p)` | "`ε = +1` exactly when `det L_p` is a square". The hyperbolic plane over `p = 3` has `det = −1`, a nonsquare, and is split, with `α_3 = 4/3`. |
| Cho's dyadic formula (7D, not owned here; 3I owns its exponents) | Cho Thm 5.2 with Lemma 5.1 | the exponent `N = N_Q − N_M` and the index `[O : SO]` | "`α_2(L) = 2^{−n(n−1)/2}·#𝒢̃_L(𝔽_2)`". `N` is generally nonzero, and `β_L` carries `[O(V,q) : SO(V,q)]⁻¹`. |
| Well-definedness of the dyadic exponents (3I) | O'Meara 93:28 and 93:29; Cho Lemma 5.1 | the ranks, scales and norms of the Jordan constituents are invariants of the lattice, although the splitting is not | "nothing attached to a dyadic Jordan splitting is an invariant". The signs and oddities are not, which is why 3E needs sign walking and oddity fusion; the ranks, scales and types are, and that is what makes `N_M`, `N_Q` and `N` well defined. |
| Proper against full mass (7A) | Conway–Sloane §2 | `rank L ≥ 1` | "`m⁺ = 2m` always". In rank 0 both masses are 1, because `O(L) = SO(L) = 1`. |
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
  with that signature. For `d > 0` the lattice `⟨2d⟩` embeds primitively, and uniquely up
  to `O(Λ_{K3})`. Every even lattice of signature `(1, ρ−1)` with `ρ ≤ 10` embeds
  primitively (5G, 5H, 6A).
- One LMFDB record checked end to end: `A₂`, and one rank-4 lattice with a nontrivial
  2-adic symbol (9A). The `A₂` completeness certificate of 9B uses its proved binary
  class calculation or an exact mass, with the chosen exhaustion proof recorded.
- Mass conventions: rank 0 gives 1, and the genus of `⟨a⟩` gives 1/2 (7G).

## Ordering and parallelism

Layer 0 comes first. Layer 2 and the initial duality/discriminant constructions of Layer 1
can then proceed independently. The complete localization output 3A follows 1A/1B because
it includes duality transport; 3B–3E follow 3A. An earlier localization-only construction may
be implemented separately, but does not itself supply the full 3A compatibility API.

The rest of the order follows the prerequisite tables:

- milestones 3F to 3H need Layer 1 and the two suppliers named in their table; 3I needs only
  3B, 3D and 3E, so it can be built in parallel with 3F to 3H;
- Layer B needs Layers 0 to 3; its nonsquare branch also needs the order and Picard carriers
  of Global Number Fields and, for negative discriminant, Class Field Theory's
  ring-class-field milestone. The square branch is elementary. Layers 4 and 7 use both
  rank-2 branches;
- Layer 4 needs Layers 2, 3 and B, and the Orthogonal and Spin Groups roadmap;
- Layer 5 existence (5A, 5B) needs Layers 1 and 3 and N0's adelic lattice reconstruction,
  together with the rational-form producers of Quadratic Form Invariants, Global Quadratic Forms
  and Class Field Theory named in N4; its uniqueness and splitting branch (5C, 5D) also needs
  N1's integral spinor images, N3's proper-spinor quotient and the OTM0.3 Eichler contract;
- Layer 6 follows its separate odd/characteristic/even construction order above; the broader
  Layer 5 route remains required, and 6C additionally needs Root Systems;
- Layer 7's own milestones — 7A, 7C, 7E and 7G — need Layers 2, 3, 4 and B, and nothing
  adelic; 7B, 7F, 7H and 7I are `OrthogonalTamagawaAndLatticeMass`'s and are ordered after the
  generic `TamagawaMeasures`, and its 7D after the group-scheme material of the successors
  Restricted Products names;
- Layer 8 is a contract and orders nothing here: it imports nothing, no milestone of Layers 0
  to 7, B or 9 has a theta series among its prerequisites, and nothing here waits on Theta
  Series. What that roadmap waits on from here is 8S — Layers 0 and 1, together with 2B, 2D,
  6D and 6E;
- Layer 9 follows the invariants it certifies. 9B requires its actual exhaustion proof, supplied
  by a mass, connectivity plus exhaustive search, or direct classification/certified enumeration.

The K3 results use two routes. Existence of an even lattice with given signature and
discriminant form, and the genus comparison, run `0 → 1 → 3 → N0 → 5A, 5B`, with the local
inputs IL3C, 3D and 3E and the rational-form producers named in N4; they use no milestone of
Layers 2, 6 or 7, and of Layer 4 only N0. Uniqueness and splitting, 5C and 5D, additionally run
through N1 and N3 of Layer 4 and the OTM0.3 Eichler comparison.

## References

- J. H. Conway, N. J. A. Sloane, *Low-dimensional lattices. IV. The mass formula*, Proc. R.
  Soc. Lond. A 419 (1988) 259–285. This is the source for Layer 7:
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
- J.-P. Serre, *A Course in Arithmetic*, GTM 7, Springer (1973), Chapter V. Source for 1I,
  6A and 7H: V.1.3.5, V.1.4.3, V.2 Theorem 2 with Corollary 1, V.2.2, and V.2.3. The
  uniqueness of `E₈` is derived there from a mass formula that the chapter does not prove,
  so 6C uses O'Meara's proof instead.
- J. Milnor, D. Husemoller, *Symmetric Bilinear Forms*, Ergebnisse 73, Springer (1973).
  Chapter II for 6A, and Appendix 4 for 1H, 1I and 1L.
- F. van der Blij, *An invariant of quadratic forms mod 8*, Indag. Math. 21 (1959) 291–293.
  The signature congruence of 1L; Milnor–Husemoller Appendix 4 gives the Gauss-sum proof.
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
- G. Chenevier, J. Lannes, *Automorphic Forms and Even Unimodular Lattices*, Ergebnisse 69,
  Springer (2019). Background for 6E.
- T. Kirschmer, *Definite quadratic and hermitian forms with small class number*,
  Habilitation, RWTH Aachen (2016). Tables of one-class genera and masses, used to validate
  9A and 9B.
