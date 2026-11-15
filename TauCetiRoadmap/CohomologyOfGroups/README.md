# Roadmap: cohomology of groups

**Summary.** This roadmap develops the homology and cohomology of an arbitrary group `G` with
coefficients in `k`-linear representations, `k` any commutative ring, on Mathlib's carriers
`groupHomology`, `groupCohomology` and `tateCohomology`. Starting from those carriers and the
operations Tau Ceti already provides (corestriction, transfer, inflation–restriction, the Tate cup
product, cyclic periodicity), it builds conjugation and the quotient action on the (co)homology of
a normal subgroup; hyperhomology and hypercohomology of complexes with their two spectral
sequences; complexes of permutation modules, groups acting on trees and the Mayer–Vietoris
sequences of amalgams and HNN extensions; cup and cap products for arbitrary equivariant
pairings; the Künneth and universal coefficient theorems and the Pontryagin ring of an abelian
group; a filtered realisation of the Hochschild–Serre spectral sequence of a group extension
with its edge maps, transgression in all degrees, products and low-degree sequences, and Hopf's
formula; the double coset formula for a subgroup of finite index; and, for finite groups, stable
elements with arbitrary coefficients, Tate duality, the periodicity theorem, the `p`-period with
the all-degree cup periodicity of cyclic groups, and the periodicity forced by an exact sequence of
cohomologically trivial modules from `ℤ_χ` to `ℤ`.
The end theorems are the Hochschild–Serre spectral sequence (6.2–6.7), the tree sequence (3.5),
the Künneth theorem (5.1), the double coset formula (7.1), the stable element theorem (7.2), Tate
duality (8.1) and the periodicity theorem (8.5).

## Scope and ownership

This roadmap owns the general theory of the (co)homology of discrete groups with coefficients in
representations over an arbitrary commutative ring, on the existing carriers. Finite groups enter
as instances wherever the statement holds for every group; only Layers 7.2 and 8 are theories of
finite groups.

**Carriers and operations consumed, not rebuilt.** Mathlib's `groupCohomology`, `groupHomology`
and `tateCohomology` on `Rep k G`, with their compatible-pair maps `groupCohomology.map` and
`groupHomology.map`, inflation, coinflation and homological corestriction
(`groupCohomology.infNatTrans`, `groupHomology.coinfNatTrans`, `groupHomology.coresNatTrans`),
Shapiro's lemma (`groupCohomology.coindIso`, `groupHomology.indIso`), the resolution comparisons
(`groupCohomologyIso`, `groupHomologyIso`, `groupCohomologyIsoExt`, `groupHomologyIsoTor`) and the
Tate comparisons (`TateCohomology.isoGroupCohomology`, `TateCohomology.isoGroupHomology`).
Tau Ceti's corestriction `TauCeti.groupCohomology.corestriction`, transfer
`TauCeti.groupHomology.transfer`, Tate restriction and corestriction in every degree
(`TauCeti.TateCohomology.res`, `TauCeti.TateCohomology.cor`), the projection formula
`TauCeti.indProjection` and the Mackey decomposition `Rep.mackeyDecomposition` of induced
representations, inflation–restriction `TauCeti.groupCohomology.HInfRes_exact`,
Sylow injectivity `TauCeti.groupCohomology.eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero`, the
Tate cup product `TauCeti.TateCohomology.cup` with `cup_assoc`, `cup_gradedComm`,
`cup_projection` and `cup_res`, cyclic periodicity `Rep.FiniteCyclicGroup.periodicIso`, the
continuous cup product `TauCeti.TopPairing.cup`, the continuous Mackey formula
`TauCeti.ContinuousCohomology.corestriction_mackey` and the class of the factor set of an extension
with abelian kernel, `TauCeti.FactorSet.cohomologyClass`, with its independence of the section
`TauCeti.GroupExtension.cohomologyClass_factorSet_eq`, are used as they stand. So are Tau Ceti's
Alexander–Whitney and shuffle maps with the Eilenberg–Zilber theorem
(`CategoryTheory.SimplicialObject.alexanderWhitney`, `SSet.shuffle`,
`SSet.eilenbergZilberHomotopyEquiv`), which give the diagonal approximation of 4.4 and the cross
product of 5.1; the half of the directed-union identification it proves,
`groupHomology.exists_map_subtype_eq`; and its vanishing of `Hₙ(FreeGroup S, k)` for `n ≥ 2` with
trivial coefficients, `TauCeti.isZero_groupHomology_freeGroup` (`S, k : Type`), which 3.6 extends
to every coefficient representation, to cohomology and to the universe `u`.

**Owned elsewhere and imported by section.**
- DerivedModuleAlgebra §S.1 owns the spectral sequence of a first-quadrant double complex in an
  abelian category: the identification of `E₂` with iterated cohomology, convergence, the edge
  morphisms, the five-term and extended sequences, the exact-rows comparison and naturality. Every
  double-complex spectral sequence here is an instance of it; no spectral-sequence machinery is
  built here. The homological edge morphisms and five-term sequence are recorded as what §S.1 must
  provide (Exact supplier contracts).
- SpectralSequencesAndConvergencePartII, Layer 2, owns the hypercohomology spectral sequences of a
  left exact functor on a bounded-below complex, built from Cartan–Eilenberg resolutions, and the
  hyperhomology spectral sequences of a right exact functor obtained from them; it leaves the
  edge morphisms and low-degree sequences of first-quadrant double complexes to
  DerivedModuleAlgebra §S.1. The sequences of 2.3 are the instance for the invariant and
  coinvariant functors of `Rep k G`, read on the explicit bicomplex of inhomogeneous (co)chains, as
  the integral sequence of SchemeKTheoryOperations §6.7 is. Its Layer 3 owns the composite-functor
  spectral sequences with their low-degree sequences (§§3.2–3.4), of which the Hochschild–Serre
  spectral sequences are instances: invariants under `N` followed by invariants under `G ⧸ N`
  (§3.2), and coinvariants in the same order (§3.4). 6.2 and 6.3 construct them on the filtration
  of the normalized cochains and on the explicit bicomplex, where the edge maps, products and
  transgression are computed, and do not compare them with §3.2's and §3.4's. Its §5.2 owns the
  pairings of the spectral sequences of multiplicatively filtered complexes, with the derivation
  rule for every `d_r` and the product on `E_∞`; 6.5 applies it to the cup product and the
  filtration of 6.1, and identifies the pairing on `E₂`.
- ProfiniteCohomology owns continuous cohomology of profinite groups: its explicit low-degree model
  and comparisons (§§3.1–3.2), the profinite five-term sequence with transgression (§5.5), the
  continuous Mackey formula (§§6.4, 10.5), the finite-quotient colimit (§10.1) and the continuous
  cup products (Layers 8, 12). Here they enter only through the comparisons of 1.5, 4.7 and 6.9.
- ClassFieldTheory Layer 0 owns the Tate-cohomology interface (Herbrand quotient, Tate–Nakayama,
  Nakayama–Rim, cohomological triviality written out as vanishing on all subgroups); class
  formations stay there.
- FreeGroupsAndLimitGroups Layer 4 owns graphs of groups, `G`-trees (§4.6), the Bass–Serre tree
  (§4.7) and the identification of one-edge splittings with Mathlib's `Monoid.PushoutI` and
  `HNNExtension` (§4.5). Layer 3 consumes them.
- AlgebraicTopology owns cellular chains (§§4.1–4.3), the Cartan–Leray spectral sequence of a
  finite regular cover with constant coefficients (§5.3) and torus homology (§5.4); the algebraic
  statement 3.3 is the group-cohomological input of §5.3. `G`-CW complexes and the `G`-module
  structure on their cellular chains are not constructed here, and the topological forms of 8.3
  (a free cellular action on a finite-dimensional complex with the homology of a sphere) are
  instances that a roadmap owning `G`-CW complexes obtains by applying 8.3 to the cellular chains.
- The algebraic Künneth and universal-coefficient spectral sequences of complexes of modules over
  a commutative ring are owned by SpectralSequencesAndConvergencePartII §§4.2–4.3; this roadmap
  supplies the chain-level identification of 5.1 to which they apply. Its §4.3 gives, when
  `Tor_i^k = 0` for `i ≥ 2`, the two-term Künneth sequence of two bounded-above complexes, one of
  them flat in every degree, with the cross product as first map; its naturality is what that
  section must provide (Exact supplier contracts). This roadmap proves the group-homology sequence
  of 5.1 from it, its splitting from Tau Ceti's splitting for complexes of projective modules, and
  the sequences of 5.2 from Tau Ceti's sequences for complexes with projective cycles and
  boundaries.
- Finiteness conditions, cohomological and virtual cohomological dimension, duality groups, Euler
  characteristics and Farrell cohomology are not planned here; no target uses them, and the
  finiteness hypothesis of 5.3 is stated directly on the homology of a factor.
- SchemeKTheoryOperations §6.7 owns group hyperhomology of a chain complex of integral
  representations in degrees `≥ 0`, with its functoriality, quasi-isomorphism invariance, two
  spectral sequences, low-degree vanishing and the Shapiro identification of its first page for
  transitive permutation modules; and the identification of the homology of a directed union of
  subgroups with the colimit of their homology, for any coefficient ring. K3BlochGroups §4.1 owns
  the bounded-below reindexing of the integral form. Here 2.1–2.3 are the extension to coefficients
  in any commutative ring `k` and to hypercohomology of cochain complexes, compared with §6.7 at
  `k = ℤ`; 3.2 extends the permutation-module identification to monomial complexes; 5.4 imports
  the directed-union identification.
- MappingClassGroupsAndCanonicalRepresentations §1.1 owns, for every extension of discrete groups,
  the existence and naturality of the cohomological Hochschild–Serre spectral sequence, the lift
  of an invariant class of `H¹(N, M)` through a set-theoretic section, the transgression it defines,
  the cohomological five-term exact sequence and the degree-two filtration. Here 6.2 realises that
  spectral sequence by the filtration of 6.1, on which the edge maps, products and higher
  transgressions of 6.4–6.6 are computed; 6.7 adds the sequences of degree `m ≥ 2` and the
  homological five-term sequence; 6.9 compares the five-term sequence with the profinite one for
  finite groups.
- InductionRestrictionPartII RS.0.1 owns the exact sequence
  `H₂(E, ℤ) → H₂(G, ℤ) → A → E^ab → G^ab → 0` of a central extension `1 → A → E → G → 1`; the
  homological five-term sequence of 6.7, applied to the normal subgroup `A` of `E` with `M = ℤ`,
  has these terms (`H₁(A, ℤ)_G = A` as `A` is central), extends them to every normal subgroup and
  every coefficient representation, and its `d²` is not compared with RS.0.1's map
  `H₂(G, ℤ) → A`. RS.0.3 owns, for a normal Hall subgroup `H` of a finite group
  `G`, the isomorphism induced by corestriction from the `G`-coinvariants of `H₂(H, ℤ)` onto the
  part of `H₂(G, ℤ)` primary to the primes dividing `|H|`; for a normal Sylow subgroup it is the
  degree-two integral case of the homological clause of 7.2, compared there. RS.6.8 owns, for
  abelian groups `A, B : Type`, the degree-two Künneth isomorphism
  `H₂(A × B, ℤ) ≅ H₂(A, ℤ) ⊕ H₂(B, ℤ) ⊕ (A ⊗ B)` and, for every abelian group `A : Type`, finite
  or not, the isomorphism `Λ²A ≅ H₂(A, ℤ)` sending `a ∧ b` to the class `⟨a, b⟩` of
  `[a|b] − [b|a]`. 5.1 is the Künneth theorem for all groups, all degrees and every `k` of global
  dimension at most one, and for every `k` when one factor has coefficients and homology projective
  over `k`, of which RS.6.8's formula is the integral degree-two instance for abelian groups. 5.4
  consumes the exterior-square isomorphism and does not prove it: it identifies the degree-two
  part of its `ψ` at `k = ℤ` with RS.6.8's isomorphism, and its own comparisons are the
  torsion-free and rational ones in all degrees.
  StableHomotopyKTheory §3.29 owns the identification of `H₂` of a perfect group with the kernel of
  its universal central extension. K2SymbolsBrauer §1.1 owns the bar normalisation of the Hopf map
  of a free presentation `G = F ⧸ R`: the connecting map sending the class of a 2-cycle to the
  boundary of a lift, read in `R ⧸ ⁅F, R⁆` through `[x] − [y] ↦ xy⁻¹`, its value `⁅s, t⁆⁻¹` on the
  ordered torus cycle and its naturality
  under maps of free presentations and of universal central extensions; it leaves the existence
  and bijectivity of the Hopf equivalence of a general group to its supplier. 6.8 is Hopf's formula
  for every group for that map: it is well defined and an isomorphism onto
  `(R ⊓ ⁅F, F⁆) ⧸ ⁅F, R⁆`; it is compared with §3.29 for perfect groups in a Check.
- K3BlochGroups §5.2 owns, for finite groups, the stable-element theorem with trivial coefficients
  `ℤ_(r)`, the duality `H^{d+1}(G, ℤ) ≅ Hom(H_d(G, ℤ), ℚ/ℤ)` for `d ≥ 1`, the four-periodic free
  resolution of the generalised quaternion groups with its period class in `Ĥ⁴`, the invertibility
  of cup product with that class in Tate cohomology (which, with the associativity and unit of the
  Tate cup product, is the four-periodicity of `Ĥ*(Q_{2^s}, M)` for every `M`) and Swan's theorem
  on `r`-periods. Here 7.2 is the stable-element theorem for arbitrary coefficient representations,
  in homology and in Tate cohomology; 8.1 is Tate duality for arbitrary coefficients, of which
  §5.2's duality is the integral instance; 8.4 defines the `p`-period, proves the all-degree cup
  periodicity of cyclic groups and compares the period with §5.2's, and the generalised quaternion
  case is §5.2's, not restated here; 8.3 is the periodicity forced by any exact sequence of the
  stated shape, of which the quaternion resolution is an instance.
- ArithmeticGaloisDuality §D7.2 owns, for a finite group `G`, the integral universal coefficient
  sequence `0 → Hₙ(G, ℤ) ⊗ A → Hₙ(G, A) → Tor₁(Hₙ₋₁(G, ℤ), A) → 0` for an abelian group `A` with
  trivial action, the isomorphism `H^{n+1}(G, ℤ) ≅ Ext¹(Hₙ(G, ℤ), ℤ)`, the evaluation duality
  `Hⁿ(G, k) ≅ Hom_k(Hₙ(G, k), k)` over a finite field `k`, and the statement that every element of
  the `ℓ`-primary part of `Hₙ(G, M)` is the corestriction of a class of a Sylow `ℓ`-subgroup. Here
  5.2 is the pair of universal coefficient sequences for every group and every `k` of global
  dimension at most one, with the `Hom` term of the cohomological sequence, which is nonzero for
  infinite groups such as `ℤ`; 7.2's homological clause refines the Sylow statement, for `n ≥ 1` and
  coefficients over any `k`, to an isomorphism from the transfer-stable classes. Its
  Hochschild–Serre spectral sequence (Layer R02.2) and its Künneth formula for products of
  profinite groups (§D7.2) concern continuous cohomology and are not used here.
- IntegralIwasawaTheoryPartII §0.7 owns the cap product `H^q(U, M^∨) × H_q(U, M) → ℂ_p` for a
  `ℂ_p[U]`-module `M`. The evaluation pairing of 4.6 is defined for any `k` and any `k`-module of
  values `A`, and agrees with §0.7 for `k = A = ℂ_p`. §0.7 also owns, for any commutative ring `k`,
  any group `G` and `S ◁ G`, the vanishing of `H_q(S, M)` for `q > 0` when `M` is flat over `k[S]`,
  and the edge isomorphism: coinflation `Hₙ(G, M) → Hₙ(G ⧸ S, M_S)` is bijective for every `n` when
  `H_q(S, M) = 0` for every `q > 0`. That isomorphism is the one-row case of the spectral sequence
  of 6.3 with the coinflation edge map of 6.4, compared in a Check of 6.4 and not restated here.
- ModularCurvesPartII §15.4 owns the sequence of the modular amalgam; 3.6 is the sequence of an
  arbitrary amalgam.
- Non-goals: the Evens norm and finite generation of cohomology rings; equivariant Tate cohomology
  of complexes; realising periods by finite complexes.

## Conventions

- **Universes and rings.** `k G : Type u`, `[CommRing k]`, `[Group G]`; representations are
  objects of `Rep.{u} k G`, the generality in which Mathlib's carriers and its monoidal structure
  on `Rep` are stated. Subgroups `H ≤ G` carry the restricted representation `Rep.res H.subtype M`,
  written `Res M` or `M` when no confusion arises. Since `groupHomology`, `groupCohomology` and
  `tateCohomology` take the ring and the group in one universe, for `k = ℤ` (or any other ring in
  `Type`, such as `ℤ_(p)`) the group lies in `Type`: so in 6.8 (`S : Type`), in Layer 8 and in the
  integral clauses of 5.4, as in Tau Ceti's `TauCeti.TateCohomology.characterConnectingClass`.
- **Notation.** `Hⁿ(G, M) = groupCohomology M n`, `Hₙ(G, M) = groupHomology M n`, and, for
  `[Fintype G]`, `Ĥⁿ(G, M) = tateCohomology M n` for `n : ℤ`, with `Ĥ^{−n−1}(G, M) = Hₙ(G, M)`
  for `n ≥ 1` through `TateCohomology.isoGroupHomology`. For an abelian group `A` and a prime
  `p`, `A(p)` is the subgroup of elements killed by a power of `p`.
- **Maps of groups.** A compatible pair is a homomorphism `f : G' →* G` with a morphism
  `Res_f M ⟶ M'` (cohomology) or `M' ⟶ Res_f M` (homology), as in `groupCohomology.map` and
  `groupHomology.map`. In cohomology, *restriction* is the pair `(H.subtype, 𝟙)`, *inflation* the
  pair `(G → G ⧸ N, M^N ↪ M)`, and *corestriction* is Tau Ceti's
  `TauCeti.groupCohomology.corestriction` (finite index). In homology, *corestriction* is the map
  `Hₙ(H, M) → Hₙ(G, M)` induced by the inclusion (Mathlib's `groupHomology.coresNatTrans`),
  *coinflation* is `groupHomology.coinfNatTrans`, and *transfer* is Tau Ceti's
  `TauCeti.groupHomology.transfer : Hₙ(G, M) → Hₙ(H, M)` (finite index).
- **Conjugation.** For `g ∈ G` and `H ≤ G`, `c_g : Hⁿ(H, M) → Hⁿ(gHg⁻¹, M)` is induced by the
  pair `(x ↦ g⁻¹xg : gHg⁻¹ → H, m ↦ g·m)`, and `c_g : Hₙ(H, M) → Hₙ(gHg⁻¹, M)` by
  `(h ↦ ghg⁻¹, m ↦ g·m)`. Witness: in degree `0`, `c_g(m) = g·m` sends `M^H` into `M^{gHg⁻¹}`;
  for `G = S₃`, `H = ⟨(12)⟩`, `g = (123)` and trivial `𝔽₂` coefficients, `gHg⁻¹ = ⟨(23)⟩` and
  `c_g φ = φ(g⁻¹ · g)` sends the nonzero character `φ` of `H` to the character of `⟨(23)⟩` with
  value `φ((12)) = 1` at `(23)`, since `g⁻¹(23)g = (12)`. The inverse convention would land in the
  cohomology of `g⁻¹Hg = ⟨(13)⟩`; an involution such as `(13)`, with `g = g⁻¹`, does not separate
  the two.
- **Cup product.** For a pairing `μ : M ⊗ N ⟶ P` and inhomogeneous cochains `φ` of degree `p` and
  `ψ` of degree `q`, `(φ ∪ ψ)(g₁, …, g_{p+q}) = μ(φ(g₁, …, g_p) ⊗ (g₁⋯g_p)·ψ(g_{p+1}, …, g_{p+q}))`,
  with `d(φ ∪ ψ) = dφ ∪ ψ + (−1)^p φ ∪ dψ` and, for connecting maps, `δx ∪ y = δ(x ∪ y)` and
  `x ∪ δy = (−1)^p δ(x ∪ y)` (MilneCFT Ch. II Prop. 1.38, p. 73). This is Tau Ceti's sign for the
  Tate cup product. Witness: on `G = ℤ²` with `x, y ∈ H¹(G, ℤ)` the two coordinate projections,
  the cocycle `x ∪ y` takes the values `1` at `(e₁, e₂)` and `0` at `(e₂, e₁)`, so it pairs to
  `+1` with the class of `[e₁|e₂] − [e₂|e₁]` in `H₂(G, ℤ)`; the homogeneous convention with a
  factor `(−1)^{pq}` (Loh19 Outlook 3.2.28, p. 139) gives `−1`.
- **Extension classes.** For `1 → A → E → Q → 1` with `A` abelian and a set-theoretic section
  `s` with `s(1) = 1`, `Q` acts on `A` by `x·a = s(x)as(x)⁻¹`, and the integral class
  `c ∈ H²(Q, A)` is that of the factor set `(x, y) ↦ s(x)s(y)s(xy)⁻¹`: Tau Ceti's
  `TauCeti.FactorSet.cohomologyClass` of the factor set of `s`, independent of `s` by
  `TauCeti.GroupExtension.cohomologyClass_factorSet_eq`. For a commutative ring `k`,
  put `A_k = Additive A ⊗_ℤ k`, with `Q` acting on the first factor; the *scalarised class*
  `c_k ∈ H²(Q, A_k)` is the class of the factor set followed by `a ↦ a ⊗ 1`. Replacing `s` by
  `x ↦ b(x)s(x)` with `b(1) = 1` adds to the factor set the coboundary of the normalized
  `A`-valued cochain `b`, and `a ↦ a ⊗ 1` is `Q`-equivariant, so `c_k` does not depend on `s`; and
  `c_ℤ = c`. `A_k` is a representation in `Rep.{u} k Q` for every `k` in the universe of `Q`,
  whereas `A` itself need not be a `k`-module: for `A = 3ℤ/27 ≅ ℤ/9` and `k = 𝔽₃`, `3·3 = 9 ≠ 0`
  in `A`, while `A_k ≅ 𝔽₃` by `3 ⊗ 1 ↦ 1`. Witness: for `ℤ/3 ⊂ ℤ/9` and `s(x) ∈ {0, 1, 2}`, `c` is
  the carry cocycle, nonzero (equal to `3`) at `(1, 2)`, `(2, 1)` and `(2, 2)` and `0` elsewhere,
  and `c_{𝔽₃}` is the same cocycle under `3 ⊗ 1 ↦ 1`.
- **Spectral sequences.** Indexing is classical: a cohomological sequence has
  `d_r : E_r^{p,q} → E_r^{p+r, q−r+1}`, a homological one `d^r : E^r_{p,q} → E^r_{p−r, q+r−1}`.
  The translation to Mathlib's numbering, where the first page is numbered `2`, is the one fixed by
  DerivedModuleAlgebra §S.1 and Tau Ceti's `CochainComplex.spectralSequence`.
- **Total complexes.** The total complex of a bicomplex is Mathlib's `HomologicalComplex₂.total`
  with its sign convention; isomorphisms with other sign conventions are stated where used.
- **Groups.** The generalised quaternion group of order `2^s`, `s ≥ 3`, is
  `QuaternionGroup (2^(s−2))` (order `4 · 2^(s−2)`); `Q₈` is the case `s = 3`. The free product of
  `A` and `B` is Mathlib's `Monoid.Coprod A B`, written `A ∗ B`, with inclusions
  `Monoid.Coprod.inl` and `Monoid.Coprod.inr`. A conjugate subgroup `gHg⁻¹` is written in Lean as the
  preimage `H.comap (MulAut.conj g⁻¹).toMonoidHom`, which carries Mathlib's finite-index instance.
  A representation is
  *cohomologically trivial* when `Ĥⁿ(S, Res A) = 0` for every subgroup `S` and every `n ∈ ℤ`,
  written out as in ClassFieldTheory Layer 0.

## Exact supplier contracts

### From Mathlib

- `groupCohomology`, `groupHomology`, `groupCohomology.map`, `groupHomology.map`,
  `groupCohomology.cochainsFunctor`, `groupHomology.chainsFunctor`, `groupCohomology.functor`,
  `groupHomology.functor`, `groupCohomology.resNatTrans`, `groupCohomology.infNatTrans`,
  `groupCohomology.HInfRes`, `groupHomology.coresNatTrans`, `groupHomology.coinfNatTrans`,
  `groupHomology.H1CoresCoinf` (`RepresentationTheory/Homological/Group{Co}homology/Functoriality.lean`):
  the carriers and their functoriality in compatible pairs.
- `groupCohomology.coindIso`, `groupHomology.indIso` (`…/Shapiro.lean`): Shapiro's lemma for any
  subgroup.
- `groupHomology.inhomogeneousChains` (`…/GroupHomology/Basic.lean`), whose differential is
  `d(a[x|y]) = (x⁻¹·a)[y] − a[xy] + a[x]` in degree `2` (`groupHomology.inhomogeneousChains.d_single`);
  `groupHomology.H1AddEquivOfIsTrivial` (`…/GroupHomology/LowDegree.lean`): `H₁(G, A) ≅ G^ab ⊗ A`
  for trivial `A`, sending the class of `a[g]` to `g ⊗ a`; `CategoryTheory.ShortComplex.ShortExact.δ`
  (`Algebra/Homology/HomologySequence.lean`): the connecting map of a short exact sequence of
  complexes, with its exactness lemmas. Used in 6.8.
- `Rep.FiniteCyclicGroup.groupHomologyIsoEven`, `Rep.FiniteCyclicGroup.groupHomologyIsoOdd`
  (`RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean`): for a finite commutative
  group `G` generated by `g` and `A : Rep k G`, `Hᵢ(G, A)` is the homology of
  `A --(ρ(g) − 1)--> A --N--> A` for even `i ≥ 2` and of `A --N--> A --(ρ(g) − 1)--> A` for odd
  `i`, with `N` the norm. Used in 5.4.
- `Rep.standardResolution`, `Rep.barResolution` (`RepresentationTheory/Homological/Resolution.lean`),
  `groupCohomologyIso`, `groupHomologyIso`, `groupCohomologyIsoExt`, `groupHomologyIsoTor`: the
  carriers computed from any projective resolution of the trivial representation.
  `groupHomology.inhomogeneousChainsIso` (`…/GroupHomology/Basic.lean`): for `[DecidableEq G]`, the
  isomorphism of the inhomogeneous chains `C(G; A)`, whose homology is by definition
  `groupHomology A`, with the complex `(A ⊗ P)_G` of the bar resolution `P`.
  `CategoryTheory.MonoidalClosed.unitNatIso` (`CategoryTheory/Monoidal/Closed/Basic.lean`): the
  identity functor is isomorphic to the internal hom out of the monoidal unit, which in `Rep k G` is
  `Rep.trivial k G k`; `HomologicalComplex.homologyFunctor`; `CategoryTheory.HasProjectiveDimensionLE`
  and `CategoryTheory.Abelian.Ext` (`ModuleCat k` has `Ext` groups,
  `Algebra/Category/ModuleCat/Ext/HasExt.lean`). Used in 5.2.
- `tateCohomology`, `TateCohomology.isoGroupCohomology`, `TateCohomology.isoGroupHomology`
  (`…/TateCohomology/Basic.lean`): Tate cohomology of a finite group, defined for `[Fintype G]`;
  the comparison `isoGroupCohomology n` needs `n ≠ 0`.
- `continuousCohomology`, `TopRep.homogeneousCochains` (`…/ContCohomology/Basic.lean`): continuous
  cohomology of a topological group as the cohomology of invariant iterated function spaces; its
  module docstring records the comparison with `groupCohomology` for discrete groups as missing.
- `Rep.indCoindIso` (`RepresentationTheory/FiniteIndex.lean`): for a subgroup `S ≤ G` of finite
  index and `A : Rep k S`, the isomorphism `Ind_S^G A ≅ Coind_S^G A`. Used in 7.1.
- `Rep.ihom`, `Rep.ofMulAction`, `Rep.ofHom` (`RepresentationTheory/Rep/Basic.lean`): internal
  Hom, permutation representations, and the morphism of representations given by an intertwining
  map. `Rep.res` (`RepresentationTheory/Rep/Res.lean`): restriction along a group homomorphism,
  the object of `Rep.resFunctor`. `Rep.quotientToInvariantsFunctor`
  (`RepresentationTheory/Invariants.lean`) and `Rep.quotientToCoinvariantsFunctor`
  (`RepresentationTheory/Coinvariants.lean`): for a normal subgroup `S`, the invariants and the
  coinvariants of `S` as representations of `G ⧸ S`, in degree `0` only.
- `Rep.standardComplex` (`RepresentationTheory/Homological/Resolution.lean`): the complex of
  `Rep.standardResolution`, defined as the alternating face map complex of the simplicial object
  of `Rep k G` obtained by applying the monoidal functor `Rep.linearization`
  (`RepresentationTheory/Rep/Basic.lean`) to `classifyingSpaceUniversalCover G`, the simplicial
  `G`-set with `n`-simplices `G^{n+1}`. `SSet.chainComplex`
  (`AlgebraicTopology/SimplicialSet/Homology/Basic.lean`): the simplicial chain complex of a
  simplicial set with coefficients in an object `R`. For the underlying simplicial set of
  `classifyingSpaceUniversalCover G` and `R = k` its terms are `⊕_{G^{n+1}} k`, and the canonical
  isomorphisms `⊕_{G^{n+1}} k ≅ k[G^{n+1}]` identify it with the underlying complex of `k`-modules
  of `Rep.standardComplex`; that comparison is made in 5.1. Used in 4.4 and 5.1.
- `HomologicalComplex₂`, `HomologicalComplex₂.total`, `DerivedCategory`, `QuaternionGroup`,
  `Sylow`, `IsPGroup`, `Nat.Prime`, `DoubleCoset.Quotient`, `DoubleCoset.mk`, `Monoid.PushoutI`,
  `HNNExtension`, `FreeGroup`, `Monoid.Coprod` with its inclusions `Monoid.Coprod.inl` and
  `Monoid.Coprod.inr`, `IsCyclic`, `IsAddCyclic`, `IsMulCommutative`, `GroupExtension`,
  `ComplexShape.embeddingDownNat` (chain complexes indexed by `ℕ` as cochain complexes in degrees
  `≤ 0`),
  `Abelianization`, `AddCircle`, `exteriorPower` (written `⋀[R]^n M`), `commutator` (`⁅⊤, ⊤⁆`),
  `MulAut.conj`,
  `Subgroup.comap`, `Subgroup.subgroupOf`, `Set.BijOn`, `finsum`, `List.TFAE`.
- `AddCommGroup.primaryComponent` (`GroupTheory/Torsion.lean`): for a commutative additive group
  `A` and `p : ℕ`, the subgroup of elements `x` with `p ^ k • x = 0` for some `k`
  (`AddCommGroup.mem_primaryComponent`), the `p`-primary part `A(p)` of the Conventions.
  `Module.Free` (a module with a basis) and `Nat.factorization` (the exponent of `p` in `|G|`, so
  that `|G|_p = p ^ (Nat.card G).factorization p`). Used in 8.1 and 8.5.
- `tateCohomologyFunctor` (`…/TateCohomology/Basic.lean`): Tate cohomology as a functor of the
  coefficients, through which the maps induced by the evaluation `M ⊗ Hom(M, A) ⟶ A` and the unitor
  `M ⊗ ℤ ≅ M` act; `CategoryTheory.ihom` and `CategoryTheory.ihom.ev` for the closed monoidal
  structure of `Rep k G` (`RepresentationTheory/Rep/Basic.lean`), whose internal hom is `Hom_k(M, N)`
  with `g` acting by `f ↦ g ∘ f ∘ g⁻¹` and whose evaluation is `m ⊗ f ↦ f(m)`.
- `AlgebraicTopology.DoldKan.homotopyEquivNormalizedMooreComplexAlternatingFaceMapComplex`,
  `AlgebraicTopology.inclusionOfMooreComplexMap` (`AlgebraicTopology/DoldKan/HomotopyEquivalence.lean`,
  `AlgebraicTopology/AlternatingFaceMapComplex.lean`):
  the normalized Moore complex is a deformation retract of the alternating face complex, used for
  normalized cochains in 6.1.

### From Tau Ceti

- `TauCeti.groupCohomology.corestriction` with `map_subtype_id_comp_corestriction`,
  `map_comp_corestriction`, `δ_comp_corestriction` and `corestriction_trans`
  (`RepresentationTheory/Homological/GroupCohomology/Corestriction.lean`): corestriction for a
  subgroup of finite index, `cor ∘ res = [G : H]`.
- `TauCeti.groupHomology.transfer`, `TauCeti.groupHomology.transfer_comp_map_subtype_id`,
  `TauCeti.groupHomology.map_comp_transfer` (`…/GroupHomology/Transfer/Basic.lean`): the transfer
  `Hₙ(G, M) → Hₙ(H, M)` for `H` of finite index, with `cor ∘ tr = [G : H]` and naturality in `M`
  for morphisms of representations.
- `TauCeti.groupCohomology.coindIso_hom`, `TauCeti.groupCohomology.map_unit_comp_coindIso_hom`
  (`…/GroupCohomology/Shapiro.lean`), `TauCeti.groupCohomology.coindIso_hom_comp_corestriction`
  (`…/GroupCohomology/Corestriction.lean`), `TauCeti.groupHomology.indIso_inv`,
  `TauCeti.groupHomology.indIso_inv_comp_map_counit` (`…/GroupHomology/Shapiro.lean`) and
  `TauCeti.groupHomology.transfer_comp_indIso_inv` (`…/GroupHomology/Transfer/Basic.lean`): for
  `S ≤ G`, Shapiro's isomorphism `Hⁿ(G, Coind_S^G A) ≅ Hⁿ(S, A)` is restriction to `S` followed by
  evaluation at `1`, and the inverse of `Hₙ(G, Ind_S^G A) ≅ Hₙ(S, A)` is the map along `S ≤ G`
  induced by the unit `a ↦ 1 ⊗ a`. Read through these isomorphisms, restriction is induced by the
  unit `B ⟶ Coind_S^G Res B` and homological corestriction by the counit `Ind_S^G Res B ⟶ B`; for
  `S` of finite index, corestriction is induced by the trace `Coind_S^G Res B ⟶ B` and the transfer
  by the unit `B ⟶ Ind_S^G Res B`. Used in 1.4, 3.5 and 7.1.
- `TauCeti.groupCohomology.HInfRes_exact`, `TauCeti.groupCohomology.mono_HInfRes_f`
  (`…/GroupCohomology/InflationRestriction.lean`): exactness of
  `Hⁿ⁺¹(G ⧸ N, M^N) → Hⁿ⁺¹(G, M) → Hⁿ⁺¹(N, M)` and injectivity of inflation when
  `Hⁱ(N, M) = 0` for `0 < i ≤ n`.
- `TauCeti.groupCohomology.eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero`
  (`…/GroupCohomology/Sylow.lean`): for finite `G`, a `p`-primary class restricting to zero on a
  Sylow `p`-subgroup vanishes.
- `TauCeti.TateCohomology.cup`, `TauCeti.TateCohomology.cup_assoc`,
  `TauCeti.TateCohomology.cup_gradedComm`, `TauCeti.TateCohomology.cup_projection`,
  `TauCeti.TateCohomology.cup_res`, `TauCeti.TateCohomology.cup_left_unit`,
  `TauCeti.TateCohomology.cup_right_unit`, `TauCeti.TateCohomology.cup_δ_of_leftInverse`,
  `TauCeti.TateCohomology.cup_δ_of_flat`, `TauCeti.TateCohomology.δ_cup_of_leftInverse`
  (`…/TateCohomology/Cup/`): the Tate cup product of a finite group in all integer bidegrees, for
  the pairing `M ⊗ N`, with the class of `1 ∈ Ĥ⁰(G, k)` as a unit on both sides and the sign
  `x ∪ δy = (−1)^p δ(x ∪ y)` for `x` of degree `p`. The rule in the second variable holds for every
  `M` when the first map of the short exact sequence has a `k`-linear retraction
  (`cup_δ_of_leftInverse`), and for every short exact sequence when `M` is flat over `k`
  (`cup_δ_of_flat`); the rule `δ(x ∪ y) = δx ∪ y` in the first variable holds when the first map
  has a `k`-linear retraction (`δ_cup_of_leftInverse`).
- `Rep.isZero_res_of_projective`, `Rep.isZero_res_tensor_of_projective`,
  `Rep.projective_of_isZero_res` (`…/TateCohomology/Projective/Basic.lean`), the Nakayama–Rim
  interface recorded by ClassFieldTheory Layer 0: if the `k[G]`-module of `P` is projective, then
  `Ĥⁿ(S, P) = 0` and, for every representation `M`, `Ĥⁿ(S, M ⊗ P) = 0`, for every finite subgroup
  `S` of `G` and every `n ∈ ℤ`, `k` any commutative ring; conversely, for `G` finite and `k` a
  domain of characteristic zero in which every prime number is a unit or generates a maximal ideal
  (for instance `ℤ`), a cohomologically trivial representation whose underlying `k`-module is
  projective is projective over `k[G]`. Used in 8.3.
- `TauCeti.TateCohomology.δ_bijective_of_isZero_X₂` (`…/TateCohomology/HomologySequence.lean`):
  for a short exact sequence `0 → X₁ → X₂ → X₃ → 0` of representations of a finite group with
  `Ĥⁿ(G, X₂) = Ĥⁿ⁺¹(G, X₂) = 0`, the connecting map `Ĥⁿ(G, X₃) → Ĥⁿ⁺¹(G, X₁)` is bijective.
  Used in 8.3.
- `Rep.shortExact_map_tensorLeft_of_leftInverse` (`RepresentationTheory/Rep/TensorShortExact.lean`):
  an exact sequence `X₁ → X₂ → X₃ → 0` of representations whose first map has a `k`-linear
  retraction becomes short exact after `M ⊗ −`, for every representation `M`. Used in 8.3.
- `Submodule.free_of_isPrincipalIdealRing` (`LinearAlgebra/FreeModule/PID.lean`): over a principal
  ideal domain every submodule of a free module is free, of any rank. Used in 8.3.
- `TauCeti.TateCohomology.map`, `TauCeti.TateCohomology.mapIso`,
  `TauCeti.TateCohomology.map_comp_isoGroupCohomology_hom`,
  `TauCeti.TateCohomology.map_comp_isoGroupHomology_hom`, `TauCeti.TateCohomology.δ_comp_map`
  (`…/TateCohomology/Functoriality.lean`):
  for finite groups `G`, `H`, an isomorphism `e : G ≃* H`, `M : Rep k G`, `N : Rep k H` and a
  `k`-linear map `φ : M → N` with `φ ∘ ρ(x) = σ(e x) ∘ φ` for every `x ∈ G`, the induced map
  `Ĥⁿ(G, M) → Ĥⁿ(H, N)` for every `n ∈ ℤ`, an isomorphism when `φ` is a linear equivalence; through
  `TateCohomology.isoGroupCohomology` and `TateCohomology.isoGroupHomology` it is
  `groupCohomology.map` along `e.symm` in degrees `n ≥ 1` and `groupHomology.map` along `e` in
  degrees `n ≤ −2`; it commutes with the connecting maps of short exact sequences related by
  compatible pairs. Used in 1.1 and 7.2.
- `TauCeti.TateCohomology.res`, `TauCeti.TateCohomology.cor`, `TauCeti.TateCohomology.res_comp_cor`,
  `TauCeti.TateCohomology.δ_comp_res` (`…/TateCohomology/Restriction/AllDegrees.lean`,
  `…/Restriction/Delta.lean`) and `Subgroup.fintypeOfFinite` (`Algebra/Group/Subgroup/Finite.lean`):
  for a finite group `G`, `H ≤ G` and `M : Rep k G`, restriction `Ĥⁿ(G, M) → Ĥⁿ(H, M)` and
  corestriction `Ĥⁿ(H, M) → Ĥⁿ(G, M)` in every degree `n ∈ ℤ`; restriction is the inclusion of
  invariants in degree `0`, the relative transfer on norm kernels in degree `−1`, ordinary
  restriction in degrees `≥ 1` and the homological transfer in degrees `≤ −2`; corestriction after
  restriction is `[G : H]`, and restriction commutes with connecting maps. Subgroups of a finite
  group carry the `Fintype` structure `Subgroup.fintypeOfFinite`, which is not a global instance.
  Used in 7.2.
- `TauCeti.TateCohomology.characterConnectingClass`,
  `TauCeti.TateCohomology.cup_characterConnectingClass_eq_groupCohomologyπEven`
  (`…/TateCohomology/Character.lean`, `…/Cup/Cyclic.lean`): for a finite cyclic group (in `Type`,
  commutative), the class `δχ ∈ Ĥ²(G, ℤ)` of a character with `χ(g) = 1/|G|`, and cup product with
  it on degree-zero classes.
- `Rep.FiniteCyclicGroup.periodicIso`, `Rep.FiniteCyclicGroup.periodicIsoOfGenerator`
  (`…/TateCohomology/Periodic.lean`): two-periodicity of Tate cohomology of a finite cyclic group,
  built from the periodic resolution: `Ĥᵐ(G, M) ≅ Ĥⁿ(G, M)` for `m ≡ n mod 2`, an isomorphism not
  stated to be a cup product. Used in 8.4.
- `TauCeti.TateCohomology.cup_bijective_of_forall_isPGroup_of_lTensor_injective`
  (`…/TateCohomology/Cup/TateNakayama.lean`): the Tate–Nakayama theorem, as recorded by
  ClassFieldTheory Layer 0: for a finite group `G`, `C : Rep ℤ G` and `u ∈ H²(G, C)` such that, for
  every subgroup `S` of prime-power order, `H¹(S, C) = 0`, `H²(S, C)` has `|S|` elements and is
  generated by the restriction of `u`, cup product with the Tate class of `u` is a bijection
  `Ĥʳ(G, M) → Ĥʳ⁺²(G, M ⊗ C)` for every `r ∈ ℤ` and every `M` with `M ⊗ X → M ⊗ Y` injective for
  every short exact sequence `0 → X → Y → C → 0` of abelian groups. Used in 8.4.
- `TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology`
  (`…/ContCohomology/DiscreteGroup.lean`): for finite `G : Type` with the discrete topology, an
  unnamed additive equivalence between continuous cohomology and `groupCohomology` in each degree;
  naturality is not proved there.
- `TauCeti.ContCohomology.explicitH1IsoGroupCohomology`, `TauCeti.ContCohomology.explicitH2IsoGroupCohomology`
  (`…/GroupCohomologyIso/Basic.lean`), `TauCeti.ContCohomology.transgression`,
  `TauCeti.ContCohomology.IsTransgressionLift`, `TauCeti.ContCohomology.fiveTerm_exact_H1N`
  (`…/ContCohomology/Transgression.lean`): the explicit comparisons in degrees `1, 2` and the
  profinite transgression.
- `TauCeti.TopPairing`, `TauCeti.TopPairing.cup` (`…/ContCohomology/Cup/Graded/Basic.lean`,
  `…/Cup/Cohomology.lean`): coefficient pairings of topological representations and the
  continuous cup product.
- `TauCeti.ContinuousCohomology.corestriction_mackey` (`…/Corestriction/Mackey/AllDegrees.lean`):
  the Mackey formula for profinite `G`, an open subgroup `U` and a closed subgroup `V`.
- `TauCeti.ContCohomology.continuousFiniteQuotientColimit`
  (`…/ContCohomology/FiniteQuotient/AllDegreeColimit.lean`): continuous cohomology of a profinite
  group as the colimit over its finite quotients.
- `CochainComplex.filtrationFunctor`, `CochainComplex.spectralSequence`,
  `CochainComplex.spectralSequenceFirstPageXIsoCokernel`, `CochainComplex.spectralSequence_first_page_d_eq`,
  `CochainComplex.filtrationAbutmentIso`, `CochainComplex.filtrationFunctorMap`
  (`Algebra/Homology/SpectralSequence/Filtered/`): the spectral sequence of an increasing
  filtration `F : ℤ → Subobject K` of a cochain complex, its first page and differential, the
  filtration of the abutment, naturality. Mathlib's page numbering starts at `2`; the object at
  `(p, q)` has filtration index `q` and total degree `p + q`, and for the decreasing filtration
  `F^s = F_{−s}` it is the classical `E^{s,t}` with `s = −q − 1`, `t = p + 2q + 1` (module
  docstring of `…/Filtered/FirstPage.lean`).
- `CochainComplex.filtrationSpectralSequencePageXIsoEInfty` (`…/Filtered/Stabilization.lean`) and
  `CategoryTheory.Abelian.SpectralObject.EInftyIsoCokernel` (`Algebra/Homology/SpectralObject/Abutment.lean`):
  on page `r ≥ 2` the object at `(p, q)`, `n = p + q`, is `E∞` as soon as `H^{n+1}(F_{q−r+2}) = 0`
  and `H^{n−1}(K / F_{q+r−1}) = 0`, and `E∞` is the graded piece `F_{q+1}Hⁿ / F_qHⁿ` of the
  abutment. No global bound `F_a = ⊥` is assumed, unlike
  `CochainComplex.filtrationSpectralSequencePageXIsoGradedOfFinite`.
- `HomologicalComplex₂.rowFiltrationSpectralSequence`, `HomologicalComplex₂.columnFiltrationSpectralSequence`,
  `HomologicalComplex₂.columnFiltrationAbutmentIso`, `HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`
  (`Algebra/Homology/SpectralSequence/Bicomplex.lean`, `Algebra/Homology/TotalComplex.lean`): the
  two spectral sequences of a first-quadrant homological bicomplex and the comparison of a
  bicomplex with exact augmented rows to its augmentation.
- `HomologicalComplex.homologyKunnethShortComplex_shortExact`, `HomologicalComplex.homologyKunneth`,
  `HomologicalComplex.homologyKunnethShortComplexSplitting`
  (`Algebra/Homology/Monoidal/Homology/Kunneth/`): the Künneth short exact sequence for chain
  complexes of modules over any commutative ring, indexed by `ℕ`, whose second factor has
  projective cycles and projective quotients by its cycles, and its splitting (not natural) when
  the cycles of the first factor split off its terms.
  `ChainComplex.projective_cycles_of_projective_homology`,
  `ChainComplex.isSplitMono_iCycles_of_projective_homology` (`Algebra/Homology/Split.lean`): in a
  chain complex indexed by `ℕ` with projective terms and projective homology, the cycles are
  projective and split off the terms. `HomologicalComplex.homologyCross`
  (`…/Monoidal/Homology/Cross.lean`): the cross product `[z] ⊗ [w] ↦ [z ⊗ w]`, natural in both
  complexes. Used in 5.1.
- `HomologicalComplex.projective_cycles_of_hasProjectiveDimensionLE_one`,
  `HomologicalComplex.projective_cokernel_iCycles_of_hasProjectiveDimensionLE_one`
  (`Algebra/Homology/HomologicalComplex/Projective/Dimension.lean`) and
  `HomologicalComplex.isSplitMono_iCycles_of_projective` (`Algebra/Homology/Split.lean`): when every
  object has projective dimension at most one, a projective term has projective cycles, its
  quotient by them is projective when the next term is, and then the cycles split off.
  `CochainComplex.exists_quasiIso_projective` (`Algebra/Homology/CochainComplex/ProjectiveResolution.lean`):
  with enough projectives, a cochain complex strictly bounded above by `n` receives a
  quasi-isomorphism from a complex of projectives strictly bounded above by `n`.
  `CochainComplex.isKFlat_of_boundedAbove_flat` and `CochainComplex.quasiIso_id_tensorHom`
  (`Algebra/Homology/Monoidal/KFlat/Basic.lean`): a strictly bounded-above complex with flat terms
  is K-flat, and tensoring a quasi-isomorphism with a K-flat complex gives a quasi-isomorphism.
  Used for the splitting in 5.1.
- `TauCeti.ChainComplex.extToHomology`, `TauCeti.ChainComplex.exact_extToHomology_kronecker`,
  `TauCeti.ChainComplex.extToHomology_injective` (`Algebra/Homology/UniversalCoefficient/Basic.lean`):
  the cohomological universal coefficient sequence: for a chain complex `X` and an object `Y` of a
  `k`-linear abelian category, when the cycles `Zⱼ` are projective and split off `Xⱼ`, the map
  `Ext¹(Hⱼ(X), Y) → Hʲ⁺¹(Hom(X, Y))` sending the class of `β : Bⱼ → Y` to the class of
  `Xⱼ₊₁ → Bⱼ → Y`, injective, with image the kernel of the Kronecker map.
  `ModuleCat.hasProjectiveDimensionLE_one_of_isPrincipalIdealRing`
  (`Algebra/Category/ModuleCat/Projective/Dimension.lean`): every module over a principal ideal
  domain has projective dimension at most one. Used in 5.2.
- `TauCeti.ChainComplex.cupCochain`, `TauCeti.ChainComplex.d_comp_cupCochain`,
  `TauCeti.ChainComplex.cup` (`Algebra/Homology/Monoidal/Cup.lean`): for chain complexes `A`, `B`,
  `E` indexed by `ℕ` in a `k`-linear monoidal category, a chain map `D : E ⟶ A ⊗ B` (a diagonal)
  and a pairing `μ : M ⊗ N ⟶ P`, the cup product of cochains `φ ⌣ ψ = μ ∘ (φ ⊗ ψ) ∘ D_n`, with no
  sign beyond the Koszul signs of `A ⊗ B`; its Leibniz rule
  `(φ ⌣ ψ) ∘ d = (φ ∘ d) ⌣ ψ + (−1)^p φ ⌣ (ψ ∘ d)`; and, in an abelian category, the induced
  bilinear map on the cohomology of the complexes `Hom(A, M)`, `Hom(B, N)`, `Hom(E, P)`. In
  `Rep k G` (which carries Mathlib's `MonoidalLinear` structure) with `A = B = E = X` a projective
  resolution of `k` and `D` a diagonal approximation, the complexes `Hom(X, −)` are those of
  `groupCohomologyIso`. Used in 4.4.
- `TauCeti.ChainComplex.capChain`, `TauCeti.ChainComplex.capChain_comp_d`,
  `TauCeti.ChainComplex.cap` (`Algebra/Homology/Monoidal/Cap.lean`): for a diagonal
  `D : E ⟶ A ⊗ B` and an action `a : M ⊗ B ⟶ B′` in one `k`-linear monoidal category, the cap
  product `E_n ⟶ B′_q` of a cochain `φ : A_p ⟶ M`, which applies `φ` to the first factor of `D`
  (the front face, for the Alexander–Whitney map); its boundary formula
  `∂(x ⌢ φ) = (−1)^p (∂x ⌢ φ − x ⌢ (φ ∘ ∂))`; and its descent to the homology of `E` and `B′` in
  that category. In `Rep k G` that homology is not group homology, so 4.6 uses the chain-level
  product and passes to coinvariants; 4.6 evaluates on the back face, and the sign relating the two
  faces is fixed there.
- `CategoryTheory.SimplicialObject.alexanderWhitney`, `CategoryTheory.SimplicialObject.alexanderWhitney_f`,
  `CategoryTheory.SimplicialObject.alexanderWhitney_naturality`,
  `CategoryTheory.SimplicialObject.alexanderWhitney_coassoc`
  (`AlgebraicTopology/SimplicialObject/AlexanderWhitney.lean`): for simplicial objects `A`, `B` of
  a preadditive monoidal category with finite coproducts in which the tensor product is additive in
  each variable, the chain map from the alternating face map complex of the degreewise tensor
  product `A ⊗ B` to the tensor product of the alternating face map complexes of `A` and `B`, in
  degree `n` the sum over `p + q = n` of the front `p`-face of `A` (vertices `0, …, p`) tensored
  with the back `q`-face of `B` (vertices `p, …, n`), for Mathlib's sign
  `d(a ⊗ b) = da ⊗ b + (−1)^p a ⊗ db`; it is natural in `A` and `B` and coassociative. `Rep k G`
  meets the hypotheses (Mathlib's `MonoidalPreadditive` and colimit instances on `Rep`). Used in
  4.4.
- `SSet.shuffle`, `SSet.shuffle_naturality`,
  `SSet.ιChainComplex_tensorHom_ιChainComplex_shuffle_f_zero`,
  `SSet.ιChainComplex_tensorHom_ιChainComplex_shuffle_f_one_one`
  (`AlgebraicTopology/SimplicialSet/Shuffle.lean`), `SSet.alexanderWhitney`
  (`…/SimplicialSet/AlexanderWhitney.lean`) and `SSet.eilenbergZilberHomotopyEquiv`
  (`…/SimplicialSet/EilenbergZilber.lean`): for simplicial sets `K`, `L` and objects `R`, `S` of a
  preadditive monoidal category with coproducts preserved by tensoring on either side (such as
  `ModuleCat k`), the shuffle map `C(K; R) ⊗ C(L; S) ⟶ C(K × L; R ⊗ S)` of simplicial chains
  (`SSet.chainComplex`), natural in `K` and `L`, sending a pair of vertices `(x, y)` to the vertex
  `(x, y)` and a pair of `1`-simplices `(x, y)` to `(s₁x, s₀y) − (s₀x, s₁y)`; and the
  Eilenberg–Zilber theorem: the Alexander–Whitney map `C(K × L; R ⊗ S) ⟶ C(K; R) ⊗ C(L; S)` and the
  shuffle map are inverse chain homotopy equivalences, by homotopies natural in `K` and `L`. These
  are maps of complexes of objects of that category (of `k`-modules), not of representations;
  equivariance for groups acting on `K` and `L` by simplicial maps is not stated there and is read
  off the naturality. Used in 5.1.
- `TauCeti.ChainComplex.kronecker`, `TauCeti.ChainComplex.kroneckerSection`,
  `TauCeti.ChainComplex.kronecker_surjective_of_isSplitMono`,
  `TauCeti.ChainComplex.kronecker_bijective_of_isIso` (`Algebra/Homology/Kronecker.lean`) and
  `TauCeti.ChainComplex.linearYonedaFunctor` (`Algebra/Homology/LinearYoneda.lean`): for a chain
  complex `X` and an object `Y` of a `k`-linear abelian category, the map
  `Hⁱ(Hom(X, Y)) → Hom(Hᵢ(X), Y)` sending the class of a cocycle to its values on cycles, with a
  `k`-linear right inverse when the cycles split off `Xᵢ` and bijective when no differential leaves
  degree `i`; and `X ↦ Hom(X, Y)` as a functor on the opposite category of chain complexes.
  `HomologicalComplex.coinvariantsTensorObjLinearYonedaObjIso` and `Rep.groupCohomologyIhomIso`
  (`RepresentationTheory/Homological/GroupCohomology/CoinvariantsTensor.lean`): for `A : Rep k G`,
  a `k`-module `N` and a chain complex `P` of representations, the isomorphism
  of cochain complexes `Hom((A ⊗ P)_G, N) ≅ Hom_G(P, Hom_k(A, N))`, and, for a projective
  resolution `P` of `k`, `Hⁿ(G, Hom_k(A, N)) ≅ Hⁿ(Hom((A ⊗ P)_G, N))`, where `(A ⊗ P)_G` is the
  complex of `groupHomologyIso`. Used in 4.6 and 5.2.
- `MonoidHom.groupHomologyIso_hom_naturality`, `MonoidHom.groupCohomologyIso_hom_naturality`
  (`RepresentationTheory/Homological/GroupHomology/ChangeOfGroups.lean`,
  `…/GroupCohomology/ChangeOfGroups.lean`): for a group homomorphism, a compatible coefficient map
  and an augmentation-preserving chain map between projective resolutions, `groupHomologyIso` and
  `groupCohomologyIso` carry `groupHomology.map` and `groupCohomology.map` to the maps induced on
  the resolutions. Used in 2.1 and 6.4.
- `TauCeti.indTrivialIso`, `TauCeti.indResProjection` (`RepresentationTheory/Induction/Permutation.lean`):
  `Ind_H^G k ≅ k[G ⧸ H]` and `Ind_H^G Res M ≅ k[G ⧸ H] ⊗ M`.
- `TauCeti.indProjection` (`RepresentationTheory/Induction/Projection.lean`): the projection
  formula, for a homomorphism `φ : G' →* G`, `X : Rep k G'` and `Y : Rep k G`, the isomorphism
  `Ind_φ(X ⊗ Res_φ Y) ≅ Ind_φ X ⊗ Y` in `Rep k G`, over any commutative ring, sending
  `⟦g ⊗ (x ⊗ y)⟧` to `⟦g ⊗ x⟧ ⊗ g⁻¹·y` and natural in `X` and `Y`; for `φ` the inclusion of `H` and
  `X = k` it is `TauCeti.indResProjection`. Used in 1.4.
- `Rep.mackeyDecomposition`, `Rep.mackeyDecompositionNatIso`
  (`RepresentationTheory/Induction/Mackey/Decomposition.lean`): for subgroups `H`, `K` of any group
  `G` and `A : Rep k H`, the isomorphism `Res_K Ind_H^G A ≅ ⊕_{KsH ∈ K\G/H} Ind_{K ∩ sHs⁻¹}^K(ˢA)` in
  `Rep k K`, `s` the chosen representative of each double coset and `ˢA` the restriction of `A`
  along `y ↦ s⁻¹ys : K ∩ sHs⁻¹ → H`, natural in `A`, with no finiteness hypothesis. Nothing is
  assumed of coinduction. Used in 7.1.
- `Rep.dimensionShiftUp`, `Rep.dimensionShiftDown` (`RepresentationTheory/Induction/DimensionShift.lean`)
  and `groupHomology.isZero_indBot_succ` (`…/GroupHomology/Induced.lean`): the dimension-shifting
  sequences `0 → A → Coind_1^G A → A′ → 0` and `0 → A″ → Ind_1^G A → A → 0`, short exact after
  restriction to any subgroup, and the acyclicity of modules induced from the trivial subgroup.
- `TauCeti.isZero_groupHomology_freeGroup` (`AlgebraicTopology/ClassifyingSpace/WedgeCircles.lean`):
  for `S : Type`, a commutative ring `k : Type` and `n ≥ 2`, `Hₙ(FreeGroup S, k) = 0` with trivial
  coefficients `k`, proved through the wedge of circles indexed by `S`. It is the
  trivial-coefficient homological case of 3.6 for `S, k : Type`. Used in 6.8 with `k = ℤ`, `n = 2`.
- `groupHomology.exists_map_subtype_eq` (in Mathlib's namespace `groupHomology`) and
  `TauCeti.groupHomology.isZero_groupHomology_of_directed`
  (`RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean`): for a nonempty directed
  family of subgroups `S i` of `G` with supremum `⊤` and `A : Rep k G`, every class of `Hₙ(G, A)`
  is the image of a class of some `Hₙ(S i, A)` under the map induced by the inclusion, and
  `Hₙ(G, A) = 0` when every `Hₙ(S i, A)` is zero. The injectivity half of the colimit
  identification is not proved there (its module docstring says so); it is taken from
  SchemeKTheoryOperations §6.7. Used in 5.4.
- `TauCeti.SerreGraph`, `TauCeti.SerreGraph.IsTree` (`Combinatorics/Graph/Serre/`): Serre graphs
  and trees.
- `TauCeti.FactorSet.cohomologyClass`, `TauCeti.GroupExtension.cohomologyClass_factorSet_eq`
  (`GroupTheory/GroupExtension/Cohomology.lean`): for `G M : Type` with `M` abelian, the class in
  `H²(G, M)` of the factor set `(x, y) ↦ σ(x)σ(y)σ(xy)⁻¹` of a section with `σ(1) = 1` of an
  extension inducing the given action, and its independence of the section. Used for the integral
  class `c` of the Conventions.

### From TauCetiRoadmap.DerivedModuleAlgebra

- §S.1 (*The spectral sequence of a first-quadrant double complex*): for a first-quadrant double
  complex in an abelian category, the column-filtration spectral sequence
  `E₂^{pq} = H^p_I(H^q_II) ⇒ Hⁿ(Tot)`, its convergence and stabilisation bound, the edge
  morphisms, the five-term and extended sequences, the exact-rows comparison and naturality; and
  the homological form with `E²_{p,q} = H_p(H_q(C))` abutting to `H_{p+q}(Tot C)`.
- What DerivedModuleAlgebra must provide (gap:homological-low-degree): in §S.1, for a
  first-quadrant homological double complex `C`, the edge morphisms `H_n(Tot C) → E²_{n,0}` and
  `E²_{0,n} → H_n(Tot C)` and the exact five-term sequence
  `H₂(Tot C) → E²_{2,0} → E²_{0,1} → H₁(Tot C) → E²_{1,0} → 0`. §S.1 states the edge
  morphisms and the five-term sequence in cohomological indexing; its homological form stops at
  the second page and convergence. Targets 6.3, 6.4 and 6.7 use them.

### From TauCetiRoadmap.SpectralSequencesAndConvergencePartII

- §4.3 (*The Künneth spectral sequence*): for a commutative ring `R` and complexes `K`, `L` of
  `R`-modules represented by bounded-above complexes, the spectral sequence
  `E₂^{p,q} = ⊕_{i+j=q} Tor^R_{−p}(Hⁱ(K), Hʲ(L)) ⇒ H^{p+q}(K ⊗^L L)`, converging strongly with finite
  filtrations and natural in `K` and `L` from page `2`; its edge map
  `E₂^{0,n} → Hⁿ(K ⊗^L L)` is the cross product (Tau Ceti `HomologicalComplex.homologyCross`,
  `Algebra/Homology/Monoidal/Homology/Cross.lean`, on representatives); its abutment is
  `Hⁿ(Tot(K ⊗ L))` when `K` is a bounded-above complex of flat modules; and, when `Tor^R_i = 0` for
  `i ≥ 2`, its two columns give the exact sequence
  `0 → ⊕_{i+j=n} Hⁱ(K) ⊗ Hʲ(L) → Hⁿ(K ⊗^L L) → ⊕_{i+j=n+1} Tor^R_1(Hⁱ(K), Hʲ(L)) → 0`. A chain
  complex indexed by `ℕ` is read as a cochain complex in degrees `≤ 0`, so it is bounded above,
  `Hⁱ` is `H_{−i}`, and in homological degree `m = −n` the index sets read `p + q = m` and
  `p + q = m − 1`. No splitting is assumed. Used in 5.1.
- What SpectralSequencesAndConvergencePartII must provide (gap:flat-kunneth): in §4.3, for a
  commutative ring `R` with `Tor^R_i = 0` for `i ≥ 2` and complexes `K`, `L` of `R`-modules
  represented by bounded-above complexes, that the two-column exact sequence above, whose first map
  is the edge map (the cross product), is natural in `K` and `L`. §4.3 states the spectral sequence
  natural from page `2` and the two-column sequence, but not the naturality of that sequence. It
  follows by reading the sequence off `E₂ = E_∞` and the induced filtration of the abutment: a map
  `P → P′` of Cartan–Eilenberg resolutions lifting `K → K′` preserves their rows, so with `L → L′`
  it induces a filtered map `Tot(P) ⊗ L → Tot(P′) ⊗ L′`. Target 5.1 uses it.
- §5.2 (*Pairings of filtered complexes*): for a commutative ring `R`, decreasingly filtered
  cochain complexes `A`, `B`, `C` of `R`-modules and a chain map `φ : A ⊗ B → C` from the tensor
  product with the sign `d(x ⊗ y) = dx ⊗ y + (−1)^{|x|} x ⊗ dy`, with `φ(F^pA ⊗ F^{p′}B) ⊆ F^{p+p′}C`:
  pairings `E_r^{p,q}(A) ⊗ E_r^{p′,q′}(B) → E_r^{p+p′,q+q′}(C)` for every `r ≥ 1`, with
  `d_r(xy) = d_r(x)y + (−1)^{p+q} x d_r(y)` and the pairing of page `r + 1` induced by that of page
  `r`; on page `1` the pairing induced by `φ` on the cohomology of the graded pieces; at every
  position where the three spectral sequences converge through their canonical presentations (in
  particular when the filtrations are finite in the degrees concerned), the pairing of limit pages
  induced on graded pieces by `H(A) ⊗ H(B) → H(C)`, which respects the induced filtrations; and
  naturality in filtered maps compatible with the pairings. Its spectral sequence of a decreasingly
  filtered complex is Tau Ceti's `CochainComplex.spectralSequence` for `F_t = F^{−t}`, the classical
  `E_r^{p,q}` being the object at `(2p + q + 1, −p − 1)` on page `r + 1`, the indexing of 6.2. Used
  in 6.5.
- Layers 2 and 3 are cited in Scope and ownership only; nothing is consumed from them.

### From TauCetiRoadmap.ProfiniteCohomology

- §3.1 and §3.2: the explicit low-degree models and their comparisons with `groupCohomology`
  (discrete groups) and with `continuousCohomology`, in degrees `0, 1, 2`.
- §5.5: the five-term sequence and transgression for profinite `G` and closed normal `N`.
- §6.4 and §10.5: the Mackey double-coset formula and its `S₃` Check.
- §10.1: the all-degree finite-quotient colimit description of continuous cohomology.
- Layer 12: the graded cup product in all degrees, `TauCeti.TopPairing.cup`.

### From TauCetiRoadmap.ClassFieldTheory

- Layer 0 (§0.1): Tate cohomology with restriction, corestriction and the Tate cup product,
  cohomological triviality written out, Tate–Nakayama, and the Nakayama–Rim theorem; the Tau Ceti
  declarations it records are consumed directly, under "From Tau Ceti".

### From TauCetiRoadmap.FreeGroupsAndLimitGroups

- §4.5: the segment and loop graphs of groups are Mathlib's `Monoid.PushoutI` and `HNNExtension`.
- §4.6: `G`-trees, Serre trees with an action of `G` without inversions.
- §4.7: the Bass–Serre tree of a graph of groups, its vertex and edge stabilisers and its quotient
  graph; for a graph of groups with trivial groups, the universal cover of the graph.
- §§4.1–4.2 and §2.2: graphs of groups and their fundamental groups; the fundamental group of the
  rose with trivial groups is free on its petals.
- §4.8: the structure theorem for a group acting on a tree without inversions, with its instance
  that `SL(2, ℤ)` acting on its Bass–Serre tree recovers the amalgam `ℤ/4 ∗_{ℤ/2} ℤ/6`; cited for
  that amalgam in a Check of 3.6.

### From TauCetiRoadmap.AlgebraicTopology

- §5.3: for a surjective finite regular cover `p : E → B` with deck group `G` and a module `M` of
  constant coefficients, the identification of the quotient chains `C_*(E; M)_G` with `C_*(B; M)`
  through `p_*`, and the Cartan–Leray spectral sequence `H_p(G; H_q(E; M)) ⇒ H_{p+q}(B; M)`,
  compared with 3.3 in a Check; nothing is assumed of coefficients with a nontrivial deck action;
  §5.4: the homology of the torus `Tⁿ` as the exterior algebra on its first homology, compared with
  the Pontryagin ring of `ℤⁿ` in a Check of 5.4.

### From TauCetiRoadmap.StableHomotopyKTheory

- §3.29: for a perfect group `P` with a free presentation `1 → R → F → P → 1`, the identification
  of `(R ∩ [F, F])/[F, R]`, the kernel of the universal central extension `[F, F]/[F, R] → P`, with
  `H₂(P; ℤ)`, natural under presentation comparisons; no particular map is assumed. Compared with
  6.8 in a Check.

### From TauCetiRoadmap.K2SymbolsBrauer

- §1.1 (*The bar-calibrated kernel identification*): for a free presentation `F → G` with kernel
  `R` and the inhomogeneous differential `d[a|b] = [b] − [ab] + [a]`, the normalisation of the Hopf
  map `H₂(G, ℤ) → R ⧸ ⁅F, R⁆` as the connecting map sending the class of a 2-cycle to the boundary
  of a lift, with the relative 1-cycle `[a] − [b]` (`a`, `b` of equal image in `G`) read as `ab⁻¹`; its
  value `⁅s, t⁆⁻¹` on the ordered torus cycle `[s|t] − [t|s]` of `ℤ² = ⟨s, t | ⁅s, t⁆⟩`; and its
  naturality under maps of free presentations. Nothing is assumed of its existence, image or
  bijectivity for a general group, which §1.1 leaves to its supplier and 6.8 proves. Used in 6.8.

### From TauCetiRoadmap.SchemeKTheoryOperations

- §6.7, group hyperhomology: for a group `G` and a chain complex `C` of integral representations
  concentrated in degrees `≥ 0`, `H_n(G; C)` is the homology of the total complex of
  `P_q ⊗_G C_p` for a projective resolution `P` of `ℤ`, independent of `P`; it is functorial in
  compatible pairs, invariant under quasi-isomorphisms and equal to `H_n(G, M)` for `C = M` in
  degree `0`; it has the spectral sequences `E¹_{p,q} = H_q(G, C_p)` with `d¹ = H_q(G, ∂)` and
  `E²_{p,q} = H_p(G, H_q(C))`, both abutting to `H_{p+q}(G; C)`; it vanishes in degrees `≤ t`
  when `H_i(C) = 0` for `i ≤ t`; and for `C_p = ℤ[X]` with `X` transitive its first page is
  `H_q(Stab_G(x), ℤ)`. Compared with 2.1, 2.3 and 3.2.
- §6.7, directed unions: if `G` is the union of a directed family of subgroups `G_i` and
  `A : Rep k G`, the maps `H_m(G_i, A) → H_m(G, A)` induced by the inclusions identify `H_m(G, A)`
  with the colimit of the `H_m(G_i, A)`, for every `m ≥ 0`. Used in 5.4.

### From TauCetiRoadmap.K3BlochGroups

- §4.1: the reindexing of an integral complex bounded below by `b` to one in degrees `≥ 0`, with
  its total-complex sign comparisons; compared with 2.1.
- §5.2, for a finite group `G`: the stable-element theorem for `Hⁿ(G, ℤ_(r))` with a Sylow
  `r`-subgroup, compared with 7.2; the duality `H^{d+1}(G, ℤ) ≅ Hom(H_d(G, ℤ), ℚ/ℤ)` for `d ≥ 1`,
  natural in group homomorphisms, compared with 8.1; for `Q_{2^s}`, `s ≥ 3` (§5.2's targets
  quaternionPeriodicHomology and finiteGroup_period_fromSylow), the four-periodic free resolution
  with its integral homology `H_{4j+1} = (ℤ/2)²`, `H_{4j+3} = ℤ/2^s`, `H_{2j+2} = 0` (`j ≥ 0`), its
  period class `u ∈ Ĥ⁴(Q_{2^s}, ℤ)`, which generates `Ĥ⁴(Q_{2^s}, ℤ) ≅ ℤ/2^s`, and the
  invertibility of cup product with `u` in Tate cohomology (the `2`-primary stable period class,
  `Q_{2^s}` being its own Sylow `2`-subgroup). Invertibility gives `v ∈ Ĥ⁻⁴(Q_{2^s}, ℤ)` with
  `u ∪ v = 1`; with `TauCeti.TateCohomology.cup_assoc`, `TauCeti.TateCohomology.cup_gradedComm`
  and `TauCeti.TateCohomology.cup_left_unit`, `x ↦ u ∪ x` is then an isomorphism
  `Ĥⁿ(Q_{2^s}, M) → Ĥⁿ⁺⁴(Q_{2^s}, M)` with inverse `y ↦ v ∪ y`, for every `n ∈ ℤ` and every `M`.
  Used in a Check of 8.4 and in the Examples of Layer 8. And Swan's theorem (SwanPPeriod60
  Thms. 1 and 2; Hutchinson13 Thm. 3.1, p. 12): for an odd prime
  `r ∣ |G|` with a cyclic Sylow `r`-subgroup `P`, the `r`-period is `2·|N_G(P)/C_G(P)|`, and the
  `2`-period is `2` for a nontrivial cyclic Sylow `2`-subgroup and `4` for a generalised quaternion
  one. §5.2 uses the `r`-period without defining it, and Hutchinson13 p. 12 calls a period
  every `d ≥ 2` with `H_{d−1}(G, ℤ_(r))` cyclic of order `|G|_r`. Used in 8.4 and 8.5; 8.5 uses
  only that the period class of §5.2 exists, 8.4 also the minimality below.
- What K3BlochGroups must provide (gap:least-r-period): in §5.2 (finiteGroup_period_fromSylow), for
  a finite group `G` and a prime `r ∣ |G|` whose Sylow `r`-subgroup is cyclic or, for `r = 2`,
  generalised quaternion, that the `r`-period it computes (`2·|N_G(P)/C_G(P)|`, `2` or `4`) is the
  least `d ≥ 2` such that `H_{d−1}(G, ℤ_(r))` is cyclic of order `|G|_r`. Without minimality "the
  `r`-period" is not one number: for `S₃` and `r = 3`, `H₁(S₃, ℤ_(3)) = 0` while `H₃` and `H₇` are
  `ℤ/3`, so `d = 4` and `d = 8` both have the property, and the period is `4`. By §5.2's duality the
  least such `d` is the `p`-period of 8.4. Target 8.4 uses it.

### From TauCetiRoadmap.ArithmeticGaloisDuality

- §D7.2 (*Finite groups and products*, its statement on finite-group universal coefficients and
  Sylow detection): for a finite group `G`, every `n ≥ 0` (with `H₋₁ = 0`) and an abelian group
  `A` with trivial action, the exact sequence
  `0 → Hₙ(G, ℤ) ⊗ A → Hₙ(G, A) → Tor₁(Hₙ₋₁(G, ℤ), A) → 0`, split but not naturally;
  `H^{n+1}(G, ℤ) ≅ Ext¹(Hₙ(G, ℤ), ℤ)` for `n ≥ 0`; for a finite field `k` with trivial action, the
  identification of `Hⁿ(G, k)` with the `k`-linear dual of `Hₙ(G, k)` by evaluation; and, for a
  Sylow `ℓ`-subgroup `P` and a `G`-module `M`, every element of the `ℓ`-primary part of `Hₙ(G, M)`
  is the corestriction of an element of `Hₙ(P, M)`. Compared with 5.2 and 7.2; the routes of 5.2
  and 7.2 do not use it.

### From TauCetiRoadmap.InductionRestrictionPartII

- RS.6.8 (*The anti-diagonal model for abelian base groups*): for abelian groups `A, B : Type`, an
  isomorphism `H₂(A × B, ℤ) ≅ H₂(A, ℤ) ⊕ H₂(B, ℤ) ⊕ (A ⊗ B)` that restricts to the maps induced by
  the two inclusions on the first two summands and sends the class of
  `[(a, 1)|(1, b)] − [(1, b)|(a, 1)]` to `a ⊗ b`; and, for every abelian group `A : Type`, finite
  or not, an additive isomorphism from `⋀[ℤ]^2 (Additive A)` onto
  `groupHomology.H2 (Rep.trivial ℤ A ℤ)` (Mathlib's abbreviation of
  `groupHomology (Rep.trivial ℤ A ℤ) 2`) sending `a ∧ b` to the class `⟨a, b⟩` of `[a|b] − [b|a]`
  (its target abelian_multiplier_exteriorSquare). The second is the integral degree-two case of
  5.4, which identifies the degree-two part of `ψ` with it and does not prove it; the first
  is compared with 5.1.
- RS.0.3 (*Hall coinvariants of the multiplier*): for a normal subgroup `H` of a finite group `G`
  with `gcd(|H|, [G : H]) = 1`, corestriction induces an isomorphism from the coinvariants of `G`
  acting on `H₂(H, ℤ)` by conjugation onto the part of `H₂(G, ℤ)` primary to the primes dividing
  `|H|`. Compared with 7.2.
- RS.0.1 is cited in Scope and ownership only; nothing is consumed from it.

### From TauCetiRoadmap.MappingClassGroupsAndCanonicalRepresentations

- §1.1: for an extension `1 → N → G → Q → 1` of discrete groups and a `G`-module `M`, a spectral
  sequence `E₂^{p,q} = Hᵖ(Q, H^q(N, M)) ⇒ H^{p+q}(G, M)`, natural in the extension and in `M`; for a
  conjugation-invariant class of `H¹(N, M)`, a lift through a set-theoretic section `s : Q → G`,
  `s(1) = 1`, satisfying `TauCeti.ContCohomology.IsTransgressionLift`, whose descended coboundary
  `TauCeti.ContCohomology.IsTransgressionLift.cocycle` defines the transgression
  `tg : H¹(N, M)^Q → H²(Q, M^N)`; and exactness of
  `0 → H¹(Q, M^N) → H¹(G, M) → H¹(N, M)^Q →tg H²(Q, M^N) → H²(G, M)` with inflation, restriction,
  `tg` and inflation. Used in 6.2, 6.6, 6.7 and 6.9.

### From TauCetiRoadmap.IntegralIwasawaTheoryPartII

- §0.7: for a group `U` and a `ℂ_p[U]`-module `M` with `M^∨ = Hom_{ℂ_p}(M, ℂ_p)` and the
  contragredient action, the cap product `H^q(U, M^∨) × H_q(U, M) → ℂ_p` obtained by evaluating a
  homogeneous cocycle on a homogeneous chain. Compared with 4.6.
- §0.7, for a commutative ring `k`, a group `G`, `S ◁ G` and `M : Rep k G`: `H_q(S, M) = 0` for
  every `q > 0` when `M` is flat over `k[S]`; and, when `H_q(S, M) = 0` for every `q > 0`,
  coinflation `Hₙ(G, M) → Hₙ(G ⧸ S, M_S)` is an isomorphism for every `n`. Compared with 6.4.

## How to read the build

Layer 1 adds to the carriers what every later layer uses: conjugation, the action of a quotient
group on the (co)homology of a normal subgroup, additivity, permutation modules, and the named
comparison of continuous and discrete cohomology for a discrete group. Layer 2 extends the
integral group hyperhomology of SchemeKTheoryOperations §6.7 to coefficients in any `k` and to
hypercohomology, with the two spectral sequences from DerivedModuleAlgebra §S.1. Layer 3 applies
Layer 2 to complexes of permutation modules: orbit and free complexes, and the exact chain complex
of a tree, which gives the sequences of amalgams, HNN extensions and free groups without a spectral
sequence. Layer 4 builds cup and cap products for arbitrary pairings, connecting-map rules and
uniqueness before the identities that use them, and compares them with the library's Tate and
continuous cups. Layer 5 treats products of groups and abelian groups (Künneth, universal
coefficients before the cohomological Künneth theorem that uses them, Pontryagin ring). Layer 6
realises the Hochschild–Serre spectral sequence of MappingClassGroupsAndCanonicalRepresentations
§1.1 by the filtration of the cochains of `G` (and in homology through Layer 2), identifies its
edge maps, transgression and products, and derives the low-degree sequences and Hopf's formula.
Layer 7 proves the double coset formula for any group and, for finite groups, the stable element
theorem. Layer 8 proves Tate duality and the periodicity
theorems for finite groups, using Layers 4, 5 and 7 and the period computations of K3BlochGroups
§5.2.

---

## Layer 1: conjugation, quotient actions and permutation modules

### 1.1 Conjugation

Define, for `H ≤ G`, `g ∈ G` and `M : Rep k G`, the conjugation maps
`c_g : Hⁿ(H, M) → Hⁿ(gHg⁻¹, M)` and `c_g : Hₙ(H, M) → Hₙ(gHg⁻¹, M)` as the compatible-pair maps
of the Conventions, and for finite `G` the same map on `Ĥⁿ(H, M)`, `n ∈ ℤ`, which is Tau Ceti's
`TauCeti.TateCohomology.map` for the isomorphism `e : H ≃* gHg⁻¹`, `x ↦ gxg⁻¹`, and
`φ(m) = g·m` (an isomorphism by `TauCeti.TateCohomology.mapIso`). Since `e.symm` is
`x ↦ g⁻¹xg`, `TauCeti.TateCohomology.map_comp_isoGroupCohomology_hom` and
`TauCeti.TateCohomology.map_comp_isoGroupHomology_hom` identify it with the cohomological pair in
degrees `≥ 1` and with the homological pair in degrees `≤ −2`. Prove that conjugation by an element
of `H` is the identity on the (co)homology of `H`
(HS53 Ch. I §2, corollary to Prop. 2, p. 113, as used in Ch. I §7, pp. 117–118;
Loh19 Prop. 3.2.13, p. 124). *Needs:* Mathlib `groupCohomology.map`, `groupHomology.map`, `tateCohomology`; Tau Ceti
`TauCeti.groupCohomology.corestriction`, `TauCeti.groupHomology.transfer`,
`TauCeti.TateCohomology.map`, `TauCeti.TateCohomology.mapIso`,
`TauCeti.TateCohomology.map_comp_isoGroupCohomology_hom`,
`TauCeti.TateCohomology.map_comp_isoGroupHomology_hom`, `TauCeti.TateCohomology.res`.

Conjugation followed by restriction is one compatible pair, and it is the form in which Layer 7
uses it. Define `conjRes M A β g h n`, for a subgroup `A ≤ G`, a group `B` with a homomorphism
`β : B →* G`, an element `g ∈ G` and a proof `h` that `g⁻¹β(b)g ∈ A` for every `b ∈ B`, as the map
`Hⁿ(A, Res M) → Hⁿ(B, Res_β M)` of `groupCohomology.map` for the pair consisting of
`b ↦ g⁻¹β(b)g : B →* A` and `m ↦ g·m`; the latter is equivariant because
`ρ(g)ρ(g⁻¹β(b)g) = ρ(β(b))ρ(g)`. For `B = gAg⁻¹` and `β` its inclusion it is `c_g`; for `g = 1`
and `β` the inclusion of a subgroup of `A` it is restriction. In general it is `c_g` from `A` to
`gAg⁻¹`, followed by restriction to `β(B) ≤ gAg⁻¹`, followed by the map along the surjection
`B → β(B)` induced by `β` (with the identity of `M`), since the pair factors through these three
pairs; when `β` is injective the last map is the identification induced by `B ≃ β(B)`.
*Needs:* Mathlib `groupCohomology.map`, `Rep.res`, `Rep.ofHom`.

In homology the same data give the map in the other direction, and it is the form in which the
homological clauses of Layer 7 use conjugation. Define `conjCores M A β g h n`, for `A`, `β`, `g`
and `h` as above, as the map `Hₙ(B, Res_β M) → Hₙ(A, Res M)` of `groupHomology.map` for the pair
consisting of `b ↦ g⁻¹β(b)g : B →* A` and `m ↦ g⁻¹·m`; the latter is equivariant because
`ρ(g⁻¹)ρ(β(b)) = ρ(g⁻¹β(b)g)ρ(g⁻¹)`. For `g = 1` and `β` the inclusion
of a subgroup of `A` it is homological corestriction; for `β` injective it is `c_{g⁻¹}` from the
image of `β` to `g⁻¹β(B)g` followed by corestriction from `g⁻¹β(B)g` to `A`, and in general these
two maps are preceded by the map `Hₙ(B, Res_β M) → Hₙ(β(B), M)` along the surjection
`B → β(B)` induced by `β`. *Needs:* Mathlib `groupHomology.map`, `Rep.res`, `Rep.ofHom`.

- `c_1` is the identity, and `c_{gh} = c_g ∘ c_h` (after the equality `g(hHh⁻¹)g⁻¹ = (gh)H(gh)⁻¹`).
- For `g ∈ H`, `c_g` is the identity of `Hⁿ(H, M)`, of `Hₙ(H, M)` and of `Ĥⁿ(H, M)`.
- `c_g` commutes with coefficient maps, with connecting maps of short exact sequences of
  representations, with restriction to `K ≤ H` (landing in `gKg⁻¹`; for Tate cohomology,
  `TauCeti.TateCohomology.res` in every degree), with corestriction and transfer for `K ≤ H` of
  finite index, and with the homological corestriction.
- In degree `0`, `c_g(m) = g·m` on `M^H` and `c_g[m] = [g·m]` on `M_H`.
- `conjRes` composes: `conjRes` for `(A, β, g)` followed by restriction along `β′ : B′ →* B` is
  `conjRes` for `(A, β ∘ β′, g)`; and for `a ∈ A`, `conjRes` for `(A, β, ga)` is `conjRes` for
  `(A, β, g)` after `c_a` on `Hⁿ(A, M)`, so the two agree by inner triviality.
- `conjCores` composes dually: the map along `β′ : B′ →* B` from `Hₙ(B′, Res_{β ∘ β′} M)` to
  `Hₙ(B, Res_β M)` followed by `conjCores` for `(A, β, g)` is `conjCores` for `(A, β ∘ β′, g)`; and
  for `a ∈ A`, `conjCores` for `(A, β, ga)` is `conjCores` for `(A, β, g)` followed by `c_{a⁻¹}` on
  `Hₙ(A, M)`, so the two agree by inner triviality.
- In degree `0`, `conjCores` is `[m] ↦ [g⁻¹·m]` from the coinvariants of `Res_β M` to `M_A`.

**Checks.**

- For `G = S₃`, `H = ⟨(12)⟩`, `g = (13)` and trivial `𝔽₂`: `c_g` sends the nonzero element of
  `H¹(H, 𝔽₂) = Hom(H, 𝔽₂)` to the character of `⟨(23)⟩` with value `1`. For `g = (123)`,
  `gHg⁻¹ = ⟨(23)⟩` while `g⁻¹Hg = ⟨(13)⟩`: the model conjugating by `g⁻¹` lands in the cohomology
  of the wrong subgroup.
- For `G` abelian and trivial coefficients, `c_g` is the identity for every `g`, since `gHg⁻¹ = H`
  and the pair is the identity.
- Inner triviality fails for `g ∉ H` normalising `H`: for `G = S₃`, `H = A₃`, `g = (12)` and
  trivial `𝔽₃`, `c_g` acts by `−1` on `H¹(A₃, 𝔽₃) = Hom(A₃, 𝔽₃) ≅ 𝔽₃`.
- `conjRes` with `A = ⟨(12)⟩ ≤ S₃` and `β` the inclusion of `⟨(23)⟩`: for `g = (13)`,
  `g⁻¹(23)g = (12) ∈ A` and the map is the `c_g` of the first Check; for `g = (123) = (13)(12)`,
  also `g⁻¹(23)g = (12)`, and the composition law gives the same map; for `g = (132)`,
  `g⁻¹(23)g = (13) ∉ A`, and no map is defined.
- `conjRes` with `g = 1` and `β` the inclusion of the trivial subgroup is restriction to `1`, so it
  is zero in positive degrees and the inclusion `M^A ↪ M` in degree `0`; a model with the
  coefficient map `m ↦ g⁻¹·m` is not equivariant: with `A = ⟨(12)⟩`, `β` the inclusion of
  `⟨(23)⟩`, `g = (123)` and `x = (23)`, it would need `g⁻¹g⁻¹xg = xg⁻¹`, but `g⁻²xg = gxg = (23)`
  fixes `1` while `xg⁻¹ = (23)(132)` sends `1` to `2`, and the permutation representation `ℤ³` of
  `S₃` is faithful. For an involution `g` the two models agree, so this Check needs an element of
  order `3`.
- `conjRes` along a homomorphism that is not injective: `G = A = ℤ/2`, `B = ℤ/4`, `β` the
  reduction mod `2`, `g = 1`, trivial `𝔽₂`, degree `2`. The nonzero class of
  `H²(ℤ/2, 𝔽₂) = 𝔽₂` is that of the carry cocycle, `1` at `(1, 1)` and `0` elsewhere; its pullback
  to `ℤ/4` is `1` exactly on the four pairs of odd residues, and so is the coboundary of
  `f(a) = ⌊a/2⌋ mod 2` (`df(1, 1) = f(1) − f(2) + f(1) = 1`, `df(1, 2) = f(2) − f(3) + f(1) = 0`,
  `df(2, 2) = f(2) − f(0) + f(2) = 0`, `df(3, 3) = f(3) − f(2) + f(3) = 1`). So `conjRes` is zero
  from `H²(ℤ/2, 𝔽₂) = 𝔽₂` to `H²(ℤ/4, 𝔽₂) = 𝔽₂`, while `c_1` followed by restriction to
  `β(B) = ℤ/2` is the identity of `𝔽₂`: the map along `ℤ/4 → ℤ/2` is what kills the class. Dually,
  `conjCores` for the same data is zero from `H₂(ℤ/4, 𝔽₂) = 𝔽₂` to `H₂(ℤ/2, 𝔽₂) = 𝔽₂`, the
  comparison of the periodic resolutions being multiplication by `2` in degree `2`
  (`1 + t + t² + t³ ↦ 2(1 + s)`), and in degree `1` it is the isomorphism
  `ℤ/4 ⊗ 𝔽₂ → ℤ/2 ⊗ 𝔽₂`.
- `conjCores` with `g ∈ A` and `β` the inclusion of `A` is the identity of `Hₙ(A, M)`: for
  `G = A = ℤ/2` acting on `M = ℤ` by `−1` and `g` the generator, in degree `0` it is `[m] ↦ [−m]`
  on `M_G = ℤ/2`, which is the identity.
- `conjCores` with `g = 1` and `β` the inclusion of the trivial subgroup is the map
  `M = H₀(1, M) → M_A`, `m ↦ [m]`, in degree `0`, and zero in positive degrees, where
  `Hₙ(1, M) = 0`.
- A model of `conjCores` with the coefficient map `m ↦ g·m` is not equivariant: with
  `A = ⟨(12)⟩`, `β` the inclusion of `⟨(23)⟩`, `g = (123)` (so `g⁻¹(23)g = (12)`) and `x = (23)`,
  it would need `ρ(g)ρ(x) = ρ(g⁻¹xg)ρ(g)`, that is `g²x = xg²`; but `g²x` sends `1` to `3` while
  `xg²` sends `1` to `2`, and the permutation representation `ℤ³` of `S₃` is faithful. With
  `m ↦ g⁻¹·m`, for `g = (13)`, the degree-`0` map sends the class of `e₁` in the coinvariants of
  `⟨(23)⟩` to the class of `e₃` in those of `⟨(12)⟩`. Forgetting the coefficient map is not even
  well defined there: `[e₂] = [e₃]` among the coinvariants of `⟨(23)⟩`, while among those of
  `⟨(12)⟩`, `[e₂] = [e₁] ≠ [e₃]`.

### 1.2 The quotient action on the (co)homology of a normal subgroup

Define, for `N ◁ G` with quotient `Q = G ⧸ N` and `M : Rep k G`, the representations of `Q` on
`Hⁿ(N, M)` and on `Hₙ(N, M)` given by `qN ↦ c_q` (well defined by the inner triviality of 1.1).
Prove that in degree `0` they are `M^N` with Mathlib's `Rep.quotientToInvariantsFunctor` and `M_N`
with `Rep.quotientToCoinvariantsFunctor` (HS53 Ch. I §7, pp. 117–118; Loh19 Prop. 3.2.13, p. 124).
*Needs:* 1.1; Mathlib `Rep.quotientToInvariantsFunctor`, `Rep.quotientToCoinvariantsFunctor`.

- The constructions are functorial in `M` and send the connecting maps of a short exact sequence
  of `G`-representations to `Q`-equivariant maps.
- They are natural for morphisms of pairs `(G', N') → (G, N)` with `f(N') ≤ N`, through the induced
  map `G' ⧸ N' → G ⧸ N`.
- When `N` acts trivially on `M`, `H¹(N, M) ≅ Hom(N^ab, M)` as `Q`-representations, with
  `(gN · φ)(n) = g·φ(g⁻¹ng)`.

**Checks.**

- For `N = G` the quotient is trivial and the representation is the `k`-module `Hⁿ(G, M)`; for
  `N = 1` it is `M` in degree `0` with the action of `G = Q`, and zero in positive degrees.
- For `G = S₃`, `N = A₃` and trivial `𝔽₃`, the transposition acts by `−1` on
  `H¹(A₃, 𝔽₃) ≅ 𝔽₃`, so the invariants vanish, as `H¹(S₃, 𝔽₃) = Hom(S₃, 𝔽₃) = 0` requires through
  6.7.
- A plausible wrong model letting `g` act by `φ ↦ φ ∘ c_g` without the coefficient action differs
  for `G = ℤ/4`, `N = 2ℤ/4`, `M = ℤ` with the generator acting by `−1`: on
  `H⁰(N, M) = M^N = M` the correct action is `−1`, the wrong one `+1`.

### 1.3 Additivity

Prove that for a family `(M_i)_{i ∈ ι}` of representations, `ι : Type u`, the canonical maps
`⊕_i Hₙ(G, M_i) → Hₙ(G, ⊕_i M_i)` and `Hⁿ(G, ∏_i M_i) → ∏_i Hⁿ(G, M_i)` are isomorphisms, and that
for finite `ι` cohomology also commutes with direct sums (Brown82 Ch. III). The inhomogeneous
chains of a direct sum are the direct sum of the chains, the cochains of a product are the product
of the cochains, and homology of modules commutes with direct sums and products. *Needs:* Mathlib
`groupHomology.chainsFunctor`, `groupCohomology.cochainsFunctor`.

**Checks.**

- For `ι` a single point both maps are identities.
- Cohomology does not commute with infinite direct sums: for the free abelian group
  `A = ℤ^{(ℕ)}` with trivial action, `H¹(A, ℤ^{(ℕ)}) = Hom(A, ℤ^{(ℕ)})` contains the identity,
  which is not in `⊕_ℕ Hom(A, ℤ)`.
- For `G = ℤ/2` and `M_i = ℤ` with trivial action, `H₁(G, ℤ^{(ι)}) = (ℤ/2)^{(ι)}`.

### 1.4 Permutation modules and Shapiro's lemma

Prove, for `H ≤ G` and `M : Rep k G`, natural isomorphisms
`Hₙ(G, k[G ⧸ H] ⊗ M) ≅ Hₙ(H, M)` and `Hⁿ(G, Hom_k(k[G ⧸ H], M)) ≅ Hⁿ(H, M)`, and, for a
character `χ : H →* kˣ` with `k_χ` the corresponding rank-one representation,
`Hₙ(G, Ind_H^G(k_χ) ⊗ M) ≅ Hₙ(H, k_χ ⊗ M)` and its cohomological dual. For a `G`-set `X` with a set
`Σ` of orbit representatives, combine these with 1.3 into
`Hₙ(G, k[X] ⊗ M) ≅ ⊕_{x ∈ Σ} Hₙ(G_x, M)` and `Hⁿ(G, Hom_k(k[X], M)) ≅ ∏_{x ∈ Σ} Hⁿ(G_x, M)`.
Route: the projection formula `TauCeti.indProjection` for the inclusion of `H`, `X = k_χ` and
`Y = M`, which gives `Ind_H^G(k_χ ⊗ Res M) ≅ Ind_H^G(k_χ) ⊗ M` (for the trivial character it is
`TauCeti.indResProjection`, `Ind_H^G Res M ≅ k[G ⧸ H] ⊗ M`), Shapiro's lemma
`groupHomology.indIso` and `groupCohomology.coindIso` in the explicit forms
`TauCeti.groupHomology.indIso_inv` (the inverse is induced by `a ↦ 1 ⊗ a`) and
`TauCeti.groupCohomology.coindIso_hom` (restriction followed by evaluation at `1`), the isomorphism
`Hom_k(Ind_H^G X, M) ≅ Coind_H^G Hom_k(X, Res M)`, `F ↦ (g ↦ (x ↦ g·F(⟦g ⊗ x⟧)))`, for every
`H` (for `X = k` it is `Hom_k(k[G ⧸ H], M) ≅ Coind_H^G M`), and the orbit decomposition
`X ≅ ⊔_{x ∈ Σ} G ⧸ G_x` (SerreArbres II §2.8, p. 168). *Needs:* 1.3; Mathlib `groupHomology.indIso`,
`groupCohomology.coindIso`, `Rep.ofMulAction`; Tau Ceti `TauCeti.indProjection`,
`TauCeti.indTrivialIso`, `TauCeti.indResProjection`, `TauCeti.groupHomology.indIso_inv`,
`TauCeti.groupCohomology.coindIso_hom`.

**Checks.**

- For `X` a point (`H = G`) the isomorphisms are the identity.
- For `X = G` with left translation (`H = 1`), `Hₙ(G, k[G] ⊗ M) = 0` for `n > 0`.
- For `G = ℤ/2` acting on `X = G ⊔ pt`, `H₁(G, ℤ[X]) = H₁(1, ℤ) ⊕ H₁(G, ℤ) = ℤ/2` and
  `H₀(G, ℤ[X]) = ℤ²`; the model summing over all points instead of orbits gives `H₀ = ℤ³`.

### 1.5 Continuous cohomology of a discrete group

Construct, for `G` with the discrete topology, `k` with the discrete topology and a topological
representation `A : TopRep k G` whose carrier is discrete, an isomorphism of `k`-modules
`Θₙ : continuousCohomology n A ≅ Hⁿ(G, A)` (the underlying representation), for every `n`. Every
function on a discrete space is continuous, so currying identifies the invariant iterated function
spaces of `TopRep.homogeneousCochains` with the homogeneous cochains `Hom_G(k[G^{n+1}], A)`, and
the comparison of the standard and bar resolutions gives the inhomogeneous cochains. Prove that
`Θ` is natural in compatible pairs of discrete groups and in `A`, commutes with the connecting maps
of short exact sequences of discrete representations, and agrees in degrees `0, 1, 2` with the
explicit comparisons of ProfiniteCohomology §§3.1–3.2. The passage between homogeneous and
inhomogeneous cochains is HS53 Ch. I §2, pp. 112–113; the comparison itself is
between the pinned carriers `continuousCohomology` and `groupCohomology`, whose module docstring
records it as missing. *Needs:* Mathlib `continuousCohomology`,
`TopRep.homogeneousCochains`, `Rep.standardResolution`, `groupCohomologyIso`; ProfiniteCohomology
§3.1, §3.2; Tau Ceti `TauCeti.ContCohomology.explicitH1IsoGroupCohomology`,
`TauCeti.ContCohomology.explicitH2IsoGroupCohomology`.

- `Θ₀` is the identification of both sides with the invariants `A^G`.
- `Θ` is natural for every homomorphism of discrete groups with a compatible equivariant map.
- For `k = ℤ`, finite `G : Type` and `A` a discrete `G`-module, `Θₙ` is an additive equivalence
  `continuousCohomology n A ≃+ Hⁿ(G, A)`, which `TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology`
  asserts only to exist.

**Checks.**

- For the trivial group both sides are `A` in degree `0` and zero in positive degrees.
- For `G = ℤ` with the discrete topology and trivial `A = ℤ`, both sides of `Θ₁` are
  `Hom(ℤ, ℤ) ≅ ℤ`. For `ℤ` with the topology induced from its profinite completion, continuous
  homomorphisms to the discrete `ℤ` have finite image, so `H¹_cont = 0 ≠ H¹(ℤ, ℤ)`:
  discreteness of `G` is used.
- In degree `1` with trivial action, `Θ₁` sends the class of a homomorphism `f : G → A` to the
  class of `f`. A comparison using the homogeneous cocycle `(g₀, g₁) ↦ f(g₀) − f(g₁)` instead of
  `f(g₁) − f(g₀)` sends it to `−f`, which differs for `G = ℤ`, `A = ℤ/3`; the agreement with
  ProfiniteCohomology §3.1 excludes it.

### Examples

For `G = S₃` and `N = A₃`, the quotient `ℤ/2` acts on `H¹(A₃, 𝔽₃) ≅ 𝔽₃` by `−1` and on
`H²(A₃, ℤ) ≅ ℤ/3` by `−1`, and on `H⁴(A₃, ℤ) ≅ ℤ/3` trivially; these three actions are used again
in 6.2 and 7.2.

### Dependencies

Mathlib's carriers, functoriality, Shapiro's lemma and continuous cohomology; Tau Ceti's
corestriction, transfer, permutation-module isomorphisms and projection formula;
ProfiniteCohomology §§3.1–3.2 for 1.5.

---

## Layer 2: coefficients in a complex

### 2.1 Hyperhomology and hypercohomology

Define, for a chain complex `C` of representations indexed by `ℕ`, the *hyperhomology*
`Hₙ(G; C)` as the homology of the total complex of the first-quadrant bicomplex whose `(p, q)`
term is the module of inhomogeneous `p`-chains with coefficients in `C_q`, obtained by applying
`groupHomology.chainsFunctor` to `C` degreewise. Define, for a cochain complex `D` indexed by `ℕ`,
the *hypercohomology* `Hⁿ(G; D)` as the cohomology of the total complex of the bicomplex of
inhomogeneous `p`-cochains with values in `D^q`, from `groupCohomology.cochainsFunctor`. A chain
complex `C` with `C_i = 0` for `i < b` is reindexed to `C′_r = C_{r+b}` with the same differential,
and `Hₙ(G; C) = H_{n−b}(G; C′)` for `n ≥ b`, `0` for `n < b`; dually for cochain complexes.
(HS53 Ch. I §4, p. 114, for the cochain bicomplex `C(Π, U)`, and Ch. I §2 Prop. 1, p. 111, for
independence of the resolution, both in cohomology; the homological forms by the remark closing
HS53 Ch. I §7, p. 118.) For
`k = ℤ` and chain complexes this is the group hyperhomology of SchemeKTheoryOperations §6.7; the
target adds arbitrary `k` and hypercohomology. *Needs:* Mathlib `groupHomology.chainsFunctor`,
`groupCohomology.cochainsFunctor`, `HomologicalComplex₂.total`; Tau Ceti
`MonoidHom.groupHomologyIso_hom_naturality`, `MonoidHom.groupCohomologyIso_hom_naturality` (the
functoriality in compatible pairs under the independence of the resolution);
SchemeKTheoryOperations §6.7 and K3BlochGroups §4.1 for the comparison.

- Functoriality: chain maps of complexes of representations, and compatible pairs consisting of
  `f : G' →* G` and a chain map `C' ⟶ Res_f C` (homology) or `Res_f D ⟶ D'` (cohomology).
- Independence of the resolution: for any projective resolution `P` of the trivial representation
  `k`, `Hₙ(G; C)` is canonically isomorphic to the homology of the total complex of
  `(P_p ⊗ C_q)_G`, and `Hⁿ(G; D)` to the cohomology of the product total complex of
  `Hom_G(P_p, D^q)`; two resolutions give compatible isomorphisms.
- Invariance: a quasi-isomorphism `C ⟶ C'` induces isomorphisms `Hₙ(G; C) ≅ Hₙ(G; C')`, and
  likewise in cohomology.
- Concentration in degree `0`: for `C` the single complex on `M` in degree `0`,
  `Hₙ(G; C) ≅ Hₙ(G, M)`, and `Hⁿ(G; D) ≅ Hⁿ(G, M)` for `D` the single cochain complex.
- Derived category: for any choice of derived category of `Rep k G` (Mathlib's
  `DerivedCategory`), `Hⁿ(G; D)` is naturally isomorphic to the morphisms from the trivial
  representation `k` to the shift `D[n]`; for `D` concentrated in degree `0` this is
  `groupCohomologyIsoExt`.
- Comparison: for `k = ℤ` and `C` in degrees `≥ 0`, `Hₙ(G; C)` is naturally isomorphic to the group
  hyperhomology of SchemeKTheoryOperations §6.7 (independence of the resolution, with §6.7's `P`),
  compatibly with functoriality and with the degree-`0` identification; for an integral `C`
  bounded below, the reindexing above is that of K3BlochGroups §4.1.

**Checks.**

- For `G = ℤ/2` and `C = ℤ` in degree `0`, `H₁(G; C) = ℤ/2`.
- For `G = S₃` and `C` the complex `ℤ[S₃ ⧸ A₃] → ℤ` (augmentation, degrees `1 → 0`),
  `H₀(G; C) = 0` and `H₁(G; C) = ℤ/2`: `C` is quasi-isomorphic to the sign representation in
  degree `1`, whose coinvariants are `ℤ/2`, although the complex of coinvariants `ℤ → ℤ` is
  acyclic. The model taking homology of the coinvariant complex gives `0`.
- For the trivial group, `Hₙ(1; C) = Hₙ(C)`.
- Hypercohomology is derived: for `G = ℤ/2` and `D = ℤ` in degree `0` with trivial action,
  `H⁰(G; D) = ℤ`, `H¹(G; D) = Hom(ℤ/2, ℤ) = 0` and `H²(G; D) = ℤ/2`, while the cohomology of the
  invariant complex `D^G = ℤ` is `0` in degree `2`.
- The differential of `D` enters: for the trivial group and `D = (ℤ →2 ℤ)` in degrees `0` and `1`,
  `Hⁿ(1; D) = Hⁿ(D)` is `0` in degree `0` and `ℤ/2` in degree `1`; taking the cohomology of each
  `D^q` separately, without the differential of `D`, would give `ℤ` in both degrees.
- The degree of `D` shifts the degree: for `G = ℤ/2` and `D = ℤ_sgn` in degree `1`,
  `Hⁿ(G; D) = Hⁿ⁻¹(G, ℤ_sgn)`, so `H¹(G; D) = (ℤ_sgn)^G = 0` and
  `H²(G; D) = H¹(ℤ/2, ℤ_sgn) = ker(1 + t)/(t − 1)ℤ_sgn = ℤ/2ℤ = ℤ/2`. The invariant complex is `0`,
  and a shift in the opposite direction would put the `ℤ/2` in degree `0`.

### 2.2 Long exact sequences

Prove that a degreewise short exact sequence of complexes of representations gives natural long
exact sequences in hyperhomology and in hypercohomology (CE56 Ch. XVII). The functors of
inhomogeneous chains and cochains are exact, so the sequence of total complexes is short exact.
*Needs:* 2.1.

**Checks.**

- For complexes concentrated in degree `0` the sequences are Mathlib's long exact sequences of
  `groupHomology` and `groupCohomology`.
- For `0 → C' → C → C'' → 0` with `C` acyclic, the connecting maps are isomorphisms
  `Hₙ(G; C'') ≅ Hₙ₋₁(G; C')`.
- For `G` trivial the sequence is the homology sequence of complexes of modules.

### 2.3 The two spectral sequences

Prove that for a chain complex `C` indexed by `ℕ` there are natural spectral sequences
`E¹_{p,q} = H_q(G, C_p) ⇒ H_{p+q}(G; C)`, with `d¹ = H_q(G, ∂)`, and
`E²_{p,q} = H_p(G, H_q(C)) ⇒ H_{p+q}(G; C)`; and for a cochain complex `D` indexed by `ℕ`,
`E₁^{p,q} = H^q(G, D^p) ⇒ H^{p+q}(G; D)` and `E₂^{p,q} = H^p(G, H^q(D)) ⇒ H^{p+q}(G; D)`. All four
converge, with filtrations finite in each total degree. They are the two spectral sequences of the
defining bicomplex: filtering by the degree of `C` gives the first, and since inhomogeneous chains
are exact in the coefficients, filtering by the bar degree gives the second (HS53 Ch. I §5,
Lemma 1, p. 115; Lemma 2 and Prop. 5, p. 116, in cohomology; in homology by the remark closing
HS53 Ch. I §7, p. 118). For `k = ℤ` the two homological sequences are those of
SchemeKTheoryOperations §6.7 under the comparison of 2.1; the target adds arbitrary `k` and the
cohomological sequences. *Needs:* 2.1; DerivedModuleAlgebra §S.1; SchemeKTheoryOperations §6.7
for the comparison; Tau Ceti `HomologicalComplex₂.rowFiltrationSpectralSequence`,
`HomologicalComplex₂.columnFiltrationSpectralSequence`.

- If `Hᵢ(C) = 0` for `i ≤ t`, then `Hₙ(G; C) = 0` for `n ≤ t`; dually for cochain complexes. For
  `k = ℤ` this is the vanishing statement of SchemeKTheoryOperations §6.7.
- If `C_p` is acyclic for `H_*(G, −)` in positive degrees for every `p`, then
  `Hₙ(G; C) ≅ Hₙ((C)_G)`; dually `Hⁿ(G; D) ≅ Hⁿ(D^G)` (the exact-rows comparison of
  DerivedModuleAlgebra §S.1; HS53 Ch. I §4 Prop. 4, p. 114, for the cohomological form).

**Checks.**

- For `C` concentrated in degree `0` the second sequence has a single row and recovers
  `Hₙ(G, C₀)`.
- For the `S₃` complex of 2.1, the first sequence has `E¹_{1,q} = H_q(A₃, ℤ)` (Shapiro) and
  `E¹_{0,q} = H_q(S₃, ℤ)`, with `d¹` the corestriction: an isomorphism `ℤ → ℤ` for `q = 0` and zero
  `ℤ/3 → ℤ/2` for `q = 1`. So `H₁(G; C) = E²_{0,1} = ℤ/2` and `H₂(G; C) = E²_{1,1} = ℤ/3`, as the
  second sequence gives through `Hₙ(G; C) = Hₙ₋₁(S₃, ℤ_sgn)`. Taking `d¹ = 0` on `q = 0` would
  give `H₀(G; C) = ℤ`.
- With `S₃ ⧸ ⟨(12)⟩` in place of `S₃ ⧸ A₃`, `d¹` on `q = 1` is the isomorphism
  `H₁(⟨(12)⟩, ℤ) → H₁(S₃, ℤ) = ℤ/2`, so `H₀(G; C) = H₁(G; C) = 0` although `H₁(C) ≅ ℤ²`: the
  vanishing statement has no converse.

### Examples

For `C = (ℤ[S₃ ⧸ A₃] → ℤ)`, `Hₙ(S₃; C) = Hₙ₋₁(S₃, ℤ_sgn)`: `0` for `n = 0`, `ℤ/2` for `n = 1`
and `ℤ/3` for `n = 2`, read off either spectral sequence of 2.3.

### Dependencies

Layer 1; Mathlib `groupHomology.chainsFunctor`, `groupCohomology.cochainsFunctor`,
`HomologicalComplex₂.total`, `DerivedCategory`; Tau Ceti's bicomplex spectral sequences and the
naturality of the resolution comparisons in the group; DerivedModuleAlgebra §S.1.

---

## Layer 3: complexes of permutation modules and actions on trees

### 3.1 Equivariant homology of a complex of representations

For a chain complex `C` of representations indexed by `ℕ` and `M : Rep k G`, write
`H^G_n(C; M) = H_n(G; C ⊗ M)` (2.1) and, dually, `H_G^n(C; M) = Hⁿ(G; Hom_k(C, M))` (Brown82
Ch. VII). Let `C` be a resolution of the trivial representation `k`. Prove that if every `C_p` is
flat over `k`, the augmentation `C ⊗ M → M` is a quasi-isomorphism of complexes of representations
and `H^G_n(C; M) ≅ Hₙ(G, M)`; and that if every `C_p` is projective over `k`, the map
`M → Hom_k(C, M)` dual to the augmentation is a quasi-isomorphism and `H_G^n(C; M) ≅ Hⁿ(G, M)`.
Flatness alone does not give the cohomological statement (Checks). Route: the cone of `C → k` is
a bounded-below exact complex of flat `k`-modules, which stays exact after `− ⊗ M`; with projective
terms `C → k` is a `k`-linear homotopy equivalence, which `Hom_k(−, M)` preserves; then the
quasi-isomorphism invariance of 2.1. *Needs:* 2.1, 2.2.

- Long exact sequences in the complex: a short exact sequence `0 → C' → C → C'' → 0` of complexes of
  representations that stays degreewise short exact after `− ⊗ M` (for instance when it is split
  over `k` in each degree, when `M` is flat over `k`, or when every `C''_p` is flat over `k`) gives,
  by 2.2, a natural long exact sequence
  `⋯ → H^G_n(C'; M) → H^G_n(C; M) → H^G_n(C''; M) → H^G_{n−1}(C'; M) → ⋯`. One that stays
  degreewise short exact after `Hom_k(−, M)` (split over `k` in each degree, `M` injective over `k`,
  or every `C''_p` projective over `k`) gives a natural long exact sequence
  `⋯ → H_G^n(C''; M) → H_G^n(C; M) → H_G^n(C'; M) → H_G^{n+1}(C''; M) → ⋯`.
- Long exact sequences in the coefficients: a short exact sequence `0 → M' → M → M'' → 0` of
  representations gives a natural long exact sequence in `H^G_*(C; −)` when every `C_p` is flat
  over `k`, and in `H_G^*(C; −)` when every `C_p` is projective over `k`.
- Naturality: `H^G_n` is covariant and `H_G^n` contravariant in chain maps of complexes, both are
  functorial in `M`, and both are natural for compatible pairs as in 2.1.
- Comparison with group (co)homology: for a resolution `C` of `k`, termwise flat over `k` in
  homology and termwise projective over `k` in cohomology, the isomorphisms above are natural in
  `M` and compatible with the long exact sequences in the coefficients.

**Checks.**

- For the complex of the standard resolution the isomorphism is `groupHomologyIso`.
- The resolution hypothesis is used: for `C = ℤ[ℤ/2]` in degree `0`, `H^G_1(C; ℤ) = H₁(1, ℤ) = 0`
  while `H₁(ℤ/2, ℤ) = ℤ/2`.
- Flatness is used: for `k = ℤ/4`, `G` trivial, `M = ℤ/2` and `C = k ⊕ (ℤ/2 → ℤ/4 → ℤ/2)` (the
  exact sequence placed in degrees `2, 1, 0`), `C → k` is a quasi-isomorphism but
  `H^G_2(C; M) = ℤ/2 ≠ 0 = H₂(1, M)`.
- Projectivity, not flatness, is the cohomological hypothesis: for `k = ℤ`, `G` trivial, `M = ℤ`,
  `F = ℤ^{(ℕ)}` with basis `(e_i)` and `C = ℤ ⊕ (F →u F →v ℤ[1/2])` (degrees `2, 1, 0`, with
  `u(e_i) = e_i − 2e_{i+1}` and `v(e_i) = 2^{−i}`), every `C_p` is flat and `C → ℤ` is a
  quasi-isomorphism. The differential `Hom(F, ℤ) → Hom(F, ℤ)` is `(a_i) ↦ (a_i − 2a_{i+1})`, and the
  sequence `(1, 0, 1, 0, …)` is not in its image: `a₀ = Σ_{i<r} 2^i b_i + 2^r a_r` for every `r`
  would force `a₀ = Σ_j 4^j = −1/3` in `ℤ₂`. So `H_G^2(C; ℤ) ≠ 0 = H²(1, ℤ)`; `ℤ[1/2]` is not
  projective.
- The exactness hypothesis of the long exact sequences is used: for `k = ℤ`, `G` trivial,
  `M = ℤ/2` and the sequence `0 → ℤ →2 ℤ → ℤ/2 → 0` in degree `0` (not split, with non-flat
  `ℤ/2`), tensoring gives `ℤ/2 →0 ℤ/2 →id ℤ/2`, and a long exact sequence would force the zero map
  `H^G_0(C'; M) = ℤ/2 → H^G_0(C; M) = ℤ/2` to be injective, since `H^G_1(C''; M) = 0`. The
  sequence of a tree in 3.4, split over `k`, satisfies the hypothesis.

### 3.2 The orbit spectral sequence

Let each `C_p ≅ ⊕_{σ ∈ Σ_p} Ind_{G_σ}^G(k_σ)` with `Σ_p` a set, `G_σ ≤ G` and `k_σ` given by a
character `G_σ →* kˣ` (a *monomial complex*: the cellular chains of a cell complex on which `G`
permutes the cells, `Σ_p` the orbit representatives of `p`-cells, `G_σ` their stabilisers and
`k_σ` their orientation characters). Prove that the first sequence of 2.3 for `C ⊗ M` is
`E¹_{p,q} = ⊕_{σ ∈ Σ_p} H_q(G_σ, k_σ ⊗ M) ⇒ H^G_{p+q}(C; M)` and dually
`E₁^{p,q} = ∏_{σ ∈ Σ_p} H^q(G_σ, Hom_k(k_σ, M)) ⇒ H_G^{p+q}(C; M)`, with `d¹` the map induced by
`∂` transported through the Shapiro isomorphisms of 1.4 (Brown82 Ch. VII). The identification is
the first sequence of 2.3, filtered by the degree of `C` in the bicomplex of HS53 Ch. I §4, p. 114
(a cochain bicomplex; its chain form by the remark closing HS53 Ch. I §7, p. 118), with its terms
computed by 1.3 and 1.4. For `k = ℤ`, trivial characters and `C_p = ℤ[X]` with `X`
transitive it is the first-page identification of SchemeKTheoryOperations §6.7; the target adds
monomial modules with characters, arbitrary `k`, `M` and the cohomological sequence.
*Needs:* 1.3, 1.4, 2.3; SchemeKTheoryOperations §6.7 for the comparison.

**Checks.**

- If every `G_σ = G` with trivial `k_σ`, `E¹_{p,q} = H_q(G, M)^{(Σ_p)}`.
- For the augmented chains of a tree (3.4), the sequence has two columns and degenerates at `E²`,
  recovering 3.5.
- Take the circle with two vertices and two edges, both oriented from the first vertex to the
  second. For `ℤ/2` acting by the reflection fixing both vertices, `E¹_{0,q} = H_q(ℤ/2, ℤ)²`, which
  survives to `E^∞` in odd degrees `q ≥ 3`, so `H^G_n(C; ℤ) ≠ 0` for infinitely many `n`. For
  `ℤ/2` acting by the rotation of order `2`, every stabiliser is trivial, `E¹_{p,q} = 0` for
  `q > 0`, and `H^G_n(C; ℤ)` is the homology of the quotient circle.

### 3.3 Free complexes

Prove that if every `G_σ` is trivial (each `C_p` free over `k[G]` on a basis), then
`H^G_n(C; M) ≅ Hₙ((C ⊗ M)_G)`, the second sequence of 2.3 is
`E²_{p,q} = H_p(G, H_q(C ⊗ M)) ⇒ H_{p+q}((C ⊗ M)_G)`, and, if moreover `C` resolves `k`,
`Hₙ((C ⊗ M)_G) ≅ Hₙ(G, M)`. This is the algebraic form of the Cartan–Leray spectral sequence
(HS53 Ch. I §5 Prop. 5, p. 116, in cohomology; the homological transcription is the remark closing
HS53 Ch. I §7, p. 118). *Needs:* 3.1, 3.2, 2.3; Tau Ceti
`groupHomology.isZero_indBot_succ`.

**Checks.**

- For a surjective finite regular cover `p : E → B` with deck group `G`, `C = C_*(E; k)` its
  singular chains with the deck action (free over `k[G]`, since `G` acts freely on singular
  simplices) and `M` a `k`-module with trivial action of `G`, `(C ⊗ M)_G` is the quotient chain
  complex `C_*(E; M)_G`, which AlgebraicTopology §5.3 identifies with `C_*(B; M)` through `p_*`.
  So the abutment `Hₙ((C ⊗ M)_G)` is `Hₙ(B; M)` and the `E²` term `H_p(G, H_q(E; M))` is that of
  §5.3's Cartan–Leray sequence. §5.3 compares constant coefficients only.
- The trivial action on `M` is needed in that comparison: take `E = ℝ/2ℤ → B = ℝ/ℤ`, `G = ℤ/2`
  acting by `x ↦ x + 1`, `k = ℤ` and `M = ℤ_sgn`. On the cellular chains of `E` with vertices
  `0, 1` and edges `[0, 1], [1, 2]`, the complex `ℤG →(t−1) ℤG` of free modules, identifying
  `(ℤG ⊗ M)_G` with `M` by `g ⊗ m ↦ g⁻¹m` turns `(C ⊗ M)_G` into `ℤ →(−2) ℤ`, with `H₀ = ℤ/2` and
  `H₁ = 0`, while `H₀(B; ℤ) = H₁(B; ℤ) = ℤ`; for trivial `M = ℤ` the differential is `0` and both
  sides are `ℤ` in degrees `0` and `1`. The singular chains give the same groups: the coefficient
  sequence `0 → ℤ_sgn → ℤG → ℤ → 0` (`1 ↦ t − 1`) gives a long exact sequence (3.1) whose middle
  terms are `Hₙ((C ⊗ ℤG)_G) = Hₙ(E; ℤ)`, mapping by `p_*` to `Hₙ(B; ℤ)`, which is bijective on
  `H₀` and multiplication by `2` on `H₁`; hence `H₁ = 0` and `H₀ = ℤ/2` for `ℤ_sgn`. A nontrivial
  action on `M` changes the coefficient system on the base.
- For `G = ℤ/m`, `m ≥ 1` (so that the norm `N` exists), and the free resolution
  `⋯ → ℤG →N ℤG →(t−1) ℤG → ℤ` (Loh19 Prop. 1.6.11, p. 48), `Hₙ((C ⊗ ℤ)_G)` is `ℤ/m` in odd
  degrees and `0` in positive even degrees.
- Freeness is needed: for `C = ℤ` in degree `0` with trivial action (not free),
  `H₁((C)_G) = 0` while `H₁(G; C) = G^ab`.

### 3.4 The chain complex of a tree

Let `X` be a `G`-tree in the sense of FreeGroupsAndLimitGroups §4.6 (a Serre tree with an action
without inversions), with vertex set `V`, a `G`-invariant orientation `E⁺` of its edges (which
exists because no edge is inverted) and `t, o` the terminal and initial vertices. Prove that
`0 → k[E⁺] →∂ k[V] →ε k → 0`, with `∂e = t(e) − o(e)` and `ε` the augmentation, is an exact
sequence of permutation representations, split over `k` (SerreArbres II §2.8, p. 168). Exactness:
a contracting homotopy along the reduced paths to a base vertex, which exist and are unique in a
tree (`TauCeti.SerreGraph.IsTree`). *Needs:* FreeGroupsAndLimitGroups §4.6; Tau Ceti
`TauCeti.SerreGraph.IsTree`; Mathlib `Rep.ofMulAction`.

**Checks.**

- For the one-vertex tree, `E⁺ = ∅` and the sequence is `0 → 0 → k → k → 0`.
- For `X` the line with vertices `ℤ` and `G = ℤ` translating, `∂` is `t − 1` on `k[ℤ]` after the
  identifications `k[E⁺] = k[V] = k[G]`, injective with cokernel `k`.
- For a graph that is not a tree, the circle with one vertex and one loop, `∂ = 0` and the sequence
  is not exact at `k[E⁺]`: acyclicity of the graph is used.

### 3.5 The tree sequences

Let `X` be a `G`-tree, `Σ₀` and `Σ₁` sets of representatives of the orbits of vertices and of
oriented edges, and `M : Rep k G`. Prove that there are natural long exact sequences
`⋯ → ⊕_{e ∈ Σ₁} Hₙ(G_e, M) → ⊕_{v ∈ Σ₀} Hₙ(G_v, M) → Hₙ(G, M) → ⊕_{e ∈ Σ₁} Hₙ₋₁(G_e, M) → ⋯`
and
`⋯ → Hⁿ(G, M) → ∏_{v ∈ Σ₀} Hⁿ(G_v, M) → ∏_{e ∈ Σ₁} Hⁿ(G_e, M) → Hⁿ⁺¹(G, M) → ⋯`
(SerreArbres II §2.8 Prop. 13 and Remarque 1, p. 169). The vertex maps are homological
corestriction (respectively restriction). For `e ∈ Σ₁` with `t(e) = a·v` and `o(e) = b·w`
(`v, w ∈ Σ₀`), the edge-to-vertex map is `c_{a⁻¹} ∘ cor` from `G_e ≤ G_{t(e)}` into the summand of
`v` minus `c_{b⁻¹} ∘ cor` from `G_e ≤ G_{o(e)}` into the summand of `w`, and dually in
cohomology. Route: tensor 3.4 with `M` (exact since it is split over `k`), take the long exact
sequence of group homology and identify the terms by 1.4, the vertex maps being corestriction by
`TauCeti.groupHomology.indIso_inv_comp_map_counit`; in cohomology apply `Hom_k(−, M)`, the vertex
maps being restriction by `TauCeti.groupCohomology.map_unit_comp_coindIso_hom`.
*Needs:* 1.1, 1.3, 1.4, 3.4; Mathlib's long exact sequences of `groupHomology` and
`groupCohomology`; Tau Ceti `TauCeti.groupHomology.indIso_inv_comp_map_counit`,
`TauCeti.groupCohomology.map_unit_comp_coindIso_hom`.

**Checks.**

- For `G = ℤ` acting on the line (one vertex orbit and one edge orbit, trivial stabilisers, `t(e)`
  the translate of `o(e)` by the generator `t`), the sequence gives `H₁(ℤ, M) = ker(t⁻¹ − 1) = M^ℤ`
  and `H₀(ℤ, M) = M_ℤ`, and `Hₙ(ℤ, M) = 0` for `n ≥ 2`.
- If `G` fixes a vertex `v₀` and acts on the tree with one vertex, the sequence reduces to
  `Hₙ(G_{v₀}, M) = Hₙ(G, M)`.
- With the edge map defined as a sum instead of a difference, the line example gives
  `H₀(ℤ, ℤ) = ℤ/2` instead of `ℤ`.

### 3.6 Amalgams, HNN extensions and free groups

Prove the following, each from 3.5 applied to the Bass–Serre tree of FreeGroupsAndLimitGroups
§4.7 for a one-edge graph of groups, identified with Mathlib's group by §4.5 (SerreArbres II §2.8,
example after Prop. 13, p. 169; Brown82 Ch. II §7).

- *Amalgams.* For injective `C →* A` and `C →* B` and `G` the amalgam (`Monoid.PushoutI` over
  `Bool`), with the edge oriented from the vertex of `A` to the vertex of `B`, there are exact
  sequences `⋯ → Hₙ(C, M) → Hₙ(A, M) ⊕ Hₙ(B, M) → Hₙ(G, M) → Hₙ₋₁(C, M) → ⋯`, the first map
  `x ↦ (−cor x, cor x)`, and the dual cohomology sequence.
- *HNN extensions.* For subgroups `A, B ≤ H` and `φ : A ≃* B`, and `G = HNNExtension H A B φ`
  (`t a t⁻¹ = φ(a)`), there are exact sequences
  `⋯ → Hₙ(A, M) → Hₙ(H, M) → Hₙ(G, M) → Hₙ₋₁(A, M) → ⋯`, the first map the difference of the map
  induced by `A ≤ H` and the map induced by `ι_B ∘ φ` (with its coefficient map `m ↦ t·m`), and the
  dual cohomology sequence.
- *Free products and free groups.* For the free product `A ∗ B = Monoid.Coprod A B`, which the
  universal properties identify with the amalgam over the trivial group, and every
  `M : Rep k (A ∗ B)`, the map `Hₙ(A, M) ⊕ Hₙ(B, M) → Hₙ(A ∗ B, M)`, `(x, y) ↦ inl_* x + inr_* y`,
  sum of the maps `groupHomology.map` along `Monoid.Coprod.inl` and `Monoid.Coprod.inr` with the
  identity of the restricted coefficients, is bijective for `n ≥ 2`
  (`coprod_groupHomology_bijective`); in degree one the amalgam sequence ends with the exact
  sequence
  `0 → H₁(A, M) ⊕ H₁(B, M) → H₁(A ∗ B, M) → M → M_A ⊕ M_B → M_{A∗B} → 0`, whose middle map is
  `m ↦ (−[m], [m])`; so the direct-sum formula holds in degree one when `A ∗ B` acts trivially on
  `M`. For a set `S`, `F = FreeGroup S` and every `M : Rep k F`, `Hₙ(F, M) = 0` and
  `Hⁿ(F, M) = 0` for `n ≥ 2` (`freeGroup_isZero_of_two_le`; for `S, k : Type` and trivial
  coefficients `k` the homological vanishing is Tau Ceti's `TauCeti.isZero_groupHomology_freeGroup`,
  and the target adds every coefficient representation, cohomology and the universe `u`), and
  `0 → H₁(F, M) → M^{(S)} → M → H₀(F, M) → 0` is exact, from the action of `F` on its Bass–Serre
  tree for the rose with trivial groups (§§4.1–4.2, 4.7, and §2.2 for the identification with
  `FreeGroup S`).

*Needs:* 3.5; FreeGroupsAndLimitGroups §2.2, §§4.1–4.2, §4.5, §4.7; Mathlib `Monoid.PushoutI`,
`Monoid.Coprod`, `HNNExtension`, `FreeGroup`, `groupHomology.map`.

**Checks.**

- `ℤ/4 ∗_{ℤ/2} ℤ/6` (the amalgam presenting `SL₂(ℤ)`, FreeGroupsAndLimitGroups §4.8) has
  `H₁ = ℤ/12`: the cokernel of `ℤ/2 → ℤ/4 ⊕ ℤ/6`, `1 ↦ (−2, 3)`, is cyclic of order `12`, and
  `H₀(C) → H₀(A) ⊕ H₀(B)` is injective.
- For `BS(1, 2) = HNNExtension ℤ ℤ (2ℤ) (×2)`, `H₁ = ℤ`: the map `H₁(A) → H₁(H)` is
  `1 − 2 = −1`, an isomorphism, and `H₀(A) → H₀(H)` is `1 − 1 = 0`; the sum would give
  `1 + 2 = 3` and `1 + 1 = 2`, hence `H₁ = ℤ/3`.
- For `F = FreeGroup S` and trivial `ℤ`, `H₁(F, ℤ) = ℤ^{(S)}` and `Hₙ(F, ℤ) = 0` for `n ≥ 2`; the
  free product `ℤ/2 ∗ ℤ/2` has `Hₙ = (ℤ/2)²` for odd `n` and `0` for even `n ≥ 2`.
- The degree-one direct sum fails for twisted coefficients: for `ℤ ∗ ℤ = FreeGroup {a, b}` and
  `M = ℤ` with both generators acting by `−1`, the free-group sequence gives
  `H₁ = ker(ℤ² → ℤ, (m_a, m_b) ↦ −2m_a − 2m_b) ≅ ℤ`, while `H₁(ℤ, M) = ker(−2) = 0` for each factor.
  The missing summand is the kernel of `M → M_A ⊕ M_B = (ℤ/2)²`, `m ↦ (−m, m)`, which is `2ℤ ≅ ℤ`.

### Examples

The infinite dihedral group `ℤ/2 ∗ ℤ/2` acts on the line with two vertex orbits (stabilisers
`ℤ/2`) and one edge orbit (trivial stabiliser); 3.5 gives `H₁ = (ℤ/2)²` and the even groups zero.

### Dependencies

Layers 1–2; FreeGroupsAndLimitGroups §§2.2, 4.1–4.2, 4.5–4.7, and §4.8 for a Check; Tau Ceti's
Serre trees; AlgebraicTopology §5.3 for a Check.

---

## Layer 4: cup and cap products

### 4.1 The cochain cup product

Define, for `M N P : Rep k G` and `μ : M ⊗ N ⟶ P`, the cup product of inhomogeneous cochains by the
formula of the Conventions, and prove the Leibniz rule `d(φ ∪ ψ) = dφ ∪ ψ + (−1)^p φ ∪ dψ`
(HS53 Ch. II §1, pp. 118–119; MilneCFT Ch. II Prop. 1.38, proof, p. 73). Define
the induced `k`-bilinear map `∪_μ : Hᵖ(G, M) × H^q(G, N) → H^{p+q}(G, P)`. *Needs:* Mathlib
`groupCohomology.cochainsFunctor`, the monoidal structure of `Rep.{u} k G`.

- The cochain product is `k`-bilinear and natural in `μ`: for `f : P ⟶ P'`,
  `φ ∪_{μ ≫ f} ψ = f ∘ (φ ∪_μ ψ)`.
- Cocycles multiply to cocycles and a coboundary times a cocycle is a coboundary, so `∪_μ`
  descends to cohomology.
- In degree `(0, 0)`, `∪_μ` is `(m, n) ↦ μ(m ⊗ n)` on invariants.

**Checks.**

- For `G = ℤ/2`, `k = 𝔽₂` with trivial action and `x ∈ H¹(G, 𝔽₂)` the nonzero class,
  `(x ∪ x)(g, g) = 1` for the generator `g`, and `x ∪ x` is the nonzero class of `H²(G, 𝔽₂)`.
- The witness of the Conventions: on `ℤ²` the product of the two projections pairs to `+1` with
  `[e₁|e₂] − [e₂|e₁]`; the convention with the factor `(−1)^{pq}` gives `−1`.
- A model omitting the action `(g₁⋯g_p)·` on the second factor does not send cocycles to
  cocycles: for `G = ℤ`, `M = ℤ` trivial, `N = P = ℤ[ℤ]` with `μ` the scalar multiplication,
  `φ = id` and the cocycle `ψ` with `ψ(1) = 1`, its coboundary at `(1, 1, 1)` is `2(t − 1) ≠ 0`.

### 4.2 Connecting maps and uniqueness

Prove that for a short exact sequence `0 → M' → M → M'' → 0` whose tensor product with `N` is short
exact, and compatible pairings, `δx'' ∪ y = δ(x'' ∪ y)`; and for `0 → N' → N → N'' → 0` whose
tensor product with `M` is short exact, `x ∪ δy'' = (−1)^p δ(x ∪ y'')` (MilneCFT Ch. II Prop. 1.38(c),
(d), p. 73). Prove that the cup product on the pairings `𝟙 : M ⊗ N ⟶ M ⊗ N` is the unique family of
bilinear maps natural in `M` and `N`, equal to the product of invariants in degree `(0, 0)`, and
satisfying these two rules for the coinduction sequences `0 → M → Coind M → Coind M / M → 0`, which
stay exact after tensoring because they are split over `k` (MilneCFT Ch. II Prop. 1.38, p. 73).
*Needs:* 4.1; Tau Ceti `Rep.dimensionShiftUp`.

**Checks.**

- The exactness hypothesis is used: for `k = ℤ`, `0 → ℤ →2 ℤ → ℤ/2 → 0` tensored with `N = ℤ/2`
  is not exact, and the rule cannot be stated for it.
- In bidegree `(0, 0)` the rule says `δ(m'') ∪ n = δ(m'' ⊗ n)` for `m'' ∈ (M'')^G`, the definition of
  the connecting map applied to `μ`.
- The family `(−1)^{pq} x ∪ y` (the convention of Loh19 Outlook 3.2.28) satisfies
  `x ∪ δy = δ(x ∪ y)` and `δx ∪ y = (−1)^q δ(x ∪ y)`; it agrees with `∪` in bidegrees `(0, q)` and
  `(p, 0)` and is its negative on `H¹(ℤ², ℤ) × H¹(ℤ², ℤ)`. The left rule excludes it.

### 4.3 Identities

Prove that `∪` is unital (`1 ∈ H⁰(G, k)` with the unitor), associative for compatible pairings
(`μ ∘ (μ₁₂ ⊗ 1) = ν ∘ (1 ⊗ ν₂₃)` up to the associator gives `(x ∪ y) ∪ z = x ∪ (y ∪ z)`), graded
commutative (`x ∪_μ y = (−1)^{pq} y ∪_{μ'} x` with `μ'` the composite of `μ` with the braiding), and
natural for compatible pairs `f : G' →* G` with coefficient maps commuting with the pairings; in
particular for restriction to any subgroup, inflation from any quotient, and coefficient maps
(MilneCFT Ch. II Prop. 1.39(a), (b), (c), (e), pp. 73–74). Associativity and naturality hold on
cochains; graded commutativity holds in cohomology, by the uniqueness of 4.2. *Needs:* 4.1, 4.2.

**Checks.**

- For `G` trivial, `∪` is `μ` in degree `0` and there is nothing in positive degrees.
- On `H*(ℤ/2, 𝔽₂)` graded commutativity is commutativity, and `x² ≠ 0` for `x` of degree `1`; on
  `H*(ℤ², ℤ)`, `x ∪ y = −y ∪ x` for the two projections, by the witness of the Conventions.
- Graded commutativity fails on cochains: for `ℤ²` the cochains `x ∪ y` and `−y ∪ x` differ at
  `(e₁, e₂)` (values `1` and `0`), and are cohomologous.

### 4.4 Diagonal approximations

Define a *diagonal approximation* of a projective resolution `P` of `k` as a chain map
`Δ : P ⟶ P ⊗ P` of complexes of representations (diagonal action) lifting the isomorphism
`k ≅ k ⊗ k`. The Alexander–Whitney map
`(g₀, …, gₙ) ↦ Σ_{p+q=n} (g₀, …, g_p) ⊗ (g_p, …, gₙ)` on `Rep.standardResolution` is Tau Ceti's
`CategoryTheory.SimplicialObject.alexanderWhitney` of two copies of the simplicial object of
`Rep k G` whose alternating face map complex is `Rep.standardComplex` (the linearization of
`classifyingSpaceUniversalCover G`), composed with the map of complexes induced by the diagonal of
that simplicial object, the linearization of `x ↦ (x, x)` followed by the comultiplication of the
monoidal functor `Rep.linearization`, which sends `(g₀, …, gₙ)` to `(g₀, …, gₙ) ⊗ (g₀, …, gₙ)` in
degree `n` of the degreewise tensor product (not in degree `2n` of `P ⊗ P`, the non-example below).
Prove that this composite lifts `k ≅ k ⊗ k` (in degree `0` it sends `(g₀)` to `(g₀) ⊗ (g₀)`, and
both augmentations give `1`), so that it is a diagonal approximation; that any
two diagonal approximations of resolutions are chain homotopic after the comparison maps; and that
the cup product along `Δ`, which is Tau Ceti's `TauCeti.ChainComplex.cup` in `Rep k G` for
`A = B = E = P` and `D = Δ` (on cochains `μ ∘ (φ ⊗ ψ) ∘ Δ`, with the Leibniz rule
`TauCeti.ChainComplex.d_comp_cupCochain`, whose sign is that of 4.1), computes `∪_μ` through
`groupCohomologyIso` for every `P` and `Δ` (Brown82 Ch. V; HS53 Ch. II §1, pp. 118–119 for the
cochain formula). *Needs:* 4.1; Mathlib `Rep.standardResolution`, `Rep.standardComplex`,
`Rep.linearization`, `groupCohomologyIso`; Tau Ceti `CategoryTheory.SimplicialObject.alexanderWhitney`,
`CategoryTheory.SimplicialObject.alexanderWhitney_f`, `TauCeti.ChainComplex.cupCochain`,
`TauCeti.ChainComplex.d_comp_cupCochain`, `TauCeti.ChainComplex.cup`.

- A diagonal approximation exists for every projective resolution and is unique up to chain
  homotopy; the comparison theorem gives the homotopy.
- The cup product computed with `(P, Δ)` is independent of the choice and equal to 4.1 through
  `groupCohomologyIso`.

**Checks.**

- For `G` trivial and `P = k` in degree `0`, `Δ` is the unitor.
- For `G = ℤ/2` and `𝔽₂`, the cup product computed with the Alexander–Whitney map on the standard
  resolution and with any diagonal approximation of the periodic resolution (Loh19 Prop. 1.6.11,
  p. 48) both give `x² ≠ 0` for the nonzero `x ∈ H¹`.
- The map `(g₀, …, gₙ) ↦ (g₀, …, gₙ) ⊗ (g₀, …, gₙ)` raises degree from `n` to `2n` and is not a
  diagonal approximation.

### 4.5 The projection formula

Prove that for `H ≤ G` of finite index, `x ∈ Hᵖ(H, M)` and `y ∈ H^q(G, N)`,
`cor(x ∪ res y) = cor(x) ∪ y` and `cor(res y ∪ x) = y ∪ cor(x)`, for any pairing `μ`, with
`TauCeti.groupCohomology.corestriction` (MilneCFT Ch. II Prop. 1.39(d), p. 74). Route: degree `0`
by the norm formula, then dimension shifting with 4.2 and Tau Ceti's `δ_comp_corestriction`.
*Needs:* 4.2, 4.3; Tau Ceti `TauCeti.groupCohomology.corestriction`,
`TauCeti.groupCohomology.δ_comp_corestriction`.

**Checks.**

- For `H = G`, both sides are `x ∪ y`.
- For `x = res z`, the formula gives `cor(res(z ∪ y)) = [G : H] (z ∪ y)`, consistent with
  `map_subtype_id_comp_corestriction`.
- For finite `G` it agrees through 4.7(a) with `TauCeti.TateCohomology.cup_projection`.

### 4.6 Cap product and evaluation

Define, for `μ : M ⊗ N ⟶ P`, the cap product `∩ : Hᵖ(G, M) ⊗ Hₙ(G, N) → Hₙ₋ₚ(G, P)` (zero for
`p > n`) through a diagonal approximation (4.4) (Brown82 Ch. V). Define, for a `k`-module `A` with
trivial action, the evaluation pairing `⟨−, −⟩ : Hⁿ(G, Hom_k(M, A)) ⊗ Hₙ(G, M) → A`, with the
contragredient action on `Hom_k(M, A)`, on inhomogeneous representatives by
`⟨φ, Σ_i a_i [g_{i,1}|…|g_{i,n}] ⊗ m_i⟩ = Σ_i a_i φ(g_{i,1}, …, g_{i,n})(m_i)`. With Mathlib's
differentials of inhomogeneous chains and cochains, `⟨dφ, c⟩ = ⟨φ, ∂c⟩` with no sign, so the
pairing descends to classes. *Needs:* 4.4, 4.3; Tau Ceti `TauCeti.groupHomology.transfer`,
`TauCeti.ChainComplex.capChain`, `TauCeti.ChainComplex.capChain_comp_d`,
`TauCeti.ChainComplex.kronecker`, `HomologicalComplex.coinvariantsTensorObjLinearYonedaObjIso`,
`Rep.groupCohomologyIhomIso`; Mathlib `groupHomologyIso`; IntegralIwasawaTheoryPartII §0.7 for
the comparison.

- `1 ∩ z = z`, `(x ∪ y) ∩ z = x ∩ (y ∩ z)` for compatible pairings, and naturality in coefficients.
- Projection formula for `f : G' →* G`: `f_*(f^*x ∩ z) = x ∩ f_*z`.
- Finite index: for `H ≤ G` of finite index, `tr(y ∩ z) = res y ∩ tr z` and
  `cor(x ∩ tr z) = cor(x) ∩ z`, with `tr = TauCeti.groupHomology.transfer`; the first `cor` is the
  homological corestriction `Hₙ₋ₚ(H, P) → Hₙ₋ₚ(G, P)` and the second the cohomological
  corestriction `Hᵖ(H, M) → Hᵖ(G, M)`.
- Adjunction: for `x ∈ Hᵖ(G, Hom_k(M', A))`, `y ∈ H^q(G, Hom_k(M, M'))` and `z ∈ H_{p+q}(G, M)`,
  with composition as the pairing of the cup product and evaluation as the pairing of the cap
  product, `⟨x ∪ y, z⟩ = ⟨x, y ∩ z⟩`. For `x = 1` this says that `⟨y, z⟩` is the image of `y ∩ z`
  under `H₀(G, A) = A`; the law fixes the cap product as the adjoint of the cup product, without
  sign.
- Chain-level form: let `X` be a projective resolution of `k` with a diagonal approximation `Δ`,
  `y` a cochain of degree `q` and `c` a chain of degree `n`. Then `y ∩ c` is `(−1)^{q(n−q)}` times
  the image under coinvariants of Tau Ceti's `TauCeti.ChainComplex.capChain` in `Rep k G` for the
  diagonal `X ⊗ N → X ⊗ (X ⊗ N)` given by `Δ`, the symmetry `u ⊗ v ↦ (−1)^{|u||v|} v ⊗ u` of
  `X ⊗ X` and the associator, and for the action `M ⊗ (X ⊗ N) → X ⊗ P` that moves `M` past `X`
  and applies `μ`. With the symmetry the cochain is evaluated on the back face, and the factor
  `(−1)^{q(n−q)}` cancels the sign of the symmetry; the boundary formula
  `TauCeti.ChainComplex.capChain_comp_d` gives the descent to classes. Since `Δ` followed by the
  symmetry is again a diagonal approximation, homotopic to `Δ` (4.4), on a class `z` of degree `n`
  the front-face product along `Δ` itself is `(−1)^{q(n−q)} y ∩ z`.
- Kronecker form: through `Rep.groupCohomologyIhomIso`, whose cochain-level isomorphism
  `HomologicalComplex.coinvariantsTensorObjLinearYonedaObjIso` sends `φ` to `[m ⊗ x] ↦ φ(x)(m)`,
  and `groupHomologyIso`, both for the bar resolution `X = Rep.barResolution k G`, the evaluation
  pairing is Tau Ceti's `TauCeti.ChainComplex.kronecker` for the complex `(M ⊗ X)_G` and the object
  `A`.
- Comparison: for `k = A = ℂ_p` and a `ℂ_p[G]`-module `M`, the evaluation pairing
  `Hⁿ(G, M^∨) ⊗ Hₙ(G, M) → ℂ_p` is the cap product of IntegralIwasawaTheoryPartII §0.7: under the
  standard passage `[g₁|…|gₙ] ↔ (1, g₁, g₁g₂, …, g₁⋯gₙ)` between inhomogeneous and homogeneous
  (co)chains both evaluate a cocycle on a chain without sign.

**Checks.**

- For `G = ℤ/2` and `𝔽₂`, the evaluation `H¹(G, 𝔽₂) ⊗ H₁(G, 𝔽₂) → 𝔽₂` is a perfect pairing of
  one-dimensional spaces.
- In degree `p = n = 0`, `x ∩ z = [μ(x ⊗ n)]` for `x ∈ M^G`, `z = [n] ∈ N_G`.
- The degree-`0` case of the finite-index formula: for `x ∈ M^H` and `z = [n]`, both sides of
  `cor(x ∩ tr z) = cor(x) ∩ z` are `Σ_{gH ∈ G/H} [μ(g·x ⊗ n)]`, because the inverses of
  representatives of `H\G` represent `G/H`; for `G` trivial both sides are `[μ(x ⊗ n)]`.
- The evaluation is pinned against the cup product: for the coordinate classes `x, y` of `ℤ²` and
  the cycle `[e₁|e₂] − [e₂|e₁]`, `⟨x ∪ y, [e₁|e₂] − [e₂|e₁]⟩ = 1 − 0 = 1`, the value fixed in the
  Conventions, while `⟨y ∪ x, [e₁|e₂] − [e₂|e₁]⟩ = 0 − 1 = −1`; a pairing of `x ∪ y` that ignored
  the order of the arguments would give `0`.
- The face is pinned: for the same `x`, `y` and `z = [e₁|e₂] − [e₂|e₁]`, with trivial coefficients
  the back-face product sends `[g₁|g₂]` to `y(g₂)[g₁]`, so `y ∩ z = y(e₂)[e₁] − y(e₁)[e₂] = [e₁]` and
  `⟨x, y ∩ z⟩ = 1 = ⟨x ∪ y, z⟩`. The front-face product of `TauCeti.ChainComplex.capChain` along
  the Alexander–Whitney map sends `[g₁|g₂]` to `y(g₁)[g₂]` and gives `−[e₁]`, which is
  `(−1)^{q(n−q)} = (−1)^{1·1}` times `y ∩ z` and would make the adjunction law fail.

### 4.7 Agreement with the library's other cup products

Prove:

- **(a) Tate.** For `[Fintype G]` and `p, q ≥ 1`, the isomorphisms
  `TateCohomology.isoGroupCohomology` carry the cup product of 4.1 for `𝟙 : M ⊗ N ⟶ M ⊗ N` to
  `TauCeti.TateCohomology.cup M N p q (p + q)`; in degree `0` the quotient `H⁰ → Ĥ⁰` intertwines
  them. Route: both satisfy the axioms of 4.2 in positive degrees, and the uniqueness argument
  of MilneCFT Ch. II Prop. 1.38, p. 73 (dimension shifting along the
  coinduction sequences), applies with its degree `(0, 0)` normalization read through the
  quotient `H⁰ → Ĥ⁰`.
- **(b) Discrete groups.** For `G` with the discrete topology and discrete coefficients, the
  isomorphisms `Θ` of 1.5 carry `TauCeti.TopPairing.cup` of a pairing to the cup product of 4.1
  of the same pairing.
- **(c) Profinite groups.** For profinite `G` and discrete `M, N`, under the finite-quotient
  colimit `TauCeti.ContCohomology.continuousFiniteQuotientColimit` (ProfiniteCohomology §10.1) and
  `Θ` for each finite quotient `G ⧸ U`, `TauCeti.TopPairing.cup` is the colimit of the cup
  products of 4.1 on the groups `G ⧸ U` with coefficients `M^U, N^U`.

The abstract group cohomology of a profinite group is not compared with its continuous cohomology.
The three statements compare the pinned `TauCeti.TateCohomology.cup` and `TauCeti.TopPairing.cup`
with the cup product of 4.1; they are fixed by those definitions and are taken from no source,
which supplies only the uniqueness used in the route of (a).
*Needs:* 1.5, 4.2, 4.3; Tau Ceti `TauCeti.TateCohomology.cup`, `TauCeti.TopPairing.cup`,
`TauCeti.ContCohomology.continuousFiniteQuotientColimit`; Mathlib `TateCohomology.isoGroupCohomology`;
ProfiniteCohomology §10.1 and Layer 12.

**Checks.**

- For `G = ℤ/2`, both cups send `(x, x)` to the nonzero class of `H²(G, 𝔽₂) = Ĥ²(G, 𝔽₂)`.
- In bidegree `(0, q)` with `q ≥ 1` the Tate cup uses `Ĥ⁰ = M^G / N_G M`: an element of the norm
  image multiplies to zero in `Ĥ^q`, as it does in `H^q` by the projection formula; the comparison
  in degree `0` goes through the quotient, not an isomorphism.
- For `G = ∏_ℕ ℤ/p` with the product topology, `H¹_cont(G, 𝔽_p) = ⊕_ℕ 𝔽_p` is countable while
  the abstract `H¹(G, 𝔽_p) = Hom(G, 𝔽_p)` is uncountable; (c) compares the continuous cup with the
  finite quotients only.

### Examples

`H*(ℤ/2, 𝔽₂) = 𝔽₂[x]` with `x` in degree `1`, and `H*(ℤ², ℤ) = Λ(x, y)`; the cap product with the
fundamental class `[e₁|e₂] − [e₂|e₁]` of `ℤ²` sends `x ∪ y` to `1 ∈ H₀`.

### Dependencies

Layers 1–2; Tau Ceti's corestriction, transfer, Tate and continuous cups and finite-quotient
colimit; Tau Ceti's Alexander–Whitney map of simplicial objects, for 4.4; Tau Ceti's cup and cap
products along a diagonal, Kronecker map and identification of `Hom((A ⊗ P)_G, N)` with
`Hom_G(P, Hom_k(A, N))`; ProfiniteCohomology §10.1 and Layer 12.

---

## Layer 5: products of groups and abelian groups

### 5.1 The Künneth theorem in homology

Prove, for groups `G, H : Type u`, `M : Rep k G`, `N : Rep k H` and `M ⊠ N` the tensor product of
`Res_{pr₁} M` and `Res_{pr₂} N` in `Rep k (G × H)`, that the inhomogeneous chains satisfy a natural
homotopy equivalence `C(G; M) ⊗_k C(H; N) ≃ C(G × H; M ⊠ N)` of chain complexes of `k`-modules:
the tensor product of the standard resolutions is a projective resolution of `k` over `G × H`,
because each is contractible over `k` (Loh19 proof of Cor. 3.2.23, p. 136). Define the natural cross
product `× : H_p(G, M) ⊗_k H_q(H, N) → H_{p+q}(G × H, M ⊠ N)` as the map induced by the
Eilenberg–Zilber shuffle map of the standard resolutions: a `(p, q)`-shuffle contributes its sign,
so for trivial coefficients `[g] × [h] = [(g, 1)|(1, h)] − [(1, h)|(g, 1)]`. The shuffle map is Tau
Ceti's `SSet.shuffle` for the underlying simplicial sets of `classifyingSpaceUniversalCover G` and
`classifyingSpaceUniversalCover H` with coefficients `k`, whose simplicial chains
(`SSet.chainComplex`) are, through the isomorphisms `⊕_{G^{n+1}} k ≅ k[G^{n+1}]`, the underlying
complexes of `k`-modules of the standard resolutions; their product has the `n`-simplices
`G^{n+1} × H^{n+1} = (G × H)^{n+1}` and is, up to that bijection, the underlying simplicial set of
`classifyingSpaceUniversalCover (G × H)`. It is `G × H`-equivariant by `SSet.shuffle_naturality`,
each element acting by a simplicial automorphism, and it is the identity on vertices
(`SSet.ιChainComplex_tensorHom_ιChainComplex_shuffle_f_zero`), so it lifts `k ⊗ k ≅ k` and the
comparison theorem makes it a homotopy equivalence of resolutions over `G × H`; over `k` its
homotopy inverse is the Alexander–Whitney map (`SSet.eilenbergZilberHomotopyEquiv`). Its sign is
the one above: by `SSet.ιChainComplex_tensorHom_ιChainComplex_shuffle_f_one_one` the edges
`x = (1, g)` and `y = (1, h)` go to `(s₁x, s₀y) − (s₀x, s₁y)`, the simplices
`((1, 1), (g, 1), (g, h))` and `((1, 1), (1, h), (g, h))`, which are `[(g, 1)|(1, h)]` and
`[(1, h)|(g, 1)]` under `(x₀, x₁, x₂) ↦ [x₀⁻¹x₁|x₁⁻¹x₂]`, the passage under which Mathlib's
differential reads `d[x|y] = [y] − [xy] + [x]` for trivial coefficients. Prove that if `k` has global
dimension at most one and one of `M`, `N` is flat over `k`, then
`0 → ⊕_{p+q=n} H_p(G, M) ⊗ H_q(H, N) → Hₙ(G × H, M ⊠ N) → ⊕_{p+q=n−1} Tor₁^k(H_p(G, M), H_q(H, N)) → 0`
is exact for every `n`, natural in compatible pairs on both factors, and split (not naturally); and
that over a field the cross product is an isomorphism (Loh19 Thm. 3.2.22 and Cor. 3.2.23,
pp. 135–136, for a principal ideal domain and one complex of flat modules; Brown82 Ch. V). Route:
through the homotopy equivalence the sequence is the Künneth sequence of the complexes
`K = C(G; M)` and `L = C(H; N)`, whose terms are direct sums of copies of `M` and of `N`, read as
cochain complexes in degrees `≤ 0`; over `k`, `Tor_i^k = 0` for `i ≥ 2`. If `M` is flat, `K` is a
bounded-above complex of flat modules, so `K ⊗ L` computes `K ⊗^L L`, and
SpectralSequencesAndConvergencePartII §4.3 gives the exact sequence, with the cross product as
first map, natural in both complexes by `gap:flat-kunneth`; if `N` is flat, exchange the factors
along `G × H ≅ H × G`, using the symmetry of `Tor₁^k` and the graded commutativity of the cross
product, which changes the first map only by a sign on each summand. For the splitting, choose
quasi-isomorphisms `K′ → K` and `L′ → L` from complexes of projective `k`-modules in degrees `≤ 0` (Tau Ceti
`CochainComplex.exists_quasiIso_projective`, with Mathlib's `ComplexShape.embeddingDownNat`). Over
`k` the cycles of `K′` and `L′` and the quotients by their cycles are projective, so the cycles
split off (Tau Ceti `HomologicalComplex.projective_cycles_of_hasProjectiveDimensionLE_one`,
`HomologicalComplex.projective_cokernel_iCycles_of_hasProjectiveDimensionLE_one`,
`HomologicalComplex.isSplitMono_iCycles_of_projective`), and
`HomologicalComplex.homologyKunnethShortComplexSplitting` gives a retraction of the cross product
of `K′` and `L′`. The map `K′ ⊗ L′ → K ⊗ L` is the composite of two maps, each the tensor product
of a quasi-isomorphism with a K-flat complex (`K′`, `L′` and the flat one of `K`, `L` are
bounded-above complexes of flat modules), hence a quasi-isomorphism (Tau Ceti
`CochainComplex.isKFlat_of_boundedAbove_flat`, `CochainComplex.quasiIso_id_tensorHom`); the cross
product is natural, so the retraction transports to one of the cross product of `K` and `L`. When
`N` is projective, Tau Ceti's `HomologicalComplex.homologyKunnethShortComplex_shortExact` gives the
sequence directly, with no condition on `M`. Prove also, for every commutative ring `k`, with no
condition on its global dimension: if `N` is projective over `k` and `H_q(H, N)` is projective over
`k` for every `q`, then for every `M : Rep k G` the cross product
`⊕_{p+q=n} H_p(G, M) ⊗_k H_q(H, N) → Hₙ(G × H, M ⊠ N)` is an isomorphism for every `n`; over a
field every module is projective, so this contains the field case above. Route: `L = C(H; N)` is a
complex of projective `k`-modules indexed by `ℕ` with projective homology, so its cycles are
projective and split off its terms (Tau Ceti `ChainComplex.projective_cycles_of_projective_homology`,
`ChainComplex.isSplitMono_iCycles_of_projective_homology`), and the quotients `L_q / Z_q`, direct
summands of the projective `L_q`, are projective; Tau Ceti's
`HomologicalComplex.homologyKunnethShortComplex_shortExact`, which assumes nothing of `k`, then
gives the Künneth sequence of `C(G; M)` and `L`, whose terms `Tor₁^k(H_p(G, M), H_q(H, N))` vanish
as `H_q(H, N)` is projective, and the homotopy equivalence above carries it to `G × H`.
*Needs:* Mathlib `Rep.standardResolution`,
`Rep.standardComplex`, `SSet.chainComplex`, `groupHomologyIso`, `ComplexShape.embeddingDownNat`;
SpectralSequencesAndConvergencePartII §4.3 with `gap:flat-kunneth`; Tau Ceti `SSet.shuffle`,
`SSet.shuffle_naturality`, `SSet.ιChainComplex_tensorHom_ιChainComplex_shuffle_f_zero`,
`SSet.ιChainComplex_tensorHom_ιChainComplex_shuffle_f_one_one`,
`SSet.eilenbergZilberHomotopyEquiv`, `HomologicalComplex.homologyCross`,
`HomologicalComplex.homologyKunneth`, `HomologicalComplex.homologyKunnethShortComplex_shortExact`,
`HomologicalComplex.homologyKunnethShortComplexSplitting`,
`CochainComplex.exists_quasiIso_projective`,
`HomologicalComplex.projective_cycles_of_hasProjectiveDimensionLE_one`,
`HomologicalComplex.projective_cokernel_iCycles_of_hasProjectiveDimensionLE_one`,
`HomologicalComplex.isSplitMono_iCycles_of_projective`, `CochainComplex.isKFlat_of_boundedAbove_flat`,
`CochainComplex.quasiIso_id_tensorHom`, `ChainComplex.projective_cycles_of_projective_homology`,
`ChainComplex.isSplitMono_iCycles_of_projective_homology`; InductionRestrictionPartII RS.6.8 for
the comparison.

- The cross product is natural in compatible pairs on both factors and bilinear.
- It is associative and graded commutative under `G × H ≅ H × G`, with the sign `(−1)^{pq}`.
- Degree two, integral: for `k = ℤ`, trivial coefficients `ℤ` and `n = 2` the `Tor` terms vanish,
  `H₀ = ℤ` being free, so the cross product is an isomorphism
  `H₂(G, ℤ) ⊕ (G^ab ⊗ H^ab) ⊕ H₂(H, ℤ) ≅ H₂(G × H, ℤ)`, given on the outer summands by the maps
  induced by the two inclusions and sending `g ⊗ h` to the class of
  `[(g, 1)|(1, h)] − [(1, h)|(g, 1)]`. For abelian `G, H : Type` it is the inverse of the
  degree-two Künneth isomorphism of InductionRestrictionPartII RS.6.8.

**Checks.**

- `H₂(ℤ/2 × ℤ/2, ℤ) = ℤ/2`: the tensor terms give `H₁ ⊗ H₁ = ℤ/2` and the `Tor` terms in total
  degree `1` vanish.
- `H₃(ℤ/2 × ℤ/2, ℤ) = (ℤ/2)³`: two tensor terms `H₃ ⊗ H₀`, `H₀ ⊗ H₃` and one `Tor₁(H₁, H₁)`; the cross
  product alone is not surjective.
- `Hₙ(ℤ/p × ℤ/p, 𝔽_p) = 𝔽_p^{n+1}` (Loh19 Example 3.2.25, p. 137).
- Flat but not projective coefficients: for `k = ℤ`, `G = H = ℤ/2` and trivial actions on
  `M = 𝔽₂` and `N = ℤ[1/3]`, `N` is flat and not projective (every homomorphism `ℤ[1/3] → ℤ`
  vanishes, its value at `1` being divisible by every power of `3`) and `M` is not projective, so
  the projective case says nothing. `H_*(ℤ/2, N)` is `N, ℤ/2, 0, ℤ/2, 0, …` and `H_*(ℤ/2, 𝔽₂)` is
  `𝔽₂` in every degree; in degree `2` the tensor terms `H₁ ⊗ H₁ ⊕ H₂ ⊗ H₀` give `𝔽₂²`, the `Tor`
  terms give `Tor₁(𝔽₂, ℤ/2) ⊕ Tor₁(𝔽₂, ℤ[1/3]) = 𝔽₂`, and `M ⊠ N = 𝔽₂` with
  `H₂(ℤ/2 × ℤ/2, 𝔽₂) = 𝔽₂³`. In degree `0` the sequence is `𝔽₂ ⊗ ℤ[1/3] = 𝔽₂ = H₀`, with no `Tor`
  term.
- One flat factor is needed: for `k = ℤ`, `G = H = 1` and `M = N = ℤ/2`, neither flat,
  `H₁(1, ℤ/2 ⊗ ℤ/2) = 0` while the `Tor` term in degree `1` is `Tor₁(ℤ/2, ℤ/2) = ℤ/2`: the chains
  compute the underived tensor product, and the sequence is not exact.
- No condition on the global dimension in the projective-homology case: `k = ℤ/4` has infinite
  global dimension (`Tor_i^{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2` for every `i ≥ 1`), so the sequence of the main
  statement does not apply; for `G = H = ℤ` and `M = N = k` with trivial action, `H_q(ℤ, k)` is
  `k, k, 0, 0, …`, free over `k`, and `Hₙ(ℤ², ℤ/4)` is `ℤ/4`, `(ℤ/4)²`, `ℤ/4` for `n = 0, 1, 2` and
  `0` above, the tensor products of the homology of the two factors.

### 5.2 Universal coefficient sequences

Prove, for `k` of global dimension at most one, any group `G` and a `k`-module `A` with trivial
action, natural short exact sequences, split but not naturally,
`0 → Hₙ(G, k) ⊗_k A → Hₙ(G, A) → Tor₁^k(Hₙ₋₁(G, k), A) → 0` and
`0 → Ext¹_k(Hₙ₋₁(G, k), A) → Hⁿ(G, A) → Hom_k(Hₙ(G, k), A) → 0`, the second map being the
evaluation of 4.6, which is Tau Ceti's `TauCeti.ChainComplex.kronecker` for the chains `C(G; k)`
(Loh19 Cor. 3.2.20, p. 133, proves the homological sequence, natural and
split but not naturally, for a complex of free modules over a principal ideal domain; Loh19
Cor. 3.2.21, p. 135, applies it to group homology over `ℤ` and records only
the resulting direct-sum decomposition; Loh19 Outlook 3.2.26, p. 138,
mentions the cohomological sequence without stating it; the generality here, `k` of global
dimension at most one and both sequences, is that of the route). Global dimension at most one is
the hypothesis that every `k`-module has projective dimension at most one, Mathlib's
`HasProjectiveDimensionLE X 1` for every `X : ModuleCat k`, which holds over a principal ideal
domain by Tau Ceti's instance `ModuleCat.hasProjectiveDimensionLE_one_of_isPrincipalIdealRing`.
Define the evaluation `cohomologyEvaluation`, a `k`-linear map `Hⁿ(G, A) → Hom_k(Hₙ(G, k), A)`, as
the evaluation of 4.6 for `M = k`, read through `A ≅ Hom_k(k, A)` (Mathlib's
`CategoryTheory.MonoidalClosed.unitNatIso`, the monoidal unit of `Rep k G` being
`Rep.trivial k G k`): Tau Ceti's `TauCeti.ChainComplex.kronecker` for the inhomogeneous chains
`C(G; k)`, through `Rep.groupCohomologyIhomIso` for the bar resolution and Mathlib's
`groupHomology.inhomogeneousChainsIso`. Define `extToCohomology`, a `k`-linear map
`Ext¹_k(Hₙ(G, k), A) → Hⁿ⁺¹(G, A)`, as Tau Ceti's `TauCeti.ChainComplex.extToHomology` for
`C(G; k)` through the same identifications: the class of `β : Bₙ → A`, on the boundaries of
`C(G; k)` in degree `n`, goes to the class of the cocycle `Cₙ₊₁(G; k) → Bₙ → A`. The cohomological sequence in
degree `n + 1` is `universalCoefficient_cohomology`: `extToCohomology` is injective, its image is
the kernel of `cohomologyEvaluation`, and `cohomologyEvaluation` has a `k`-linear right inverse; in
degree `0` the `Ext` term is `0` and the evaluation is bijective (Tau Ceti's
`TauCeti.ChainComplex.kronecker_bijective_of_isIso`, no differential leaving degree `0`). Route: the
chains with trivial coefficients are free `k`-modules, `C(G; A) = C(G; k) ⊗_k A` and
`C(G; A)^* = Hom_k(C(G; k), A)` (Tau Ceti's `HomologicalComplex.coinvariantsTensorObjLinearYonedaObjIso`
for the trivial representation `k`, with `Hom_k(k, A) = A`); apply Tau Ceti's Künneth sequence
with `A` in degree `0`; and `TauCeti.ChainComplex.extToHomology_injective` and
`TauCeti.ChainComplex.exact_extToHomology_kronecker`, whose hypotheses (projective cycles split
off the terms) hold over `k` by `HomologicalComplex.projective_cycles_of_hasProjectiveDimensionLE_one`
and `HomologicalComplex.isSplitMono_iCycles_of_projective`, with the section
`TauCeti.ChainComplex.kroneckerSection` (`TauCeti.ChainComplex.kronecker_surjective_of_isSplitMono`)
for the splitting. *Needs:* 4.6; Tau Ceti
`HomologicalComplex.homologyKunnethShortComplex_shortExact`, `TauCeti.ChainComplex.extToHomology`,
`TauCeti.ChainComplex.exact_extToHomology_kronecker`, `TauCeti.ChainComplex.extToHomology_injective`,
`TauCeti.ChainComplex.kronecker`, `TauCeti.ChainComplex.kroneckerSection`,
`TauCeti.ChainComplex.kronecker_surjective_of_isSplitMono`,
`TauCeti.ChainComplex.kronecker_bijective_of_isIso`, `TauCeti.ChainComplex.linearYonedaFunctor`,
`HomologicalComplex.coinvariantsTensorObjLinearYonedaObjIso`, `Rep.groupCohomologyIhomIso`,
`HomologicalComplex.projective_cycles_of_hasProjectiveDimensionLE_one`,
`HomologicalComplex.isSplitMono_iCycles_of_projective`,
`TauCeti.groupHomology.transfer_comp_map_subtype_id`; Mathlib `CategoryTheory.MonoidalClosed.unitNatIso`,
`groupHomology.inhomogeneousChainsIso`, `Rep.barResolution`, `CategoryTheory.HasProjectiveDimensionLE`,
`CategoryTheory.Abelian.Ext`; ArithmeticGaloisDuality §D7.2 for the comparison.

- Comparison: for finite `G` and `k = ℤ` the homological sequence is that of
  ArithmeticGaloisDuality §D7.2. For `m ≥ 1`, `Hₘ(G, ℤ)` is killed by `|G|` (corestriction after
  transfer to the trivial subgroup, `TauCeti.groupHomology.transfer_comp_map_subtype_id`), so
  `Hom(Hₘ(G, ℤ), ℤ) = 0` and the cohomological sequence with `A = ℤ` in degree `n + 1` is §D7.2's
  `H^{n+1}(G, ℤ) ≅ Ext¹(Hₙ(G, ℤ), ℤ)` for every `n ≥ 0`. For a field `k` and `A = k` the `Ext` term
  vanishes and the evaluation is the duality `Hⁿ(G, k) ≅ Hom_k(Hₙ(G, k), k)`, §D7.2's for a finite
  field and finite `G`.

**Checks.**

- `H¹(ℤ/2, 𝔽₂) = Hom(ℤ/2, 𝔽₂)` and `H²(ℤ/2, 𝔽₂) = Ext¹(ℤ/2, 𝔽₂) = 𝔽₂` for `k = ℤ`.
- For a field `k` the `Tor` and `Ext` terms vanish and `Hⁿ(G, A) = Hom(Hₙ(G, k), A)`.
- `H₂(ℤ/2, ℤ/2) = H₂(ℤ/2, ℤ) ⊗ ℤ/2 ⊕ Tor(H₁(ℤ/2, ℤ), ℤ/2) = 0 ⊕ ℤ/2`; the sequence without the
  `Tor` term would give `0`.
- The `Hom` term is needed for infinite groups: for `G = ℤ`, `k = A = ℤ` and `n = 1`,
  `Ext¹(H₀(ℤ, ℤ), ℤ) = Ext¹(ℤ, ℤ) = 0` and `H¹(ℤ, ℤ) = Hom(H₁(ℤ, ℤ), ℤ) = Hom(ℤ, ℤ) = ℤ`, while the
  finite-group formula `H^{n+1}(G, ℤ) ≅ Ext¹(Hₙ(G, ℤ), ℤ)` of ArithmeticGaloisDuality §D7.2 would
  give `0` at `n = 0`; for finite `G`, `H¹(G, ℤ) = Hom(G, ℤ) = 0 = Ext¹(ℤ, ℤ)`.
- The hypothesis on `k` is needed: `k = ℤ/4` has a module of infinite projective dimension, `ℤ/2`.
  For `G = ℤ/2` and `A = ℤ/2`, `H₁(ℤ/2, ℤ/4) = ℤ/2`, `H₂(ℤ/2, ℤ/4) = (ℤ/4)[2] ≅ ℤ/2` and
  `H²(ℤ/2, ℤ/2) = ℤ/2`, while `Ext¹_{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2` (from the resolution
  `⋯ → ℤ/4 →2 ℤ/4 →2 ℤ/4 → ℤ/2`) and `Hom_{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2`: a short exact sequence
  `0 → ℤ/2 → ℤ/2 → ℤ/2 → 0` does not exist.

### 5.3 The cross product in cohomology

Define `x × y = pr₁^* x ∪ pr₂^* y` for `x ∈ Hᵖ(G, M)`, `y ∈ H^q(H, N)` with the pairing
`Res M ⊗ Res N ⟶ M ⊠ N`. Prove that for a field `k`, trivial coefficients `k`, and `H` such that
`H_q(H, k)` is finite-dimensional for every `q ≤ n`, the map
`⊕_{p+q=n} Hᵖ(G, k) ⊗ H^q(H, k) → Hⁿ(G × H, k)` is an isomorphism (Loh19 Outlook 3.2.26, p. 138,
mentions a group-cohomology Künneth theorem under a finiteness assumption; the statement here
follows from 5.1 and 5.2). Route: over a field `Hⁿ(−, k) = Hom(Hₙ(−, k), k)` by 5.2, 5.1, and
`(V ⊗ W)^* = V^* ⊗ W^*` for finite-dimensional `W`; with the evaluation of 4.6 and the cross product
of 5.1, `⟨x × y, a × b⟩ = ⟨x, a⟩⟨y, b⟩` for trivial coefficients, without sign, because on
normalized representatives (HS53 Ch. II §1, p. 118) only the identity shuffle survives in the
Alexander–Whitney front and back faces. *Needs:* 4.3, 4.6, 5.1, 5.2.

- The cross product is bilinear and natural in compatible pairs on both factors and in the
  coefficients.
- `x × 1 = pr₁^* x` and `1 × y = pr₂^* y`.
- Graded commutativity: under the exchange `τ : G × H ≅ H × G`, `τ^*(y × x) = (−1)^{pq} x × y`, by
  the graded commutativity of 4.3.
- Evaluation: for trivial coefficients, `a ∈ H_p(G, k)` and `b ∈ H_q(H, k)`,
  `⟨x × y, a × b⟩ = ⟨x, a⟩⟨y, b⟩`.
- Künneth: for a field `k` and `H_q(H, k)` finite-dimensional for `q ≤ n`, the cross product is
  an isomorphism onto `Hⁿ(G × H, k)`.

**Checks.**

- `dim Hⁿ(ℤ/p × ℤ/p, 𝔽_p) = n + 1`.
- The finiteness hypothesis is used: for `G = H = ℤ^{(ℕ)}` and `k = ℚ`, `H₁(G, ℚ) = ℚ^{(ℕ)}` and
  `H¹(G, ℚ) = ℚ^ℕ`, and through 5.1 and 5.2 `H²(G × H, ℚ)` is the dual of
  `H₂(G, ℚ) ⊕ (H₁(G, ℚ) ⊗ H₁(H, ℚ)) ⊕ H₂(H, ℚ)`. On the middle summand the cross product vanishes on
  `H²(G, ℚ) ⊗ H⁰` and `H⁰ ⊗ H²(H, ℚ)`, and on `H¹ ⊗ H¹` it is the canonical map
  `ℚ^ℕ ⊗ ℚ^ℕ → (ℚ^{(ℕ)} ⊗ ℚ^{(ℕ)})^*` (by `⟨x × y, a × b⟩ = ⟨x, a⟩⟨y, b⟩`), whose image is the bilinear
  forms of finite rank: a sum `Σ_{m < r} f_m ⊗ g_m` of `r` pure tensors gives a form of rank at
  most `r`. The form `(e_i, e_j) ↦ δ_{ij}` has infinite rank (its restriction to `⟨e₀, …, e_r⟩`
  has rank `r + 1 > r`), so the cross product is not onto. The two spaces both have dimension
  `2^{ℵ₀}` over `ℚ`, so a count of dimensions does not show it.
- For `H` trivial, `x × 1 = pr₁^* x` and the map is `pr₁^*`, an isomorphism.
- Bidegree `(1, 1)` without sign: for `G = H = ℤ`, `k = ℚ`, `x, y` the identity characters and
  `a = [1]`, `b = [1]`, `a × b = [e₁|e₂] − [e₂|e₁]` in `H₂(ℤ², ℚ)` and
  `⟨x × y, a × b⟩ = (x × y)(e₁, e₂) − (x × y)(e₂, e₁) = 1 − 0 = 1 = ⟨x, a⟩⟨y, b⟩`; the Koszul
  factor `(−1)^{|y||a|}` would give `−1`.

### 5.4 The Pontryagin ring of an abelian group

Define, for an abelian group `A` (`CommGroup A`, in `Type u`), the Pontryagin product on
`H•(A, k) = ⊕ₙ Hₙ(A, k)` (trivial coefficients) as the cross product of 5.1 followed by the map
induced by the multiplication `A × A →* A`, and, once degree-one classes are shown to square to
zero, the algebra map `ψ : Λ_k(A ⊗ k) → H•(A, k)` extending `H₁(A, k) ≅ A ⊗ k`; prove the laws and
comparisons below (Brown82 Ch. V). The isomorphism `Λ²A ≅ H₂(A, ℤ)` for every abelian group
`A : Type` is InductionRestrictionPartII RS.6.8's and is not proved here; 5.4 identifies the
degree-two part of `ψ` at `k = ℤ` with it. Routes, for every commutative `k` and with no condition
on its global dimension, through the projective-homology case of 5.1: for torsion-free `A`, the
finitely generated subgroups are free abelian, and for `ℤʳ = ℤ^{r−1} × ℤ` that case with `H = ℤ`
and `N = k`, where `H_q(ℤ, k)` is `k, k, 0, 0, …` (3.6), free over `k`, gives `ψ` bijective by
induction on `r`; then take the colimit over the finitely generated subgroups. For a `ℚ`-algebra
`k` and a finitely generated `A ≅ ℤʳ × F` with `F` finite, the same case with `H = F` and `N = k`
applies, as `H₀(F, k) = k` and `H_q(F, k) = 0` for `q ≥ 1`: corestriction after the transfer to
the trivial subgroup is multiplication by `|F|`, invertible in `k`, and factors through
`H_q(1, k) = 0` (`TauCeti.groupHomology.transfer_comp_map_subtype_id`); so `ℤʳ ⊂ A` induces
`H•(ℤʳ, k) ≅ H•(A, k)`, while `A ⊗ k = kʳ`; then take the colimit. Each colimit is the
directed-union identification of SchemeKTheoryOperations §6.7, whose surjective half is Tau Ceti's
`groupHomology.exists_map_subtype_eq`. For `k = ℤ` in degree `2`, `ψ` and RS.6.8's isomorphism are
additive maps `Λ²A → H₂(A, ℤ)` that agree on the generators `a ∧ b`, both sending `a ∧ b` to the
class of `[a|b] − [b|a]`, so they are equal. *Needs:* 5.1 (its projective-homology case), 3.6;
InductionRestrictionPartII RS.6.8 (the integral degree-two isomorphism); SchemeKTheoryOperations
§6.7 (directed unions); Mathlib `Rep.FiniteCyclicGroup.groupHomologyIsoEven`,
`Rep.FiniteCyclicGroup.groupHomologyIsoOdd`
(`RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean`); Tau Ceti
`groupHomology.exists_map_subtype_eq`, `TauCeti.groupHomology.isZero_groupHomology_of_directed`
(`…/GroupHomology/DirectedUnion.lean`) and `TauCeti.groupHomology.transfer_comp_map_subtype_id`.

- Functoriality: a homomorphism of abelian groups induces a homomorphism of graded `k`-algebras.
- Algebra laws: the product is associative and unital, with unit `1 ∈ H₀(A, k) = k`, and graded
  commutative, `xy = (−1)^{|x||y|} yx`.
- Degree one: `x² = 0` for every `x ∈ H₁(A, k)`, so `ψ` is defined.
- Degree-two classes: `ψ((a ⊗ 1) ∧ (b ⊗ 1))` is the class of `[a|b] − [b|a]`, the image under the
  multiplication `A × A → A` of the cross product `[a] × [b] = [(a, 1)|(1, b)] − [(1, b)|(a, 1)]` of
  5.1. For `k = ℤ` it is the class `⟨a, b⟩` of InductionRestrictionPartII RS.6.8.
- Integral comparison: for `k = ℤ` (so `A : Type`) and every abelian group `A`, finite or not,
  the degree-two part `Λ²A → H₂(A, ℤ)` of `ψ` equals InductionRestrictionPartII RS.6.8's
  isomorphism; as `ψ` is the identity of `ℤ` in degree `0` and the isomorphism `A ≅ H₁(A, ℤ)` in
  degree `1`, `ψ` is an isomorphism in degrees `≤ 2`.
- Torsion-free comparison: for torsion-free `A` and every `k`, `ψ` is an isomorphism in all degrees.
- Rational comparison: for every `A` and every `ℚ`-algebra `k`, `ψ` is an isomorphism in all
  degrees.
- Products: for a field `k`, the cross product `H•(A, k) ⊗ H•(B, k) → H•(A × B, k)` is an
  isomorphism of graded algebras, so that for finitely generated `A` the algebra is the tensor
  product of those of its cyclic factors.

**Checks.**

- `H₂(ℤ/2 × ℤ/2, ℤ) = Λ²(ℤ/2 × ℤ/2) = ℤ/2`, and `H₂(ℤ/n, ℤ) = Λ²(ℤ/n) = 0`.
- `H•(ℤⁿ, ℤ) ≅ Λ(ℤⁿ)`, with ranks `C(n, i)`, as for the torus in AlgebraicTopology §5.4.
- In degree `3`, `Λ³(ℤ/2) = 0` while `H₃(ℤ/2, ℤ) = ℤ/2`: the restriction to degrees `≤ 2` for
  `k = ℤ` is needed.
- Coefficients of large global dimension: for `k = ℤ/4` and `A = ℤ²`, `Λⁿ_k(k²)` is `k, k², k` in
  degrees `0, 1, 2`, which is `Hₙ(ℤ², ℤ/4)` (the Check of 5.1); for the `ℚ`-algebra
  `k = ℚ[x, y]`, of global dimension `2`, and `A = ℤ² × ℤ/2`, `A ⊗ k = k²` and `Hₙ(A, k)` is
  `k, k², k, 0, …`, the factor `ℤ/2` contributing only `H₀(ℤ/2, k) = k`. A route through the
  `Tor` sequence of 5.1 would need global dimension at most one and covers neither.
- `ℚ` is the union of the chain `(1/m!)ℤ`: the colimit of `H₁ = ℤ` along multiplication by `m + 1`
  is `ℚ = Λ¹ℚ = H₁(ℚ, ℤ)`, and `H₂(ℚ, ℤ) = Λ²ℚ = 0`. Surjectivity of the colimit map alone, the
  half that Tau Ceti supplies, would leave `H₁(ℚ, ℤ)` a quotient of `ℚ`.
- Orientation, compared with InductionRestrictionPartII RS.6.8: for `A = ℤ/3 × ℤ/3` with
  `a = (1, 0)` and `b = (0, 1)`, `[a|b] − [b|a]` is the cross product of the generators of the two
  factors, so its class generates `H₂(A, ℤ) = ℤ/3` (5.1), and `ψ(a ∧ b)` and RS.6.8's `⟨a, b⟩` are
  both this class. The opposite orientation `[b|a] − [a|b]` gives `−⟨a, b⟩ ≠ ⟨a, b⟩`, which mod `2`
  examples such as `ℤ/2 × ℤ/2` cannot detect.
- Orientation on an infinite group, compared with InductionRestrictionPartII RS.6.8: for `A = ℤ²`
  with basis `e₁, e₂`, `[e₁|e₂] − [e₂|e₁]` is a cycle (its boundary
  `[e₂] − [e₁ + e₂] + [e₁] − [e₁] + [e₁ + e₂] − [e₂]` is `0`) and the cross product of the
  generators of `H₁(ℤ, ℤ)` of the two factors, so its class generates `H₂(ℤ², ℤ) = ℤ` (5.1);
  `ψ(e₁ ∧ e₂)` and RS.6.8's `⟨e₁, e₂⟩` are both this class, while the reversed orientation gives
  the other generator, and the two maps would then differ by the automorphism `−1` of `ℤ`.

### Examples

`H•(ℤ/2 × ℤ/2, 𝔽₂)` is the tensor product of two divided power algebras on degree-one generators;
`H•(ℤ/2 × ℤ/2, ℚ) = ℚ`.

### Dependencies

Layers 3–4; Tau Ceti's shuffle and Alexander–Whitney maps of simplicial chains and the
Eilenberg–Zilber theorem, for 5.1; Tau Ceti's half of the directed-union identification and the
vanishing of the homology of directed unions, for 5.4, with SchemeKTheoryOperations §6.7 for the
other half; Tau Ceti's Künneth and universal coefficient sequences, Kronecker map and the
identification of `Hom((A ⊗ P)_G, N)`, its projective replacements of bounded-above complexes,
K-flatness of bounded-above complexes of flat modules, split cycles over a ring of global
dimension at most one and split cycles of complexes of projective modules with projective
homology, over any ring; Mathlib's isomorphism `A ≅ Hom_k(k, A)` of a closed monoidal category and
its comparison of the inhomogeneous chains with the bar complex, for the statement of 5.2;
SpectralSequencesAndConvergencePartII §4.3 with `gap:flat-kunneth` for the
flat case of 5.1; InductionRestrictionPartII RS.6.8, the isomorphism `Λ²A ≅ H₂(A, ℤ)` for every
abelian group with which 5.4 identifies `ψ` in degree two, and the comparison of 5.1;
ArithmeticGaloisDuality §D7.2 for the comparison of 5.2; Mathlib's finite cyclic
computations; AlgebraicTopology §5.4 for a Check.

---

## Layer 6: group extensions

Throughout, `N ◁ G`, `Q = G ⧸ N` and `M : Rep k G`; `Q` acts on `Hⁿ(N, M)` and `Hₙ(N, M)` by 1.2.

### 6.1 Normalized cochains and the extension filtration

Define the normalized cochains `C̄ⁿ(G, M) ⊂ Cⁿ(G, M)`, those vanishing when some argument is `1`
(HS53 Ch. II §1, p. 118; the dual of Mathlib's deformation retraction of the alternating face complex
onto the normalized Moore complex, applied to the standard resolution). Define the decreasing
filtration `A_j ⊂ C̄(G, M)`: `A_j ∩ C̄ⁿ = C̄ⁿ` for `j ≤ 0`; for `0 < j ≤ n`, the cochains vanishing
whenever `n − j + 1` of the arguments lie in `N`; `0` for `j > n` (HS53 Ch. II §1, p. 118). Define
the second filtration `A*_j ⊂ C̄(G, M)`: `A*_j ∩ C̄ⁿ = C̄ⁿ` for `j ≤ 0`; for `0 < j ≤ n`, the
normalized cochains of degree `n` depending only on the first `n − j` arguments and the cosets mod
`N` of the last `j`; `0` for `j > n` (HS53 Ch. II §1, p. 119, with Prop. 1 and
Lemma 1, pp. 119–121). Prove the properties below. *Needs:* Mathlib
`groupCohomology.cochainsFunctor`,
`AlgebraicTopology.DoldKan.homotopyEquivNormalizedMooreComplexAlternatingFaceMapComplex`,
`AlgebraicTopology.inclusionOfMooreComplexMap`; Tau Ceti `CochainComplex.filtrationFunctor`.

- Normalization: `C̄(G, M)` is a subcomplex of the inhomogeneous cochains and its inclusion is a
  quasi-isomorphism, natural in `M` and in compatible pairs.
- Each `A_j` is a subcomplex, and `A_{j+1} ⊂ A_j`.
- Bounded in each degree: `A_j ∩ C̄ⁿ = C̄ⁿ` for `j ≤ 0` and `A_{n+1} ∩ C̄ⁿ = 0`. As the increasing
  filtration `F_t = A_{−t}` indexed by `ℤ`, the input of `CochainComplex.filtrationFunctor`,
  `F_t = C̄` for `t ≥ 0`. The filtration is bounded in each degree; a global lower bound is not
  guaranteed, and whether one exists is not decided by the boundedness of `C̄`: some `F_t` is zero
  exactly when `N = G` or `M = 0`, and then `F_{−1} = A_1 = 0`; if `N ≠ G` and `M ≠ 0`, no `F_t`
  is zero, since for `g ∉ N`, `0 ≠ m ∈ M` and `j ≥ 1` the cochain of degree `j` with value `m` at
  `(g, …, g)` and `0` elsewhere is normalized and lies in `A_j`.
- Multiplicativity: for a pairing `M ⊗ M' ⟶ P`, `A_r(M) ∪ A_s(M') ⊂ A_{r+s}(P)`.
- Naturality: a morphism of pairs `(G', N') → (G, N)` with a compatible coefficient map sends each
  `A_j` into `A_j`.
- Second filtration: each `A*_j` is a subcomplex contained in `A_j`, and the inclusions induce an
  isomorphism of spectral sequences from `E₁` on.

**Checks.**

- For `N = 1`, a nonzero normalized cochain has no argument equal to `1`, so
  `A_j ∩ C̄ⁿ = C̄ⁿ` for `j ≤ n`: the filtration is the filtration by degree, `E₁` is the row
  `q = 0` with `E₁^{p,0} = C̄^p(G, M)`, and `E₂^{p,0} = Hᵖ(G, M)`. For `G = ℤ/2` and `M = 𝔽₂`,
  `C̄ⁿ = 𝔽₂` in every degree and `A_j` contains `C̄ⁿ` for every `n ≥ max(j, 0)`, so every `F_t` is
  nonzero.
- For `N = G`, every argument lies in `N`, so `A_j ∩ C̄ⁿ = 0` for `j > 0`, and the spectral
  sequence is the column `p = 0` with `E₁^{0,q} = E₂^{0,q} = H^q(G, M)`. For `G = ℤ/2` and
  `M = 𝔽₂`, `C̄ⁿ = 𝔽₂` in every degree, so `C̄` is unbounded, yet `F_{−1} = A_1 = 0`: an unbounded
  complex with a globally bounded filtration, so unboundedness of `C̄` does not exclude a zero `F_t`.
- For `G = ℤ/4`, `N = 2ℤ/4` and `n = 1`, `A_1 ∩ C̄¹` is the normalized cochains with `f(2) = 0`,
  while `A*_1 ∩ C̄¹` also requires `f(1) = f(3)`: the inclusion `A*_1 ⊂ A_1` is strict, and only the
  spectral sequences agree from `E₁` on.
- The boundary values of the second filtration: in degree `0`, `A*_0 ∩ C̄⁰ = M` and
  `A*_1 ∩ C̄⁰ = 0`. For `N = 1`, `A*_j ∩ C̄ⁿ = C̄ⁿ` for `j ≤ n`, as the cosets mod `1` are the
  elements; for `N = G`, `A*_j ∩ C̄ⁿ = 0` for `j > 0`, since a normalized cochain that does not depend
  on its last argument vanishes (set that argument to `1`). For `G = N = 1` and `M = ℤ`, `C̄⁰ = ℤ`
  and `C̄ⁿ = 0` for `n > 0`, so the graded piece `A*_0 / A*_1` is `ℤ` in degree `0` and
  `E₁^{0,0} = ℤ = H⁰(1, ℤ)`; a second filtration left zero for `j ≤ 0` would give `0` there.

### 6.2 The cohomological Hochschild–Serre spectral sequence

MappingClassGroupsAndCanonicalRepresentations §1.1 states that every extension of discrete groups
has a natural spectral sequence `E₂^{p,q} = Hᵖ(Q, H^q(N, M)) ⇒ H^{p+q}(G, M)`. Realise it as the
spectral sequence of the filtration `(A_j)`: Tau Ceti's `CochainComplex.spectralSequence` of
`CochainComplex.filtrationFunctor` for `F_t = A_{−t}`, in which the classical `E_r^{p,q}` is the
object at `(2p + q + 1, −p − 1)` on page `r + 1` (Exact supplier contracts). Prove that
`E₁^{p,q} ≅ C̄^p(Q, H^q(N, M))` through restriction of the first `q` arguments to `N` of
representatives in `A*_p` (HS53 Ch. II §2 Thm. 1, p. 121; for representatives in `A_p` the
restriction is applied to the shuffle sum of HS53 Ch. II §3, as in §5 Prop. 3, p. 125), with `d₁`
equal to `(−1)^q` times the coboundary (HS53 Ch. II §4 Thm. 2, p. 125), so that
`E₂^{p,q} ≅ Hᵖ(Q, H^q(N, M))`. Prove convergence, `E_∞^{p,q} ≅ A_pH^{p+q}/A_{p+1}H^{p+q}` with
`A_pHⁿ` the image of `Hⁿ(A_p)` in `Hⁿ(G, M)`: in Mathlib's numbering, from page
`r ≥ max(q + 3, p + 2)` on, `H^{p+q+1}(F_{1−p−r}) = H^{p+q+1}(A_{p+r−1}) = 0` because `A_{p+r−1}` is
zero in degree `p + q + 1`, and `C̄/F_{r−p−2} = C̄/A_{p+2−r} = 0`, which are the hypotheses of
`CochainComplex.filtrationSpectralSequencePageXIsoEInfty`; then
`CategoryTheory.Abelian.SpectralObject.EInftyIsoCokernel` identifies `E∞` with the graded piece.
Prove naturality for morphisms of extensions `(G', N') → (G, N)` with compatible coefficient maps
(HS53 Ch. I §7 Prop. 7, p. 117, for the existence; Loh19 Thm. 3.2.12(2) and Remark 3.2.14,
pp. 123–125). *Needs:* 1.2, 6.1; MappingClassGroupsAndCanonicalRepresentations §1.1; Tau Ceti
`CochainComplex.spectralSequence`, `CochainComplex.spectralSequenceFirstPageXIsoCokernel`,
`CochainComplex.spectralSequence_first_page_d_eq`, `CochainComplex.filtrationAbutmentIso`,
`CochainComplex.filtrationSpectralSequencePageXIsoEInfty`,
`CategoryTheory.Abelian.SpectralObject.EInftyIsoCokernel`, `CochainComplex.filtrationFunctorMap`.

**Checks.**

- `N = 1`: `E₂^{p,q} = 0` for `q > 0` and `E₂^{p,0} = Hᵖ(G, M)`; `N = G`: `E₂^{p,q} = 0` for
  `p > 0` and `E₂^{0,q} = H^q(G, M)`.
- For `G = S₃`, `N = A₃`, `M = 𝔽₃`: `E₂^{p,q} = Hᵖ(ℤ/2, H^q(A₃, 𝔽₃)) = 0` for `p > 0` (order prime
  to `3`), and `E₂^{0,q}` is the invariants of `ℤ/2` acting on `H^q(A₃, 𝔽₃) = 𝔽₃` by `(−1)^{⌈q/2⌉}`;
  so `H^q(S₃, 𝔽₃)` is `𝔽₃` for `q ≡ 0, 3 mod 4` and `0` otherwise.
- For `G = ℤ/4 ⊃ N = 2ℤ/4` and `𝔽₂`, `E₂^{p,q} = 𝔽₂` for all `p, q ≥ 0` while
  `Hⁿ(ℤ/4, 𝔽₂) = 𝔽₂`: the spectral sequence does not degenerate at `E₂`, and `d₂` is the
  transgression of 6.6.
- Convergence needs no global bound: for `N = 1`, `G = ℤ/2` and `𝔽₂`, `A_j ∩ C̄ʲ = C̄ʲ ≠ 0` for every
  `j`, so no `F_t` is zero and `CochainComplex.filtrationSpectralSequencePageXIsoGradedOfFinite`
  does not apply; in bidegree `(p, 0)` the two vanishing hypotheses hold from page `max(3, p + 2)`,
  and `E_∞^{p,0} = Hᵖ(ℤ/2, 𝔽₂) = 𝔽₂`.

### 6.3 The homological Hochschild–Serre spectral sequence

Define the complex `C_N(M) = (P ⊗ M)_N` of representations of `Q`, for `P = Rep.standardResolution`
(through `Rep.quotientToCoinvariantsFunctor`), and prove that `Hₙ(Q; C_N(M)) ≅ Hₙ(G, M)` (its terms
are induced from the trivial subgroup of `Q`, so the augmented rows are exact:
`HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`) and `H_q(C_N(M)) ≅ H_q(N, M)` as
representations of `Q`. The second sequence of 2.3 is then the natural spectral sequence
`E²_{p,q} = H_p(Q, H_q(N, M)) ⇒ H_{p+q}(G, M)` (Loh19 Thm. 3.2.12(1), p. 123; the remark closing
HS53 Ch. I §7, p. 118).
*Needs:* 1.2, 2.3; Mathlib `Rep.quotientToCoinvariantsFunctor`, `Rep.standardResolution`;
Tau Ceti `HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`,
`groupHomology.isZero_indBot_succ`; DerivedModuleAlgebra §S.1;
`gap:homological-low-degree`.

**Checks.**

- `N = 1` and `N = G` give a single row and a single column.
- For `G = ℤ/4 ⊃ N = ℤ/2` and `M = 𝔽₂`, `E²_{p,q} = 𝔽₂` for all `p, q ≥ 0`, while
  `Hₙ(ℤ/4, 𝔽₂) = 𝔽₂`: the differential `d²` must be nonzero.
- For `G = ℤ/2 × ℤ/2 ⊃ N = ℤ/2 × 0`, all differentials vanish and
  `dim Hₙ(G, 𝔽₂) = n + 1` agrees with 5.1.

### 6.4 Edge maps

Prove that in cohomology the composite `Hⁿ(Q, M^N) = E₂^{n,0} ↠ E_∞^{n,0} ↪ Hⁿ(G, M)` is inflation
and `Hⁿ(G, M) ↠ E_∞^{0,n} ↪ E₂^{0,n} = Hⁿ(N, M)^Q ⊂ Hⁿ(N, M)` is restriction (HS53 Ch. III §1,
p. 126); and that in homology `Hₙ(N, M) → Hₙ(N, M)_Q = E²_{0,n} ↠ E^∞_{0,n} ↪ Hₙ(G, M)` is the
homological corestriction and `Hₙ(G, M) ↠ E^∞_{n,0} ↪ E²_{n,0} = Hₙ(Q, M_N)` is coinflation.
Route in homology: naturality of 6.3 for the morphisms of extensions `(N, N) → (G, N)` and
`(G, N) → (Q, 1)`, with Tau Ceti's `MonoidHom.groupHomologyIso_hom_naturality` matching the maps
induced on resolutions with `groupHomology.map`. *Needs:* 6.2, 6.3; Mathlib
`groupCohomology.infNatTrans`, `groupHomology.coresNatTrans`, `groupHomology.coinfNatTrans`; Tau
Ceti `MonoidHom.groupHomologyIso_hom_naturality`; `gap:homological-low-degree`;
IntegralIwasawaTheoryPartII §0.7 for the comparison.

**Checks.**

- For `N = G`, the restriction edge map is the identity of `Hⁿ(G, M)`.
- For `N = 1`, the inflation edge map is the identity.
- For `ℤ/2 ⊂ ℤ/4` and `𝔽₂`, inflation `H¹(ℤ/2, 𝔽₂) → H¹(ℤ/4, 𝔽₂)` is an isomorphism and restriction
  `H¹(ℤ/4, 𝔽₂) → H¹(ℤ/2, 𝔽₂)` is zero, as the edge maps must be.
- Comparison with the edge isomorphism of IntegralIwasawaTheoryPartII §0.7: if `H_q(N, M) = 0` for
  every `q > 0`, the spectral sequence of 6.3 is the row `q = 0`, so `E² = E^∞` and the coinflation
  edge map `Hₙ(G, M) → Hₙ(Q, M_N)` is an isomorphism, which is §0.7's statement. For `G = ℤ²`,
  `N = 0 × ℤ` and `M = k[N]` with `N` translating and `ℤ × 0` acting trivially, `M` is free over
  `k[N]`, `M_N = k`, and both sides are `k, k, 0, 0, …` in degrees `0, 1, 2, …`, as Shapiro's lemma
  gives for `M = Ind_{ℤ×0}^{ℤ²} k`. The vanishing hypothesis is needed: for `k ≠ 0` and `M = k`
  with trivial action, `H₁(N, k) = k ≠ 0` and coinflation `H₂(ℤ², k) = k → H₂(ℤ, k) = 0` is not
  injective.

### 6.5 Multiplicativity

For a pairing `μ : M ⊗ M' ⟶ P`, the cup product of 4.1 preserves normalized cochains (an argument
equal to `1` falls among the arguments of one factor), is a chain map
`C̄(G, M) ⊗ C̄(G, M') → C̄(G, P)` for the sign `d(φ ⊗ ψ) = dφ ⊗ ψ + (−1)^p φ ⊗ dψ` of the tensor
product, by the Leibniz rule of the Conventions, and satisfies `A_r ∪ A_s ⊂ A_{r+s}` (6.1). So
SpectralSequencesAndConvergencePartII §5.2 gives the pairings of the pages of 6.2,
`E_r^{p,q} ⊗ E_r^{p',q'} → E_r^{p+p',q+q'}`, for which every `d_r` is a derivation
(`d_r(u ∪ v) = d_r u ∪ v + (−1)^{p+q} u ∪ d_r v`), and, the filtration being finite in each degree
(6.1), the product on `E_∞` induced by the cup product on `G` with `A_pH ∪ A_{p'}H ⊂ A_{p+p'}H`,
natural in morphisms of extensions with compatible coefficient maps (HS53 Ch. II §1, p. 119). Prove
that for `u ∈ E₂^{p,q}` and `v ∈ E₂^{p',q'}`, under the identification of 6.2 (restriction of the
first `q` arguments to `N`), `u ∪ v` is `(−1)^{pq'}` times the cup product of 4.1 on `Q` of the
classes of `u` and `v`, with coefficients paired by the cup product on `N` (HS53 Ch. II §5 Thm. 3
and the remark after it, p. 126). With `d₁ = (−1)^q d` of 6.2 the derivation
rule on `E₁` is compatible with the sign `(−1)^{pq'}`; with `(−1)^{qp'}` the term `d₁u ∪ v` would
acquire an extra factor `(−1)^{q'}`. *Needs:* 4.1, 4.3, 6.1, 6.2; SpectralSequencesAndConvergencePartII
§5.2; Tau Ceti `CochainComplex.filtrationFunctorMap`.

**Checks.**

- For `N = 1` the pairing on the row `q = 0` is the cup product on `G`.
- For `G = ℤ/2 × ℤ/2 ⊃ N = 0 × ℤ/2` and `𝔽₂`, `E₂ = 𝔽₂[x] ⊗ 𝔽₂[y]` with `x` from `Q` and `y` from
  `N`; the sign is invisible mod `2`, and the product is the cohomology ring of 5.3.
- The sign is pinned on `G = ℤ × ℤ ⊃ N = 0 × ℤ`, `Q = ℤ`, `M = ℤ`, with `x ∈ E₂^{1,0} = Hom(Q, ℤ)`
  and `y ∈ E₂^{0,1} = Hom(N, ℤ)` the identity characters and `x·y ∈ E₂^{1,1} = Hom(Q, Hom(N, ℤ))`
  the class of `γ ↦ x(γ)y`. For the coordinate projections `x̃, ỹ` of `G`, the cocycle `ỹ ∪ x̃`
  lies in `A*_1` and restricts in its first argument to `(σ, γ) ↦ y(σ)x(γ)`, so `y ∪ x ↦ +x·y`, as
  `(−1)^{pq'} = (−1)^{0·0}` predicts; graded commutativity in `H²(ℤ², ℤ) = E_∞^{1,1}` then gives
  `x ∪ y ↦ −x·y`, as `(−1)^{1·1}` predicts. The sign `(−1)^{qp'}` gives the opposite values, and
  the anticommutativity of the two products does not distinguish the conventions. The plain
  restriction of `x̃ ∪ ỹ`, which is not in `A*_1`, is `0`: representatives must be taken in `A*`.

### 6.6 Transgression

Define, for `n ≥ 1`, a class `x ∈ Hⁿ(N, M)` to be *transgressive* if some normalized cochain
`f ∈ C̄ⁿ(G, M)` restricts on `Nⁿ` to a cocycle representing `x` and has `df` inflated from a cocycle
`c ∈ C̄ⁿ⁺¹(Q, M^N)`; and the *transgression* `τ(x)` as the class of `c` in the quotient of
`Hⁿ⁺¹(Q, M^N)` identified with `E_{n+1}^{n+1,0}`. Prove that the transgressive classes are exactly
the image of `E_{n+1}^{0,n}` in `Hⁿ(N, M)`, and that `τ` is `d_{n+1}` (HS53 Ch. III §3 Prop. 1 and
the paragraph after it, pp. 128–129). In degree one, MappingClassGroupsAndCanonicalRepresentations
§1.1 lifts every class of `H¹(N, M)^Q` through a set-theoretic section `s : Q → G` with
`s(1) = 1` to a cochain satisfying `TauCeti.ContCohomology.IsTransgressionLift` (with `G` and `M`
discrete) and defines its transgression `tg`; prove that every class of `H¹(N, M)^Q` is
transgressive and that `τ = tg = d₂` on `E₂^{0,1}`. Prove that when `N` acts trivially on `M`,
`d₂ : Hᵖ(Q, Hom(N^ab, M)) → H^{p+2}(Q, M)` is `u ↦ −c_k ∪ u`, where `N^ab_k = Additive N^ab ⊗_ℤ k`,
`c_k ∈ H²(Q, N^ab_k)` is the scalarised class (Conventions) of `1 → N^ab → G ⧸ [N, N] → Q → 1`,
`Hom(N^ab, M)` is identified with `Hom_k(N^ab_k, M)` (`Rep.ihom`) by `φ ↦ (b ⊗ a ↦ a·φ(b))`, and
the pairing of 4.1 is the evaluation `N^ab_k ⊗ Hom_k(N^ab_k, M) ⟶ M` (HS53 Ch. III §6 Thm. 4,
p. 133, with abelian-group coefficients, where `c` pairs with `Hom(N, M)`
directly; this is the case `k = ℤ`). Route, as in that proof: the class `o ∈ H¹(N, N^ab_k)^Q` of
`n ↦ n̄ ⊗ 1` is transgressive with `τ(o) = −c_k`, since the cochain `σ·s(x) ↦ σ̄ ⊗ 1` (`σ ∈ N`, `s`
a section with `s(1) = 1`) has coboundary the inflation of minus the scalarised factor set;
`u ∈ E₂^{p,1}` is the product of `o ∈ E₂^{0,1}` with the class `u′ ∈ E₂^{p,0}` that `u` defines in
the spectral sequence with coefficients `Hom_k(N^ab_k, M)`, and the derivation rule and product
identification of 6.5, with `d₂u′ = 0` in the bottom row, give `d₂u = d₂o ∪ u′ = −c_k ∪ u`.
*Needs:* 1.2, 4.1, 4.3, 6.1, 6.2, 6.5;
MappingClassGroupsAndCanonicalRepresentations §1.1; Tau Ceti
`TauCeti.ContCohomology.IsTransgressionLift`; Mathlib `Rep.ihom`.

- The transgressive classes form a `k`-submodule of `Hⁿ(N, M)^Q`, equal to the image of
  `E_{n+1}^{0,n}`.
- `τ` is well defined with values in the quotient of `H^{n+1}(Q, M^N)` by the images of
  `d₂, …, d_n`, which is `E_{n+1}^{n+1,0}`; it is `k`-linear and equal to `d_{n+1}`.
- Degree one: `τ` is defined on all of `H¹(N, M)^Q`, for every group, with values in
  `H²(Q, M^N)`, and equals §1.1's `tg` and `d₂`.
- Naturality: `τ` commutes with the maps induced by morphisms of extensions with compatible
  coefficient maps.
- Trivial action: when `N` acts trivially on `M`, `d₂ = −c_k ∪ (−)` on
  `Hᵖ(Q, Hom(N^ab, M)) ≅ Hᵖ(Q, Hom_k(N^ab_k, M))`, for every commutative `k`, with the scalarised
  class `c_k ∈ H²(Q, N^ab_k)` and the evaluation pairing; for `k = ℤ`, `c_ℤ` is the integral class
  `c` of the extension.

**Checks.**

- `ℤ/2 ⊂ ℤ/4` with `𝔽₂`: `τ` sends the nonzero character of `ℤ/2` to the nonzero class of
  `H²(ℤ/2, 𝔽₂)`.
- The split extension `ℤ/2 ⊂ ℤ/2 × ℤ/2`: every character of the kernel extends, and `τ = 0`.
- Sign: for `ℤ/3 ⊂ ℤ/9`, `M = 𝔽₃` and `u : 3ℤ/9 → 𝔽₃` with `u(3) = 1`, lifting `u` by
  `f(i) = ⌊i/3⌋ mod 3` gives `df(2, 1) = 0 − 1 + 0 = −1`, so `τ(u) = −[carry] = −c_{𝔽₃} ∪ u` (here
  `N^ab_{𝔽₃} ≅ 𝔽₃` by `3 ⊗ 1 ↦ 1`); the model `d₂ = +c_{𝔽₃} ∪` gives the other generator of
  `H²(ℤ/3, 𝔽₃) = 𝔽₃`. This agrees with the sign Check of ProfiniteCohomology §5.5.
- Coefficients: for `N = 3ℤ/27 ≅ ℤ/9` in `G = ℤ/27`, `Q = ℤ/3` and `k = M = 𝔽₃`, `N^ab` is not an
  `𝔽₃`-module (`3·3 = 9 ≠ 0`), so the integral class `c ∈ H²(ℤ/3, ℤ/9)` is not a class of an
  `𝔽₃`-representation and cannot enter the cup product of 4.1 over `𝔽₃`; `N^ab_{𝔽₃} ≅ 𝔽₃` by
  `3 ⊗ 1 ↦ 1`,
  and for `s(x) ∈ {0, 1, 2}` the scalarised class `c_{𝔽₃}` is the carry cocycle of `ℤ/3`. For `u`
  with `u(3) = 1` and the lift `f(i) = ⌊i/3⌋ mod 3`, writing `a = 3α + r` and `b = 3β + t` with
  `0 ≤ r, t ≤ 2` gives `df(a, b) = −1` if `r + t ≥ 3` and `0` otherwise, the inflation of minus the
  carry; so `df(2, 1) = 0 − 1 + 0 = −1 = 2` and `τ(u) = −c_{𝔽₃} ∪ u ≠ 0`. The formula keeps the
  nonzero transgression although the exponent `9` of `N^ab` exceeds the characteristic. For
  `k = ℚ` both sides vanish: `N^ab_ℚ = ℤ/9 ⊗ ℚ = 0` and `Hom(ℤ/9, M) = 0` for every `ℚ`-module `M`.
- Non-abelian: `G = Q₈`, `N = ⟨i⟩ ≅ ℤ/4`, `Q = ℤ/2 = ⟨σ⟩` acting on `N^ab` by inversion,
  `k = M = 𝔽₂`. With `s(σ) = j` the factor set is `j² = i²`, that is `2 ∈ ℤ/4` at `(σ, σ)` and `0`
  elsewhere, so `c` is the nonzero class of `H²(ℤ/2, ℤ/4) = {0, 2}/(1 + σ)(ℤ/4) = ℤ/2`; but
  `2 ⊗ 1 = 0` in `N^ab_{𝔽₂} = 𝔽₂`, so `c_{𝔽₂} = 0` and `d₂ = 0` on `E₂^{0,1} = Hom(ℤ/4, 𝔽₂) = 𝔽₂`,
  as `dim H¹(Q₈, 𝔽₂) = dim Hom(Q₈^ab, 𝔽₂) = 2 = dim E₂^{1,0} + dim E₂^{0,1}` requires.

### 6.7 Exact sequences of low degree

Prove:

- **Degree `m`.** For `m ≥ 2`, if `H^q(N, M) = 0` for `0 < q < m`, then
  `0 → H^m(Q, M^N) → H^m(G, M) → H^m(N, M)^Q →τ H^{m+1}(Q, M^N) → H^{m+1}(G, M)` is exact, with
  inflation, restriction, the transgression of 6.6 and inflation, and the transgressive classes are
  all of `H^m(N, M)^Q` (HS53 Ch. III §4 Thm. 2, p. 129). This extends
  `TauCeti.groupCohomology.HInfRes_exact` by the transgression term. For `m = 1` the hypothesis is
  vacuous and the sequence is the cohomological five-term sequence of
  MappingClassGroupsAndCanonicalRepresentations §1.1 (HS53 Ch. III §4, remark after Thm. 2,
  p. 130), whose transgression is the `τ` of 6.6.
- **Homological five-term sequence.**
  `H₂(G, M) → H₂(Q, M_N) → H₁(N, M)_Q → H₁(G, M) → H₁(Q, M_N) → 0` is exact, with coinflation, `d²`,
  corestriction and coinflation (Loh19 proof of Thm. 3.2.18, pp. 129–131). Its last three terms
  are Mathlib's `groupHomology.H1CoresCoinf`.

*Needs:* 6.2, 6.3, 6.4, 6.6; MappingClassGroupsAndCanonicalRepresentations §1.1; Tau Ceti
`TauCeti.groupCohomology.HInfRes_exact`; Mathlib `groupHomology.H1CoresCoinf`;
`gap:homological-low-degree`.

**Checks.**

- `N = 1` and `N = G`: the sequences reduce to isomorphisms between the outer terms.
- Degree `2` for `ℤ/2 ≅ 2ℤ/4 ⊂ ℤ/4` and `M = ℤ`: `H¹(N, ℤ) = Hom(ℤ/2, ℤ) = 0`, and the sequence is
  `0 → H²(ℤ/2, ℤ) = ℤ/2 → H²(ℤ/4, ℤ) = ℤ/4 → H²(N, ℤ)^Q = ℤ/2 → H³(ℤ/2, ℤ) = 0`, with inflation the
  dual of `ℤ/4 ↠ ℤ/2` (injective) and restriction the dual of `ℤ/2 ↪ ℤ/4` (onto). The vanishing
  hypothesis is needed: with `M = 𝔽₂`, `H¹(N, 𝔽₂) ≠ 0` and inflation
  `H²(ℤ/2, 𝔽₂) → H²(ℤ/4, 𝔽₂)` is zero, since it sends `x²` to the square of the nonzero class of
  `H¹(ℤ/4, 𝔽₂)`, which vanishes.
- Homological five-term sequence for `ℤ/2 ⊂ ℤ/4` and `M = ℤ`: `H₂(ℤ/4, ℤ) = 0 → H₂(ℤ/2, ℤ) = 0`,
  then `0 → H₁(N, ℤ)_Q = ℤ/2 → H₁(ℤ/4, ℤ) = ℤ/4 → H₁(ℤ/2, ℤ) = ℤ/2 → 0`, with corestriction
  `1 ↦ 2`.

### 6.8 Hopf's formula

Let `F = FreeGroup S` with `S : Type`, `R ◁ F` and `G = F ⧸ R`, and write `C(−)` for the
inhomogeneous chains with trivial coefficients `ℤ` (Mathlib's `groupHomology.inhomogeneousChains`),
where `d[x] = 0` and `d[x|y] = [y] − [xy] + [x]`. The map `h : H₂(G, ℤ) → R ⧸ ⁅F, R⁆` is the one
whose normalisation K2SymbolsBrauer §1.1 fixes: lift a 2-cycle `z` of `G` to a chain `z̃` of `F`;
its boundary `dz̃` lies in the kernel `K₁` of `C₁(F) → C₁(G)`, which is spanned by the differences
`[x] − [y]` with `x, y ∈ F` of equal image in `G`, and `h[z]` is the image of `dz̃` under
`K₁ → R ⧸ ⁅F, R⁆`, `[x] − [y] ↦ xy⁻¹`. Its value on the torus cycle and its naturality under maps
of free presentations are §1.1's. Prove Hopf's formula for every group with this map: `h` is well
defined, its image is `(R ⊓ ⁅F, F⁆) ⧸ ⁅F, R⁆`, and `h : H₂(G, ℤ) → (R ⊓ ⁅F, F⁆) ⧸ ⁅F, R⁆` is an
isomorphism (Loh19 Thm. 1.5.1, p. 30, and Thm. 3.2.18, p. 129, where the isomorphism is given
without fixing the map). In particular `H₂(G, ℤ)` is isomorphic to the abelian group
`(R ⊓ ⁅F, F⁆) ⧸ ⁅F, R⁆`, the quotient of `R ⊓ ⁅F, F⁆` (`⁅F, F⁆` is Mathlib's `commutator F`) by
its normal subgroup `⁅F, R⁆`, written additively (`nonempty_groupHomology_two_addEquiv_hopf`,
which states the existence of an additive isomorphism; `h` is the one this target constructs).

Route: `h` is the connecting map of the short exact sequence of complexes
`0 → K → C(F) → C(G) → 0` followed by `K₁ → R ⧸ ⁅F, R⁆`. That homomorphism is well defined (it is
`[x] ↦ x·σ(x̄)⁻¹`, `x̄` the image of `x`, for any section `σ` of `F → G`), kills `d(K₂)` (for
`x = r₁x′` and `y = r₂y′` with `r₁, r₂ ∈ R`, the boundary of `[x|y] − [x′|y′]` goes to
`r₁r₂(r₁x′r₂x′⁻¹)⁻¹ ∈ ⁅F, R⁆`), and induces `H₁(K) ≅ R ⧸ ⁅F, R⁆` with inverse `r ↦ [r] − [1]`:
modulo `d(K₂)`, `[r] + [r′] − [rr′] − [1] = d([r|r′] − [1|1])` makes `r ↦ [r] − [1]` additive,
`[ry] − [y] ≡ [r] − [1]` (the boundary of `[r|y] − [1|y]`) makes it onto, and `[frf⁻¹] ≡ [r]`
(the boundaries of `[f|r] − [f|1]` and `[fr|f⁻¹] − [f|f⁻¹]`) makes it kill `⁅F, R⁆`. Under
`H₁(F, ℤ) ≅ F^ab`, `[f] ↦ f`, the map `H₁(K) → H₁(F, ℤ)` is `R ⧸ ⁅F, R⁆ → F^ab`; since
`H₂(F, ℤ) = 0` (Tau Ceti `TauCeti.isZero_groupHomology_freeGroup` with `k = ℤ`, `n = 2`), the long
exact sequence makes `h` an isomorphism onto its kernel
`(R ⊓ ⁅F, F⁆) ⧸ ⁅F, R⁆`. Loh19 obtains the abstract isomorphism from the five-term sequence of 6.7;
the chain-level normalisation of K2SymbolsBrauer §1.1 does not depend on the sign of that
sequence's `d²`. The route uses neither the torus value nor the naturality of §1.1. *Needs:* Tau
Ceti `TauCeti.isZero_groupHomology_freeGroup`; K2SymbolsBrauer §1.1 (the normalisation); Mathlib
`FreeGroup`, `groupHomology.inhomogeneousChains`, `CategoryTheory.ShortComplex.ShortExact.δ`,
`groupHomology.H1AddEquivOfIsTrivial`; StableHomotopyKTheory §3.29 for a Check.

**Checks.**

- For `n ≥ 1`, `G = ℤ/n` with `F = ℤ`, `R = nℤ`: `R ∩ [F, F] = 0`, so `H₂(ℤ/n, ℤ) = 0`. The model
  `R/⁅F, R⁆` without the intersection with `⁅F, F⁆` would give `nℤ ≅ ℤ`. At `n = 0`, `G = ℤ` and
  `R = 0`, and both give `0`: this boundary case does not separate the two models.
- `G = ℤ²` with `F` free on `a, b`: `R = [F, F]`, and `[F, F]/[F, [F, F]] ≅ ℤ` is generated by
  `[a, b]`, so `H₂(ℤ², ℤ) = ℤ`.
- Normalisation, compared with K2SymbolsBrauer §1.1, for `ℤ² = ⟨a, b | ⁅a, b⁆⟩`: the class of
  `z = [e₁|e₂] − [e₂|e₁]`, which pairs to `+1` with `x ∪ y` (Conventions), lifts to
  `[a|b] − [b|a]`, whose boundary is `([b] − [ab] + [a]) − ([a] − [ba] + [b]) = [ba] − [ab]`; so
  `h[z] = ba(ab)⁻¹ = bab⁻¹a⁻¹ = ⁅a, b⁆⁻¹` (Mathlib's `⁅x, y⁆ = xyx⁻¹y⁻¹`), the value §1.1 assigns to
  the ordered torus cycle. The composite of `h` with inversion, which passes the other Checks and
  is as natural, gives `⁅a, b⁆`, the other generator of `⁅F, F⁆ ⧸ ⁅F, ⁅F, F⁆⁆ ≅ ℤ`: it is the
  normalisation §1.1 excludes. Writing `y⁻¹x` for `xy⁻¹` gives the same value, since `F` acts
  trivially on `R ⧸ ⁅F, R⁆`.
- A free group `G = F` with `R = 1` gives `0` on both sides, as `H₂(F, ℤ) = 0`
  (`TauCeti.isZero_groupHomology_freeGroup`) requires.
- Perfect groups, compared with StableHomotopyKTheory §3.29: if `G` is perfect then
  `⁅F, F⁆R = F`, so `⁅F, F⁆ ⧸ ⁅F, R⁆ → G` is onto with kernel `(R ⊓ ⁅F, F⁆) ⧸ ⁅F, R⁆`, the kernel
  of the universal central extension, and 6.8 identifies it with `H₂(G, ℤ)` through `h`, where
  §3.29 fixes no map. For `G = 1` and `F = R` free on one letter, `⁅F, F⁆ = 1` and both sides are
  `0`; for `G = A₅` both are `ℤ/2`, the kernel `{±1}` of `SL₂(𝔽₅) → A₅` in §3.29's Check.

### 6.9 Comparison with the profinite theory for finite groups

Prove that for finite `G` with the discrete topology, the cohomological five-term sequence
(MappingClassGroupsAndCanonicalRepresentations §1.1, with the transgression `τ` of 6.6)
corresponds under `Θ` (1.5) and the explicit comparisons of ProfiniteCohomology §3.1 to the
explicit five-term sequence of ProfiniteCohomology §5.5, and that the transgression of 6.6 is
`TauCeti.ContCohomology.transgression` under `TauCeti.ContCohomology.explicitH1IsoGroupCohomology`
and `TauCeti.ContCohomology.explicitH2IsoGroupCohomology`. The sequence itself is HS53 Ch. III §4,
remark after Thm. 2, p. 130; the comparison is determined by the definitions of
the pinned `TauCeti.ContCohomology.IsTransgressionLift`, `TauCeti.ContCohomology.transgression`
and the explicit comparisons, not by that source. *Needs:* 1.5, 6.6, 6.7;
MappingClassGroupsAndCanonicalRepresentations §1.1; ProfiniteCohomology §3.1, §5.5; Tau Ceti
`TauCeti.ContCohomology.transgression`, `TauCeti.ContCohomology.fiveTerm_exact_H1N`.

**Checks.**

- The `ℤ/3 ⊂ ℤ/9` sign Check gives `−[carry]` on both sides.
- For `N = G` both transgressions land in `H²(1, −) = 0`.
- For a finite group the section of `G → G/N` is continuous, so the profinite and discrete lifts
  coincide as functions.

### Examples

For `ℤ/2 ⊂ ℤ/4` with `𝔽₂`, `E₂ = 𝔽₂[x, y]` with `x ∈ E₂^{1,0}` and `y ∈ E₂^{0,1}` (6.5; signs are
invisible mod `2`). By 6.6, `d₂y = x²`, the scalarised extension class `c_{𝔽₂}` (here
`N^ab_{𝔽₂} = ℤ/2 ⊗ 𝔽₂ = 𝔽₂`, and `c_{𝔽₂} ≠ 0` because `ℤ/4` does not split), and `d₂x = 0`, so
`d₂(xᵖy^q) = q·x^{p+2}y^{q−1}`: an isomorphism for odd `q` and zero for even `q`. The `E₃` page is
`𝔽₂[x, y²]/(x²)`, supported in the columns `p = 0, 1` and the even rows; every later differential
`d_r`, `r ≥ 3`, leaves these two columns, so `E₃ = E_∞`, with one copy of `𝔽₂` in each total degree
(`(0, n)` for even `n`, `(1, n − 1)` for odd `n`), and `Hⁿ(ℤ/4, 𝔽₂) = 𝔽₂` for every `n ≥ 0`.

### Dependencies

Layers 1, 2 and 4; Tau Ceti's vanishing of the homology of free groups with trivial coefficients,
for 6.8; MappingClassGroupsAndCanonicalRepresentations §1.1; Tau Ceti's filtered spectral sequences,
inflation–restriction, transgression lift and the naturality of `groupHomologyIso` in the group;
DerivedModuleAlgebra §S.1 with `gap:homological-low-degree`; SpectralSequencesAndConvergencePartII
§5.2 for the pairings of 6.5; ProfiniteCohomology §§3.1, 5.5 for 6.9; K2SymbolsBrauer §1.1 for the
normalisation of the map of 6.8; StableHomotopyKTheory §3.29 for a Check of 6.8;
IntegralIwasawaTheoryPartII §0.7 for a Check of 6.4.

---

## Layer 7: subgroups of finite index

### 7.1 The double coset formula

Prove that for any group `G`, `H ≤ G` of finite index, any `K ≤ G`, `M : Rep k G` and `n ≥ 0`,
`res^G_K ∘ cor^G_H = Σ_{KgH ∈ K\G/H} cor^K_{K ∩ gHg⁻¹} ∘ c_g ∘ res^H_{H ∩ g⁻¹Kg}` on `Hⁿ(H, M)`,
each summand independent of the representative `g` (by 1.1); there are finitely many double cosets
and each `K ∩ gHg⁻¹` has finite index in `K`. Prove the homological form
`tr^G_H ∘ cor^G_K = Σ_{KgH} cor^H_{H ∩ g⁻¹Kg} ∘ c_{g⁻¹} ∘ tr^K_{K ∩ gHg⁻¹}` on `Hₙ(K, M)`. Route:
through Shapiro's lemma corestriction is induced by the trace `Coind_H^G M → M`
(`TauCeti.groupCohomology.coindIso_hom_comp_corestriction`); `Coind_H^G Res M ≅ Ind_H^G Res M` as
`H` has finite index (`Rep.indCoindIso`), and the restriction to `K` of `Ind_H^G Res M` is the sum
over `K\G/H` of the representations `Ind_{K ∩ gHg⁻¹}^K` of the conjugated restrictions of `M`
(`Rep.mackeyDecomposition`; Brown82 Ch. III §§8–9), each coinduced too, as `K ∩ gHg⁻¹` has finite
index in `K`, so that Shapiro's lemma applies summand by summand; in homology the transfer
and corestriction are induced by the unit `M → Ind_H^G Res M` and the counit `Ind_K^G Res M → M`
(`TauCeti.groupHomology.transfer_comp_indIso_inv`, `TauCeti.groupHomology.indIso_inv_comp_map_counit`),
and the restriction to `H` of `Ind_K^G Res M` decomposes over `H\G/K` by the same Mackey
decomposition with `H` and `K` interchanged, naturally in the representation
(`Rep.mackeyDecompositionNatIso`); `H\G/K` is in bijection with `K\G/H` by `g ↦ g⁻¹`. *Needs:* 1.1,
1.4; Tau Ceti `TauCeti.groupCohomology.corestriction`, `TauCeti.groupHomology.transfer`,
`TauCeti.groupHomology.map_comp_transfer`, `TauCeti.groupCohomology.coindIso_hom_comp_corestriction`,
`TauCeti.groupHomology.transfer_comp_indIso_inv`, `TauCeti.groupHomology.indIso_inv_comp_map_counit`,
`Rep.mackeyDecomposition`, `Rep.mackeyDecompositionNatIso`; Mathlib `Rep.indCoindIso`,
`DoubleCoset.Quotient`, `DoubleCoset.mk`, `finsum`.

Each summand is a single map. Define `doubleCosetTerm H K M n g : Hⁿ(H, M) → Hⁿ(K, M)` as `conjRes`
(1.1) from `H` to the subgroup `K ∩ gHg⁻¹` of `K`, written
`(H.comap (MulAut.conj g⁻¹).toMonoidHom).subgroupOf K` and mapped to `G` through `K`, followed by
`TauCeti.groupCohomology.corestriction` from that subgroup to `K`; it is
`cor^K_{K ∩ gHg⁻¹} ∘ c_g ∘ res^H_{H ∩ g⁻¹Kg}`, since `c_g ∘ res^H_{H ∩ g⁻¹Kg}` is the pair
`(x ↦ g⁻¹xg : K ∩ gHg⁻¹ → H, m ↦ g·m)`. The formula then reads: for every function `r` choosing a
representative `r(q)` of each double coset `q ∈ K\G/H` (that is, `DoubleCoset.mk K H (r q) = q`),
`cor^G_H` followed by restriction to `K` is the finite sum `∑ᶠ q, doubleCosetTerm H K M n (r q)`
(`res_comp_corestriction_eq_finsum`); the sum has finitely many nonzero terms because `K\G/H` is a
quotient of `G/H`.

- For `g = 1`, `doubleCosetTerm` is restriction from `H` to `K ∩ H` followed by corestriction to
  `K`.
- It depends only on the double coset `KgH`: for `k ∈ K` and `h ∈ H`, the term of `kgh` is the
  term of `g` followed by `c_k` on `Hⁿ(K, M)` and preceded by `c_h` on `Hⁿ(H, M)`, both the
  identity by inner triviality, once `c_k` is moved past the corestriction (1.1).
- It is natural in `M` for morphisms of representations, as `conjRes` and corestriction are.

In homology each summand is likewise a single map. Define
`doubleCosetTermHomology H K M n g : Hₙ(K, M) → Hₙ(H, M)` as the transfer
`TauCeti.groupHomology.transfer` from `K` to its subgroup `K ∩ gHg⁻¹`, written
`(H.comap (MulAut.conj g⁻¹).toMonoidHom).subgroupOf K`, followed by `conjCores` (1.1) from that
subgroup, mapped to `G` through `K`, to `H` with the element `g`; it is
`cor^H_{H ∩ g⁻¹Kg} ∘ c_{g⁻¹} ∘ tr^K_{K ∩ gHg⁻¹}`, since `conjCores` with `g` is the pair
`(x ↦ g⁻¹xg : K ∩ gHg⁻¹ → H, m ↦ g⁻¹·m)`. The homological formula then reads: for every choice `r`
of representatives of `K\G/H` as above, corestriction from `K` to `G` (`groupHomology.map` along
the inclusion of `K`) followed by `TauCeti.groupHomology.transfer` from `G` to `H` is the finite sum
`∑ᶠ q, doubleCosetTermHomology H K M n (r q)` (`transfer_comp_cores_eq_finsum`), for any group `G`,
`H` of finite index, any `K`, any `k`, `M : Rep k G` and `n ≥ 0`.

- For `g = 1`, `doubleCosetTermHomology` is the transfer from `K` to `K ∩ H` followed by
  corestriction to `H`.
- It depends only on the double coset `KgH`: for `k ∈ K` and `h ∈ H`, the term of `kgh` is the
  term of `g` preceded by `c_{k⁻¹}` on `Hₙ(K, M)` and followed by `c_{h⁻¹}` on `Hₙ(H, M)`, both the
  identity by inner triviality, once `c_{k⁻¹}` is moved past the transfer (1.1).
- It is natural in `M` for morphisms of representations, as the transfer
  (`TauCeti.groupHomology.map_comp_transfer`) and `conjCores` are.

**Checks.**

- For finite `G` with the discrete topology, the formula agrees under `Θ` (1.5) with
  `TauCeti.ContinuousCohomology.corestriction_mackey`, and with ProfiniteCohomology §6.4's `S₃`
  Check: for `H = K = ⟨(12)⟩ ≤ S₃` there are two double cosets, the nontrivial one contributing a
  map through `Hⁿ(1, M) = 0`, so `res ∘ cor = id` on `Hⁿ(⟨(12)⟩, M)` for `n > 0`.
- `K = 1`, degree `0`: `res^G_1 cor^G_H(m) = Σ_{gH ∈ G/H} g·m`.
- `K = H ◁ G`: `res^G_H cor^G_H = Σ_{gH ∈ G/H} c_g`.
- Degree `0` in homology: the elements `g⁻¹s`, `s ∈ (K ∩ gHg⁻¹)\K`, run over `H\G` as `KgH` runs
  over `K\G/H`, as the transfer requires; `c_g` in place of `c_{g⁻¹}` would land in the homology
  of `gKg⁻¹ ∩ g²Hg⁻²`, which is not a subgroup of `H` in general.
- `doubleCosetTermHomology` for `G = S₃`, `H = K = ⟨(12)⟩`, trivial `ℤ`, degree `0`: corestriction
  followed by transfer is multiplication by `[G : H] = 3` on `H₀(K, ℤ) = ℤ`; the term of `g = 1` is
  the transfer from `K` to `K ∩ H = K`, multiplication by `1`, and the term of `g = (13)`, for which
  `K ∩ gHg⁻¹ = ⟨(12)⟩ ∩ ⟨(23)⟩ = 1`, is the transfer to `1`, multiplication by `2`, followed by
  `H₀(1, ℤ) = ℤ → H₀(H, ℤ) = ℤ`, the identity; `1 + 2 = 3`. In positive degrees the second term
  factors through `Hₙ(1, M) = 0`, so `tr ∘ cor` is the identity of `Hₙ(⟨(12)⟩, M)`.
- `doubleCosetTermHomology` for `H = G`: there is one double coset, and the term of `g` is the
  transfer from `K` to its top subgroup, an isomorphism, followed by `c_{g⁻¹}` and corestriction to
  `G`, which is `c_{g⁻¹} ∘ cor^G_K = cor^G_K`, as `c_{g⁻¹}` commutes with corestriction and is the
  identity on `Hₙ(G, M)` (1.1); both sides of the formula are `cor^G_K`.
- `doubleCosetTermHomology` for `K = 1`, degree `0`: the double cosets are the cosets `gH`, every
  intersection `K ∩ gHg⁻¹` is `1`, and the term of `g` is `m ↦ [g⁻¹·m]` from `M` to `M_H`; their sum
  `Σ_{gH ∈ G/H} [g⁻¹·m]` is the transfer `Σ_{Ht ∈ H\G} [t·m]` of the class of `m`, the elements
  `g⁻¹` running over representatives of `H\G`.

### 7.2 Stable elements

Let `G` be finite, `p` prime and `P` a Sylow `p`-subgroup. Call `z ∈ Hⁿ(P, M)` *stable* if
`res^P_{P ∩ gPg⁻¹} z = res^{gPg⁻¹}_{P ∩ gPg⁻¹}(c_g z)` for every `g ∈ G`. Prove that for `n ≥ 1`
restriction maps `Hⁿ(G, M)(p)` isomorphically onto the stable classes; that for `n ≥ 1`
homological corestriction maps the classes `z ∈ Hₙ(P, M)` with
`tr^P_{P ∩ gPg⁻¹} z = tr^{gPg⁻¹}_{P ∩ gPg⁻¹}(c_g z)` for all `g` isomorphically onto `Hₙ(G, M)(p)`;
and that in Tate cohomology restriction maps `Ĥⁿ(G, M)(p)` isomorphically onto the stable classes of
`Ĥⁿ(P, M)` for every `n ∈ ℤ`. If `P` is abelian and `G` acts trivially on `M`, the stable classes are
the invariants of `N_G(P)` acting by conjugation (Brown82 Ch. III §10): by Burnside's fusion
argument, for `A ≤ P` and `g` with `gAg⁻¹ ≤ P` some `n ∈ N_G(P)` induces the same map `A → P` as
`g`, and with trivial coefficients `c_g` depends only on that map. For a nontrivial action the
fusion conditions remain (Checks). Route: in cohomology, injectivity is Tau Ceti's Sylow theorem;
for a stable `z`, 7.1 gives `res cor z = [G : P] z` with `[G : P]` prime to `p` (MilneCFT Ch. II
Prop. 1.30 and Cor. 1.33, pp. 70–71; Hutchinson13 §3, p. 11). In
homology, `cor ∘ tr = [G : P]` (`TauCeti.groupHomology.transfer_comp_map_subtype_id`), the
transfer of every class of `G` is stable, and the homological formula of 7.1 gives
`tr cor z = [G : P] z` for a stable `z`; `Hₙ(P, M)` is killed by `|P|` for `n ≥ 1`. In Tate
cohomology, `TauCeti.TateCohomology.res` is ordinary restriction in degrees `≥ 1` and the
homological transfer in degrees `≤ −2`, where the Tate clause is the cohomological clause and,
through `cor ∘ tr = [G : P]`, the homological one; degrees `0` and `−1` follow from degrees `1` and
`−2` by the connecting isomorphisms of the dimension-shifting sequences of `Rep.dimensionShiftDown`
and `Rep.dimensionShiftUp`, restricted to the subgroups concerned, which commute with Tate
restriction (`TauCeti.TateCohomology.δ_comp_res`) and with conjugation
(`TauCeti.TateCohomology.δ_comp_map`). For `M = ℤ_(r)` with trivial action and `n ≥ 1`, the
cohomological statement is the stable-element theorem of K3BlochGroups §5.2; the target adds
arbitrary coefficients, homology and Tate cohomology. *Needs:* 1.1, 7.1; K3BlochGroups §5.2,
ArithmeticGaloisDuality §D7.2 and InductionRestrictionPartII RS.0.3 for the comparisons; Tau Ceti
`TauCeti.groupCohomology.eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero`,
`TauCeti.groupHomology.transfer`, `TauCeti.groupHomology.transfer_comp_map_subtype_id`,
`TauCeti.TateCohomology.res`, `TauCeti.TateCohomology.cor`, `TauCeti.TateCohomology.res_comp_cor`,
`TauCeti.TateCohomology.δ_comp_res`, `TauCeti.TateCohomology.map`,
`TauCeti.TateCohomology.δ_comp_map`, `Subgroup.fintypeOfFinite`, `Rep.dimensionShiftUp`,
`Rep.dimensionShiftDown`; Mathlib `Sylow`, `TateCohomology.isoGroupCohomology`,
`TateCohomology.isoGroupHomology`.

Define the predicate `IsStableClass`: for a subgroup `P ≤ G` and `z ∈ Hⁿ(P, M)`,
`IsStableClass M P n z` holds when, for every `g ∈ G`, `conjRes` (1.1) from `P` to `P ∩ gPg⁻¹`,
written `P ⊓ P.comap (MulAut.conj g⁻¹).toMonoidHom`, takes the same value on `z` for the element
`1` (restriction) and for the element `g` (`c_g` followed by restriction); this is the stability
condition above. The cohomological clause is then
`bijOn_res_sylow_isStableClass`: for finite `G`, a prime `p`, `P : Sylow p G`, any commutative
ring `k`, `M : Rep k G` and `n ≠ 0`, restriction `groupCohomology.map` along the inclusion of `P`
is a bijection (`Set.BijOn`) from the classes of `Hⁿ(G, M)` killed by a power of `p` onto the
classes `z` with `IsStableClass M P n z`.

In homology, define the predicate `IsHomologyStableClass`: for finite `G`, a subgroup `P ≤ G` and
`z ∈ Hₙ(P, M)`, `IsHomologyStableClass M P n z` holds when, for every `g ∈ G`, the transfer of `z`
to `P ∩ gPg⁻¹` and the image under `c_g` of its transfer to `P ∩ g⁻¹Pg` are equal. Both
intersections are subgroups of `P`, written `(P.comap (MulAut.conj g⁻¹).toMonoidHom).subgroupOf P`
and `(P.comap (MulAut.conj g).toMonoidHom).subgroupOf P`; the two classes are compared in
`Hₙ(P ⊓ P.comap (MulAut.conj g⁻¹).toMonoidHom, M)` through `conjCores` (1.1), with the element `1`
for the first (an isomorphism of the two copies of `P ∩ gPg⁻¹`) and the element `g⁻¹` for the
second (the pair `(y ↦ gyg⁻¹, m ↦ g·m)`, which is `c_g`). As `c_g` commutes with the transfer
(1.1), `c_g(tr^P_{P ∩ g⁻¹Pg} z) = tr^{gPg⁻¹}_{P ∩ gPg⁻¹}(c_g z)`, so this is the homological
stability condition above. The homological clause is `bijOn_cores_sylow_isHomologyStableClass`:
for finite `G`, a prime `p`, `P : Sylow p G`, any commutative ring `k`, `M : Rep k G` and `n ≠ 0`,
`groupHomology.map` along the inclusion of `P` is a bijection from the classes `z` with
`IsHomologyStableClass M P n z` onto the classes of `Hₙ(G, M)` killed by a power of `p`.

In Tate cohomology, define the predicate `IsTateStableClass`: for `[Fintype G]`, a subgroup
`P ≤ G`, `n ∈ ℤ` and `z ∈ Ĥⁿ(P, M)`, `IsTateStableClass M P n z` holds when, for every `g ∈ G`, the
Tate restriction `TauCeti.TateCohomology.res` of `z` to `P ∩ gPg⁻¹` equals the image of its Tate
restriction to `P ∩ g⁻¹Pg` under `TauCeti.TateCohomology.map` for the isomorphism
`P ∩ g⁻¹Pg ≃* P ∩ gPg⁻¹`, `y ↦ gyg⁻¹`, and the coefficient map `m ↦ g·m`, which is `c_g` of 1.1.
The two intersections are the subgroups of `P` above, and subgroups of finite groups carry Tau
Ceti's `Subgroup.fintypeOfFinite`, as in `TauCeti.TateCohomology.res`. As Tate restriction commutes
with `c_g`, this is the Tate stability condition above. The Tate clause is
`bijOn_tateRes_sylow_isTateStableClass`: for `[Fintype G]`, a prime `p`, `P : Sylow p G`, any
commutative ring `k`, `M : Rep k G` and every `n ∈ ℤ`, `TauCeti.TateCohomology.res` to `P` is a
bijection from the classes of `Ĥⁿ(G, M)` killed by a power of `p` onto the classes `z` with
`IsTateStableClass M P n z`.

- The stable classes form a `k`-submodule of `Hⁿ(P, M)` (respectively of `Ĥⁿ(P, M)`, and, with the
  transfer condition, of `Hₙ(P, M)`) containing the restriction (respectively the transfer) of
  every class of `G`.
- Cohomology, `n ≥ 1`: `res^G_P` restricts to an isomorphism from `Hⁿ(G, M)(p)` onto the stable
  classes, inverse to `[G : P]⁻¹ cor^G_P`, `[G : P]` acting invertibly on `p`-primary parts.
- Homology, `n ≥ 1`: the homological corestriction is an isomorphism from the stable classes of
  `Hₙ(P, M)` onto `Hₙ(G, M)(p)`, inverse to `[G : P]⁻¹ tr^G_P`.
- Tate cohomology, every `n ∈ ℤ`: `res^G_P` restricts to an isomorphism from `Ĥⁿ(G, M)(p)` onto the
  stable classes of `Ĥⁿ(P, M)`, inverse to `[G : P]⁻¹ cor^G_P` (`TauCeti.TateCohomology.cor`).
- The three predicates agree where the theories do: for `n ≥ 1`, `TateCohomology.isoGroupCohomology`
  carries the classes with `IsTateStableClass M P n` onto those with `IsStableClass M P n`, and for
  `n = −m − 1 ≤ −2`, `TateCohomology.isoGroupHomology` carries them onto those with
  `IsHomologyStableClass M P m`.
- Abelian Sylow subgroup and trivial action: the stable classes are the `N_G(P)`-invariants.
- Comparison: for `M = ℤ_(r)` with trivial action, `p = r` and `n ≥ 1`, `Hⁿ(G, ℤ_(r))(r) = Hⁿ(G, ℤ_(r))`
  and the cohomological isomorphism is that of K3BlochGroups §5.2.
- Comparison with ArithmeticGaloisDuality §D7.2: for `k = ℤ` and `n ≥ 1`, the homological
  isomorphism makes every element of `Hₙ(G, M)(p)` the corestriction of a stable class, which is
  §D7.2's homological Sylow statement with `Hₙ(P, M)` narrowed to its stable classes.
- Comparison with InductionRestrictionPartII RS.0.3: for `P` normal, `k = M = ℤ` and `n = 2`,
  `P ∩ gPg⁻¹ = gPg⁻¹ = P`, so the stable classes are the invariants `H₂(P, ℤ)^G`. As `G` acts
  through `G ⧸ P`, whose order is invertible on the `p`-group `H₂(P, ℤ)`, the projection maps these
  invariants isomorphically onto the coinvariants `H₂(P, ℤ)_G`, and corestriction factors through
  it (conjugation by `g ∈ G` acts trivially on `H₂(G, ℤ)`, 1.1); the homological isomorphism is
  then RS.0.3's for the normal Hall subgroup `P`.

**Checks.**

- For `G = P` every class is stable and the statement is `Hⁿ(P, M)(p) = Hⁿ(P, M)`.
- `G = S₃`, `p = 3`, `P = A₃` normal: `ℤ/2` acts on `H²(A₃, ℤ) = ℤ/3` by `−1` and on
  `H⁴(A₃, ℤ) = ℤ/3` by `+1`, so `H²(S₃, ℤ)(3) = 0` and `H⁴(S₃, ℤ)(3) = ℤ/3`, consistent with
  `H²(S₃, ℤ) = ℤ/2` and `H⁴(S₃, ℤ) = ℤ/6`.
- Degree `0` is excluded: for `M = ℤ`, `H⁰(G, ℤ)(p) = 0` while every element of `H⁰(P, ℤ) = ℤ` is
  stable.
- The trivial-action hypothesis of the abelian simplification is needed: for `G = C₂ × S₃`, `p = 2`,
  `P = C₂ × ⟨(12)⟩` (abelian, with `N_G(P) = P`) and `M = 𝔽₂³` with `S₃` permuting the coordinates
  and `C₂ = ⟨z⟩` acting trivially, the cocycle on `P` with `z ↦ e₃` and `(12) ↦ 0` is
  `N_G(P)`-invariant, but for `g = (23)`, `P ∩ gPg⁻¹ = ⟨z⟩` and `c_g` changes its restriction to
  `H¹(⟨z⟩, M) = M` from `e₃` to `(23)·e₃ = e₂`, so it is not stable. Counting: as a `P`-module
  `M = 𝔽₂[P/⟨z⟩] ⊕ 𝔽₂`, so `dim H¹(P, M) = 1 + 2 = 3`, all `N_G(P)`-invariant, while
  `M = Ind_P^G 𝔽₂` gives `dim H¹(G, M) = dim H¹(P, 𝔽₂) = 2`, the dimension of the stable classes.
- Normal Sylow subgroup in homology, compared with InductionRestrictionPartII RS.0.3: for
  `G = (ℤ/3)² ⋊ ℤ/2` with the generator of `ℤ/2` acting by inversion, `p = 3`, `P = (ℤ/3)²` and
  `M = ℤ`, the stable classes are the invariants of `ℤ/2` on `H₂(P, ℤ) = Λ²P = ℤ/3`
  (InductionRestrictionPartII RS.6.8, whose isomorphism is natural in `P` by its formula on
  `a ∧ b`), on which inversion acts by `(−1)² = 1`; so `H₂(G, ℤ)(3) = ℤ/3`, RS.0.3's value, and
  as the Sylow `2`-subgroup `ℤ/2` has `H₂(ℤ/2, ℤ) = 0`, `H₂(G, ℤ) = ℤ/3`. A model letting
  `ℤ/2` act on `H₂(P, ℤ)` as on `P`, by `−1`, would give `0`.
- `IsHomologyStableClass` for `G = S₃`, `p = 3`, `P = A₃`, `M = ℤ`, `n = 1`: both intersections
  are `A₃`, the transfers are isomorphisms, and `c_{(12)}` acts on `H₁(A₃, ℤ) = A₃ = ℤ/3` by
  `x ↦ x⁻¹`, that is by `−1`; so the stable classes are those with `z = −z`, only `0`, matching
  `H₁(S₃, ℤ)(3) = (ℤ/2)(3) = 0`. Counting every class of `H₁(P, ℤ)` as stable would give `ℤ/3`.
- `IsHomologyStableClass` in degree `0`, excluded from the homological clause: for `G = S₃`,
  `p = 3` and `M = ℤ`, every class of `H₀(A₃, ℤ) = ℤ` is stable and corestriction
  `H₀(A₃, ℤ) → H₀(S₃, ℤ)` is the identity of `ℤ`, while `H₀(S₃, ℤ)(3) = 0`.
- `IsTateStableClass` in degree `0`: for `G = P = ℤ/2` and `M = ℤ`, `Ĥ⁰(G, ℤ) = ℤ/2` is
  `2`-primary and every class is stable, while the ordinary `H⁰(G, ℤ)(2)` is `0`. For `G = S₃`,
  `p = 2`, `P = ⟨(12)⟩` and `M = ℤ`, restriction `Ĥ⁰(S₃, ℤ) = ℤ/6 → Ĥ⁰(P, ℤ) = ℤ/2` is reduction
  modulo `2` and maps the `2`-primary part `{0, 3}` bijectively onto `ℤ/2`; every class is stable,
  since `P ∩ gPg⁻¹ = 1` for `g ∉ P = N_G(P)`, and `Ĥ⁰(1, ℤ) = 0`.
- `IsTateStableClass` uses the coefficient action: for `G = S₃`, `p = 3`, `P = A₃` and
  `M = ℤ_sgn` (`S₃` acting by the sign), `A₃` acts trivially, `Ĥ⁰(A₃, ℤ_sgn) = ℤ/3` and `c_{(12)}`
  is `m ↦ −m` there, so only `0` is stable, matching `Ĥ⁰(S₃, ℤ_sgn) = (ℤ_sgn)^{S₃}/N(ℤ_sgn) = 0`;
  a conjugation without the coefficient map would make all of `ℤ/3` stable. With `M = ℤ` instead,
  `c_{(12)}` is the identity on `Ĥ⁰(A₃, ℤ) = ℤ/3`, every class is stable, and restriction maps the
  `3`-primary part `{0, 2, 4}` of `Ĥ⁰(S₃, ℤ) = ℤ/6` onto it by reduction modulo `3`; on
  `Ĥ²(A₃, ℤ) = ℤ/3` the same element acts by `−1`, so a single sign for all degrees is wrong.

### Examples

For `G = A₄`, `p = 2`, `P = V₄` normal with `N_G(P)/P = ℤ/3` permuting the three involutions,
`H¹(A₄, 𝔽₂)` is the invariants of `ℤ/3` on `Hom(V₄, 𝔽₂) = 𝔽₂²`, which are zero.

### Dependencies

Layer 1; Tau Ceti's corestriction, transfer, Tate restriction and corestriction, Tate change of
group, dimension-shifting sequences, Mackey decomposition and Sylow theorem; Mathlib's
`Rep.indCoindIso`; ProfiniteCohomology §6.4 and Tau Ceti's continuous Mackey formula for a Check;
K3BlochGroups §5.2,
ArithmeticGaloisDuality §D7.2 and InductionRestrictionPartII RS.0.3 for the comparisons of 7.2;
InductionRestrictionPartII RS.6.8 for a Check of 7.2.

---

## Layer 8: Tate duality and periodicity of finite groups

Throughout, `G` is finite, in `Type`, and representations are over `ℤ`; the Tate cup product is
Tau Ceti's.

### 8.1 Tate duality

Let `M : Rep ℤ G` and `M^∨ = Hom(M, ℚ/ℤ)` with the contragredient action, `(g·f)(m) = f(g⁻¹m)`:
in Lean `(ihom M).obj (Rep.trivial ℤ G (AddCircle (1 : ℚ)))`, with `ℚ/ℤ = AddCircle (1 : ℚ)` and
trivial action. For `i ∈ ℤ` write `⟨x, y⟩ ∈ Ĥ⁻¹(G, ℚ/ℤ)`, for `x ∈ Ĥ^{−1−i}(G, M)` and
`y ∈ Ĥⁱ(G, M^∨)`, for the Tate cup product `x ∪ y ∈ Ĥ⁻¹(G, M ⊗ M^∨)` followed by the map induced
by the evaluation `M ⊗ M^∨ → ℚ/ℤ`, `m ⊗ f ↦ f(m)` (`CategoryTheory.ihom.ev`). Prove that the
pairing is perfect in its second variable: a class `y` with `⟨x, y⟩ = 0` for every `x` is zero,
and every additive map `Ĥ^{−1−i}(G, M) → Ĥ⁻¹(G, ℚ/ℤ)` is `x ↦ ⟨x, y⟩` for some `y`
(`tate_duality`). As `G` acts trivially on `ℚ/ℤ`, `Ĥ⁻¹(G, ℚ/ℤ)` is the kernel of multiplication
by `|G|`, the subgroup `{x ∈ ℚ/ℤ : |G|x = 0} ⊂ ℚ/ℤ`, and `Ĥ^{−1−i}(G, M)` is killed by `|G|`; so
the statement is the isomorphism `Ĥⁱ(G, M^∨) ≅ Hom(Ĥ^{−1−i}(G, M), ℚ/ℤ)` for all `i ∈ ℤ`.
Prove the integral form: for `M` free as an
abelian group (`Module.Free ℤ M`) and `M^* = Hom(M, ℤ)` with the contragredient action, in Lean
`(ihom M).obj (Rep.trivial ℤ G ℤ)`, the pairing `Ĥ^{−i}(G, M) × Ĥⁱ(G, M^*) → Ĥ⁰(G, ℤ)`, cup
product followed by the map induced by the evaluation `M ⊗ M^* → ℤ`, is perfect in its second
variable in the same sense: a class `y` pairing to zero with every `x` is zero, and every additive
map `Ĥ^{−i}(G, M) → Ĥ⁰(G, ℤ)` is pairing with some `y` (`tate_duality_of_free`). As
`a mod |G| ↦ a/|G|` identifies `Ĥ⁰(G, ℤ) = ℤ/|G|` with the subgroup of `ℚ/ℤ` killed by `|G|`, and
`Ĥ^{−i}(G, M)` is killed by `|G|`, this is the isomorphism
`Ĥⁱ(G, Hom(M, ℤ)) ≅ Hom(Ĥ^{−i}(G, M), ℚ/ℤ)` (Brown82 Ch. VI §7; CE56 Ch. XII). Route: degree `0`
by the exactness of `Hom(−, ℚ/ℤ)`, then dimension shifting along `0 → M″ → Ind_1^G M → M → 0` and
its dual `0 → M^∨ → (Ind_1^G M)^∨ → (M″)^∨ → 0`, both split over `ℤ` and with middle terms of
vanishing Tate cohomology, with Tau Ceti's `cup_δ_of_leftInverse` and `δ_cup_of_leftInverse`,
which put no condition on `M` (`cup_δ_of_flat` needs `M` flat over `ℤ`, which fails for
`M = ℤ/2`); the integral form from `0 → Hom(M, ℤ) → Hom(M, ℚ) → M^∨ → 0` (exact for free `M`, and
still exact after `M ⊗ −` as `M` is flat), the vanishing of `Ĥ` on the uniquely divisible
`Hom(M, ℚ)`, and the compatibility of the cup product with the connecting maps of this sequence
and of `0 → ℤ → ℚ → ℚ/ℤ → 0` (`cup_δ_of_flat`, `M` being flat), which carries the integral pairing
to the `ℚ/ℤ` pairing up to sign. For `M = ℤ` and `i ≥ 1`, with `Ĥⁱ(G, ℚ/ℤ) ≅ H^{i+1}(G, ℤ)`, the
duality with coefficients `ℚ/ℤ` is the isomorphism `H^{i+1}(G, ℤ) ≅ Hom(H_i(G, ℤ), ℚ/ℤ)` of
K3BlochGroups §5.2.
*Needs:* 4.7(a); K3BlochGroups §5.2 for the comparison; Tau Ceti
`TauCeti.TateCohomology.cup`, `TauCeti.TateCohomology.cup_δ_of_leftInverse`,
`TauCeti.TateCohomology.cup_δ_of_flat`, `TauCeti.TateCohomology.δ_cup_of_leftInverse`,
`Rep.dimensionShiftDown`; Mathlib `CategoryTheory.ihom.ev`, `Module.Free`; ClassFieldTheory
Layer 0.

**Checks.**

- `G = ℤ/2`, `M = ℤ`: `Ĥ⁰(G, ℚ/ℤ) = 0 = Hom(Ĥ⁻¹(G, ℤ), ℚ/ℤ)` and
  `Ĥ¹(G, ℚ/ℤ) = ℤ/2 = Hom(H₁(G, ℤ), ℚ/ℤ)`.
- The integral instance needs `i ≥ 1`: at `i = 1`, `H²(ℤ/2, ℤ) = ℤ/2 = Hom(H₁(ℤ/2, ℤ), ℚ/ℤ)`; the
  degree-`0` analogue fails, `H¹(G, ℤ) = 0` while `Hom(H₀(G, ℤ), ℚ/ℤ) = ℚ/ℤ`, because `Ĥ⁰` and
  `Ĥ⁻¹` are not `H⁰` and `H₀`.
- Freeness is used in the integral form: for `G = ℤ/2` and `M = ℤ/2` (not free),
  `Ĥ⁰(G, Hom(M, ℤ)) = 0` while `Hom(Ĥ⁰(G, ℤ/2), ℚ/ℤ) = ℤ/2`; the nonzero additive map
  `Ĥ⁰(G, ℤ/2) = ℤ/2 → Ĥ⁰(G, ℤ) = ℤ/2` is pairing with no class.
- The integral pairing for `G = ℤ/3`, `M = ℤ`, `i = 0`: `M^* = ℤ` with trivial action and the
  pairing `Ĥ⁰(G, ℤ) × Ĥ⁰(G, ℤ) → Ĥ⁰(G, ℤ)` is multiplication in `ℤ/3`, the degree-`0` cup product
  being the product of invariants modulo norms; so `(1, 1) ↦ 1`, which is `1/3` in `ℚ/ℤ`, and the
  three additive maps `ℤ/3 → ℤ/3` are pairing with `0, 1, 2`. At `i = 2` both sides are `ℤ/3`
  (`Ĥ²(G, ℤ) = ℤ/3`, `Ĥ⁻²(G, ℤ) = H₁(G, ℤ) = ℤ/3`), at `i = 1` both are `0`. A pairing taking values
  in `Ĥ⁻¹(G, ℤ) = 0`, the degree of the `ℚ/ℤ` form, would be zero.

### 8.2 Finite `p`-groups whose abelian subgroups are cyclic

Prove that, for a prime `p` (`Nat.Prime p`), a finite group `P` with `IsPGroup p P` (every element
has order a power of `p`) in which every abelian subgroup is cyclic is cyclic if `p` is odd, and
cyclic or isomorphic to `QuaternionGroup (2^(s−2))` for some `s ≥ 3` if `p = 2`; and conversely that
every abelian subgroup of a cyclic or generalised quaternion group is cyclic (Loh19 Cor. 1.6.18 and
Cor. 1.6.19, p. 53, both for an odd prime, and Outlook 1.6.20, p. 54;
Brown82 Ch. IV §4). Primality is a hypothesis of its own, since `IsPGroup p P` does not force `p`
to be prime. Route: a non-trivial `p`-group whose abelian subgroups are cyclic has a unique
subgroup of order `p`; for odd `p` such a group is cyclic, and for `p = 2` it is cyclic or
generalised quaternion, by induction through a cyclic subgroup of index `p`. *Needs:* Mathlib
`Nat.Prime`, `IsPGroup`, `IsCyclic`, `QuaternionGroup`.

**Checks.**

- `Q₈`: its abelian subgroups `⟨i⟩, ⟨j⟩, ⟨k⟩, ⟨−1⟩, 1` are cyclic.
- The dihedral group of order `8` and `ℤ/p × ℤ/p` contain `ℤ/p × ℤ/p` and are excluded.
- For odd `p`, the Heisenberg group of order `p³` and exponent `p` contains `ℤ/p × ℤ/p`; there is
  no odd analogue of the quaternion groups.
- Primality is needed: `p = 21` is odd but not prime. Take `P = ℤ/7 ⋊ ℤ/3`, with the generator of
  `ℤ/3` acting on `ℤ/7` by multiplication by `2`, so `(a, b)(c, d) = (a + 2^b c, b + d)`. Its
  elements are the identity, `6` of order `7` and `14` of order `3`, so `g^21 = 1` for every `g` and
  `IsPGroup 21 P` holds. `P` is not abelian, since `(1, 0)(0, 1) = (1, 1)` while
  `(0, 1)(1, 0) = (2, 1)`; so every abelian subgroup is proper, of order `1`, `3` or `7`, hence
  cyclic, and yet `P` is not cyclic.

### 8.3 Periodicity from cohomologically trivial resolutions

Prove that if `0 → ℤ_χ → C_n → ⋯ → C_0 → ℤ → 0` is an exact sequence of representations, with
`χ : G →* ℤˣ` and every `C_i` free as an abelian group and cohomologically trivial, then cup product
with the class `e ∈ Ĥⁿ⁺¹(G, ℤ_χ)` obtained from `1 ∈ Ĥ⁰(G, ℤ)` by the `n + 1` connecting maps is an
isomorphism `Ĥⁱ(G, M) → Ĥ^{i+n+1}(G, M ⊗ ℤ_χ)` for every `i ∈ ℤ` and every `M`; hence the cohomology
of `G` is periodic of period dividing `2(n + 1)`, and dividing `n + 1` when `χ` is trivial. Prove that
such a sequence exists when there is a bounded complex of free `ℤ[G]`-modules with homology `ℤ` in
degree `0`, `ℤ_χ` in degree `n ≥ 1` and `0` elsewhere (truncate at `n`; the boundaries in degree `n`
have a finite free resolution, hence are cohomologically trivial). This is the algebraic form of
the periodicity of a free cellular action on a finite-dimensional complex with the homology of
`Sⁿ` (Loh19 Thm. 4.3.7, p. 165, and its proof, pp. 165–167; Brown82 Ch. VI §9). Route: cut the
sequence into the `n + 1` short exact sequences `0 → Z_j → C_j → Z_{j−1} → 0`, with `Z_{−1} = ℤ`
and `Z_n = ℤ_χ`. Each `Z_j` is a subgroup of a free abelian group, hence free
(`Submodule.free_of_isPrincipalIdealRing`), so each of these sequences has a `ℤ`-linear retraction
of its first map and stays short exact after `M ⊗ −` for every `M`
(`Rep.shortExact_map_tensorLeft_of_leftInverse`). Each `C_j`, free over `ℤ` and cohomologically
trivial, is projective over `ℤ[G]` (`Rep.projective_of_isZero_res`), so `M ⊗ C_j` has vanishing
Tate cohomology for every `M` (`Rep.isZero_res_tensor_of_projective`; the untensored
`Rep.isZero_res_of_projective` covers only `M = ℤ`), and the `n + 1` connecting maps of the
tensored sequences are bijective (`TauCeti.TateCohomology.δ_bijective_of_isZero_X₂`). By the rule
`x ∪ δy = (−1)^p δ(x ∪ y)` for a sequence with a retraction, which puts no condition on `M`
(`TauCeti.TateCohomology.cup_δ_of_leftInverse`; `cup_δ_of_flat` would need `M` flat over `ℤ`), and
`x ∪ 1 = x` (`TauCeti.TateCohomology.cup_right_unit`), the composite of these connecting maps is
`x ↦ (−1)^{i(n+1)} x ∪ e` on `Ĥⁱ(G, M)`. For the existence statement, a bounded complex of free
modules gives the boundaries in degree `n` a finite free resolution, and free modules are
cohomologically trivial (`Rep.isZero_res_of_projective`). *Needs:* 4.7(a); Tau Ceti
`TauCeti.TateCohomology.cup_δ_of_leftInverse`, `TauCeti.TateCohomology.cup_right_unit`,
`TauCeti.TateCohomology.δ_bijective_of_isZero_X₂`, `Rep.shortExact_map_tensorLeft_of_leftInverse`,
`Rep.isZero_res_of_projective`, `Rep.isZero_res_tensor_of_projective`,
`Rep.projective_of_isZero_res`, `Submodule.free_of_isPrincipalIdealRing`; ClassFieldTheory
Layer 0 (cohomological triviality written out).

**Checks.**

- `G = ℤ/m` and `0 → ℤ →N ℤG →(t−1) ℤG → ℤ → 0` (Loh19 Remark 1.6.12, pp. 48–49,
  for `m ≥ 2`; for `m = 1` the sequence is `0 → ℤ →id ℤ →0 ℤ →id ℤ → 0`, exact):
  `n = 1`, `χ` trivial, period dividing `2`.
- `G = ℤ/2`, `n = 0`: `0 → ℤ_sgn → ℤG → ℤ → 0` gives `Ĥⁱ(G, M) ≅ Ĥⁱ⁺¹(G, M ⊗ ℤ_sgn)` and period
  dividing `2`.
- Coefficients that are not flat over `ℤ`: in the same sequence take `M = ℤ/2`. Then
  `M ⊗ ℤG = 𝔽₂[G]` is killed by `2`, so it is not projective over `ℤ[G]` (projective
  `ℤ[G]`-modules are free abelian), but it is induced from the trivial subgroup and has no Tate
  cohomology; `M ⊗ ℤ_sgn = ℤ/2` with trivial action, and the connecting map
  `Ĥⁱ(G, ℤ/2) = ℤ/2 → Ĥⁱ⁺¹(G, ℤ/2) = ℤ/2` is bijective in every degree `i`. The vanishing must come
  from the projectivity of `ℤG` and not of `M ⊗ ℤG`, and the cup-product rule from the splitting of
  the sequence over `ℤ` and not from flatness of `M`.
- `C_p × C_p` admits no such sequence, since `dim Hⁿ(C_p × C_p, 𝔽_p) = n + 1` (5.3) is unbounded.

### 8.4 Periods

Define the `p`-period of `G`, for a prime `p ∣ |G|` such that some `Ĥ^d(G, ℤ)(p)` with `d > 0` is
cyclic of order `|G|_p`, as the least such `d` (Hutchinson13 p. 12, in
the homological form compared below). Prove that for every finite group `G : Type` generated by
an element `g` (every element is a power of `g`), of order `m = orderOf g`, and every character
`χ : G^ab → ℚ/ℤ` with `χ(g) = 1/m`, the map `x ↦ x ∪ δχ`, with
`δχ ∈ Ĥ²(G, ℤ)` Tau Ceti's `TauCeti.TateCohomology.characterConnectingClass` of `χ`, followed by
the unitor `M ⊗ ℤ ≅ M`, is a bijection `Ĥⁿ(G, M) → Ĥⁿ⁺²(G, M)` for every `n ∈ ℤ` and every
`M : Rep ℤ G` (`cup_characterConnectingClass_bijective`; MilneCFT Ch. II Prop. 3.4
and Remark 3.5, p. 81, where the cup-product description is stated
without proof); in degree `0` it is
`TauCeti.TateCohomology.cup_characterConnectingClass_eq_groupCohomologyπEven`, which this extends
to all degrees. Route: Tau Ceti's Tate–Nakayama theorem
`TauCeti.TateCohomology.cup_bijective_of_forall_isPGroup_of_lTensor_injective` for `C = ℤ` with
trivial action and `u ∈ H²(G, ℤ)` the connecting image of `χ`, whose Tate class is `δχ` (Mathlib's
`TateCohomology.isoGroupCohomology` in degree `2`). Every subgroup `S` of prime-power order is
cyclic, as `G` is; `H¹(S, ℤ) = Hom(S, ℤ) = 0`; `H²(S, ℤ) ≅ H¹(S, ℚ/ℤ) = Hom(S, ℚ/ℤ)` by the
connecting map, as `Hⁱ(S, ℚ) = 0` for `i ≥ 1`, so it has `|S|` elements; and the restriction of `u`
is the connecting image of `χ|_S`, as restriction commutes with connecting maps, a generator since
`χ` is injective on `G` (`χ(g^j) = j/m ≠ 0` for `0 < j < m`), so that `χ|_S` generates
`Hom(S, ℚ/ℤ) ≅ ℤ/|S|`. The `Tor` hypothesis holds for every `M`, since an exact sequence of abelian
groups ending in a surjection onto `ℤ` splits. Composing with the unitor gives the statement. The
two-periodicity `Rep.FiniteCyclicGroup.periodicIsoOfGenerator` is an abstract isomorphism, not
stated to be cup product with `δχ`, and does not give the statement by itself.

Swan's theorem, that for an odd prime `p ∣ |G|` with a cyclic Sylow `p`-subgroup `P` the `p`-period is
`2·|N_G(P)/C_G(P)|`, and that the `2`-period is `2` for a nontrivial cyclic Sylow `2`-subgroup and
`4` for a generalised quaternion one, is K3BlochGroups §5.2's (SwanPPeriod60 Thms. 1 and 2;
Hutchinson13 Thm. 3.1, p. 12), whose period is the one defined here by
`gap:least-r-period` (Exact supplier contracts). *Needs:* 8.1; K3BlochGroups §5.2 (duality, for the
comparison of periods) with `gap:least-r-period`; Tau Ceti
`TauCeti.TateCohomology.characterConnectingClass`,
`TauCeti.TateCohomology.cup_characterConnectingClass_eq_groupCohomologyπEven`,
`TauCeti.TateCohomology.cup_bijective_of_forall_isPGroup_of_lTensor_injective`,
`Rep.FiniteCyclicGroup.periodicIsoOfGenerator`; Mathlib `TateCohomology.isoGroupCohomology`,
`IsCyclic`.

- The `p`-period, when defined, is at least `2`, since `Ĥ¹(G, ℤ) = Hom(G, ℤ) = 0` and `|G|_p > 1`.
- For `G` cyclic of order `m` and `p ∣ m` the `p`-period is `2`: `Ĥ²(G, ℤ) ≅ Ĥ⁰(G, ℤ) = ℤ/m` by
  `Rep.FiniteCyclicGroup.periodicIsoOfGenerator`.
- For `d ≥ 2`, `Ĥ^d(G, ℤ)(p)` is cyclic of order `|G|_p` exactly when `H_{d−1}(G, ℤ_(p))` is, by the
  duality of 8.1; so the `p`-period is the least `d ≥ 2` with `H_{d−1}(G, ℤ_(p))` cyclic of order
  `|G|_p`, which is K3BlochGroups §5.2's `p`-period by `gap:least-r-period`.

**Checks.**

- `S₃`: the `3`-period is `2·|S₃/A₃| = 4` (7.2's Check: `H²(S₃, ℤ)(3) = 0`, `H⁴(S₃, ℤ)(3) = ℤ/3`)
  and the `2`-period is `2`.
- `SL₂(𝔽_q)`, `q` odd: `2`-period `4`, and `H_k(SL₂(𝔽_q), ℤ_(2))` is `ℤ_(2)/q(q² − 1)` for
  `k ≡ 3 mod 4` (Hutchinson13 Cor. 3.3, p. 12).
- The hypothesis `p ∣ |G|` is needed: for `p ∤ |G|` every `Ĥ^d(G, ℤ)(p)` is `0 = ℤ/|G|_p`, so the
  least such `d` is `1`, not `2·|N_G(1)/C_G(1)| = 2`.
- `Q_{2^s}`, `s ≥ 3`, through the imported quaternion case (Exact supplier contracts): from
  `H₁ = (ℤ/2)²`, `H₂ = 0`, `H₃ = ℤ/2^s` and the duality of 8.1, `Ĥ¹ = 0`, `Ĥ² = (ℤ/2)²` (not
  cyclic), `Ĥ³ = 0` and `Ĥ⁴ = ℤ/2^s` with integral coefficients, so the `2`-period defined here is
  `4`, Swan's value for a generalised quaternion Sylow `2`-subgroup. For `Q₈`, cup product with the
  imported period class `u` is the isomorphism `Ĥ⁰(Q₈, ℤ) = ℤ/8 → Ĥ⁴(Q₈, ℤ) = ℤ/8`, `1 ↦ u`; a
  model with period `2`, as for cyclic groups, would make `Ĥ²(Q₈, ℤ)` cyclic of order `8`.

### 8.5 The periodicity theorem

Prove that the following are equivalent (`tfae_periodic_cohomology`): (a) for some `d > 0` and
`u ∈ Ĥ^d(G, ℤ)`, the map `x ↦ x ∪ u`, followed by the unitor `M ⊗ ℤ ≅ M`, is a bijection
`Ĥⁿ(G, M) → Ĥⁿ⁺ᵈ(G, M)` for every `n ∈ ℤ` and every `M : Rep ℤ G`; (b) `Ĥ^d(G, ℤ)` is cyclic of
order `|G|` for some `d ≠ 0`; (c) every abelian subgroup of `G` is cyclic; (d) for every prime `p`,
every Sylow `p`-subgroup of `G` is cyclic or isomorphic to `QuaternionGroup (2^m)` for some
`m ≥ 1`, that is, generalised quaternion. Prove the `p`-primary
form for every prime `p` (`tfae_primary_periodic_cohomology`), with `A(p)` the `p`-primary part of
the Conventions, in Lean the set `{x | ∃ j, p ^ j • x = 0}`, which is Mathlib's
`AddCommGroup.primaryComponent`, and `|G|_p = p^{v_p(|G|)}` the largest power of `p` dividing
`|G|`: (a_p) for some `d > 0` and `u ∈ Ĥ^d(G, ℤ)`, `x ↦ x ∪ u` followed by the
unitor is a bijection `Ĥⁿ(G, M)(p) → Ĥⁿ⁺ᵈ(G, M)(p)` for every `n ∈ ℤ` and every `M : Rep ℤ G`;
(b_p) `Ĥ^d(G, ℤ)(p)` is cyclic of order `|G|_p` for some `d ≠ 0`; (c_p) every abelian subgroup of
`G` that is a `p`-group is cyclic; (d_p) every Sylow `p`-subgroup is cyclic or isomorphic to
`QuaternionGroup (2^m)` for some `m ≥ 1` (equivalently one is, as they are conjugate). No
divisibility `p ∣ |G|` is assumed: for `p ∤ |G|` every `p`-primary part and every `p`-subgroup is
trivial and all four hold (Brown82 Ch. VI §9; CE56 Ch. XII; Loh19 §4.3.2, pp. 167–168). Route:
(a)⇒(b) from `Ĥ⁰(G, ℤ) = ℤ/|G|`; (b)⇒(a) since a generator has an inverse for the perfect pairing
of 8.1; (a)⇒(c) since restriction of `u` is invertible and `ℤ/p × ℤ/p` is not periodic (5.3);
(c)⇔(d) by 8.2; (d)⇒(b) by 8.4, Swan's theorem of K3BlochGroups §5.2 and 7.2, prime by prime. The
`p`-primary form runs the same route with the idempotent `e_p ∈ ℤ/|G| = Ĥ⁰(G, ℤ)`, `e_p ≡ 1` mod
`|G|_p` and `e_p ≡ 0` mod `|G|/|G|_p`, in place of `1`: (a_p)⇒(b_p) is (a_p) for `M = ℤ` and
`n = 0`; for (b_p)⇒(a_p), the integral duality of 8.1 with `M = ℤ` gives `v ∈ Ĥ^{−d}(G, ℤ)` with
`u ∪ v = e_p` for a generator `u` of `Ĥ^d(G, ℤ)(p)` (replacing `d` by `−d` when `d < 0`, as
`Ĥ^{−d}(G, ℤ)(p)` is dual to `Ĥ^d(G, ℤ)(p)`), and cup with `e_p` is the identity on `p`-primary
parts; for (a_p)⇒(c_p), with `v` as above, `res(u) ∪ res(v) = res(e_p) = 1` in
`Ĥ⁰(A, ℤ) = ℤ/|A|` for an abelian `p`-subgroup `A`, as `|A|` divides `|G|_p`, so the restriction
of `u` is invertible in `Ĥ*(A, ℤ)` and `A` is cyclic as in (a)⇒(c);
(c_p)⇔(d_p) by 8.2, as every `p`-subgroup lies in a Sylow `p`-subgroup; (d_p)⇒(b_p) by 8.4, Swan's
theorem and 7.2 at the prime `p`. *Needs:* 5.3, 7.2, 8.1, 8.2, 8.3, 8.4; K3BlochGroups §5.2; Tau
Ceti `TauCeti.TateCohomology.cup_assoc`, `TauCeti.TateCohomology.cup_res`; Mathlib
`AddCommGroup.primaryComponent`, `Nat.factorization`, `IsPGroup`, `Sylow`, `QuaternionGroup`.

**Checks.**

- `C_p × C_p` is not periodic: `dim Hⁿ(C_p × C_p, 𝔽_p) = n + 1` is unbounded.
- `SL₂(𝔽_q)`, `q = p^f` odd: its Sylow `2`-subgroups are generalised quaternion and its Sylow
  `ℓ`-subgroups for odd `ℓ ≠ p` are cyclic (Hutchinson13 p. 12), so (d_ℓ) holds for every
  prime `ℓ ≠ p` and the `2`-period is `4` (Hutchinson13 Cor. 3.3, p. 12); its Sylow `p`-subgroup is the unipotent group
  `{[[1, a], [0, 1]]} ≅ (𝔽_q, +) ≅ (ℤ/p)^f`, cyclic exactly when `f = 1`. So `SL₂(𝔽_p)` is
  periodic, and `SL₂(𝔽₉)` is not: its unipotent subgroup `ℤ/3 × ℤ/3` has order `9`, the full
  `3`-part of `|SL₂(𝔽₉)| = 720`, and violates (c).
- The trivial group satisfies all four conditions, with every `Ĥⁿ = 0` and `u = 0`; `S₃` satisfies
  them with `d = 4`, and `A₄` fails (c) through `V₄`.
- The `p`-primary form is not the global one: for `A₄` and `p = 3`, the Sylow `3`-subgroup is
  cyclic of order `3`, so (c_3) and (d_3) hold, and `Ĥ²(A₄, ℤ) = Hom(A₄, ℚ/ℤ) = Hom(A₄/V₄, ℚ/ℤ) = ℤ/3`
  is cyclic of order `|A₄|_3 = 3`, so (b_3) holds with `d = 2`; at `p = 2`, (c_2) fails through
  `V₄`, and so do all four global conditions.
- No divisibility hypothesis: for `G = ℤ/2` and `p = 3` every `Ĥⁿ(G, M)(3)` is `0`, of order
  `1 = 3^0 = |G|_3`, every `3`-subgroup is trivial, and all four `p`-primary conditions hold, with
  any `u`. A version requiring `p ∣ |G|` would exclude this case, and one demanding order `p` instead
  of `|G|_p` in (b_p) would make (b_3) fail here while (d_3) holds.
- (b_p) asks for the order `|G|_p` of the `p`-primary part, not of `Ĥ^d(G, ℤ)`: for `S₃` and
  `p = 3`, `Ĥ⁴(S₃, ℤ) = ℤ/6` has `3`-primary part `ℤ/3` of order `|S₃|_3 = 3`, while
  `Ĥ¹(S₃, ℤ) = Ĥ³(S₃, ℤ) = 0` and `Ĥ²(S₃, ℤ) = ℤ/2` have `3`-primary part `0`; so `d = 4` is the
  least positive witness, the `3`-period of 8.4, and no `d` has `Ĥ^d(S₃, ℤ)` itself of order `3`.

### Examples

`Q₈` acts freely on the unit quaternions `S³`, and the four-periodic resolution of K3BlochGroups
§5.2 gives an exact sequence `0 → ℤ → C₃ → C₂ → C₁ → C₀ → ℤ → 0` of free `ℤ[Q₈]`-modules whose
left `ℤ` maps by `1 ↦ Σ_g g`, so that both ends carry the trivial action. By 8.3 with `n = 3` and
trivial `χ` the period divides `4`, in agreement with the imported invertibility of the period
class `u`; and `Ĥ²(Q₈, ℤ) = (ℤ/2)²` is not cyclic of order `8`, so the period is exactly `4`.

### Dependencies

Layers 4, 5 and 7; K3BlochGroups §5.2 (quaternion resolution and its period class, Swan's theorem
with `gap:least-r-period`, integral duality); Tau Ceti's Tate cup product, Tate–Nakayama theorem,
Nakayama–Rim theorem, cyclic periodicity and character classes; ClassFieldTheory Layer 0.

---

## Downstream consumers

The roadmaps that state integral, cohomological-five-term, central-extension, finite-group,
abelian-group or `ℂ_p` instances of these results own those instances and are suppliers here (Scope and ownership);
none of them consumes this roadmap. Later roadmaps consume the general statements: a roadmap on
finiteness conditions and duality groups (cohomological dimension, Euler characteristics, Farrell
cohomology) consumes products and cap products (Layers 4–5), extensions (Layer 6), trees
(Layer 3), stable elements and periodicity (Layers 7–8); a roadmap that needs group (co)homology
with twisted coefficients over a ring other than `ℤ` consumes Layers 1–3 and 6.

## References

- [HS53] G. Hochschild, J.-P. Serre, *Cohomology of group extensions*, Trans. AMS 74 (1953), 110–134.
- [Loh19] C. Löh, *Group Cohomology*, lecture notes, Universität Regensburg, 2019.
- [MilneCFT] J. S. Milne, *Class Field Theory*, course notes, version 4.03, 2020.
- [SerreArbres] J.-P. Serre, *Arbres, amalgames, SL₂*, Astérisque 46, 1977.
- [Hutchinson13] K. Hutchinson, *A Bloch–Wigner complex for SL₂*, arXiv:1107.0264v2, 2013.
- [Brown82] K. S. Brown, *Cohomology of Groups*, Graduate Texts in Mathematics 87, 1982.
- [CE56] H. Cartan, S. Eilenberg, *Homological Algebra*, Princeton, 1956.
- [SwanPPeriod60] R. G. Swan, *The p-period of a finite group*, Illinois J. Math. 4 (1960), 341–346.
