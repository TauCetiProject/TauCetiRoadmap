# Roadmap: (φ,Γ)-modules, Herr complexes and local Iwasawa cohomology

**Summary.** This roadmap builds the integral, relative and analytic interfaces that turn cyclotomic Frobenius
modules into usable cohomology. Starting from period rings and the field-valued realization theorems, it
constructs `ψ` on modules, compares the signed `φ`-Herr and `ψ`-Herr complexes, proves integral and affinoid
comparison theorems, and identifies local Iwasawa cohomology with a two-term `ψ` complex. Its second end
theorem is the construction, after a proper modification, of a coherent triangulation of a densely strictly
trianguline family. Specialized Wach-module coordinates and the de Rham exponential-image criterion connect
these constructions to explicit arithmetic applications.

The roadmap is this README. `Suggested.lean` gives representative signatures on existing carriers, light
definitions and computed checks; arithmetic period modules, analytic completions and comparison functors
specified here remain targets for formalization. Names in this document specify the intended API, including
the targets that cannot yet be stated in Lean without first constructing their carriers.

## Scope and ownership

This roadmap owns Frobenius-module algebra needed for descent, finite Witt-vector descent, integral
overconvergent lattices, arbitrary-module radius models and cyclotomic equivariant decompletion. It owns
module `ψ`, the explicit signed comparison and its homotopy, integral and affinoid Herr comparison, analytic
`Γ` coefficient rings, relative finiteness and derived base change, the comparison with independently defined
Iwasawa cohomology, specialized Wach coordinates, and relative character classification and triangulation.

The underlying completed fields, Fontaine period carriers, their natural topologies and fundamental period
identity come from PadicPeriodRings §§1–4. The cyclotomic norm-field and Robba realizations, field Herr
comparison, slope filtration, pure local-system dictionary, Wach modules and differential-equation realization
needed here are constructed in §§1.0–1.0c, 3.6, 5.6a and 6.0. The period-sheaf and curve realization is the
nonequivariant target of §1.0c, followed by the cyclotomic equivariance of §1.6. These interfaces also serve
the broader theories of PadicHodgeTheory §§4–5 and 7, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 and
VectorBundlesAndIsocrystals VB4.

The ordinary finite local Artinian coefficient category is the finite-dimensional coefficient specialization
of §1.2; its Herr/Ext comparison is in §3.6. The localized Artinian construction of §3.9 additionally allows
inversion of t and requires an underlying stable lattice. It does not identify those two categories.
The finite-local-E-algebra exports are `CoefficientRobbaModule`,
`CoefficientRobbaModule.etaleEquivalence`, `HerrCohomology` and `HerrCohomology.baseChange`, for
LocalGaloisDeformationRings §0.4 and its deformation consumers.

The bounded measure algebra, its Iwasawa coordinates and characteristic-ideal theory belong to
PadicMeasuresIwasawaAlgebras. The compact abelian character spaces and scalar Mellin comparison needed for
`Γ` and `K^×` are constructed in §4.0; the relative affinoid and Robba-type `Γ` extensions are §4.1. The wider
locally analytic manifold and distribution theory belongs to LocallyAnalyticDistributions Layers 0–3. The
local derived inverse-limit tower and its Shapiro comparison are constructed independently of `ψ` in §5.0.
SelmerIwasawaCohomology Layer 3 uses this local interface in its global theory. Finite discrete cochains come
from ProfiniteCohomology; §0.6 extends them to compact coefficients and proves the continuous descent
statements required here, with canonical comparisons to NoncommutativeAndEquivariantIwasawa §F.3 on
its finite-`O_E`/E coefficient domain. ArithmeticGaloisDuality D7 consumes that shared arithmetic API.
Period-ring acyclicity with Banach coefficients is proved in §3.6.

The only Bloch–Kato construction made here is the local exponential and its image `H¹_e` needed for the
analytic application. General regulators, Perrin–Riou maps, Coleman maps, Selmer structures and main
conjectures belong to their respective roadmaps. No GL₂ representation, involution or sheaf on the projective
line is constructed here. The geometric modification below constructs the particular Fitting-ideal flattening
required by triangulations.

## Conventions

Fix a prime `p`, a finite extension `K/ℚ_p`, a separable closure, `K_∞ = K(μ_{p^∞}), H_K = Gal(K̄/K_∞)`, and
`Γ_K = Gal(K_∞/K)`. The all-component construction uses `Γ=Γ_{ℚ_p}` and the stabilizer
`Γ_K`; ordinary single-component module actions, including those called `Γ` actions, are actions of `Γ_K`.
Finite coefficient fields `E/ℚ_p` and their valuation rings `O_E` are distinguished from a
possibly nonreduced `ℚ_p`-affinoid algebra `A`. When embeddings of `K` are used, `E` contains their images.
Tensor products of analytic coefficient spaces are separated completed projective tensor products; algebraic
tensor products are written without a hat. Finite projective modules need not be free or have the same rank on
distinct connected components.

Write `R_K` for the Robba ring and `R_{A,K}` for its relative version. Superscripts `[s,r]` and `r` denote
closed annulus and outer-radius models in the radius convention of KPX. Frobenius maps the annulus `[s,r]` to
`[s/p,r/p]`. In the unramified coordinate `π`, `φ(π) = (1+π)^p−1` and `γ(π) = (1+π)^{χ(γ)}−1`. For ramified
`K` the coefficient field `F′_K` of the norm-field construction is not silently identified with `K₀`.
Frobenius on its coefficients is the Witt Frobenius. A `φ`-module has an invertible linearization, not
necessarily a bijective semilinear operator on its underlying module.

All complexes are cohomological. The signed Herr complex is

```text
Cφ,γ(M): M → M ⊕ M → M,
d⁰(x) = ((φ−1)x,(γ−1)x),
d¹(a,b) = (γ−1)a − (φ−1)b,             degrees 0,1,2.
Cψ,γ(M) has φ replaced by ψ.
Cψ(M): M --(ψ−1)--> M,                degrees 1,2.
```

Finite torsion invariants are understood before forming the rational Herr complex. Unless explicitly changed,
`Δ_K` is the **p-primary** torsion subgroup of `Γ_K`, as in KPX, and `γ_K` generates `Γ_K/Δ_K` topologically.
Thus `Δ_K` is trivial for odd `p`; the procyclic quotient can still have prime-to-p torsion. A convention
using all finite torsion is compared explicitly below. At `p=2`, integral statements use finite-group derived
invariants, never division by two.

Local reciprocity sends a uniformizer to geometric Frobenius when it is used to label rank-one characters. The
cohomological invariant is normalized by the arithmetic unramified character: `χ_ur ∪ κ(p)` has invariant `+1`
over `ℚ_p`, and reversing the two degree-one classes changes the sign. The Tate basis of `R_K(r)` satisfies
`φ(e)=e` and `γ(e)=χ(γ)^r e`; its crystalline basis `t^{−r}e` has `φ`-eigenvalue `p^(−r)`. This distinguishes
the character `x|x|` from the character `x` of `ℚ_p^×`. Hodge–Tate weights use the convention in which
`ℚ_p(1)` has weight `−1`; algebraic character exponents below have the opposite Sen-label convention when
appropriate.

## Exact supplier contracts

### From Mathlib and Tau Ceti

At Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, use `TensorProduct.lift` and `TensorProduct.ext'` in
`LinearAlgebra.TensorProduct.Basic`, including their semilinear variants. `ModuleCat.ofHom` wraps actual
linear maps, and `CochainComplex.of` and `CochainComplex.ofHom` construct native complexes and maps.
`Homotopy` has the equation `f=dH+Hd+g`; `HomotopyEquiv.toHomologyIso` gives the induced isomorphism.
`CategoryTheory.ShortComplex.moduleCatCyclesIso` and `moduleCatHomologyIso` identify cycles and homology with
the actual kernel and kernel/image quotient, including their inclusion and quotient maps. For faithfully flat
module descent use `comonadicExtendScalars` in `Algebra.Category.ModuleCat.Descent`, with its faithfully-flat
hypothesis; the fixed-basis cocycle is transported to that comonad. The restriction to finite projectives
needed for the basis-torsor descent is proved in §0.4. Use native modules, tensor products, Witt vectors,
submodules, quotients, derived categories and finite projectivity throughout.

Mathlib's `cyclotomicCharacter` and `cyclotomicCharacter.continuous` in
`NumberTheory.Cyclotomic.CyclotomicCharacter` already provide the character and continuity on the absolute
Galois group; no new character or continuity theorem is required. At Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, `TauCeti.ContCohomology.explicitCup11` in
`RepresentationTheory.Homological.ContCohomology.Cup.Product` works with continuous topological coefficients
and a continuous additive equivariant pairing. `TauCeti.ContCohomology.explicitCor1` in
`RepresentationTheory.Homological.ContCohomology.Corestriction.Basic` supplies the open finite-index
degree-one transfer, independent of its transversal. Those are not restricted to discrete coefficients. The
period acyclicity theorem of §3.6 is needed to identify their values with Herr classes.

At the same pin Tau Ceti provides `TauCeti.completedGroupAlgebra`, `completedGroupAlgebra.proj`, `of`, `ext`,
`proj_surjective` and `continuous_of` in `Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic`,
together with product, power-series and character-division modules in that directory. Use that inverse-limit
carrier for Λ, including the dyadic finite factor. The modules `TauCeti.RingTheory.FittingIdeal.Basic` and
`.BaseChange` supply `TauCeti.fittingIdeal`, `fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_baseChange`,
`fittingIdeal_prod_add_finrank`, `fittingIdeal_eq_top_iff_finrank_le`,
`fittingIdeal_map_eq_bot_iff_lt_finrank` and `fittingIdeal_le_iff_lt_finrank`. They give
presentation-independent minors, arbitrary commutative scalar change for finite modules, free-summand shifts
and the residue-field fiber-rank criterion. The fiber-rank theorem is not a flatness assertion about the
original module. These are the native Λ and Fitting-ideal carriers used here; `Suggested.lean` uses only
Mathlib interfaces available at these pins.

The semilinear scalar formula is Mathlib `LinearMap.map_smulₛₗ` in `Algebra.Module.LinearMap.Defs`: `F(a • x)
= σ(a) • F(x)`. Substituting `σ(a)=a` supplies the fixed-scalar restriction in §0.2; it is not a separate
target here.

### From the period, cohomology and geometric roadmaps

PadicPeriodRings §§1.1–1.5 supply the completed algebraic closure, its continuous Galois action, fixed
fields, normalized cyclotomic traces, Tate–Sen estimates and naturally topologized de Rham periods. Its
§§3–4.3 supply `B_cris`, `B_st` and `B_dR`, their structure maps, invariant functors, regularity and the
underlying fundamental period sequence. Section 5.7 constructs its continuous nonequivariant sections,
the tensor-cochain long exact sequence and the exponential boundary for finite-dimensional continuous
representations, including coefficient and twist naturality.

DerivedModuleAlgebra §1.T.1, “The Milnor sequence for towers of complexes”, and §1.1,
“Derived limits of towers”, supply the native module `Rlim`, shifted-cone model, Milnor sequence,
projections, connecting maps, cofinal comparisons and maps preserving specified square homotopies.
Section 0.6 applies these constructions to the finite continuous-cochain tower.

PerfectoidSpaces §§P1.6, P1.10–P1.11 and P1.16–P1.18 supply tilting and `Witt/θ`
comparisons; §§P3.7–P3.13 supply finite étale tilting and almost purity. Section P1.31 supplies the
completed cyclotomic field. PerfectoidTowers P9.0 supplies lifting continuous
cochains along finite surjections, continuous cochains into an inverse limit, and comparison with the
canonical carrier for compact coefficients. Use its jointly continuous actions and quotient topologies.
ProfiniteCohomology Layers 0–12 supply the finite discrete cochains, their functorial maps, cup products,
Shapiro, the five-term inflation–restriction sequence and cohomological dimension. Section 0.6 constructs
the finite-coefficient Hochschild–Serre bar roof before its compact limit; the compact derived realization
and compact descent comparison are also constructed there. ClassFieldTheory Layer 5 supplies finite local
Tate duality, the invariant and local Euler characteristic; §§0.6 and 3.6 here pass to lattices and rational
coefficients. Its Layers 6–7 supply the continuous local Artin map and geometric normalization by inversion,
and Layer 9 the topological Weil group and reciprocity. LocalFieldsRamification Layer 2 supplies finite
unramified extensions and their Frobenius maps.

AdicSpaces Layer 6 supplies the underlying adic Fargues–Fontaine curve with coefficient field `ℚ_p`,
corresponding to `d=1`. Section 1.0c constructs the `φ^d` curves and their d-dependent patching rings for
all `d>0`, together with the finite étale maps relating different exponents.
AdicSpacesPartII §§R0.3 and R0.5 supply completed tensor products of Huber pairs and Banach modules with
their universal properties; its analytic/schematic chart comparisons are used with AlgebraicVectorBundles
Layers 0–2 for bundles and finite-projective modules. Section 1.0c here constructs the
period-module/bundle/B-pair equivalence and Frobenius roofs on these carriers, with its global-lattice
hypotheses. CrystallineCohomology §CR.4.7 supplies higher-rank Dieudonné–Manin classification on
perfect-field isocrystals; §1.0b constructs the Robba slope filtration and pure descent, without assuming a
slope filtration for affinoid families.

On the finite-`O_E`/E domain, NoncommutativeAndEquivariantIwasawa §F.3 supplies
`arithmeticContinuousCochains`, `arithmeticHochschildSerre` and `arithmeticLocalDuality`, including lattice
independence, coefficient maps, evaluation cups, restriction/corestriction and the normalized local invariant.
Section 0.6 constructs its specified derived-limit and bar models and compares them with those objects and
maps. The period-coefficient acyclicity and Herr comparisons remain the targets of §3.6.

### From analytic roadmaps

ColemanPowerSeries §§1.45–1.49, “Trace and Frobenius scalars” through “The zeroth Frobenius coordinate is
psi”, is a direct prerequisite of §2.5. It supplies the integral zeroth Frobenius coordinate `ψ` on
`ℤ_p[[π]]`, its trace identity `pψ=φ⁻¹Tr` and
trace divisibility before reduction, including `phiBasis_repr_zero_eq_psi`. Its integral trace comparison
in §1.48 consumes IntegralIwasawaTheory §7.1: the supplier chain is IntegralIwasawaTheory →
ColemanPowerSeries → this roadmap. PadicMeasuresIwasawaAlgebras §2.2 identifies this `ψ` with the
measure operator and `ψ`-zero with support on units. Its §3a.1 supplies the universal character and
weight-space components for `ℤ_p^×`, including `{±1}×(1+4ℤ₂)`, through PadicFunctionalAnalysis §§5.1–5.3.
PadicFunctionalAnalysis §§4.3–4.4 and 4.7 supply the one-variable analytic stages, algebraic
distribution carrier and quantitative Amice bijection, including the stage norm comparisons. Its
§§1.3–1.4 and 2.2–2.4 supply finite-dimensional/finite Banach-module topologies, potentially
orthonormalizable models and countable-type strict splittings. The compact-unit character space for general
`K`, its scalar distribution/Mellin comparison and the exact tensor comparisons used in this roadmap are the
targets of §§4.0–4.1, rather than consequences of finite field coefficient extension alone.
PadicMeasuresIwasawaAlgebras §5.2 supplies exactness for compact Hausdorff inverse systems, with its
compactness hypotheses and without requiring every transition to be surjective.

RigidAnalyticGeometry §§1.1–1.4 supply affinoid algebras, finite modules, completed tensors and rational
charts; §§6.1–6.3 and 7.3 supply the admissible site, properness tests, coherent sheaves and their affinoid
equivalence. §8.1 supplies relative analytification of schemes locally of finite type over an affinoid base,
and §8.4 proper GAGA. Analytic blowups and flattening are not assumed from these contracts. The needed
finite-type Rees charts and their analytic gluing are specified in Layer 7.

## How to read the build

Layer 0 isolates finite Frobenius descent and compact cochains, including the Artin–Schreier–Witt and
small-group arguments. Layer 1 constructs the cyclotomic realizations and slope foundations, then their
integral, relative and equivariant variants. Layer 2 constructs `ψ` and its one-variable complex.
Construct the scalar character/Mellin interfaces of §4.0 and the analytic `Γ`-ring carriers and scalar-change
maps of §4.1 before §§3.4–3.5. Layer 3 fixes the signed homotopy and arithmetic descent, including the
elementary rank-one field calculations and the finite-projective `ψ`-zero analytic-annulus action of §3.5.
The remaining coadmissible-system and uniform-presentation results of §4.1 precede §4.3.
Layer 4 constructs the residue pairing and its field finiteness input before proving uniform relative
finiteness, perfectness and derived base change. Layer 5 defines the independent derived Iwasawa tower and
compares it with the `ψ` complex, specializes its pairing and verifies the nontrianguline generation
criterion. Layer 6 constructs Wach modules and their specialized coordinate interfaces. Layer 7 gives the
general character family, rank-one classification and global triangulation. Dependencies always refer to an
earlier construction in this order or an exact supplier contract above.

## Layer 0: Frobenius algebra and finite descent

### 0.1 Linearized Frobenius modules

For a commutative ring `S` and a unital endomorphism `σ`, define `PhiModule S σ` as an S-module `M` with an
S-linear isomorphism `L:S⊗_{S,σ}M ≅ M`. Its semilinear map is `F(m)=L(1⊗m)`. Define `PhiModule.Hom` by the
square commuting with `L`, and finite, finite-projective and finite-free full subcategories by the underlying
module property. Construct tensor, unit and dual for finite projectives. The API includes
`linearization_tmul`, `map_smul`, `hom_ext`, `tensor_phi`, `dual_eval_phi` and change of Frobenius-ring
scalars. No inverse to `σ` is required. Source: KL-I Convention 1.5.1, p.24. *Needs:* native tensor products
and finite projectivity.

**Checks.**

- For `σ=id` on a field, the datum is exactly an invertible linear operator, and the identity module is the
  tensor unit.
- For `S=𝔽_p[U], σ(U)=U^p`, the standard module has invertible linearization although `F` is not surjective on
  `S`: `U` is not in its image.
- A zero semilinear operator on a nonzero module fails the linearization condition; the zero module itself is
  allowed and is finite projective of rank zero.

### 0.2 Free covers and Frobenius cohomology

For every finitely generated `φ`-module `M`, construct `phiFreeCover`: a `φ`-equivariant surjection `P→M` with
P finite free. If `M` is finite projective, its kernel `N` is finite projective and `0→N→P→M→0` splits on
underlying S-modules. In KL-I Lemma 1.5.2 and Corollary 1.5.3, p.24, the matrix correction must clear the
top-left block as corrected in KL-II Appendix A, p.189; an arbitrary complementary matrix does not define an
invertible Frobenius on the cover. The API supplies the projection, exactness, underlying splitting and
compatibility of its `φ` square. A `φ`-equivariant splitting is not asserted.

Define `phiCohomologyComplex M` as `[M --(F−1)→ M]` in degrees 0,1, over the fixed scalar ring `S^{σ=1}`.
Prove `phiH0_eq_fixed` and `phiH1_eq_coker`, vanishing outside 0,1, and the Ext interpretation using the skew
ring `S{F}`, with `Fa=σ(a)F`. The unit module has the length-one skew resolution whose map is right
multiplication by `F−1` on left modules. It is this orientation that gives the displayed differential. Source:
KL-I Definition 1.5.4 and Remarks 1.5.5–1.5.6, pp.24–25. The differential is generally not S-linear. The
supplied semilinear scalar formula gives this scalar restriction.

**Checks.**

- An already free `M` admits the identity cover with zero kernel; the zero module admits a rank-zero cover.
- For `σ=id` and `F=id`, the complex has `H⁰=M` and `H¹=M`, not just the fixed part in degree zero.
- On `𝔽_p[U]` with Frobenius, `(F−1)(U)=U^p−U`, whereas `U(F−1)(1)=0`; this disproves S-linearity.
- A nonsplit extension of `φ`-modules must not acquire a `φ` splitting merely because its underlying
  projective-module sequence splits.

### 0.3 Idempotents and finite Witt bases

For a perfect `𝔽_p`-algebra `R`, construct `frobeniusFixedIdempotents`: the unique orthogonal idempotents
`(e_i)_{i∈𝔽_p}` summing to one with `x=Σ i e_i` for every `x` with `x^p=x`. This describes the fixed ring on
disconnected bases as locally constant `𝔽_p`-valued functions, not as the diagonal copy of `𝔽_p`. Source: KL-I
Lemmas 3.1.3–3.1.4, pp.65–66. API: `fixed_iff_idempotentExpansion`, `idempotent_unique`, restriction to
clopens and functoriality in `R`.

For `n,a≥1` and a finite-projective `W_n(R)`-module with invertible `φ^a`-linear `ization`, construct the
finite étale **basis torsor** of `φ^a`-fixed bases. Work on constant-rank clopens and impose determinant
invertibility on tuples of solutions. Its faithfully finite étale coordinate algebra trivializes the module.
Source: KL-I Lemma 3.2.6, pp.73–74, with the projective-basis correction in KL-II Appendix A, p.189. The API
`aswBasisTorsor`, `fixedBasis_after_etale`, `basisTorsor_baseChange` and `basisTorsor_truncate` records
faithfulness, base change and Witt truncation. Prove `fixedBasis_liftTruncation`: for `1≤m≤n`, a selected
`φ^a`-fixed basis modulo `p^m` lifts to such a basis modulo `p^n` after a further faithfully finite étale
cover, with reduction equal to that selected basis.

**Checks.**

- On a connected nonzero perfect `R, x^p=x` gives exactly `p` scalar choices. On `R=𝔽_p×𝔽_p` it gives `p²`
  choices.
- For `x=(0,1)`, its two nonzero idempotents are (1,0) and (0,1); diagonal scalar replacement fails.
- A standard rank-one `φ`-module is trivialized by its standard fixed basis; the zero vector solves the fixed
  equation but is excluded from the basis torsor.
- Over `𝔽_p×𝔽_p`, a module of ranks one and two is handled by separate clopens, not a single square
  determinant of an assumed global rank.
- Lifting a chosen fixed basis from `W₁` to `W₂` must recover that tuple modulo `p`; existence of an unrelated
  fixed basis does not test the truncation assertion.

### 0.4 Finite local-system descent and projectivity

For `n≥1` and perfect `R` over `𝔽_p`, prove `aswEquivalence`: finite locally free `ℤ/p^nℤ` sheaves on the
étale site of Spec `R` correspond to finite-projective `W_n(R) φ`-modules. For `a≥1` the `φ^a` version with
constant `ℤ_{p^a}/p^n` coefficients requires `R` to be an `𝔽_{p^a}`-algebra; use the same fixed-basis descent
with that coefficient ring. Without this extra base structure the `φ^a`-fixed coefficient sheaf need not be
constant. Construct the inverse by fixed sections after the basis torsor and faithfully flat descent.
Transport its cocycle to the native module-descent comonad. Prove `aswDescent_finiteProjective` for this
faithfully finite étale cover: descend the inverse-transpose cocycle on the dual, together with evaluation and
coevaluation. Their triangle identities descend by faithful flatness; the finite sum representing coevaluation
gives a finite dual basis for the descended module, proving finite projectivity. This restriction, together
with tensor and dual compatibility, is part of the equivalence target. When a finite Galois cover trivializes
the object, descend the tensor product by the diagonal group action, including its action on the Witt
coefficients. Source: KL-I Proposition 3.2.7, p.74, and its KL-II Appendix A correction. API: unit/counit,
sections on a trivializing cover, tensor, dual, restriction and truncation.

Prove the projectivity criterion for a finitely presented `W_n(R)`-module which is flat over `ℤ/p^nℤ` and has
invertible Frobenius linearization. The ideal step uses finite generation and `φ(J)=J`, not `φ(J)⊆J`: such an
ideal over perfect `R` is generated by an idempotent. Source: KL-I Lemma 3.2.12 and Proposition 3.2.13,
pp.75–76. API: `frobeniusStableIdeal_idempotent`, `wittProjective_of_flat_phi` and locality under finite étale
base change.

**Checks.**

- The constant rank-d local system yields `W_n(R)^d` with coordinate Frobenius; its fixed sections recover the
  coefficient module. For a>1 over `R=𝔽_p` the `φ^a`-fixed coefficient sheaf has a nontrivial arithmetic
  descent action, so it cannot be replaced by a constant coefficient ring without the stated base extension.
- For `R=𝔽_p×𝔽_p` and the action swapping components, diagonal invariants recover one copy; taking coefficient
  invariants without the tensor action loses the intended descent datum.
- The `W₂`(R)-module `W₂`(R)/p has a Frobenius map but is not `ℤ/p²`-flat, so the projectivity criterion does
  not apply.
- In the perfect closure of `𝔽_p[T], J=(T)` has `φ(J)⊆J` but not equality and is not an idempotent ideal. The
  weakened ideal criterion is false.

### 0.5 Small lattice groups and Lang descent

Let `g⊆M_d(ℚ_p)` be a finite-dimensional algebraic Lie subalgebra, `g_n=g∩p^nM_d(ℤ_p)`. For `n≥2` (or `n≥1`
when `p` is odd), construct the convergent matrix exponential/logarithm comparison between `g_n` and its BCH
group. For `m≥1`, construct the smooth connected unipotent Greenberg group over `𝔽_p` representing the
corresponding quotient of Witt-valued small lattices, denoted `smallLatticeGreenberg g n m`. Its central
filtration has additive vector-group quotients. Construct `smallGroupLangTorsor` for Frobenius conjugacy
`b↦a^{−1}bφ(a)`: solve successively along that filtration, using Artin–Schreier–Witt covers, and pass to the
complete lattice with the norm estimates for exp/log. Source: KL-I Proposition 3.2.9 and proof, pp.74–75. API:
exp/log inverses, multiplication/BCH compatibility, truncation in `m`, central quotient compatibility and
finite étale Lang solution covers. The real Banach-Lie theory is not a substitute for this p-adic
construction.

For perfect `R`, prove `smallGroupLang_classification`: `φ-conjugacy` classes in `G_{n,m}(R)` are naturally in
bijection with the pointed set `H¹_ét(Spec R,G_{n,m}(𝔽_p))`, where the coefficient group is finite and
constant. For `b`, the finite étale sheaf of solutions `φ(h)=hb` is a left torsor under `G_{n,m}(𝔽_p)`;
replacing `h` by ha changes `b` to `a⁻¹bφ(a)`. Use inversion to express it as a right torsor if that is the
descent convention. The additive central filtration gives `H¹_ét(Spec R,G_{n,m})=1` on the affine base; hence
extending a constant-group torsor to `G_{n,m}` trivializes it and produces a representative `b`. Prove that
changing this trivialization changes only its `φ-conjugacy` class. API: naturality in `R` and truncation,
pointed-class compatibility, and equality of torsor classes exactly for `φ-conjugate` representatives. This is
the classification assertion of KL-I Proposition 3.2.9, not merely existence of a solution cover.

**Checks.**

- A class is trivial exactly when `b=h⁻¹φ(h)` for some `h` over `R` itself; étale local solvability alone does
  not make its class trivial.
- In the strictly upper triangular `2×2` case `X²=0, exp(X)=1+X` and BCH is addition; Lang reduces to the
  additive Witt equation.
- At `p=2` the chosen `n=2` bound is valid, while exp on all `2M_d(ℤ₂)` is not justified by the odd-prime
  convergence argument.
- For `g=0` the group and its Lang torsor are trivial. For nonzero g the torsor parametrizes solutions of the
  Frobenius equation, rather than declaring every `b` equal to one before base change.

### 0.6 Compact continuous complexes and finite descent

For a profinite `G` and a finitely generated `O_E`-module `T` with continuous action, define
`compactGaloisComplex G T` as `Rlim_m C•_cont(G,T/ϖ^mT)` on the native module derived category. Identify it
with continuous cochains into `T` using the coefficientwise inverse-limit and lifting results of
PerfectoidTowers P9.0. Finite continuous coefficients use the supplied ProfiniteCohomology complex directly;
finite-dimensional `E` coefficients use a stable lattice followed by inversion of `ϖ` and a commensurability
comparison. Preserve the actual inflation, restriction, corestriction and cup maps. Apply the supplied module
Milnor sequence as `compactGaloisComplex_milnor`:
`0 → lim¹ H^(i−1) → H^i(Rlim C_m) → lim H^i(C_m) → 0`; omit the `lim¹` term only when the relevant system is
Mittag–Leffler. Retain its projections, connecting maps, cofinality and specified homotopy squares.
The API also comprises derived coefficient triangles and their
ordinary reduction comparison for `O_E`-flat `T`, `compactGaloisComplex_latticeIndependent`, cup and trace
naturality. Sources: CC-1999 §§II.1–II.3; KPX §4.1; the supplied cochain-limit comparison. *Needs:*
ProfiniteCohomology Layers 0–12; PerfectoidTowers P9.0; DerivedModuleAlgebra §§1.T.1,1.1,S.1; native localization;
PadicMeasuresIwasawaAlgebras §5.2.

For a profinite `G`, a closed normal subgroup `H`, quotient `Q=G/H` and a finite discrete continuous
`G`-module `F`, construct `finiteDiscreteHochschildSerreRoof`, the natural derived comparison
`RΓ(G,F) ≃ RΓ(Q,RΓ(H,F))`. Use the continuous bar resolution and its double-complex totalization,
retaining the homotopy-coherent quotient action: conjugation on raw `H` cochains need not factor through
`Q` as a strict action. Construct the comparison on a quotient-equivariant resolution and retain its
inflation, restriction, open finite-index transfer and cup maps, including the edge maps on cohomology.
The finite coefficient condition concerns `F`, not the generally infinite groups of cochains.
Source: NSW, Chapter II §4, Theorem 2.4.1, p.111, with the continuous bar-double-complex construction.
Use DerivedModuleAlgebra §S.1 for the first-quadrant spectral sequence and its abutment maps.

For an open normal subgroup `H` with finite quotient `Q`, construct `compactFiniteDescent : RΓ(G,T) ≃
RΓ(Q,RΓ(H,T))` using this roof modulo `ϖ^m`. Keep the coherent `Q` action before passing to the limit.
For a closed normal subgroup `H` with profinite quotient, construct compact continuous Hochschild–Serre by taking the derived coefficient limit of
these finite-coefficient bar roofs and using the cochain lifting comparison. The Banach period version is the
separate target of §3.6; compact descent does not assert exactness of Banach invariants. Extend finite local
Tate duality from ClassFieldTheory Layer 5 to finite `O_E-lattices` and finite-dimensional E-representations
by reduction, compact limits and rationalization, with the evaluation pairing, invariant and Euler
characteristic preserved. The Tate dual of a lattice is the compact/discrete dual in the integral pairing;
after rationalization it is `V^∨(1)`. API: finite descent transitivity and transfer,
`compactLocalTateDuality`, `rationalLocalTateDuality`, normalized cup invariant. Sources: CC-1999 §II; Liu §2
and Theorem 0.2; KPX Theorem 2.3.11. These are compact/rational extensions of the finite-coefficient supplier,
not a new finite duality theorem.

Construct `compactGaloisComplex_arithmeticComparison` on the common finite-`O_E`/E domain with
NoncommutativeAndEquivariantIwasawa §F.3's `arithmeticContinuousCochains`, `arithmeticHochschildSerre` and
`arithmeticLocalDuality`. Compare the finite-level homogeneous/inhomogeneous cochains, take the same derived
coefficient limit and rationalization, and identify the bar-totalization roofs. For the comparison `θ_T`,
require `θ_U ∘ C_here(f) = C_arithmetic(f) ∘ θ_T` for `f:T→U` and
`θ_(T⊗U)(a∪b)=θ_T(a)∪θ_U(b)`, with derived tensors where required. Restriction and corestriction commute
with θ, and the duality comparison carries evaluation and the degree-two trace to the same invariant.
These are equations in the derived category, retaining the coherent quotient actions. ArithmeticGaloisDuality
D7's finite-`O_E`/E specialization is compared through this arithmetic API. Sources:
NoncommutativeAndEquivariantIwasawa §F.3; Nekovář, *Selmer complexes*, §§3.7, 4.2.1–4.2.9 and
§§5.2.2–5.2.7. *Needs:* NoncommutativeAndEquivariantIwasawa §F.3; the finite cochains and limit contracts above.

**Checks.**

- In `finiteDiscreteHochschildSerreRoof`, `H=1` gives the original continuous-cochain complex and `H=G`
  gives the identity comparison with `RΓ(G,F)`; both preserve cups and the identity edge map.
- For the nonsplit extension `1→C_p→C_(p²)→C_p→1` and trivial `F=𝔽_p`, the transgression of the
  identity `C_p→𝔽_p` is nonzero: it is the pushout extension class. Replacing the coherent action by
  the trivial action on a raw `H` cochain complex would incorrectly split this class.
- For `F=0` the bar roof is zero; for finite `G` and `H` it agrees with the finite-group bar comparison,
  and open-subgroup transfers satisfy the supplied restriction/corestriction identities.
- For `T=0` the compact complex and every derived-limit term vanish; for a finite `T` the quotient tower is
  eventually constant and returns its continuous complex.
- For the trivial `T=ℤ_p`, degree-zero cochains recover `ℤ_p`, not `ℚ_p` and not the discrete union of its
  finite quotients. Multiplication by `p` is retained before rationalization.
- For a torsion `T`, derived reduction retains Tor and is not identified with `T/ϖT` alone. For `Q=C₂` and
  `T=𝔽₂` trivial, the bar totalization has `H¹(Q,T)=𝔽₂`; ordinary averaging cannot replace it. For `Q=1`,
  compact finite descent is the identity roof.
- On `ℚ_p`, the ordered pair `χ_ur,κ(p)` has invariant `+1`; exchanging the classes negates it. The same
  normalization is retained under lattice change.
- For `T=O_E` and `f=ϖ`, both routes around the coefficient square multiply cochains by `ϖ`; the comparison
  before rationalization retains the reduction triangle.
- For two degree-one classes, θ preserves their evaluation cup and its sign under interchange; at `ℚ_p`
  it sends the ordered `χ_ur,κ(p)` invariant to `+1` in the arithmetic model.
- For an open subgroup, both routes around the corestriction square give the same transfer; for the identity
  subgroup inclusion the square reduces to θ itself.

### Examples

The non-surjective Frobenius on `𝔽_p[U]` separates linearization from an inverse operator. The disconnected
example separates a fixed scalar from a locally constant fixed section. Together they prevent two tempting
simplifications that would invalidate finite descent. Small upper triangular matrices give a direct bridge
from an Artin–Schreier equation to the group construction.

### Dependencies

Mathlib tensor and module categories, Witt vectors, and faithfully flat module descent through the stated
comonadic contract; the fixed-scalar and free-cover arguments precede the Witt constructions. The only
Lie-group construction used later is the explicit small p-adic matrix construction of §0.5.

## Layer 1: integral, relative and equivariant realization

Construct §§1.0–1.0c before the relative and equivariant variants. The field slope theory uses field
coefficients throughout; the later uniform finiteness argument does not assume such a filtration for affinoid
families.

### 1.0 Cyclotomic norm fields and field realization

For every finite `K/ℚ_p` construct `cyclotomicNormField K` from the norm-compatible local cyclotomic tower,
with its valuation, residue field, finite separable extensions and identification `G_(cyclotomicNormField K) ≃
H_K`. Construct its Cohen rings `A_K` and `A_K^†` and rational and Robba rings `B_K, B_K^†` and `R_K` inside
the universal tilde period rings; retain the weak integral topology, bounded annulus norms and LF topology.
The coefficient ring is the norm-field `F′_K`, not a chosen replacement by `K₀`. Compare the tilde
construction with the tilt of the completed cyclotomic field from PerfectoidSpaces §P1.31. For `K′/K` include
the finite étale maps, norm-field ramification rescaling, trace and `Γ` permutation of components. Sources:
KL-I Definitions 9.5.1–9.5.2, Remark 9.5.3 and Theorems 9.5.4–9.5.6, pp.200–202; CC-1998 §§II–III. API:
`cyclotomicNormField_galois`, `cyclotomicPeriodRing_inclusions`, annulus restriction, `Frobenius/Γ`
continuity, finite-extension trace and integral/rational comparison. These constructions precede the relative
completed tensors of §1.1. *Needs:* PadicPeriodRings §§1–4; PerfectoidSpaces tilting and almost purity;
LocalFieldsRamification Layers 0–3; §0.4.

Construct `fieldEtaleRealization` on finite `O_E-lattices` and finite-dimensional E-representations, with
`D(T)=(A⊗T)^{H_K}` and its rational counterpart, and the quasi-inverse `(A⊗_(A_K)D)^{φ=1}` on integral étale
objects. Prove exact tensor equivalence, unit/counit, duals, coefficient change, field restriction/induction
and reduction modulo `ϖ^n`. Construct `etalePhiModulesWithCoefficients` for finite coefficient algebras and
finite torsion modules over these Cohen rings by the norm-field Artin–Schreier–Witt comparison, with
reduction, coefficient change and the underlying module finiteness conditions preserved; the integral `Γ`
action is part of the equivalence. Prove rational overconvergence and representation-valued radius models,
including Frobenius generation at the changed radius and compatibility of finite diagrams after a common
shrink. The extra lattice intersection and general projective-family effectivity are §§1.2–1.3. Sources: KL-I
Theorems 9.5.4–9.5.6; CC-1998 Corollary III.5.2 and its integral comparisons; KPX Theorem 2.2.17. API:
`fieldEtaleRealization_exact`, `fieldEtaleRealization_tensor`, `fieldEtaleRealization_reduce`,
`fieldOverconvergence`, `fieldRadiusModel` and the comparison with finite coefficients.

**Checks.**

- The trivial lattice realizes as `A_K⊗O_E`, with its prescribed `φ` and `Γ` action; the inverse functor
  recovers that lattice with its full torsion `Γ` factor.
- For `K=ℚ_p` the cyclotomic parameter gives `φ(π)=(1+π)^p−1`; the norm-field residue is characteristic `p`,
  whereas `A_K` is characteristic zero. Confusing these rings fails reduction.
- For a ramified `K`, retaining `F′_K` and its Frobenius is necessary for the finite-extension trace and
  radius square. The unramified coordinate description alone is not the definition for all `K`.
- A finite torsion representation reduces the integral realization before inversion of `p`; its
  rationalization can vanish without the integral object vanishing.
- The non-surjective scalar Frobenius example in §0.1 still has invertible linearization; the field
  equivalence imposes étaleness, rather than an inverse semilinear operator on every Robba module.

### 1.0b Field slopes and pure local systems

For a perfect uniform adic Banach algebra `R` in characteristic p, construct `extendedRobbaAnnulus R s r` and
the bounded and full extended Robba rings from Witt expansions and their Gauss norms. For a multiplicative
seminorm α on R, the radius norm on a Teichmüller expansion is `λ_(α,r)(Σ_n p^n[x_n]) = max_n p^(−n)α(x_n)^r`,
on the convergent expansions in its prescribed annular domain; use the supremum over the bounded spectrum for
the Banach norm. Give the separated completions, endpoint annulus norms, restrictions, Frobenius maps and
finite-projective gluing. Sources: KL-I §§5.1–5.4 and §6.3, especially Definition 5.1.1 and the annular bundle
comparison. Export `RelativePhiModule` for finite-projective modules with invertible `φ^d`-linearization,
`d>0`, over these rings and their sheaves on perfectoid charts. Retain the common Frobenius radius domain,
rational-localization descent, pullback and the positive Witt subring; its untilt specialization is `A_inf`.
API: `extendedRobbaAnnulus_restrict`, `extendedRobbaAnnulus_frobenius`,
`extendedRobbaAnnulus_teichmuller`, `extendedRobbaBundle_glue`. The cyclotomic scalar specialization agrees
with §1.0.

**Checks.**

- On a nontrivially valued perfect analytic field, the Teichmüller vector `[x]` has norm `α(x)^r`; Witt
  Frobenius and the radius change give the same norm.
- Multiplication by p multiplies the norm by `p⁻¹`; replacing Witt expansions by ordinary characteristic-p
  series fails this value.
- At `s=r` the endpoint maximum is the single radius norm. Restriction from a genuine interval to either
  endpoint keeps the same Teichmüller section and coefficient maps.

On finite-projective field Robba `φ`-modules for the cyclotomic Frobenius and finite `E/ℚ_p`, define the
degree and `robbaPureSlope` using bounded lattices and the extended Robba comparison, with the KPX sign
convention. Prove a unique slope filtration by saturated `φ`-submodules with finite-projective quotients and
strictly ordered pure slopes; include scalar extension, tensor, dual, twist, descent of pure objects and
compatibility with the supplied perfect-field isocrystal classification. Degree is rank times slope; the zero
module has no slopes. In this convention `tR` has slope `−1` and the dual reverses slope. Sources: KL-I
Theorem 4.1.10 and Theorems 4.2.12–4.2.13, with §§8.5–8.6 for pure descent; Liu §1 and §4; KPX §4.3. The
statements are over field coefficients, with no assertion of a slope filtration over arbitrary `A`. API:
`robbaSlopeFiltration_unique`, `robbaPure_descent`, `robbaSlope_tensor`, `robbaSlope_dual`,
`robbaSlope_twist`, and `Γ` stability by uniqueness.

Write `ℤ_(p^d)=W(𝔽_(p^d))` and `ℚ_(p^d)=ℤ_(p^d)[1/p]`, with their arithmetic Frobenius. For a perfect uniform
adic Banach `R` over `𝔽_(p^d)`, d>0, define `isogenyLocalSystem R c d` as an object in the isogeny category of
finite locally free `ℤ_(p^d)`-local systems on the étale site of Spec `R`, equipped after rationalization with
a semilinear coefficient Frobenius `τ` satisfying `p^cτ^d=1`. Use an integral lattice up to isogeny and §0.4
to compare it with globally pure integral-up-to-isogeny `φ`-modules; on the associated perfectoid space
construct the sheaf comparison. Prove invariance under simultaneous multiplication `(c,d)↦(ec,ed)` for
positive `e`, with the corresponding coefficient descent, tensor/dual and restriction. The global-ring
comparison among the three period rings is §1.5. Sources: KL-I Definition 8.5.7 and Theorems 8.5.6–8.5.8,
pp.170–172. API: `isogenyLocalSystem_changePresentation`, `isogenyLocalSystem_tensor`,
`isogenyLocalSystem_sheafComparison`; a global pure model remains an explicit hypothesis in the global-ring
theorem. The rational sheaf version is `TwistedLocalSystem`: a finite-rank étale
`ℚ_(p^d)` local system with arithmetic-Frobenius-semilinear `τ` and `p^cτ^d=1`.
Export `TwistedLocalSystem.frobenius`, `TwistedLocalSystem.iterate`, `TwistedLocalSystem.pullback`
and `TwistedLocalSystem.reindex` by the same coefficient descent. Rational local systems need not have a
global integral lattice; comparison with `isogenyLocalSystem` requires an integral model up to isogeny.

**Checks.**

- The unit Robba module has slope zero, `tR` has slope `−1`, and its dual has slope `+1`. Rank-weighted degree
  is additive on their direct sum, even when that sum is not pure.
- Rank zero has the empty slope filtration. A direct sum of distinct slopes has two steps, so it cannot
  satisfy a single pure-slope predicate.
- The `Γ` action preserves the unique filtration; a filtration chosen by an arbitrary non-equivariant basis is
  not that filtration.
- For `(c,d)=(0,1)`, a constant `ℚ_p` local system gives the standard étale object, including a chosen lattice
  up to isogeny.
- The pair `(ec,ed)` gives the same rational slope and equivalent descent datum; forgetting the coefficient
  Frobenius would lose that equivalence.
- A merely pointwise pure period sheaf with no global pure lattice does not satisfy the global-ring hypothesis
  of §1.5.

### 1.0c Period sheaves, curve charts and B-pairs

Fix `d>0`, a perfect uniform adic Banach pair `(R,R⁺)` in characteristic p, and a perfectoid untilt
`(A,A⁺)` over `ℚ_p` with its identification `(A♭,A♭⁺)=(R,R⁺)`. Using §1.0b's period rings, construct the graded ring
`P_(R,d)=⊕_(n≥0){x∈R̃_R^+ : φ^d(x)=p^n x}`, the schematic curve `X_(R,d)=Proj(P_(R,d))` and its adic
realization `FF_(R,d)=U_R/φ^(dℤ)`, where `U_R` is the union of the annular adic charts. Construct
`periodModuleBundleComparison R d` between finite-projective extended Robba `φ^d`-modules and bundles on
these curves, with their restriction and Frobenius-gluing maps. Prove exact tensor equivalences,
including full faithfulness, effectivity and dual compatibility. The adic/schematic comparison is the
chartwise coherent-module correspondence. At `d=1` and a field base it agrees with the supplied curve.
For `e>0`, construct the finite étale degree-e map `X_(R,ed)→X_(R,d)` and its adic counterpart, induced by
quotienting by `φ^d`; pullback corresponds to iterating the module's Frobenius e times. Sources: KL-I
Definition 6.3.1, Theorems 6.3.12 and 8.7.7, Definition 8.7.11, manuscript pp.138,141–142,178–179.

The chosen untilt gives a Cartier divisor `Z_(R,d)` on `X_(R,d)` by its theta section. Construct the
patching rings `B_(e,R,d)=Γ(X_(R,d)∖Z_(R,d),O)`, `B_(dR,R,d)^+` from the completion along `Z_(R,d)`, and
`B_(dR,R,d)` from its punctured completion. On a chart with regular divisor equation u, the last ring is
`B_(dR,R,d)^+[1/u]`; give the localization and completion maps and independence of u. The complement and
completion are affine as in KL-I Lemma 8.9.3 and Definition 8.9.4, manuscript p.187. Define
`RelativeBPair R d A` as triples of finite-projective modules over these three rings, with an isomorphism
between the two scalar extensions to `B_(dR,R,d)`. Include morphisms, pullback and exact tensor and dual
operations. Prove `periodModuleBPairComparison R d A` is the exact tensor equivalence given by formal
patching on this same curve. Over a field the completed term is a full lattice. For a perfectoid chart over Spa `K`, sheafify these constructions
with their Frobenius descent. The objects here carry no Galois equivariance. The adapter
`RelativeBPair_classical` specializes to `d=1` and the ordinary `(B_e,B_dR^+,B_dR)` square; the equivariant
assertions are §1.6. For finite `E` include coefficient extension and field restriction/trace. Sources: KL-I
Theorem 8.9.6 and Definitions 9.3.9, 9.3.11, manuscript pp.188,197.

Construct `frobeniusPeriodSheafRoof R d A` identifying the `φ^d−1` cohomology of the period-module
realization with its native derived bundle cohomology and the difference-map complex of
`RelativeBPair R d A`. Use positive Koszul twists and annular acyclicity to compare the same local sections,
then formal patching and descent; give the induced maps on `H⁰,H¹`, tensor cups, restriction and trace.
Export this roof as `relativePeriodDerivedComparison R d A` on the same d-dependent objects, using pro-étale
hypercohomology after sheafification. The annular differential lands in the common domain `[s,r/p^d]` for
`0<s≤r/p^d`; KL-I Proposition 6.3.19 gives the radius quasi-isomorphisms. Positive-twist Koszul resolutions
and the patching maps of KL-I Proposition 1.3.6 give the augmentations, retaining projections and cups.
Sources: KL-I Theorems 8.7.13 and 8.9.6, with §9.4 for sheafification; FF §11.5; Liu §2. Its scalar period
topology and fundamental identity are those of PadicPeriodRings at `d=1`. API:
`periodModuleBundleComparison_localize`, `frobeniusPeriodSheafRoof_cup`, `frobeniusPeriodSheafRoof_trace`,
base change and chart restriction. *Needs:* §1.0, §1.0b, native bundles, AdicSpaces Layer 6 and the exact
geometric contracts above.

**Checks.**

- The unit `φ^d`-module gives the structure line on `X_(R,d)` and its unit patching triple; the roof sends
  its fixed section 1 to 1.
- For `R=ℂ_p^♭` and `d=2`, the tensor-unit endomorphisms and `H⁰(X_(R,2),O)` are both `ℚ_(p²)`. At `d=1`
  they are `ℚ_p`; an equivalence to that fixed curve at `d=2` would fail this test (KL-I Lemma 4.2.10).
- The finite étale map `X_(R,2)→X_(R,1)` has degree two; its pullback on unit sections is
  `ℚ_p→ℚ_(p²)` and its trace is the degree-two field trace.
- The trivial and Tate cyclotomic lines at `d=1` have the same underlying `φ(e)=e` module. Their Galois
  distinction requires §1.6; nonequivariant equivalence cannot recover a forgotten action.
- Rank zero gives zero bundles and patching terms. Direct sums and dual evaluation commute with each
  localization map.
- A non-full-rank completed submodule over a field is excluded by the lattice condition.
- Replacing u by a unit multiple leaves the completion/localization square and patching triple unchanged.
- An annular chart followed by Frobenius restriction gives the same bundle transition as restriction followed
  by Frobenius; unrelated categorical equivalences do not meet this test.

### 1.1 Components and affinoid annuli

Construct `cyclotomicComponents K` by retaining all factors of `K⊗_{ℚ_p}ℚ_p(μ_{p^∞})` and their compatible
norm-field coefficient rings. Write `Γ=Γ_{ℚ_p}` for the action on the all-component ring.
A chosen component has stabilizer `Γ_K`; restriction and `Ind_{Γ_K}^{Γ}` compare its `Γ_K`-module
with the all-component `Γ`-module through the coset permutation action. This does not identify a
product ring with one factor. The ordinary rings `R_K`, `R_{A,K}` and the Herr/Iwasawa constructions
use a chosen component and `Γ_K`. Source: KL-I Definitions 9.5.1–9.5.2 and Remark 9.5.3, pp.200–201. API: component idempotents, restriction and
induction adjunction, the `Γ` permutation formula, and compatibility with finite extension `K′/K`.

For an arbitrary affinoid `A`, construct `relativeAnnulus A K s r` and `relativeRobba A K` using completed
tensor products of the field annuli with `A`, restriction and their LF limit. Prove finite projectivity of the
annulus extension for a finite field extension `K′/K`, and the Frobenius basis theorem in the correct
direction: the target annulus ring is finite free over the image of the source under `φ`. For `K=ℚ_p` the
basis is `(1+π)^i, 0≤i<p`. At a finite extension `K′/K`, rescale radii by the norm-field ramification index
and record both the coefficient rank and the `Γ` coset index; their product is `[K′:K]`. Sources: KPX §2.2,
especially Notation 2.2.1 and Definition 2.2.2, pp.15–16; KL-I §9.5, pp.200–202. API: restriction, `φ/Γ`
action, completed coefficient change, finite-extension trace, coordinate extraction and uniqueness.

**Checks.**

- With `A=E`, the relative annulus is the coefficient-field annulus, with the same topology and Frobenius
  basis.
- At `p=3`, `K=ℚ₃(μ₃)`, the tensor product has two components. `Γ_K` fixes both, whereas
  `Γ=Γ_{ℚ₃}` exchanges them; induction from `Γ_K` to `Γ` recovers that permutation.
- In the `ℚ_p` coordinate, `ψ` will extract the coefficient of 1 from `Σ_{i=0}^{p−1}(1+π)^iφ(f_i)`; reversing
  the finite-free direction would not supply these coordinates.
- A ramified `K` must retain `F′_K` and the radius rescaling; replacing both by `K₀` and an unchanged radius
  does not satisfy the extension trace formula.

### 1.2 Relative categories and finite-radius models

Define `RelativePhiGammaModule A K` as a finite-projective `R_{A,K}`-module with invertible Frobenius
linearization and commuting continuous semilinear `Γ_K` action. Specify the topology through finite-projective
annulus models, not an arbitrary choice of a basis of the whole module. Morphisms commute with both actions;
tensor, dual, determinant and t-localization retain their native module constructions, with induced actions
and coefficient-change comparisons. Define `RadiusModel M r` already for a finite-projective `φ`-module
without `Γ_K`, and equivalence after common restriction; prove existence of a sufficiently small model,
extension uniqueness, and descent of any finite diagram of morphisms after a common shrink. For a continuous
`(φ,Γ_K)` module the compact `Γ_K` action descends to a common sufficiently small model, with the same commuting
actions. Finite projective models are not replaced by free models. Source: KPX §§2.2.6–2.2.9, pp.17–19. API:
`toRadius`, `baseChangeRadius`, `hom_descends`, `tensorRadius`, `dualRadius`, and the identity/composition
comparisons between models.

Construct `relativeDrig V` for a finite-projective A-module `V` with continuous `G_K` action, as an exact
fully faithful functor with tensor, dual, affinoid coefficient change and field extension comparisons. Prove
`relativeDrig_hom`: `G_K`-equivariant A-linear maps `V→W` correspond bijectively to `(φ,Γ_K)-maps` between
their realizations. Supply effectivity, not just a family of field-valued objects: on small affinoid charts
choose a stable integral model and small action matrices, use the Tate–Sen projections and successive matrix
corrections to descend a finite-projective annulus model, and descend the transition maps. Source: KPX Theorem
2.2.17, p.20, and its original input KL-families Theorem 3.11 and Definition 3.12, pp.955–956, with Definition
6.7, p.961. No assertion that every pointwise étale family arises from one global A-representation follows.
API: `relativeDrig_exact`, `relativeDrig_hom`, `relativeDrig_baseChange`, `relativeDrig_tensor`,
`relativeDrig_dual`, `relativeDrig_field`. For a finite local E-algebra `A`, export the specialization
`CoefficientRobbaModule`; its étale subcategory is equivalent to finite free continuous A-representations
by `CoefficientRobbaModule.etaleEquivalence`, obtained from field overconvergence and Artinian dévissage.
The inverse, unit/counit and coefficient maps retain nilpotents; this is the ordinary category without
inverting t. Its cohomology export `HerrCohomology` uses §§3.4–3.6 and §§4.4–4.5.

**Checks.**

- The trivial rank-d representation gives the standard relative module; rank zero remains rank zero under all
  restrictions.
- A morphism initially available at radius `r` must compose with a second one only after both have been
  restricted to a common allowed radius.
- For `A=E[ε]/ε²`, a representation with nonzero infinitesimal action must retain `ε` in its realization;
  reduction to closed points is not effectivity. Multiplication by `ε` on the trivial `A` representation
  remains a nonzero map after realization, testing faithfulness beyond residual fibers.
- A nonfree finite-projective coefficient module keeps its projective descent datum; a global basis is not
  part of the category definition.

### 1.3 Integral overconvergent and extended variants

Define `IntegralEtalePhiGammaModule` over `A_K` and `A_K^†` and `ExtendedEtalePhiGammaModule` over the
corresponding tilde rings by finite projectivity and an invertible integral linearization. On rational
extended rings require an integral étale model. Continuity and `Γ` stability of the model are extra data where
used; an arbitrary chosen `φ-lattice` need not be `Γ` stable. Construct the tensor, dual and
coefficient-change API and the `Γ` adapter for finite torsion Cohen-ring modules. On finite coefficient
modules it agrees with the torsion equivalence of §1.0, on lattices with reduction mod `p^n`, and after
inverting `p` with rational realization. Sources: KL-I Theorems 9.5.4 and 9.5.6, pp.201–202; the torsion input
specified in the supplier contracts.

For a `G_K`-stable finite `O_E` lattice `T`, construct `integralOverconvergent T` by
`D^†(T)=D(T)∩D^†(T[1/p])`, equivalently `(A^†⊗T)^{H_K}`, and prove `A_K⊗_{A_K^†}D^†(T) ≅` `D(T)`. Give finite
radius models, rationalization and reduction comparisons. The proof uses the bounded normalized traces `R_m`
and their complements: the estimates in CC-1998 §III.2 give a strictly contracting correction on a
sufficiently small annulus; §III.4 successively conjugates the Frobenius and small `Γ` matrices into the
overconvergent ring, with errors tending p-adically to zero; §III.5 identifies the resulting lattice with the
displayed intersection. Source: CC-1998 Propositions III.2.4, III.2.6–III.2.7 and Corollary III.2.8, pp.17–19,
Lemma III.4.4 and Corollary III.4.5, p.22, and Proposition III.5.1 and Corollary III.5.2, p.23. These lattice
assertions refine the rational overconvergence of §1.0. API: `integralOverconvergent_baseChange`,
`integralOverconvergent_intersection`, `integralOverconvergent_reduce`, `integralOverconvergent_rationalize`.

**Checks.**

- For the trivial `O_E` lattice, the construction returns the integral coefficient ring and base extension
  returns `A_K⊗O_E`.
- Reduction of an integral `ψ` or Frobenius matrix is performed before any division by `p`; a formula in a
  rational period ring does not define the reduction by itself.
- Replacing `T` by pT changes the embedded lattice by `p`, although its rational realization is unchanged.
- A `φ`-stable lattice in a rational module without `Γ` stability is not an object of the `Γ`-stable lattice
  category.

### 1.4 Extended descent and arbitrary-module decompletion

Prove equivalences between the integral overconvergent and completed extended étale categories, and between
the rational extended étale categories, with the `Γ` action retained. Source: KL-I Theorems 9.5.4(c,e),
9.5.6(e–g), pp.201–202. Construct descent by the bounded trace decomposition, full faithfulness through
invariance estimates, and essential surjectivity by successive near-identity matrix corrections. API:
`extendedEtaleEquivalence`, its unit/counit, tensor/dual, lattice and coefficient compatibility. This does not
assert an arbitrary `φ-only` decompletion equivalence.

For arbitrary, possibly non-étale finite-projective `(φ,Γ_K)`-modules, construct
`cyclotomicDecompletionEquivalence` between the ordinary and extended Robba categories. Use the cyclotomic
decompleting tower and its `Γ` estimates: first descend a small `Γ` action on a radius model; then use the
contracting complement to descend Frobenius and the gluing maps; uniqueness follows by applying the same
estimates to Hom. Source: KL-I Theorem 9.5.8, p.202, using §§8.6 and 9.5; FF Theorem 11.5.1, pp.383–384. The
small-group step is §0.5. API: extension/decompletion inverse comparisons, exactness, tensor, dual, `Γ`
restriction and finite-extension induction.

**Checks.**

- An étale object agrees with the integral/rational extended equivalences, so forgetting a lattice commutes
  with the comparison.
- A rank-one nonzero-slope module is included in the arbitrary-module comparison; restricting it to slope zero
  would miss this target.
- Removing `Γ` from the input does not supply the decompletion estimate and is outside the arbitrary-module
  theorem.
- Extension and decompletion of a morphism compose to the original morphism, rather than merely giving
  isomorphic objects without a unit/counit square.

### 1.5 Global pure modules

For a perfect uniform adic Banach algebra (R,R⁺) over `𝔽_{p^d}`, d>0, and `c∈ℤ`, prove
`globalPureEquivalence`: isogeny (c,d)-local systems over Spec `R` correspond to globally (c,d)-pure
`φ`-modules over `W(R)`[1/p], the bounded extended Robba ring and the extended Robba ring. Compare also Spec
`R₀` for a complete subring whose completed direct perfection is `R`, and the characteristic-zero untilt in
KL-I Theorems 8.5.6–8.5.8, pp.171–172. This is the global-ring assertion: a global pure model is part of the
hypothesis. The local-system notion and its sheaf comparison are constructed in §1.0b. Construct the
equivalence by an integral lattice up to isogeny and §0.4, then use full faithfulness of the three scalar
extensions. API: `globalPure_baseChange`, `globalPure_slopeZero`, `globalPure_changePresentation`, and
compatibility with the supplied sheaf functor.

**Checks.**

- For `c=0,d=1`, a constant `ℚ_p-local` system gives a globally étale module with its constant integral
  lattice.
- Replacing (c,d) by (ec,ed), e>0, gives the supplied equivalent local-system category and the same slope
  `c/d`.
- A pointwise pure sheaf without a global pure model is not silently placed in the global-ring category; local
  and global étaleness have different hypotheses.

### 1.6 Cyclotomic equivariant sheaves and operations

Construct `cyclotomicEquivariantPeriodEquivalence`: the ordinary `(φ,Γ_K)`-module is sent, through extended
Robba realization, to the `Γ_K`-equivariant bundle on the chosen cyclotomic component. Equivalently,
induce to the all-component `Γ=Γ_{ℚ_p}` object of §1.1, retaining its permutation action.
Completed Galois descent gives the `G_K`-equivariant curve object over `C_p` and the period-sheaf object
over Spa `K`. Define its Galois B-pair here: `W_e` has a continuous semilinear `G_K` action and
`W_dR^+` is a full `G_K`-stable lattice in its `B_dR` extension. Sources: KL-I Theorem 8.6.2, p.175,
Lemma 8.6.3, Theorem 8.6.4 and Remark 8.6.5, p.176, the curve comparison Theorem 8.7.7, p.178, and Theorem
9.5.8 with Remark 9.5.9, p.202; FF Theorem 11.5.1, pp.383–384. The additional content is equivariance and the
descent cocycle, over the supplied nonequivariant equivalences. Prove that the two routes to a B-pair agree by
their localization maps, not by choosing an unrelated categorical equivalence.

The API includes rank, tensor, dual, short exact sequence, finite coefficient change, restriction and finite
induction comparisons for this functor and the constructions of §§1.2–1.4. For `K′/K`, use single-component restriction/induction between `Γ_{K′}` and `Γ_K`;
its all-component adapter uses induction to `Γ_{ℚ_p}`. Coefficient trace and the corresponding coset
trace together give the full extension degree. *Needs:* the supplied nonequivariant roofs, §1.1 and §1.4.

**Checks.**

- The trivial rank-one object gives the trivial equivariant line and its standard descent cocycle, rather than
  an arbitrary character twist.
- A Tate twist has the same `χ^r` action on the curve route and the B-pair route. Its crystalline
  period is `t^(−r)e_r`; its de Rham lattice and Galois action retain `r`, although forgetting `Γ`
  gives the same `φ(e)=e` Robba line as the unit.
- For `K′/K`, restriction followed by trace on the unit object is multiplication by [`K′`:K]; ignoring one
  component index gives a wrong factor.
- A nontrivial equivariance character remains nontrivial after forgetting and then restoring the descent
  cocycle.

### Examples

The integral intersection for `T` and pT demonstrates why a lattice cannot be recovered merely by naming the
rational object. A rank-one module of nonzero slope demonstrates why arbitrary-module decompletion needs `Γ`
estimates beyond étale descent. A first-order affinoid coefficient example demonstrates why closed-point
realization is insufficient.

### Dependencies

Layer 0; period, torsion and pure-local-system contracts; affinoid completed tensors. The equivariant
comparison uses the supplied nonequivariant roofs only after the arbitrary-module decompletion is constructed.

## Layer 2: ψ on modules and its one-variable complex

### 2.1 Balanced tensor contraction

Let `R→S` be a homomorphism of commutative rings and let `r:S→ₗ[R]R` be a specified linear map. For any
R-module `M` define `psiTensor r : S⊗_R M→ₗ[R]M` by `s⊗m↦r(s)m`. Balancedness uses both scalar actions, and
the construction is `TensorProduct.lift`, not a new tensor carrier. Prove the pure-tensor formula, uniqueness
by `TensorProduct.ext'`, functoriality in `M` and compatibility with scalar change when `r` changes
compatibly. This is the elementary construction used in KPX §2.2, p.18, and in the period trace formula; it is
also a separate algebraic target valid without any period ring. These definitions and their milestone
statements appear in `Suggested.lean`.

**Checks.**

- For `R=S=ℚ` and `r=id, 2⊗3` maps to 6; a map that forgets the first tensor factor fails.
- For `r=0` every tensor maps to zero, including `1⊗m`; no normalization `r(1)=1` is assumed here.
- For `S=ℚ×ℚ` with diagonal `R` action and `r` the first projection, `(0,1)⊗7` maps to zero and `(1,0)⊗7` maps
  to 7.

### 2.2 Module ψ from a linearization

Given an S-module `N` and an S-linear isomorphism `L:S⊗_R M≅N`, define `psiOfLinearization r L = psiTensor r ∘
L⁻¹`, as an R-linear map `N→M`. Its characterization is `ψ(L(s⊗m))=r(s)m`; this characterization uniquely
determines `ψ`. For a Frobenius linearization write `φ_M(m)=L(1⊗m)`. If `r(1)=1`, prove `ψφ_M=id`. For a
compatible morphism `h`, prove `hψ=ψh`; prove `ψ(a·n)=a·ψ(n)` for a in the source scalar ring, and
`ψ(φ(a)n)=aψ(n)` in the usual period notation. There is no S-linearity assertion for arbitrary `s∈S`. Source:
KPX §2.2, pp.17–18, and KL-I §9.5, pp.200–202. API: `psiOfLinearization_spec`, `psiOfLinearization_unique`,
`psiOfLinearization_leftInverse`, `psiOfLinearization_natural`, `psiOfLinearization_semilinear`.

For a finite index set, fixed `b_i∈S` and continuous coordinate functions `c_i:N→M` with `x=Σ_iL(b_i⊗c_i(x))`,
prove `ψ(x)=Σ_ir(b_i)c_i(x)`. Hence `ψ` is continuous when `M` is a topological additive group and its fixed
R-scalar multiplications are continuous. This is exactly the conditional statement
`psiOfLinearization_continuous` in the suggested file; it does not assume any period-ring estimate. In the
arithmetic application the finite Frobenius basis and its continuous projections supply these coordinates;
§2.5 proves their estimates.

**Checks.**

- Over `ℚ` with `L` multiplication by 2 and `r=id, ψ(6)=3` and `ψφ=id`. Taking `ψ=id` would violate the
  characterization.
- With `r(1)=0, ψφ=0` on a nonzero `M`, so the normalization is necessary for the left-inverse conclusion.
- Reducing an already constructed integral standard module mod 5 gives `ψ(1)=1`, even though `pψ=Tr` reduces
  to `0=0` and cannot recover `ψ`.
- The product-ring projection example of §2.1 still distinguishes the scalar action used in `L` from a
  diagonal action on its output.

### 2.3 Rank-one formula and basis change

For a commutative period ring with scalar `ψ` satisfying `ψ(φ(b)f)=bψ(f)`, and a rank-one module `φ(e)=ae`
with a a unit, define `rankOnePsi ψ a` by `ψ(fe)=ψ(a⁻¹f)e`. Under `e′=be` for `b` a unit, the new coefficient
is `a′=φ(b)ab⁻¹` and `f′=b⁻¹f`; prove `ψ(a′⁻¹f′)=b⁻¹ψ(a⁻¹f)`. The projection formula is an explicit hypothesis
in the algebraic statement. Source: the module construction in KPX §2.2, p.18. API: `rankOnePsi_apply`,
`rankOnePsi_leftInverse` under the scalar left-inverse hypothesis, `rankOnePsi_changeBasis` (the
`rankOnePsi_basisChange` formula), direct sums and scalar extension. The suggested file records the additive
map and basis-change theorem.

**Checks.**

- Over `ℚ, φ=ψ=id, a=2` gives `ψ(6e)=3e`; `a=−1` gives `ψ(7e)=−7e`.
- For zero `f`, the answer is zero for every a; `a=0` is excluded because the linearization would not be
  invertible.
- On `ℚ×ℚ` with `φ=ψ` the coordinate swap and `a=(2,3), ψ(a⁻¹)=(1/3,1/2)`. Replacing the answer by `a⁻¹ψ(1)`
  gives (1/2,1/3), so `a⁻¹` cannot be moved outside `ψ`.

### 2.4 The ψ-zero projector and fixed spaces

For additive operators `φ,ψ` on `M` with `ψφ=id`, define `psiProjection = 1−φψ`. Prove `P²=P, ψP=0` and
`P|kerψ=id`, giving the canonical decomposition `M=φ(M)⊕kerψ`. Define `psiFixed = ker(ψ−1)` and the common
fixed submodule. The map `oneSubPhiOnPsiOne` sends `x` to `(1−φ)x` in `kerψ` for `x∈psiFixed`; its kernel is
the common `φ=ψ=1` submodule. Its surjectivity is not an algebraic consequence of `ψφ=id`. Source: KPX §2.2
and §4.2, pp.18,36–39. API: `psiProjection_idempotent`, `psiProjection_range`, `psiProjection_uniqueSplit`,
`oneSubPhiOnPsiOne_kernel`. The suggested file defines the bundled linear map and gives its evaluation and
zero criterion in `oneSubPhiOnPsiOne_spec`.
The light `psiCokernel ψ` is the native quotient `M/range(ψ−id)` used by §2.6; it is defined without assuming
ψφ=id.

**Checks.**

- If `φψ=id` as well, then `P=0` and `kerψ=0`.
- On `ℚ[U]`, let `φ(U)=U³` and let `ψ` select coefficients whose exponent is divisible by 3, dividing their
  exponent by 3. The light coefficient map is `polynomialPsi`. Then `P(U)=U` and `P(U³)=0`.
- In that polynomial example, `ψ`-fixed elements are constants, so `(1−φ)psiFixed=0` while `U∈kerψ`. This
  disproves unconditional surjectivity.
- With `φ=ψ=id, psiFixed=M` and the common fixed kernel is all of `M`, rather than zero; the bundled
  `oneSubPhiOnPsiOne` is the zero map.
- With the same `polynomialPsi` but the linear operator `φ(f)=f(U³)+f(0)U`, one still has `ψφ=id` and
  `ψ(1)=1`, while the bundled map sends 1 to `−U≠0` in `kerψ`.

### 2.5 Period coordinates, integrality and continuity

Construct `periodPsi` on `A_K, A_K^†, B_K, R_K` and the relative annuli by the zeroth coordinate of the
finite-free Frobenius expansion. On the positive `ℚ_p` ring it agrees with the supplied Coleman operator. On
rational rings prove `ψ=p⁻¹φ⁻¹Tr_{R/φ(R)}`; on integral rings first construct the coordinate map, prove
`Tr=pφψ`, and only then reduce modulo `p^n`. Trace divisibility alone in characteristic `p` does not specify
`ψ`. Sources: CC-1998 §III.2, pp.16–19; KPX §2.2, pp.16–18; ColemanPowerSeries §§1.45–1.49, especially
`phiBasis_repr_zero_eq_psi`. *Needs:* ColemanPowerSeries §§1.45–1.49, with its integral trace from
IntegralIwasawaTheory §7.1; §1.1 and §2.2.

Prove continuity in the actual integral weak topology and each admissible annulus topology. In the standard
basis extract each coordinate as a trace against a dual basis; the annular trace bounds give constants
`C_{s,r}` with `‖ψ(f)‖_{[s,r]}≤C_{s,r}‖f‖_{[s/p,r/p]}` on the compatible source/target models. Obtain the weak
integral statements from the finite-free coordinate homeomorphism on the fixed `H_K` ring, and finite étale
field change from the trace square. Do not extend the normalized `R_m` maps of CC to arbitrary universal tilde
rings with the weak topology: CC-1998 Remark III.2.5, p.18, explicitly distinguishes those topologies. API:
`periodPsi_coordinates`, `periodPsi_trace`, `periodPsi_integral`, `periodPsi_continuous`,
`periodPsi_annulusBound`, `periodPsi_fieldTrace`, `periodPsi_coefficients`.

Apply §2.2 to obtain `periodModulePsi` for finite-projective radius models. Prove independence of a projective
presentation and of the radius, continuity, `Γ` commutation, naturality, integral-lattice compatibility and
affinoid base change. `Γ`-stable étale lattices inherit `ψ`. A Wach height condition alone is not used to
assert `ψ` stability of an arbitrary positive lattice.

**Checks.**

- In `Σ_{i=0}^{p−1}(1+π)^iφ(f_i), ψ` returns f₀; in particular `ψ(1)=1` and `ψ((1+π)^i)=0` for 0<i<p.
- At `p=2`, the two coordinates remain integral and `ψ(1)=1` mod 2; division by 2 in the residue ring is not
  part of the construction.
- On a rank-one module the period definition gives exactly `ψ(a⁻¹f)`, including nonconstant a.
- For finite `K′/K`, coefficient trace commutes with `ψ` after the radius rescaling; omitting the field-change
  coordinate map breaks this square.

### 2.6 The native ψ complex

Define `psiComplex M` on `CochainComplex (ModuleCat C) ℤ`, over any scalar ring `C` on which `ψ` is linear,
with `M` in degrees 1,2 and differential `ψ−1`, and zero terms elsewhere. Its light constructors
`psiComplex.term` and `psiComplex.differential` specify these objects and the sole differential.
Define `psiComplex.map h` for a
linear `h` commuting with `ψ`, with `h` in both degrees. Use the native short-complex cycles and homology
comparisons to identify
`H¹(CψM)=ker(ψ−1), H²(CψM)=coker(ψ−1)`, and all other `H^i=0`. The `H¹` map sends a cycle to its actual
element of `M`; the `H²` map is the actual quotient. API: `psiComplex_map_id`, `psiComplex_map_comp`,
`psiComplex_h1`, `psiComplex_h2`, `psiComplex_homology_isZero` outside degrees 1,2, and naturality of
their inclusions and projections. Source: KPX Definition 4.2.2, pp.36–37, with this explicit cohomological degree convention.

**Checks.**

- For `ψ=id` on a nonzero `M, H¹=M` and `H²=M`, while `H⁰=0`; a degree-0,1 complex has the wrong shift.
- For `ψ=0`, the differential is `−id`, so both cohomology groups vanish.
- If `h` is multiplication by 2 and `k` by 3, the induced map in each degree and each homology group is
  multiplication by 6 for k∘h.

### Examples

The coefficient-extraction polynomial example proves both the projector formula and the failure of
unconditional generation by `ψ`-fixed vectors. The mod-p example explains why integral `ψ` must precede the
trace quotient. The identity-operator `ψ` complex fixes the shift used by every Iwasawa comparison below.

### Dependencies

Layer 1 supplies the actual annuli, Frobenius linearizations and their coordinate topologies. The abstract
tensor construction uses only the native library. Coleman and measure `ψ` are inputs only through the exact
supplier contracts.

## Layer 3: signed Herr comparison and arithmetic descent

### 3.1 Native Herr complexes and functoriality

Let `M` be a C-module and `φ,ψ,γ` commuting C-linear operators, except that no `φψ=ψφ` condition is imposed:
require `ψφ=id` and that `γ` commutes with each. Define `herrComplex φ γ` and `herrComplex ψ γ` by the
displayed signed differentials. Frobenius and `Γ` semilinearity are handled by restricting to their common
fixed coefficient ring `C`. The light component maps are `herrD0` and `herrD1` in `Suggested.lean`, with their
milestone `herrDifferentials_sq`. Construct the complexes using `ModuleCat.ofHom` and `CochainComplex.of`;
`d¹d⁰=0` uses exactly `γφ=φγ` or `γψ=ψγ`. For an intertwining `h`, `herrComplex.map h` has components
`h,h⊕h,h`. API: differential formulas, zero-composition, identity, composition, additive naturality and
coefficient restriction. Sources: KPX Definition 2.3.3, p.21; BHS §3.3, pp.342–344, with the degree-two sign
adapter below.

**Checks.**

- On `ℚ` with `φ=2` and `γ=3, d⁰(7)=(7,14)` and `d¹(5,11)=−1`.
- Replacing the minus sign in `d¹` by plus makes `d¹d⁰(1)=4` in this example, so commutation alone would not
  prove it a complex.
- With `φ=γ=id`, both differentials vanish, giving `H⁰=M, H¹=M²` and `H²=M`.
- Intertwiners 2 and 3 compose to 6 in every term; a map only on the diagonal degree-one summand is wrong.

### 3.2 The signed comparison and its kernel

Construct `phiPsiHerrMap F : Cφ,γ(M)→Cψ,γ(M)` with components

```text
F⁰=id,  F¹(a,b)=(−ψa,b),  F²(c)=−ψc.
```

The light degree-one component is `phiPsiOne`; `phiPsiComparison_squares` states both chain squares. Prove
both chain squares from `ψ(φ−1)=1−ψ`. Each degree map is surjective, with a graded section id, `diag(−φ,id),
−φ`. The graded section is not asserted to be a chain map. Construct the kernel complex: degree zero is zero,
degree one is `kerψ` in the first summand, degree two is `kerψ`, and its differential is `γ−1`. Thus it is
acyclic exactly when `γ−1` is bijective on `kerψ`. Sources: KPX Proposition 2.3.6, p.22, and the `ψ`
comparison used in §4.2. API: `phiPsiHerrMap_comm`, `phiPsiHerrMap_surjective`, `phiPsiHerrKernelIso`,
`phiPsiHerrKernel_acyclic` under the stated inverse hypothesis.

**Checks.**

- With `φ=ψ=id, F¹(a,b)=(−a,b)` and `F²=−id`. The comparison is not the identity in degree one.
- In the polynomial example `φ(U)=U³, ψ(U³)=U`, one has `F²(U³)=−U` and `F²(U)=0`.
- If `γ=id` and `kerψ≠0`, the kernel differential is zero and the comparison is not a quasi-isomorphism.
  Surjectivity alone cannot prove the Herr theorem.

### 3.3 Resolvent, corrected section and homotopy

Assume `B=(γ−1)|kerψ` is an isomorphism. Define `psiZeroResolvent q = inclusion ∘ B⁻¹ ∘ P`, with `P=1−φψ`.
Prove `Bq=qB=P` as ambient maps, `qφ=0` and `ψq=0`. Define the corrected chain section

```text
S⁰=id,  S¹(a,b)=(−φa−qb,b),  S²(c)=−φc.
```

Prove `FS=id`. Define `H²(c)=(qc,0), H¹=0` and all other components zero. Then `id−SF=dH+Hd` on `Cφ,γ`.
Package these maps and this equation as native `Homotopy` and `HomotopyEquiv`, obtaining
`phiPsiHerrHomotopyEquiv` and its canonical native homology isomorphisms. Source: the kernel proof of KPX
Proposition 2.3.6, p.22, expanded to an explicit contracting homotopy. The formula is an algebraic consequence
of the inverse on `kerψ`, not an independent period-theoretic assertion. API: `psiZeroResolvent_identities`,
`herrCorrectedSection_comm`, `herrCorrectedSection_rightInverse`, `herrComparison_homotopy`. The milestone
`herrComparisonHomotopy` states the two nonzero component identities in the suggested file.

The light degree-one formula is `herrSectionOne`. Its milestone `herrComparisonSection` states both chain
squares and the right-inverse equation under exactly the four resolvent identities and commuting-action
hypotheses displayed in `Suggested.lean`.

**Checks.**

- If `ψφ=φψ=id`, then `P=q=0` and `S¹=diag(−φ,id)`, the elementary inverse of `F`.
- In the polynomial example take `γ=2id`, so `B=id` and `q=P`. Then `S¹(0,U)=(−U,U), S²(U)=−U³, H²(U)=(U,0)`,
  while `H²(U³)=0`.
- For that example the uncorrected section sends (0,U) to (0,U); its chain-square error is `P(U)=U`. The `−q`
  term cancels exactly that error.
- For `γ=id` on a nonzero `kerψ` there is no `q` with `Bq=P`; this excluded case cannot be hidden in an
  abstract choice of inverse.

### 3.4 Generator change and finite torsion conventions

For a commuting operator `G` and integer `n≥0`, define `herrGeneratorSum G n = Σ_{i=0}^{n−1}G^i`. The chain
map from `γ` to `γ^n` has components id, `diag(id,Q_n), Q_n`, since `γ^n−1=(γ−1)Q_n`. This is a chain map for
every `n`, not an isomorphism for every `n`. On a principal `ℤ_p` subgroup, for generators related by
`u∈ℤ_p^×` construct `herrGeneratorEquiv` using the continuous completed-group-algebra unit `(γ^u−1)/(γ−1)`,
and prove cocycle and inverse formulas. For the full procyclic `Γ_K/Δ_K` with prime-to-p torsion of order `m`,
a generator exponent lies in `(lim_n ℤ/(mp^n)ℤ)^×`, with both its finite and `ℤ_p` components specified.
Define the ratio on the trivial torsion component by the `ℤ_p` power series and on the other components by the
invertible `γ−1` operator; descend the component calculation after a splitting coefficient extension. A bare
`ℤ_p` exponent does not specify the finite component. Source: KPX §2.3, pp.20–22; the group-algebra and Mellin
supplier contracts. API: finite sum identity, generator composition, intertwiner naturality and homology
compatibility with the field comparison of §3.4a.

Also construct `herrGammaAction_homotopy`: the diagonal action of `γ^n` on the Herr complex is homotopic to
the identity, with `H¹(a,b)=Q_n b` and `H²(c)=(Q_n` c,0). Direct substitution gives `γ^n−1=dH+Hd` in all three
degrees. Extend this formula to continuous powers on a principal subgroup using the completed geometric-sum
operator. The `n=0` homotopy is zero and `n=1` uses `H¹(a,b)=b, H²(c)=(c,0)`. These homotopies identify lift
changes in derived finite-quotient descent; their coherent composition is obtained from the canonical
bar-resolution action, not by assuming arbitrary chosen homotopies compose strictly.

Construct `arithmeticHerrComplex` on `M^{Δ_K}` with the p-primary convention. On rational coefficients
averaging over `Δ_K` is exact, even at `p=2`. Compare with the all-finite-torsion convention by decomposing
prime-to-p torsion characters; nontrivial torsion-character summands have an invertible `γ−1` and are
contractible. Integrally require the group order to be invertible whenever averaging is used. Source: KPX
Definition 2.3.3 and Remark 2.3.4, pp.20–21.

**Checks.**

- `Q₀=0` and `Q₁=id`. For `G=2id` over `ℚ, Q₃=7id`; these computed values fix the summation bounds.
- For `G=id` over `𝔽₃, Q₃=0`, so `γ↦γ³` is not an isomorphism without the generator/unit hypothesis.
- At `p=2` the full unit group is `{±1}×(1+4ℤ₂)`; 5 generates the principal factor, not the full group. At odd
  `p` a `ℤ_p-unit` power on the principal factor alone does not specify the exponent modulo `p−1` on the
  finite factor.
- Over `ℚ₂, (1+s)/2` is the projector for `s²=1`. Over `ℤ₂` that formula is undefined; §3.7 supplies derived
  descent instead.

### 3.4a Field Herr comparison, Euler characteristic and duality

Here `E/ℚ_p` and `K/ℚ_p` are finite, and all Robba coefficients are field-valued. The constructions below
use §1.0b's field slope filtration and localization, without relative finiteness or the later ψ-finiteness
argument of §4.3.

**Étale field comparison.** For every finite-dimensional continuous E-representation V of G_K, construct
`fieldHerrGaloisComparison V` between continuous `RΓ(K,V)` of §0.6 and the arithmetic signed Herr complex of
its realization from §1.0. Use the norm-field Frobenius exact sequence and the Γ resolution; compare the
cocycle, transfer and tensor maps. Transfer finiteness, the Euler formula and local duality from §0.6 to
étale modules. The cohomological cup is the signed tensor cup, with degree-one formula
`x₂⊗γ(y₁)−x₁⊗φ(y₂)`, and its invariant is the normalized Galois invariant. Sources: Liu §2, especially
Theorem 2.6 and Corollary 2.9; KPX Proposition 2.3.7 and Definition 2.3.10, pp.22–23. API:
`fieldHerrGaloisComparison_cup`, restriction/trace and coefficient-field extension.

**Checks.**

- The trivial field line has `h⁰=1`, `h²=0` and `h¹=[K:ℚ_p]+1`.
- The Tate line has `h⁰=0`, `h²=1` and the same Euler characteristic as the trivial line.
- With trivial scalar operators, `(1,0)∪(0,1)=−1` and `(0,1)∪(1,0)=1`, fixing the degree-two sign.

**Torsion Herr calculation.** Define generalized field `(φ,Γ_K)`-modules as finitely presented Robba
modules with commuting continuous actions and invertible Frobenius linearization. For a Robba-torsion object
S, construct `fieldTorsionHerrCohomology`: `φ−1` is surjective, `H²(S)=0`, and
`dim_E H⁰(S)=dim_E H¹(S)<∞`, hence `χ(S)=0`. Reduce by Shapiro to `K=ℚ_p`, filter S by pure t-power-torsion
objects, and use the cyclotomic product localizations modulo `t^k`. Frobenius shifts the product factors;
the finite-level Γ calculation bounds the invariants and coinvariants. Sources: Liu §3, especially
Proposition 3.1, Theorem 3.3, Theorem 3.7 and Corollary 3.8, manuscript pp.17–22.

**Checks.**

- For `S=0` all groups vanish and the Euler characteristic is zero.
- For `K=ℚ_p` and `S=R_E/tR_E`, one has `h⁰=h¹=1` and `h²=0`; zero Euler characteristic does not imply
  acyclicity.
- For a t-power-torsion quotient, the φ shift on its cyclotomic product factors is retained; replacing it
  by the identity loses the surjectivity of `φ−1`.

**t-twist finiteness and Euler invariance.** For a finite-projective field module D and every integer n,
prove `fieldHerrTTwist`: `H^i(t^nD)` is finite-dimensional if and only if `H^i(D)` is, for each `i=0,1,2`;
when these groups are finite, `χ(t^nD)=χ(D)`. Use the long exact sequence of `tD→D→D/tD` and the preceding
torsion calculation, then iterate in both directions. This asserts finiteness and Euler invariance, not
isomorphisms on individual groups. Source: Liu Lemma 4.1, manuscript p.22.

**Checks.**

- The case `n=0` is the identity comparison.
- Over `ℚ_p`, `R_E` has a fixed constant whereas `tR_E` has `H⁰=0`; t-twist invariance cannot mean equal
  cohomology dimensions in each degree.
- The torsion quotient in `0→tD→D→D/tD→0` contributes Euler characteristic zero even when its `H⁰,H¹`
  are nonzero, so the Euler equality still holds.

**Auxiliary pure extension.** For every integer `d≥1`, construct `fieldAuxiliaryPureExtension d`, a
rank-d pure field module of slope `−1/d` in the standing KPX convention, with a filtration whose first
nonzero term is `tR` and whose remaining successive factors are unit lines. Induct by a nonsplit extension
of the unit line by the rank-`d−1` object. Its nonzero `H¹` follows solely from the étale unit Euler formula,
t-twist invariance and extension additivity. A destabilizing subobject would inject into the unit quotient
and force the extension to split, proving purity. The same construction works over `R_{E,K}` for the
stated finite E and K. Source: Liu Lemma 4.2, manuscript p.22; his slope `+1/d` has the opposite sign. No general field finiteness theorem or ψ-cokernel theorem is used in this construction.

**Checks.**

- At `d=1` the object is `tR`, of slope `−1`.
- At `d=2`, the split object `tR⊕R` has two slopes and fails the pure slope `−1/2` conclusion; the extension
  class must be nonzero.
- The object has determinant degree `−1` and rank d, so its slope is `−1/d`; dualizing the construction would give
  the wrong sign for §4.3.

**General field finiteness and Euler characteristic.** For every generalized field module D, prove
`fieldHerrEulerCharacteristic`: its Herr groups are finite-dimensional, vanish outside degrees 0,1,2,
and satisfy `χ(D)=−[K:ℚ_p]rank(D)`, where rank ignores the torsion part. Use the torsion calculation,
Shapiro and the slope filtration. For a pure module, tensor products, duals and t-twists of the auxiliary
objects give a pure F of opposite slope with a filtration by integer t-twists of unit lines. Then `D⊗F`
is étale and is filtered by t-twists of D. The independent localization bound on `H⁰` and the long exact
sequences first give finiteness of `H¹`, then `H²`; t-twist invariance and Euler additivity give
`χ(D⊗F)=rank(F)χ(D)`. The étale formula therefore gives the general formula. Sources: Liu Theorem 4.3
and its proof, manuscript pp.22–23; KPX Theorem 2.3.11, p.24.

**Checks.**

- Rank zero gives zero Euler characteristic, including nonzero Robba-torsion objects.
- For a non-étale pure rank-d object of degree `−1`, the Euler characteristic is still `−d[K:ℚ_p]`;
  reduction only to pure modules would not establish it.
- For an extension of two different slopes, the Euler characteristics add with their ranks; no pure-slope
  hypothesis is imposed on the result.

**General field Tate duality.** For every finite-projective field module D, prove `fieldHerrTateDuality`:
the normalized signed cup `H^i(D)×H^(2−i)(D^∨(1))→E` is perfect. First prove the two-out-of-three result
for a short exact sequence from the paired long exact sequences. For `K=ℚ_p`, obtain the seed for `R(|x|)`
and `tR` from a nonsplit étale extension `0→tR→U→R(|x|)→0`, using the general Euler formula and étale
duality. For a pure D use the degree `ν(D)=−deg(D)` in Liu's convention; duality permits `ν(D)≥0`.
At degree zero use étale duality. At positive degree s the Euler formula produces a nonsplit extension
`0→D→U→R(|x|)→0`. The slope argument gives pure factors of U with nonnegative ν-degree strictly below s,
whose total ν-degree is `s−1`; induction and the seed give duality for D. Shapiro and extension stability
then handle arbitrary K and slope filtrations. Sources: Liu Lemmas 4.4–4.5 and Theorem 4.7, manuscript
pp.24–25; KPX Theorem 2.3.11, p.24. Retain naturality, restriction/trace and coefficient-field extension.
Integral/affinoid extensions are §3.6 and the residue normalization is §3.8. Section 4.3 uses the already
constructed `fieldAuxiliaryPureExtension`, rather than supplying an input to this field proof.

**Checks.**

- A nonzero-slope rank-one D is covered even though it need not come from a Galois representation.
- The degree-zero induction case is precisely the étale theorem; a slope filtration alone leaves the
  positive ν-degree cases unresolved.
- The `d=2` auxiliary pure extension has `ν=1`; the lowering extension has total `ν=0` and is étale,
  whereas the split `tR⊕R` cannot replace that pure auxiliary object.

### 3.5 Invertibility on ψ-zero and field character calculations

For a finite-projective relative Robba `(φ,Γ_K)`-module `M` over an arbitrary affinoid `A`, prove that `γ_K−1`
is invertible on `(M^{Δ_K})^{ψ=0}`. More precisely, on sufficiently small compatible annuli it has a
continuous inverse satisfying annulus bounds, compatible with restriction, coefficient change and finite
extension. The proof chooses a small `Γ` subgroup, controls `(γ−1)` on finite Frobenius coordinates and
obtains an inverse by a convergent geometric series on the complement; finite generation over the analytic `Γ`
annulus gives the full generator statement. Source: KPX Theorem 3.1.1 and its proof, pp.25–28. This is a
rational Robba statement, not an integral assertion on every lattice. Construct the finite-projective
analytic `Γ`-annulus action on the `ψ`-zero radius models in this proof, using the ring carriers and
scalar-change maps of §§4.0–4.1; it precedes the coadmissible-system theorem. API: `gammaSubOnePsiZeroEquiv`, its
inverse bound, naturality and the resulting arithmetic `phiPsiHerrHomotopyEquiv`.

For use in the later finiteness induction, construct the `ℚ_p` character line `qpadicCharacterModule δ` for
continuous `δ:ℚ_p^×→E^×` with `φ(e)=δ(p)e` and `γ(e)=δ(χ(γ))e`. Prove its tensor/dual laws and the field
calculations: `H⁰` is one-dimensional exactly for `δ=x^k` with `k≤0`; `H²` is one-dimensional exactly for
`δ=|x|x^k` with `k≥1`; otherwise each is zero; dim `H¹=1+h⁰+h²`. Source: KPX Proposition 6.2.8 and Theorem
2.3.11, pp.24,58–59. A proof uses the field Herr theorem of §3.4a and the elementary slope/monomial
calculation; it does not use relative finiteness. This limited field calculation precedes the relative proof
deliberately. Also prove the field-valued rank-one classification over `ℚ_p` here: after a finite coefficient
extension if needed, twist the slope by an unramified character to obtain an étale line, use the field
representation equivalence and local class field theory, then undo the twist. Uniqueness descends the
character and its rank-one realization to `E`; the classification is over the original coefficient field. This
yields `qpadicRankOneClassification`. For a nonzero equivariant map from a character line into a
finite-projective field Robba module, construct `rankOneSaturation`: its saturation is finite projective of
rank one and has finite-projective quotient. On a radius annulus use the Bézout elementary-divisor calculation
on the coordinate tuple, remove its common factor and propagate this construction across smaller radii by
Frobenius; `Γ` stability follows from uniqueness of saturation. The invertible linearization then restricts to
the saturated line and quotient. This supplies the saturated rank-one identification needed in §5.6 without
using family classification. Source: the field case in the proof of KPX Lemma 6.2.13, p.61.

**Checks.**

- For `δ=1, h⁰=1,h²=0,h¹=2`.
- For `δ=x|x|, φ(e)=e, γ(e)=χ(γ)e`, and `h⁰=0,h²=1,h¹=2`. For `δ=x, φ(e)=pe`, so this is a different character
  line.
- A nonexceptional unramified character with `δ(p)` outside the exceptional values has `h⁰=h²=0` and `h¹=1`.
- The zero module has a unique inverse on its zero `ψ` kernel. A general abstract module with `γ=id` and
  nonzero `kerψ` fails the arithmetic inverse theorem's period hypotheses.

### 3.6 Integral and affinoid Galois comparison

Construct `integralHerrComparison T` for a finite p-primary `G_K` module or a finite `O_E` lattice, and
`affinoidHerrComparison V` for a finite-projective `A` representation. These are natural roofs from native
continuous derived Galois cochains to the arithmetic Herr complexes of the realizations, extending the field
roof of §3.4a and compatible with restriction, transfer and coefficient pairing. For finite coefficients use
the Artin–Schreier–Witt exact sequence on the norm-field separable closure and `cd_p(H_K)=1`, then the `Γ`
resolution. For lattices pass through the mod `p^n` system: finite-level compactness and the surjective
coefficient systems control the derived limit and its possible `R¹lim` term. For rational Banach coefficients
use the Tate–Sen normalized trace decomposition, its strict continuous contracting complement and the
small-action matrix descent of §1.2; verify completed tensor exactness before extending from a finite
coefficient field to `A`. Sources: CC-1998 §III.5, pp.23–24; Pottharst Theorem 2.8 and Lemma 2.9,
pp.1598–1599; KPX Proposition 2.3.7, p.22.

State `periodResolution_acyclic` through two precise quasi-isomorphisms. If `B̃_r` denotes the universal
extended overconvergent period ring on a compatible Frobenius radius model, prove
`A ≃ fib[A⊗̂B̃_r --(φ−1)→ A⊗̂B̃_{r/p}]` and `A⊗̂(B̃_r^{H_K}) ≃ RΓ_cont(H_K,A⊗̂B̃_r)`, with the prescribed period topologies and the
first map the constant augmentation. The field case uses the Frobenius exact sequence and the normalized-trace
continuous resolution; extend it to affinoid `A` through potentially orthonormalizable Banach presentations
and strict completed tensor exactness, as in Pottharst Lemma 2.9, p.1598. Identify the cochain comparison and
its contraction on the trace-zero summand, convergence and strictness before applying continuous
Hochschild–Serre. These are linear continuous-cochain assertions, not nonabelian `H¹(H_K,GL_d(B))=1`; treating
Banach modules as discrete does not prove them. For a finite local E-algebra `A`,
`HerrCohomology` and its Ext/Galois comparison are this ordinary specialization; export
`HerrCohomology.baseChange` as the derived comparison of §4.5, with perfectness, Euler and evaluation
cup duality from §4.4. The full-torsion/p-primary adapter is §3.4, including its signed trace.
API: comparison after reduction, rationalization, finite flat
coefficients, restriction, corestriction and tensor cups.

**Checks.**

- For a finite trivial module, the comparison is the Artin–Schreier–Witt comparison on `H_K` and the actual
  `Γ` resolution, with `H⁰` equal to its fixed elements.
- For a lattice `T`, reduction to `T/p^n` must commute with the comparison; inverting `p` before taking the
  coefficient inverse limit is not the construction.
- For a continuous `A` representation with nonzero infinitesimal action, the comparison preserves the
  nilpotent action and its extension class.
- The dyadic integral trivial representation is routed through §3.7; using ordinary invariants under its `C₂`
  quotient fails the finite-coefficient test there.

### 3.7 Dyadic derived descent

For `p=2` put `K′=K(μ₄), Q=Gal(K′/K)`, of order one or two. Construct `dyadicHerrDescent T` as the total
complex of the finite-group bar resolution acting coherently on the torsion-free-subtower Herr complex.
Transport the canonical homotopy-coherent `Q` action from the norm-field continuous bar resolution through the
torsion-free Herr roof. Conjugation and choices of lifts act by the chain maps of §3.4; its explicit
homotopies for `Γ` actions account for lift changes, while the bar resolution supplies their higher cocycle
coherences. Compare this totalization with `RΓ(Q,RΓ(K′,T))` and hence `RΓ(K,T)` by compact continuous
Hochschild–Serre. The construction may be unbounded before the Galois comparison truncates it. It is not a
two-term averaging construction. Prove compatibility with the cofinal `K′` cyclotomic tower and corestriction.
Sources: §0.6 and its continuous Hochschild–Serre comparison, CC-1999 §II.1–§II.3, pp.11–15, and KPX's torsion
convention in §2.3, pp.20–21. API: `dyadicHerrDescent_compare`, `dyadicHerrDescent_restrict`,
`dyadicHerrDescent_corestrict`, and rational comparison with the invariant Herr complex.

**Checks.**

- If `K` already contains `μ₄, Q=1` and totalization is the torsion-free-subtower complex.
- For `Q=C₂` acting trivially on `𝔽₂, H¹(Q,𝔽₂)=𝔽₂`, whereas ordinary invariants placed in degree zero have no
  such `H¹`.
- Over `ℚ₂` the higher finite-group cohomology vanishes by averaging; rationalization gives the rational
  invariant convention.
- Corestriction across a degree-two tower step is the norm map; replacing it by an invariants inclusion gives
  a wrong degree factor.

### 3.8 Cups, residue normalization and field maps

Construct `herrCup` for integral and affinoid coefficients extending §3.4a and compatible with the supplied
continuous cup. For degree-one cycles `x=(x₁,x₂), y=(y₁,y₂)`, fix
`x∪y=x₂⊗γ(y₁)−x₁⊗φ(y₂)`, with the other degrees obtained from the signed total-complex convention. Prove the
Leibniz rule, associativity on cohomology and the Galois comparison square. Source: KPX Definition 2.3.10,
p.23, and the pairing conventions surrounding Theorem 2.3.11, pp.24–25.

For `K=ℚ_p` define `herrResidueGamma` on `H²(R_E(1))` by Res(f `dπ/(1+π))/logχ(γ)`. The logarithm is nonzero
because `γ` is a genuine infinite-order generator after the finite factor is removed. Carry the nonzero scalar
`C_p` determined by `herrResidueGamma = C_p · TateInvariant`. KPX Remark 2.3.12, p.24, does not establish the
reported numerical value; no such value is assumed here. Prove independence under generator change, and use
the same `C_p` in every specialization below. Define no unsupported single-coordinate residue formula for
arbitrary `K`. API: residue kills boundaries, factors through `H²`, `herrResidueGamma_eq_scalar_tate`,
`herrResidueGamma_generator`.

Construct `herrRestriction`, `herrCorestriction` and `herrShapiro` using finite field induction, coefficient
trace and coset trace. Prove transitivity, projection formula, comparison with existing continuous transfer,
and `cor∘res=[K′:K]`. Source: KPX Lemma 2.3.5 and Proposition 2.3.7, p.22. Their field specialization uses the
same trace and coset maps as the integral/affinoid comparison.

**Checks.**

- For trivial scalar actions, `(1,0)∪(0,1)=−1` and `(0,1)∪(1,0)=+1`. This fixes the degree-two sign.
- `χ_ur∪κ(p)` has Tate invariant `+1`, so its Herr residue is `C_p`, not an assumed 1.
- If `γ` is replaced by `γ^u`, numerator and log denominator acquire the same generator factor on `H²`.
- On a trivial coefficient class, restriction followed by corestriction multiplies it by the full field
  degree, including both the norm-field and coset indices.

### 3.9 Localized Artinian coefficients and equivariant cohomology

Let `A` be a finite local E-algebra and let `M` be finite free over `R_{A,K}[1/t]`, with a stable
finite-projective underlying `R_K` lattice `D` whose localization is `M`. Define `localizedArtinianHerr M` as
`colim_n Cφ,γ(t^{−n}D)`, independently of `D`. Construct the localized `Ext¹` comparison and coefficient
compatibility. Do not infer that an `R_A`-stable lattice exists from the given underlying lattice. Source: BHS
§3.3, Remark 3.3.1 and complex (3.10), p.342, and formulas (3.11)–(3.13), p.343. Lemma 3.3.5, pp.344–345,
supplies the localized de Rham realization. BHS uses all finite torsion invariants and the opposite
degree-one-to-two sign; first use the rational torsion-convention comparison of §3.4, then multiply degree two
by `−1`. API: `localizedHerr_latticeIndependent`, `localizedHerr_extOne`, `localizedHerr_baseChange` on the
specified category.

Construct `cyclotomicEquivariantCohomologyComparison` by applying derived `Γ` descent to the equivariant
functor of §1.6 and the supplied Frobenius period-sheaf roof. Its routes through B-pair cohomology and through
arithmetic Herr cohomology agree, including tensor cups, field restriction and trace. Sources: KL-I §9.5,
pp.200–202, combined with its §§8.6.2–8.6.5, pp.175–176; the additional assertion is the `Γ` descent triangle.
The nonequivariant roof is exactly §1.0c, with `Γ` descent applied to its localization maps.

**Checks.**

- Replacing `D` by `t^mD` gives the same filtered colimit by a cofinal reindexing.
- A non-étale rank-one object after inverting t is included when its stable underlying lattice is supplied;
  étale realization alone does not define this category.
- With trivial rank-one coefficients, the period-sheaf route and the Herr route induce the same `H⁰` section
  and the same cup in degree two.
- The degree-two `−1` adapter converts the BHS differential into the displayed signed differential; omitting
  it reverses the preceding cup witness.

### Examples

The `φ=2,γ=3` example checks `d²=0` and the cup convention. The polynomial example computes the entire
correction term of the homotopy. The `C₂/𝔽₂` example is the obstruction to every integral averaging shortcut.
These tests apply before arithmetic finiteness is used.

### Dependencies

Layers 0–2, native complexes and homotopies, continuous cochains and Hochschild–Serre; the field comparison of
§3.4a fixes normalization. The Banach period acyclicity and integral limit argument provide the comparison
inputs. The scalar interfaces of §4.0 and the analytic ring/scalar-change constructions of §4.1
precede §§3.4–3.5. The field character calculation uses no relative coadmissible finiteness theorem
and is available for its induction.

## Layer 4: analytic group rings and uniform finiteness

### 4.0 Compact character spaces and scalar Mellin coordinates

Construct this subsection and the ring/scalar-change portion of §4.1 before §§3.4–3.5.
Consume PadicFunctionalAnalysis §§4.3–4.4 and 4.7 for the one-variable stages, algebraic distribution
carrier and quantitative Amice bijection. Construct the compact-type inductive-limit topology on those
stages and identify its continuous strong dual with that carrier by the supplied norm inequalities;
then construct the multivariable and finite-component adapters on this carrier.

For a compact abelian p-adic Lie group `G` with open `ℤ_p^d` subgroup, construct `compactCharacterSpace G`
representing continuous characters `G→Aˣ` on affinoid `ℚ_p`-algebras `A`. On a chosen principal subgroup the
universal characters use `d` open-disc coordinates; retain the finite quotient and glue the finite character
components by restriction, without assuming they all split over `ℚ_p`. Construct change-of-generators maps,
their cocycle and inverse, and finite coefficient field extension. For `K^×` use `K^×≃ϖ_K^ℤ×O_Kˣ` to construct
`localMultiplicativeCharacterSpace K` as the unit character space times `G_m`, and prove its
uniformizer-independent representing property. Source: KPX §6.1, especially Proposition 6.1.1 and Remark
6.1.2, pp.54–56. The `ℤ_p^×` components and their integral universal characters are the supplied
PadicMeasuresIwasawaAlgebras/PadicFunctionalAnalysis objects. API: `compactCharacterSpace_universal`,
`compactCharacterSpace_generatorChange`, `localCharacterSpace_uniformizerChange`, evaluation and coefficient
compatibility.

For this compact abelian `G`, let `abelianAnalyticDistributions G E` be the continuous dual of locally
`ℚ_p-analytic` E-valued functions with its strong topology. Construct the scalar Mellin algebra isomorphism
with `O(compactCharacterSpace G)_E`, sending `μ` to the function `δ↦μ(δ)`. Prove convergence on each closed
weight polydisc, inverse coefficient recovery, convolution/multiplication, point mass/universal character,
continuity and finite E-extension. Construct it first on the open `ℤ_p^d` subgroup by analytic binomial
coefficients and then compare the finite-index component decomposition and descent. This local abelian Fourier
theory has no nonabelian manifold or general distribution-module claim. Sources: KPX §2.1 and §4.2 for the
one-variable `Γ` application; its §6.1 for general unit character spaces; Schneider–Teitelbaum, *p-adic
Fourier theory*, §2, the `ℚ_p-analytic` Fourier transform and its base-change interpretation. Arbitrary
affinoid tensor extension, stage exactness and the uniform coadmissible presentation criterion are §4.1. API:
`scalarAbelianMellin`, `scalarAbelianMellin_dirac`, `scalarAbelianMellin_convolution`,
`scalarAbelianMellin_coefficients`. Export `rigidCharacterSpace` and its universal, component,
pullback and finite-base-change API as the geometric character-space interface, and `distributionMellin`
with its moment coefficients and extensionality as this same transform. Their topological algebra
isomorphism uses the strong dual topology just constructed.

**Checks.**

- For `G=ℤ_p`, the character sending 1 to `1+T` is universal on the open disc; `T=0` is the trivial character
  and `T=−1` is outside the character domain.
- For `G=ℤ₂^×`, trivial and sign characters give different evaluations on `[−1]`. Collapsing to the principal
  coordinate `[5]−1` fails the representing property.
- If `ϖ′=uϖ`, then the uniformizer value changes from a to `δ(u)a`; a character of `K^×` is unchanged. The
  multiplicative parameter must be invertible.
- A point mass at g has Mellin transform `δ(g)`; the mass at the identity gives 1, whereas the zero
  distribution gives 0.
- Convolution of masses at g,h gives the universal character at gh. Under `g↦g⁻¹` the transform is
  precomposition by `δ↦δ⁻¹`, fixing the involution used later.
- On each closed disc the inverse transform recovers every analytic coefficient, not just values at
  finite-order characters; a function vanishing on one torsion component is not identified with the zero
  distribution on all `G`.

### 4.1 Relative analytic Γ rings

For a compact abelian `Γ_K` with an open principal `ℤ_p` subgroup, define `analyticGammaRing A K = R_A^∞(Γ_K)`
by A-completed scalar extension of `D(Γ_K,ℚ_p)`, equivalently functions on `A×W_{Γ_K}`. Construct it as the
inverse limit of the closed weight-disc affinoids `A⊗̂Λ_n`, retaining every finite torsion component. Define
`gammaAnnulusRing A K s r`, `gammaOuterRing A K r` and the Robba-type `robbaGammaRing A K` by the analogous
Laurent/annulus coordinate rings and their limits. The latter permits boundary annulus coordinates; it is
larger than the ring of functions on the entire open weight disc. A generator change is transported by the
Mellin coordinate isomorphism, not by relabeling an indeterminate without its convergence domain. Sources: KPX
§2.1, pp.7–15, and Theorem 3.1.1, pp.25–28; §4.0 for the scalar transform.

Construct the A-coefficient Mellin comparison on each disc: use the bounded coordinate expansions and the
strict completed tensor comparisons proved here from the Banach models and split resolutions, then prove
compatibility of the disc restrictions and take the inverse limit. Prove noetherianity of the Banach stages,
flat transition maps, strictness of finite presentations, exactness for coadmissible systems and the vanishing
of `R¹lim` for the relevant dense transition systems. These targets are `relativeMellin`, `gammaStage_flat`,
`gammaCoadmissible_exact`, `gammaBanachLimit_acyclic`. Prove the uniform presentation criterion: a compatible
coherent system with uniform bounds on generators and relations is the system of a finitely presented global
module; if the system is locally free with uniform rank bounds, its global module is finite projective.
Sources: KPX Lemma 2.1.4, Corollary 2.1.5, Lemma 2.1.6, Corollary 2.1.7 and Lemma 2.1.8;
Proposition 2.1.13, Remark 2.1.14 and Lemma 2.1.15, pp.8–14. Bounds are required uniformly across
the exhaustion.

**Checks.**

- For `A=E` the construction is the scalar distribution/Mellin ring, with its original Fréchet topology.
- At `p=2` both sign components are retained; evaluation at the sign character and evaluation at the trivial
  character differ on `[−1]`.
- On the principal component, `[γ]−1` is the disc coordinate. Its inverse is not a function on the whole disc
  containing the trivial character, although it is defined on an annulus avoiding zero.
- A coherent system whose number of generators grows without bound on the exhaustion does not satisfy the
  global finite-presentation criterion.

### 4.2 ψ cokernels and the t-torsion step

For `M` over `R_{A,K}`, prove `psiCokernel_finite`: `M/(ψ−1)` is finite over `A`. Prove
`psi_eventuallySurjective`: `ψ−1` is surjective on `t^{−n}M` for all sufficiently large integers `n`. Reduce
to `K=ℚ_p` by finite induction, choose a projective radius presentation, compare the small- and large-exponent
pieces with annular norm estimates, and iterate the contracting part. Source: KPX Proposition 3.3.2 and proof,
pp.31–34. The integer `n` depends on `M`; `n=0` is not asserted.

Construct `tQuotientHerrComplex` for M/tM. Prove that its Herr cohomology is finite over `A` and vanishes
outside degrees 0,1 (KPX Proposition 3.2.4, p.29). Prove `ψ−1` surjective on M/tM and construct a resolution
`0→P→Q→(M/tM)^{ψ=1}→0` with P,Q finite projective over `R_A^∞(Γ)` (Proposition 3.2.5, pp.29–31). Use a
sufficiently small `Γ` subgroup whose action is close to the identity and compare with the free analytic
action. API: the quotient triangle for `tM→M`, finite resolutions and coefficient base change.

**Checks.**

- For `M=0` the `ψ` cokernel and all quotient complexes vanish and every `n` works.
- For `M` with nonzero `ψ` cokernel, the eventual statement cannot be applied at `n=0` without its threshold.
- Multiplication by t gives the specified map into `M`, and the triangle has M/tM as its cone, rather than a
  second copy of `M` in degree zero.
- Over `E[ε]/ε²` the quotient and finite presentation retain `ε`; fiberwise finiteness alone does not prove
  finiteness over this coefficient algebra.

### 4.3 Residue pairing and uniform finiteness on the weight exhaustion

Before the finiteness argument, construct `psiFiniteCoefficientChange` for a finite affinoid A-algebra `B`. A
strict bounded-above resolution by finite free A-modules (possibly unbounded to the left), the A-flat annulus
coefficients and finite-projective radius models give `Cψ(M)⊗ᴸ_{R_A^∞(Γ_K)}R_B^∞(Γ_K)≃Cψ(M_B)`, without
assuming the desired finite presentation. This is the preliminary finite-coefficient comparison of KPX Lemma
5.1.4, p.47; arbitrary affinoid base change is proved only in §4.5. Construct `psiCharacterFiberComparison` at
a closed weight point `(z,η)`: first use that finite coefficient comparison for `κ(z)`, then resolve character
evaluation on `Γ` by `γ−η(γ)`, keeping its finite torsion idempotent. Its total complex is the twisted
`ψ-Herr` complex, hence the `φ-Herr` complex by §3.3. This gives the Tor spectral sequence used below.
Sources: KPX §4.2, pp.36–39, and Lemma 5.2.2, p.48. No universal cyclotomic-deformation comparison from Layer
5 is assumed here.

For `K=ℚ_p` and a relative module `M`, construct the analytic `Γ`-valued pairing on `M^{ψ=1}×(M*)^{ψ=1}`,
linear in the first variable and `ι`-linear in the second. Define it from the `ψ`-zero residue pairing by
`iwasawaPairing(x,y) = psiZeroPairing((φ−1)x,(φ−1)y)`.
Its characterization is, for every analytic `Γ` scalar `r` in the allowed annulus model,

```text
Res_Γ(r · iwasawaPairing(x,y) · ω_logχ)
  = periodResiduePairing(r(φ−1)x,(φ−1)y).
```

Here `ω_logχ` is the logarithmic differential transported by the Mellin coordinate, with the chosen `γ` and
`χ` normalization, and the second action is inverted. Prove existence and independence of the radius. The
`ψ`-zero pairing is perfect over the stated Robba-type `Γ` ring; the uniform proof below starts with this
pairing and its fiber comparison, before relative perfectness of `ψ`-fixed modules is known. The field
finiteness and double-vanishing case are established next and is an input to the relative proof. Sources: KPX
Definition 4.2.8 and Proposition 4.2.9, pp.38–39, with the `ψ`-zero pairing of §4.2, pp.36–38.

State the specialization square with its constants. The map from `ψ`-fixed `x` to degree-one `ψ-Herr`
cohomology is `logχ(γ) · [(0,x)]`; transfer the first variable to `φ-Herr` by the section of §3.3, while the
second variable uses the `γ⁻¹` generator adapter. Under these two maps and the residue evaluation, the pairing
specializes to the signed Herr cup invariant of §3.8. The arithmetic comparison with the independent Iwasawa
tower is made in §5.5. This Herr square, the residue characterization for every `r`, and the explicit maps
specify normalization together; no numerical value of `C_p` is suppressed. API: `iwasawaPairing_sesquilinear`,
`iwasawaPairing_residue`, `iwasawaPairing_specialize`, `iwasawaPairing_fieldTrace`.

For a finite extension `E/ℚ_p`, prove `fieldPsiPerfect`: `Cψ(M)` is bounded perfect over `R_E^∞(Γ_K)`, and
`(φ−1)M^{ψ=1}` is finite free of rank `[K:ℚ_p]rank(M)` on each analytic `Γ` component. Reduce `K` to `ℚ_p` by
finite induction. The slope filtration and t-quotient resolution reduce this to pure slopes and then, by
induction on the numerator of the slope, to the étale case. For the induction use §3.4a's
`fieldAuxiliaryPureExtension d`, with first filtration term `tR` and
`d−1` unit-line successive factors; tensoring lowers the numerator, and the long exact
`ψ` sequence after replacing `M` by `t^{−n}M` for sufficiently large `n` gives finite generation and
coadmissibility. This auxiliary extension is the one constructed in Liu Lemma 4.2, manuscript p.22, using the
nonzero `H¹` of the preceding extension and excluding a destabilizing subobject by its map to the unit
quotient. Liu labels its slope `+1/d` in his valuation-positive convention; the same extension has slope
`−1/d` in KPX’s convention, without dualizing it. In the étale case use the bounded `ψ`-fixed image and its
analytic scalar extension: Colmez-GL2 Theorem I.5.2, p.319, and Proposition V.1.18, pp.397–398. The `φ`-fixed
kernel is finite-dimensional by residue duality and `psiCokernel_finite`. The Bézout property of the field
analytic `Γ` components then gives finite projective resolutions. This is KPX Proposition 4.3.6 and Corollary
4.3.7, pp.40–41, and uses neither relative finiteness nor the independent Iwasawa-tower comparison. The
underlying field Robba slope filtration and descent of pure modules are §1.0b; `Γ-stability` follows from
uniqueness. All the field steps precede the relative argument.

Now take `A=E` with `E/ℚ_p` finite and `K=ℚ_p`. Let M* `= M^∨(1)`, and assume **both** `M/(ψ−1)=0` and
`M*/(ψ−1)=0`. Prove `psiFixed_generation`: `φ−1` is injective on both fixed spaces, the Iwasawa pairing is
perfect between finite free `R_E^∞(Γ)` modules, and for sufficiently small `r₀`,

```text
((φ−1)M^{ψ=1}) ⊗_{R_E^∞(Γ)} R_E^{r₀}(Γ) ≅ (M^{r₀})^{ψ=0}.
```

The scalar extension to the Robba-type `Γ` annulus is part of the assertion. Generation over the entire-disc
distribution algebra alone is not asserted. Source: KPX Hypothesis 4.3.1, p.39, and Proposition 4.3.8,
pp.41–42. Prove injectivity by field Tate duality and character specialization; using the field finiteness
just established, perfectness on all character fibers and annular `ψ`-zero duality give the remaining
assertions. API: `psiFixed_generation`, `psiFixed_pairingPerfect`, `oneSubPhi_injective_of_doubleVanishing`
and compatibility on smaller `r₀`.

Prove `relativePsiUniformPresentation`, the finite presentation of `Cψ(M)` in `D⁻_perf(R_A^∞(Γ_K))`, before
deducing relative Herr finiteness. Use the preliminary finite-coefficient and character-fiber comparisons and
the field theorem just proved. The relative proof has three separately verifiable stages. First reduce by
induction in `K`, nilpotent coefficient devissage and t-twists to a reduced coefficient algebra over `ℚ_p`.
Second, under vanishing of both `M/(ψ−1)` and `M*/(ψ−1)`, construct dual local `H¹` bases, lift them, and use
their pairing matrix to obtain local generators on the weight annuli. Inverting its determinant and using all
closed fibers detects generation; compact affinoid covers supply finitely many choices. The small-radius
`ψ`-zero presentation and its dual give uniform bounds on the number of generators **and relations**, so §4.1
makes the global fixed module finite projective in this case. Third, for the general case use the elementary
rank-one field calculation of §3.5 to choose a generic character with nonexceptional value and nonintegral
weight, and construct extensions whose connecting maps strictly reduce the finite `ψ` cokernel. Noetherian
induction and positive t-twists complete the devissage. Sources: KPX §§5.1–5.3, pp.47–53, especially
Hypothesis 5.2.1, Proposition 5.2.6, Corollary 5.2.8, Proposition 5.2.10, Lemma 5.2.11 and Theorem 5.2.12,
pp.48–50, and Lemmas 5.3.4–5.3.6, pp.51–53.

The named intermediate targets are `psiDoubleVanishing_uniformGenerators`,
`psiDoubleVanishing_uniformRelations`, `psiDoubleVanishing_projective` and `psiExtension_reduceCokernel`. This
proof requires the actual determinant cover and uniform bounds; neither pointwise finite dimensionality nor an
abstract appeal to coadmissibility replaces them.

**Checks.**

- The zero module has a presentation with zero generators and relations, compatible with the rank-zero result.
- In the double-vanishing case, a pairing matrix with nonunit determinant only gives generation on its
  invertibility locus; it cannot be used as a global basis.
- A family of finite fiber modules with unbounded presentation sizes is rejected by the uniform-relation step.
- A nilpotent coefficient ideal is handled by devissage, not by replacing `A` with `A_red` and claiming the
  same modules.
- For the constant analytic function `f=1, logχ(γ)·Res_Γ(−f·ω_logχ/(γ⁻¹−1))=1`. The pole is taken in the
  Robba-type ring, not in the entire-disc ring. Omitting the inverse generator or logarithm fails this
  computed specialization.
- The pairing is zero on a zero argument, is linear in its first variable and sends `[γ]` in its second
  variable to `[γ⁻¹]`. A character `η` with `η²≠1` distinguishes the two actions.
- At a trivial weight fiber, `ψ`-fixed classes map by `logχ(γ)[(0,x)]`. Replacing this by [(0,x)] fails the
  residue comparison.
- Over `B=A/I` finite, the preliminary derived comparison retains Tor; it does not identify ordinary fixed
  modules after a nonflat quotient.
- For `d=1` the auxiliary extension is `tR` with `φ(t)=pt`: its KPX slope is `−1` and its valuation-positive
  slope is `+1`. Reversing the convention without reversing the induction gives the wrong slope change.

### 4.4 Perfectness, Euler characteristic and duality

For every finite-projective relative `M` prove `relativeHerrPerfect`: `Cφ,γ(M)` is perfect over `A` of
amplitude `[0,2]`, with Euler characteristic `−[K:ℚ_p]rank(M)` on each connected component. Construct the
cup-induced quasi-isomorphism
`Cφ,γ(M*) ≃ RHom_A(Cφ,γ(M),A)[−2]`, where `M*=M^∨(1)`. Sources: KPX Theorems 4.4.2 and 4.4.5, pp.42–44, after
the uniform theorem. Finite projective resolutions and closed-point detection apply only after the uniform
finite-presentation theorem has been proved.

Prove `relativePsiPerfect`: `Cψ(M)` is perfect over `R_A^∞(Γ_K)` of amplitude `[0,2]`, `H⁰=0, H¹` is finitely
presented of generic rank `[K:ℚ_p]rank(M)`, and `H²` is A-finite and analytic `Γ`-torsion. Its Euler
characteristic is the same negative rank. **Do not shorten the perfect amplitude to [1,2]**: the terms of the
native complex occur in those degrees, but `H¹` may have torsion. Source: KPX Theorem 4.4.6, pp.44–45. API:
perfect representatives, coherent restriction, componentwise Euler formula, Tate-dual naturality,
compatibility with the supplied field duality and the same residue scalar `C_p`.

**Checks.**

- For the trivial rank-one field module over `K, h⁰=1,h²=0,h¹=[K:ℚ_p]+1`, giving Euler characteristic
  `−[K:ℚ_p]`.
- For the Tate line `h⁰=0,h²=1,h¹=[K:ℚ_p]+1`, giving the same Euler characteristic and the prescribed
  degree-two pairing.
- For rank zero, both perfect complexes and both Euler characteristics are zero.
- A `ψ`-fixed module with torsion in `H¹` is consistent with amplitude `[0,2]`; the statement does not declare
  `H¹` flat or free over an arbitrary affinoid algebra.

### 4.5 Derived coefficient change

For any affinoid homomorphism `A→B`, prove the canonical derived comparison maps

```text
Cφ,γ(M) ⊗ᴸ_A B ≃ Cφ,γ(M ⊗̂_A B),
Cψ(M) ⊗ᴸ_{R_A^∞(Γ_K)} R_B^∞(Γ_K) ≃ Cψ(M ⊗̂_A B).
```

Prove compatibility with composition, cups, duality and finite field operations. Identify the induced Tor
spectral sequences, with `E₂^{−i,j}=Tor_i(H^j,B)` and total degree `j−i`. Ordinary homology base change is a
corollary under flatness or the particular vanishing of the relevant Tor terms; it is not the general
assertion. Source: KPX Theorem 4.4.3, pp.42–43. API: `herrDerivedBaseChange`, `psiDerivedBaseChange`,
`baseChange_trans`, `baseChange_flat`, and the edge maps with the actual cycle/quotient maps.

**Checks.**

- Let `A=E⟨X⟩` and `C=[A --X→` A] in degrees 0,1. `H⁰(C)=0` and `H¹(C)=A/(X)`; at `B=A/(X), H⁰(C⊗ᴸB)=B`,
  supplied by `Tor₁(H¹(C),B)`. Ordinary `H⁰` base change would give zero.
- For a flat extension `A→B` the higher Tor terms vanish and the usual cohomology tensor formula follows.
- Identity coefficient change induces the identity comparison; `A→B→C` gives the same map as `A→C`.
- For the algebraic analogue, the kernel of `ℤ --2→ ℤ` is zero, whereas after tensoring with `ℤ/2` the kernel
  is the whole residue field. This is a Check of the derived theorem, with the same Tor₁ obstruction.

### Examples

The nonflat two-term complex separates derived base change from a false statement about individual cohomology
modules. The trivial and Tate lines fix the Euler sign independently of the `ψ` description. The uniform
determinant cover explains which geometric data are needed between fieldwise duality and a finite global
presentation.

### Dependencies

Layers 1–3 and the scalar analytic and geometric contracts. The scalar §4.0 and analytic
ring/scalar-change portion of §4.1 precede §§3.4–3.5; the remaining coadmissible and uniform-presentation
results of §4.1 precede §4.3. Uniform coadmissible presentation precedes
perfectness and derived base change. There is no use of the later global triangulation theorem in this proof.

## Layer 5: local Iwasawa cohomology and specialization

### 5.0 The independent local Iwasawa tower

For a finite p-primary `G_K` module or a finite free `O_E` lattice `T` with continuous action, define
`localIwasawaComplex K T = Rlim_n RΓ(K_n,T)` with **corestriction** transitions and its full `Λ(Γ_K)` action
by conjugation and coefficient action. Use §0.6 for its native continuous cochains. The definition contains no
period ring or `ψ`. Construct the continuous induced coefficient module with its inverse universal-character
action, and prove `localIwasawaShapiro` identifying its continuous `G_K` complex with this derived limit. Give
finite-level evaluation maps and prove derived descent along `Λ→O_E[Γ_K/Γ_n]` identifies the specialized
complex with `RΓ(K_n,T)`, using the finite-group resolution when its order is divisible by p. Rationalize only
after the inverse limit and prove commensurable-lattice independence. Sources: CC-1999 §§II.1–II.3, pp.11–15;
KPX Definition 4.4.7 and Corollary 4.4.11, pp.45–46, for the analytic Shapiro convention. API:
`localIwasawaComplex_corestriction`, `localIwasawaShapiro`, `localIwasawaComplex_finiteLevel`, transitivity,
trace/cup compatibility, coefficient maps and cofinal subtower equivalence. Export the local
`iwasawaComplex` interface for `G=G_K,H=H_K`: the coefficient-limit and corestriction-tower models
are compared by finite-level Shapiro, with the actual projection and transfer maps. In the inverse-character
model `g(m⊗λ)=gm⊗[ḡ]⁻¹λ`; `id⊗ι` identifies the opposite convention and reverses the scalar action.
This is the specialization interface for SelmerIwasawaCohomology §§3.1–3.2. The analytic Banach coefficient
extension uses the strict completed cochain comparisons of §3.6 and the weight exhaustion of §4.1; it is not
obtained by declaring all affinoid Banach spaces compact.

**Checks.**

- For `T=0` the independent tower is zero, before any comparison with a `ψ` complex.
- On invariant trivial finite-level classes across degree `p`, corestriction is multiplication by p. Identity
  transition maps define a different tower.
- The finite-level evaluation at the trivial character can have `H⁰` through a derived Tor term, even when the
  infinite-tower complex has no `H⁰`.
- Replacing the cyclotomic tower by its `μ₄` cofinal subtower at `p=2` leaves the derived limit unchanged,
  while the finite quotient action is retained in its descent.
- For the universal inverse-character convention, specialization at `η` twists coefficients by `η⁻¹`; an
  order-three `η` distinguishes this from `η`.

### 5.1 Integral comparison with the independent tower

Let `T` be a finite p-primary `G_K` module or a `G_K`-stable finite free `O_E` lattice. Write
`K_n=K(μ_{p^n})`, allowing a cofinal subsequence and repeated initial fields. Construct
`integralIwasawaComparison T` between the independent `Rlim_n RΓ(K_n,T)` of §5.0, whose transition maps are
**corestrictions**, and `Cψ(D(T))`. In particular `H¹_Iw(K,T) ≅ D(T)^{ψ=1}` and `H²_Iw(K,T) ≅ D(T)/(ψ−1)`,
with no additional degree shift. For rational `V` take a stable lattice, form the inverse limit first and
invert `p` afterwards; prove lattice independence. Sources: CC-1999 Theorem II.1.3, p.12, its proof in
§§II.2–II.3, pp.12–15, and Remark II.3.2, p.15, for degree two.

Construct the comparison on the tower. For `y∈D(T)^{ψ=1}, (φ−1)y` is `ψ`-zero; the rational finite-level
representative has Herr pair `((γ_n−1)⁻¹(φ−1)y,y)`, with the CC normalization `ℓ_{K_n}(γ_n)`. Integrally
define its class by the finite torsion/period exact sequence and pass to lattices; an integral inverse on
every `ψ`-zero lattice is not assumed. The corestriction map from `γ_n^p` to `γ_n` has degree maps
`Q_p, diag(Q_p,id), id`, with `Q_p=Σ_{i=0}^{p−1}γ_n^i`. Prove these squares and the normalization identity, so the
second coordinate is compatible with corestriction.

Prove the limit assertions in the proof: the compact `ψ`-fixed module is recovered from its cyclotomic
coinvariants; the `ψ` cokernel is finitely generated over `ℤ_p`, so its increasing submodules fixed by the
small `Γ` groups stabilize; on that stabilized submodule the norm transition is multiplication by `p`, and its
inverse limit is zero because a finitely generated `ℤ_p` module has no nonzero infinitely p-divisible
subgroup; degree two recovers the `ψ` cokernel itself; the norm maps kill the persistent degree-zero inverse
limit. Verify the derived-limit terms with compact finite-level systems and the induced Mittag–Leffler
arguments, not by declaring every transition surjective. For `p=2` use the cofinal `K(μ₄)` tower and §3.7 to
compare with the original tower.

API: `iwasawaCompare_h1`, `iwasawaCompare_h2`, `iwasawaCompare_corestriction`,
`iwasawaCompare_latticeIndependent`, and the native derived comparison whose cohomology maps are these
prescribed maps.

**Checks.**

- For `T=0` the tower and `ψ` complex vanish, including the derived-limit terms.
- The `ψ=id` toy complex has `H¹=M,H²=M` and `H⁰=0`; placing it in degrees 0,1 would contradict the
  comparison's indexing.
- For a fixed class in a degree-p trivial-action norm system, corestriction is multiplication by `p`; it is
  not the identity transition.
- At `p=2`, passing to the `μ₄` cofinal tower agrees with the original derived descent, retaining the `C₂`
  cohomology before rationalization.

### 5.2 Functoriality and finite characters

Prove `iwasawaCompare_natural` for maps of `T`, finite flat coefficient changes, finite extensions of `K` and
compatible changes of lattice. On `ψ` complexes, restriction and corestriction use the period field maps of
§3.8; on the tower they use existing continuous cochain maps. Prove transitivity, projection formula and norm
identities. Source: CC-1999 §§II.1–II.3, pp.11–15; KPX Corollary 4.4.11, p.46, for analytic compatibility.
Construct `iwasawaCharacterSpecialization η` as a derived tensor specialization along the character of
`Λ(Γ_K)`, for a finite-order character `η` and any allowed finite coefficient extension. It identifies the
resulting complex with `RΓ(K,T(η⁻¹))` in the inverse universal-character convention. At a finite level use the
character's kernel and the supplied descent comparison. Torsion components and Tor contributions remain part
of the construction.

**Checks.**

- The trivial character specializes to the ordinary local Galois complex, which may have `H⁰`; this `H⁰` can
  arise as Tor from the `ψ` complex with no degree-zero term.
- Replacing `η` by `η⁻¹` changes the twist; at a character of order greater than two these are not
  interchangeable.
- For `K′/K` the specialization of cor∘res multiplies by [`K′`:K], as does the independently defined tower
  map.
- At `p=2` the sign character evaluates `[−1]` to `−1`; it cannot be represented by specializing only the
  principal coordinate `[5]−1`.

### 5.3 The cyclotomic deformation

Let `Λ_n=R^{[1/p^n,∞]}(Γ_K)` be the closed affinoids exhausting `W_{Γ_K}`. Construct
`cyclotomicDeformationStage M n` as `M⊗̂R_{Λ_n,K}e` with `φ(e)=e` and `γ(e)=[γ]⁻¹e`. Define
`cyclotomicDeformation M` as their compatible inverse limit over the quasi-Stein exhaustion, with both its
coefficient action and diagonal arithmetic `Γ` action specified. Its specialization at `η` is `M(η⁻¹)`.
Source: KPX Definition 4.4.7, p.45. API: stage restriction, tensor and coefficient compatibility,
specialization, `Γ`-linear `ization` and the actual quasi-Stein gluing maps.

Prove `cyclotomicDeformationComparison`:
`Cψ,γ(Dfm(M)) ≃ Cψ(M)`, and transport along §3.3 to `Cφ,γ(Dfm(M))`. First prove the universal `Γ` resolution
has no invariants and coinvariants canonically `M`, so `[Dfm(M)^{Δ_K} --γ−1→ Dfm(M)^{Δ_K}] ≃ M[−1]`. Take the
mapping fiber of `1−ψ` with the fixed signs. This supplies the comparison in degrees 1,2 without a guessed
shift. Deduce
`Cψ(M*) ≃ RHom_{R_A^∞(Γ_K)}(Cψ(M),R_A^∞(Γ_K))^ι[−2]`,
where `ι([γ])=[γ⁻¹]`. Source: KPX Theorem 4.4.8, pp.45–46. API: `cyclotomicDeformation_compare`,
`cyclotomicDeformation_duality`, naturality and derived character specialization.

**Checks.**

- At `η=1` the stage line has trivial specialized action; at `η` of order greater than two its `γ` action is
  `η(γ)⁻¹`, not `η(γ)`.
- The universal resolution has invariants zero even though the trivial specialization can have invariants;
  invariants do not commute with this nonflat specialization.
- The map to coinvariants lands in `M` in degree one, fixing the `[−1]` convention.
- The involution sends `[γ]` to `[γ⁻¹]` and squares to one; omitting it gives a bilinear rather than the
  required sesquilinear Iwasawa duality.

### 5.4 Analytic Iwasawa comparison

For a finite-projective affinoid representation `V`, construct `analyticIwasawaComparison V` by the
independent Shapiro complex of §5.0, the affinoid Galois comparison and §5.3. It identifies analytic extension
of the independently defined Iwasawa cohomology with `H^i(Cψ(D_rig(V)))`, compatibly with affinoid derived
base change. When an integral Banach unit ball is used, specify it and rationalize after the inverse limit;
independence of that norm follows by commensurability and the cohomological comparison. Source: KPX Corollary
4.4.11 and its proof, p.46. On complexes analytic scalar extension is derived completed extension; ordinary
cohomology tensor formulas use the strict/coadmissible exactness proved in Layer 4 and the hypotheses in that
corollary. API: comparison, lattice/norm independence, finite-level evaluation and coefficient naturality.

**Checks.**

- For a finite coefficient field this agrees with the integral comparison followed by analytic extension, not
  with a separately chosen vector-space isomorphism.
- Replacing a stable lattice by `p` times that lattice changes the integral embedding but gives the same
  rational analytic comparison.
- Specialization along a nonflat affinoid map uses the derived comparison of §4.5, including any extra Tor
  class.

### 5.5 The residue-normalized Iwasawa pairing

For `K=ℚ_p`, a finite coefficient field `E` and a finite-dimensional E-representation `V`, prove
`iwasawaPairing_arithmeticSpecialize`: under the integral-first and analytic comparison maps of §§5.1–5.4, the
analytic pairing constructed in §4.3 specializes at every finite-order character to the independently defined
finite-level Galois Tate cup pairing, with the same residue normalization. The first variable specializes at
`η` and the second at `η⁻¹`. Identify these specializations with the actual finite-layer integration maps, not
just isomorphisms of vector spaces. The `logχ(γ)` and inverse-generator adapters are the ones already
established in §4.3. Converting its Herr invariant into the Galois Tate invariant uses `herrResidueGamma =
C_p·TateInvariant`; no numerical value is substituted for `C_p`. Sources: KPX Proposition 4.2.9, pp.38–39,
Theorem 4.4.8, pp.45–46, and Corollary 4.4.11, p.46. The proof composes the Herr specialization square with
the Galois comparison and independent Shapiro/integration square, preserving cup products. API:
`iwasawaPairing_arithmeticSpecialize`, `iwasawaPairing_integration`, coefficient naturality and the
field-trace projection formula.

**Checks.**

- The second-variable identity is `⟨x,[γ]y⟩=[γ⁻¹]⟨x,y⟩`; replacing `γ⁻¹` by `γ` fails at a character `η` with
  `η²≠1`.
- The degree-one map contains `logχ(γ)`, which changes with the generator; using [(0,x)] alone violates the
  residue specialization square.
- On a pair whose Galois cup has invariant `+1`, the corresponding Herr-residue value is `C_p` with the
  prescribed log and generator factors.
- A zero vector pairs to zero, and the trace pairing after finite field extension satisfies the same
  projection formula as §3.8.

### 5.6 Generation by ψ-fixed vectors

Here `A=E` is a finite extension of `ℚ_p` and `K=ℚ_p`. Apply the field double-vanishing theorem
`psiFixed_generation` proved in §4.3. Its two cokernel hypotheses, finite-field coefficients and Robba-type
`Γ` scalar extension are retained. The additional target here is a criterion that verifies those hypotheses in
the nontrianguline case.

For a finite-projective rank-two `(φ,Γ)`-module M over `R_{E,ℚ_p}`, define
`geometricallyNontriangulineLocalized M` to mean that
`(M⊗_E E′)[1/t]` has no rank-one `(φ,Γ)`-subobject for every finite coefficient extension `E′/E`. Under this
hypothesis prove both ψ-cokernel vanishings before applying the theorem. Indeed a nonzero finite-dimensional
continuous `Γ`-representation `M/(ψ−1)` has, after
finite coefficient extension, a character quotient `η`. Extend `η` to `ℚ_p^×` by choosing its unramified value
equal to one. The top-degree specialization of `Cψ(M)` at `η` gives a nonzero `H²` of the corresponding
character twist of `M`. Field duality gives a nonzero `H⁰` of its Tate dual. Saturate the resulting rank-one
submodule over the Robba Bézout ring and apply `qpadicRankOneClassification`; localization gives a forbidden
rank-one subobject of `(M*⊗_E E′)[1/t]`. Dualize and undo the Tate twist to obtain a rank-one quotient of
`(M⊗_E E′)[1/t]`; in rank two its kernel is a forbidden rank-one subobject. The same argument applies with M and M*
interchanged, and faithful coefficient extension reflects vanishing. This proves
`nontriangulineLocalized_psiCokernel_vanish`, with the hypothesis over every finite E′, using
§§3.5,4.2,4.5. Sources: KPX Proposition 6.2.8, pp.58–59, Lemma 4.3.5, p.40, and the character-specialization
and duality comparisons above. No family triangulation or de Rham weight condition supplies this hypothesis.

**Checks.**

- In the polynomial toy model of §2.4, `ψ`-fixed constants do not generate `U`; the arithmetic and
  double-vanishing hypotheses are indispensable.
- If one `ψ` cokernel is nonzero, the stated perfect duality conclusion cannot be invoked by checking only the
  other module.
- The annular ring admits denominators unavailable on the whole weight disc, so the tensor factor cannot be
  deleted.
- A rank-two trianguline module can have rank-one localized subobjects; the nontrianguline vanishing criterion
  does not apply to it.
- For `p=3`, `E=ℚ₃`, `L=ℚ₃(ζ₃)` and an order-three character `η:Γ→μ₃(L)` trivial on the order-two
  torsion, put `V=Res_(L/E)L(η)` and `M=R_E⊗_E V`, with φ fixing V. Over L its character lines η and η⁻¹
  are exchanged by `Gal(L/E)` and have nonalgebraic ratio, so no rank-one subobject of `M[1/t]` descends to
  E. Nevertheless `M^{φ=1}` contains V, and residue adjunction injects it into
  `Hom_E(M*/(ψ−1),E)`, so that dual cokernel is nonzero. The geometric hypothesis excludes this example.

### 5.6a De Rham differential-equation realization

For any finite-dimensional de Rham E-representation `V` of `G_K`, construct `deRhamDiffEq V = N_dR(V)` as the
unique rank-d `(φ,Γ)`-stable differential-equation module inside `D_rig(V)[1/t]` whose sufficiently deep
cyclotomic localizations are `K_n[[t]]⊗_K D_dR(V)` with their coefficient/embedding factors. The lattice here
uses the **unfiltered** `D_dR` space; the filtered lattice defines `D_rig(V)`, and they are not identified.
The connection induced by `Γ` satisfies `∂N_dR⊆N_dR`, with its Frobenius and `Γ` compatibilities. Prove rank,
t-localization equality, uniqueness, tensor, dual, field/coefficient change and twist laws, and the lattice
containments for bounded Hodge–Tate weights. Sources: Berger-intro §IV.4, especially §IV.4.1,
manuscript pp.29–30, and Berger-diffeq Theorem 5.10 for the construction proof; Berger-exp-2003 §II
for the crystalline exponential specialization; Colmez-GL2 §VI.4 and §§VIII.1–VIII.2 for the `ℚ_p`
realization used in §5.7. API: `deRhamDiffEq_rank`, `deRhamDiffEq_localize`,
`deRhamDiffEq_unique`, `deRhamDiffEq_connection`, `deRhamDiffEq_twist` and the cyclotomic localization square.
*Needs:* §§1.0–1.4, the de Rham period carriers and invariant functor, continuous cyclotomic localization and
its connection.

**Checks.**

- For `V=E` the module is the unit differential equation, with constant horizontal section 1 and zero
  connection on coefficients.
- For E(1), the unfiltered de Rham period is `t⁻¹e_1`; it is distinct from the original Tate basis in `D_rig`.
  Dropping the lattice distinction gives a wrong t-power in §5.7.
- Rank zero remains zero under localization. Tensoring two Tate twists adds their exponents and their
  connection weights.
- A non-de Rham representation does not satisfy the full-rank `D_dR` hypothesis; naming its period invariants
  does not construct a rank-d differential equation.

### 5.7 The local exponential and the all-level image condition

For every finite-dimensional continuous E-representation `V` of `G_K`, construct continuous
nonequivariant sections of the supplied fundamental sequence and its pullback
`0→ℚ_p→B_cris^{φ=1}⊕B_dR^+→B_dR→0`, with diagonal first map and difference map `(x,y)↦x−y`.
Tensor with `V` on the canonical period topologies and construct the continuous-cochain long exact
sequence. Its boundary defines `blochKatoExp V : D_dR(V)/Fil⁰→H¹(K,V)`, naturally in coefficients,
Tate twists and restriction/corestriction. Also construct the companion exact sequence
`0→ℚ_p→B_cris⊕B_dR^+→B_cris⊕B_dR→0`, with last map `(x,y)↦((1−φ)x,x−y)`,
its continuous sections and tensor-cochain long exact sequence. No de Rham hypothesis is needed for these
boundaries. Source: Bloch–Kato, Proposition 1.17 and Remark 1.18, pp.340–341.

Define `blochKatoHe V = ker(H¹(K,V)→H¹(K,B_cris^{φ=1}⊗V))`. Prove that the exponential boundary
has image `H¹_e`. This local construction is needed here because a finite local condition `H¹_f` alone does not supply `H¹_e`. Sources: Berger-intro §II.3.4 and §V.2, p.35, and the original
exponential comparison in Berger-exp-2003 §II, pp.11–18. API: naturality, finite-extension
restriction/corestriction, the image equality and the period-lattice criterion. No equality `H¹_e=H¹_f` is
imposed in general.

Now specialize to `K=ℚ_p` and the Dospinescu–Le Bras setting: `π` is a supercuspidal smooth `GL₂(ℚ_p)`
representation with trivial central character, `Π` is an absolutely irreducible admissible unitary Banach
completion with smooth part `π`, and `V` is its absolutely irreducible two-dimensional de Rham representation
with weights (0,1) in their convention, hence `(−1,0)` in the standing Hodge–Tate convention, and determinant
`χ`. For the generation consequence explicitly assume
`geometricallyNontriangulineLocalized (D_rig(V))`, including every finite coefficient extension; deriving
this stronger hypothesis from local Langlands data requires a theorem at the correspondence's owner.
Define `allLevelExponentialImage V` as the
`ψ`-fixed classes whose integrations at every sufficiently deep cyclotomic level belong to `H¹_e(K_n,V)`.
Using `N_rig(V)` from §5.6a, with its unfiltered de Rham lattice localization, prove that this condition is
exactly membership in `(tN_rig(V))^{ψ=1}`. Applying `1−φ` is injective here. Use the containment
`tN_rig(V)⊂D_rig(V)` in these weights (DLB §6, inclusions following Definition 6.7, p.360) and identify
`D_rig(V)^{φ=1}` with `V^{H_{ℚ_p}}` by the étale period comparison. Since `H_{ℚ_p}` is normal, that fixed
subspace is a Galois subrepresentation. Absolute irreducibility makes it zero or `V`; the latter would make
`V` an absolutely irreducible two-dimensional representation of the abelian group `Γ_{ℚ_p}`, which is
impossible. This uses `H_{ℚ_p}-invariants`, not `G_{ℚ_p}-invariants`. It identifies its image with
`(1−φ)(tN_rig(V))^{ψ=1}`. Sources: Colmez-GL2 Propositions VI.4.13 and VI.4.15 and Remark VI.4.14, printed
pp.435–436, Lemma VI.4.16, p.437, and §VIII.2 with Lemma VIII.2.1 and Theorem VIII.2.2, pp.502–503, for the
localization/exponential comparison; DLB Theorem 1.9, p.333, Theorem 8.3, pp.368–369, and §12.1, p.398. The
proof compares the localized Iwasawa cocycle with the Bloch–Kato connecting map: the exponential-image
condition kills the negative/constant obstruction in the de Rham localization, which is precisely the
`tN_dif^+` condition at all sufficiently deep levels. The differential-equation localization then recovers
`tN_rig`.

For the generation consequence of §5.6 with `M=tN_rig(V)`, verify both cokernels by its
geometric criterion: for every finite `E′/E`, one has
`(M⊗_E E′)[1/t]=(D_rig(V)⊗_E E′)[1/t]`, so the same absence of rank-one subobjects applies to M.
This supplies the annular
generation statement with its scalar extension. It does not supply a GL₂ involution, its semilinearity or its
radius estimates. API: `allLevelExp_iff_tNrig`, `allLevelExp_oneSubPhi_injective`,
`tNrig_psiCokernels_vanish`, and `tNrig_annularGeneration`.

**Checks.**

- For `V=0`, both the exponential image and all-level condition vanish.
- A diagonal scalar pair maps to zero under `x−y`; reversing the difference reverses the boundary sign.
  Tensoring a Tate twist or changing E commutes with this same boundary and the continuous sections.
- For `V=ℚ_p, D_dR/Fil⁰=0` and `H¹_e=0`, while `H¹_f` contains the unramified class; replacing `H¹_e` by
  `H¹_f` changes the condition.
- For `V=ℚ_p(1)`, the exponential image is the unit/logarithmic local condition, not the class of a
  uniformizer.
- Omitting the factor t would allow a nonzero constant de Rham obstruction; the all-level localization test
  excludes it.
- A trianguline or arbitrary de Rham rank-two representation is not automatically in the specified
  supercuspidal setting.
- The Tate basis is `φ`-fixed and corresponds to a nonzero `H_{ℚ_p}`-fixed vector of `ℚ_p(1)`, although
  `ℚ_p(1)` has no `G_{ℚ_p}`-fixed vector. Confusing these two groups gives a false injectivity proof; rank-two
  absolute irreducibility is essential in the stated argument.

### Examples

At the trivial character, a derived specialization of the `ψ` complex recovers degree-zero invariants through
Tor. At a nonquadratic finite character, the inverse twist and the pairing involution can both be checked
directly. The trivial representation distinguishes `H¹_e` from `H¹_f`, explaining why the analytic image
condition needs the exponential rather than just a finite local condition.

### Dependencies

Layers 1–4, independent Iwasawa and Shapiro contracts, the de Rham differential-equation and fundamental
period exact-sequence contracts. The all-level application uses the original exponential-image argument and
checks both `ψ` cokernels separately before its annular generation consequence.

## Layer 6: specialized Wach interfaces

### 6.0 Wach modules and filtered crystalline reduction

For finite unramified `F/ℚ_p`, a crystalline E-representation `V` and a `G_F`-stable `O_E` lattice `T`,
construct the rational `wachModule V = N_F(V)` and the embedded integral lattice
`wachLattice T = N_F(T)=N_F(V)∩D(T)` inside the positive period realization. Fix a bounded weight
interval and twist to the positive convention. Impose finite freeness over `E⊗B_F^+` rationally and
`O_E⊗A_F^+` integrally, trivial `Γ` action modulo `π` and the
q-height bound, with `q=φ(π)/π`; untwist with the specified lattice. The `φ`-linear `ization` is invertible
after the required `q` or `π` localization, not necessarily over the positive ring. Prove existence,
uniqueness inside `D(V)` and `D(T)` respectively, reconstruction of the lattice/representation, tensor,
dual and interval-twist laws. Identify `wachLattice T[1/p]` with `wachModule V` and construct the canonical
filtered comparison `D_cris(V) ≅ N(V)/πN(V)`, with
filtration `Fil^i N(V)={x∈N(V) : φ(x)∈q^i N(V)}` in the applicable twisted convention and the induced filtration
on reduction. The crystalline Frobenius and coefficient Frobenius are retained. Sources: Berger-Wach-2004
Proposition II.1.1, §§II–III and Proposition III.4.2, with the cited errata; Theorem III.4.4 and
Corollary III.4.5, manuscript p.22, for the filtration; LLZ-2011 §2C. API:
`wachModule_exists`, `wachModule_unique`, `wachModule_reconstruct`, `wachModule_tensor`, `wachModule_twist`,
`wachModule_dcris`, `wachModule_exist` (the existence adapter), `wachModule_height`,
`wachLattice_reconstruct`, and the rationalization/intersection comparisons. The specialized base changes
and good-basis coordinates are §§6.1–6.2.

**Checks.**

- The trivial lattice has the standard positive rank-one module, trivial `Γ` reduction and height zero; its
  filtered reduction has only jump zero.
- For `T=O_E(r)`, the crystalline basis `t^(−r)e_r` has Frobenius `p^(−r)`, whereas the Tate basis of its
  Robba realization is `φ`-fixed. The interval twist must reproduce both conventions.
- For `V=ℚ_p(−1)`, put `n=πe_(−1)`. Then `φ(n)=qn`, so the image of `n` lies in
  `Fil¹(N(V)/π)` and spans it, matching `Fil¹ D_cris(V)=D_cris(V)`. Using `qφ*N=q²N` would lose it.
- Replacing `T` by pT scales its embedded Wach lattice by `p` while leaving `N(V)` unchanged after
  rationalization.
- A noncrystalline de Rham representation is excluded; a finite ramified `F` is outside this unramified Wach
  construction.
- Height alone does not assert that an arbitrary positive sublattice is `ψ`-stable. The `ψ`-fixed containment
  used in §6.3 has its own hypotheses.

### 6.1 Unramified base and coefficient change

Let `F/ℚ_p` be finite unramified, `V` crystalline over `F` with a `G_F`-stable finite `O_E` lattice `T`, and
`F′/F` finite unramified. Construct `wachUnramifiedBaseChange` as the canonical comparison
`A_{F′}^+⊗_{A_F^+}N_F(T) ≅ N_{F′}(T|G_{F′})`, with the corresponding rational comparison. Prove its embedding
into the period realization, `Γ` and `φ` compatibility, transitivity, tensor/twist compatibility and
compatibility with filtered reduction modulo `π`. Finite base extension makes the displayed tensor complete;
do not replace it by an arbitrary infinite unramified completed union. Source: Berger-Wach-2004 Proposition
II.1.1, pp.11–13, and Proposition III.4.2, p.21, using uniqueness of the Wach module of §6.0. No ramified-base
version is asserted. API: `wachUnramifiedBaseChange`, `wachUnramifiedBaseChange_trans`,
`wachUnramifiedBaseChange_dcris`, `wachUnramifiedBaseChange_lattice`.

For a finite flat map `C→C′` of integral coefficient rings for which the finite-free Wach category of §6.0 and
its height interval are defined, construct `wachCoefficientBaseChange : C′⊗_C N(T) ≅ N(C′⊗_C T)`; in
particular this includes `O_E→O_{E′}` for a finite coefficient field extension. Check freeness, trivial `Γ`
reduction and the q-height conditions after flat scalar extension, then use uniqueness inside the period
realization. After rationalization obtain the corresponding comparison for `N(V)`, `D_cris(V)` and their
filtered identification. Prove compatibility with unramified field extension through the commuting square of
the two scalar changes, and with compositions and interval twists. These are consequences of the same Wach
uniqueness theorem and the supplied finite coefficient comparison; an arbitrary nonflat map does not preserve
the height and kernel conditions by this argument.

**Checks.**

- Extending coefficients and then extending `F` gives the same embedded Wach lattice and filtered reduction as
  performing the operations in the opposite order.
- For `F′=F` the map is the identity, not a choice of a new basis.
- For the trivial lattice the map is the scalar extension of `A_F^+⊗O_E` and reduces to the usual unramified
  `D_cris` scalar extension.
- An unramified tower F″/`F′/F` gives the same comparison by either route.
- A ramified extension is outside this theorem; uniqueness over the stated unramified positive rings does not
  prove its analogue.

### 6.2 Good bases and ψ-zero coordinates

Here `p` is **odd**, `K=ℚ_p`, and `E/ℚ_p` is finite. For any crystalline `V` and stable `O_E` lattice `T`,
construct `wachGoodBasis_integral_exists`: there is a basis `n_i` of `N(T)` such that `(1+π)φ(n_i)` form a
`Λ_{O_E}(Γ)`-basis of `(φ*N(T))^{ψ=0}`. The basis can be chosen congruent modulo `π` to any given basis of
`N(T)`; this does not assert that an arbitrary `O_E` basis of `D_cris(V)` lifts integrally. Source: LLZ-2010
Theorem 3.5 and proof, manuscript pp.10–12. Normalize the constant Frobenius matrix, lift a near-identity
basis through the `ψ`-zero coordinate map, and use the small `Γ` operator estimates to prove generation and
independence.

For the prescribed rational crystalline-basis version `wachGoodBasis_exists`, define positivity by
`Fil⁰D_cris(V)=D_cris(V)`. In the standing convention this means weights `0≤s_1≤⋯≤s_d`; LLZ-2011 §1.3.4
and §2.1 label these by their negatives, `−s_d≤⋯≤−s_1≤0`. For any E-basis `ν_i` of `D_cris(V)`, choose
an `E⊗B^+` basis `n_i` of `N(V)` lifting
it such that `(1+π)φ(n_i)` form a `Λ_E(Γ)`-basis. After scalar extension the same vectors give a
distribution-algebra basis of `(φ*N_rig(V))^{ψ=0}`. Sources: LLZ-2011 Proposition 2.11, Theorem 2.12 and
Corollary 2.13, p.1115. Record separately the original twisted formulation in LLZ-2010 Lemma 3.15, manuscript
pp.12–13: for a positive V with standing weights `0≤r_1≤⋯≤r_d`, source labels
`−r_d≤⋯≤−r_1≤0` and `m=Σr_i`, lifts `n_i` can be chosen so that
`(1+π)φ(π^{−m}n_i⊗e_m)` form a basis of `(φ*N(V(m)))^{ψ=0}`. Those vectors belong to the twisted module; they
are not identified with coordinates for `V`. The Tate twist has the same meaning in both conventions:
`V(m)` has standing weights `r_i−m`, while its source labels are `m−r_i`. The global hypothesis `p` odd
in both LLZ papers is retained.

Define `wachPsiZeroCoordinates` only from a chosen good basis, and prove inverse, coefficient extension,
analytic extension and the matrix basis-change formula. If `n′=Bn`, the Frobenius vectors change by `φ(B)`, so
the coordinate map uses the inverse induced `ψ`-zero basis matrix. An arbitrary Wach basis is not asserted
good; LLZ-2011 Remark 2.14, p.1116, records that stronger claim as conjectural. API: `wachGoodBasis_exists`,
`wachGoodBasis_integral_exists`, `wachPsiZeroCoordinates`, `wachCoordinates_basisChange`,
`wachCoordinates_analytic`.

**Checks.**

- For the trivial rank-one lattice the standard coordinate vector `(1+π)φ(e)` is the unit-supported `ψ`-zero
  generator.
- A scalar basis change `n′=bn` with constant `b∈O_E^×` changes the vector by `b` and its coordinate by `b⁻¹`.
- A nonconstant `B` changes Frobenius vectors by `φ(B)`, not `B`; omitting `φ` gives a wrong coordinate
  matrix.
- At `p=2` the odd-prime basis proof is not invoked; full `Γ` is not procyclic and its chosen generator
  argument needs a separate theorem.
- The trivial line has weight zero and `Fil⁰D_cris=D_cris`, so it is positive. The line `ℚ_p(1)` has
  standing weight `−1` and `Fil⁰D_cris=0`, so it is not positive; `ℚ_p(−1)` has standing weight `+1`,
  source label `−1`, and is positive.
- For a positive line of standing weight r, the original twisted formulation has `m=r`, so `V(m)` has
  weight zero and its Wach basis is `π^(−r)n⊗e_r`; the twist changes the lattice and crystalline basis.

### 6.3 Wach vectors in integral Iwasawa cohomology

Let `F/ℚ_p` be finite unramified, `V` crystalline, `T` a stable finite `O_E` lattice. Use the weight
convention of Berger-exp-2003 Appendix A: if its weights lie in `[a,b]`, then `D(V)^{ψ=1}⊆π^{a−1}N(V)`, and if
`V` has no quotient `ℚ_p(a)`, then `D(V)^{ψ=1}⊆π^aN(V)`. State the lattice form with the same integral
embedding. This is Berger-exp-2003 Theorem A.3 and proof, pp.26–27. The proof estimates `ψ` on pole terms
`π^{−m}`, decreases the pole of a `ψ`-fixed vector, and identifies a surviving residue obstruction with the
forbidden quotient. The no-quotient hypothesis is used precisely at that last step.

In the `a=0` case with nonnegative weights in that convention and no trivial quotient, prove
`wachIwasawaFixed`:
`N(T)^{ψ=1}=D(T)^{ψ=1} ≅ H¹_Iw(F,T)`,
where `ψ` on `N(T)` is the restriction justified by the embedding and the source's integral result. Construct
`wachIwasawaOneSubPhi` into `(φ*N(T))^{ψ=0}`, using `N(T)⊆φ*N(T)` in this convention and `ψ(1−φ)x=0`. The last
identification is §5.1, not a definition of `H¹_Iw`. Source: Berger-exp-2003 Theorem A.3, pp.26–27; LLZ-2011
§3A, p.1116, for the `ℚ_p` coordinate interface. When good-basis coordinates of §6.2 are used, retain `p` odd
and its normalization; the containment theorem itself has its stated unramified scope. API:
`wachPsiFixed_containment`, `wachIwasawaFixed`, `wachIwasawaOneSubPhi`, lattice/rational and unramified
base-change comparisons.

**Checks.**

- With `a=0` and no trivial quotient, the improved containment lands in `N(T)`, rather than merely `π⁻¹N(T)`.
- A trivial quotient is excluded from the improved theorem; the general `π^{a−1}` bound remains the assertion
  available without it.
- Scaling `T` by `p` scales `N(T)` and its embedded `ψ`-fixed vectors by `p`; the integral equality remembers
  the lattice.
- On a `ψ`-fixed vector `x, ψ((1−φ)x)=x−x=0`. The sign agrees with the image in §5.7, while the generation
  theorem's `φ−1` differs by the unit `−1`.

### Examples

Constant basis change gives a computed inverse coordinate factor. A nonconstant basis change explains why
`φ(B)` appears. The two pole bounds show where the no-trivial-quotient condition enters the Iwasawa interface,
independently of the existence of a Wach module.

### Dependencies

Layers 1,2 and 5; the Wach and crystalline comparisons of §6.0. Good-basis coordinates have the odd-prime
restriction of their original sources; no dyadic extension is inferred from rational averaging.

## Layer 7: characters, weights and global triangulations

### 7.1 Character lines over K

Let `A` be an affinoid E-algebra with `E` containing all embeddings `Σ=Hom(K,E)`. For a continuous `δ:K^×→A^×`
construct `characterModule K A δ`, a rank-one `R_{A,K} (φ,Γ_K)`-module. Locally split `δ` into its unit-valued
factor and an unramified factor. Realize the first through local reciprocity and `relativeDrig`; realize the
second by the cyclic Frobenius module `D_{f,a}`, where `f=[K₀:ℚ_p]` and a is its uniformizer value, then
tensor the two. Prove independence of the chosen uniformizer. Embeddingwise algebraic characters are special
cases of this construction. It is not defined by the `ℚ_p` coordinate formula at every ramified `K`. Prove
tensor, unit, dual and coefficient/field-change laws, compatibility with §3.5 when `K=ℚ_p` and with rank-one
representations when `δ` corresponds to one. Sources: KPX Construction 6.2.4, Definition 6.2.5, Example 6.2.6
and Notation 6.2.7, pp.56–58; Ding §2.1, p.9. API: `characterModule_mul`, `characterModule_inv`,
`characterModule_baseChange`, `characterModule_reciprocity`.

For `x_σ:K^×→E^×` the embedding character, construct the principal ideals `(t_σ)` as submodules
`embeddingPeriodIdeal σ = R(x_σ)` with their canonical equivariant inclusions. Prove the ideals for distinct
`σ` are comaximal and their product is (t); the generators themselves are chosen only up to units. Set
`ε=N_{K/ℚ_p}|N_{K/ℚ_p}|`, so the Tate line is `R(ε)`. API: `embeddingPeriodIdeal_comaximal`,
`embeddingPeriodIdeal_prod`, `characterModule_algebraic`, and the Tate-line comparison. Source: KPX Example
6.2.6, pp.57–58, and Ding §2.1, p.9.

For these individual `σ-factor` quotients, prove `embeddingPeriodQuotientPerfect`: the Herr complex of
`M/t_σM` is perfect of amplitude `[0,2]`, compatible with derived affinoid coefficient change. Use the
t-quotient calculation of §4.2, the relative perfectness and base-change theorems of §§4.4–4.5, and the
just-constructed embedding ideals. Source: KPX Corollary 6.3.3, p.66. Do not assign these factors the sharper
single-t vanishing of §4.2 without a separate proof.

**Checks.**

- Over `ℚ_p, δ=x|x|` gives `φ(e)=e` and `γ(e)=χ(γ)e`, whereas `δ=x` gives `φ(e)=pe`.
- An unramified character with `δ(p)=a` gives `φ(e)=ae` and trivial `Γ` action in the `ℚ_p` case.
- `δ₁δ₂` corresponds to the tensor product and `δ⁻¹` to the ordinary dual; the Tate dual includes the extra
  `ε` factor.
- With a single embedding, `(t_σ)=(t)`. With two distinct embeddings, their ideals are comaximal and their
  product, not their sum, is (t).
- `δ=1` gives the unit line, while the ideal `tR⊂R` is a proper nonsaturated submodule in the Robba category
  before inverting t.

### 7.2 Field cohomology and rank-one submodules

For a finite coefficient field `E`, prove `characterModule_cohomology`: `H⁰(R(δ))` has dimension one exactly
if `δ=∏_σx_σ^{k_σ}` with all `k_σ≤0`; `H²` has dimension one exactly if `δ=|N|∏_σx_σ^{k_σ}` with all `k_σ≥1`;
otherwise the corresponding group vanishes. In all cases dim `H¹=[K:ℚ_p]+h⁰+h²`. Prove that every nonzero
`(φ,Γ_K)`-submodule of `R(δ)` is `∏_σt_σ^{m_σ}R(δ)` for unique `m_σ≥0`, with the corresponding character
shifted by those algebraic exponents. Sources: KPX Proposition 6.2.8 and Corollary 6.2.9, pp.58–59. API:
invariant generator, exceptional-character criteria, `rankOneSubmodule_exponents`, uniqueness and saturation
criterion.

The field-valued rank-one classification used here precedes family classification: after a finite coefficient
extension if needed to realize the required unramified slope, twisting makes a rank-one object étale, the
field representation equivalence and class field theory supply its character, and undoing the twist gives
`R(δ)`. Uniqueness of the parameter and of the invariant coefficient line descends the presentation to `E`, as
in §3.5 for `ℚ_p`, where it is used in §5.6. Source: the field case of KPX Lemma 6.2.13, p.61, preceding
Theorem 6.2.14; no global family theorem is required for that argument.

**Checks.**

- For `δ=1, h⁰=1,h²=0,h¹=[K:ℚ_p]+1`; for `δ=ε` the exceptional `H²` has dimension one instead.
- If a vector of algebraic exponents has one positive and one negative entry, neither exceptional criterion
  holds unless it separately satisfies its full sign condition; checking only the sum is wrong.
- The submodule `∏t_σ^{m_σ}R(δ)` equals the whole module exactly when every `m_σ=0`.
- Multiplication by t is injective but its quotient is t-torsion, so `tR` is not saturated in `R`; inverting t
  destroys that distinction.

### 7.2a Sen modules and polynomials over affinoid coefficients

For every finite-projective relative `(φ,Γ_K)`-module `M` over `R_{A,K}`, for any affinoid `A`, construct
`senModule M n` over `K_n⊗_{ℚ_p}A`, where `K_n=K(μ_(p^n))` and `n` is sufficiently large for a radius
model of `M`. On constant-rank components its rank is `rank(M)`. Construct its scalar-extension
identification with `(M/tM)^{φ=1}` over `K_∞⊗_{ℚ_p}A`, using the cyclotomic-factor decomposition of
`M/tM` and Frobenius transition maps. The normalized logarithm `log(γ)/log(χ(γ))`, for `γ` sufficiently
close to 1 and fixing `K_n`, with `χ(γ)≠1`, induces its `K_n⊗A`-linear Sen operator. Prove compatibility under deeper `n` and independence
of `γ`; the characteristic polynomial descends to `senPolynomial M ∈ (K⊗_{ℚ_p}A)[T]` by `Γ_K`
invariance. Its degree is the module rank on each component. Prove independence of the radius model and
of sufficiently deep `n`, arbitrary affinoid base change, and compatibility with direct sums and the
embedding decomposition after extending coefficients to contain the embeddings of `K`. For a character
line with parameter `δ`, write `d logδ=Σ_σ w_σ dσ` on a sufficiently small unit subgroup; the
embeddingwise operator is multiplication by `w_σ`, with the standing Hodge–Tate sign adapter. The construction applies before rank-one classification.
Sources: KPX Lemma 3.2.3, pp.28–29, Definition 6.2.11 and Lemma 6.2.12, pp.59–60. *Needs:* §§1.2,1.5
for radius models and cyclotomic localization; §7.1 for character-line comparison.

**Checks.**

- The unit line has zero operator and polynomial `T`; the rank-zero module has polynomial 1.
- The Tate character `x|x|` has Sen label `+1` and polynomial `T−1`; its Hodge–Tate weight in the
  standing convention is `−1`.
- Over `A=E[ε]/ε²`, the character `δ(u)=1+ε log(u)` on small `ℚ_p` units has operator `ε` and polynomial
  `T−ε`. Reduction gives `T`, but does not determine the polynomial before reduction.

### 7.3 Weights over Artinian coefficients

For a finite local Artinian E-algebra `A` and a continuous character `δ:K^×→A^×`, define `CharacterWeights δ :
Σ→A` by the derivative on a sufficiently small unit subgroup:
`d logδ = Σ_σ wt_σ(δ) dσ`.
Prove existence and uniqueness using the decomposition of `K⊗_{ℚ_p}E`, additivity under products, negation
under inverse and compatibility with coefficient reduction. Define `IsConstantCharacter` by factorization of
`δ` through `E^×→A^×`. This concerns variation in coefficients, independently of local constancy on `K^×`. Its
API includes closure under product and inverse and preservation by E-algebra coefficient maps; a nonfaithful
map may turn a nonconstant character into a constant one. Define `IsAlgebraicCharacter` by `δ=∏x_σ^{k_σ}` with
integers `k_σ`, `IsSmoothCharacter` by open kernel on units, and `IsLocallyAlgebraicCharacter` as their
product. Prove local algebraicity exactly when every `wt_σ` is the image of an integer in `A`; equality only
after passing to `A/𝔪` is insufficient. For the converse, divide by the indicated algebraic character, use the
logarithm on a sufficiently small unit subgroup, and note that a zero derivative makes the remaining logarithm
zero; the exponential is injective on that small neighborhood, giving an open kernel. This works in the full
finite-dimensional E-algebra `A`, including its nilpotents. Sources: BHS Notation, p.308, for affinoid
coefficient-valued weights; KPX Lemma 6.2.12, p.60, for the Sen comparison; Ding §2.1, PDF pp.9–10, for
reciprocity and algebraic-character conventions. API: `characterWeight_mul`, `characterWeight_algebraic`,
`characterWeight_smooth`, `locallyAlgebraic_iff_integralWeights`, and `characterWeight_sen`. The Sen
comparison uses §7.2a and states explicitly that the Hodge–Tate sign convention assigns the opposite
sign to the exponent labeling of the Tate character.

**Checks.**

- `δ=x_σ^k` has weight `k` at `σ` and zero at the other embeddings.
- A finite-order E-valued character pulled back to `A` is both constant and smooth, with every weight zero
  even when its finite part is nontrivial. The E-valued character `x_σ` pulled back to `A` is constant but is
  not smooth.
- The infinitesimal character below is nonconstant; reduction modulo `ε` makes it constant, so constancy is
  not reflected by arbitrary coefficient reduction.
- For `A=E[ε]/ε²` and `δ(u)=1+ε` log(u) on small `ℚ_p` units, the weight is `ε`. Its residual character is
  trivial but it is not locally algebraic.
- The character `x|x|` has derivative weight `+1` over `ℚ_p`; its associated Tate representation has
  Hodge–Tate weight `−1` in the standing convention.

### 7.4 Classification of rank-one families

For any rigid E-analytic `X`, including nonreduced `X`, and a rank-one `R_{X,K}` module `M`, prove
`rankOneFamilyClassification`: there is a unique continuous `δ:K^×→Γ(X,O_X)^×` and a line bundle `L` on `X`,
unique up to isomorphism, with `M≅R_{X,K}(δ)⊗L` and trivial `φ,Γ` action on `L`. The intrinsic `L` is
`H⁰(M(δ⁻¹))`; evaluation gives the isomorphism. Source: KPX Theorem 6.2.14, pp.61–62, with Definition 6.2.15
and §§6.2.16–6.2.20, pp.62–64. Over a finite local Artinian algebra `L` is free, but a global trivialization
is not canonical.

For a coefficient field `E`, prove `characterModule_deRham_iff_locallyAlgebraic`: `R_{E,K}(δ)` is de Rham
exactly when `δ` is locally algebraic. Use the actual de Rham period functor and its full-rank dimension
criterion, transported along the Galois B-pair comparison of §1.6, rather than defining de Rham by integral weights.
Prove the labelled field character criterion here from the supplied de Rham periods and their full-rank
dimension criterion. To apply it to a possibly non-étale Robba line, separate an unramified slope factor: this
factor has a trivial de Rham realization, while the remaining unit-valued parameter extends by reciprocity to
a Galois character. Locally the algebraic factors have periods `t_σ` to the corresponding integer powers;
after dividing by those factors a de Rham character has finite inertia image, which gives the smooth factor.
Sources: Ding §2.1, PDF p.9; BHS Lemma 3.3.6, pp.345–346, for the de Rham realization and its weight operator.
The criterion is for field coefficients; the nilpotent-sensitive family statements still require the full
weight and graph arguments above. API: the criterion, labelled filtration jumps, coefficient field extension
and compatibility with products and duals.

Construct `rankOneParameterGraph` inside `X×W_{K^×}` as the intersection of the cohomological supports of the
two Tate-dual `H²` modules controlling the parameters of `M` and `M^∨`. Derived base change and field duality
identify its points with the unique field parameter. Artinian devissage identifies the formal fibers and their
tangent directions. Prove the projection is locally an isomorphism and **quasicompact** before concluding it
is an isomorphism: on an affinoid `X` bound the uniformizer value and the logarithmic parameter; use
`senPolynomial M` from §7.2a and a `p^m` power on a small unit subgroup to bound the remaining finite-order
ambiguity. A
bijection on rigid points by itself is insufficient. The graph proof is KPX §§6.2.15–6.2.20, pp.62–64; Example
6.2.21, p.65, is the negative control for removing the quasicompactness step. API: `rankOneParameter_unique`,
`rankOneLineBundle`, `rankOneEvaluation_iso`, `rankOneParameter_baseChange`, `rankOneGraph_quasicompact` and
gluing.

**Checks.**

- For field coefficients an algebraic character, a ramified finite-order character and any unramified slope
  character give de Rham lines; crystallinity does not follow for the ramified finite-order example. A
  small-unit character with nonintegral derivative weight gives a line that is not de Rham.
- `R(δ)` has parameter `δ` and coefficient line `O_X`, with the displayed evaluation map.
- `R(δ)⊗L` for a nontrivial line bundle `L` has the same parameter but is not asserted globally free.
- Over `E[ε]/ε²` the infinitesimal character of §7.3 is recovered, not just its residual parameter.
- A locally isomorphic parameter graph with infinitely many escaping weight components does not satisfy the
  required quasicompactness proof.

### 7.5 Saturated and strict triangulations

Define `Triangulation M` of a rank-d relative module as a `φ,Γ`-stable filtration `0=Fil₀⊂Fil₁⊂⋯⊂Fil_d=M` by
finite-projective submodules with finite-projective quotients and rank-one graded pieces `R(δ_i)⊗L_i`.
Saturation is the condition on the quotient in this category, not just injectivity. At a field point define
`StrictTriangulation` by the uniqueness of the successive enlargement with the ordered parameter, equivalently
dim `H⁰((M/Fil_i)(δ_{i+1}^{−1}))=1` at every step. Define `DenselyStrictlyTrianguline` using global ordered
`δ_i` and a subset Z of closed points which is dense on some admissible affinoid cover. This density is
stronger data than an unspecified closure assertion but does not assert density in every affinoid subdomain.
Sources: KPX Definitions 6.3.1–6.3.2, pp.65–66. API: filtration restriction and coefficient pullback when
saturation is preserved, graded parameters/line bundles, strict uniqueness, and the good-locus specialization
maps.

**Checks.**

- A rank-one module has its single-step triangulation and is strict.
- A split rank-two module with repeated parameter can have multiple flags and `H⁰` of dimension greater than
  one; a supplied split flag need not be strict.
- `tR⊂R` fails the quotient projectivity condition, although it is a `φ,Γ`-stable injective map.
- The rank-zero filtration is empty. A global dense subset need not remain dense in every affinoid subdomain,
  so the specified admissible cover is retained.

### 7.6 Fitting blowups and perfect-complex flattening

For a reduced rigid `X` and a coherent ideal `I` which is nonzero on every irreducible component, construct
`analyticFittingBlowup X I`. On an affinoid Sp `A` with generators `f₀,…,f_n`, form the finite-type Rees
algebra `⊕_{m≥0}I^m` and its projective charts, using the degree-zero parts after homogeneous localization.
Equivalently each chart is the subalgebra `A[I/f_i]` of `A[1/f_i]`, so the `f_i`-torsion is removed; simply
imposing `f_iy_j=f_j` without that saturation is not the chart. Analytify these finite-type charts over `A`,
including their needed affinoid covers, using the supplied relative analytification, and glue by the localized
transition isomorphisms. Prove properness by the projective embedding, birationality off V(I), the invertible
transform `I·O_Y`, and the universal property for morphisms on which `I` becomes invertible. Ordinary
base-change compatibility is asserted for flat morphisms. For a morphism of reduced spaces which sends every
component dominantly onto a component of `X`, define the **dominant transform** of the fiber product as the
closure of its inverse image over X∖V(I), discarding ideal-power torsion on the Rees charts. This transform,
rather than the full fiber product, is the blowup of the extended ideal: both are the closure of the identical
open chart in the localization by `f_i`. Source: the construction used in KPX Corollary 6.3.6, pp.67–68, with
this qualification on its base-change language; the Rees-chart proof and its universal property supply the
geometric carrier needed there.

For `φ:C→D` between locally free coherent sheaves, assume its cokernel has constant generic rank `r` on `X`.
Blow up `Fitt_r(cokerφ)`. Prove that the pullback map has locally free image. Under a further morphism
`g:Z→Y`, retain this conclusion when the local non-zero-divisor generator of the blown-up Fitting ideal
remains a non-zero-divisor on Z. This includes flat g, and morphisms between reduced spaces sending every
irreducible component dominantly onto a component: the generator remains nonzero at each generic point. Under
this condition the pulled-back maximal-minor columns remain an independent generating set for the image.
Arbitrary pullback of the image as an abstract locally free sheaf is always locally free, but need not be the
image of the pulled-back map. The algebraic step is KPX Lemma 6.3.5(3), pp.66–67: `Fitt_{r−1}=0` and an
invertible non-zero-divisor generator of `Fitt_r` force the image to be free, by the adjugate identity for a
maximal nonzero minor. The unrestricted further-pullback assertion in KPX Corollary 6.3.6(1), p.67, requires
this qualification, as the dual-number example below shows. The generic-rank criterion and free-summand shift
use the native Fitting ideal API; no new Fitting-ideal carrier is defined.

For a bounded-above locally free complex with constant generic ranks of its cohomology and cokernels,
construct the descending sequence of these blowups on its differentials. Prove dependence only on the
quasi-isomorphism class, ordinary compatibility with flat base change and gluing on affinoids. For
componentwise dominant base change use successive dominant transforms, as just defined. Source: KPX Corollary
6.3.6(1–2), pp.67–68, with its dominant-base-change assertion interpreted through those transforms; an
unrestricted ordinary fiber-product assertion is false. Every step is a modification of reduced spaces,
componentwise dominant over the preceding step; hence the non-zero-divisor condition just established
preserves the flat images already obtained. In the bounded `[0,2]` situation the finite sequence makes `H⁰`
locally free and `H¹,H²` of Tor dimension at most one. Include the corresponding `M/t_σ` complexes from §7.1.
API: `analyticFittingBlowup_universal`, `fittingBlowup_flatImage`, `perfectFlattening`,
`perfectFlattening_quasiIso`, `perfectFlattening_flatBaseChange` and `perfectFlattening_dominantTransform`.

**Checks.**

- Blowing up the unit ideal is the identity. Blowing up an invertible nonzero ideal is also the identity; an
  already locally free image needs no modification.
- For `A=E⟨X,Y⟩`, the chart with `f_i=X` is the algebra A[Y/X] inside A[1/X]; retaining an extra X-torsion
  component from a naive equation gives a wrong blowup.
- For the map A `--X→ A`, the cokernel has generic rank zero and `Fitt₀=(X)`; its invertible-ideal blowup is
  the identity and its image (X) is locally free, although the cokernel `A/(X)` is not flat.
- Pulling A `--X→ A` back along `A=E⟨X⟩→B=E[ε]/ε², X↦ε`, gives image `(ε)`. This B-module has length one, so
  cannot be free over the local length-two ring `B`; being finite, it is not flat. Thus even after the
  identity blowup of the principal ideal (X), arbitrary further pullback need not have flat image. The same
  obstruction appears over `ℤ→ℤ/4ℤ` for multiplication by 2: the image is `(2)`, a length-one module over a
  length-two local ring, and is not flat.
- A zero divisor generating the relevant Fitting ideal does not meet the adjugate criterion's non-zero-divisor
  hypothesis.
- For `A=E⟨X,Y⟩` and the dominant map to `B=E⟨X,T⟩` with `Y↦XT`, the ideal (X,Y) extends to (X), whose blowup
  is the identity. The ordinary pullback of the X-chart has equation `X(U−T)=0` and an extra component `X=0`.
  Its dominant transform has `U=T` and agrees with the identity blowup. This disproves ordinary compatibility
  with all dominant nonflat maps.
- Pullback to a closed non-dominant fiber can change generic rank; it need not even satisfy the componentwise
  dominant-transform hypothesis.

### 7.7 A global rank-one quotient

Let `X` be reduced and `M` a rank-d relative module, `δ` a global continuous parameter. Suppose a subset Z
dense on an admissible affinoid cover consists of points z where `H⁰(M_z^∨(δ_z))` is one-dimensional and every
basis vector induces a saturated inclusion `R(δ_z^{-1})→M_z^∨`. Construct `globalRankOneQuotient`: a proper
birational `f:X′→X` of reduced spaces, a coefficient line `L` and a canonical map, up to its scalar
automorphisms,
`λ:f*M→R_{X′,K}(δ)⊗L`.
Its kernel is finite projective of rank `d−1`. Its cokernel is locally killed by a power of t and supported on
a closed bad locus disjoint from `f⁻¹Z`; on the complement `λ` is a surjection and its dual spans the required
`H⁰`. For a smooth rigid curve `X` one can take `X′=X`. Source: KPX Theorem 6.3.9, pp.68–70.

The construction first normalizes and treats connected normal components, so generic ranks are constant. Apply
§7.6 to `M^∨(δ)` and its `t_σ` quotients: `H⁰` becomes a line bundle, `H¹,H²` have Tor dimension at most one,
and the fiber `H⁰` injection has cokernel `Tor₁(H¹,κ(z))`. Its Fitting support, together with the vanishing
loci of maps to `H⁰` modulo `t_σ`, gives the closed bad locus. Dualize evaluation to obtain `λ`. The field
rank-one submodule classification bounds the cokernel by a power of t locally on an annulus; Frobenius
propagates a uniform local bound through the radii. Finally flatten its presentation so the kernel is
projective of rank `d−1`. This last modification is necessary; a pointwise rank count alone does not construct
a subbundle. API: `globalRankOneQuotient_kernel`, `globalRankOneQuotient_badLocus`,
`globalRankOneQuotient_tPower`, `globalRankOneQuotient_curve` and compatibility of the canonical construction
with dominant flat pullback (KPX Remark 6.3.11, p.72).

**Checks.**

- For an everywhere strict rank-one object, `λ` is its identity character-line presentation, with zero kernel
  and no bad locus.
- At a bad point, a t-power cokernel is allowed; calling `λ` a surjection on every fiber would strengthen the
  theorem falsely.
- For a smooth curve, the Fitting ideals involved are invertible on the relevant rank loci and the
  modification can be the identity, while special-fiber defects can still remain.
- A nonreduced `X` fails the hypothesis: residue-field tests cannot detect its infinitesimal obstruction.

### 7.8 Coherent triangulations and special fibers

Let `X` be reduced with irreducible connected components, and let `M` be densely pointwise strictly
trianguline of rank `d` with global ordered parameters `δ₁,…,δ_d` as in §7.5. Construct
`globalCoherentTriangulation`: a proper birational `f:X′→X` with `X′` reduced and a unique coherent
`φ,Γ`-stable flag whose graded pieces embed in `R(δ_i)⊗L_i`, with locally t-power-torsion cokernel. The first
graded piece is isomorphic to its character line. There is a closed bad locus disjoint from the inverse image
of the dense strict set; outside it the flag is a saturated strict triangulation with exactly the prescribed
parameters. For a smooth curve take `X′=X`. Source: KPX Corollary 6.3.10, pp.71–72. Construct this flag by
repeated application of §7.7 to the relevant dual quotient, recording the finite-projective kernel at each
step. Uniqueness is uniqueness of the coherent subobjects/flag with these properties, not of a basis or of all
possible subsequent modifications.

Separately, for any rigid E-analytic `X`, including nonreduced `X` and without the component hypothesis of the
preceding global-flag theorem, let `M` satisfy the dense strictness and global-parameter hypotheses of §7.5.
Prove `globalTriangulation_specialFiber`: every closed fiber is trianguline after saturation, with parameters
`δ_{i,z}` multiplied by embeddingwise integral algebraic characters. For the reduced global-flag setting
above, the exponents are zero on its good locus. To obtain the general fiber statement, pass to the reduction
and a normalization component through the point, apply the flag theorem there, and descend the saturated field
triangulation along the residue-field extension: the candidate character Hom spaces commute with finite field
extension, nonzero Hom spaces are reflected by faithful flatness, and the field submodule classification
identifies their saturations. Apply this argument successively to the quotients. At bad points the exponents
measure the zeros of the embedding-period ideals in the coherent graded pieces; the prescribed global
parameters need not remain the saturated parameters there. Source: KPX Theorem 6.3.13, p.72. API:
`globalFlag_unique`, `globalFlag_goodLocus`, `globalFlag_firstGrade`, `globalFlag_curve`,
`fiberSaturation_parameters` and compatibility with rank-one submodule exponents. Do not infer a globally
saturated flag on all of `X′`.

**Checks.**

- Rank one recovers §7.4 with its coefficient line bundle; the unique flag has one graded piece.
- An everywhere strict split family with distinct generic parameters has an empty defect locus when its chosen
  flag is already saturated.
- A coherent graded piece `t_σ^mR(δ)` has character `δx_σ^m`; its saturation in `R(δ)` has character `δ`.
  Saturation removes that factor, so preserving the unsaturated label gives wrong special-fiber weights.
- Repeated parameters can destroy strictness, so an arbitrary pointwise trianguline dense set does not meet
  the theorem's strictness hypothesis.
- The empty rank-zero filtration needs no modification and has no parameter list.

### Examples

The nilpotent character `1+εlog` distinguishes relative weight classification from a closed-point calculation.
A line bundle twist distinguishes parameter uniqueness from a global basis. The map A `--X→ A` distinguishes
flattening the image from flattening the cokernel. Finally `tR⊂R` exhibits exactly the defect which the
coherent global flag permits and the saturated good-locus flag excludes.

### Dependencies

Layers 1–5 for relative complexes, finite presentations, duality and derived fibers; the character-space and
coherent rigid-geometry contracts. The local rank-one field calculation used earlier requires only field slope
theory and class field theory. The geometric flattening construction precedes its use in the global quotient
and flag.

## Downstream consumers

Selmer and Iwasawa constructions use the native `ψ` complex and its independent tower comparison, with derived
character specialization. Regulator and explicit reciprocity constructions use the residue-normalized pairing
and the Wach coordinates with their stated lattice and prime restrictions. Trianguline deformation and
eigenvariety arguments use character lines, nilpotent-sensitive weights, coefficient line bundles, the proper
modification and the distinction between a coherent global flag and saturated special fibers. Analytic GL₂
applications may consume the all-level exponential criterion and annular generation, but must construct their
own involution and prove its semilinearity and radius control.

## References

Page numbers refer to the printed pages of the linked versions, except KPX, KL-I, KL-II, Berger's preprints
and LLZ-2010, where they are the numbered manuscript pages. No numerical residue constant is inferred from a
reported claim.

- **NSW** — Jürgen Neukirch, Alexander Schmidt and Kay Wingberg, *Cohomology of Number Fields*, second edition, [author electronic edition](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter II §4, Theorem 2.4.1, p.111, for continuous Hochschild–Serre.
- **ST-Fourier** — Peter Schneider and Jeremy Teitelbaum, *p-adic Fourier theory*, Documenta Mathematica 6 (2001), 447–481, [arXiv:math/0102012](https://arxiv.org/abs/math/0102012), §2, for locally ℚ_p-analytic compact abelian Fourier coordinates.
- **Liu** — Ruochuan Liu, *Cohomology and duality for (φ,Γ)-modules over the Robba ring*, [arXiv:0711.4346v2](https://arxiv.org/abs/0711.4346v2), especially Lemma 4.2, manuscript p.22 (the auxiliary pure extension used in the field ψ-finiteness induction).
- KPX — Kiran S. Kedlaya, Jonathan Pottharst and Liang Xiao, *Cohomology of arithmetic families of (φ,Γ)-modules*, [arXiv:1203.5718v3](https://arxiv.org/abs/1203.5718v3), 79 pages. This version fixes the target numbering used here, including Theorems 4.4.3–4.4.8 and §6.3.
- **KL-I** — Kiran S. Kedlaya and Ruochuan Liu, *Relative p-adic Hodge theory: Foundations*, [arXiv:1301.0792](https://arxiv.org/abs/1301.0792), the cleared manuscript with §§1.5, 3.2, 8.5–8.6 and 9.5. The corrected ASW and free-cover arguments use KL-II Appendix A.
- **KL-II** — Kedlaya and Liu, *Relative p-adic Hodge theory, II: Imperfect period rings*, [arXiv:1602.06899](https://arxiv.org/abs/1602.06899), Appendix A, manuscript p.189.
- **KL-families** — Kedlaya and Liu, *On families of φ,Γ-modules*, Algebra & Number Theory 4 (2010), 943–967, [publisher PDF](https://msp.org/ant/2010/4-7/ant-v4-n7-p06-s.pdf), especially §§3–5. The original relative realization is distinguished from a converse effectivity statement with smallness hypotheses.
- **CC-1998** — Frédéric Cherbonnier and Pierre Colmez, *Représentations p-adiques surconvergentes*, Inventiones Mathematicae 133 (1998), 581–611, [author manuscript](https://webusers.imj-prg.fr/~pierre.colmez/CCinv.pdf), §§III.2–III.5, numbered manuscript pp.16–24.
- **CC-1999** — Cherbonnier and Colmez, *Théorie d'Iwasawa des représentations p-adiques d'un corps local*, Journal of the AMS 12 (1999), 241–268, [author manuscript](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf), §§II.1–II.3, manuscript pp.11–15.
- **Berger-intro** — Laurent Berger, *An introduction to the theory of p-adic representations*, [arXiv:math/0210184](https://arxiv.org/abs/math/0210184), for period and exponential conventions.
- **Berger-diffeq** — Laurent Berger, *Représentations p-adiques et équations différentielles*, Inventiones Mathematicae 148 (2002), 219–284, [arXiv:math/0102179](https://arxiv.org/abs/math/0102179), Theorem 5.10.
- **Bloch–Kato** — Spencer Bloch and Kazuya Kato, *L-functions and Tamagawa numbers of motives*, The Grothendieck Festschrift I (1990), 333–400, [author text](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf), Proposition 1.17 and Remark 1.18, pp.340–341, for the continuous period-sequence sections and boundary.
- **Berger-exp-2003** — Berger, *Bloch and Kato's exponential map: three explicit formulas*, Documenta Mathematica, Extra Volume Kato (2003), 99–129, [author manuscript](https://perso.ens-lyon.fr/laurent.berger/articles/article03.pdf), especially the exponential comparison and Appendix A, Theorem A.3, manuscript pp.26–27.
- **Berger-Wach-2004** — Berger, *Limites de représentations cristallines*, Compositio Mathematica 140 (2004), 1473–1498, [author manuscript](https://perso.ens-lyon.fr/laurent.berger/articles/article06.pdf), Proposition II.1.1 and §III.4. Read with the author's [errata](https://perso.ens-lyon.fr/laurent.berger/articles/errata.pdf): the rational Wach module becomes étale after the correct B_F scalar extension, not an incorrect overconvergent one.
- **LLZ-2010** — Antonio Lei, David Loeffler and Sarah Livia Zerbes, *Wach modules and Iwasawa theory for modular forms*, Asian Journal of Mathematics 14 (2010), 475–528, [institutional manuscript](https://wrap.warwick.ac.uk/id/eprint/38052/1/WRAP_Loeffler_modularforms.pdf), Theorem 3.5 and Lemma 3.15. The paper assumes p odd.
- **LLZ-2011** — Lei, Loeffler and Zerbes, *Coleman maps and the p-adic regulator*, Algebra & Number Theory 5 (2011), 1095–1131, [publisher PDF](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), §§2C–3A, especially pp.1114–1116. The paper assumes p odd.
- **Pottharst** — Jonathan Pottharst, *Analytic families of finite-slope Selmer groups*, Algebra & Number Theory 7 (2013), 1571–1612, [publisher PDF](https://msp.org/ant/2013/7-7/ant-v7-n7-p02-p.pdf), Theorem 2.8 and Lemma 2.9, pp.1598–1599.
- **Liu-triangulation** — Ruochuan Liu, *Triangulation of refined families*, [arXiv:1202.2188v3](https://arxiv.org/abs/1202.2188v3), for the global triangulation context; the exact general flattening and specialization targets here use KPX §6.3.
- **FF** — Laurent Fargues and Jean-Marc Fontaine, *Courbes et fibrés vectoriels en théorie de Hodge p-adique*, Astérisque 406 (2018), [author PDF](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Theorem 11.5.1, pp.383–384.
- BHS — Christophe Breuil, Eugen Hellmann and Benjamin Schraen, *A local model for the trianguline variety and applications*, Publications Mathématiques de l'IHÉS 130 (2019), 299–412, [publisher/Numdam PDF](https://numdam.org/item/10.1007/s10240-019-00111-y.pdf), §3.3, pp.342–346.
- **Ding** — Yiwen Ding, *p-adic Hodge parameters in the crystabelline representations of GL_n*, Publications Mathématiques de l'IHÉS (2025), [publisher PDF](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), §2.1, pp.9–10 of the article PDF, for coefficient-valued weights and rank-one conventions.
- **Colmez-GL2** — Pierre Colmez, *Représentations de GL₂(ℚ_p) et (φ,Γ)-modules*, Astérisque 330 (2010), 281–509, [Numdam PDF](https://www.numdam.org/article/AST_2010__330__281_0.pdf), Propositions VI.4.13 and VI.4.15, Remark VI.4.14 and Lemma VI.4.16, pp.435–437; §VIII.2, pp.502–503.
- DLB — Gabriel Dospinescu and Arthur-César Le Bras, *Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*, Annals of Mathematics 186 (2017), 321–411, [publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n2-p01-p.pdf), Theorem 1.9, p.333, Theorem 8.3, pp.368–369, and §12.1, p.398.
