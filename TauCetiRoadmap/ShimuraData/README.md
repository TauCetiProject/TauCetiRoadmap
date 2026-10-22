# Roadmap: Shimura data, Hermitian domains, and adelic level structures

**Summary.** Build the Hodge-theoretic and group-theoretic comparisons used with pure Shimura data `(G,X)`: rational weights and Mumford–Tate groups, variations and their polarizations, compact duals over reflex fields, integral Bruhat geometry, distinguished auxiliary data, and explicit Hilbert and Siegel coordinates. The end results are the lift of every connected datum to a full datum satisfying the additional axioms, the centre and Levi identities for distinguished data, and a neatness criterion for unipotent Iwahori level at all places above one unramified rational prime.

Mathematical target names below specify the library to be built in the namespace
`TauCetiRoadmap.ShimuraData`. The acceptance statement in `Suggested.lean` is
`kostantInvolution` (§3.13); its module documentation identifies the missing carriers
for the other headline results.

## Scope and ownership

The objects here extend the general pure-datum theory. No PEL, Hodge-type or abelian-type hypothesis is imposed unless stated. A datum has a nonempty **full** real conjugacy class; selecting a component does not silently replace it by a smaller orbit. Additional axioms remain separate predicates, so failures of rational weight or centre discreteness remain visible.

ShimuraVarieties owns pure data and morphisms, connected and adjoint data, Hodge and abelian type, special pairs, Hermitian components, the representation–Hodge dictionary, homogeneous variations, the Borel map into a representation's flag variety, cocharacter classes, reflex fields, levels and the basic `GL₂`, Siegel and torus data (§§P.1–P.5). It also owns canonical models: their definition (§4.4), uniqueness (§4.12), and existence for every pure datum (§7.14). These are inputs here. Layer 3 identifies the intrinsic parabolic quotient of the supplied flag map and establishes its descent and integral geometry; it does not construct a second homogeneous variation or reflex field.

PELModuli owns rational PEL data, their Shimura datum and Siegel morphism (§M0.12), and the scalar-determinant Hilbert datum with its trace form and embedding (§M5.4). Layer 5 compares its domain with that of the full restriction-of-scalars group. ReductiveGroups owns algebraic groups, representations, roots, field Bruhat theory and split pinned integral groups; ReductiveGroupsPartII owns affine Weil restriction, the Deligne torus, Iwahori subgroups and Pilloni's self-dual genus-two lattices. The nonaffine parabolic-type varieties and integral Schubert comparisons needed below are stated explicitly as extensions of those inputs, with no appeal to affine Weil restriction for a projective line.

AutomorphicFormsOnReductiveGroups §§6.1, 6.3 and 6.7 supply the Hermitian group interface, genus-two character lattices, roots and chambers, and higher-rank Siegel Kostant indices. Section 2.2 realizes that interface for a pure datum; §§5.9–5.17 transport the supplied objects to the CG basis and identify their matrix actions, centralizer and Hodge summands. ArithmeticLocallySymmetricSpaces §ALS.4.5 owns Kostant’s Lie-cohomology theorem.

AdelicAlgebraicGroups owns adelic points, ordinary rational neatness and neat levels. Layer 5 defines the different, simultaneous-prime adelic condition of Boxer–Calegari–Gee–Pilloni and compares it with those notions. HodgeStructures owns pure Hodge structures and fibrewise polarization and semisimplicity. ComplexManifolds and ComplexKahlerGeometry own holomorphic bundles and their flat-connection/local-system correspondence; a general variation adds a holomorphic filtration, opposedness and transversality to those objects.

Native [`TauCeti.Cocharacter.parabolic`, `levi` and `limit`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean) supply the cocharacter-limit construction; §3.7 adds its intrinsic Hodge-filtration comparison and fixes the inverse-cocharacter sign. Native [`TauCeti.Hodge.PeriodDomain.Point`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Hodge/PeriodDomain.lean) supplies a polarized filtration on a fixed lattice and form; the varying analytic objects are specified here. Tau Ceti's [`TauCeti.CommHopfAlgCat.commonKernelHopfIdeal`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/AlgebraicGroup/HopfIdeal/CommonKernel/Basic.lean) handles families of Hopf morphisms over one base. The Mumford–Tate construction instead takes the kernel of a rational algebra map obtained from an `S`-map after real base change, so §1.2 retains that additional case using the native Hopf-ideal join.

## Conventions

- Work with connected reductive groups over `ℚ` and a fixed algebraic closure `ℚ̄⊂ℂ`. A number field is given with the embedding needed for its reflex field. For Hilbert examples, `F` is totally real of degree `d≥1`.
- The Deligne torus is `S=Res_{ℂ/ℝ}G_m`. Its complex splitting sends `z∈ℂ×` to `(z,z̄)`. Type `(p,q)` has character `(−p,−q)`, and `μ_h(z)=h_ℂ(z,1)`. The inverse-diagonal cocharacter `w` acts by `tⁿ` in weight `n`. Thus `ℚ(1)` has type `(−1,−1)`, weight `−2`, and character `z z̄`; elliptic homology has weight `−1`.
- `Fᵃ=⊕_{p≥a}V^{p,q}`. With `P(λ)` defined by existence of `lim_{t→0}λ(t)gλ(t)⁻¹`, its stabilizer is `P(μ_h⁻¹)`. Polarization uses the native Hodge–Riemann inequality `i^{p−q}Q(v,v̄)>0`, together with parity `(−1)ⁿ` and filtration orthogonality.
- The compact dual is `G_ℂ/P`, a right-coset quotient. Integral flag calculations use `P\G` and inversion compares them. Kostant representatives are the shortest elements of **left** cosets `W_M\W`, characterized by `w⁻¹Φ_M⁺⊂Φ⁺`; `(wκ)(t)=κ(w⁻¹tw)`.
- A stratification is a decomposition of underlying spaces into locally closed subschemes. It is not an isomorphism from the coproduct of the cells to the whole flag scheme. Closure and incidence assertions specify whether they concern supports, fibres or schemes.
- The valuation on an algebraic closure of an `ℓ`-adic field is normalized by `v(ℓ)=1`. Absolutely unramified means a uniformizer has valuation `1`; over ramification index `e` it has valuation `1/e`. A faithful `ℚ`-representation of `Res_{F/ℚ}GSp₄` has dimension `4d` and sees all conjugate local eigenvalues.

## Exact supplier contracts

The library baseline is Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Native objects are used with their full hypotheses. In particular a coordinate ring or local coefficient system supplies its carrier, only the structure its declaration actually defines.

### From Mathlib and Tau Ceti

- [`AddValuation`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Valuation/Basic.lean): The existing additive valuation carrier: valuations into an ordered additive monoid with top; zero maps to top, one to zero, products add, and sums satisfy the ultrametric bound.
- [`AddValuation.map_inv`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Valuation/Basic.lean): The valuation of an inverse is the negative of the original valuation.
- [`AddValuation.map_le_add`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Valuation/Basic.lean): A common lower valuation bound for two summands is a lower bound for their sum.
- [`AddValuation.map_mul`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Valuation/Basic.lean): Products add their valuations.
- [`AddValuation.map_zero`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Valuation/Basic.lean): Zero has top valuation.
- [`IsDedekindDomain.FiniteAdeleRing`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean): Restricted product of finite completions with their integral subrings, with ring and topology instances and the canonical fraction-field algebra map. For `ℤ` and `ℚ` this is the existing rational finite-adele carrier.
- [`Matrix.GeneralLinearGroup.map`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): A homomorphism of commutative rings induces the corresponding group homomorphism on finite square general linear groups.
- [`Matrix.GeneralLinearGroup.toLin`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): Multiplicative equivalence from invertible matrices to invertible linear maps on coordinate functions, used to define the inverse-image Lagrangian.
- [`Matrix.unitaryGroup`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/UnitaryGroup.lean): Native star-unitary matrix group, specialized to `2×2` complex matrices in the centralizer isomorphism.
- [`NumberField.IsCMField`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/NumberField/CMField.lean): A totally complex quadratic extension of its maximal real subfield; the field over which `SV6` asks the connected centre to split.
- [`NumberField.IsTotallyReal`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean): A field all of whose infinite places are real; the hypothesis on `F` for the Hilbert groups.
- [`NumberField.RingOfIntegers`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/NumberField/Basic.lean): Integral closure of `ℤ` in `F`, with its commutative domain structure; supplies the ring for finite places and finite adeles.
- [`RootPairing`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/RootSystem/Defs.lean): Perfectly paired root/coroot modules with their reflection permutations; the GSp and Borel identifications remain ReductiveGroups Layer 7 comparisons.
- [`RootPairing.Base`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/RootSystem/Base.lean): Simple-root support, linear independence and positive-or-negative generation for the native root pairing.
- [`RootPairing.Base.IsPos`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/RootSystem/Base.lean): Positivity with respect to the supplied base, defined by positive root height.
- [`RootPairing.weylGroup`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/RootSystem/WeylGroup.lean): Subgroup of root-pairing automorphisms generated by reflections; the standard-representation permutation and Levi/length comparisons remain ReductiveGroups Layer 7 comparisons.
- [`CoxeterSystem.parabolic`, `CoxeterSystem.IsMinimalCosetRep`, `CoxeterSystem.isMinimalCosetRep_iff`, `CoxeterSystem.existsUnique_mem_parabolic_mul` and `CoxeterSystem.length_mul_of_forall_not_isLeftDescent`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/GroupTheory/Coxeter/Parabolic.lean): Standard parabolic subgroups and right-minimal representatives for any Coxeter system, their descent characterization, and unique left parabolic factorization with additive lengths. Inversion gives the left-minimal representatives used in §3.10; no finiteness hypothesis is required.
- [`TauCeti.GeneralLinear.coordinateHopfAlgebra`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Coordinate/HopfAlgebra.lean): The coordinate Hopf algebra of `GL_n` over a commutative ring, the determinant localization of the matrix coordinate ring with its comultiplication, counit and antipode; the ambient group of the Mumford–Tate subgroup.
- [`TauCeti.Hodge.IsPolarization`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Hodge/Polarization.lean): Native integral Hodge–Riemann predicate on a `ℤ`-bilinear form: weight parity, integral nondegeneracy Q.Nondegenerate, filtration orthogonality and `i^(p−q)` positivity on each pure piece. It does not impose unimodularity, and is not a predicate directly on rational bilinear forms.
- [`TauCeti.HopfIdeal.sSup_toIdeal`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/HopfAlgebra/HopfIdeal/Basic.lean): Arbitrary joins of Hopf ideals (`instSupSet`, with `instCompleteSemilatticeSup`): the join of a set of Hopf ideals is a Hopf ideal and its underlying ideal is the join of their ideals. Used to define the Mumford–Tate ideal as the largest Hopf ideal contained in the kernel of `h*`.
- [`TauCeti.LocalCoefficientSystem`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicTopology/LocalCoefficient.lean): `FundamentalGroupoid X` ⥤ `ModuleCat R`; transport, constant and pullback API. Does not itself supply a holomorphic flat bundle.
- [`TauCeti.geometricallyConnectedCommHopfAlgProperty`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/AlgebraicGroup/Connected/CommHopfAlgCat.lean): Geometric connectedness of a commutative Hopf algebra: its prime spectrum stays connected after every field extension. Used to state the separate `MT` connectedness target; it does not prove connectedness.
- [`TauCeti.reductiveCommHopfAlgProperty`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean): Reductivity predicate on finite-type commutative Hopf algebras, including smoothness, geometric connectedness and trivial connected normal smooth unipotent subgroups of the geometric fiber. Used to state the separate `MT` reductivity target; it does not prove reductivity.
- [`TauCeti.Hodge.HodgeStructureOn.IsSubstructure`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Hodge/Substructure.lean): A sub-Hodge structure of a pure Hodge structure: a complex subspace stable under the conjugation and spanned by its intersections with the Hodge components. The fibre condition of variationSub.
- [`TauCeti.Hodge.HodgeStructureOn.IsSubstructure.hodgeStructure`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Hodge/Substructure.lean): The pure Hodge structure induced on a sub-Hodge structure, with filtration the ambient filtration intersected with the subspace; the fibres of a subvariation.
- [`TauCeti.Hodge.HodgeStructureOn.IsSubstructure.isMorphism_subtype`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Hodge/Substructure.lean): The inclusion of a sub-Hodge structure is a morphism of pure Hodge structures.
- [`TauCeti.Hodge.HodgeStructureOn.IsMorphism.isSubstructure_ker`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Hodge/Substructure.lean): The kernel of a morphism of pure Hodge structures is a sub-Hodge structure; fibrewise half of `variationHomKer`.
- [`TauCeti.Hodge.HodgeStructureOn.IsMorphism.isSubstructure_range`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Hodge/Substructure.lean): The image of a morphism of pure Hodge structures is a sub-Hodge structure.
- [`TauCeti.Hodge.RationalHodgeSubstructure.orthogonal`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Hodge/Orthogonal.lean): For a polarization (integral form on a lattice), the orthogonal complement of a rational Hodge substructure is a rational Hodge substructure; fibrewise half of `rationalVariationOrthogonal`.
- [`TauCeti.Hodge.RationalHodgeSubstructure.isCompl_orthogonal`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Hodge/Orthogonal.lean): A polarization splits a rational Hodge substructure off: `W` and its orthogonal complement are complements in the lattice of rational Hodge substructures.

- [`TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.levi` and `TauCeti.Cocharacter.limit`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean): The subgroup functors of points admitting a cocharacter-conjugation limit, their centralizer subgroup functor, and the limit homomorphism. The Hodge-filtration comparison of §3.7 uses their stated limit convention.
- [`TauCeti.Hodge.PeriodDomain.Point`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Hodge/PeriodDomain.lean): A polarized filtration on a fixed lattice with a fixed integral form, supplying the fibre notion for §3.1.
- [`TauCeti.CommHopfAlgCat.commonKernelHopfIdeal`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/AlgebraicGroup/HopfIdeal/CommonKernel/Basic.lean): The largest Hopf ideal in the kernels of a family of Hopf-algebra morphisms over one base. Section 1.2's rational algebra map has a different scalar base in its codomain Hopf structure; its Hopf-ideal join is not a second copy of this same-base construction.

### From the surrounding roadmaps

- ShimuraVarieties §§P.1–P.5: `PureDatum`, full and connected conjugacy-class conventions, the homogeneous Hodge filtrations and their holomorphicity, the Borel map, maximal rational tori through `h`, cocharacter classes and finite reflex fields with datum functoriality. The action of `G^ad(ℝ)⁺` on a component and its tangent complex structure are §P.2. Only the intrinsic quotient identification and additional conclusions below are new.
- PELModuli §§M0.12, M5.1, M5.4–M5.5: `RationalPELDatum.toShimuraDatum` and `siegelMorphism` with connected group and `SV3`; Siegel, scalar-determinant Hilbert and unitary PEL data. The Hilbert trace pairing is positive with its supplied `h`. Unitary signature `(r_τ,s_τ)` has dimension `Σ_τr_τs_τ`.
- ReductiveGroupsPartII `§§RG2.0a`, RG2.1.5, RG2.3, RG2.5: Affine Weil restriction with its natural points equivalence; `DeligneTorus` with real and complex comparisons, conjugation, inverse diagonal, norm and `μ`; torus norms; z-extensions in the simply connected case; pro-unipotent Iwahori reduction; Pilloni coordinates, corrected simple roots and duality. The general prescribed-derived-cover extension is proved in Layer 4.6, not assumed from the `z`-extension theorem.
- AdelicAlgebraicGroups §§1.3–1.4, 3.4, 4.3: Topological functoriality on finite adelic points, restriction of scalars and its local factors; compactness of anisotropic arithmetic quotients; `Neat.IsNeatAut`, representation independence and rational neat levels; the cyclotomic distance `v(ζ−1)=1/(ℓ^{r−1}(ℓ−1))` for a primitive `ℓʳ`-th root and zero for nontrivial prime-to-`ℓ` torsion. No discreteness of all rational points in finite adeles is inferred.
- ArithmeticLocallySymmetricSpaces `§§ALS.F.1`, ALS.0.1–ALS.0.2: `realPoints_lieGroup` with Lie algebra `Lie(H)`, independence of faithful embedding, and finitely many components; Cartan involutions via compact twisted real form, with the central-torus condition separate from the Killing-form criterion on the derived algebra. Section ALS.4.5 supplies the root-theoretic Kostant index set and the characteristic-zero splitting-field Lie-cohomology theorem, retaining the full Levi central weight; §3.10 compares its index set with Coxeter length.
- AutomorphicFormsOnReductiveGroups §6.1: `HermitianGroupDatum`, `hodgeStabilizer`, `positiveSplitCentre`, `compactQuotient`, `pPlus`, `pMinus` and `parabolicLie`, with the actual adjoint `h`-summands and full positive real split centre. Section 6.3 supplies split and compact character lattices, parity conversion, positive roots, half-sums and four chambers (`splitCharacter`, `compactCharacter`, `toCompact`, `toSplit`, `rho`, `chamber`) with chamber duality. Section 6.7 supplies the Siegel Levi and minimal left-coset Kostant indices for `GSp₂g`, `g≥1`; §5.10 identifies its `g=2` indices and lengths with the CG action table. Its symplectic basis becomes the CG basis by swapping the last two basis vectors. Section 2.2 constructs the geometric datum adapter; §§5.9–5.17 identify these supplied objects with the Shimura filtration, CG centralizer, actual Cartan and Cayley eigenspaces.
- AbelianSchemesAndArithmeticModuli §§A5.2, A5.5: The rational polarized Hodge structure `H¹(A,ℚ)`, its Riemann form and isogeny compatibility. Layer 1 uses its rational symplectic similitude group without a Siegel Shimura datum.
- StableReduction Layer 2: Effective étale descent of schemes equipped with a compatible relatively ample invertible sheaf, by descent of the graded section algebra and relative Proj; including morphisms, the polarization and base-change coherence. A finite separable splitting extension is an étale cover, and the canonical parabolic polarization or the Segre bundle supplies the compatible invertible sheaf. Descent of a variety does not assert a rational point.
- ComplexManifolds Milestone 7: Holomorphic vector bundles and bundle morphisms on the native vector-bundle carrier, cocycle gluing, pullback, direct sums, tensor products and duals. Layer 3.1 specifies the holomorphic subbundle condition for its filtration on those carriers.
- ComplexKahlerGeometry §K4: Holomorphic connections and parallel local frames; equivalence of finite-rank complex local systems, flat holomorphic connections and flat smooth complex connections, natural under holomorphic pullback. The associated bundle is `L⊗O` with connection `1⊗d`.
- ReductiveGroups Layers 0–4, 6–7, `9`: The Hopf/group-scheme/functor dictionary, closed subgroups and quotients, finite-dimensional comodules with scalar extension, tensor generation by a faithful representation, identity components, rational torus character lattices, reductivity and semisimplicity, cocharacter parabolics and their Lie quotients, based roots and field Bruhat theory. Layer 9 gives split pinned groups over `ℤ` and root subgroups; the integral flag and Schubert targets of Layer 3 are additional consequences to establish here.
- RepresentationTheory/LieGroups Layers 7–8: Complexification and complex flag-manifold charts. For a parabolic quotient use analytification of the algebraic open root charts and their transition functions, with tangent space `g/p`, as detailed in Layer 3.8.
- LocalFieldsRamification Layer 0: Finite extensions of `ℚ_ℓ`, ramification index, and extension of the normalized valuation to an algebraic closure. This is combined with the cyclotomic distance theorem from AdelicAlgebraicGroups, not replaced by an assumed torsion-freeness predicate.
- ComplexComparisonPartII §C−1.1: `complexSchemeAnalytification.smooth`, `complexSchemeAnalytification.separatedHausdorff`, `complexSchemeAnalytification.openSubspace` and `complexSchemeAnalytification.fibreProduct`: scheme analytification with smooth manifold charts, Hausdorffness for separated schemes, and natural open and fibre-product comparisons. Section 3.8 applies these to the projective parabolic quotient.
- HodgeStructures, L0–L1: pure real, rational and integral Hodge structures, opposed filtrations, tensor/dual/Tate operations, polarization and semisimplicity. Fibrewise substructures and orthogonal complements use the native declarations above.

## How to read the build

Layer 0 fixes the real and adelic Hilbert comparisons. Layer 1 isolates rational weight and the Mumford–Tate construction before genericity. Layer 2 proves uniqueness of the supplied complex structure and constructs its Hermitian-group adapter. Layer 3 first treats general variations, then passes from filtration parabolics to compact duals and integral flags. Within Layer 4, build §4.1, then §§4.3, 4.4, 4.5 and 4.2, in that order; then build §§4.6–4.9. Layer 5 fixes all conventions through Hilbert and Siegel examples and proves the local-to-adelic neatness result. Each dependency below refers to a native declaration, an exact supplier contract above, or a local target preceding it in this build order; the representability and arithmetic extensions are explicit local auxiliary targets.

## Layer 0: real and adelic points of the Hilbert groups

The fibre-product condition is equality of determinants, not equality of their signs. Topological statements retain this distinction at both real and finite adelic places.

<a id="d0-hilbert-real-points"></a>

### 0.1 Real points of the Hilbert groups

Prove `hilbertRealPoints`. Let `F` be a totally real number field of degree `d` with real embeddings `σ₁,…,σ_d`, `G=Res_{F/ℚ}GL₂` and `G*=G×_{Res_{F/ℚ}G_m}G_m` the fibre product of `det:G→Res_{F/ℚ}G_m` with the diagonal `G_m→Res_{F/ℚ}G_m`. The Weil-restriction point comparison gives `G(ℝ)=GL₂(F⊗_ℚℝ)`, and the `ℝ`-algebra isomorphism `F⊗_ℚℝ≅ℝ^d`, `x⊗r↦(σ_i(x)r)_i`, identifies it with `∏_i GL₂(ℝ)`, sending `a∈GL₂(F)` to `(σ₁(a),…,σ_d(a))`. Under this identification `G*(ℝ)` is the set of tuples `(g_i)` whose determinants all equal one `t∈ℝ^×`, of either sign. Both identifications are isomorphisms of real Lie groups; `G(ℝ)` has `2^d` connected components, indexed by the signs of the `d` determinants, and `G*(ℝ)` has exactly two.

`F` is a totally real number field of degree `d≥1`; `G` and `G*` are as stated, with `G*` the fibre product over `Res_{F/ℚ}G_m`.

Weil restriction and its point comparison are ReductiveGroupsPartII §RG2.0a's `(WeilRestriction.pointsMulEquiv)`; the archimedean local factor of restriction of scalars is AdelicAlgebraicGroups §1.4's; the Lie group structure on real points is ArithmeticLocallySymmetricSpaces §ALS.F.1's `(realPoints_lieGroup)`.

`RG2.0a` gives `G(ℝ)=GL₂(F⊗_ℚℝ)`, naturally in the coefficient algebra.

Because `F` is totally real, `x⊗r↦(σ_i(x)r)_i` is an `ℝ`-algebra isomorphism `F⊗_ℚℝ≅ℝ^d` (the archimedean case of AA §1.4's local factors); `GL₂` of a finite product of rings is the product of the `GL₂`'s.

Points of a fibre product are the fibre product of the points, and the diagonal `G_m(ℝ)→(Res_{F/ℚ}G_m)(ℝ)=(ℝ^×)^d` is the scalar embedding, so `G*(ℝ)` consists of the tuples with a common determinant `t`.

`GL₂(ℝ)` has the two components `det>0` and `det<0`, so `G(ℝ)` has `2^d`. For a fixed sign of `t`, dividing every `g_i` by `|t|^{1/2}` and, when `t<0`, multiplying by one fixed element of determinant `−1` identifies the whole locus of tuples with common determinant of that sign with `ℝ_{>0}×∏_iSL₂(ℝ)`; the first coordinate is `|t|`. Both factors are connected, hence `G*(ℝ)` has two components.

`ALS.F.1` applied to the closed embeddings `G_ℝ⊂GL_{2d,ℝ}` and `G*_ℝ⊂G_ℝ` makes the identifications isomorphisms of real Lie groups.

**Checks.**

- For `F=ℚ`, `G=G*=GL₂` and both identifications are the identity of `GL₂(ℝ)`.
- For `F=ℚ(√2)`, `G(ℝ)=GL₂(ℝ)×GL₂(ℝ)` has four components; the pair `(I₂,diag(1,−1))` lies in `G(ℝ)` but not in `G*(ℝ)`, whose two components consist of pairs with exactly equal determinants, positive in one component and negative in the other.
- For `F=ℚ(√2)` the rational element `diag(√2,1)∈GL₂(F)` goes to `(diag(√2,1),diag(−√2,1))`, whose determinants have opposite signs; `diag(√2,√2)` goes to a pair with common determinant `2`.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 5.24, pp.63–64.)

*Needs:* ReductiveGroupsPartII `§RG2.0a`; AdelicAlgebraicGroups §§1.3–1.4; ArithmeticLocallySymmetricSpaces `§§ALS.F.1`, ALS.0.1–0.2; `NumberField.IsTotallyReal`; `Matrix.GeneralLinearGroup.map`.

<a id="d0-hilbert-adelic-points"></a>

### 0.2 Finite-adelic points of the Hilbert groups

Prove `hilbertAdelicPoints`. For the same `F`, AdelicAlgebraicGroups §1.4 (restriction of scalars on adelic points) identifies `G(𝔸_{ℚ,f})=GL₂(F⊗_ℚ𝔸_{ℚ,f})` with `GL₂(𝔸_{F,f})` as topological groups, carrying the diagonal image of `G(ℚ)=GL₂(F)` to the diagonal image of `GL₂(F)`, naturally in algebraic group maps. Under it `G*(𝔸_{ℚ,f})` is the closed subgroup of `g∈GL₂(𝔸_{F,f})` with det `g` in the image of `𝔸_{ℚ,f}^×→𝔸_{F,f}^×`, and `G*(ℚ)` is the subgroup of `GL₂(F)` with determinant in `ℚ^×`. Every compact open subgroup of `G*(𝔸_{ℚ,f})` is `V∩G*(𝔸_{ℚ,f})` for some compact open subgroup `V⊂GL₂(𝔸_{F,f})`, and every such intersection is compact open in `G*(𝔸_{ℚ,f})`. Nothing is asserted about discreteness of `G(ℚ)` or `G*(ℚ)` in the finite adeles.

`F`, `G` and `G*` are as in [§0.1](#d0-hilbert-real-points).

The adelic restriction-of-scalars isomorphism (base-change-adelic) is AdelicAlgebraicGroups §1.4's; functoriality of adelic points under the determinant and the diagonal is §1.3's.

AA §1.4 gives the topological isomorphism together with its diagonal and naturality clauses.

Apply AA §1.3's functoriality to `det:G→Res_{F/ℚ}G_m` and to the diagonal `G_m→Res_{F/ℚ}G_m`; points of the fibre product are the fibre product of points, giving the determinant locus. It is closed: choose a `ℚ-basis` of `F` starting with `1`. In `F⊗_ℚ𝔸_{ℚ,f}`, the scalar subring is the closed coordinate subspace with all remaining coordinates zero. Its intersection with the unit group is exactly the scalar units, since scalar multiplication is invertible precisely when that scalar is a unit. Pull back this closed unit subgroup under the continuous determinant.

Compact opens: given a compact open subgroup `U` of `G*(𝔸_{ℚ,f})`, pick a compact open subgroup `V₀` of `GL₂(𝔸_{F,f})` with `V₀∩G*⊂U` and normalized by `U` (the normalizer of a compact open subgroup is open, so compact `U` has only finitely many conjugates of a small `V₀`; their intersection remains small and is U-normalized); then `V=UV₀` is a compact open subgroup with `V∩G*=U(V₀∩G*)=U`. Conversely `V∩G*` is open in `G*`, and compact because `G*` is closed.

No discreteness is claimed: `G*(ℚ)` contains the infinite group `SL₂(O_F)`, which lies in the compact open `GL₂(Ô_F)∩G*`.

**Checks.**

- For `F=ℚ` both groups are `GL₂` and the identification is the identity of `GL₂(𝔸_{ℚ,f})`.
- For `F=ℚ(√2)`, `diag(√2,√2)∈GL₂(F)` has determinant `2∈ℚ^×` and lies in `G*(ℚ)`; `diag(√2,1)` has determinant `√2∉ℚ` and lies in `G(ℚ)` but not in `G*(ℚ)`.
- For `V=GL₂(Ô_F)`, `V∩G*(𝔸_{ℚ,f})` is the group of integral matrices whose determinant lies in the image of `Ẑ^×`.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 5.24, pp.63–64; §5, compact open levels in `G(𝔸_f)`, pp.57–58.)

*Needs:* ReductiveGroupsPartII `§RG2.0a`; AdelicAlgebraicGroups §§1.3–1.4; `IsDedekindDomain.FiniteAdeleRing`.

### Examples

Over `ℚ(√2)`, opposite determinant signs distinguish the two Hilbert groups, and equal positive signs still do not imply membership in `G*`: `diag(2,1)` and `I₂` have unequal determinants. The scalar `√2·I₂` instead has determinant `2` at both embeddings.

### Dependencies

AdelicAlgebraicGroups §§1.3–1.4; ArithmeticLocallySymmetricSpaces `§§ALS.F.1`, ALS.0.1–0.2; ReductiveGroupsPartII `§RG2.0a`; `IsDedekindDomain.FiniteAdeleRing`; `Matrix.GeneralLinearGroup.map`; `NumberField.IsTotallyReal`.

## Layer 1: rational weight, Mumford–Tate groups and Hodge genericity

Use algebraic S-actions and rational gradings, not an arbitrary endomorphism carrying a label “Hodge”. The rational closure of `h(S)` can fail to be a group, so the Hopf-ideal operation is essential.

<a id="d1-rational-weight-criterion"></a>

### 1.1 Rational weight criterion

Prove `rationalWeightCriterion`. For a finite-dimensional rational `V` with an algebraic real `S`-action `h`, its weight `w_h=h∘(inverse` diagonal) descends to a `ℚ`-cocharacter of `GL(V)` if and only if the real weight decomposition is the scalar extension of an internal finite `ℚ-grading`. The rational grading acts by `t^n` on weight `n`. The full homomorphism `h` need not descend to `ℚ`.

`V` is a finite-dimensional `ℚ`-vector space with an algebraic homomorphism `h:S→GL(V)_ℝ`; `S` and its weight cocharacter `w=d∘inv` are ReductiveGroupsPartII §RG2.0a.3's, and type `(p,q)` means the split character `(−p,−q)`, as in ShimuraVarieties §P.3's representation–Hodge dictionary.

A rational `Gm`-action has rational eigenspaces. Conversely a rational grading defines `t↦tⁿ` on its rational summands, whose real extension is `h∘w`.

**Checks.**

- `ℚ(1)`, of type `(−1,−1)`: `w_h(t)=h_ℂ(t⁻¹,t⁻¹)` acts by `t^{−2}` on the one-dimensional space, a `ℚ`-cocharacter with the one-piece grading in weight `−2`.
- Elliptic `H₁`, of types `(−1,0)` and `(0,−1)`: `w_h(t)` is `t⁻¹·id`, rational with one graded piece of weight `−1`; for a curve without complex multiplication `h(i)∈End(V_ℝ)` does not lie in `End_ℚ(V)`, so the criterion concerns `w_h` and not `h`.
- Non-example: on `V=ℚ²` let `h` act trivially on the real line `ℝ(1,√2)` and by `z↦zz̄` (type `(−1,−1)`) on `ℝ(1,−√2)`. The weight decomposition into these two irrational lines is not the scalar extension of a `ℚ-grading`, and `w_h` is not defined over `ℚ`.
- Degenerate case: `V=0` has the empty grading and `w_h` is the trivial cocharacter.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Homomorphisms `S→GL(V)`, p.26.)

*Needs:* ReductiveGroupsPartII `§RG2.0a`; ShimuraVarieties §§P.1–P.5; ReductiveGroups, Layer 4 (Jordan decomposition, diagonalizable groups and tori); ReductiveGroups, Layer 1 (representations and comodules); HodgeStructures, L0 (pure Hodge structures).

<a id="d1-mumford-tate-group"></a>

### 1.2 Mumford–Tate group

Construct `mumfordTateGroup`. Let `V` be a finite-dimensional `ℚ`-vector space and `h:S→GL(V)_ℝ` an algebraic homomorphism with weight defined over `ℚ` (a rational Hodge structure, [§1.1](#d1-rational-weight-criterion)). Let `K_h⊂O(GL(V))` be the kernel of the `ℚ`-algebra map `O(GL(V))→O(GL(V))⊗_ℚℝ→O(S)` given by `h`: the ideal of the `ℚ-Zariski` closure of `h(S)`, which need not be a subgroup. Let `I_MT` be the largest Hopf ideal contained in `K_h`, the sum of all Hopf ideals contained in `K_h`. Then `MT(V)=Spec(O(GL(V))/I_MT)` is the smallest `ℚ`-algebraic subgroup of `GL(V)` whose real extension contains `h(S)`: a Hopf ideal `I` satisfies `h(S)⊂V(I)_ℝ` exactly when `I⊂K_h`, exactly when `I⊂I_MT`. `K_h` is also the kernel of the complexified split map `O(GL(V))→O(S_ℂ)=ℂ[z₁^{±1},z₂^{±1}]`. The image of the weight cocharacter lies in `MT(V)` and is trivial in weight zero. `MT` uses the whole `S`-map, not its restriction to the norm-one circle.

`V` is finite-dimensional over `ℚ` with an algebraic real `S`-map `h` whose weight is rational; no polarizability is required.

`O(GL(V))` is Tau Ceti's GL coordinate Hopf algebra `(TauCeti.GeneralLinear.coordinateHopfAlgebra)` after a choice of basis; the result is independent of the basis `(mumfordTateIsomorphism)`.

`h` is a homomorphism of real algebraic groups, so `h*:O(GL(V))⊗ℝ→O(S)` respects comultiplication, counit and antipode; `K_h` is the kernel of its restriction to `O(GL(V))`, the ideal of the rational functions vanishing on `h(S)`.

The Mumford–Tate Hopf ideal is the native Hopf-ideal join; prove that it lies in the coordinate kernel and contains exactly the Hopf ideals killed by the coordinate map. A sum of Hopf ideals is a Hopf ideal (Tau Ceti's `HopfIdeal.sSup_toIdeal`: the join of a set of Hopf ideals is a Hopf ideal whose ideal is the join of their ideals), so `I_MT`, the join of all Hopf ideals contained in `K_h`, is a Hopf ideal contained in `K_h` that contains every such Hopf ideal. `K_h` itself need not be one: `h*⊗h*` lands in `O(S)⊗_ℝO(S)`, and the kernel of `O(GL(V))⊗_ℚO(GL(V))→O(S)⊗_ℝO(S)` can be larger than `K_h⊗O+O⊗K_h` (the quartic-CM example below).

Minimality: for a Hopf ideal `I`, `h` factors through `V(I)_ℝ` iff `h*` kills `I⊗ℝ` iff `h*` kills `I` (`h*` is `ℝ`-linear and `I` spans `I⊗ℝ`) iff `I⊂K_h` iff `I⊂I_MT`. Closed `ℚ-subgroups` of `GL(V)` are the `V(I)` for Hopf ideals `I` (ReductiveGroups layer `0`), so `MT(V)` is the intersection of the closed `ℚ-subgroups` whose real extension contains `h(S)`, as in Milne's proof of Theorem 2.14.

`O(S)→O(S_ℂ)` is injective, so the complexified split map also has kernel `K_h` on `O(GL(V))`, and `I_MT` is the largest Hopf ideal inside that kernel.

Prove finite type of `MT` without assuming a finite list of Hodge tensors. After choosing a basis, `O(GL(V))` is a determinant localization of a polynomial algebra in finitely many variables; its quotient by `I_MT` is again a finite-type `ℚ`-algebra. The noetherian ideal theorem also gives finite generation of `I_MT`. This uses the existing coordinate algebra and quotient finite-type API, with the quotient group dictionary of ReductiveGroups Layer 0 (Milne, SVI, Theorem 2.14(a), p.30).

The weight `w_h=h∘w` is a `ℚ`-cocharacter; its image is a closed `ℚ`-subgroup whose real extension lies in `h(S)⊂MT(V)_ℝ`, so it lies in `MT(V)`.

- `mumfordTateMinimal`: For any Hopf ideal `I` of `O(GL(V))` killed by `h*`, `I⊂I_MT`; equivalently `MT(V)` is contained in every `ℚ`-algebraic subgroup through which `h` factors.
- `mumfordTateHopf`: `I_MT` is a Hopf ideal, the join of the Hopf ideals contained in `K_h`, and `I_MT⊂K_h`; `K_h` itself need not be a Hopf ideal.
- `mumfordTateWeight`: The rational weight cocharacter factors through `MT(V)`; for the trivial object its image is trivial, and no central `G_m` is asserted in that case.
- `mumfordTateIsomorphism`: A `ℚ`-linear isomorphism `V≅V′` intertwining `h` and `h′` induces a Hopf algebra isomorphism of coordinate rings carrying `K_h` to `K_h′` and `I_MT` to `I′_MT`.
- `mumfordTateComplexified`: `K_h` is the kernel of the `ℚ`-algebra map `O(GL(V))→ℂ[z₁^{±1},z₂^{±1}]` given by the complexified split action; `I_MT` is the largest Hopf ideal contained in it.

**Checks.**

- For the trivial action on `ℚ (n=1)`, the coordinate `X` maps to `1`, so `I_MT=(X−1)` and `MT` is the trivial group.
- For `ℚ(1)`, of type `(−1,−1)`, `X` maps to `z₁z₂`, which is injective on `ℚ[X^{±1}]`; so `I_MT=0` and `MT=G_m`.
- For `H₁(ℂ/ℤ[i],ℚ)` in the basis (1,i), `h(a+bi)=[[a,−b],[b,a]]`. The equations `X₁₁−X₂₂` and `X₁₂+X₂₁` generate the Hopf ideal of the torus `Res_{ℚ(i)/ℚ}G_m`, which `h*` kills; so they lie in `I_MT` and `MT` is not all of `GL₂`.
- For `V=ℚ(ζ₅)` with `h` acting through one complex place by `z/z̄` and trivially through the other (weight zero), `K_h` cuts out the union of two Galois-conjugate one-dimensional subtori, so `K_h` is not a Hopf ideal and `I_MT≠K_h`; `MT(V)` is the two-dimensional norm-one torus of `ℚ(ζ₅)/ℚ(√5)`.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Aside following 2.16, p.31.)

(J. S. Milne, [Shimura varieties and moduli](https://www.jmilne.org/math/xnotes/svhIP.pdf), §6, definition of Mumford–Tate groups, p.494.)

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Theorem 2.14, proof of (a), p.30; Aside after 2.16, p.31.)

*Needs:* ReductiveGroups, Layer 0 (the functor of points and the three-way dictionary); [§1.1](#d1-rational-weight-criterion); `TauCeti.HopfIdeal.sSup_toIdeal`; `TauCeti.GeneralLinear.coordinateHopfAlgebra`; HodgeStructures, L0 (pure Hodge structures); ReductiveGroupsPartII `§RG2.0a`.

<a id="d1-mumford-tate-connected"></a>

### 1.3 Connectedness of the Mumford–Tate group

Prove `mumfordTateConnected`. For any finite-dimensional rational pure Hodge structure `V`, `MT(V)` is geometrically connected over `ℚ`. Polarizability is not required.

`V` is finite-dimensional over `ℚ`; `h` is the algebraic real `S`-map of its pure Hodge structure. The characteristic-zero component-group comparison is ReductiveGroups Layer 3’s input.

In characteristic zero the rational identity component is a normal `ℚ`-subgroup with finite component quotient. Connected `S` maps trivially to that finite quotient after real extension. Its preimage therefore contains `h`, so minimality forces `MT(V)` to equal its identity component.

**Checks.**

- `ℚ(1)`: `MT=G_m` acting by the scalar character ([§1.2](#d1-mumford-tate-group)), which is connected.
- A Hodge structure purely of type `(0,0)` has trivial `MT`.
- For an elliptic curve with complex multiplication by an imaginary quadratic `K`, `MT(H₁)=Res_{K/ℚ}G_m`, a connected two-dimensional torus; for `V=H₁⊕H₁` of the same curve, `MT(V)` is the diagonal copy of `MT(H₁)`, not its square, again connected.
- No polarization is used: the argument only needs that `S` is connected and that `MT(V)` is minimal, so it applies to the non-polarizable torus example in [§1.4](#d1-mumford-tate-reductive).

(J. S. Milne, [Shimura varieties and moduli](https://www.jmilne.org/math/xnotes/svhIP.pdf), §6, definition of Mumford–Tate groups, p.494.)

*Needs:* [§1.2](#d1-mumford-tate-group); ReductiveGroups, Layer 3 (subgroups, quotients and components); `TauCeti.geometricallyConnectedCommHopfAlgProperty`.

<a id="d1-mumford-tate-reductive"></a>

### 1.4 Reductivity of a polarizable Mumford–Tate group

Prove `mumfordTateReductive`. For a finite-dimensional polarizable rational pure Hodge structure `V`, the connected group `MT(V)` is reductive over `ℚ`.

`V` is finite-dimensional and polarizable over `ℚ`. The `HodgeStructures L1` semisimplicity and ReductiveGroups Layer 6 faithful-semisimple-representation criterion are supplier inputs.

Each rational `MT`-stable subspace is a Hodge substructure, and `HodgeStructures L1` semisimplicity gives a rational Hodge complement. Its rational stabilizer contains `h`, so minimality makes that complement `MT`-stable. Apply the characteristic-zero reductivity criterion to the faithful semisimple rational representation `V` (ReductiveGroups Layer 6).

**Checks.**

- For `H₁` of a complex elliptic curve, `MT` is `GL₂` without complex multiplication and `Res_{K/ℚ}G_m` with complex multiplication by `K`; both are reductive.
- For `ℚ(1)^{⊕n}`, `n≥1`, `MT` is `G_m` acting by scalars, reductive; for `n=0` it is the trivial group.
- Polarizability cannot be dropped. Sub-Hodge structures of `V` are exactly its `MT(V)`-stable subspaces, so if `MT(V)` is reductive every sub-Hodge structure has a Hodge complement. `H¹` of a two-dimensional complex torus that contains an elliptic curve but is not isogenous to a product of elliptic curves is a pure weight-one rational Hodge structure with a rank-two sub-Hodge structure and no complement; it is not polarizable, and its `MT` is not reductive.

(J. S. Milne, [Shimura varieties and moduli](https://www.jmilne.org/math/xnotes/svhIP.pdf), §6, Corollary 6.5, p.495.)

*Needs:* [§1.2](#d1-mumford-tate-group); [§1.3](#d1-mumford-tate-connected); HodgeStructures, L1 (polarization and semisimplicity); ReductiveGroups, Layer 6 (reductive and semisimple groups); `TauCeti.reductiveCommHopfAlgProperty`.

<a id="d1-hodge-generic"></a>

### 1.5 Hodge-generic abelian variety

Define `hodgeGeneric`. A polarized complex abelian variety A of dimension `g≥1` is Hodge generic if `MT(H¹(A,ℚ))` is the full group of symplectic similitudes of its rational polarization. Equality is as `ℚ`-algebraic subgroups; it is invariant under the chosen symplectic identification. This is not defined merely by `End(A)=ℤ`.

A is a polarized complex abelian variety of dimension `g≥1`; `H¹(A,ℚ)` with its polarization is the polarized rational Hodge structure of weight one of AbelianSchemesAndArithmeticModuli §§A5.2 and A5.5 (Riemann forms and the polarized Hodge equivalence); `MT` is [§1.2](#d1-mumford-tate-group).

Use the cohomological polarization with weight `+1` and the corresponding similitude target; transport equality through change of symplectic basis. Prove the auxiliary `ellipticHodgeEndomorphisms`: multiplication by `α` on `ℂ` preserves the rational span of `1,τ` exactly when `α=a+cτ` and `ατ=b+dτ` for rational `a,b,c,d`, hence `cτ²+(a−d)τ−b=0`. Thus the rational Hodge endomorphism algebra is `ℚ` unless `τ` is imaginary quadratic, when it is `ℚ(τ)`.

Prove `ellipticMumfordTateClassification`: the elliptic Hodge representation is irreducible over `ℚ`, its Mumford–Tate group is connected reductive by §§1.3–1.4, and contains the scalar torus through its weight. A proper connected reductive subgroup of `GL₂` acting irreducibly is a torus: otherwise its derived Lie algebra is all `sl₂` and scalars give `GL₂`. Its commutant is then an imaginary quadratic field, and it is the multiplicative torus of that field. Conversely imaginary-quadratic multiplication gives an `S`-map into `Res_K/ℚ G_m`, and its two independent complex characters generate the full two-dimensional torus. This proves `MT=GL₂` in the non-CM case and `MT=Res_K/ℚ G_m` in the CM case. These are local consequences of the representation/MT correspondence (Milne, *Shimura varieties and moduli*, Propositions 6.3–6.4 and Corollary 6.5, pp.494–495) and the two-dimensional calculation, rather than an assumption about elliptic `MT` groups.

For an arbitrary isogeny, transport one polarization to the rational Hodge structure of the other abelian variety. If `MT` is full GSp, its action has exactly one invariant line of alternating similitude forms, so every polarization there is proportional to that transported form. This proves genericity isogeny invariance even if the chosen polarizations were not initially proportional. For a polarized rational Hodge isomorphism this comparison is immediate.

- `hodgeGenericBasis`: The predicate is independent of symplectic basis and scaling of the polarization.
- `hodgeGenericIsogeny`: A polarized rational Hodge isomorphism on `H¹` identifies `MT` and the symplectic-similitude groups by conjugation. Full-GSp genericity is invariant under every isogeny by the invariant-line argument above, including a change of polarization. Equality of `MT` groups is derived from the Hodge isomorphism.
- `hodgeGenericElliptic`: For `Eτ=ℂ/(ℤ+τℤ)`, `Im τ>0`, genericity is equivalent to absence of a nonzero rational quadratic relation for `τ`. The local elliptic classification below supplies both directions without assuming the Mumford–Tate group in a test.

**Checks.**

- For `τ=i` the actual polarized rational `H¹(Eτ)` has CM `MT` and is not Hodge-generic.
- For transcendental `τ` with `Im τ>0`, the actual elliptic `H¹` is Hodge-generic; no subgroup equality is assumed.
- For `E_i×E_i` with product polarization, `H¹` has proper `MT` inside `GSp₄` and is not Hodge-generic.

(David Masser; Umberto Zannier, [Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), §1 (Introduction), p.637, paragraph preceding Theorem 1.1.)

*Needs:* [§1.2](#d1-mumford-tate-group); HodgeStructures, L1 (polarization and semisimplicity); ReductiveGroups, Layer 6 (reductive and semisimple groups); AbelianSchemesAndArithmeticModuli §§A5.2, A5.5.

### Examples

The trivial Hodge structure, a nonzero Tate structure and elliptic `H¹` distinguish `MT=1`, `MT=G_m`, and the CM-torus versus `GL₂` alternatives. The irrational-line weight example separates rational weight from an arbitrary real grading.

### Dependencies

AbelianSchemesAndArithmeticModuli §§A5.2, A5.5; ReductiveGroupsPartII `§RG2.0a`; ShimuraVarieties §§P.1–P.5; `TauCeti.GeneralLinear.coordinateHopfAlgebra`; `TauCeti.HopfIdeal.sSup_toIdeal`; `TauCeti.geometricallyConnectedCommHopfAlgProperty`; `TauCeti.reductiveCommHopfAlgProperty`; HodgeStructures, L0 (pure Hodge structures); HodgeStructures, L1 (polarization and semisimplicity); ReductiveGroups, Layer 0 (the functor of points and the three-way dictionary); ReductiveGroups, Layer 1 (representations and comodules); ReductiveGroups, Layer 3 (subgroups, quotients and components); ReductiveGroups, Layer 4 (Jordan decomposition, diagonalizable groups and tori); ReductiveGroups, Layer 6 (reductive and semisimple groups).

## Layer 2: uniqueness of the complex structure

The complex structure is the one supplied by the adjoint Hodge types on the real orbit. Its uniqueness follows from a faithful filtration map with injective differential.

<a id="d2-unique-complex-structure"></a>

### 2.1 Uniqueness of the domain complex structure

Prove `uniqueComplexStructure`. Let `(G,X)` be a pure Shimura datum with the complex structure of ShimuraVarieties §P.2, for which §P.3 makes the Hodge filtration of every representation a holomorphic variation. That complex structure is the only one with this property: if `J′` is a complex-manifold structure on the same underlying smooth manifold `X` for which, for one faithful real representation `ρ` of `G`, the filtration map `x↦F_x(ρ)` into the flag manifold of `ρ` is holomorphic, then the identity of `X` is a biholomorphism between `J′` and the §P.2 structure. One faithful representation suffices because every representation is a subquotient of tensor constructions on `ρ` and its dual.

`(G,X)` is a pure Shimura datum in the sense of ShimuraVarieties §P.1 (the ShimuraVarieties roadmap): `G` connected reductive over `ℚ`, `X` a nonempty full `G(ℝ)`-class of algebraic `h:S→G_ℝ` satisfying `SV1–SV3`, with `S` the Deligne torus of ReductiveGroupsPartII §RG2.0a.3.

The complex structure on `X`, its integrability and the holomorphic variations are ShimuraVarieties §§P.2–P.3's; `J′` is a complex-manifold structure inducing the given smooth structure.

The filtration map of a faithful `ρ` is injective with injective differential (the Borel embedding of ShimuraVarieties §P.3), so it is an immersion of the smooth manifold `X` into the flag manifold.

If it is holomorphic both for `J` and for `J′`, its differential intertwines `J` and `J′` with the complex structure of the flag manifold; injectivity of the differential forces `J=J′` on every tangent space.

Two integrable complex structures with the same almost complex structure have the same local holomorphic functions, so the identity is biholomorphic without assuming equality of chart atlases. Tensor, dual and subquotient constructions transport holomorphicity from `ρ` to every representation, so the conditions 'for one faithful `ρ'` and 'for every representation' agree.

**Checks.**

- For the `GL₂` datum, the conjugate complex structure on `ℍ^±` (holomorphic coordinate `z̄`) makes the filtration map antiholomorphic, so it is excluded.
- For a torus datum `X` is a point and the statement is trivial.
- For `GL₂×GL₂`, conjugating the complex structure on only the second half-plane factor makes the faithful direct-sum filtration map fail holomorphicity on that factor, so this product structure is excluded.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Proposition 5.9 and proof, p.56.)

*Needs:* ShimuraVarieties §§P.1–P.5; ReductiveGroups, Layer 1 (representations and comodules); RepresentationTheory/LieGroups, Layer 8 (Borel–Weil, flag manifolds and Bruhat).

<a id="d2-hermitian-group-adapter"></a>

### 2.2 The Hermitian group attached to a pure datum

Construct `PureDatum.toHermitianGroupDatum`. For a pure datum `(G,X)` of ShimuraVarieties §P.1, a selected component `X⁺` and `h∈X⁺`, construct AutomorphicFormsOnReductiveGroups §6.1's `HermitianGroupDatum` on the real Lie group `G(ℝ)`. Use the actual smooth homomorphism `h:ℂ×→G(ℝ)`, its centralizer `K^h=Z_{G_ℝ}(h)(ℝ)` and `A_h`, the identity component of the full real split centre. Prove `K^h/A_h` compact. This uses `SV2` on the adjoint group and the compactness of a real torus modulo its positive split part; it requires neither rational weight nor `SV2*`.

Identify `k^h_ℂ=g^{0,0}`, `pPlus=g^{−1,1}` and `pMinus=g^{1,−1}` in the adjoint Hodge decomposition. The differential of the orbit map identifies `pPlus` with the holomorphic tangent of `X⁺` and `pMinus` with its antiholomorphic tangent, in ShimuraVarieties §P.2's convention. The complex Hodge-filtration stabilizer has Lie algebra `k^h_ℂ⊕pMinus`. Establish the symmetric bracket relations and conjugate-linear exchange of the two noncompact summands. In particular equal-sign brackets vanish because their putative Hodge types `(−2,2)` and `(2,−2)` are absent by `SV1`. Compact positive roots remain a separate choice, as in the supplied interface.

Prove compatibility with datum isomorphisms, change of basepoint within `X⁺` and products. For a number field `F` and a pure datum with `G=Res_{F/ℚ}H`, compare the adapter with the product of its real-group factors under `G(ℝ)=∏_{v|∞}H(F_v)`, carrying the local projections of `h` and the selected component. These comparisons retain the actual `h`, its summands and the entire `A_h`, rather than only the rational split centre.

**Checks.**

- For `GL₂` on the upper half-plane component, `K^h=ℝ_{>0}SO(2)`, `A_h=ℝ_{>0}` and `K^h/A_h≅SO(2)`; `pPlus` and `pMinus` have rotation weights `2` and `−2` respectively.
- For any torus datum, `K^h=T(ℝ)`, the quotient by its positive real split centre is compact, and both noncompact summands and the tangent space are zero, including for `(G_m,{1})`.
- For the full Hilbert datum over a real quadratic field, `A_h=(ℝ_{>0})²`, `K^h/A_h≅SO(2)²` and each noncompact summand has complex dimension two. The diagonal positive line alone would leave a noncompact quotient.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Proposition 5.9 and proof, p.56; Michael Harris, [Automorphic forms and the cohomology of vector bundles on Shimura varieties](https://www.jmilne.org/math/Books/AA1988b.pdf), §3, pp.60–63.)

*Needs:* ShimuraVarieties §§P.1–P.2; ArithmeticLocallySymmetricSpaces §§ALS.F.1, ALS.0.1; AutomorphicFormsOnReductiveGroups §6.1; ReductiveGroups, Layer 4 (real tori and their split parts).

### Examples

A torus component is a point. For `GL₂` the upper-half-plane line moves holomorphically; reversing its complex structure makes its nonconstant filtration map antiholomorphic and violates the hypothesis.

### Dependencies

AutomorphicFormsOnReductiveGroups §6.1; ArithmeticLocallySymmetricSpaces §§ALS.F.1, ALS.0.1; ShimuraVarieties §§P.1–P.5; ReductiveGroups, Layer 4 (real tori and their split parts); ReductiveGroups, Layer 1 (representations and comodules); RepresentationTheory/LieGroups, Layer 8 (Borel–Weil, flag manifolds and Bruhat).

## Layer 3: variations, compact duals and integral flags

A variation is a filtered holomorphic flat bundle arising from a genuine local system. The first targets handle arbitrary variations; homogeneous variations enter only through the supplier. Parabolic quotients then give the intrinsic compact dual and its arithmetic forms.

<a id="d3-variation"></a>

### 3.1 Variation of Hodge structure

Define `Variation`. On a complex manifold `B`, a pure real (or rational) variation of weight `n` is a finite-rank local system `L`, its associated holomorphic bundle `L⊗O_B` with flat connection `∇`, and a finite bounded decreasing filtration `F` by holomorphic subbundles. Each fiber has `n`-opposed conjugate filtrations and `∇Fᵖ⊆Fᵖ⁻¹⊗Ω¹_B`. Morphisms are flat maps preserving `F`. This includes nonconstant monodromy; it is not just a map into a set of Hodge structures.

`B` is a complex manifold; `n` is an integer; `L` is a locally constant finite-rank real/rational system. In the integral polarized case its `ℤ`-lattice is locally finite free and its polarizing form is flat, rationally nondegenerate and has the specified Tate normalization.

Use local-system trivializations to glue the flat bundle and filtration; fiber purity is the pinned opposed-filtration condition. Use ComplexKahlerGeometry §K4’s actual local-system/flat-connection functor and ComplexManifolds Milestone 7’s holomorphic bundle and morphism carriers. Here a holomorphic subbundle means a vector subbundle whose inclusion is holomorphic; locally a holomorphic frame extends to a frame of the ambient bundle. Establish this local-frame equivalence and its preservation by holomorphic pullback as `variationFiltrationLocalFrame` and `variationFiltrationPullback`. An invertible minor gives the local complementary frame; this is a constant-rank condition, not a claim that every image of a holomorphic bundle map is a subbundle. The added variation data are the filtration and its opposedness and transversality conditions.

- `variationFiber`: Evaluation returns the native pure Hodge structure on the complexified local-system fiber, including the opposed-filtration identity.
- `variationPullback`: Holomorphic pullback constructs the entire variation: local system, associated holomorphic flat bundle, induced connection and pulled-back filtration. Its local system agrees with the native fundamental-groupoid pullback.
- `variationMk`: From a finite-rank local system, its glued flat holomorphic bundle and connection, a holomorphic subbundle filtration, opposed fibers and Griffiths transversality, construct the variation.
- `variationExt`: Two variations on the same base, coefficient field and weight agree when their real or rational local systems, the scalar-extension comparisons with their associated flat bundles, and their holomorphic filtrations agree. Opposedness and transversality proofs add no data. Equality of complex flat filtered bundles alone does not identify the real or rational forms.
- `variationFilteredFlatBundle`: The underlying filtered flat bundle: the holomorphic bundle `𝒱=L⊗O_B` with the flat connection `∇` whose flat sections are the sections of `L⊗ℂ`, and the holomorphic subbundles `F^p⊂𝒱`. `𝒱` and `∇` are the flat holomorphic connection that ComplexKahlerGeometry §K4 (the ComplexKahlerGeometry roadmap) attaches to the complexified local system; the variation adds only `F` and its two conditions. It is defined for real and rational variations alike, and an integral variation uses its rationalization.
- `variationGriffiths`: Griffiths transversality `∇F^p⊆F^{p−1}⊗Ω¹_B`, for every `p`. In a flat chart it says that the derivative of the local period map lies in `F^{−1}End/F⁰End` ([§3.6](#d3-transversality-tangent)); for Hodge types `{(1,0),(0,1)}` it holds automatically.
- `variationHodgeBundles`: The Hodge pieces `H^{p,q}_b=F^p_b∩conj(F^q_b)` have locally constant rank `dim F^p−dim F^{p+1}`. They form real-analytic subbundles of `𝒱` with `𝒱=⊕_{p+q=n}H^{p,q}`, the projections onto them are real-analytic, and on a flat chart they are the Hodge projections of the marked fibre.

**Checks.**

- A constant pure Hodge structure with constant filtration is a variation.
- The weight-one elliptic family over `ℍ` has moving `F¹` and satisfies transversality.
- On the trivial rank-two bundle, the lines `ℂ(ze₁+e₂)` form a holomorphic subbundle with complementary frame `e₁`.
- The zero and whole subbundles are permitted, with their empty and full local frames respectively.
- The fibre images of multiplication by `z` on `O` over a disk have ranks zero at `0` and one elsewhere, so they cannot be a filtration subbundle.
- Over a point, the rational forms `ℚ` and `√2ℚ` inside `ℂ` both complexify to the weight-zero filtered space `F⁰=ℂ`, `F¹=0`. The identity of `ℂ` does not carry `ℚ` to `√2ℚ`, so it cannot identify these marked rational variations. Likewise multiplication by `√2` on the complexification of `ℚ` preserves its filtration and connection but is not a rational variation endomorphism.
- On a small disk take a constant weight-three rank-four polarized real space with complex basis `e₀,e₁,e₂,e₃`, conjugation `e₀↔e₃,e₁↔e₂`, `Q(e₀,e₃)=i,Q(e₁,e₂)=−i` (skew extended). Put `F³(z)=ℂ(e₀+ze₃)`, `F²(z)=F³(z)+ℂe₁` and `F¹(z)=F³(z)^⊥`. Near `0` the fibers are polarized and the flags holomorphic, but `dF³(0)=e₃` mod `F³(0)` is outside `F²(0)/F³(0)`, so this is not a variation.
- Weight one need not be effective: on a disk about `0` take `e₀,e₁` with conjugation `e₀↔e₁` and `F²(z)=F¹(z)=F⁰(z)=ℂ(e₀+ze₁)`, `F^{−1}=Vℂ` and `F³=0`. For `|z|<1` these filtrations are opposed of weight one, with types `(2,−1),(−1,2)`, but the derivative `e₁` of the `F²` section at `0` lies outside `F¹(0)`. This rank-two holomorphic family is not transversal.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Variations of Hodge structures, pp.28–29.)

*Needs:* ComplexManifolds Milestone 7; ComplexKahlerGeometry §K4; HodgeStructures, L0 (pure Hodge structures); `TauCeti.LocalCoefficientSystem`.

<a id="d3-variation-morphism"></a>

### 3.2 Morphism of Hodge variations

Define `VariationHom`. For variations H,K of the same weight over the same complex manifold, a morphism is a map of their finite-rank local systems whose complexification preserves `F^p` on each fiber and commutes with the induced flat connections. Identity, zero, composition and holomorphic pullback preserve these conditions.

All local systems are finite rank, scalar-extension comparisons use the specified canonical conjugation, and all analytic comparisons use the named complex-manifold structure.

Use the native fundamental-groupoid natural transformations. Filtration inequalities and connection squares are preserved by linear identity, zero and composition; naturality is the flat transport condition.

Subvariations, kernels and images: fibrewise, Tau Ceti's `IsMorphism.isSubstructure_ker` and `isSubstructure_range` make the kernel and image of a Hodge morphism sub-Hodge structures, `IsSubstructure.hodgeStructure` gives their induced structure and `isMorphism_subtype` the inclusion. The kernel of a map of local systems is a local system because transport is invertible. On a flat chart the ranks of `F^p∩W_ℂ` are locally constant, since `F^p∩W_ℂ` and `conj(F^{n+1−p})∩W_ℂ` are complementary in `W_ℂ` and both ranks are upper semicontinuous; hence `F^p∩(W⊗O_B)` is a holomorphic subbundle and `∇` preserves it up to `Ω¹`. Direct sums are formed fibrewise.

- `variationHomMk`: Bundle the local-system natural transformation, filtration preservation and connection compatibility.
- `variationHomExt`: Morphisms agree if their underlying local-system natural transformations agree.
- `variationHomIdentity`: The identity variation morphism has the identity local-system map.
- `variationMorphism`: Compose the underlying local-system maps; filtration and connection compatibility compose.
- `variationHomCompMap`: The local-system map of the composite is the categorical composite.
- `variationSub`: A sub-local system `W⊆L` whose complexified fibres are sub-Hodge structures is a variation of the same weight, with the filtration `F^p∩(W⊗O_B)`, and its inclusion is a morphism. The ranks of `F^p∩W_ℂ` are locally constant: on each fibre `F^p∩W_ℂ` and `conj(F^{n+1−p})∩W_ℂ` are complementary in `W_ℂ`, and both ranks are upper semicontinuous. Transversality is inherited because `∇` preserves `W⊗O_B`.
- `variationHomKer`: For a morphism `φ:H→K` of variations of the same weight, ker `φ` and im `φ` are sub-local systems whose fibres are sub-Hodge structures (a morphism of Hodge structures is strict for `F`), hence subvariations of `H` and `K` by variationSub.
- `variationDirectSum`: The direct sum of two variations of the same weight over `B` has the direct-sum local system and filtrations; its inclusions and projections are morphisms. A flat idempotent endomorphism `e` that is a morphism splits a variation as the direct sum of the subvariations im `e` and ker `e`.

**Checks.**

- The identity local-system map is a variation morphism.
- The zero flat map between two equal-weight variations is a variation morphism.
- Over a point take `H¹(ℂ/ℤ[i],ℚ)` with a rational basis satisfying `F¹=ℂ(e₁+i e₂)`. The rational flat projection `e₁↦e₁,e₂↦0` sends `e₁+i e₂` to `e₁∉F¹`, so it is not a variation morphism.
- The kernel of the identity of a variation is the zero subvariation, and the kernel of the zero morphism `H→K` is `H`.
- For the constant variation `H₁(E,ℚ)` of weight `−1` of an elliptic curve without complex multiplication over a point, a rational line is a sub-local system but not a subvariation: its complexification is not a sum of Hodge pieces.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Morphisms of Hodge structures, p.27; Variations of Hodge structures, pp.28–29.)

*Needs:* [§3.1](#d3-variation); `TauCeti.LocalCoefficientSystem`; `TauCeti.Hodge.HodgeStructureOn.IsSubstructure`; `TauCeti.Hodge.HodgeStructureOn.IsSubstructure.hodgeStructure`; `TauCeti.Hodge.HodgeStructureOn.IsSubstructure.isMorphism_subtype`; `TauCeti.Hodge.HodgeStructureOn.IsMorphism.isSubstructure_ker`; `TauCeti.Hodge.HodgeStructureOn.IsMorphism.isSubstructure_range`.

<a id="d3-rational-polarized-variation"></a>

### 3.3 Polarized rational variation

Define `RationalPolarizedVariation`. A polarized rational variation of weight `n` has a finite-rank rational local system, its natural scalar-extension identification with a real variation, and a parallel nondegenerate `ℚ`-bilinear form of parity `(−1)^n`. The complexified form annihilates `F^p×F^{n+1−p}` and `i^{2p−n}Q(x,conjugate x`) is positive real for nonzero `x∈H^{p,n−p}`. The Tate normalization is the native `HodgeStructures L1` normalization.

All local systems are finite rank, scalar-extension comparisons use the specified canonical conjugation, and all analytic comparisons use the named complex-manifold structure.

Use the already existing pure Hodge–Riemann conditions on rationalized fibers. Parallel forms glue over local flat frames and are checked against the same real variation; scalar-extension comparisons are required to be natural.

Orthogonal splitting: on a fibre choose a `ℤ`-lattice on which a multiple of `Q` is integral; Tau Ceti's `RationalHodgeSubstructure.orthogonal` and `isCompl_orthogonal` then give `W_b^⊥` as a rational Hodge substructure complementary to `W_b`. `W^⊥` is a sub-local system because `Q` is parallel, so it is a subvariation by variationSub, and `L=W⊕W^⊥`.

- `rationalVariationMk`: Bundle the rational local system, real variation, natural comparison and full parallel Hodge–Riemann form.
- `rationalVariationExt`: Equality of the rational local system, real variation, scalar-extension comparison and form implies equality of polarized rational variations.
- `rationalVariationParallel`: Parallel transport preserves the rational form on each pair of fiber vectors.
- `rationalVariationOrthogonal`: For a subvariation `W` of a polarized rational variation `(L,Q)`, the `Q`-orthogonal `W^⊥` is a subvariation, `L=W⊕W^⊥` as variations, and `Q` restricts to polarizations of `W` and `W^⊥`. Fibrewise, `Q` restricted to a sub-Hodge structure still satisfies the Hodge–Riemann conditions and so is nondegenerate, and `W^⊥` is the kernel of the flat Hodge morphism `L→W^∨(−n)` induced by `Q`.

**Checks.**

- Rationalizing the constant integral Tate variation retains weight `−2`, `F^{−1}=Vℂ` and its nonzero polarization.
- Rationalization of twice an integral polarization gives twice its rational form, under the canonical common fiber comparison.
- On any nonzero pure piece the negative of the polarizing form fails the native positive-real Hodge–Riemann inequality with the same Hodge filtration.
- For the constant polarized variation `H⊕H′` with the orthogonal sum of polarizations, the `Q`-orthogonal of the subvariation `H` is `H′`.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Polarizations, p.28; Variations of Hodge structures, pp.28–29.)

*Needs:* [§3.1](#d3-variation); HodgeStructures, L1 (polarization and semisimplicity); `TauCeti.Hodge.IsPolarization`; `TauCeti.Hodge.RationalHodgeSubstructure.orthogonal`; `TauCeti.Hodge.RationalHodgeSubstructure.isCompl_orthogonal`.

<a id="d3-polarized-integral-variation"></a>

### 3.4 Polarized integral variation

Define `polarizedIntegralVariation`. A polarized integral variation of weight `n` is a variation with a locally constant finite free `ℤ`-lattice and a parallel `ℤ`-bilinear polarizing form, with the explicit Tate normalization used to compare its rational and complex scalar extensions. The integral form is nondegenerate, has parity `(−1)ⁿ` and satisfies the native Hodge–Riemann orthogonality and positivity on every fiber. Rational nondegeneracy agrees after scalar extension, but an arbitrary rational polarization is not thereby integral. The lattice is locally free, not forced to be globally constant or unimodular.

`B` is a complex manifold and `n` is an integer. The locally constant `ℤ`-lattice has finite free fibers; its polarizing form is `ℤ`-bilinear, parallel and nondegenerate, with the stated Tate normalization. The HodgeStructures L0–L1 scalar-extension and filtered-bundle comparisons are supplier inputs.

Bundle the finite-free integral local system and parallel pairing; identify the fiberwise polarization with the supplied pure polarization after the chosen Tate factor. Do not require perfect integral pairing unless specified.

- `integralVariationRational`: Tensor the lattice and its parallel form with `ℚ` and retain the induced real flat filtered bundle and connection; the result is the specified rational polarized variation.
- `integralVariationPairing`: On each integral fiber the form satisfies the native `IsPolarization` predicate, including filtration orthogonality and positivity. The parallel field of the integral variation supplies transport invariance.
- `integralVariationPullback`: Holomorphic pullback constructs the full polarized integral variation and preserves the lattice, connection, filtration, scalar-extension comparisons and polarizing form.
- `integralVariationMk`: Construct from a locally finite-free integral local system, scalar-extension comparisons with a real variation, native pure Hodge fibers, a parallel form and full native Hodge–Riemann polarization conditions. Comparisons are natural in transport.
- `integralVariationExt`: Equality of the lattice local system, real variation, scalar-extension comparisons, integral Hodge fibers and polarizing form implies equality of the polarized variation.

**Checks.**

- The rank-one constant `ℤ(1)` lattice has weight `−2` and the usual Tate polarization.
- Multiplying a lattice polarization by `2` still gives a polarized integral variation.
- An elliptic variation around a cusp has nontrivial integral monodromy and remains admissible here.
- On the constant weight-zero lattice `ℤ` with `F⁰=ℂ` and `F¹=0`, `Q(x,y)=2xy` is an integral polarization although its lattice pairing is not unimodular. The rational polarization `Q(x,y)=xy/2` does not define an integral pairing on this lattice, and `−2xy` fails positivity.

(J. S. Milne, [Shimura varieties and moduli](https://www.jmilne.org/math/xnotes/svhIP.pdf), §5, Local systems and vector sheaves with connection and Variations of Hodge structures, p.492; HodgeStructures L0–L1 for the integral lattice and native polarization. Benjamin Bakker; Bruno Klingler; Jacob Tsimerman, [Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://arxiv.org/pdf/1810.04801v2), §1.3, pp.4–5, and §4.2, p.13, use this structure in the algebraic setting.)

*Needs:* HodgeStructures, L0–L1 (integral lattices and polarization); [§3.1](#d3-variation); `TauCeti.Hodge.IsPolarization`; [§3.3](#d3-rational-polarized-variation).

<a id="d3-flat-bundle-local"></a>

### 3.5 Flat bundle local comparison

Prove `flatBundleLocal`. In every simply connected local-system trivialization, the associated connection is the ordinary differential on holomorphic sections, and fiberwise opposedness is exactly the existing pure `HodgeStructureOn` condition. These descriptions agree on overlaps by locally constant transition maps. In local flat frames the connection is the differential of the local coordinate section, and transition maps are locally constant. Gluing produces `L⊗O_B`; path transport identities alone do not produce this object.

`B` is a complex manifold; `n` is an integer; `L` is a locally constant finite-rank real/rational system. In the integral polarized case its `ℤ`-lattice is locally finite free and its polarizing form is flat, rationally nondegenerate and has the specified Tate normalization.

Check the change-of-frame formula for constant transition matrices; apply the chain rule to filtration sections.

**Checks.**

- On a simply connected `B` with a flat frame `e₁,…,e_r` of `L`, the associated bundle is `O_B^r` and `∇(Σf_ie_i)=Σdf_i⊗e_i`; for the constant local system `ℚ^r` on `ℍ` this is the trivial bundle with the differential `d`.
- A change of flat frame by a constant `A∈GL_r(ℚ)` changes coordinates by `A⁻¹` and commutes with `d` because `dA=0`; for a holomorphic but non-constant change of frame `g(b)` the connection acquires the matrix `g⁻¹dg≠0`, so only flat frames compute `∇` as `d`.
- On `ℂ^×` let `L` be the rank-one local system with monodromy `−1`. Then `L⊗O` is holomorphically trivial, trivialized by `z^{1/2}·e` for a local flat section `e` (both factors have monodromy `−1`), and in this trivialization `∇=d+dz/(2z)`. So `L⊗O≅O` as bundles while `(L⊗O,∇)≇(O,d)`: the glued object remembers the connection, not just the bundle.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Variations of Hodge structures, pp.28–29.)

*Needs:* ComplexManifolds Milestone 7; ComplexKahlerGeometry §K4; [§3.1](#d3-variation); HodgeStructures, L0 (pure Hodge structures).

<a id="d3-transversality-tangent"></a>

### 3.6 Tangent criterion for transversality

Prove `transversalityTangent`. For a holomorphic family with constant local system `V`, Griffiths transversality is equivalent to the differential of its flag map lying in `F^{−1}End(Vℂ)/F⁰End(Vℂ)` at every point. This is a first-order condition, not merely continuity of the Hodge pieces.

The Hodge sign dictionary of Layer 1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects.

Identify tangent to the flag variety with `End/F⁰` and differentiate each filtration step; compare with `∇Fᵖ⊆Fᵖ⁻¹⊗Ω¹`.

**Checks.**

- For Hodge types `{(1,0),(0,1)}`, `F^{−1}End(V_ℂ)=End(V_ℂ)`, so every holomorphic family of weight-one filtrations, for instance `F¹(τ)=ℂ(τe₁+e₂)` on `ℍ`, is transversal.
- The constant family has zero differential and is transversal.
- Weight one alone does not imply transversality: Tate-twist the nonhorizontal weight-three family below by `ℚ(1)`. It has weight one and types `(2,−1)`, `(1,0)`, `(0,1)`, `(−1,2)`, and remains nonhorizontal.
- Weight three, rank four ([§3.1](#d3-variation) nonhorizontal example): for `F³(z)=ℂ(e₀+ze₃)`, `F²(z)=F³(z)+ℂe₁`, the differential sends `e₀∈H^{3,0}` to `e₃∈H^{0,3}` modulo `F³(0)`, an endomorphism of type `(−3,3)` outside `F^{−1}End`; the family is not transversal, although it is holomorphic.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Variations of Hodge structures, p.29, with the flag tangent space (18) of p.24.)

*Needs:* [§3.5](#d3-flat-bundle-local); ReductiveGroups, Layer 7 (structure theory); RepresentationTheory/LieGroups, Layer 8 (Borel–Weil, flag manifolds and Bruhat).

<a id="d3-filtration-parabolic"></a>

### 3.7 Parabolic of the Hodge filtration

Construct `filtrationParabolic`. For `h` and any faithful representation, the stabilizer of all `F_hᵖ` is the parabolic `P_h⊂Gℂ` with Lie algebra `F⁰gℂ`. It is independent of the faithful representation. With `μh(z)=hℂ(z,1)`, this is `P(μh⁻¹)` under the limit `t→0` convention; equivalently use `P(μh)` with the opposite filtration convention. Its Levi is `ZGℂ(μh)`, not its unipotent radical.

The Hodge sign dictionary of Layer 1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects.

The filtration uses `p` while `μ` acts by `−p`: matrices preserving `p≥a` have nonpositive `μ`-weight entries. Apply the dynamic parabolic theorem to `−μ`, and the faithful-representation comparison.

- `filtrationParabolicLie`: The Lie algebra of the algebraic filtration stabilizer is the actual subalgebra of endomorphisms preserving every `F^p`, identified with `F⁰gℂ`.
- `filtrationParabolicLevi`: The Levi is the algebraic centralizer of the specific `μ_h`; on the representation it preserves each `μ` weight piece, hence the Hodge grading.
- `filtrationParabolicConjugate`: `P_{ghg⁻¹}=gP_hg⁻¹` and does not depend on faithful representation.

**Checks.**

- For `GL₂`, `P_h` stabilizes the one-dimensional `F⁰` line and is a Borel.
- In a `GL₂` basis with `F⁰=ℂe₁` and `μ(t)=diag(1,t)`, the upper unipotent `u=[[1,1],[0,1]]` satisfies `μ(t)⁻¹uμ(t)=[[1,t],[0,1]]`, which tends to `I` as `t→0`. Conjugating `u` by `μ` instead produces the entry `t⁻¹`, with no limit. Thus the filtration stabilizer is `P(μ⁻¹)` for the stated limit convention.
- For a torus datum, `P_h=Tℂ` and its unipotent radical is trivial.
- For `GSp₂g`, `P_h` is the Lagrangian stabilizer with Levi `GLg×Gm`.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Flag varieties pp.23–24; Theorem 2.14 proof p.30; §12 p.111.)

*Needs:* ShimuraVarieties §§P.1–P.5; ReductiveGroups, Layer 7 (structure theory); ReductiveGroups, Layer 1 (representations and comodules).

<a id="d3-compact-dual"></a>

### 3.8 Compact dual

Construct `compactDual`. For a Shimura orbit `X`, construct its complex projective homogeneous flag variety `X∨=Gℂ/P_h`, independent up to canonical `Gℂ`-isomorphism of the chosen `h`. Use right cosets `G/P` for the Borel embedding; identify it by inversion with left cosets `P\G` for the routed Bruhat convention.

The Hodge sign dictionary of Layer 1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects.

First establish the local auxiliary `parabolicTypeVariety`. For a reductive group scheme `G/S` and an étale-locally constant conjugacy type `t` invariant under descent, the functor of parabolic subgroup schemes of type `t` is represented by a smooth proper `S`-scheme `Par_t(G)`, with a canonical relatively ample line bundle; it is projective when `S` is affine, in particular over a field or `ℤ`, with its universal parabolic and arbitrary-base-change comparison. If `P/S` has that type, the orbit map `gP↦gPg⁻¹` identifies `G/P` with `Par_t(G)`. Construct the quotient by the étale-local conjugacy functor: parabolics are self-normalizing, and the determinant of their Lie algebra’s dual supplies the canonical relatively ample line bundle. Over a split étale cover, use `G/P` for the finitely many standard types; descend the schemes, universal subgroups and ample line bundles. This is Conrad, *Reductive group schemes*, Theorem 2.3.6, pp.72–73, and Corollaries 5.2.8–5.2.9, pp.155–157. Test the Borel type of `GL₂ (ℙ¹)`, `P=G (S)`, and the nonsplit quaternion conic (no rational point).

Apply this to `G_ℂ` and `P_h`. The resulting identification with `Par_t` makes change of basepoint canonical, with the orbit maps satisfying the cocycle law; inversion gives the left-coset comparison. For the manifold and tangent comparisons use `complexSchemeAnalytification.smooth`, `separatedHausdorff`, `openSubspace` and `fibreProduct` of ComplexComparisonPartII §C−1.1. The regular root charts have holomorphic transition maps and tangent `g_ℂ/p_h`. This supplies a genuine complex manifold, compatibly with the `LieGroups` full-flag construction.

Borel embedding: the filtration map is `G(ℝ)`-equivariant by construction and holomorphic by ShimuraVarieties §P.3. It is injective because the Hodge filtration determines the Hodge decomposition (Milne SVI `(19)`, p.25), and its differential `g_ℝ/k_h→g_ℂ/F⁰g_ℂ` is injective (diagram `(26)` in the proof of Milne's Theorem 2.14) between spaces of equal real dimension, so it is an open embedding. Its image lies in the `G_ℂ`-orbit of `F_h`, which is `G_ℂ/P_h` because `P_h` is the stabilizer of `F_h` for every faithful representation ([§3.7](#d3-filtration-parabolic)).

- `compactDualBasepoint`: The basepoint has stabilizer `P_h`.
- `compactDualChangePoint`: Changing `h` by `g` gives the equivariant conjugate-parabolic identification.
- `compactDualTangent`: The complex tangent at the filtration point of the actual flag manifold is `gℂ/F⁰gℂ`, with its homogeneous differential.
- `compactDualBorelEmbedding`: The Borel embedding of ShimuraVarieties §P.3, `x↦F_x` into the flag variety of a faithful representation, takes values in the `G_ℂ`-orbit of `F_h`, which is `X^∨=G_ℂ/P_h`; the induced map `X→X^∨` is `G(ℝ)`-equivariant, holomorphic for the complex structure of §P.2, injective with injective differential, an open embedding, and independent of the faithful representation.

**Checks.**

- The `GL₂` compact dual is `ℙ¹ℂ`.
- The torus compact dual is a point.
- The Siegel compact dual is the Lagrangian Grassmannian with dimension `g(g+1)/2`.
- For `K` imaginary quadratic and PELModuli §M5.5's unitary datum of signature `(p,q)` with `pq>0`, the compact dual is the Grassmannian of p-planes in `ℂ^{p+q}`, of dimension pq; for the Picard signature `(2,1)` it is `ℙ²`.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §2, Flag varieties, pp.23–24, with Aside 2.3.)

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Theorem 2.14 and its proof, pp.29–30, with diagram (26).)

*Needs:* [§3.7](#d3-filtration-parabolic); ReductiveGroups, Layer 7 (structure theory); RepresentationTheory/LieGroups, Layer 8 (Borel–Weil, flag manifolds and Bruhat); ShimuraVarieties §§P.1–P.5; ComplexComparisonPartII §C−1.1; StableReduction Layer 2.

<a id="d3-reflex-flag-descent"></a>

### 3.9 Compact dual over the reflex field

Prove `reflexFlagDescent`. Let `E=E(G,X)` be the reflex field of ShimuraVarieties §P.3 (the field of definition of the conjugacy class of `μ_h`) and `t` the geometric conjugacy type of `P_h` ([§3.7](#d3-filtration-parabolic)). The Galois-stable type `t` defines the projective `E`-scheme `Par_t(G_E)` of parabolic subgroups of type `t`. Its complex fibre is `X^∨` ([§3.8](#d3-compact-dual)), and over any extension `L/E` with an `L`-rational parabolic `P` of type `t` it is `G_L/P`. The `E`-scheme need not have `E`-points.

The Hodge sign dictionary of Layer 1 is fixed. Analytic bases are complex manifolds; geometric flag schemes and Weyl Coxeter data are the specified supplier objects.

Galois acts on the geometric cocharacter conjugacy class in `ℚ̄`. The field is the fixed field of its open stabilizer; no rational representative or parabolic point is assumed.

The class determines its parabolic type equivariantly. Apply `parabolicTypeVariety` of §3.8 over `E`, then identify the complex fibre by the conjugation orbit map. Galois stability descends the whole parabolic-type scheme and its universal family; it does not descend a selected parabolic or supply an `E`-point.

**Checks.**

- `GL₂` and the genus-g Siegel datum: `E=ℚ`, and `Par_t(G)` is `ℙ¹_ℚ`, respectively the Lagrangian Grassmannian of a `2g`-dimensional symplectic `ℚ`-space; both have `ℚ`-points.
- For an indefinite quaternion division algebra `B` over `ℚ` and `G=B^×` with `X=ℍ^±` (the Shimura-curve datum), `E=ℚ` and `Par_t(G)` is the variety of Borel subgroups of `B^×`, the conic of `B`. It has no `ℚ`-point because `B` is not split, and over a splitting field `L` of `B` it becomes `ℙ¹_L=G_L/P`.
- For a torus datum (T,{h}), `P_h=T_ℂ`, the type `t` is trivial and `Par_t(T_E)=Spec E`.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Lemma 12.1 and Definition 12.2, pp.111–112; representability is Conrad, Corollaries 5.2.8–5.2.9, pp.155–157.)

*Needs:* [§3.7](#d3-filtration-parabolic); [§3.8](#d3-compact-dual); ShimuraVarieties §§P.1–P.5; ReductiveGroups, Layer 7 (structure theory); StableReduction Layer 2.

<a id="d3-kostant-representatives"></a>

### 3.10 Kostant representatives

Compare the root-theoretic representatives supplied by ArithmeticLocallySymmetricSpaces §ALS.4.5 with `kostantRepresentatives`, their Coxeter length characterization. For a split reductive group with `T⊂B⊂P` and Levi `M` containing `T`, `^MW` consists of the unique minimal-length representatives of the left cosets `WM\W`. Use the left action `wκ(t)=κ(w⁻¹tw)`; in particular `^MW` is characterized by `w⁻¹ΦM⁺⊂Φ⁺`. Specialize to the cocharacter parabolic only after choosing its compatible Borel.

`G` is split reductive with `T⊂B⊂P`, standard Levi `M` and its Weyl subgroup `WM`. Length/Bruhat order use this based root datum; representatives are for left cosets `WM\W`. For integral assertions use the split pinned reductive `ℤ`-model of ReductiveGroups Layer 9 and the cells and base-change-compatible closures constructed in §§3.14–3.15.

Use `TauCeti.GroupTheory.Coxeter.Parabolic`, its native standard parabolic `cs.parabolic J` and the set `{w | cs.IsMinimalCosetRep J w⁻¹}`. Invariance of length under inversion identifies this with `ℓ(w)≤ℓ(uw)` for every `u∈cs.parabolic J`. The native `CoxeterSystem.existsUnique_mem_parabolic_mul` and `CoxeterSystem.length_mul_of_forall_not_isLeftDescent`, using `CoxeterSystem.isMinimalCosetRep_iff` and inversion of descents, supply unique factorization `w=uv` and `ℓ(uv)=ℓ(u)+ℓ(v)`. Compare this presentation with the root-theoretic index set of ArithmeticLocallySymmetricSpaces §ALS.4.5, retaining the left-coset convention.

- `kostantPositive`: `w` belongs iff `w⁻¹ΦM⁺⊂Φ⁺`.
- `kostantIndexComparison`: `^MW` is the index set `W^P` of ArithmeticLocallySymmetricSpaces §ALS.4.5: `w` lies in `^MW` iff `w⁻¹α>0` for every simple root `α` of `M`.

**Checks.**

- When `M=T`, `^MW=W`.
- When `P=G`, `^MW={1}`.
- For `A₂` and `WM=⟨s₁⟩`, `^MW={1,s₂,s₂s₁}`.
- For `GL_n` with `M=GL_p×GL_q` (`p+q=n`, `p,q≥1`), `^MW` is the set of permutations `w` with `w⁻¹` increasing on {1,…,p} and on {p+1,…,n}. It has `C(n,p)` elements, of lengths `0` to `pq=dim Gr(p,n)`; for `n=3` and `p=2` it is `{1,s₂,s₂s₁}`.

(George Boxer; Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Definition 1.3.1, p.3; §3.1, p.34.)

*Needs:* ReductiveGroups, Layer 7 (structure theory); ReductiveGroups, Layer 9 (pinned Chevalley–Demazure group schemes); [§3.7](#d3-filtration-parabolic); ArithmeticLocallySymmetricSpaces §ALS.4.5; `CoxeterSystem.parabolic`; `CoxeterSystem.IsMinimalCosetRep`; `CoxeterSystem.isMinimalCosetRep_iff`; `CoxeterSystem.existsUnique_mem_parabolic_mul`; `CoxeterSystem.length_mul_of_forall_not_isLeftDescent`.

<a id="d3-kostant-cone-criterion"></a>

### 3.11 Kostant cone criterion

Prove `kostantConeCriterion`. For `w∈W`, `w(X*(T)⁺)⊆X*(T)^{+,M}` iff `w⁻¹ΦM⁺⊂Φ⁺` iff `w∈^MW`. `ΦM⁺` denotes positive Levi roots, distinct from the complementary noncompact roots `Φ^{+,M}`.

`G` is split reductive with `T⊂B⊂P`, standard Levi `M` and its Weyl subgroup `WM`. Length/Bruhat order use this based root datum; representatives are for left cosets `WM\W`. For integral assertions use the split pinned reductive `ℤ`-model of ReductiveGroups Layer 9 and the cells and base-change-compatible closures constructed in §§3.14–3.15.

Pair `wκ` with Levi coroots and use `w⁻¹` on the coroot. If an image root is negative, choose an integral strictly dominant weight to witness failure.

**Checks.**

- `A₂` with `W_M=⟨s₁⟩`: for `w=s₂`, `s₂⁻¹α₁=α₁+α₂>0` and `s₂` maps the dominant cone into `{⟨λ,α₁^∨⟩≥0}`. For `w=s₁`, `s₁α₁=−α₁<0` and `s₁ϖ₁=ϖ₁−α₁` has `⟨s₁ϖ₁,α₁^∨⟩=−1`, so `s₁` fails both sides of the criterion.
- `M=T`: `Φ_M⁺` is empty, `X*(T)^{+,M}=X*(T)`, and every `w∈W` satisfies both sides.
- Genus one (`GL₂` with `M=T`): both Weyl elements qualify. The printed criterion of BP p.34 tests noncompact roots and would exclude the non-identity element.

(George Boxer; Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34.)

*Needs:* [§3.10](#d3-kostant-representatives); ReductiveGroups, Layer 7 (structure theory).

<a id="d3-kostant-cones"></a>

### 3.12 Levi dominant cone decomposition

Prove `kostantCones`. `X*(T)^{+,M}=⋃w∈^MW wX*(T)⁺`, including boundary weights. In the real weight space the same union covers the closed Levi chamber.

`G` is split reductive with `T⊂B⊂P`, standard Levi `M` and its Weyl subgroup `WM`. Length/Bruhat order use this based root datum; representatives are for left cosets `WM\W`. For integral assertions use the split pinned reductive `ℤ`-model of ReductiveGroups Layer 9 and the cells and base-change-compatible closures constructed in §§3.14–3.15.

Choose a full-W dominant translate. Move its coset into a minimal left representative; any remaining Levi chamber motion fixes the wall weight after using its stabilizer. Use Coxeter parabolic factorization, not disjointness on walls.

**Checks.**

- `M=T`: `X*(T)=⋃_{w∈W}wX*(T)⁺`, every character being W-conjugate to a dominant one.
- `P=G`: only `w=1` occurs, and `X*(T)^{+,G}=X*(T)⁺`.
- `A₂` with `W_M=⟨s₁⟩`: the half-space `⟨λ,α₁^∨⟩≥0` is the union of the closed chambers `C`, `s₂C` and `s₂s₁C`. The boundary weight `ϖ₁`, fixed by `s₂`, lies in both `C` and `s₂C`, so the cones overlap on walls.
- Genus two in CG coordinates: the chambers `C₀={a≥b≥0}`, `C₁={a≥−b≥0}`, `C₂={−b≥a≥0}` and `C₃={−b≥−a≥0}` of CG p.28 cover exactly the Levi-dominant half-space `a≥b`.

(George Boxer; Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §1.3.3, p.3.)

*Needs:* [§3.11](#d3-kostant-cone-criterion); ReductiveGroups, Layer 7 (structure theory).

<a id="d3-kostant-involution"></a>

### 3.13 Kostant opposition involution

Prove `kostantInvolution`. Writing w0,G and w0,M for the longest elements of `W` and `WM`, `w↦w0,M w` w0,G preserves `^MW`, is an involution, and changes length to `dim(G/P)−ℓ(w)`. The longest Levi and full Weyl elements play distinct roles; they differ when `P` is proper and agree when `P=G`.

`G` is split reductive with `T⊂B⊂P`, standard Levi `M` and its Weyl subgroup `WM`. Length/Bruhat order use this based root datum; representatives are for left cosets `WM\W`. For integral assertions use the split pinned reductive `ℤ`-model of ReductiveGroups Layer 9 and the cells and base-change-compatible closures constructed in §§3.14–3.15.

The theorem `kostantInvolution` in `Suggested.lean` states the involution and complementary-length conclusions for any native Coxeter system with longest full and parabolic elements. It uses `cs.IsMinimalCosetRep J w⁻¹` for minimal left representatives and writes the length identity as `ℓ(w₀,M w w₀,G)+ℓ(w)+ℓ(w₀,M)=ℓ(w₀,G)`. For the geometric dimension identity, use positive-root characterization and longest-element root reversal; count roots outside the Levi, then square the map.

**Checks.**

- `A₂` with `W_M=⟨s₁⟩`, `w₀,M=s₁` and `w₀,G=s₁s₂s₁`: the map exchanges `1` and `s₂s₁` and fixes `s₂`, with lengths `0↔2` and `1↔1`, and `dim(G/P)=3−1=2`.
- Genus two ([§5.10](#d5-gsp4-kostant)): the map exchanges `1` with `s₂s₁s₂` and `s₂` with `s₂s₁`, reversing the lengths `0,1,2,3`.
- `M=T`: `w₀,M=1` and the map is `w↦ww₀`, with `ℓ(ww₀)=ℓ(w₀)−ℓ(w)`.

(George Boxer; Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §1.4, paragraph preceding Theorem 1.4.8, p.5.)

*Needs:* [§3.10](#d3-kostant-representatives); ReductiveGroups, Layer 7 (structure theory).

<a id="d3-bruhat-integral"></a>

### 3.14 Integral Bruhat stratification

Prove `bruhatIntegral`. For a split pinned reductive group over `ℤ` and standard `P`, the left-coset flag scheme `P\G` has `B`-orbit cells `Cw=P\PwB` indexed by `^MW`, each isomorphic to `A^{ℓ(w)}_ℤ`. The cells stratify the flag scheme, commute with base change, and have relative dimension `ℓ(w)`. This includes `ℤp` and `𝔽p`, not only characteristic-zero points.

`G` is split reductive with `T⊂B⊂P`, standard Levi `M` and its Weyl subgroup `WM`. Length/Bruhat order use this based root datum; representatives are for left cosets `WM\W`. For integral assertions use the split pinned reductive `ℤ`-model of ReductiveGroups Layer 9 and the cells and base-change-compatible closures constructed in §§3.14–3.15.

Establish `integralParabolicQuotient` by applying `parabolicTypeVariety` (§3.8) to the split pinned `ℤ`-group and its standard parabolic; inversion gives the left quotient `P\G`. Establish `integralBruhatCells` by ordering the root groups in the inversion set of each minimal left representative. Multiplication gives `C_w≅𝔸^{ℓ(w)}_ℤ`; this is an immersion into a translate of the open big cell. Root coordinates, Weyl representatives and quotient maps are over `ℤ`, so these cells commute with arbitrary base change. The field Bruhat theorem proves they exhaust every geometric fibre and hence the underlying integral flag space. The cells give a finite locally closed stratification, never an isomorphism from their coproduct. Use Conrad, Theorem 5.1.13, p.143, for the root products and open big cell, and Jantzen, Part II §§13.1–13.3, pp.353–356, and §13.8, pp.361–362, for the integral quotient-cell comparison; convert his right quotient by inversion.

**Checks.**

- `GL₂` with `P=B`: `P\G=ℙ¹_ℤ` is the union of the point `C₁` and the affine line `C_s`; over `𝔽_q` it has 1+q points.
- Point count: `#(P\G)(𝔽_q)=Σ_{w∈^MW}q^{ℓ(w)}`. For `A₂` with `W_M=⟨s₁⟩`, the lengths `0,1,2` give `1+q+q²=#ℙ²(𝔽_q)`; for the genus-two Siegel parabolic, the lengths `0,1,2,3` give `(1+q)(1+q²)`, the number of Lagrangian planes in `𝔽_q⁴`.
- `P=G`: the flag scheme is Spec `ℤ` with the single cell `C₁`.

(George Boxer; Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34.)

(George Boxer; Vincent Pilloni, [Higher Coleman theory](https://arxiv.org/pdf/2110.10251v1), §3.1, Lemma 3.1.3, p.32.)

*Needs:* [§3.10](#d3-kostant-representatives); ReductiveGroups, Layer 7 (structure theory); ReductiveGroups, Layer 9 (pinned Chevalley–Demazure group schemes).

<a id="d3-schubert-families"></a>

### 3.15 Schubert and opposite Schubert loci

Construct `schubertFamilies`. On `P\G`, define `Xw` as the scheme-theoretic closure of `Cw` and `X^w` as closure of the opposite-Borel cell `C^w`. Define `Yw` as the open union of standard cells `Cv` with `v≥w`. Use the corrected distinction between cells and their closures.

`G` is split reductive with `T⊂B⊂P`, standard Levi `M` and its Weyl subgroup `WM`. Length/Bruhat order use this based root datum; representatives are for left cosets `WM\W`. For integral assertions use the split pinned reductive `ℤ`-model of ReductiveGroups Layer 9 and the cells and base-change-compatible closures constructed in §§3.14–3.15.

Establish `integralSchubertBaseChange`: the schematic closures of the cells in the `ℤ-flag` are projective and flat over `ℤ`, have geometrically reduced Schubert fibres, and commute with arbitrary base change from `ℤ`; the same holds for opposite cells. Flatness follows from torsion freeness of the closure’s affine coordinate rings, but does not by itself prove the base-change assertion. For that assertion, use a reduced-word Bott–Samelson model, an iterated `ℙ¹-bundle`, mapping properly onto the closure and isomorphically onto its open cell. Pull back a sufficiently positive ample line bundle; vanishing and base change for its global sections identify the homogeneous ideals of the integral closure and every fibre. The ideal of the putative difference has no sections after a sufficiently positive twist and therefore vanishes. For partial flags use the projection from the full flag and its locally trivial `P/B` fibres. Jantzen, Part II §13.6, p.360, §13.8, pp.361–362, Proposition 14.15, pp.376–377, and Proposition 14.16 with its partial-flag remark, pp.377–378, give this construction and proof over Dedekind rings. Over an arbitrary `ℤ`-algebra use the resulting homogeneous coordinate comparison. The complement of `Y_w` is the finite lower Bruhat ideal of cell indices not `≥w`; the closure criterion makes its union closed.

- `schubertClosure`: The underlying locus of `Xw` is `⋃v≤w Cv`; the schematic closure is the flat integral Schubert scheme of `integralSchubertBaseChange`, compatibly with base change. A disjoint cell union is not asserted to equal `Xw` as a scheme.
- `oppositeSchubertClosure`: The underlying locus of `X^w` is `⋃v≥w C^v`, fibrewise and compatibly with `integralSchubertBaseChange`. The disjoint cell union is not an equality of schemes.
- `schubertUpperOpen`: `Yw` is open, contains `Cw`, and its complement is the lower closed Bruhat union.

**Checks.**

- For `P=B` in `SL₂`, `X₁` is a point, `X_s=ℙ¹`, `Y₁=ℙ¹` and `Y_s` is an affine open.
- The opposite closed point `X^s` is contained in the standard open cell `Y_s`, not in `X₁`.
- For `P=G` all three loci are the point and `ℓ(1)=0`.

(George Boxer; Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §6.1.8, p.60.)

(George Boxer; Vincent Pilloni, [Higher Coleman theory](https://arxiv.org/pdf/2110.10251v1), §3.1, pp.31–32.)

*Needs:* [§3.14](#d3-bruhat-integral); ReductiveGroups, Layer 9 (pinned Chevalley–Demazure group schemes).

<a id="d3-bruhat-closure-order"></a>

### 3.16 Bruhat closure criterion

Prove `bruhatClosureOrder`. The underlying locus of `Cv` is contained in that of `Xw` iff `v≤w`, and the underlying locus of `Xw` is the union of those cell loci, fiberwise through the integral stratification. This is not an isomorphism from the disjoint union of cell schemes onto `Xw`.

`G` is split reductive with `T⊂B⊂P`, standard Levi `M` and its Weyl subgroup `WM`. Length/Bruhat order use this based root datum; representatives are for left cosets `WM\W`. For integral assertions use the split pinned reductive `ℤ`-model of ReductiveGroups Layer 9 and the cells and base-change-compatible closures constructed in §§3.14–3.15.

Use the proper Bott–Samelson map of §3.15: its boundary strata correspond to subwords, giving the subword characterization of Bruhat order in every algebraically closed fibre. The integral base-change comparison transfers those closure relations to the `ℤ`-model. (Jantzen, Part II Proposition 13.7, pp.360–361, §13.8, pp.361–362, and Proposition 14.16, pp.377–378.)

**Checks.**

- `ℙ¹`: `C₁⊂X_s=ℙ¹` because `1≤s`, and `C_s⊄X₁={point}` because `s≰1`.
- `ℙ²` (`A₂` with `W_M=⟨s₁⟩`): `1<s₂<s₂s₁` is a chain, and the Schubert varieties are a point, a line and the plane.
- The underlying set of `X_s=ℙ¹` is `C₁⊔C_s`, but the disjoint union of schemes `𝔸⁰⊔𝔸¹` is not `ℙ¹`: it is neither proper nor connected.

(George Boxer; Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34.)

*Needs:* [§3.14](#d3-bruhat-integral); [§3.15](#d3-schubert-families); ReductiveGroups, Layer 9 (pinned Chevalley–Demazure group schemes).

<a id="d3-opposite-intersection"></a>

### 3.17 Opposite Schubert intersection criterion

Prove `oppositeIntersection`. For the standard and opposite Schubert varieties over an algebraically closed field, `X^w∩Xv` is nonempty iff `w≤v`. The integral closure/emptiness statements needed for the inclusion must remain valid after every base change.

`G` is split reductive with `T⊂B⊂P`, standard Levi `M` and its Weyl subgroup `WM`. Length/Bruhat order use this based root datum; representatives are for left cosets `WM\W`. For integral assertions use the split pinned reductive `ℤ`-model of ReductiveGroups Layer 9 and the cells and base-change-compatible closures constructed in §§3.14–3.15.

Prove the geometric fibre assertion using a maximal-torus fixed point in the projective, torus-stable intersection: its index `u` must satisfy `w≤u≤v`. Conversely, if `w≤v` the fixed point `w` lies in both varieties. The opposite big-cell product calculation gives the dimension `ℓ(v)−ℓ(w)`, and for `w=v` it gives the reduced fixed point. This is the Richardson calculation in Brion–Lakshmibai, §1, Lemma `1` and proof, pp.5–6 of arXiv `v1`. It applies in every characteristic; a central cover reduces the reductive case to their simply connected convention, and inversion converts the quotient convention. For integral emptiness, every geometric fibre of an excluded intersection is empty by §3.15’s base-change theorem, so the intersection scheme is empty. Thus the needed integral inclusion does not assume that an intersection’s schematic closure commutes with base change.

**Checks.**

- `ℙ¹ (P=B)`: `X^1=ℙ¹` and `X^s={s}`, while `X₁={1}` and `X_s=ℙ¹`. Hence `X^1∩X₁`, `X^1∩X_s` and `X^s∩X_s` are nonempty, and `X^s∩X₁=∅` because `s≰1`.
- For every `w∈^MW`, `X^w∩X_w` is the single T-fixed point `P\Pw`.
- For `w≤v` the intersection `X^w∩X_v` (a Richardson variety) has dimension `ℓ(v)−ℓ(w)`, since `dim X_v=ℓ(v)` and `X^w` has codimension `ℓ(w)`.

(George Boxer; Vincent Pilloni, [Higher Coleman theory](https://arxiv.org/pdf/2110.10251v1), Lemma 3.1.2 proof, p.32; Brion–Lakshmibai, §1, Lemma 1, pp.5–6 of arXiv v1.)

*Needs:* [§3.15](#d3-schubert-families); [§3.16](#d3-bruhat-closure-order); ReductiveGroups, Layer 9 (pinned Chevalley–Demazure group schemes).

<a id="d3-opposite-inside-upper"></a>

### 3.18 Opposite Schubert inclusion

Prove `oppositeInsideUpper`. For every `w∈^MW`, `X^w⊂Yw` as a closed subscheme of the open `Yw`. This holds for the integral flag and its `ℤp` and `𝔽p` fibers.

`G` is split reductive with `T⊂B⊂P`, standard Levi `M` and its Weyl subgroup `WM`. Length/Bruhat order use this based root datum; representatives are for left cosets `WM\W`. For integral assertions use the split pinned reductive `ℤ`-model of ReductiveGroups Layer 9 and the cells and base-change-compatible closures constructed in §§3.14–3.15.

If `X^w` meets `Cv` then it meets Xv, so `v≥w`. All excluded cells lie in its disjoint complement; the factorization through an open subscheme follows from the underlying containment. Apply §3.17 to every geometric fibre to obtain the integral open factorization. Since `X^w` is already closed in the flag, it is closed in this open subscheme as well; base change preserves the factorization.

**Checks.**

- `ℙ¹`: `X^1=ℙ¹⊂Y₁=C₁∪C_s=ℙ¹`, and `X^s={s}⊂Y_s=C_s≅𝔸¹`.
- For the longest `w∈^MW`, `Y_w=C_w` is the open cell and `X^w` is the point `P\Pw` inside it.
- The index matters: `X^1=ℙ¹` is not contained in `Y_s=𝔸¹`. So `X^w⊂Y_{w′}` fails for `w′>w`, and replacing `Y_w` by its single cell `C_w` is too restrictive: `X^1=ℙ¹` is not contained in `C₁={1}`.

(George Boxer; Vincent Pilloni, [Higher Coleman theory](https://arxiv.org/pdf/2110.10251v1), Lemma 3.1.2, p.32.)

*Needs:* [§3.17](#d3-opposite-intersection); [§3.16](#d3-bruhat-closure-order); [§3.15](#d3-schubert-families).

### Examples

For `GL₂` the compact dual is `ℙ¹`, with a point and an affine line as its Bruhat cells. For the Picard signature `(2,1)` it is `Gr(2,3)≅ℙ²`; its three cells have dimensions `0,1,2`. These examples distinguish left/right and ordinary/opposite closure conventions.

### Dependencies

StableReduction Layer 2; ComplexComparisonPartII §C−1.1; ArithmeticLocallySymmetricSpaces §ALS.4.5; ShimuraVarieties §§P.1–P.5; `TauCeti.Hodge.HodgeStructureOn.IsMorphism.isSubstructure_ker`; `TauCeti.Hodge.HodgeStructureOn.IsMorphism.isSubstructure_range`; `TauCeti.Hodge.HodgeStructureOn.IsSubstructure`; `TauCeti.Hodge.HodgeStructureOn.IsSubstructure.hodgeStructure`; `TauCeti.Hodge.HodgeStructureOn.IsSubstructure.isMorphism_subtype`; `TauCeti.Hodge.IsPolarization`; `TauCeti.Hodge.RationalHodgeSubstructure.isCompl_orthogonal`; `TauCeti.Hodge.RationalHodgeSubstructure.orthogonal`; `TauCeti.LocalCoefficientSystem`; HodgeStructures, L0 (pure Hodge structures); HodgeStructures, L1 (polarization and semisimplicity); ReductiveGroups, Layer 1 (representations and comodules); ReductiveGroups, Layer 7 (structure theory); ReductiveGroups, Layer 9 (pinned Chevalley–Demazure group schemes); RepresentationTheory/LieGroups, Layer 8 (Borel–Weil, flag manifolds and Bruhat).

## Layer 4: types, additional axioms and distinguished data

The definitions separate PEL, Hodge, abelian and preabelian type from additional centre and weight hypotheses. The last targets supply the auxiliary data needed to compare constructions across a central derived isogeny.

<a id="d4-preabelian-type"></a>

### 4.1 Preabelian type

Define `preabelianType`. A pure datum `(G,X)` (ShimuraVarieties §P.1) is of preabelian type if there are a datum `(G₁,X₁)` of Hodge type (§P.1) and components `X⁺⊂X`, `X₁⁺⊂X₁` with an isomorphism of connected adjoint data `(G₁^ad,X₁⁺)≅(G^ad,X⁺)` in §P.1's connected convention. This is Hansen–Johansson's Definition 4.1: no central isogeny of derived groups is required, and no isomorphism of the full orbits.

`(G,X)` is a pure Shimura datum in the sense of ShimuraVarieties §P.1 (the ShimuraVarieties roadmap): `G` connected reductive over `ℚ`, `X` a nonempty full `G(ℝ)`-class of algebraic `h:S→G_ℝ` satisfying `SV1–SV3`, with `S` the Deligne torus of ReductiveGroupsPartII §RG2.0a.3.

Hodge type, adjoint data and the connected convention (C1)–(C3) are ShimuraVarieties §P.1's.

Quantify over the Hodge-type witness and connected-adjoint datum isomorphism; descend the predicate from any chosen component.

- `abelianTypePreabelian`: Abelian type implies preabelian type by forgetting the derived isogeny.
- `preabelianTypeAdjoint`: The predicate depends only on the connected adjoint datum.
- `preabelianTypeIsomorphism`: Isomorphic connected adjoint data have equivalent preabelian predicates.
- `preabelianTypeConnected`: For a connected datum `(H,X⁺)` in ShimuraVarieties §P.1's convention (C1)–(C3), with `H` semisimple, preabelian type means `(H^ad,X⁺)≅(G₁^ad,X₁⁺)` for some Hodge-type datum `(G₁,X₁)`. A pure datum is of preabelian type exactly when its connected derived datum `(G^der,X⁺)` is, and the predicate on connected data depends only on `(H^ad,X⁺)` (Hansen–Johansson Definition 4.1).

**Checks.**

- The Siegel datum is preabelian type.
- Every torus datum is preabelian type: its connected adjoint datum is trivial, as is that of the Hodge-type CM elliptic torus.
- For real quadratic `F`, the general Hilbert datum is preabelian via the Hodge-type common-determinant datum, although their full domains have four and two components respectively.
- The connected datum `(SL₂,ℍ)` is of preabelian type through `GL₂`, although the fundamental `PGL₂` cocharacter does not lift to `SL₂` (ShimuraVarieties §P.1 Check).
- A pure datum with absolutely simple adjoint group of exceptional type `E₇` is not preabelian. Prove `preabelianExceptionalFalse`: a Hodge-type witness would give a symplectic representation of the simply connected real derived cover compatible with the adjoint `S`-map and a weight `−1` Hodge structure of types `{(−1,0),(0,−1)}`. Milne, *Shimura varieties and moduli*, Summary 10.11, p.531, and the rational exceptional-type argument, p.532, exclude such a Hodge representation. The obstruction depends on the connected adjoint datum and survives central extensions; it does not exclude arbitrary representations preserving an alternating form.

(David Hansen; Christian Johansson, [Completed cohomology and preabelian type Shimura varieties](https://pure.mpg.de/rest/items/item_3525265_3/component/file_3560933/content), Definition 4.1, §4.1, published p.1980 (PDF p.27).)

*Needs:* ShimuraVarieties §§P.1–P.5.

<a id="d4-type-implications"></a>

### 4.2 PEL–Hodge–abelian–preabelian implications

Prove `typeImplications`. For every pure datum: PEL type ([§4.5](#d4-pel-type)) implies Hodge type, through PELModuli §M0.12's Siegel morphism; Hodge type implies abelian type, through the identity of the derived group; abelian type implies preabelian type, by forgetting the derived isogeny. These are implications between separately defined predicates; no converse is asserted. The restriction-of-scalars Hilbert datum over a real quadratic field is of abelian type but not of Hodge type, because it fails `SV5` while Hodge-type data satisfy `SV2*` and hence `SV5`.

`(G,X)` is a pure Shimura datum in the sense of ShimuraVarieties §P.1 (the ShimuraVarieties roadmap): `G` connected reductive over `ℚ`, `X` a nonempty full `G(ℝ)`-class of algebraic `h:S→G_ℝ` satisfying `SV1–SV3`, with `S` the Deligne torus of ReductiveGroupsPartII §RG2.0a.3.

Hodge and abelian type are ShimuraVarieties §P.1's; PEL type is [§4.5](#d4-pel-type); preabelian type is [§4.1](#d4-preabelian-type).

`PEL⇒Hodge`: the witness of [§4.5](#d4-pel-type) carries PELModuli §M0.12's siegelMorphism, a closed immersion of groups mapping the domain into the Siegel domain.

`Hodge⇒abelian`: take the Hodge-type datum itself and the identity of its derived group.

`Abelian⇒preabelian`: forget the central derived isogeny and keep the adjoint isomorphism.

Non-converse: a Hodge-type datum `(G,X)⊂(GSp,ℋ^±)` satisfies `SV2*` because `Int(h(i))` is Cartan on `GSp_ℝ/G_m` and restricts to a Cartan involution of the closed subgroup `G_ℝ/w(G_m)`; `SV2*` gives compactness of `Z(ℝ)/w(ℝ^×)` and so `SV5` ([§4.4](#d4-sv5-criterion)). The Hilbert datum over `ℚ(√2)` fails `SV5` ([§4.3](#d4-additional-axioms) test) but is of abelian type through the scalar-determinant datum.

**Checks.**

- `(G_m,{1})` is abelian and preabelian type through a CM elliptic torus witness: both derived groups and connected adjoint data are trivial. It is neither Hodge nor PEL type, since its trivial `h` cannot map to the nontrivial `h` of a positive-genus Siegel datum.
- The genus-g Siegel datum has all four properties.
- The restriction-of-scalars Hilbert datum over `ℚ(√2)` is of abelian type and not of Hodge type.

(David Hansen; Christian Johansson, [Completed cohomology and preabelian type Shimura varieties](https://pure.mpg.de/rest/items/item_3525265_3/component/file_3560933/content), §4.1 and Definition 4.1, published p.1980 (PDF p.27).)

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §8, PEL Shimura data, p.88; §5, Notes, p.66.)

*Needs:* [§4.5](#d4-pel-type); [§4.1](#d4-preabelian-type); [§4.3](#d4-additional-axioms); [§4.4](#d4-sv5-criterion); ShimuraVarieties §§P.1–P.5; PELModuli §M0.12.

<a id="d4-additional-axioms"></a>

### 4.3 Additional axioms SV2*, SV4, SV5, SV6

Define `PureDatum.AdditionalAxioms`. For a pure Shimura datum `(G,X)` with weight `w_X:G_{m,ℝ}→Z(G)°_ℝ` and centre `Z=Z(G)`, define four predicates. `SV2*`: for `h∈X`, `Int(h(i))` is a Cartan involution of `G_ℝ/w_X(G_m)` (Deligne's 2.1.1.5). `SV4`: `w_X` is defined over `ℚ`, i.e. the weight is rational (Deligne's 2.1.1.4). `SV5`: `Z(ℚ)` is discrete in `Z(𝔸_f)`. `SV6`: the torus `Z°` splits over a CM field. Each is a property of the datum: independent of `h∈X` and invariant under isomorphism of data. With `SV1–SV3` of ShimuraVarieties §P.1, `SV4` and `SV2*` are Deligne's conditions 2.1.1.1–2.1.1.5. `SV2*` implies `SV2`, and under `SV4` every rational representation of `G` and every `h∈X` give a rational Hodge structure.

`(G,X)` is a pure Shimura datum in the sense of ShimuraVarieties §P.1 (the ShimuraVarieties roadmap): `G` connected reductive over `ℚ`, `X` a nonempty full `G(ℝ)`-class of algebraic `h:S→G_ℝ` satisfying `SV1–SV3`, with `S` the Deligne torus of ReductiveGroupsPartII §RG2.0a.3.

Cartan involutions are ArithmeticLocallySymmetricSpaces §ALS.0.1's (compact twisted real form, with the Killing criterion on the derived algebra and a separate condition on the central torus); `Z(𝔸_f)` carries AdelicAlgebraicGroups §1.3's topology; a CM field is a totally imaginary quadratic extension of a totally real number field (Mathlib `NumberField.IsCMField`).

Independence of `h`: points of `X` are `G(ℝ)-conjugate`; conjugation fixes the central weight and carries `Int(h(i))` to `Int(gh(i)g⁻¹)`, and inner automorphisms preserve Cartan involutions (ALS.0.1, conjugacy of Cartan involutions). `SV4–SV6` do not involve `h`.

`SV2*⇒SV2`: by ALS.0.1's Killing criterion, a Cartan involution of `G_ℝ/w_X(G_m)` is positive on the derived algebra, which is the Lie algebra of `G^ad_ℝ`; that positivity is `SV2`.

Isomorphism invariance: an isomorphism of data is a `ℚ`-isomorphism of groups carrying `X` to `X′`, so it carries weights, centres and their `ℚ-structures` to each other.

`SV4` and rational Hodge structures: if `w_X` is defined over `ℚ` then `ρ∘w_X` is a `ℚ`-cocharacter of `GL(V)` for every rational representation `ρ`, and [§1.1](#d1-rational-weight-criterion) makes `(V,ρ∘h)` a rational Hodge structure.

Products: the weight of `(G₁×G₂,X₁×X₂)` is `(w₁,w₂)` and its centre is `Z₁×Z₂`, so `SV4` and `SV5` hold for the product iff they hold for both factors, and so does `SV6` because a compositum of CM fields is CM. `G_i/w_i(G_m)` is a quotient of `(G₁×G₂)/(w₁,w₂)(G_m)` and the image of a compact twisted form is compact, so `SV2*` passes from the product to each factor. The converse fails: `(Z₁×Z₂)/(w₁,w₂)(G_m)` can contain a split torus although each `Z_i/w_i(G_m)` is anisotropic (the product check below).

- `sv2Star_indep`: `SV2*` holds for one `h∈X` iff it holds for every `h∈X`.
- `sv2Star_sv2`: `SV2*` implies `SV2`.
- `sv4_rationalHodge`: Under `SV4`, for every rational representation `ρ:G→GL(V)` and `h∈X`, `(V,ρ∘h)` is a rational Hodge structure ([§1.1](#d1-rational-weight-criterion)).
- `additionalAxioms_iso`: Each of `SV2*`, `SV4`, `SV5`, `SV6` is invariant under isomorphism of data.
- `additionalAxioms_prod`: `SV4`, `SV5` and `SV6` hold for a product of data iff they hold for both factors (the centre of a product is the product of the centres, and a compositum of CM fields is CM); `SV2*` for a product implies `SV2*` for both factors, but not conversely.

**Checks.**

- The `GL₂` datum satisfies `SV2*`, `SV4 (w(r)=r⁻¹I₂)`, `SV5` (`ℚ^×∩Ẑ^×={±1}` is finite, so `ℚ^×` is discrete in `𝔸_f^×`) and `SV6` (the centre `G_m` is split).
- For `F=ℚ(√2)` the restriction-of-scalars Hilbert datum satisfies `SV4` but not `SV5`: `Z(ℚ)=F^×` meets the compact open `Ô_F^×` in the infinite group `O_F^×∋1+√2`.
- For a quaternion algebra over `ℚ(√2)` split at exactly one real place, Milne's Example 5.24 datum has weight `r↦(1,r⁻¹I₂)` on `ℍ^×·GL₂(ℝ)`, not defined over `ℚ`: `SV4` fails while `SV1–SV3` hold.
- The torus datum `(G_m,{1})` satisfies `SV1–SV6` but not `SV2*`: the identity is not a Cartan involution of `G_m,ℝ`, whose real points `ℝ^×` are not compact.
- The product of two copies of the `GL₂` datum satisfies `SV4`, `SV5` and `SV6`, and each factor satisfies `SV2*`, but the product does not: its weight is `r↦(r⁻¹I₂,r⁻¹I₂)`, and its centre `G_m×G_m` modulo that weight is a split `G_m`, on which Int `h(i)` is the identity while `ℝ^×` is not compact.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §5, Additional axioms, p.63; Notes, p.66.)

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 5.24, pp.63–64.)

*Needs:* ShimuraVarieties §§P.1–P.5; [§1.1](#d1-rational-weight-criterion); ArithmeticLocallySymmetricSpaces `§§ALS.F.1`, ALS.0.1–0.2; AdelicAlgebraicGroups §§1.3–1.4; `NumberField.IsCMField`.

<a id="d4-sv5-criterion"></a>

### 4.4 Discreteness criterion for the rational centre

Prove `sv5_iff_anisotropic`. For a `ℚ`-torus `T` let `T_a` be its largest `ℚ-anisotropic` subtorus (the identity component of the common kernel of the `ℚ`-rational characters). Then `T(ℚ)` is discrete in `T(𝔸_f)` if and only if `T_a(ℝ)` is compact, that is, `T_a` stays anisotropic over `ℝ`. Consequently a pure datum `(G,X)` satisfies `SV5` if and only if the largest `ℚ-anisotropic` subtorus of `Z(G)°` is anisotropic over `ℝ`.

`T` is a torus over `ℚ`; `T(𝔸_f)` carries AdelicAlgebraicGroups §1.3's topology and `T(ℚ)` its diagonal image.

For the consequence, `(G,X)` is a pure datum (ShimuraVarieties §P.1); `Z(ℚ)` is discrete iff `Z°(ℚ)` is, `Z°(ℚ)` having finite index.

AdelicAlgebraicGroups §1.3 (discreteness in the finite adeles alone): `T(ℚ)` is discrete in `T(𝔸_f)` iff `T(ℚ)∩U` is finite for one compact open `U`; for `U` the integral points of a model this intersection is an arithmetic subgroup `T(ℤ)`.

Prove the local auxiliary `torusArithmeticAnisotropicFiniteIndex`: `T(ℤ)∩T_a(ℚ)` has finite index in `T(ℤ)`. Choose a `ℤ-basis` of `X*_ℚ(T)`, the group of characters defined over `ℚ`, rather than the full geometric character lattice. Their images of the chosen compact open `U` are compact subgroups of `𝔸_f^×`, hence lie in `Ẑ^×`. At rational points each character therefore takes values in `{±1}`. The common character kernel has identity component `T_a` and finite component group, so its rational points modulo `T_a(ℚ)` are finite. Combining these two finite images proves the assertion. The same argument works for any arithmetic compact-open intersection. This is the finite-index step in Milne’s proof of Theorem 5.26, p.64, expressed through the rational character lattice. Compactness of `T_a(ℝ)/(T(ℤ)∩T_a(ℚ))` is the anisotropic arithmetic-quotient theorem of AdelicAlgebraicGroups §3.4.

For a faithful representation `T⊂GL_n`, `T(ℤ)⊂GL_n(ℤ)` is discrete in `T(ℝ)⊂GL_n(ℝ)`, and so is `T(ℤ)∩T_a(ℚ)` in `T_a(ℝ)`; a discrete subgroup with compact quotient of the abelian Lie group `T_a(ℝ)` is finite iff `T_a(ℝ)` is compact. With the finite-index statement, `T(ℤ)` is finite iff `T_a(ℝ)` is compact.

For a datum, apply this to `T=Z(G)°`.

**Checks.**

- For `G_m`, `T_a=1`, so `ℚ^×` is discrete in `𝔸_f^×`.
- For the norm-one torus of `ℚ(i)`, `T_a=T` has compact real points `U(1)`, so `T(ℚ)` is discrete; `T(ℤ)={±1,±i}`.
- For the norm-one torus of `ℚ(√2)`, `T_a=T` has real points `{(a,b):ab=1}`, not compact, and `T(ℤ)={±(3+2√2)^n}={±(1+√2)^{2n}}` is infinite (`1+√2` has norm `−1`; the stated sign convention), so `T(ℚ)` is not discrete.
- The `GL₂` datum satisfies `SV5` and the restriction-of-scalars Hilbert datum over `ℚ(√2)` does not.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Theorem 5.26, Example 5.25 and Remark 5.27, p.64.)

*Needs:* [§4.3](#d4-additional-axioms); AdelicAlgebraicGroups §§1.3–1.4; AdelicAlgebraicGroups §3.4; ArithmeticLocallySymmetricSpaces `§§ALS.F.1`, ALS.0.1–0.2; ReductiveGroups, Layer 4 (Jordan decomposition, diagonalizable groups and tori).

<a id="d4-pel-type"></a>

### 4.5 PEL type

Define `PureDatum.IsPELType`. A pure datum `(G,X)` is of PEL type if it is isomorphic, as a datum, to `RationalPELDatum.toShimuraDatum(𝒟)` of PELModuli §M0.12 for a rational PEL datum `𝒟=(B,*,V,ψ,h)` with `V≠0` whose similitude group `G_𝒟` is connected and satisfies `SV3`; the witness is `𝒟` together with the isomorphism. By §M0.12 the Siegel embedding `G_𝒟→GSp(V,ψ)` is a morphism to the genus-g Siegel datum `(2g=dim_ℚV)`, so PEL type implies Hodge type; a datum of PEL type satisfies `SV4`.

Rational PEL data, their groups, domains and Shimura data are PELModuli §§M0.6–M0.12's; data and their isomorphisms are ShimuraVarieties §P.1's.

Connectedness of `G_𝒟` and `SV3` are imposed explicitly: §M0.12 shows that type `D` groups are disconnected and that wholly definite unitary data of rank at least two fail `SV3`.

The predicate is an existential over rational PEL data with `V≠0`, connected group and `SV3`, and over isomorphisms of data.

Invariance under isomorphism: compose the witness isomorphism.

`PEL⇒Hodge`: §M0.12's siegelMorphism is a closed immersion of groups carrying `X_𝒟` into the Siegel domain, a Hodge-type witness in the sense of ShimuraVarieties §P.1.

`SV4`: the weight of `toShimuraDatum(𝒟)` acts on `V` by the scalar `r⁻¹`, which is defined over `ℚ`.

- `pelType_iso`: PEL type is invariant under isomorphism of data.
- `pelType_hodgeType`: PEL type implies Hodge type, through PELModuli §M0.12's siegelMorphism.
- `pelType_sv4`: A datum of PEL type satisfies `SV4`.
- `pelType_ofDatum`: A rational PEL datum with `V≠0`, connected group and `SV3` gives a datum of PEL type.

**Checks.**

- The genus-g Siegel datum `(g≥1)` is of PEL type, through the Siegel PEL datum with `B=ℚ` (PELModuli §M5.1).
- For totally real `F` the scalar-determinant Hilbert datum of PELModuli §M5.4 is of PEL type.
- Milne's Example 5.24 datum for a quaternion algebra over `ℚ(√2)` split at exactly one real place is not of PEL type: it fails `SV4`.
- For a CM field `K` and PELModuli §M5.5's unitary datum of signatures `(r_τ,s_τ)` at `τ∈Φ`, with `GU(V)` connected and `SV3` holding, the datum is of PEL type and its domain has dimension `Σ_τ r_τs_τ`. Signature `(n,n)` at every `τ` gives dimension `[K⁺:ℚ]n²`, and the wholly definite signature (n,0), `n≥2`, gives no datum, because `SV3` fails.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §8, PEL data and Proposition 8.14, pp.86–88.)

*Needs:* ShimuraVarieties §§P.1–P.5; PELModuli §M0.12; [§4.3](#d4-additional-axioms).

<a id="d4-connected-datum-lift"></a>

### 4.6 Lifting connected data to full data

Prove `exists_pureDatum_lift`. Let `H` be a semisimple `ℚ`-group and `h̄:S→H^ad_ℝ` satisfy `SV1–SV3` (a connected datum in ShimuraVarieties §P.1's convention). Then there are a connected reductive `ℚ`-group `G` with `G^der=H` and an algebraic `h:S→G_ℝ` with `ad∘h=h̄` such that the `G(ℝ)`-class of `h` is a pure datum satisfying `SV1`, `SV2`, `SV2*`, `SV3`, `SV4`, `SV5` and `SV6`. In Milne's two steps: first `G` with `G^der=H`, rational weight and centre split by a CM field; then, replacing `G` by the preimage of the smallest subtorus of `G/G^der` whose real points contain the image of `h`, `SV2*` as well.

`H` is semisimple over `ℚ` and `h̄` satisfies `SV1–SV3`; the connected convention, special pairs and maximal tori through `h̄` are ShimuraVarieties §§P.1 and P.5's.

Prove the auxiliary `centralExtensionWithDerivedCover`. Over a characteristic-zero field `k`, let `q:H′→D^der` be a central isogeny of connected semisimple groups, and choose a finite Galois `L/k` splitting a maximal torus `T` of the connected reductive group `D`. There is a central extension `1→N→D₁→D→1` with `D₁^der=H′` and X*(N) a finite free `ℤ[Gal(L/k)]`-module; thus `N` is a product of `Res_{L/k}G_m`. This strengthens the simply connected `z`-extension input in ReductiveGroupsPartII §RG2.1.5 by allowing the prescribed cover `H′`.

The construction is on torus lattices. If `T′` is the inverse image of `T∩D^der` in `H′`, form the finitely generated Galois module `M=X_*(T)/X_*(T′)`. Prove the finite presentation auxiliary `galoisLatticeResolution`: `0→P₁→P₀→M→0` with `P₀` finite free as an abelian group and `P₁` finite free over `ℤ[Gal(L/k)]`. Start with an abelian free presentation, induce it to the group ring, and pull back along `m↦Σ_g g⊗g⁻¹m`; this resolves possible torsion in `M` as well. The pullback `Q=P₀×_M X_*(T)` is a lattice containing `X_*(T′)` primitively, since its quotient is `P₀`. Its torus `T₁` maps onto `T` with kernel lattice `P₁`. Pull back the centre of `D` inside `T` along `T₁→T`, and form the central amalgam with the simply connected cover of `D^der`; the primitive lattice embedding makes its derived group precisely `H′`, and its kernel over `D` is the torus `N`. Milne–Shih, Proposition 3.1, Lemma 3.2 and Remark 3.3(a), pp.297–299, prove this lattice construction. Tests: `q=SL₂→PGL₂` produces a reductive extension with derived `SL₂`; `q=id` allows a non-simply-connected derived group; `D` a torus has trivial prescribed derived group. These distinguish the theorem from an assertion restricted to simply connected covers.

Replace `h̄` by an `H^ad(ℝ)^+-conjugate` factoring through `T̄_ℝ` for a maximal `ℚ`-torus `T̄` of `H^ad` (Milne `2013`, Proposition 8.1; ShimuraVarieties §P.5). `T̄_ℝ` is anisotropic by `SV2`, so complex conjugation acts as `−1` on `X*(T̄)` and `T̄` splits over a CM field `L`, chosen Galois over `ℚ`.

Take a central extension `1→N→G→H^ad→1` with `G^der=H` and `N` a product of copies of `Res_{L/ℚ}G_m` by `centralExtensionWithDerivedCover`.

The preimage `T` of `T̄` is a maximal torus. Lift `μ_h̄` to `μ∈X_*(T)`, possible because `N` is connected. Its weight `w=−μ−ιμ` lies in `X_*(N)`; `X_*(N)` is an induced `Gal(ℂ/ℝ)`-module, so its Tate group `Ĥ⁰` vanishes and `w=(ι+1)μ₀` with `μ₀∈X_*(N)`. Replacing `μ` by `μ+μ₀` gives weight `−(1+ι)(μ+μ₀)=w−w=0`, in particular rational. Let `h` be the real `S`-map with cocharacter `μ+μ₀` and its conjugate; the two cocharacters commute in `T`. The displayed calculation fixes the sign of the adjustment.

Replace `G` by the preimage of the smallest subtorus of `G/G^der` whose real points contain the image of `h`; it is `ℝ-anisotropic`, which gives `SV2*`. `SV1` and `SV3` depend only on `h̄`; `SV2` follows from `SV2*`; `SV5` follows from `SV2*` and [§4.4](#d4-sv5-criterion), since `Z(ℝ)/w(ℝ^×)` is compact; `SV6` holds because the new centre lies in `N`, split by `L`.

**Checks.**

- For `H=SL₂` and its connected datum on `ℍ`, `G=GL₂` with its usual `h` is such a lift.
- The fundamental `PGL₂` cocharacter does not lift to `SL₂` (ShimuraVarieties §P.1 Check), so a lift with `G^der=SL₂` must have `G≠SL₂`.
- For `H` trivial the construction returns a torus `G` and may return `G=1` with `h` trivial.

(J. S. Milne, [Shimura varieties and moduli](https://www.jmilne.org/math/xnotes/svhIP.pdf), §8, Proposition 8.8 and Corollary 8.9, pp.512–513; Proposition 8.1, p.509.)

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §5, Aside after Remark 5.30, p.66.)

*Needs:* [§4.3](#d4-additional-axioms); [§4.4](#d4-sv5-criterion); ShimuraVarieties §§P.1–P.5; ReductiveGroupsPartII §RG2.1.5 and the prescribed-cover extension in Layer 4.6; ReductiveGroups, Layer 6 (reductive and semisimple groups); ReductiveGroups, Layer 4 (Jordan decomposition, diagonalizable groups and tori).

<a id="d4-product-reflex-field"></a>

### 4.7 Reflex field of a product datum

Prove `reflexField_prod`. For pure data `(G₁,X₁)` and `(G₂,X₂)` with product `(G₁×G₂,X₁×X₂)` (ShimuraVarieties §P.1), the reflex field of the product is the compositum inside `ℚ̄`: `E(G₁×G₂,X₁×X₂)=E(G₁,X₁)·E(G₂,X₂)`. The same holds for finitely many factors.

`(G₁,X₁)` and `(G₂,X₂)` are pure Shimura data in the sense of ShimuraVarieties §P.1 (the ShimuraVarieties roadmap); their product, with componentwise `h`, is §P.1's product datum.

Cocharacter classes and reflex fields are ShimuraVarieties §P.3's: `E(D)` is the fixed field of the open stabilizer in `Gal(ℚ̄/ℚ)` of the conjugacy class of `μ_h`, and `E(D′)⊂E(D)` for every datum morphism `D→D′`.

For `h=(h₁,h₂)∈X₁×X₂`, `μ_h=(μ_{h₁},μ_{h₂})`, and two cocharacters of `G₁×G₂` are conjugate iff their components are, so the class of the product is the pair of classes and `σ∈Gal(ℚ̄/ℚ)` fixes it iff `σ` fixes both.

The stabilizer of the pair is the intersection of the two open stabilizers; by Galois theory its fixed field is the compositum of their fixed fields, `E(G₁,X₁)E(G₂,X₂)`.

This refines §P.3's functoriality: the two projections are datum morphisms, so each `E(G_i,X_i)` lies in the reflex field of the product; the stabilizer computation gives equality. Induct on the number of factors.

**Checks.**

- The product of two Siegel data has reflex field `ℚ`.
- For an imaginary quadratic field `K`, the product of the `GL₂` datum with the torus datum of the CM type of an elliptic curve with CM by `K` (reflex field `K`) has reflex field `K`.
- For CM types `(E₁,Φ₁)` and `(E₂,Φ₂)` with reflex fields `E₁*` and `E₂*`, the product of their torus data has reflex field `E₁*E₂*`, not `E₁*∩E₂*`.
- The product with the one-point datum of the trivial group has the reflex field of the other factor.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Lemma 12.1, Definition 12.2 and Remark 12.3, pp.111–112.)

*Needs:* ShimuraVarieties §§P.1–P.5.

<a id="d4-distinguished-datum"></a>

### 4.8 Lovering's distinguished datum `B(G^der, X⁺, E)`

Construct `distinguishedDatum`. Let `(G,X)` be a pure datum (ShimuraVarieties §P.1) with a component `X⁺` and connected derived datum `(G^der,X⁺)`, and let `E⊂ℂ` be a number field containing the reflex field `E(G,X)` (ShimuraVarieties §P.3). The abelianized Hodge cocharacter `μ^ab` (`μ_h` followed by `G→G^ab`) does not depend on `h∈X` and is defined over `E(G,X)⊆E`. Let `r:E*=Res_{E/ℚ}G_m→G^ab` be `Res_{E/ℚ}(μ^ab)` followed by the norm `Res_{E/ℚ}G^ab_E→G^ab`, and put `B=G×_{G^ab}E*` for `δ:G→G^ab` and `r`. (a) `B` is a connected reductive `ℚ`-group in an exact sequence `1→G^der→B→E*→1`, so `B^der=G^der` and `B^ad=G^ad`. (b) For `h∈X⁺` let `h_E:S→E*_ℝ` be `z↦zz̄` at the place of `E` given by `E⊂ℂ` when that place is real, `z↦z` there when it is complex, and trivial at the other archimedean places. Then `(h,h_E)` factors through `B_ℝ`, and its `B(ℝ)`-class `X_B` is a pure datum with reflex field `E` and a morphism `(B,X_B)→(G,X)`; `X_B` does not depend on `h∈X⁺`. (c) Up to canonical isomorphism, `(B,X_B)` depends only on `(G^der,X⁺)` and `E`, among the data with connected datum `(G^der,X⁺)` and reflex field contained in `E`. (d) A central isogeny of connected data `(G₁^der,X₁⁺)→(G^der,X⁺)`, with `E` containing both reflex fields, induces a morphism `(B₁,X_{B₁})→(B,X_B)` given by a central isogeny `B₁→B`. For `E(G,X)⊆F⊆E` the norm `N_{E/F}` induces `(B_E,X_E)→(B_F,X_F)`. For `(G,X)` of abelian type with a Hodge-type witness `(G₁,X₁)` and `E=E(G,X)E(G₁,X₁)`, this gives Boxer–Pilloni's diagram `(B₁,X_{B₁})→(B,X_B)`, `(B₁,X_{B₁})→(G₁,X₁)`, `(B,X_B)→(G,X)`, with `B₁=G₁×_{G₁^ab}Res_{E/ℚ}G_m`. All four data share the adjoint datum `(G^ad,X^ad)` and the compact dual `G^ad_ℂ/P_h^ad`.

`(G,X)` is a pure Shimura datum in the sense of ShimuraVarieties §P.1; reflex fields and the cocharacter class are §P.3's; Weil restriction and norms of tori are ReductiveGroupsPartII §RG2.0a's.

`E` is a number field with a fixed embedding `E⊂ℂ` and `E⊇E(G,X)`; in `(d) E` contains the reflex fields of both data. Abelian type and Hodge type are ShimuraVarieties §P.1's.

`μ^ab` is a cocharacter of the torus `G^ab`, so its conjugacy class is a single cocharacter. It is fixed by `Gal(ℚ̄/E(G,X))` because the class of `μ_h` is, and therefore defined over `E(G,X)⊆E`. The norm of `Res_{E/ℚ}(μ^ab)` is a `ℚ`-map `r:E*→G^ab` (Lovering 4.6.1, p.37).

`B=G×_{G^ab}E*` is a fibre product of `ℚ`-groups. Since `δ` is surjective with kernel `G^der`, the projection `B→E*` is surjective with kernel `G^der`, so `B` is connected and reductive, with `B^der=G^der` and `B^ad=G^ad` (Lovering Lemma 4.6.2, p.38).

`(h,h_E)` is a point of `B_ℝ` because `δ∘h`, the real `S`-map of the torus `G^ab` with cocharacter `μ^ab`, equals `r∘h_E`; Lovering checks this at a real and at a complex place (Proposition 4.6.5, pp.39–40). Its image in `G^ad` is that of `h`, so `SV1–SV3` hold. The reflex field is `E(B^ad,X^ad)·E(B^ab,h^ab)=E`. For `h′∈X⁺`, `h′=ghg⁻¹` with `g∈G^der(ℝ)⁺`, since `G^der(ℝ)⁺→G^ad(ℝ)⁺` is onto; as `G^der⊂B`, `(h′,h_E)` lies in `X_B`.

Independence: two data `(G,X)`, `(G′,X′)` with connected datum `(G^der,X⁺)` and reflex fields in `E` receive morphisms from the neutral component `G″` of `G×_{G^ad}G′`, with the class of `(h,h′)`. This is Deligne's fibre-product argument, 2.5.6, p.282. A morphism `α:(G,X)→(G₂,X₂)` inducing an isomorphism on connected data gives `B→B₂` by `f=α∘pr_G` and `k=pr_{E*}`; these agree in `G₂^ab` because `α^ab∘μ^ab=μ₂^ab`, so `α^ab∘r=r₂`. Both outer maps of the extensions are isomorphisms, so `B≅B″≅B′` canonically (Lovering Proposition 4.6.3, pp.38–39).

Functoriality: for a central isogeny with kernel `Δ₁⊂G₁^der⊂B₁`, the quotient `(B₁/Δ₁,X_{B₁}/Δ₁)` has connected datum `(G^der,X⁺)` and reflex field in `E`, so by independence it is isomorphic to `(B,X_B)`. The norm `N_{E/F}:E*→F*` induces `B_E→B_F`, and `h_F=N_{E/F}∘h_E` (Lovering Lemma 4.6.6, pp.40–41).

Abelian type: apply the construction to `(G₁,X₁)` and to `(G,X)` with the same `E`. The central isogeny `G₁^der→G^der` gives `B₁→B` by functoriality. The projections give `B₁→G₁` and `B→G`, and all these maps are isomorphisms or central isogenies on derived groups (Boxer–Pilloni §4.4.41, pp.78–79). The centre of a reductive group lies in every parabolic subgroup, so the compact duals are all `G^ad_ℂ/P_h^ad`.

- `distinguishedDatum`: The group `B=G×_{G^ab}Res_{E/ℚ}G_m` for `δ` and `r=N_{E/ℚ}∘Res_{E/ℚ}(μ^ab)`, with the class `X_B` of `(h,h_E)`.
- `distinguishedDatumExact`: `1→G^der→B→E*→1` is exact; `B` is connected reductive with `B^der=G^der` and `B^ad=G^ad`.
- `distinguishedDatumToDatum`: The first projection is a morphism of data `(B,X_B)→(G,X)` inducing the identity on connected derived data.
- `distinguishedDatumReflex`: `E(B,X_B)=E`, and `X_B` does not depend on `h∈X⁺`.
- `distinguishedDatumIndep`: Up to canonical isomorphism the extension and the datum depend only on `(G^der,X⁺)` and `E`.
- `distinguishedDatumIsogeny`: A central isogeny of connected data induces a morphism of distinguished data given by a central isogeny of groups.
- `distinguishedDatumNorm`: For `E(G,X)⊆F⊆E` the norm induces `(B_E,X_E)→(B_F,X_F)`.
- `distinguishedDatumAbelian`: For abelian type with a Hodge-type witness `(G₁,X₁)` and `E=E(G,X)E(G₁,X₁)`: the diagram `(B₁,X_{B₁})→(B,X_B)→(G,X)`, `(B₁,X_{B₁})→(G₁,X₁)`, with one adjoint datum and one compact dual.

**Checks.**

- `(GL₂,ℍ^±)` with `E=ℚ`: `μ^ab` is the identity of `G_m`, `r` is the identity and `B=GL₂`. Since det `h(z)=zz̄=h_ℚ(z)`, the distinguished datum is `(GL₂,ℍ^±)` itself.
- `(GL₂,ℍ^±)` with `E=ℚ(i)`: `r` is the norm of `ℚ(i)/ℚ` and `B={(g,e):det g=Nm(e)}⊂GL₂×Res_{ℚ(i)/ℚ}G_m`, of dimension `5`, with reflex field `ℚ(i)`; so `B` depends on `E`.
- For a torus datum (T,{h}) with reflex field `E`, `G^der=1` and `B≅E*` by the second projection, with `X_B={h_E}`; its morphism to (T,{h}) is `r`.
- `B` is not `G×E*`: for `(GL₂,ℍ^±)` and `E=ℚ` the product has a two-dimensional centre, `B` a one-dimensional one.
- For `G=GL₂` and `ℚ⊂ℚ(i)`, the norm morphism `B_{ℚ(i)}→B_ℚ≅GL₂` sends `(g,a+bi)` to `g`, with `det g=a²+b²`. Thus `(diag(25,1),3+4i)` maps to `diag(25,1)`, and the kernel is `{(I₂,e):Nm(e)=1}`. On real `S`-maps it sends `(h(z),z)` to `h(z)` because `Nm(z)=zz̄`.

(Tom Lovering, [Integral canonical models for automorphic vector bundles of abelian type](https://arxiv.org/pdf/1605.02717v3), §4.6, 4.6.1–Lemma 4.6.6, pp.37–41 (arXiv v3).)

(George Boxer; Vincent Pilloni, [Higher Coleman theory](https://arxiv.org/pdf/2110.10251v1), §4.4.41, pp.78–79 (arXiv v1).)

(Pierre Deligne, [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 2.5.6, p.282.)

*Needs:* ShimuraVarieties §§P.1–P.5; ReductiveGroupsPartII `§RG2.0a`; ReductiveGroups, Layer 4 (Jordan decomposition, diagonalizable groups and tori); ReductiveGroups, Layer 6 (reductive and semisimple groups); [§3.8](#d3-compact-dual).

<a id="d4-distinguished-levi"></a>

### 4.9 Centre and Levi of the distinguished datum

Prove `distinguishedDatum_levi`. For a reductive `ℚ`-group `H` let `Z_s(H)` be the largest subtorus of its centre that is `ℝ`-split and contains no `ℚ`-split subtorus, and put `H^c=H/Z_s(H)`. Let `(G₁,X₁)` be of Hodge type, `E⊇E(G₁,X₁)`, `T=Res_{E/ℚ}G_m` and `B₁=G₁×_{G₁^ab}T` ([§4.8](#d4-distinguished-datum)). Choose a common splitting field `L⊂ℂ` containing the reflex fields and compatible representatives `μ_{G₁}`, `μ_T` and `μ_{B₁}=(μ_{G₁},μ_T)` defined over `L`. Write `M_μ=Z_{H_L}(μ)`. In `M_μ^c`, quotient by the base change of the rational subtorus `Z_s(H)`, equivalently take the image in `H^c_L`; do not apply `Z_s` to the Levi over `L`. Then: (a) `Z_s(G₁)=1` and `Z_s(G₁^ab)=1`; `(b) Z_s(B₁)=1×Z_s(T)`, which lies in the kernel of `r`, so `B₁^c=G₁×_{G₁^ab}T^c`; `(c) M_{μ_{B₁}}=M_{μ_{G₁}}×_{(G₁^ab)_L}T_L` and `M^c_{μ_{B₁}}=M_{μ_{G₁}}×_{(G₁^ab)_L}(T^c)_L`. All groups and maps in (c) are over `L`. This is Boxer–Pilloni's identity `M^c_{μ_{B₁}}=M^c_{μ_{G₁}}×_{M^{ab,c}}T^c`, with base `(G₁^ab)_L`, the Levi of its own torus datum; `(d) Z_s(T)` is the norm-one torus of `E/ℚ` when `E` is totally real, and the norm-one torus of `Res_{E⁺/ℚ}G_m` when `E` is a CM field with maximal totally real subfield `E⁺`.

`(G₁,X₁)` is a Hodge-type datum (ShimuraVarieties §P.1); `B₁`, `r` and `T` are those of [§4.8](#d4-distinguished-datum) for `(G₁,X₁)` and `E`.

Subtori and their real and rational splitting are ReductiveGroups layer 4's; images and preimages of subtori under isogenies of tori correspond through `X*(−)⊗ℚ`.

(a) A Hodge-type datum satisfies `SV2*` and has rational weight ([§4.2](#d4-type-implications)), so `Z(G₁)°/w(G_m)` is `ℝ-anisotropic`. An `ℝ`-split subtorus of `Z(G₁)°` therefore lies in `w(G_m)`, which is `ℚ`-split. So `Z_s(G₁)=1`, and `Z_s(G₁^ab)=1` because `Z(G₁)°→G₁^ab` is an isogeny.

(b) The images of an `ℝ`-split torus with no `ℚ`-split subtorus are again of that kind, since characters of the image inject Galois-equivariantly into those of the source. So `r(Z_s(T))⊂Z_s(G₁^ab)=1`, and `1×Z_s(T)` is a central subtorus of `B₁` of the required kind. Conversely, a central subtorus of `B₁` of that kind projects into `Z_s(G₁)=1`, so it lies in `1×ker r⊂1×T` and hence in `1×Z_s(T)`. Since `Z_s(T)⊂ker r`, `B₁/(1×Z_s(T))=G₁×_{G₁^ab}(T/Z_s(T))`.

`(c) μ_{B₁}=(μ_{G₁},μ_T)` over `L`. As `T_L` is commutative, `(g,t)` centralizes it exactly when `g` centralizes `μ_{G₁}`, giving the fibre product over `(G₁^ab)_L`. Dividing by `(1×Z_s(T))_L⊂ker r_L` gives the second identity, and `M^c_{μ_{G₁}}=M_{μ_{G₁}}` by (a). Only the cocharacter class is intrinsically defined over the reflex field; these chosen centralizers are not asserted to descend there.

(d) Complex conjugation acts on `X*(T)⊗ℚ=ℚ[Hom(E,ℂ)]` through `τ↦conj∘τ`. For `E` totally real it is trivial, `T` is `ℝ`-split, and its largest `ℚ-anisotropic` subtorus is the norm-one torus. For `E` CM, conjugation commutes with the Galois action, its coinvariants are `ℚ[Hom(E⁺,ℝ)]`, the largest `ℝ`-split subtorus is `Res_{E⁺/ℚ}G_m`, and its largest `ℚ-anisotropic` subtorus is the norm-one torus.

**Checks.**

- Siegel datum `(GSp_{2g},ℋ^±)`, `E=ℚ`: `T=G_m`, `Z_s(T)=1`, `B₁=GSp_{2g}` and every identity is trivial.
- `E` real quadratic, `(G₁,X₁)=(GL₂,ℍ^±)`: `Z_s(T)` is the one-dimensional norm-one torus of `E`, `T^c≅G_m` by the norm, and `B₁^c≅GL₂`.
- Boxer–Pilloni Remark 4.1.2 agrees: `Z_s=1` for Hodge type is (a), and `Z_s(Res_{L/ℚ}GSp_{2g})`, the kernel of the norm `Res_{L/ℚ}G_m→G_m` for `L` totally real, is the computation of (d) applied to the centre `Res_{L/ℚ}G_m`.
- The base of the fibre product cannot be `M_{μ_{G₁}}^{ab}`: for the genus-two Siegel parabolic, `M^{ab}=G_m²` while `G₁^ab=G_m`, and `T` maps only to `G₁^ab`.
- In the `GL₂` datum, the basepoint `τ=i·2^{1/4}` has reflex field `ℚ`, but its cocharacter centralizer has equations `g₁₁=g₂₂`, `g₁₂=−√2 g₂₁`. Galois conjugation changing `√2` to `−√2` changes this subgroup, so this particular centralizer does not descend to `ℚ`.

(George Boxer; Vincent Pilloni, [Higher Coleman theory](https://arxiv.org/pdf/2110.10251v1), §4.1.1 and Remark 4.1.2, p.48; Theorem 4.4.43(3) and Principle 4.4.44(1), pp.81–82 (arXiv v1).)

(Tom Lovering, [Integral canonical models for automorphic vector bundles of abelian type](https://arxiv.org/pdf/1605.02717v3), Lemma 4.6.2, p.38 (arXiv v3).)

*Needs:* [§4.8](#d4-distinguished-datum); [§4.2](#d4-type-implications); [§4.3](#d4-additional-axioms); [§3.7](#d3-filtration-parabolic); ReductiveGroups, Layer 4 (Jordan decomposition, diagonalizable groups and tori).

### Examples

The full real-quadratic Hilbert datum and its scalar-determinant PEL datum have the same connected adjoint datum but four and two components. Distinguished data for `GL₂` change from `GL₂` to a dimension-five norm fibre product when `E` changes from `ℚ` to `ℚ(i)`.

### Dependencies

AdelicAlgebraicGroups §§1.3–1.4; AdelicAlgebraicGroups §3.4; ArithmeticLocallySymmetricSpaces `§§ALS.F.1`, ALS.0.1–0.2; PELModuli §M0.12; ReductiveGroupsPartII `§RG2.0a`; ReductiveGroupsPartII §RG2.1.5 and the prescribed-cover extension in Layer 4.6; [§1.1](#d1-rational-weight-criterion); [§3.8](#d3-compact-dual); [§3.7](#d3-filtration-parabolic); ShimuraVarieties §§P.1–P.5; `NumberField.IsCMField`; ReductiveGroups, Layer 4 (Jordan decomposition, diagonalizable groups and tori); ReductiveGroups, Layer 6 (reductive and semisimple groups).

## Layer 5: Hilbert and Siegel coordinates and neat levels

The coordinate calculations keep their Borel, symplectic basis, central exponent and left-coset choices throughout. The final argument uses all places over one rational prime so that the faithful rational representation sees every conjugate eigenvalue.

<a id="d5-adelic-neat"></a>

### 5.1 Adelic torsion-intersection neatness

In a faithful representation, use the subgroup of units generated by all roots of the characteristic polynomial in each algebraically closed local coefficient field. The adelic condition compares these subgroups through fixed embeddings of `ℚ̄` and allows an omitted set of primes. Establish representation independence and the interpretation on actual adelic groups.

Define `adelicNeat`. Fix compatible embeddings `ℚ̄→ℚ̄ℓ`. For `g∈G(𝔸f)`, let `Λg,ℓ` be the subgroup of `ℚ̄ℓˣ` generated by its local eigenvalues. `g` is adelically neat when the intersection over `ℓ` of the torsion subgroups `ℚ̄ˣ∩Λg,ℓ` is `{1}`; for prime-to-`p` adeles intersect only `ℓ≠p`. An adelic compact open is neat when every element is. Rationally conjugate elements and rational elements are compared explicitly.

For `Res_F/ℚ GSp₄`, indices `ℓ` in Definition 3.2.1 are rational primes. `Λg,ℓ` uses all eigenvalues of the faithful `ℚ_ℓ` representation, including every `F`-place above `ℓ`. Its pullback from `ℚ̄_ℓ` to `ℚ̄` retains algebraic products of local eigenvalues even when the individual eigenvalues are not algebraic over `ℚ`.

Use eigenvalue-generated subgroups at all local places and transport only global torsion roots via the fixed embeddings. Non-torsion intersection is not required trivial.

- `adelicNeatRational`: An adelically neat element coming from `G(ℚ)` is rationally neat.
- `adelicNeatConjugate`: Local/adelic conjugation preserves the eigenvalue torsion condition.
- `primeToPNeatInsert`: An adelically neat prime-to-`p` level remains adelically neat after inserting any compact open p-component.

**Checks.**

- The identity adele is adelically neat.
- The rational scalar `−I₂` in `GL₂` is not adelically neat: its eigenvalue group contains the nontrivial torsion element `−1` at every prime.
- A prime-to-`p` level certified at `v≠p` stays neat for every p-level.
- For the identity matrix, the eigenvalue-generated group is `{1}`, including the zero-dimensional case, whose characteristic polynomial is `1` and has no roots.
- For `−I₂` over `ℚ̄`, the eigenvalue-generated group is exactly `{1,−1}`.
- For `diag(2,−1/2)` already over `ℚ`, neither eigenvalue is torsion but their product `−1` belongs to the eigenvalue-generated group. The same holds after extension to `ℚ̄`. Testing individual eigenvalues would give the wrong neatness predicate.

(George Boxer; Frank Calegari; Toby Gee; Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Definition 3.2.1, pp.201–202.)

*Needs:* AdelicAlgebraicGroups §4.3; AdelicAlgebraicGroups §§1.3–1.4.

<a id="d5-siegel-reflex-dual"></a>

### 5.2 Siegel compact dual

Prove `siegelReflexDual`. For the genus-g Siegel datum of ShimuraVarieties §P.4 `(g≥1)` on a symplectic `ℚ`-space of dimension `2g`, `μ_h` is `GSp_{2g}(ℂ)-conjugate` to the `ℚ`-rational cocharacter `z↦diag(I_g,zI_g)` in a symplectic basis whose first `g` vectors span a Lagrangian `L₀`. Its filtration parabolic ([§3.7](#d3-filtration-parabolic)) is the Siegel parabolic stabilizing a Lagrangian, so the compact dual ([§3.8](#d3-compact-dual)) is the Lagrangian Grassmannian `LG(g,2g)`, of dimension `g(g+1)/2=dim_ℂX`. It is already defined over `ℚ=E(G,X)`, and the descended compact dual of [§3.9](#d3-reflex-flag-descent) has the `ℚ`-point `L₀`.

The Siegel datum and its reflex field `ℚ` are ShimuraVarieties §§P.3–P.4's; the filtration parabolic and compact dual are [§3.7](#d3-filtration-parabolic) and [§3.8](#d3-compact-dual).

The cocharacter `diag(I_g,zI_g)` has similitude `z` and weights `0` on `L₀` and `1` on a complementary Lagrangian; it is conjugate to `μ_h` because both have these weights on a Lagrangian splitting and `GSp_{2g}(ℂ)` acts transitively on such splittings.

The stabilizer of the filtration `L₀⊂V` is the Siegel parabolic with Levi `GL_g×G_m`; `G/P` is the variety of Lagrangians.

The tangent space at `L₀` is the space of symmetric maps `L₀→V/L₀`, of dimension `g(g+1)/2`.

The cocharacter is defined over `ℚ`, so the parabolic type is `ℚ`-rational and `Par_t(G)` has the rational point `L₀`.

**Checks.**

- For `g=1`, `LG(1,2)=ℙ¹` and `dim=1`.
- For `g=2`, `LG(2,4)` has dimension `3` and is a smooth quadric threefold.
- The full Grassmannian `Gr(g,2g)`, of dimension `g²`, is not the compact dual for `g≥2`.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §6, Siegel datum, pp.68–69; §12, Remark 12.3(b), p.112, for a rational representative of `μ`. The Lagrangian quotient and tangent dimension follow from the calculation above.)

*Needs:* ShimuraVarieties §§P.1–P.5; [§3.7](#d3-filtration-parabolic); [§3.8](#d3-compact-dual); [§3.9](#d3-reflex-flag-descent); ReductiveGroups, Layer 7 (structure theory).

<a id="d5-hilbert-datum"></a>

### 5.3 Restriction-of-scalars Hilbert datum

Construct `hilbertDatum`. For totally real `F/ℚ` of degree `d`, let `G=ResF/ℚGL₂` and `h` have the standard `GL₂` map at every real embedding. Its full real class is the product of `ℍ±` across embeddings, with `2ᵈ` components and dimension `d`. Its reflex field is `ℚ`, compact dual `ResF/ℚℙ¹`, and weight is inverse scalar at every embedding. The determinant maps to `ResF/ℚGm` with diagonal norm `h`.

The constructed `(G,X)` is to be a pure Shimura datum in the sense of ShimuraVarieties §P.1 (the ShimuraVarieties roadmap): `G` connected reductive over `ℚ`, `X` a nonempty full `G(ℝ)`-class of algebraic `h:S→G_ℝ` satisfying `SV1–SV3`, with `S` the Deligne torus of ReductiveGroupsPartII §RG2.0a.3.

`F/ℚ` is a totally real number field of degree `d≥1`; `G=Res_{F/ℚ}GL₂` with `h` equal to the `GL₂` map of the ShimuraVarieties §P.4 `GL₂` datum at every real embedding.

Check the axioms factorwise over `ℝ` and `SV3` on the rational restriction-of-scalars adjoint group. `μ` is the same `{1,0}` cocharacter at every embedding, making its class Galois invariant.

Establish `hilbertFlagWeilRestriction` directly as a comparison of represented functors. The line-parabolic type variety of `Res_{F/ℚ}GL₂` represents, on a `ℚ`-algebra A, rank-one locally direct summands of `(F⊗_ℚA)²` as `F⊗_ℚA`-modules. By the functor of `ℙ¹` this is exactly `(Res_{F/ℚ}ℙ¹)(A)`. After a finite Galois splitting field it is `∏_σℙ¹`, with Galois permuting the factors. The Segre ample bundle `O(1,…,1)` and its permutation descent data give the projective descent, agreeing by Yoneda with §3.8’s parabolic-type scheme. This proves the nonaffine comparison rather than applying the affine Weil-restriction theorem. Test `F=ℚ (ℙ¹)`, a real quadratic field (a form splitting as `ℙ¹×ℙ¹`), and change of a central determinant factor (no change of the parabolic flag). The proof uses Conrad, Corollaries 5.2.8–5.2.9, pp.155–157, and the projective descent contract above.

Apply restriction of scalars to the determinant Hopf map and compare it with the split real point map. At every embedding `det(h(z))=z z̄`; this proves full-orbit compatibility because the target torus is commutative.

- `hilbertDomain`: For totally real `F` of degree `d`, the full domain of this datum is the product over real embeddings of the two half-planes, has complex dimension `d` and `2^d` components.
- `hilbertReflexDual`: The actual uniform `μ` class has reflex field `ℚ`. Its descended projective compact dual represents `Res_F/ℚℙ¹` by `hilbertFlagWeilRestriction` above and splits into `d` copies of `ℙ¹` over a splitting field.
- `hilbertDeterminantMap`: For `T=Res_F/ℚ Gm` with `h_T(z)_σ=z z̄`, `Res(det)` is a rational datum morphism (`Res_F/ℚ GL₂,X)→(T,{h_T}`). Its coordinate map is `O(T)→O(G)`; after real base change its composition with the Hilbert `S`-map is `h_T`. Under the splitting at `σ:F→ℝ` its point map is (`M_σ)_σ↦(det M_σ)_σ`. This target has dimension `[F:ℚ]`, rather than the one-dimensional scalar norm torus.

**Checks.**

- For `F=ℚ` this recovers the `GL₂` datum.
- For `F=ℚ(√2)` the actual restriction-of-scalars Hilbert datum has dimension two and four connected components.
- For `d>1` the standard trace representation of `G` does not land in rational GSp; determinants at real embeddings can differ.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Example 5.24, pp.63–64, split quaternion case `B=M₂(F)`.)

*Needs:* [§0.1](#d0-hilbert-real-points); ShimuraVarieties §§P.1–P.5; [§3.9](#d3-reflex-flag-descent); [§3.8](#d3-compact-dual); ReductiveGroupsPartII `§RG2.0a`; ReductiveGroups, Layer 7 (structure theory).

<a id="d5-hilbert-star-datum"></a>

### 5.4 Scalar-determinant Hilbert datum and its inclusion

Compare the supplied PEL datum, with `hilbertStarDatum` denoting that datum through the comparison. Let `G*⊂G=Res_{F/ℚ}GL₂` be the subgroup with determinant in `G_m`, the group of PELModuli §M5.4's Case `C` Hilbert datum, whose Shimura datum (G*,X*) is `RationalPELDatum.toShimuraDatum` of §M0.12. Its domain `X*` consists of the all-upper and all-lower products of half-planes inside the domain `X` of [§5.3](#d5-hilbert-datum), so it has two components and dimension `d`; its compact dual is the descended `Res_{F/ℚ}ℙ¹` of [§5.3](#d5-hilbert-datum). The inclusion `G*→G` is a morphism of data whose image in `X` is exactly those two components; it is a closed immersion of groups, an isomorphism on derived groups `(Res_{F/ℚ}SL₂)` and on adjoint data.

`F` is a totally real number field of degree `d≥1`. The datum (G*,X*), its reflex field `ℚ` and relative dimension `d` are PELModuli §M5.4's (with §M0.12); [§5.3](#d5-hilbert-datum) is the restriction-of-scalars datum.

PELModuli §M5.4 uses `h(√−1)(a,b)=(−b,a)` in each real factor; this `h` lies in the same `GL₂(ℝ)^d`-class as the `h` of [§5.3](#d5-hilbert-datum), so no change of convention is needed.

`G*` is the fibre product of det with the diagonal `G_m` ([§0.1](#d0-hilbert-real-points)); the inclusion is a closed immersion.

`X*` is the `G*(ℝ)`-class of `h`. A common determinant `t` acts on all factors with the same sign, and the determinant-one factors act transitively on each `ℍ^±`, so `X*` is the union of the two same-sign products.

`G*^der=G^der=Res_{F/ℚ}SL₂` and `G*^ad=G^ad=Res_{F/ℚ}PGL₂`, so the connected adjoint data agree.

The compact dual of `X*` is the flag variety of the same parabolic type, hence the same descended `Res_{F/ℚ}ℙ¹`.

- `hilbertStarPoints`: The points of `G*` are the points of `Res_{F/ℚ}GL₂` with a common scalar determinant ([§0.1](#d0-hilbert-real-points) and [§0.2](#d0-hilbert-adelic-points)).
- `hilbertStarDomain`: `X*` is the union of the two same-sign products of half-planes in `X`; dimension `d`; reflex field `ℚ` (PELModuli §M5.4).
- `hilbertStarInclusion`: The inclusion `G*→Res_{F/ℚ}GL₂` is a closed immersion and a morphism of data, an isomorphism on derived groups and on connected adjoint data.

**Checks.**

- At `F=ℚ`, the supplied `G*` datum is isomorphic to the `GL₂` datum, including its full Hodge orbit, and under that comparison its inclusion is the identity datum morphism.
- For `F=ℚ(√2)` the actual common-determinant Hilbert datum has dimension two and two connected components.
- A real tuple with determinants of opposite signs does not lie in `G*`.

(J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), §8, definitions of `G₁` and `G`, p.82, and Proposition 8.7(C), pp.83–84, specialized to `B=F`, `V=F²` and the trace symplectic form; PELModuli §M5.4 supplies this datum. The PEL label for the full Example-5.24 group on p.94 omits the common-determinant restriction.)

*Needs:* PELModuli §§M5.1, M5.4–M5.5; PELModuli §M0.12; ShimuraVarieties §§P.1–P.5; [§5.3](#d5-hilbert-datum); [§0.1](#d0-hilbert-real-points); [§3.9](#d3-reflex-flag-descent); ReductiveGroups, Layer 6 (reductive and semisimple groups).

<a id="d5-siegel-root-convention"></a>

### 5.5 Siegel Borel and dominant cones

Prove `siegelRootConvention`. Use the root-datum carrier of ReductiveGroups Layer 7 for the Siegel group of ShimuraVarieties §P.4, and compute its symplectic coordinate comparison. In BP coordinates `κ=(k₁,…,k_g;k)`, `Σk_i≡k` mod `2`, and the Borel inside the opposite Siegel parabolic is upper triangular on each diagonal block. Its compact roots are `e_i−e_j (i<j)`, and its noncompact roots are `−e_i−e_j (i≤j)`. Thus `ρ_i=−i`, `ρ_nc,i=−(g+1)/2`, both with central coordinate zero; G-dominance is `0≥k₁≥⋯≥k_g` and M-dominance `k₁≥⋯≥k_g`. These are not the CG upper-triangular full-Borel signs.

For `g≥1`, establish `siegelRootDatumComparison` on the native root-datum carrier. On the diagonal torus `diag(t₁,…,t_g,νt_g⁻¹,…,νt₁⁻¹)`, the BP parity tuple `(k₁,…,k_g;k)` means the character `∏t_i^{k_i}ν^{(k−Σk_i)/2}`. This is a character exactly when `k−Σk_i` is even. Conjugate the elementary symplectic root matrices by this diagonal torus to identify the roots, their dual cocharacters, the block Borel and the Siegel Levi. This coordinate comparison is established here, using general root and Weyl theory from ReductiveGroups Layer 7; it is not an additional assumed table. Half-sums such as `ρ` live in the rational character space and need not belong to the integral parity lattice.

Subtract the compact positive roots from the full positive system; count occurrences of each `e_i` in the two sums and pair with simple coroots.

**Checks.**

- `g=1`: there is no compact root; the positive noncompact root is `−2e₁`, `ρ=ρ_nc=(−1;0)`, G-dominance is `0≥k₁`, and every `k₁` is M-dominant.
- `g=2`: the positive roots are `e₁−e₂`, `−2e₁`, `−e₁−e₂` and `−2e₂`, with simple roots `e₁−e₂` and `−2e₁`. Half their sum is `ρ=(−1,−2;0)`, and the noncompact half-sum is `ρ_nc=(−3/2,−3/2;0)`. G-dominance is `k₁−k₂≥0` and `−k₁≥0`, that is `0≥k₁≥k₂`.
- Counts: there are `g²` positive roots, `g(g−1)/2` of them compact and `g(g+1)/2` noncompact, the last being the dimension of the Siegel space.

(George Boxer; Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, pp.33–34.)

*Needs:* ReductiveGroups, Layer 7 (structure theory); ShimuraVarieties §§P.1–P.5; [§3.7](#d3-filtration-parabolic); `RootPairing`; `RootPairing.Base`; `RootPairing.Base.IsPos`.

<a id="d5-siegel-weyl-permutations"></a>

### 5.6 Siegel Weyl permutation comparison

Prove `siegelWeylPermutations`. For `g≥1` the supplier Weyl group identifies with permutations of `{1,…,2g}` commuting with `i↦2g+1−i`. The Siegel Levi subgroup preserves {1,…,g}. Minimal left-coset representatives satisfy `w⁻¹(g+1)≺⋯≺w⁻¹(2g)`, for the cyclic order `g+1≺⋯≺2g≺1≺⋯≺g`, not the usual numeric order. There are `2^g` such representatives.

`g≥1`. The permutation is the Weyl action on the ordered standard-representation weights, and length and the Levi subgroup come from the same BP based root datum. This identification precedes the representative count.

Translate the positive Levi roots using the cyclic order determined by this Borel, then choose one element from each reflected pair for the inverse image of the last half. Their cyclic order determines a unique representative.

**Checks.**

- `|W|=2^g·g`! and `|W_M|=g`!, so `^MW` has `2^g` elements; for `g=1` both elements of `W` are minimal.
- `g=2`: the pairs `(w⁻¹(3),w⁻¹(4))` allowed in `W` are the ordered pairs `(x,y)` with `y∉{x,5−x}`, eight in all. The cyclic order `3≺4≺1≺2` selects `(3,4)`, `(3,1)`, `(4,2)` and `(1,2)`, the four elements of `^MW`. The representative `(4,2,3,1)` has inverse indices `(3,1)`.
- Using the numeric order instead selects `(3,4)`, `(1,2)`, `(1,3)` and `(2,4)`; this differs from `^MW`.

(George Boxer; Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34; corrected cyclic criterion for the stated sign convention.)

*Needs:* [§5.5](#d5-siegel-root-convention); [§3.10](#d3-kostant-representatives); [§3.11](#d3-kostant-cone-criterion); ReductiveGroups, Layer 7 (structure theory); `RootPairing.weylGroup`.

<a id="d5-kostant-sequence"></a>

### 5.7 Siegel Kostant sequence

Define `kostantSequence`. For `w∈^MW` set `a₀=0` and `a_i=#{j≤i:g+j∈w⁻¹{g+1,…,2g}}`. Thus `a_i−a_{i−1}∈{0,1}`. The increment subset determines `w` using the cyclic order. This sequence is unrelated to the names of Weyl elements `w₀,w₁,…` used in CG.

`G` is split reductive with `T⊂B⊂P`, standard Levi `M` and its Weyl subgroup `WM`. Length/Bruhat order use this based root datum; representatives are for left cosets `WM\W`. For integral assertions use the split pinned reductive `ℤ`-model of ReductiveGroups Layer 9 and the cells and base-change-compatible closures constructed in §§3.14–3.15.

Use finite cardinalities of initial segments of the selected subset.

- `kostantSequenceZero`: `a₀=0`.
- `kostantSequenceStep`: The increment at `i` is the indicator of `g+i∈w⁻¹{g+1,…,2g}`.
- `kostantSequenceInjective`: The sequence determines `w` uniquely among minimal left representatives.

**Checks.**

- For `g=1` the two sequences are `(0,0)` and `(0,1)`.
- For `g=2` the four sequences are `(0,0,0),(0,0,1),(0,1,1),(0,1,2)`.
- `(0,0,2)` cannot occur.

(George Boxer; Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34.)

*Needs:* [§5.6](#d5-siegel-weyl-permutations).

<a id="d5-kostant-sequence-geometry"></a>

### 5.8 Intersection meaning of Kostant sequences

Prove `kostantSequenceGeometry`. For `x∈C_w⊂P\G` over any field, let `L_x=x⁻¹⟨e_{g+1},…,e_{2g}⟩`. Then `a_i(w)=dim(L_x∩⟨e_{g+1},…,e_{g+i}⟩)`. The equality is invariant under the parabolic representative and constant on the Bruhat cell.

`G` is split reductive with `T⊂B⊂P`, standard Levi `M` and its Weyl subgroup `WM`. Length/Bruhat order use this based root datum; representatives are for left cosets `WM\W`. For integral assertions use the split pinned reductive `ℤ`-model of ReductiveGroups Layer 9 and the cells and base-change-compatible closures constructed in §§3.14–3.15.

In the BP matrix convention `P` stabilizes `L₀=span(e_{g+1},…,e_{2g})`, `B` preserves every `E_i=span(e_{g+1},…,e_{g+i})`, `w` is a minimal left representative and `x` lies in `P·w̃·B`. The Weyl lift acts on basis lines by its reflected permutation. No intersection-rank equality is assumed.

Check at the Weyl representative by counting basis indices; right `B` multiplication preserves the reference partial flag. Left `P` multiplication preserves its stabilized Lagrangian.

**Checks.**

- `w=1`: `L_x=⟨e_{g+1},…,e_{2g}⟩`, and `a_i=i` for every `i`.
- `g=1`, `w=s`: at the Weyl representative `L_x=⟨e₁⟩`. Throughout its cell `L_x` is transverse to `⟨e₂⟩`, so `a₁=0`, although `L_x` varies.
- `g=2`: for the permutation matrix of `w` with `(w⁻¹(3),w⁻¹(4))=(3,1)`, `L_x=⟨e₃,e₁⟩` meets `⟨e₃⟩` and `⟨e₃,e₄⟩` in lines, so `a=(0,1,1)`. The other three representatives `(3,4)`, `(4,2)` and `(1,2)` give `(0,1,2)`, `(0,0,1)` and `(0,0,0)`, the four sequences of [§5.7](#d5-kostant-sequence).

(George Boxer; Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.1, p.34.)

*Needs:* [§5.7](#d5-kostant-sequence); [§3.14](#d3-bruhat-integral); ReductiveGroups, Layer 9 (pinned Chevalley–Demazure group schemes); `Matrix.GeneralLinearGroup.toLin`.

<a id="d5-gsp4-cg-roots"></a>

### 5.9 Genus-two CG coordinate comparison

Import AutomorphicFormsOnReductiveGroups §6.3's `splitCharacter`, `compactCharacter`, `toCompact`, `toSplit`, positive roots and `rho`. Swapping the last two vectors of its symplectic basis gives the CG basis and leaves the character coordinates unchanged. Use `ℤ³` for the integral CG weight coordinates and `(a,b,c)↦(a,b,a+b+2c)` for the parity conversion. The ordered root and coroot tables below and their dot pairing express the comparison with the native root datum.

Prove `gsp4CgRoots`. In CG upper-triangular coordinates `χ=(a,b;c)`, `χ(diag(t₁,t₂,νt₂⁻¹,νt₁⁻¹))=t₁ᵃt₂ᵇνᶜ`. Positive roots are `(1,−1;0),(0,2;−1),(1,1;−1),(2,0;−1)`, with simple first two, `ρ=(2,1;−3/2)`, and coroots `(1,−1;0),(0,1;0),(1,1;0),(1,0;0)`. Dominant cones are `a≥b≥0` for `G` and `a≥b` for `M`. The isogeny `Tder×Z→T` sends `χ` to Pilloni parity coordinates `(a,b;a+b+2c)`.

Compare the supplied tables and half-sum with `siegelRootDatumComparison` of §5.5 at `g=2`, changing from parity to integral CG coordinates. Identify the upper full Borel, Siegel Levi and Shimura filtration through the transported root matrices. The displayed positive roots are paired in order with the displayed coroots; the first two pairs are simple and the first is the Levi simple pair. The positive-root table, half-sums and lattice equivalences themselves are the supplier's constructions.

Evaluate each root on the torus and check coroot pairings; sum roots for `ρ`. Pull back a character along `diag(st₁,st₂,st₂⁻¹,st₁⁻¹)` to get the coordinate conversion.

**Checks.**

- Each positive root pairs to `2` with its coroot: `(1,−1;0)·(1,−1;0)=(0,2;−1)·(0,1;0)=(1,1;−1)·(1,1;0)=(2,0;−1)·(1,0;0)=2`. The simple off-diagonal pairings are `−1` and `−2`, the Cartan matrix of type `C₂`.
- In the CG weight lattice `ℤ³`, `(1,0;0)` and the similitude character `(0,0;1)` are distinct unrestricted integer triples, and the zero character is `(0,0;0)`. The parity map sends them to `(1,0;1)`, `(0,0;2)` and `(0,0;0)`; it never sends a character to `(1,0;0)`, which fails parity.
- `ρ=½(4,2;−3)=(2,1;−3/2)`. The similitude character `ν=(0,0;1)` pairs to zero with every coroot.
- The full dot pairing has `(0,0;1)·(0,0;1)=1`; vanishing on coroots does not permit discarding the third coordinate from the dot pairing.
- The conversion `(a,b;c)↦(a,b;a+b+2c)` sends `ρ` to `(2,1;0)`, and the four positive roots to `(1,−1;0)`, `(0,2;0)`, `(1,1;0)`, `(2,0;0)`: the positive roots of CG p.10, as [§5.17](#d5-gsp4-cayley-action) explains.

(Frank Calegari; David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.1, PDF pp.7–8.)

*Needs:* AutomorphicFormsOnReductiveGroups §6.3; ReductiveGroups, Layer 7 (structure theory); [§5.5](#d5-siegel-root-convention); `RootPairing`; `RootPairing.Base`; `RootPairing.Base.IsPos`.

<a id="d5-gsp4-kostant"></a>

### 5.10 Genus-two Kostant actions

Specialize AutomorphicFormsOnReductiveGroups §6.7’s Siegel Levi and minimal left-coset indices to `GSp₄`, and transport them through §5.9’s CG based-root comparison. Retain the similitude exponent in all four coordinate actions.

Prove `gsp4Kostant`. In CG coordinates `^MW` has four elements with actions `(a,b;c)`, `(a,−b;b+c)`, `(b,−a;a+c)`, `(−b,−a;a+b+c)`, of lengths `0,1,2,3`. The element called `w₀` in CG acts `(a,b;c)↦(b,a;c)` and is the longest Levi element. The full longest Weyl element acts `(−a,−b;a+b+c)`. The duality involution `w↦w₀,Mww₀,G` reverses these four lengths.

`G=GSp₄` has the CG upper-triangular Borel `B⊂P`, Siegel Levi `M≅GL₂×G_m` and the supplied based Weyl group. The representatives are the supplier’s minimal elements of the left cosets `WM\W`, with its length function.

The comparison gives a bijection `Fin 4→^MW` to those supplied elements. Their coordinate actions are required for every rational weight. The involution sends index `i` to `3−i`; the longest Levi and full elements have lengths `1` and `4`.

Evaluate the supplied representatives on the CG torus characters. Section 3.10 identifies the left-coset conventions, and §3.13’s opposition gives the index reversal. The general indices and representation-theoretic parametrization are supplied by AutomorphicFormsOnReductiveGroups §6.7; Kostant’s Lie-cohomology theorem is ArithmeticLocallySymmetricSpaces §ALS.4.5.

**Checks.**

- The simple reflections act by `s₁(a,b;c)=(b,a;c)` and `s₂(a,b;c)=(a,−b;b+c)`, the reflection in `(0,2;−1)` with coroot `(0,1;0)`. Then `s₂s₁(a,b;c)=(b,−a;a+c)`, `s₂s₁s₂(a,b;c)=(−b,−a;a+b+c)` and `^MW={1,s₂,s₂s₁,s₂s₁s₂}`.
- For these four elements, `w⁻¹` sends the Levi root `(1,−1;0)` to `(1,−1;0)`, `(1,1;−1)`, `(1,1;−1)` and `(1,−1;0)` respectively, all positive, while `s₁` sends it to `(−1,1;0)`.
- `w₀,G=s₁s₂s₁s₂` acts by `(−a,−b;a+b+c)`, and the duality exchanges `1↔s₂s₁s₂` and `s₂↔s₂s₁` (lengths `0↔3`, `1↔2`).

(Frank Calegari; David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.1, PDF p.8.)

*Needs:* AutomorphicFormsOnReductiveGroups §§6.3, 6.7; [§5.9](#d5-gsp4-cg-roots); [§3.13](#d3-kostant-involution); [§3.10](#d3-kostant-representatives); ReductiveGroups, Layer 7 (structure theory); `RootPairing.weylGroup`.

<a id="d5-gsp4-cone-reversal"></a>

### 5.11 Genus-two chamber reversal

In the coordinate presentation of AutomorphicFormsOnReductiveGroups §6.3's `chamber`, write `C₀={a≥b≥0}`, `C₁={a≥−b≥0}`, `C₂={−b≥a≥0}`, `C₃={−b≥−a≥0}`, with unrestricted central coordinate.

Prove `gsp4ConeReversal`, comparing the supplied chambers and chamber duality with the Shimura-filtration Kostant representatives: `C_i=ŵ_i C_G⁺` for the four actions of §5.10. Under this identification, `−w₀,M` sends `C_i` to `C_{3−i}`. Here the minus negates all three coordinates and `w₀,M` swaps `a,b`; the central coordinate is unrestricted. This distinguishes the Levi longest element from the full longest element. The indexing is the `g=2` specialization of AutomorphicFormsOnReductiveGroups §6.7, transported to CG coordinates by §5.10. The coordinate equality is the corresponding specialization of §6.3’s supplied duality.

Apply `(a,b;c)↦(−b,−a;−c)` to the inequalities defining each chamber. This is the chamber-level form of the Kostant involution.

**Checks.**

- `−w₀,M` acts by `(a,b;c)↦(−b,−a;−c)`. It maps `C₀={a≥b≥0}` onto `C₃={−b≥−a≥0}` and `C₁={a≥−b≥0}` onto `C₂={−b≥a≥0}`, the chambers printed on CG p.28.
- `−w₀,G` acts by `(a,b;c)↦(a,b;−a−b−c)` and preserves each entire chamber, since the central coordinate is unrestricted. It therefore cannot give the reversal `C_i↦C_{3−i}`.
- The interior points `(2,1;−17)` and `(2,1;23)` both belong to `C₀`; the central coordinate does not restrict this interior derived weight.
- The point `(2,1;7)` belongs to `C₀` and not `C₃`; `(−1,−2;7)` belongs to `C₃`. The wall point `(1,0;c)`, for every real `c`, belongs to both `C₀` and `C₁`, so these closed cones are not disjoint.

(Frank Calegari; David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.1, PDF p.8; Theorem 5.5 proof, PDF pp.28–29.)

*Needs:* AutomorphicFormsOnReductiveGroups §§6.3, 6.7; [§5.10](#d5-gsp4-kostant); [§3.12](#d3-kostant-cones).

<a id="d5-gsp4-centralizer"></a>

### 5.12 Genus-two real centralizer

Specialize AutomorphicFormsOnReductiveGroups §6.1’s `hodgeStabilizer` and `positiveSplitCentre` through §2.2 to the Siegel datum on `GSp₄(ℝ)` with `h(x+iy)=xI₄+yJ` in the CG basis. Here `S=[[0,1],[1,0]]`, `J=[[0,S],[−S,0]]`, and `K∞,1` is the coordinate set of orthogonal matrices commuting with `J`. The theorem identifies the supplied stabilizer with this matrix presentation.

Prove `gsp4Centralizer`. For CG `J=h(i)`, `K^h={g∈GSp₄(ℝ):gᵀg=ν(g)I₄}=ℝ_{>0}K∞,1=ℝˣK∞,1`, with `K∞,1=Sp₄(ℝ)∩O(4)`. Every element has positive similitude. The full `K∞=GSp₄(ℝ)∩O(4)` also has negative similitudes and does not centralize `h`.

Use the symplectic equation together with `gJ=Jg` to derive `gᵀg=ν(g)I`. Positivity gives the normalization `g↦ν(g)^(−1/2)g`, identifying the supplied `compactQuotient=K^h/A_h`, with `A_h=ℝ_{>0}I₄`, with `K∞,1`. A negative-similitude orthogonal element sends `J` to `−J`.

**Checks.**

- The block matrix `S` sends `(1,0)` to `(0,1)`, fixing the reversal of the two basis vectors.
- `S²=I₂` and det `S=−1`; the identity matrix passes the first identity and fails the determinant test.
- The corresponding `J` satisfies `J²=−I₄` and `Jᵀ=−J`; replacing either off-diagonal block by its negative breaks one of these identities.
- `D=diag(1,1,−1,−1)` satisfies `DᵀD=I` and `DᵀJD=−J`, so it lies in `GSp₄(ℝ)∩O(4)` with similitude `−1`. It anticommutes with `J=h(i)` and is not in `K^h`.
- The positive scalars `rI₄` (similitude `r²`) and `J` itself (similitude `1`, `Jᵀ J=I`) lie in `K^h`.
- Every `k∈K^h` has `ν(k)>0`, because `kᵀk=ν(k)I₄` and `kᵀk` is positive definite.

(Frank Calegari; David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, PDF pp.8–9.)

*Needs:* AutomorphicFormsOnReductiveGroups §6.1; [§2.2](#d2-hermitian-group-adapter); ShimuraVarieties §§P.1–P.5; [§5.9](#d5-gsp4-cg-roots).

<a id="d5-gsp4-unitary"></a>

### 5.13 Unitary identification of the centralizer

Prove `gsp4Unitary`, identifying the `GSp₄` compact quotient of AutomorphicFormsOnReductiveGroups §6.1 with its CG matrix model and `U(2)`. Use §5.12’s normalization of the supplied stabilizer. Put `S=[[0,1],[1,0]]`. Elements of `K∞,1` are `[[SAS,SB],[−BS,A]]` with `AᵀA+BᵀB=I` and `AᵀB=BᵀA`. The map `k↦A+iB` is a real Lie-group isomorphism `K∞,1≅U(2)`.

`K∞,1` is the subgroup of `GL₄(ℝ)` satisfying `kᵀk=I` and `kJ=Jk` for the CG symplectic matrix `J`. `U(2)` is Mathlib's `Matrix.unitaryGroup` (Fin `2`) `ℂ`. A and `B` are recovered from the lower-right block and from `S` times the upper-right block, so the isomorphism has the displayed inverse on every unitary matrix; ArithmeticLocallySymmetricSpaces §ALS.F.1 supplies the Lie group structures, for which a continuous isomorphism of closed matrix groups is an isomorphism of Lie groups.

Expand `kᵀk=I` and the `J` centralizer relation, then compare with (A+iB)* `(A+iB)=I`. Block multiplication verifies the homomorphism and the displayed formula its inverse.

**Checks.**

- `A=I`, `B=0` gives the identity, and `A=0`, `B=I` gives `k=[[0,S],[−S,0]]=J` with `k²=−I₄`, mapped to `iI₂` with `(iI₂)²=−I₂`.
- Multiplicativity: the product of the elements with `(A,B)` and `(A′,B′)` has blocks `A″=AA′−BB′` and `B″=AB′+BA′`, because `S²=I`. This is the real form of `(A+iB)(A′+iB′)`.
- `(A+iB)*(A+iB)=AᵀA+BᵀB+i(AᵀB−BᵀA)=I₂`, so the image is unitary exactly under the two defining relations.

(Frank Calegari; David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, PDF p.9.)

*Needs:* AutomorphicFormsOnReductiveGroups §6.1; [§5.12](#d5-gsp4-centralizer); ArithmeticLocallySymmetricSpaces `§§ALS.F.1`, ALS.0.1–0.2; `Matrix.unitaryGroup`.

<a id="d5-gsp4-compact-cartan"></a>

### 5.14 Genus-two compact Cartan

Import AutomorphicFormsOnReductiveGroups §6.3's `compactCharacter`, `toCompact` and `toSplit`. Identify `(a,b,k)↦(a,b,a+b+2k)` with the supplied lattice equivalence: it is injective and its image is exactly the parity subset. The parametrization `c=a+b+2k` and the rank-three lattice are supplier inputs. The group comparison identifies §6.1’s compact Cartan, with the diagonal choice in §5.13’s `U(2)` model, with the actual rotation/scalar subgroup below.

Construct `gsp4CompactCartan`. Let `H=ℝ_{>0}H₁` in `K^h` with `H₁` the diagonal `U(1)²` under `K∞,1≅U(2)`. Its complex algebraic torus is `(Gm³)/⟨(−1,−1,−1)⟩` in angular/scalar coordinates; its character lattice is `{(a,b;c)∈ℤ³:a+b≡c mod 2}`. Characters evaluate as the corresponding exponential on `h_C`. Compact Cartan coordinates differ from split CG coordinates.

Realize the supplied compact Cartan by taking the inverse image of the diagonal unitary subgroup and multiplying by positive scalars. The simultaneous sign identifies the complexified parametrization; compare its characters with the supplied parity lattice. Section 5.17 compares them with the split lattice through the Cayley basis: the central conversion preserves the two angular labels, whereas the actual Cayley comparison additionally negates them.

- `compactCartanRank`: The actual real rotation/scalar subgroup is isomorphic to `ℝ_{>0}×U(1)²`; identify its complexified character lattice with the supplied rank-three lattice.
- `compactCartanParity`: Under this identification, the actual angular/scalar characters are exactly the supplied triples with `a+b≡c` modulo two.
- `compactCartanEmbedding`: A character `u^a v^b r^c` on the complex covering torus factors through the actual Cartan complexification if and only if it is trivial on `(−1,−1,−1)`, equivalently `a+b≡c` modulo two.

**Checks.**

- `(1,0;1),(0,1;1),(0,0;2)` descend.
- `(1,0;0)` does not descend.
- The actual real group is `ℝ_{>0}×U(1)²`, and `(a,b,k)↦(a,b;a+b+2k)` bijects `ℤ³` with its character lattice. This distinguishes the torus from its lattice.

(Frank Calegari; David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, PDF pp.9–10; Theorem 5.5 proof, PDF p.28.)

*Needs:* AutomorphicFormsOnReductiveGroups §§6.1, 6.3; [§5.13](#d5-gsp4-unitary); ReductiveGroups, Layer 7 (structure theory).

<a id="d5-gsp4-exp-kernel"></a>

### 5.15 Compact Cartan exponential kernel

Prove `gsp4ExpKernel`. In CG coordinates `h(t₁,t₂;z)` on `h_C`, the exponential kernel consists of `(2πm,2πn;2πik)` and `(π+2πm,π+2πn;πi+2πik)`, for `m,n,k∈ℤ`. In particular the extra element `h(π,π;πi)` forces `a+b≡c mod 2` on integral characters.

Exponentiate the two commuting angular blocks and scalar block. The image is identity exactly when all three individual factors have the same sign; solve the two sign cases.

**Checks.**

- `h(π,π;πi)` lies in the kernel: both rotations are by `π`, giving `−I₄`, and `e^{πi}=−1`.
- `h(π,0;πi)` does not: it gives `e^{πi}·diag(−1,1,1,−1)=diag(1,−1,−1,1)≠I₄`.
- On the extra kernel element the character `(a,b;c)`, the form `at₁i+bt₂i+cz`, takes the value `πi(a+b+c)`. Its exponential `(−1)^{a+b+c}` is `1` exactly when `a+b≡c mod 2`: `(1,0;1)` passes and `(1,0;0)` fails.

(Frank Calegari; David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, PDF p.9.)

*Needs:* [§5.14](#d5-gsp4-compact-cartan); RepresentationTheory/LieGroups, Layer 7 (complexification and real forms).

<a id="d5-gsp4-cayley-basis"></a>

### 5.16 Genus-two Cayley basis

Construct `gsp4CayleyBasis`, the CG matrix realization of the Siegel `h`-eigenspaces underlying AutomorphicFormsOnReductiveGroups §6.1’s Hermitian datum. Use the actual `h` and adjoint Hodge summands supplied through §2.2. For the CG `J` and real basis `e₁,…,e₄`, take `f₁=e₁−ie₄,f₂=e₂−ie₃,f₃=e₃−ie₂,f₄=e₄−ie₁`. They are the columns of `C=[[I₂,−iS],[−iS,I₂]]` and give bases of the two `±i-eigenspaces` of `J`. `C` is invertible, with inverse `1/2 [[I₂,iS],[iS,I₂]]`.

Multiply `C` by the proposed inverse and use `S²=I`. Apply `J` to each column to identify `V⁻` and `V⁺`. In this basis the supplied `pPlus=g^{−1,1}` and `pMinus=g^{1,−1}` are respectively the lower-left and upper-right symplectic Hom blocks, of dimension three; `parabolicLie=k^h_ℂ⊕pMinus` stabilizes `V⁻`. These identifications use the adjoint action of this `h`.

- `cayleyInverse`: `C⁻¹=1/2 [[I₂,iS],[iS,I₂]]`.
- `cayleyHodgeLines`: The first and last two columns span the two complex Hodge summands.
- `cayleyConjugation`: Conjugation exchanges the two summands with the reverse-order identification.

**Checks.**

- `C` times the displayed inverse is `I₄`.
- The first column is `e₁−ie₄`.
- Replacing `−iS` in only one off-diagonal block makes the resulting matrix singular.
- The columns of `C=[[I₂,−iS],[−iS,I₂]]` are `(1,0,0,−i)`, `(0,1,−i,0)`, `(0,−i,1,0)` and `(−i,0,0,1)`, which are `f₁,…,f₄` (CG p.10).
- With `J=h(1,1;0)`, the matrix with rows `(0,0,0,1)`, `(0,0,1,0)`, `(0,−1,0,0)` and `(−1,0,0,0)` (CG p.9), `Jf₁=−if₁` and `Jf₃=if₃`. So `f₁,f₂` span `V⁻` and `f₃,f₄` span `V⁺`.
- `C·½[[I₂,iS],[iS,I₂]]=½[[I₂+S²,0],[0,S²+I₂]]=I₄`, since `(−i)(i)=1` and `S²=I₂`.

(Frank Calegari; David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, PDF p.10.)

*Needs:* AutomorphicFormsOnReductiveGroups §6.1; [§2.2](#d2-hermitian-group-adapter); [§5.12](#d5-gsp4-centralizer); ShimuraVarieties §§P.1–P.5.

<a id="d5-gsp4-cayley-action"></a>

### 5.17 Centralizer action in the Cayley basis

Compare AutomorphicFormsOnReductiveGroups §6.1’s compact and noncompact root spaces and §6.3’s character lattices with the CG Cayley basis. The coordinate change is `(a,b,c)↦(−a,−b,a+b+2c)`, with the conjugation and Borel comparisons specified below.

Prove `gsp4CayleyAction`. For `k=[[SAS,SB],[−BS,A]]`, `C⁻¹kC=diag(SAS−iSBS,A+iB)`. In compact coordinates the positive compact root is `(1,−1;0)` and the three positive noncompact roots are `(0,2;0),(1,1;0),(2,0;0)`, according to CG convention. On Lie algebras, `C⁻¹h(t₁,t₂;z)C=diag(z−it₁,z−it₂,z+it₂,z+it₁)` (CG p.10 for `z=0`; `z` is central). Hence the Cayley transform identifies the CG split character `(a,b;c)` of `diag(t₁,t₂,νt₂⁻¹,νt₁⁻¹)` with the compact character `(−a,−b;a+b+2c)`, and CG's positive system on `H_ℂ` is the image of the roots of the lower-triangular Borel. Composing with the longest Weyl element, which is `−1` on the angular coordinates, gives the conversion `(a,b;c)↦(a,b;a+b+2c)`. It carries the upper-triangular positive roots onto those positive roots and `ρ_T=(2,1;−3/2)` to `ρ_H=(2,1;0)`.

Multiply the three block matrices; the off-diagonal blocks vanish and the diagonal blocks are as displayed. Evaluate compact torus characters on Hom blocks to identify compact and noncompact roots.

**Checks.**

- For `k=exp h(t₁,t₂;0)`, the blocks are `A=diag(cos t₂,cos t₁`) and `B=diag(sin t₂,sin t₁`), so `A+iB=diag(e^{it₂},e^{it₁})` and `C⁻¹kC=diag(e^{−it₁},e^{−it₂},e^{it₂},e^{it₁})`, the exponential of `diag(−it₁,−it₂,it₂,it₁)` (CG p.10).
- The lower-triangular roots of `T` map, under `(a,b;c)↦(−a,−b;a+b+2c)`, to CG's positive roots: `(−1,1;0)↦(1,−1;0)`, `(0,−2;1)↦(0,2;0)`, `(−1,−1;1)↦(1,1;0)` and `(−2,0;1)↦(2,0;0)`. The lower-Borel half-sum `(−2,−1;3/2)` maps to `ρ_H=(2,1;0)`.
- CG p.28 pairs `μ=(a,b;c)` with `σ=(−b,−a;a+b+2c)`, the Cayley image followed by the Levi swap. It then uses `λ=(2−b,1−a;−a−b−2c)`, whose derived part `(2−b,1−a)` is that of `σ+ρ_H` and whose central coordinate is `−(a+b+2c)`.

(Frank Calegari; David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §2.2, PDF p.10.)

*Needs:* AutomorphicFormsOnReductiveGroups §§6.1, 6.3; [§5.16](#d5-gsp4-cayley-basis); [§5.13](#d5-gsp4-unitary); [§5.14](#d5-gsp4-compact-cartan); ReductiveGroups, Layer 7 (structure theory).

<a id="d5-gsp4-pilloni-convention"></a>

### 5.18 Pilloni genus-two convention comparison

Prove `gsp4PilloniConvention`. Import from ReductiveGroupsPartII §RG2.5 (gsp4-self-dual) the parity lattice `X*(T)={(a₁,a₂;c)∈ℤ³: c≡a₁+a₂ mod 2}` with basis `e₁=(1,0;1)`, `e₂=(0,1;1)`, `e₃=(0,0;2)=ν`, its half-integral dual with basis `f₁=(1,0;0)`, `f₂=(0,1;0)`, `f₃=(−½,−½;½)`, and the corrected base `α₁=e₂−e₁`, `α₂=e₃−2e₂` with coroots `f₂−f₁` and `−f₂`. For the Siegel datum in Pilloni's coordinates the positive system is that of the lower-triangular Borel: `e₂−e₁`, `−2e₁+e₃`, `−e₁−e₂+e₃`, `−2e₂+e₃`; `ρ=(−2,−1;0)`; `α₁` is the compact simple root and the other three positive roots are the noncompact roots in `g_ℂ/p_Si`. CG coordinates convert by `(a,b;c)_CG↦(a,b;a+b+2c)_P`, and the BP Borel swaps the compact order, giving `ρ_BP=(−1,−2;0)` for `g=2`.

The lattices, dual basis, corrected base and self-duality are ReductiveGroupsPartII §RG2.5's, stated there in Pilloni's coordinates. Rational coordinates pair `e_i` with `f_j` by the ordinary dot product; a dual vector has coordinates `(m−r/2,n−r/2;r/2)` for integers `m,n,r`.

Apply the lattice conversion and negate the CG full positive roots, then pair with the imported coroots. Distinguish the BP block Borel from Pilloni’s lower full Borel.

**Checks.**

- `ρ`: `½[(e₂−e₁)+(−2e₁+e₃)+(−e₁−e₂+e₃)+(−2e₂+e₃)]=½(−4e₁−2e₂+3e₃)`. With `e₁=(1,0;1)`, `e₂=(0,1;1)` and `e₃=(0,0;2)`, this is `½(−4,−2;−4−2+6)=(−2,−1;0)`.
- The dual basis `f₁=(1,0;0)`, `f₂=(0,1;0)`, `f₃=(−½,−½;½)` pairs with `e₁`, `e₂`, `e₃` by the dot product. Then `⟨α₁,f₂−f₁⟩=2`, `⟨α₂,−f₂⟩=2`, `⟨α₁,−f₂⟩=−1` and `⟨α₂,f₂−f₁⟩=−2`, the Cartan matrix of type `C₂`.
- The CG conversion sends the CG positive roots to the negatives of Pilloni's, and CG's `ρ=(2,1;−3/2)` to `(2,1;0)=−ρ_Pilloni`: the two Borels are opposite. For `g=2`, BP's `ρ=(−1,−2;0)` ([§5.5](#d5-siegel-root-convention)) differs from Pilloni's by the swap of the compact order.

(Vincent Pilloni, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §5.1.1, author p.20; Remark 5.2.1.1, author p.23.)

*Needs:* ReductiveGroups, Layer 7 (structure theory); [§5.9](#d5-gsp4-cg-roots); [§5.5](#d5-siegel-root-convention); [§5.17](#d5-gsp4-cayley-action); ReductiveGroupsPartII §RG2.5; `RootPairing`; `RootPairing.Base`; `RootPairing.Base.IsPos`.

<a id="d5-local-eigenvalue-bound"></a>

### 5.19 Unipotent reduction eigenvalue bound

Prove `localEigenvalueBound`. Let `F_v/ℚ_l` be absolutely unramified, normalize `v(l)=1`, and let `γ∈Iw₁(v)⊂GSp₄(F_v)`. Every eigenvalue `λ` in an algebraic closure satisfies `v(λ−1)≥1/4`, since `χγ(X)≡(X−1)^4` modulo the maximal ideal.

The local valuation extends to an algebraic closure and is normalized by `v(l)=1`. The eigenvalue bound uses absolute unramifiedness and the `Iw₁` congruence `χ(X)≡(X−1)^4`. The torsion gap and final criterion require residue characteristic `l>5`; products use integer exponents.

Shift `χγ` to `Y=X−1`. All lower coefficients have valuation `≥1`. If `v(Y)<1/4`, `Y⁴` has strictly smaller valuation than every other term, contradicting the ultrametric equality at a root. The leading coefficient is `1`.

**Checks.**

- For `ℓ` odd, `−I₄∉Iw₁(v)`: its reduction is `−1`, not unipotent, consistent with `v(−1−1)=v(−2)=0<1/4`.
- At `ℓ=2`, `−I₄` reduces to `I₄` and `v(−1−1)=v(−2)=1≥1/4`. Thus the eigenvalue estimate itself includes residue characteristic two but cannot by itself exclude torsion there.
- For `F_v=ℚ₇` and the scalar `uI₄` with `u=7+5√2` at `v=(7,√2−3)`, `√2≡3` mod `v` gives `u−1≡21≡0`, so every eigenvalue `u` satisfies `v(u−1)≥1`.
- The normalization matters: if `F_v/ℚ_ℓ` had ramification index `e` with `v(ℓ)=1`, the same argument would give only `v(λ−1)≥1/(4e)`.

(George Boxer; Frank Calegari; Toby Gee; Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Lemma 7.8.3, published p.409.)

*Needs:* AdelicAlgebraicGroups §4.3; ReductiveGroupsPartII §RG2.3; `AddValuation`; LocalFieldsRamification, Layer 0 (local fields and their finite extensions); `AddValuation.map_mul`; `AddValuation.map_le_add`; `AddValuation.map_inv`; `AddValuation.map_zero`.

<a id="d5-local-products-bound"></a>

### 5.20 Eigenvalue products retain the bound

Prove `localProductsBound`. If `v(λ_j−1)≥1/4` for finitely many `λ_j`, every integer product `η=∏λ_j^{n_j}` also satisfies `v(η−1)≥1/4`. All `λ_j` are units. Inversion preserves `v(λ−1)`, and multiplication uses `ab−1=(a−1)b+(b−1)`.

The local valuation extends to an algebraic closure and is normalized by `v(l)=1`. The eigenvalue bound uses absolute unramifiedness and the `Iw₁` congruence `χ(X)≡(X−1)^4`. The torsion gap and final criterion require residue characteristic `l>5`; products use integer exponents.

The closed ball `1+{x:v(x)≥1/4}` is a multiplicative subgroup by the two identities. Induct on products and integer powers.

**Checks.**

- Generators are needed, not just eigenvalues: `λ₁=2` and `λ₂=−1/2` (the matrix `diag(2,−1/2)`) are not torsion but `λ₁λ₂=−1` is, and they fail the hypothesis because `v(2−1)=0`.
- For `ℓ=7`, `λ=8` and `μ=−6`: `v(λμ−1)=v(−49)=2` and `v(λ/μ−1)=v(−14/6)=1`, both `≥1/4`.
- Use in [§5.21](#d5-iwahori-neat): a root of unity `ζ≠1` of `ℓ-power` order has `v(ζ−1)≤1/(ℓ−1)<1/4` for `ℓ>5`, and one whose order is not an `ℓ-power` has `v(ζ−1)=0`: its prime-to-`ℓ` part has nontrivial reduction, whereas its `ℓ-power` part reduces to `1`. So the generated group contains no nontrivial torsion.

(George Boxer; Frank Calegari; Toby Gee; Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proof of Lemma 7.8.3, published p.409 (generated-group step expanded here).)

*Needs:* [§5.19](#d5-local-eigenvalue-bound); `AddValuation`; LocalFieldsRamification, Layer 0 (local fields and their finite extensions); `AddValuation.map_mul`; `AddValuation.map_le_add`; `AddValuation.map_inv`; `AddValuation.map_zero`.

<a id="d5-iwahori-neat"></a>

### 5.21 Unipotent Iwahori criterion for neatness

Prove `iwahoriNeat`. For a number field `F` and a compact open `K⊂GSp₄(𝔸F,f)`, choose one rational prime `ℓ>5`. Suppose every place `v|ℓ` is absolutely unramified and the projection of `K` to `GSp₄(F_v)` is contained in `Iw₁(v)`. Then every `k∈K` is adelically neat for the faithful `ℚ`-representation of `Res_F/ℚ GSp₄` on the underlying `ℚ`-space of `F⁴`, as in Definition 3.2.1. Hence for every `g∈GSp₄(𝔸F,f)`, every `γ∈GSp₄(F)∩gKg⁻¹` is rationally neat in that representation. The same certification proves the prime-to-`p` statement when `ℓ≠p` and all places above `ℓ` are retained. For `F=ℚ` this recovers the one-place criterion. One arbitrary `F`-place does not suffice for this rational conclusion; the single-place counterexample below demonstrates the failure.

The local valuation extends to an algebraic closure and is normalized by `v(l)=1`. The eigenvalue bound uses absolute unramifiedness and the `Iw₁` congruence `χ(X)≡(X−1)^4`. The torsion gap and final criterion require residue characteristic `l>5`; products use integer exponents.

The rational group is `Res_F/ℚ GSp₄` and the faithful representation is the restriction of scalars of `F⁴`. At a rational prime `ℓ` its spectrum includes the standard eigenvalues for every completion `F_v` with `v|ℓ` and all embeddings of these completions into `ℚ̄_ℓ`. `K` need not be a product, provided every certification projection lies in `Iw₁(v)`. Absolute unramifiedness is required at every `v|ℓ`.

For each `v|ℓ`, the shifted degree-four characteristic polynomial and `v(ℓ)=1` bound every standard eigenvalue `λ` by `v(λ−1)≥1/4` ([§5.19](#d5-local-eigenvalue-bound)). Transport through every embedding of `F_v` into `ℚ̄_ℓ`; the same normalized bound holds for every eigenvalue of the faithful rational representation, not just one four-dimensional factor.

[§5.20](#d5-local-products-bound) bounds the whole subgroup generated by these eigenvalues. By AdelicAlgebraicGroups §4.3 (distance of `p`-adic roots of unity from one), a nontrivial root of unity `ζ` has `v(ζ−1)=0` if its order is not an `ℓ-power` and `v(ζ−1)=1/(ℓ^{k−1}(ℓ−1))≤1/(ℓ−1)` if it is a primitive `ℓ^k`-th root; for `ℓ>5` both are `<1/4`. So the `ℓ-term` of Definition 3.2.1 is torsion free and the global intersection is trivial for every `k∈K`. For every finite-dimensional representation, torsion freeness of the eigenvalue-generated group at one prime outside the omitted set makes the simultaneous-prime intersection trivial. Injectivity of `ℚ̄→K_ℓ` carries the resulting equality of a torsion root with `1` back to `ℚ̄`.

Adelic conjugation preserves each local spectrum. A rational element of a conjugate level has the same eigenvalues in every local realization of its faithful rational representation, so adelic neatness gives rational neatness (AA §4.3's `Neat.IsNeatAut`). Removing a prime `p≠ℓ` leaves the certifying term available.

**Checks.**

- `F=ℚ` and `ℓ=7`: a compact open `K⊂GSp₄(𝔸_f)` with `K₇⊂Iw₁(7)` is neat. This is BCGP Lemma 7.8.3 for `F=ℚ`.
- `F=ℚ(√2)`, `ℓ=7`: `7` splits as `(7,√2−3)(7,√2+3)`, and `u=7+5√2` is `≡1` at the first place and `≡−1` at the second. So `uI₄` lies in `Iw₁` at one place above `7` but not at both. It is excluded by the hypothesis, as it must be: its rational eigenvalues `u` and `7−5√2` have product `−1`.
- The bound needs `ℓ>5`. For `ℓ=5` a primitive fifth root of unity `ζ` has `v(ζ−1)=1/4`, so the inequality `v(η−1)≥1/4` no longer excludes torsion.

(George Boxer; Frank Calegari; Toby Gee; Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Lemma 7.8.3, published p.409.)

*Needs:* [§5.19](#d5-local-eigenvalue-bound); [§5.20](#d5-local-products-bound); [§5.1](#d5-adelic-neat); AdelicAlgebraicGroups §4.3; `AddValuation`; LocalFieldsRamification, Layer 0 (local fields and their finite extensions); AdelicAlgebraicGroups §§1.3–1.4; ReductiveGroupsPartII §RG2.3; ReductiveGroups, Layer 1 (representations and comodules); `NumberField.RingOfIntegers`; `IsDedekindDomain.FiniteAdeleRing`.

### Examples

Genus two has four Siegel Kostant representatives and sequences `(0,0,0)`, `(0,0,1)`, `(0,1,1)`, `(0,1,2)`. The compact-torus character `(1,0;0)` fails parity. At `ℓ=5` a primitive fifth root reaches valuation `1/4`, so the strict prime bound in neatness is necessary.

### Dependencies

AutomorphicFormsOnReductiveGroups §§6.1, 6.3, 6.7; AdelicAlgebraicGroups §§1.3–1.4; AdelicAlgebraicGroups §4.3; ArithmeticLocallySymmetricSpaces `§§ALS.F.1`, ALS.0.1–0.2; PELModuli §M0.12; PELModuli §§M5.1, M5.4–M5.5; ReductiveGroupsPartII `§RG2.0a`; ReductiveGroupsPartII §RG2.3; ReductiveGroupsPartII §RG2.5; [§0.1](#d0-hilbert-real-points); [§3.14](#d3-bruhat-integral); [§3.8](#d3-compact-dual); [§3.7](#d3-filtration-parabolic); [§3.11](#d3-kostant-cone-criterion); [§3.12](#d3-kostant-cones); [§3.13](#d3-kostant-involution); [§3.10](#d3-kostant-representatives); [§3.9](#d3-reflex-flag-descent); ShimuraVarieties §§P.1–P.5; `AddValuation`; `AddValuation.map_inv`; `AddValuation.map_le_add`; `AddValuation.map_mul`; `AddValuation.map_zero`; `IsDedekindDomain.FiniteAdeleRing`; `Matrix.GeneralLinearGroup.toLin`; `Matrix.unitaryGroup`; `NumberField.RingOfIntegers`; `RootPairing`; `RootPairing.Base`; `RootPairing.Base.IsPos`; `RootPairing.weylGroup`; LocalFieldsRamification, Layer 0 (local fields and their finite extensions); ReductiveGroups, Layer 1 (representations and comodules); ReductiveGroups, Layer 6 (reductive and semisimple groups); ReductiveGroups, Layer 7 (structure theory); ReductiveGroups, Layer 9 (pinned Chevalley–Demazure group schemes); RepresentationTheory/LieGroups, Layer 7 (complexification and real forms).

## Downstream consumers

AutomorphicBundles uses rational weight summands, the intrinsic filtration parabolic, the compact-dual map and tangent transversality. HigherHidaAndColemanTheory uses the left-coset comparison, integral ordinary/opposite cells and the explicit `C₂` coordinate dictionaries. Its Hermitian interface, root/chamber data and general Siegel Kostant indices come from AutomorphicFormsOnReductiveGroups §§6.1, 6.3 and 6.7; Kostant’s Lie-cohomology theorem comes from ArithmeticLocallySymmetricSpaces §ALS.4.5. The geometric adapter `PureDatum.toHermitianGroupDatum` realizes the supplied interface, and §§5.9–5.17 identify its objects with the CG torus, centralizer, compact Cartan and Cayley basis. HodgeStructuresPartII uses general variations, their filtered flat bundles, real-analytic Hodge projections, kernels and polarized orthogonal splittings. HilbertModularVarietiesAndShimuraCurves uses the full/star domain comparison and product reflex fields; its PEL trace pairing comes directly from PELModuli. PerfectoidShimuraVarieties uses preabelian type and the distinguished `B₁→B` diagram with its common adjoint datum, compact dual and Levi fibre products. ShimuraCompactifications uses the integral polarized variation interface. CM reflex comparisons and canonical models use ShimuraVarieties directly.

## References

- J. S. Milne, [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Author notes, 2017 edition.
- Pierre Deligne, [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), Published Proc. Symp. Pure Math. 33 II (1979), IAS scan.
- George Boxer; Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Author copy, 5 November 2025; locators refer to this version.
- George Boxer; Vincent Pilloni, [Higher Coleman theory](https://arxiv.org/pdf/2110.10251v1), arXiv:2110.10251v1 (2021).
- Frank Calegari; David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Author-hosted typeset version, 2019, DOI 10.1215/00127094-2019-0044, pp.1–96; locators refer to its PDF pagination.
- Vincent Pilloni, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Author copy, 17 June 2019, 113 pages; locators refer to this version.
- Benjamin Bakker; Bruno Klingler; Jacob Tsimerman, [Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://arxiv.org/pdf/1810.04801v2), arXiv:1810.04801v2 (22 June 2020); published JAMS 33 (2020), 917–939.
- Olivier Benoist, [The period-index problem for real surfaces](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf), Published Publ. Math. IHÉS 130 (2019), pp.63–110.
- George Boxer; Frank Calegari; Toby Gee; Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Published Publ. Math. IHÉS 134 (2021), pp.153–501.
- David Masser; Umberto Zannier, [Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), Published Annals of Math. 191 (2020), pp.635–674.
- David Hansen; Christian Johansson, [Completed cohomology and preabelian type Shimura varieties](https://pure.mpg.de/rest/items/item_3525265_3/component/file_3560933/content), Published J. Lond. Math. Soc. 107 (2023), §4.1 p.1980 (PDF p.27), DOI 10.1112/jlms.12799; public MPG copy.
- J. S. Milne, [Shimura varieties and moduli](https://www.jmilne.org/math/xnotes/svhIP.pdf), Published Handbook of Moduli, Vol. II (2013), author-hosted typeset chapter; printed pagination.
- Tom Lovering, [Integral canonical models for automorphic vector bundles of abelian type](https://arxiv.org/pdf/1605.02717v3), arXiv:1605.02717v3; published Algebra Number Theory 11 (2017), no. 8, 1837–1890.
- Tau Ceti Project, ComplexKahlerGeometry: complex manifolds, Dolbeault theory, and Kähler geometry, §K4.
- Tau Ceti Project, ComplexManifolds: transport, quotients, bundles, and gluing, Milestone 7.
- Brian Conrad, [Reductive group schemes](https://math.stanford.edu/~conrad/papers/luminysga3.pdf), Panoramas et Synthèses 42–43 (2014), Theorem 2.3.6, pp.72–73; Theorem 5.1.13, p.143; Corollaries 5.2.8–5.2.9, pp.155–157.
- Michel Brion and V. Lakshmibai, [A geometric approach to Standard Monomial Theory](https://arxiv.org/pdf/math/0111054v1), arXiv:math/0111054v1, §1, Lemma 1 and proof, pp.5–6 (published Represent. Theory 7 (2003), 651–680).
- J. S. Milne and K.-y. Shih, [Conjugates of Shimura varieties](https://www.jmilne.org/math/articles/1982d.pdf), in Hodge Cycles, Motives, and Shimura Varieties, LNM 900 (1982), Proposition 3.1, Lemma 3.2 and Remark 3.3(a), pp.297–299.

- J. C. Jantzen, *Representations of Algebraic Groups*, second edition, AMS, 2003, Part II §§13.1–13.8, pp.353–362; Propositions 14.15–14.16 and the partial-flag remark, pp.376–378. [Publisher record](https://doi.org/10.1090/surv/107).

