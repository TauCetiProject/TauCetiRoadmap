# Roadmap: Hilbert modular varieties and quaternionic Shimura curves

**Summary.** Construct the finite-level Hilbert modular varieties of a totally real field and the quaternionic Shimura curves attached to quaternion algebras split at exactly one real place, together with the integral, cohomological and p-adic structures that arithmetic applications use. The Hilbert strand keeps ordered, possibly nonprincipal polarization modules, the Deligne–Pappas integral models at ramified primes and at 2, paired full levels and the exact positive-unit quotient, and ends with paired torsion twists that have prescribed real and finite local points (the input to potential modularity). The quaternionic strand builds the canonical compact curves and their auxiliary PEL bridge, the Drinfeld half-plane and its formal model, Čerednik–Drinfeld uniformisation at a division prime, integral model towers with their Hodge lines and p-divisible groups, finite-level coefficient cohomology with Hecke actions, and the integral Ihara lemma. Definite quaternion algebras supply finite integral Hecke modules, a definite Ihara lemma over every totally real field, auxiliary Taylor–Wiles levels and dyadic norm twists. The end theorems are the Čerednik–Drinfeld uniformisation (§R18.5.15), the Ihara lemma for Shimura curves with its integral saturation (§§R18.4.32–R18.4.33), the definite Ihara lemma (§R18.3.8) and the realization of paired torsion twists with local points (§§H6.2–H6.8). The uniformisation and the Ihara lemma for curves rest on the formal Drinfeld quotient (§§R18.5.7, R18.5.11), basic PEL uniformisation (§R18.5.13), weak patching (§R18.4.29) and regular-base flatness (§R18.4.30), and the local points rest on Taylor's input contract (§H6.5).

Every theorem below keeps the prime, level, lattice and component hypotheses that make it true: a polarization-class quotient, a selected Weil-pairing component and a fine moduli space are different objects, and a construction in characteristic zero gives nothing integral at a ramified prime. Each definition has its API and Checks, which are tests a plausible wrong definition fails. [Suggested.lean](Suggested.lean) states the light definitions and the milestones that can be typed at the pinned Mathlib and Tau Ceti. Everything else is a target of this document.

## Scope and ownership

The Serre tensor specialization for projective polarization modules is constructed in §H1.0 from the abelian-scheme APIs below. This roadmap owns the specializations of general Shimura, PEL, abelian-scheme and automorphic theory to Hilbert modular varieties, to one-real-split quaternionic Shimura curves and to totally definite quaternion algebras. It also owns the arithmetic constructions that only these spaces need. For the Hilbert strand these are the integral trace lattices, the Deligne–Pappas local and global models, the Hilbert Hasse ideal, the unit-square kernels and polarization quotients, the hybrid, scalar and arithmetic full levels, and the paired torsion twists with their local points. For the quaternionic strand they are the canonical curve and its CM bridge, the Drinfeld half-plane, its formal model and moduli interpretation, the arithmetic Drinfeld quotient and the Čerednik–Drinfeld theorem, integral model towers, the coefficient cohomology of the curves with its Hecke, duality and degeneracy structure, and the Ihara lemma. For definite algebras they are the central quotient and fixed-central-character adapters to QuaternionicModularForms, the integral pairings and isotropy-sensitive reduction, the Taylor–Wiles auxiliary levels and the dyadic twists. QuaternionicModularForms owns the general class sets, coefficient conventions, abstract form functor, evaluation equivalence and Hecke action.

The following specializations retain the level, coefficient and polarization conditions needed by these varieties:

- the characteristic-zero Hilbert cusps of real quadratic fields at tame `Γ₁(c,𝔫)` level (§H5.2);
- the open Hodge-line splitting with its scalar descent, and the algebraic Hilbert weights (§§H5.3–H5.4);
- the hermitian norm metric on the quaternionic Hodge line (§R18.2.12);
- the structured ordinary Honda–Tate construction used for finite local points (§H6.5);
- the finite-level coefficient, norm-twist and Hecke comparisons for the quaternionic transfer supplied by GL2AutomorphicRepresentationsAndTransfer (§§R18.3.19–R18.3.22 and §R18.4.24);
- the division-place parity characters (§R18.3.17);
- the arithmetic normalization and additional Taylor/Kisin, degree-one and lattice extensions of the Carayol/Saito core supplied by WeightsInEtaleCohomology R34.6, used before Taylor–Wiles arguments (§R18.3.29 and §R18.4.27);
- the local deformation datum and Taylor–Wiles prime datum of the Ihara argument (§§R18.4.19–R18.4.20).

These targets supply the arithmetic applications of §R18.6. General toroidal and minimal compactifications, general automorphic bundles, arithmetic heights, the general Jacquet–Langlands correspondence, Galois representations attached to general Hilbert modular forms, Moret–Bailly and modularity lifting are not constructed here; they consume the outputs listed in §R18.6.

Tau Ceti roadmaps supply the general objects, and nothing they contain is repeated here:

| Tau Ceti roadmap | Material used here |
| --- | --- |
| [QuaternionicModularForms](../QuaternionicModularForms/README.md), §§0.1–0.3, 1.3, 2.1–2.2, 3.1 | Quaternion orders and their lattice/idele dictionary, definite class sets and compact stabilizers modulo the centre, right algebraic coefficients, abstract forms, evaluation and the opposite Hecke action. |
| AdelicAlgebraicGroups (§§3.4, 4.2–4.5) | Reduction theory, class-number finiteness, compactness of anisotropic quotients, neat levels, strong approximation and level maps. |
| AutomorphicFormsOnReductiveGroups (§§0.5, 5.8, 7.3) | Finite Hecke operators on invariants through `HeckeCoset`, the shared universal anemic algebra `𝕋^S`, and its arithmetic eigensystems and eigen-ideals. |
| NeronModelsAndSemistableAbelianVarieties (Layer 4) | Weighted graph cycles, Gram maps and component cokernels, with the shared `HeckeFamily` and `SemistableTorsionDatum` / `TwoPlaceSemistableTorsionDatum` interfaces. |
| GL2AutomorphicRepresentationsAndTransfer (§R17.1.5) | Quaternion ramification sets, their realization and comparison, including the exchange of a finite and a real invariant. |
| ReductiveGroupsPartII (RG2.0–RG2.3) | Restriction of scalars and central quotients of quaternionic groups, their real and local points, integral quaternion-order levels and the Bruhat–Tits tree of `GL₂`. |
| SmoothRepresentationsOfLocalGroups (SR.0–SR.3) | Smooth and admissible representations, smooth characters, normalized parabolic induction, Iwahori invariants, Steinberg and square-integrable representations. |
| IntegralHeckeAndGaloisDeterminants (§§1.2, 1.7, 3a.1, 4.1) | Determinant reconstruction, the GLₙ Hecke polynomial, the Frobenius normalization conversion and compact determinant gluing. |
| QuadraticFormInvariants, Layer 2 | Quaternion algebras, their splitting, reduced norm and trace. |
| AlgebraicVectorBundles, L0 | Finite locally free sheaves, tensor products, duals, exterior powers and determinants, specialized here to Hodge and determinant lines. |
| StableReduction, Layers 0, 1, 4, 5, 6 | Relative curves over DVRs, nodes and dual multigraphs, blow-ups and divisors on arithmetic surfaces, regular and minimal models, numerical types. |
| JacobianChallenge, Layer A | Line bundles, divisor classes, Picard groups and degree, used for the rational quaternionic Hodge line. |
| ModularCurves | The elliptic moduli problems and their paired torsion twists, specialized in H5 and H6. |
| ClassFieldTheory, Layer 12; Chebotarev, Layer 10 | Ray-class characters and reciprocity, and infinitude of Frobenius classes, used in residual Eisenstein vanishing and early Galois arguments. |
| DeformationAndDerivedPatchingAlgebra, §3.3 | Generic module miracle flatness over a regular local base; §R18.4.30 proves the MCM support-dimension specialization for the patched local-type rings. |
| AlgebraicTopology, Stage 6 | Twisted chains, cochains and cohomology of local coefficient systems; this roadmap adds only the arithmetic finite-free dual adapter. |

Cross-roadmap references name the supplier and its section or target. The exact contracts are stated below. PELModuli M5.4 owns the rational star datum and trace embedding; ShimuraData §§5.3–5.4 owns the full datum and domain inclusion. Section H0.0 transports their conventions; the c-dependent integral refinements belong here.

## Conventions

**Hilbert data (H0–H6).** F is a totally real number field, `g=[F:ℚ], O=O_F` its ring of integers, `𝔡` its absolute different and `Σ` its set of real embeddings. For a nonzero invertible ordered fractional ideal c write `D=𝔡⁻¹` for the trace-dual ideal (not a quaternion algebra). The rational Hilbert groups are

```text
G  = Res_{F/ℚ} GL₂,      G* = G ×_{Res_{F/ℚ} G_m} G_m,
```

where the maps are the determinant and the scalar inclusion. A star always denotes the scalar-determinant group. Its full domain has two common-sign components, whereas G has independent signs at the real embeddings; the chosen positive connected domain is `ℍ^Σ`. The homological convention for h and the trace-form sign are those of §H0.0, used consistently in the complex moduli comparison.

Lattices use row vectors:

```text
L_c = O ⊕ c⁻¹𝔡⁻¹,   L_c^# = c ⊕ 𝔡⁻¹ = c·L_c,   ψ_{c,a}(x,y) = Tr_{F/ℚ}(a(x₁y₂ − x₂y₁)),  a ∈ c.
```

This is a family of integral forms; no generator of c is chosen. The balance law is `ψ_{c,ba}(x,y)=ψ_{c,a}(bx,y)=ψ_{c,a}(x,by)`; it is not an O-linear scalar multiplication on the `ℤ`-valued output. An ordered module has a selected positive component at each real embedding, and an ordered ideal isomorphism preserves those components.

Unless a target says otherwise, `N≥4` is prime to p, the tame `μ_N` level is a map `𝔡⁻¹⊗μ_N→A[N]`, and the generic full `p^n` level is a frame of `A∨[p^n]`. The level action is `γ·α=α∘adj(γ)`: adjugation reverses products, so this is a left action. A compatible local isomorphism `β:c⁻¹O_p≅𝔡⁻¹(1)` fixes the pairing multiplier, and replacing `β` by `uβ` replaces the multiplier b by `u⁻¹b`. Integral `Γ₀` levels are finite locally free subgroup schemes, including non-étale ones; full constant frames are characteristic-zero data.

Let `U=O_F×, U⁺` its totally positive subgroup, `U_M={u∈U : u≡1 mod MO}` and `S_M={u² : u∈U_M}`. Square roots in `U_M` need not be totally positive. Distinguish `Δ(M)=U⁺/S_M` from `Δ_n(N)=(U_{p^n}∩U⁺)/S_{p^nN}`, from the ineffective scalar image `Z_n` and from a selected pairing-multiplier fibre. Polarization quotients retain their quotient stacks; a coarse torsor assertion requires trivial geometric stabilizers for the relevant action (§H3.6). The connected inverse limit stabilizes to its images `I_n⊂Δ_n(N)`; at `p=2` the projections onto the whole of `Δ_n(N)` need not stabilize to isomorphisms (§H4.19).

**Quaternionic curves (R18.1, R18.2, R18.4, R18.5).** B/F is a division quaternion algebra split at exactly the designated real embedding `τ`. Its canonical compact curve is defined over `τ(F)`, identified with F only through `τ`. Fix a maximal finite adelic order `O_B` and all local splittings. At v|p write `K=(F_v^{ur})^` for the completed maximal unramified extension; an auxiliary reflex completion K′ is a different field. The effective pro-level centre is the closure of `F×` in `B_f×`, whereas a finite arithmetic stabilizer on `ℍ` is divided by its rational scalar subgroup. The split rational modular case is stated separately and has its cusps. In R18.4 the level is sufficiently small in the effective central quotient, so the curve is smooth and proper with no cusps; coefficients are the integers O of a finite extension of `ℚ_l`, the algebraic coefficient lattice is level-stable with the specified central character and is trivial on every rational scalar stabilizer `Γ_g∩F×`. Its finite étale reductions descend through the effective central kernel at every level and correspondence in use (§R18.4.1). These coefficient hypotheses apply throughout R18.4, including the compact automorphic comparisons. A perfect integral pairing is an extra hypothesis wherever integral duality is used. Hodge–Tate weights here are filtration indices, so `HT(ε_p)=−1`; negate the labelled weights of FiniteFlatGroupsAndIntegralPadicHodgeTheory when importing its statements.

**Local Drinfeld geometry (R18.5).** `K/ℚ_p` is finite, with integers `O_K`, uniformizer `π`, residue field k of size q, completed algebraic closure C and completed maximal unramified extension Ǩ; valuations satisfy `ord_K(π)=1`. Group heights are `O_K`-relative: absolute Barsotti–Tate height is `[K:ℚ_p]` times relative group height. For quasi-isogenies, relative height is the logarithm of degree to base q after clearing denominators, and absolute p-height is `[k:𝔽_p]` times that relative height. A special strict formal `O_D`-module has relative height four and Lie rank two. The framing quasi-isogeny follows Boutot–Zink (from the variable object to the fixed one); Boutot–Carayol reverse it, and the comparisons invert it and change the sign of heights accordingly. The normalized homography action, the BZ height shift `ord_K(det)` and the BZ right `Π⁻¹` descent translation are distinct maps. The canonical Yuan–Zhang datum uses the central-twist adapter of §R18.1.1a: its descent element is `s=Nrd(Π)Π⁻¹`, with the norm embedded centrally at v. Raw BZ local moduli conventions are retained until that adapter is applied. For the global statements F is totally real and B/F is split at exactly one real place `τ` and division at v|p; the invariant exchange B̌ is definite at every real place, split at v and agrees with B elsewhere, with the fixed local and away-from-v identifications of the sources. Central scalars act trivially on P¹ and on the tree and are removed before freeness is tested. Dual graphs are multigraphs: loops and repeated edges are kept, and an edge reversed by an element of a finite arithmetic stabilizer is deleted in Kurihara's sense rather than turned into a loop.

**Definite algebras (R18.3).** For the Khare–Wintenberger specializations F has even degree, D/F is totally definite and split at the finite places where a `GL₂` splitting is used, and O denotes the integers of a sufficiently large finite extension of `ℚ_p` with residue field k. A finite free coefficient representation `τ` and a continuous character `ψ:A_{F,f}×/F×→O×` satisfy `τ(z)=ψ(z)⁻¹` on `U∩A_{F,f}×`. The level U is compact open, except in the explicitly stated dyadic variant with full division factors. The general-field class-set, coefficient and form adapters (§§R18.3.1–R18.3.3), norm-fibre and Ihara targets (§§R18.3.7–R18.3.8), and characteristic-zero transfer targets (§§R18.3.19–R18.3.22) impose neither parity of `[F:ℚ]` nor unramifiedness of the coefficient prime in F; they retain their stated local splitting and coefficient-model hypotheses. The Hecke polynomial `X²−T_vX+q_vS_v` uses arithmetic Frobenius; purity statements use geometric Frobenius; `q_v` is a unit in k in every residual evaluation.

**Non-finite topological coefficients (R18.4).** Every use of ordinary sheaf/singular comparison outside ComplexComparisonPartII §C6.1's finite coefficient domain assumes ArithmeticLocallySymmetricSpaces ALS.F.3's `TopologicalCoefficientInput(R)`, on all the spaces, local systems and maps used. This includes `R=O`, its characteristic-zero fraction field and `ℂ`, the Hilbert Borel–Serre pairs, quaternionic curves and the connected-compact arithmetic quotients with their central tori. The hypothesis includes restriction, coefficient maps, level pullback, finite-cover trace and support maps; it is retained by every target and export using these comparisons. Section R18.4.12 deduces the ordinary/derived-adic cochain identification under this hypothesis and the supplied finite-cell models.

**Names.** Lean names in this document are relative to the namespace `TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves` of [Suggested.lean](Suggested.lean); a name that does not occur there is the intended name of a README-only target.

## Exact supplier contracts

### From Mathlib

At Mathlib `6b7abb3`, trace duality and the different come from `Algebra.trace`, `Submodule.mem_traceDual`, `FractionalIdeal.dual`, `FractionalIdeal.dual_eq_mul_inv` and `FractionalIdeal.dual_dual`. Group quotients and coefficient modules use `DoubleCoset.Quotient` and `DoubleCoset.eq`, `QuotientGroup.mk`, `Representation` and `Representation.invariants`, `MonoidAlgebra`, `Module.Finite` (finite generation, not finite cardinality) and `Module.Free`. The full-level action uses `Matrix.adjugate_mul_distrib` and `Matrix.det_adjugate`. The residual Hecke evaluation uses `MvPolynomial.eval₂Hom`, `RingHom.ker` and `RingHom.ker_isMaximal_of_surjective`, the last only under coefficient surjectivity. Schemes and their properties use `AlgebraicGeometry.Scheme` and `AlgebraicGeometry.Flat`, and DVR coefficients use `IsDiscreteValuationRing` and `Module.free_of_finite_type_torsion_free'`. The basic PEL descent cocycle uses `groupCohomology.H1ofAutOnUnitsUnique` and `groupCohomology.exists_div_of_norm_eq_one` (Hilbert 90). The paired height lattice is an `AddSubgroup` and the chart condition a predicate on a `MulAction`.

### From Tau Ceti

At Tau Ceti `a91d3aa`, `NumberField.IsTotallyPositive`, `NumberField.totallyPositiveIntegerUnits` and `NumberField.sq_mem_totallyPositiveIntegerUnits` supply positivity and the containment of unit squares. `NumberField.unitsMulEquivTorsionProdMultiplicative`, `NumberField.units_sq_index_eq` and `NumberField.card_elementaryTwoQuotient_units` supply the structure of the unit group and the order of its square classes. The narrow class group comes with `NumberField.NarrowClassGroup.instFinite` and `NumberField.NarrowClassGroup.exists_mk0_eq_and_isCoprime_absNorm`. `QuaternionAlgebra.normForm_coe` gives the norm z² of a central element. `TauCeti.SU2.symPower`, `TauCeti.SU2.finrank_symPower`, `TauCeti.SU2.isIrreducible_symPower` and `TauCeti.SU2.existsUnique_nonempty_equiv_symPower` give the representations of SU(2) used at the definite real places. `TauCeti.LocalCoefficientSystem`, with `pullback`, `monodromyRepresentation` and `constantFunctor`, is the fundamental-groupoid carrier of Betti coefficients. The library module `TauCeti.AlgebraicTopology.Cohomology.Twisted.Basic` supplies `TauCeti.LocalCoefficientSystem.twistedCochainComplex`, `twistedCohomology` and `twistedCochainComplexCoefficientMap`; it is contravariant in coefficients, so the finite-free arithmetic coefficient W enters through its dual (§R18.4.12). None of these is redefined here. The module `TauCeti.RingTheory.DedekindDomain.Different.DualFamily` also supplies `TauCeti.exists_trace_mul_algebraMap_eq` and `TauCeti.exists_sum_trace_mul_smul_eq` for finite projective integral closures. H0 keeps only the alternating two-summand polarization lattice and its ideal-dependent stabilizer. `TauCeti.NumberTheory.HeckeRing.GL2.Degree` supplies `HeckeRing.GL2.degree_diagCoset_prime_pow` and `HeckeRing.GL2.deg_heckeT` for the rational integral `GL₂` Hecke ring; the targets here concern its local quaternionic and totally real coefficient actions, not that generic degree theory.

### From Tau Ceti roadmaps

The general objects of the table under Scope and ownership are imported with the following contracts:

- **AdelicAlgebraicGroups.** Compactness modulo the centre and finiteness of definite class sets, with rational and adelic central quotients kept apart (§3, `§3.4`, `§3.4`). Neat levels and their torsion-freeness (`§4.3`, `§4.3`). Strong approximation for quaternion norm-one groups with a noncompact split finite factor, and level-map degrees and effective stabilisers (`§4.2`, `§4.2`). Strong approximation is never used for a torus. The definite example over `ℚ` (§5) is a check, not the general input.
- **ReductiveGroupsPartII.** Restriction of scalars, central quotients and fibre products of quaternionic groups, including `Res B×`, its norm-one derived group and the quotient `(B×E×)/{(a⁻¹,a)}` with its norm and conjugation maps (RG2.0a). Real and local points with their topology (RG2.0). The lattice and norm-class realization of the Bruhat–Tits tree of `GL₂`, with adjacency, valence q+1 and the `PGL₂` action (RG2.2). Integral quaternion-order levels `(1+NÔ_B)×` and their nesting (RG2.3).
- **SmoothRepresentationsOfLocalGroups.** Smooth and admissible representations and smooth characters (SR.0); normalized parabolic induction and Iwahori invariants (SR.2); Steinberg and square-integrable representations (SR.3). The additional local constructions in §§R18.3.19 and R18.4.22 are: character distributions with elliptic orthogonality for the degree-two quaternionic correspondence; an E-model for the order-l principal series of `GL₂(k_q)` with its Schur-index descent and the two residual factors 1 and St when `q≡1 mod l`; and the stable lattice with trivial socle of EGS Lemma 4.1.1 together with the local type computations of MS Proposition 3.10.
- **IntegralHeckeAndGaloisDeterminants.** Reconstruction of a representation from an algebraically closed or continuous determinant (Layer 1), the GLₙ Hecke polynomial `X²−T_vX+q_vS_v` with the arithmetic-to-geometric Frobenius conversion (§3a.1), and compact determinant gluing (Layer 4).
- **QuadraticFormInvariants** (Layer 2): quaternion algebras, conjugation, reduced norm and trace, real matrix splitting and CM scalar extension.
- **StableReduction** (Layers 0, 1, 4, 5, 6). Relative curves and DVR extensions, distinguishing ramified from unramified base change. Nodes, normalization and dual multigraphs with thickness, branches, loops and repeated edges. Codimension-two extension and Cartier divisors on regular surfaces. Regular proper models and the uniqueness of the minimal regular model in positive genus. Numerical types. Finite group quotients of models are not part of Layer 5 and are constructed here.
- **AlgebraicVectorBundles** (L0), **JacobianChallenge** (Layer A), **ModularCurves**, **ClassFieldTheory** (Layer 12), **Chebotarev** (Layer 10) and **AlgebraicTopology** (Stage 6), as in the table. The Artin map of ClassFieldTheory is arithmetic and is inverted wherever a geometric normalization is declared.

### From neighbouring roadmap layers

The contracts below distinguish general supplied theory from the specializations and additional constructions owned here.

**[AdicSpacesPartIII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdicSpacesPartIII/README.md).** Admissible formal schemes, admissible blow-ups, the generic-fibre functor and its inversion of admissible blow-ups, Hasse and section domains and their formal models (R2), and Grothendieck algebraization for a line bundle with ample reduction (F0). Sections R18.5.7 and R18.5.11 construct the separated quotient of the locally finite-type semistable formal Drinfeld curve by a discrete cocompact effective arithmetic group. This construction includes the gluing of the standard charts under the very free condition, the quotient by a finite group of a Schottky quotient, and a line bundle with ample reduction on it. Layers used: `F0.8`, `R2`, `R2.5`, `R2.2`, `R2.3`, `R2.10`.

**[AlgebraicModuliForArithmeticGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md).** Relative Grassmannians with closed invariant-subbundle conditions (§1.3). Proper polarized descent and coherent/line-bundle descent (§3.5). Effective finite étale descent for the open quasi-projective torsion twists is constructed here in `finiteEtaleAmpleDescent` (§H2.2a), including noncommutative finite groups and an explicit ample-line cocycle. Finite effective quotients in algebraic spaces, free finite actions as finite étale torsors, and their base change (§§5.1–5.4). Layers used: `§1.3`, `§3.5`, `§§5.1–5.4`.

**[AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md).** Relative abelian schemes with real multiplication, base change and rigidity (A1). Duals with biduality, symmetric O-linear homomorphisms, positive polarizations and the Rosati involution (A2). Cartier-dual finite-flat torsion with its perfect Weil pairing, and quotients by finite locally free O-stable subgroups with polarization descent (A3). The Hodge sequence with O-action and its Lie characteristic polynomial, the polarized O-linear Grothendieck–Messing comparison with the local model, and Serre–Tate deformations (A4). Algebraization of polarized complex tori with the period lattice (A5). Weil restriction along finite separable extensions for quasi-projective schemes and abelian schemes (A6). Layers used: `A1`, `A2`, `A3.9`, `A3`, `A4`, `A5`, `A6.32`, `A6.30`, `A6.31`.

**[ArithmeticGaloisRepresentations](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md).** Continuous representations and their stable lattices, lattice independence by determinants, reduction and scalar extension (§§1.1–1.12); Frobenius semisimplification and the unnormalised special objects with arithmetic degree convention (§2.4). Layers used: `§1.6`, `§1.9`, `§1.2`, `§2.4`.

**[ArithmeticGaloisDuality](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticGaloisDuality/README.md).** Local duality with coefficient fields (D7) and global finiteness (R02.4). Layers used: `D7.4`, `R02.4.4`.

**[NeronModelsAndSemistableAbelianVarieties](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md).** The polarized rigid uniformization of a semistable abelian variety, with its lattice and valuation pairing (§3.14, §3.14); §H6.5 uses it with Rapoport's Tate HBAV, whose real multiplication and polarization module are computed there. The character lattice of a semistable Jacobian with its graph-homology description, the thickness-weighted monodromy pairing and the component group (Layer 4). The shared [weighted graph](../NeronModelsAndSemistableAbelianVarieties/README.md#weighted-graph) and [Hecke family](../NeronModelsAndSemistableAbelianVarieties/README.md#hecke-family) interfaces (§4.2) own the geometry-free weighted bipartite graph, its Gram map and component cokernel, and `HeckeFamily` with incidence and adjoint compatibility. The [torsion interface](../NeronModelsAndSemistableAbelianVarieties/README.md#semistable-torsion-datum) (§4.14) owns `SemistableTorsionDatum` over a commutative Hecke ring with distinguished bad-place operators. The latter separates the torsion, Galois, toric and specialization data from their exactness, Frobenius and Hecke laws; its `TwoPlaceSemistableTorsionDatum` uses one torsion module with both local structures. Sections R18.5.17a–R18.5.18 supply the quaternionic realizations on these interfaces. Section R18.5.14 constructs resolution of thickness for the nonregular `xy=π^m` charts of arithmetic quotients, so that weighted pairings can be compared (§R18.5.14). Layers used: `§3.14`, `Layer 4`, `§4.2`, `§§4.3–4.4`.

**[SelmerIwasawaCohomology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SelmerIwasawaCohomology/README.md).** Selmer structures and adjoint dual Selmer groups (§§2A.1–2A.5). The MS Lemma 4.10 detecting-element, prime-selection and dimension calculations over arbitrary totally real F are targets of §R18.4.20 here, with no unramifiedness assumption on l in F. Layers used: `§§2A.1–2A.5`.

**AbelianSchemesAndArithmeticModuli §A4.CR.7.2 and CrystallineCohomology §CR.7.3.** The former supplies the crystalline Dieudonné crystal of a Barsotti–Tate group, local freeness, Hodge filtration, variance/Tate-twist comparison and Grothendieck–Messing deformation theory on the stated PD-nilpotent thickenings, at every prime. The latter supplies relative crystalline direct images and the Gauss–Manin connection. No strict `O_v`-relative filtration is imported. At a ramified v the strict `O_v`-relative filtration is built here from the absolute crystal as the saturated quotient (§R18.2.14), because the raw τ-quotient is not exact. Sections used: A4.CR.7.2 and CR.7.3.

**[EtaleCohomologyFoundations, §§F.0–F.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EtaleCohomologyFoundations/README.md); [ClassicalAdicEtaleCohomology, §§1.1–1.5, 9.2–9.7, 11.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md); [ComplexComparisonPartII, §§C6.3–C6.6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md).** Use scheme finite and derived integral étale coefficients, finite-cover descent, trace and Poincaré duality; algebraic-to-adic comparison and integral proper pairings on curves; and the finite constructible, supported and integral étale/Betti comparisons. Each trace keeps its degree and orientation, and each inverse system keeps its derived-limit hypotheses.

**[LocalGaloisDeformationRings, §§1.1, 1.15–1.16, 3.1–3.9](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalGaloisDeformationRings/README.md); [GlobalGaloisDeformations, §§3.3–3.7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalGaloisDeformations/README.md).** Use continuous framed representability and minimal local/global presentations, the Hodge-type quotients with their point criterion and dimensions, and generic global presentations. The MS Taylor–Wiles selection in §R18.4.20 is constructed here under its own image hypotheses; the unramified-field selection of GlobalGaloisDeformations §§5.7–5.8 is not used. Weak patching over noetherian coefficient rings without a domain assumption is constructed in §R18.4.29, with MS Definition 4.1 and Propositions 4.2–4.6. DeformationAndDerivedPatchingAlgebra §3.3 supplies generic module miracle flatness. Section R18.4.30 specializes it by proving the support-dimension equality for MCM patched modules and owns the two nodal transfer lemmas of MS Lemmas 5.2–5.3.

**[FiniteFlatGroupsAndIntegralPadicHodgeTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md).** Finite locally free subgroup schemes with Cartier duality, rank and O-action, finite torsion levels, Tate modules, Cartier duals, formal Lie groups and height (R07.1). The strict `O_K`-action, special `O_D`-action, relative heights and framed quasi-isogeny moduli are constructed in §§R18.5.4–R18.5.5. The integral Dieudonné and Cartier theory on nilpotent bases, the Hasse invariant `Ha=det(V*)` in `(det ω)^{p−1}` with its ordinary criterion at every p including 2 (R07.2.21), and Serre–Tate compatibility for the paired polarized auxiliary factor (R07.2). The crystalline Barsotti–Tate classification over `O_L` for finite `L/ℚ_p` at every prime including 2 (R07.4). Pointwise use over finite extensions of the completed maximal unramified field requires the verified finite-local descent hypothesis of §R18.2.16. Grothendieck–Messing with endomorphism and polarization structure is supplied by AbelianSchemesAndArithmeticModuli §§A4.7, A4.CR.7.2; finite-flat base change and twisting use R07.6.8. The residual local realization in Allen Lemma 7.1.8 is constructed in §H6.8, with its stated finite-extension hypotheses. Absolute p-height is the relative height times `[K:ℚ_p]`. Layers used: `R07.1`, `R07.2`, `R07.4`, `R07.4.20–R07.4.24`, `R07.6.8`.

**[LefschetzPencilsAndVanishingCycles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md).** The specialization sequence, the normalization cohomology and the étale resolution of normalizations for semistable curves (LPV.7a). Layers used: `§7a.1`, `§7a.2`, `§7a.1`.

**[ArithmeticLocallySymmetricSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md).** Arithmetic local systems and their Betti and sheaf realizations (ALS.1); Hecke correspondences on complexes with their composition and operator formula (ALS.3); Eisenstein maximal ideals (ALS.4); the de Rham comparison, the characteristic-zero cohomological decomposition and finite-level derived duality with Hecke adjoints and Verdier–Poincaré duality (ALS.5a–ALS.5b); Hochschild–Serre for finite covers (ALS.6). For every non-finite coefficient use of ALS, assume its `TopologicalCoefficientInput(R)` (ALS.F.3), including ordinary and supported sheaf/singular comparison on the actual arithmetic spaces and maps. The supplier's finite-ring theorem does not discharge this hypothesis for `R=O`, its fraction field or `ℂ`. The adapter and all consumers retain it as specified in §R18.4.12. The automorphic comparison ALS.5b.4 also assumes `LocallySymmetric.FrankeInput`. Its compact quaternionic instance is supplied by AutomorphicSpectralTheory §5.14 (`franke_input`) and specialized here as `quaternionicCompactFrankeInput` (§R18.4.25a). The connected-compact cover and remaining positive real centre are handled by `quaternionicCentralTorusComparison` (§R18.4.24b), with Hecke, level and component compatibility, before identifying curve cohomology. Layers used: `ALS.1`, `ALS.1.1`, `ALS.1.2`, `ALS.1.4`, `ALS.3`, `ALS.3.8`, `ALS.3.5–ALS.3.7`, `ALS.4.10`, `ALS.5a–ALS.5b`, `ALS.5b.1`, `ALS.5a`, `ALS.5a.3`, `ALS.5a.4`, `ALS.5a.2`, `ALS.6.2`.

**[GL2AutomorphicRepresentationsAndTransfer, §§R16.2.13, R16.4.5, R16.6.3, R17.1.1–R17.1.4, R17.3.1–R17.3.9](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md).** Use the real `GL₂` discrete series, cohomological weight convention, finite coefficient-field models, local quaternionic transfer, global multiplicity-one transfer and its definite finite-level realization. The coefficient lattice of §R18.3.2 specializes Mathlib symmetric powers and Tau Ceti `TauCeti.symPowerRep`; §§R18.3.1–R18.3.3 adapt QuaternionicModularForms to the adelic central quotient and fixed central character, retaining its common form carrier and evaluation equivalence. [ArithmeticLocallySymmetricSpaces, ALS.F.6–ALS.F.7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md) supplies automorphic function spaces and relative Lie cohomology; [AutomorphicSpectralTheory, §§4.5–4.7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AutomorphicSpectralTheory/README.md) supplies the discrete spectrum and finite multiplicity. The transfer applications retain the coefficient dual, norm twist and actual common coefficient realizations.


**[QuaternionicModularForms, §§0.3, 1.3, 2.1–2.2, 3.1](https://github.com/WilliamCoram/TauCetiRoadmap/blob/fe4c14dbe4381c62726cce20430bb84799a5a2e0/TauCetiRoadmap/QuaternionicModularForms/README.md).** Consume the finite class set `D×\\D_f×/U`, compact stabilizers modulo their rational central subgroup, the right algebraic coefficient convention, abstract equivariant functions, evaluation/reconstruction and the opposite Hecke action. Sections R18.3.1–R18.3.3 construct the central quotient and ψ-specialization on those carriers. The abstract evaluation theorem has no compactness hypothesis; full dyadic division factors use the same carrier with their specified extended action, and finiteness is proved using a compact level of finite index modulo the centre. General evaluation and Hecke theory remain with this supplier.

The order interface required from QuaternionicModularForms §§0.1–0.3 consists of maximal and Eichler orders, completed order lattices with unit level `R̂×`, locally principal right ideal classes and their adelic double-coset comparison, right orders, local lattice indices and the Brandt-entry lattice count. Section R18.5.17a uses the intersection of adjacent maximal orders at a split prime, with the other local orders fixed. The `RamifiedExactlyAt` predicate, its rational definite/indefinite specializations, realization and uniqueness belong to [GL2AutomorphicRepresentationsAndTransfer §R17.1.5](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-1-swapped-quaternion-invariants); the order interface does not duplicate them.

**[AutomorphicFormsOnReductiveGroups, §§0.5, 5.8, 7.3](../AutomorphicFormsOnReductiveGroups/README.md#anemic-eigensystems).** The shared Hecke contract supplies operators on invariants from Mathlib's `HeckeCoset` and `IsHeckeTriple`, including representative independence, multiplication and coefficient/level maps. Its GL₂ presentation is the universal anemic algebra `𝕋^S = MvPolynomial ({v ∉ S} × Fin 2) O`; an eigensystem in an O-algebra A is an O-algebra map `𝕋^S → A`, with eigen-ideal its kernel. The faithful image in a given endomorphism ring is that realization's Hecke algebra. Section R18.3.6 transports the quaternionic inverse/opposite convention to these operators, and §R18.3.15 supplies the residual Galois evaluation and its conditional descent to the faithful image. This use of operators on invariants follows the interface of the Imperial College London FLT project.

**Quaternionic transfer contract (GL2AutomorphicRepresentationsAndTransfer §§R17.1.1–R17.3.9).** Over a nonarchimedean local field `L`, irreducible admissible representations of its quaternion division algebra correspond to the essentially square-integrable representations of `GL₂(L)`. Central characters and twists agree, matching elliptic characters have opposite signs, and `κ ∘ Nrd` corresponds to `St ⊗ (κ ∘ det)`. At real ramified places the `SU(2)` type `Sym^(k−2)` corresponds to discrete-series weight `k`, with the norm twist that matches central characters. Globally, for a quaternion division algebra, the non-norm discrete spectrum corresponds with multiplicity one to cuspidal `GL₂` representations square-integrable at every ramified place; transfer is identity at split places. It gives inverse transfer, twists, split `T_v` and `S_v` compatibility, strong multiplicity one and actual compatible models after a finite coefficient-field enlargement when Schur descent requires it. These are supplied theorems, rather than additional targets here. For a globally split algebra use the identity on the cuspidal spectrum; being infinite-dimensional alone does not exclude Eisenstein classes. The applications in §§R18.3.19–R18.3.22 fix the coefficient dual, finite-level realization, arithmetic Hecke normalization and integral-pairing comparison; no integral direct-sum or equality of lattices follows from this characteristic-zero contract.

**[DeligneWeightsAndPurity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DeligneWeightsAndPurity/README.md).** The Weil estimate for abelian varieties (DWP.1), purity for smooth projective varieties (DWP.4) and the cohomological bounds of Weil II 3.3.2–3.3.6 (DWP.7). Layers used: `§1.4`, `§4.3`, `§7.12`.

**[ModularCurvesPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md).** The canonical rational modular curves with tame `μ_N` and point-level comparisons, finite-flat `Γ₀` levels and the split quaternionic identification (§§3.1, 3.14, 8.1). Layers used: `§§3.1, 3.14, 8.1`.

**[ComplexComparisonPartII, §§C6.3–C6.6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md).** Use finite constructible étale/Betti comparison, its compact-support and lower-shriek functoriality, and its derived integral realization. Trace orientation for the arithmetic coefficient adapter is fixed in §R18.4.13 by the complex orientation and finite-cover degree; the comparison preserves the actual map from compactly supported to ordinary cohomology.

**[ShimuraVarieties, §§P.1–P.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md).** Pure datum axioms, datum maps, products, Hodge- and abelian-type conditions, the Cartan adjoint criterion, cocharacter classes and reflex fields are supplied there. The rational Hilbert specializations are supplied by PELModuli M5.4 and ShimuraData §§5.3–5.4; §H0.0 supplies their convention adapters.

**[ShimuraData, §§5.3–5.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraData/README.md).** The full restriction-of-scalars Hilbert datum, independent-sign domain, reflex field and common-sign star inclusion are supplied there. The star datum and rational trace embedding come from PELModuli M5.4. These suppliers precede H0; §H0.0 transports h, the trace sign and row/column conventions, and §H0.2 transports their domain comparison.

**[WeightsInEtaleCohomology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/WeightsInEtaleCohomology/README.md).** Purity under linear-algebra operations (R34.1), purity of Tate modules with good reduction (R34.2) and proper specialization over a trait (R34.3). R34.3 also constructs the Hilbert–Shimura Saito model/projector and the geometric semistable-period comparison. Sections R18.4.24a and R18.4.34 specialize these inputs to the quaternionic finite levels here, retaining coefficient embeddings, descent and `N_p=N_HK/e_L`. R34.6 owns the common Carayol/Saito cohomological decomposition, rank-two Galois multiplicity with actual coefficient-model descent and source-qualified p-adic compatibility for degree greater than one under (C), including the source's auxiliary-place/base-change reduction. Section R18.3.29 consumes that core through its arithmetic contragredient adapter; the Taylor/Kisin branch outside (C), degree-one routes and stable-lattice extensions belong here. The weight arithmetic is computed in §§R18.4.35–R18.4.36. Layers used: `R34.1, Linear algebra operations and rational integrality`, `R34.2, Purity and integral polynomials at good reduction`, `R34.3, Proper specialization over an arithmetic trait`, `R34.6, Hilbert eigensummands and local monodromy weights`.

**[AutomorphicSpectralTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AutomorphicSpectralTheory/README.md).** The discrete spectrum with multiplicity spaces, separated from its residual and cuspidal parts, and the spectrum of a compact quotient (Layer 4). The Franke comparison and cuspidal-support theorem, yielding `franke_input` (§§5.10, 5.12, 5.14), are specialized in §R18.4.25a with the supplier’s rational split-centre, balanced-character and full K∞ conventions. The trace formula (Layer 6). GL2AutomorphicRepresentationsAndTransfer §§R17.1.1–R17.3.9 supplies the quaternionic matching and transfer; its degree-two specialization in §§R18.3.19–R18.3.22 retains ramified discrete-series matching and excludes norm-character transfers. Layers used: `§4.7`, `§4.5`, `§§5.10, 5.12, 5.14`, `Layer 6`.

**[PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md).** Integral PEL data with involution, trace-dual lattice, signature and determinant condition (M0). Moduli functors, PEL abelian schemes, `O_B`-actions, p-divisible torsion and level descent, change of lattice and prime, and the characteristic-zero adelic moduli space (M1). Good-prime representability with its universal family (M2). Complex points and algebraization of components (M3). Canonical-model comparison, finite normal level changes and finite effective coarse quotients, with no universal family on an arbitrary normalization (M4). M5.4 supplies the principal Hilbert datum, its rationalization, positive trace form and closed trace embedding with multiplier and h-compatibility; H0 transports these rational objects and constructs the c-dependent integral lattices. Section R18.5.13 constructs basic Rapoport–Zink uniformisation for the auxiliary quaternionic datum (Boutot–Zink Proposition 6.2): the framed polarized quasi-isogeny quotient, Serre–Tate local étaleness, the Hasse-principle surjectivity onto special-fibre points and Weil equivariance, with the p-adic local levels retained. The same target constructs the selected open-and-closed canonical-model embedding with its closure (Boutot–Zink Definition 6.5, Proposition 6.6), with the inverse-diagonal central quotient and cofinal auxiliary levels. Layers used: `M0`, `M0.18`, `M0.5`, `M1`, `M1.11`, `M1.9`, `M1.7`, `M1.2`, `M2`, `M2.8`, `M2.9`, `M3`, `M3.6`, `M3.4`, `M4`, `M5.4`.

**[FiniteFlatGroupsAndIntegralPadicHodgeTheory, §§R07.3.0–R07.3.3, R07.4.13, R07.4.27–R07.4.28](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md).** Use period functors, weak admissibility and admissibility, and filtered (φ,N)-modules with descent and their Weil–Deligne normalization for potentially semistable representations. Section R18.4.24a specializes the geometric proper semistable comparison supplied by WeightsInEtaleCohomology R34.3, retaining descent, coefficient embeddings, normalized monodromy and the dual/twist convention. [LocalGaloisDeformationRings, §0.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalGaloisDeformationRings/README.md) supplies its finite-coefficient and every-prime descent extension.

**[ShimuraVarieties](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md).** Canonical finite-level models over the reflex field with complex uniformization, finite level maps, datum functoriality and the `GL₂` comparisons at full, `Γ₁` and `Γ₀` level (§§8.1–8.5, 8.22). The canonical models of the one-real-split quaternionic datum are used even though its central weight need not be ℚ-rational. This includes small-level effective quotients, properness and descent along datum maps. Layers used: `§§8.1–8.5, 8.22`, `§8.5`, `§8.3`, `§§8.9–8.13`, `§8.15`, `§8.14`, `§8.21`.

## How to read the build

The layers carry the identifiers by which other roadmaps cite them. The numbered layers interleave according to the prerequisites below; their subsection identifiers remain the citation keys. Local Drinfeld geometry (R18.5, part 1) precedes the quaternionic PEL comparison (R18.2, part 1). Arithmetic uniformisation (R18.5, part 2) then supplies the division-prime input to the integral models (R18.2, part 2). After R18.4.24a, the central-torus comparison R18.4.24b and the supplier specialization R18.4.25a, build CohomologicalEigenspaces, then the R34.6 adapter and extensions quaternionEigenformGaloisCompatibility (§R18.3.29), then earlyQuaternionicGaloisHeckeSupport (§R18.4.27), before the local-type and patching consumers. The remaining localized-control targets of R18.3, part 2 follow these early targets. Subsection identifiers are the citation keys; the table gives their build order across the interleaving. Section R18.5.15 opens the arithmetic uniformisation part.

| Layer | Delivers |
| --- | --- |
| H0 | Integral trace lattices, their duals and stabilizers, and the derived and central comparisons of the Hilbert data. |
| H1 | Ordered polarizations, the Hilbert PEL instance, the determinant condition, tame levels, good-prime representability, Weil pairings and the complex comparison. |
| H2 | Deligne–Pappas local and integral models at every prime, the Rapoport and ordinary loci, the Hasse ideal and formal Hasse neighbourhoods. |
| H3 | Unit-square kernels, the finite tame polarization group, the arithmetic polarization quotient and Hecke isogenies. |
| H4 | Hybrid, scalar-multiplier and arithmetic full levels, integral `Γ₀` levels, effective level groups and the connected unit limit. |
| H5 | The rational modular comparison, real-quadratic cusps, Hodge splitting, algebraic weights and a nonprincipal ramified example. |
| H6 | Paired torsion Isom torsors, twisted moduli and their component descent, real and finite local points, and the Allen restriction variant. |
| R18.1 | The one-real-split quaternionic datum, its canonical curve, effective stabilizers and the Yuan–Zhang PEL bridge. |
| R18.5, part 1 | Local geometry §§1–6; arithmetic stabilizers §7a; height labels and very free actions §§8–10; separated chart quotient §11; arithmetic quotient §7; auxiliary PEL factors and transfer §§12–14. |
| R18.2, part 1 | §§1–3: PEL instance, small levels and QuaternionPDiv; then SplitPlaceDescentBoundary (§R18.5.19); then §§4–7: connected/finite PEL comparisons, split integral model and torus bridge. |
| R18.5, part 2 | Čerednik–Drinfeld uniformisation, the rational case, dual graphs and monodromy and the all-level tower. |
| R18.2, part 2 | Integral model towers, coarse and ℚ-factorial models, Hecke extensions, the arithmetic Hodge line, integral p-divisible groups, Kodaira–Spencer and the CM-bridge comparisons. |
| R18.3, part 1 | Definite class sets, integral weights and forms, pairings, Hecke normalization, the definite Ihara lemma, Taylor–Wiles levels, quaternionic transfer and dyadic twists. |
| R18.4, early geometry | §§R18.4.1–R18.4.25, including the supplied geometric comparison (§R18.4.24a), central-torus comparison (§R18.4.24b) and specialized FrankeInput (§R18.4.25a), ending with CohomologicalEigenspaces. |
| R18.3.29 | quaternionEigenformGaloisCompatibility: R34.6 realization/compatibility adapter and the Taylor/Kisin, degree-one and stable-lattice extensions. |
| R18.4.27 | Hecke-valued earlyQuaternionicGaloisHeckeSupport from those individual representations. |
| R18.4, remaining targets | §R18.4.26 and §§R18.4.28–R18.4.36: local types, patching, Ihara, saturation and the supplied Saito projector specialization and purity. |
| R18.3, part 2, §§30–32 | The Steinberg obstruction, localized control and ramified signs, using the preceding individual and Hecke-valued realizations. |
| R18.6 | The interfaces consumed by arithmetic applications; it has no targets of its own. |

Suggested.lean records the real-bodied definitions available over native carriers: the trace lattice and trace forms, congruence and unit-square groups with the tame polarization quotient, the adjugate level action, the paired height lattice, the chart-separation predicate, the division character value, the Taylor–Wiles torsion kernel, liftable residue images, norm twists, component Hecke operators and the degeneracy Gram operator. It also records the algebraic milestones statable over these definitions.

## Layer H0: Integral Hilbert data and trace lattices

Transport the rational Hilbert data of PELModuli M5.4 and ShimuraData §§5.3–5.4, then construct the c-dependent integral lattice, different and polarization family.

### H0.0 Rational Hilbert data and trace embedding

Use `HilbertDatum` and `HilbertStarDatum` as convention adapters to ShimuraData §§5.3–5.4 and PELModuli M5.4, respectively, for a totally real number field F of degree g. Their rational groups are `G = Res_{F/ℚ} GL₂` and `G* = G ×_{Res_{F/ℚ} G_m} G_m`. The rational star datum and trace embedding are owned by PELModuli, and the full datum and star inclusion by ShimuraData. Their domains have respectively independent and common signs.

Put `C=diag(1,−1)` on column vectors in every real factor. Transport the supplied h by `h=C h_PEL C⁻¹`: its τ-component sends `a+bi` to `[[a,b],[−b,a]]`. Transport the supplied positive trace form by the same C. With `hilbertRationalTraceForm` denoting the supplied form `ψ₀(x,y)=Tr_{F/ℚ}(x₁y₂−x₂y₁)`, the transported positive Riemann form is `ψ₀(C⁻¹x,C⁻¹y)=−ψ₀(x,y)`. Thus `hilbertTraceEmbedding` here denotes the supplied closed embedding transported to `GSp(V,−ψ₀)`, with group map `j_new(g)=C j_PEL(C⁻¹gC)C⁻¹`, which is again the standard action on the transported coordinates. This keeps `ψ(x,h(i)x)>0`. The integral family of §H0.4 retains `ψ₀`, recording this sign at the Siegel comparison. For row vectors, `(xg)ᵀ=gᵀxᵀ`; transpose reverses composition, so the right row action and left column action are compared with that reversal.

Transport the supplier's splitting-field group identifications, field/base-change compatibilities, scalar determinant multiplier, alternating nondegenerate trace form, faithful closed immersion and h-compatibility. The reflex fields remain `ℚ`, and C identifies the chosen positive domains after the corresponding relabelling of half-planes. Sections H0.1 and H0.3–H0.5 construct the centre specialization and c-dependent integral refinements; they do not reconstruct the rational datum.

**Checks.**

- For `F = ℚ`, the two fibre-product groups identify with `GL₂`, the reflex field is `ℚ` and the full domain has two components.
- For a real quadratic field the independent-sign domain has four components, while the common-sign domain has two; the selected upper-half-plane product is the same.
- For `F=ℚ`, on the standard rational basis, `ψ₀(e₁,e₂) = 1`, `h(i)e₁ = −e₂` and `−ψ₀(e₁,h(i)e₁) = 1`; reversing the trace-form sign changes this last value.
- A scalar `t` in every factor has multiplier `t²`; independent determinants in the factors do not define a scalar multiplier when they differ.
- A nonzero vector is detected by the trace pairing after extending scalars; the zero form fails nondegeneracy even though it is alternating.

(Source: [BHW23](#references), Notation 5.1 and §5.1, pp.1740–1743, and §8.1, p.1766; [Rap78](#references), §1, pp.257–264. The trace and component formulas are the indicated restrictions of scalars.)

*Needs:* PELModuli M5.4 and M0.12; ShimuraData §§5.3–5.4; Mathlib `Algebra.trace` and its nondegeneracy for finite separable field extensions.

### H0.1 Derived groups and algebraic centres

**Theorem** (`derivedCentres`). On §H0.0’s groups G and G*, both derived groups are `Res_{F/ℚ}SL₂` and their inclusion is the identity there. `Z(G)=Res_{F/ℚ}G_m`. Z(G*) is the subgroup of scalar matrices `t I₂` with t² in the diagonal `G_m`, including its finite geometric components; its identity component is diagonal `G_m`. Dimensions are 4g and 3g+1. No connectedness of the full centre of G* is assumed.

*Proof route.* Base change the imported groups to a splitting field: G becomes `∏GL₂` and G* the common-determinant subgroup. Compute commutators and centralizers factor by factor; preserve the equations `t_τ²=t_σ²` as scheme equations, not merely real points. Descend the comparisons along the imported restriction-of-scalars and fibre-product maps.

(Source: [BHW23](#references) Notation 5.1, pp.1740–1741; the centre and dimension formulas follow by computing the scalar-determinant fibre product.)

*Needs:* [§H0.0 Rational Hilbert data and trace embedding](#h00-rational-hilbert-data-and-trace-embedding); [ShimuraVarieties, §§P.1–P.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#p1-pure-data-and-special-pairs).

### H0.2 Independent signs and common signs

**Comparison** (`domainComparison`). Transport ShimuraData §5.4's star inclusion through the C and row/column adapters of §H0.0. The resulting map identifies the common-sign G* domain `H^Σ` ⊔ `(H⁻)^Σ` with the corresponding two components of the G domain `(H^±)^Σ`. The latter has `2^g` components; both have complex dimension g and reflex field `ℚ`. The connected positive domains are equal, but the full conjugacy classes differ for g>1.

*Proof route.* Apply ShimuraData §§5.3–5.4 to its supplied data and conjugate both sides by C. Its component count, dimension, connected adjoint comparison and reflex field are preserved by this datum isomorphism. Record the relabelling of upper and lower half-planes on both sides.

**Checks.**

- For `F=ℚ` the transported inclusion is the identity on the full two-component datum.
- For real quadratic F, C exchanges the two common-sign components while the full domain still has four components.
- A tuple with opposite determinant signs stays outside G* after conjugation by C.

(Source: [BHW23](#references) Notation 5.1, pp.1740–1741; compute the real conjugacy classes using the determinant sign at each embedding.)

*Needs:* ShimuraData §§5.3–5.4; [H0.1 Derived groups and algebraic centres](#h01-derived-groups-and-algebraic-centres); [§H0.0 Rational Hilbert data and trace embedding](#h00-rational-hilbert-data-and-trace-embedding); [ShimuraVarieties, §§P.1–P.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#p1-pure-data-and-special-pairs).

### H0.3 Polarization lattice

**Definition** (`polarizationLattice`). For a nonzero invertible fractional ideal c of O, let `D=FractionalIdeal.dual ℤ ℚ O=d⁻¹` and `L_c=O⊕c⁻¹D⊂F²`, with row-vector convention. This is the integral lattice refining §H0.0’s rational representation. For an integral ideal c, `K_c` is its finite adelic stabilizer; a column convention uses the transpose-conjugate lattice.

*Construction.* Reuse the pinned fractional ideal and trace-dual carriers; define only this Hilbert lattice. Use invertibility of c and the trace-dual formula to identify the second summand. Fix the row convention before calculating stabilizers.

Its API:

- `polarizationLattice`: Construct `L_c` as the O-submodule `O×c⁻¹d⁻¹` of `F×F`.
- `mem_polarizationLattice`: `(x, y)∈L_c` iff `x∈O` and `y∈c⁻¹d⁻¹`.
- `polarizationLattice_rank`: `L_c` is projective of rank 2 over O and free of rank 2g over `ℤ`.
- `polarizationLattice_rescale`: For `a∈F×`, `diag(1, a⁻¹)` carries `L_c` to `L_{ac}` in the row convention.

**Checks.**

- `lattice_Q`: For `F=ℚ, c=ℤ, L_c=ℤ²`.
- `lattice_nonprincipal`: `L_c` is defined for a nonprincipal c without choosing a generator.
- `lattice_different`: For `c=O` the second summand is the pinned trace dual of O, not O unless d is trivial.

In [Suggested.lean](Suggested.lean): `HilbertFractionalIdeal`, `inverseDifferent`, `polarizationLattice`, `polarizationLattice_rank`.

(Source: [BHW23](#references) Notation 5.1(3) and Definition 5.2(1), pp.1740–1741.)

*Needs:* [§H0.0 Rational Hilbert data and trace embedding](#h00-rational-hilbert-data-and-trace-embedding); [ShimuraVarieties, §§P.1–P.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#p1-pure-data-and-special-pairs); Mathlib `FractionalIdeal.dual`, `FractionalIdeal.dual_eq_mul_inv`.

### H0.4 Integral trace polarization family

**Definition** (`integralTraceFamily`). For `a∈c` and `x, y∈L_c` set `ψ_{c, a}(x, y)=Tr_{F/ℚ}(a(x₁y₂−x₂y₁))∈ℤ`. This is a family parametrized O-linearly by c, rather than a canonical principal symplectic form. Nonzero a gives a nondegenerate rational alternating form; totally positive a has the polarization sign prescribed in §H0.0 (negate the form if the positive h(i) convention is used).

*Construction.* Multiply the wedge in `c⁻¹d⁻¹` by `a∈c`, obtaining `d⁻¹`. Apply the pinned trace-dual membership criterion to obtain an integer. Restrict the imported rational trace form, recording its sign and parameter. For `b∈O` move b between the parameter and either lattice argument inside the commutative trace expression. This gives the balancing law and the precise O-module action on the form family.

Its API:

- `integralTraceFamily`: Map c to the alternating ℤ-bilinear forms on `L_c` by `a↦ψ_{c, a}`.
- `integralTraceFamily_apply`: Evaluation is `Tr(a(x₁y₂−x₂y₁))`.
- `integralTraceFamily_parameter_add`: `ψ_{a+b}=ψ_a+ψ_b` and `ψ_0=0`.
- `integralTraceFamily_alternating`: For every number field F, parameter a and vector x in F², `integralTraceFamily F a x x = 0`.
- `integralTraceFamily_integral`: For nonzero c, `a∈c` and `x,y∈L_c`, the value `ψ_{c,a}(x,y)` is an integer: `∃ n : ℤ, integralTraceFamily F a x y = n`.
- `integralTraceFamily_nondegenerate`: For every number field F, the rational form on F² has zero radical exactly when its parameter a is nonzero.
- `integralTraceFamily_balance`: For `b∈O`, `ψ_{ba}(x, y)=ψ_a(bx, y)=ψ_a(x, by)`. This specifies the O-action on the family of ℤ-bilinear forms; it is not scalar multiplication of their `ℤ`-valued outputs.

**Checks.**

- `traceFamily_Q`: Over `ℚ, c=ℤ, a=1` its value on the two standard basis vectors is 1.
- `traceFamily_zero`: The `a=0` form is zero, hence is not declared nondegenerate.
- `traceFamily_ramified`: For `F=ℚ(√2)`, the second summand uses `d⁻¹=(2√2)⁻¹O`, preventing a false O² self-duality assertion.

In [Suggested.lean](Suggested.lean): `integralTraceFamily`, `integralTraceFamily_alternating`, `integralTraceFamily_integral`, `integralTraceFamily_nondegenerate`.

(Source: [BHW23](#references) Notation 5.1(3), p.1740; compare DP §2.12.)

*Needs:* [H0.3 Polarization lattice](#h03-polarization-lattice); [§H0.0 Rational Hilbert data and trace embedding](#h00-rational-hilbert-data-and-trace-embedding); [ShimuraVarieties, §§P.1–P.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#p1-pure-data-and-special-pairs); Mathlib `Submodule.mem_traceDual`, `Algebra.trace`.

### H0.5 Trace-dual lattice and its stabilizer

**Theorem** (`latticeDuality`). For `ψ(x, y)=Tr(x₁y₂−x₂y₁)`, the ℤ-dual lattice of `L_c` is `c⊕d⁻¹=c L_c`. Its finite adelic row stabilizer is the unit group `K_c` of the order `[[Ô,(cd)⁻¹Ô],[cdÔ,Ô]]`: equivalently, its matrices have these entry ideals and determinant in `Ô×`. Invertibility over `A_{F,f}` alone is insufficient. Intersecting with `G*(A_f)` imposes rational scalar determinant. These are equalities of lattices and groups, including nonprincipal c.

*Proof route.* Dualize the two summands using the pinned fractional-ideal trace-dual formula. Use the row action: `L_c γ⊆L_c` determines the four entry ideals, and `L_c γ=L_c` additionally requires determinant in `Ô×`. The adjugate then preserves the same order and division by the unit determinant gives its inverse. Apply the calculation locally, then take restricted products.

In [Suggested.lean](Suggested.lean): `traceAlternatingDual`, `lattice_duality`.

**Checks.** For `F=ℚ` and `c=ℤ, K_c=GL₂(Ẑ)`. The matrix diag(2,1) satisfies the integral entry conditions and belongs to `GL₂(A_{ℚ,f})`, but contracts `ℤ₂²` strictly and is excluded by its nonunit determinant. The identity satisfies both conditions.

(Source: [BHW23](#references) Notation 5.1(3) and Definition 5.2(1), pp.1740–1741; the displayed order is interpreted through its units to enforce lattice equality.)

*Needs:* [H0.3 Polarization lattice](#h03-polarization-lattice), [H0.4 Integral trace polarization family](#h04-integral-trace-polarization-family); Mathlib `FractionalIdeal.dual_eq_mul_inv`, `FractionalIdeal.dual_dual`.

### H0.6 Hodge and abelian type witnesses

**Theorem** (`typeWitnesses`). §H0.0’s transport of PELModuli M5.4’s trace embedding of (G*, X*) into the Siegel datum, with the sign fixed by the integral trace family, is a Hodge-type witness in ShimuraVarieties §P.1. The identity `Res SL₂→Res SL₂` on the derived groups induces the common connected adjoint datum, and is an abelian-type witness in ShimuraVarieties §P.1 for (G, X). It does not assert a Hodge-type embedding of the exact group G.

*Proof route.* Verify closed immersion and compatibility with h for §H0.0’s map, not just faithfulness of a real representation. Use the common derived group and connected adjoint domains for the central-isogeny condition. Separate the integral lattice refinement from the rational type assertion.

**Checks.**

- At F=ℚ the transported witness is the genus-one Siegel datum.
- The C transport changes both h and the trace-form sign, preserving positivity.
- For g>1 the derived identity does not turn the exact full group G into the supplied scalar-determinant G*.

(Source: [BHW23](#references) Notation 5.1, extension p.1741.)

*Needs:* [H0.1 Derived groups and algebraic centres](#h01-derived-groups-and-algebraic-centres), [H0.2 Independent signs and common signs](#h02-independent-signs-and-common-signs), [H0.4 Integral trace polarization family](#h04-integral-trace-polarization-family); [§H0.0 Rational Hilbert data and trace embedding](#h00-rational-hilbert-data-and-trace-embedding); [ShimuraVarieties, §§P.1–P.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#p1-pure-data-and-special-pairs).

### Examples

For `F=ℚ` and `c=ℤ` the lattice is `ℤ²` and `ψ_{ℤ,1}((1,0),(0,1))=1`. For `F=ℚ(√2)` the different is (2√2), so the second summand of `L_O` is `(2√2)⁻¹O` and O² is not self-dual for the trace form. For a real quadratic field the full G domain has four components and the G* domain two.

### Dependencies

This layer uses PELModuli M5.4, ShimuraData §§5.3–5.4, ShimuraVarieties (§§P.1–P.3) and §H0.0; Mathlib `Algebra.trace`, `FractionalIdeal.dual`, `FractionalIdeal.dual_dual`, `FractionalIdeal.dual_eq_mul_inv`, `Submodule.mem_traceDual`.

## Layer H1: Hilbert–Blumenthal moduli and pairings

Specialize the relative abelian-scheme and PEL theory to ordered polarization modules. Keep the full determinant polynomial, the tame row-level convention and the finite-flat Weil pairing in every comparison.

### H1.0 Serre tensor by a projective polarization module

Define `HilbertSerreTensor` for an abelian scheme `A/S` with an action of the ring of integers `O_F`, and a finite projective `O_F`-module `P`. Choose an idempotent presentation `P ≅ e O_F^n` and take the image of the corresponding idempotent on `A^n`; prove that the resulting abelian scheme `P ⊗_{O_F} A` represents the tensor functor on fppf sheaves and is independent of the presentation through its specified universal property. In particular this supplies `c ⊗_{O_F} A` for a nonzero invertible fractional ideal `c`, without choosing a generator. Its intended signature takes `(A, i, P)` to an abelian scheme with `O_F`-action and the universal balanced map.

Give the tensor its API: functoriality in `P` and `A` with identity and composition, compatibility with arbitrary base change, finite direct sums, the unit module and invertible-module cancellation; tensor-Hom adjunction for O-linear homomorphisms; compatibility with duals, finite torsion and Tate modules under the corresponding perfect-duality and invertibility hypotheses. For invertible `c`, use its inverse module in the dual comparison; do not identify it with `O_F` unless an isomorphism is supplied. (Source: [Rap78](#references), §1, pp.257–264; [DP94](#references), §1, pp.61–64.)

**Checks.**

- `O_F ⊗ A` is canonically `A`, with its original action and identity universal map.
- The zero projective module gives the zero abelian scheme, and `O_F² ⊗ A` gives `A × A`.
- An invertible nonprincipal `c` still defines the tensor, and `c⁻¹ ⊗ (c ⊗ A)` is canonically `A`; no chosen basis of `c` occurs in this isomorphism.
- Changing the idempotent presentation preserves the universal balanced map and every induced torsion comparison.

*Needs:* AbelianSchemesAndArithmeticModuli §§A1.1, A3.1–A3.3, A6.25; finite projective modules, idempotent endomorphisms and the fppf-sheaf tensor product.

### H1.1 Ordered polarization module

**Definition** (`OrderedPolarizationModule`). An ordered invertible O-module is a projective rank-one O-module c with, for each real embedding `τ, a` chosen component `c_τ^+` of `(c⊗_{O, τ}ℝ)\{0}`. Its positive cone is the set of elements whose images lie in all selected components. Fractional ideals have the standard embedding order, and ordered isomorphisms preserve each component.

*Construction.* Transport the projective rank-one module to a fractional ideal; retain the ordering as part of the object. Define positivity using real scalar extension, agreeing with the pinned totally-positive predicate for the standard O object.

Its API:

- `OrderedPolarizationModule`: Package the invertible O-module with the chosen real half-lines.
- `positiveCone`: The intersection of their inverse images in c.
- `orderedModule_iso`: A module isomorphism is ordered iff it sends each selected real half-line to the selected half-line.
- `standard_positiveCone`: For standard `c=O`, its cone equals `{a∈O` | NumberField.IsTotallyPositive(a:F)}.

**Checks.**

- `ordered_Q`: For `O=ℤ` the standard cone consists of positive integers.
- `ordered_negative`: Multiplication by `−1` is not an automorphism of the standard ordered module.
- `ordered_nonprincipal`: An invertible nonprincipal ideal with its embedding cones is admitted without a basis.

(Source: [Tay02](#references) §1, p.10, ordered invertible OM-module.)

*Needs:* Tau Ceti `NumberField.IsTotallyPositive`; Mathlib `FractionalIdeal.dual`.

### H1.2 Symmetric real multiplication polarizations

**Definition** (`HilbertPolarizationModule`). For an A1 abelian scheme A/S of relative dimension g with unital injective real multiplication `ι:O→End_S(A), P(A, ι)` is the étale sheaf of O-linear maps `f:A→A∨` satisfying `f=f∨` under A2 biduality. `P(A, ι)^+` is the subsheaf of polarizations, defined by A2 ampleness. On the Hilbert locus the sheaf is an invertible O-module with its embedding-wise order; the evaluation condition is imposed by the separate c-polarization definition.

*Construction.* Use the imported dual and Hom sheaf to equalize f and `f∨` and impose O-linearity. The positive cone comes from ample line bundles via A2; define the DP evaluation condition separately from a single positive homomorphism. Use the Serre tensor of §H1.0 and étale localization to interpret c as an ordered locally constant sheaf.

Its API:

- `HilbertPolarizationModule`: The symmetric O-linear Hom sheaf `P(A, ι)`.
- `hilbertPolarizationModule_positive`: The subsheaf of positive homomorphisms from A2 ampleness.
- `hilbertPolarizationModule_mem`: A section is an O-linear map equal to its bidual transpose.
- `hilbertPolarizationModule_pullback`: Pullback is the A2 Hom/duality base-change map on the stipulated Hilbert locus.
- `hilbertPolarizationModule_ext`: Two sections of `P(A, ι)` agree if their underlying `A→A∨` morphisms agree; the symmetry and O-linearity proofs add no extra section data.

**Checks.**

- `polModule_Q`: For a geometric elliptic curve the symmetric Hom group is `ℤ`, with its degree-positive ray.
- `polModule_zero`: Zero is symmetric and is excluded from the positive cone.
- `polModule_negative`: If `λ` is a polarization, `−λ` is symmetric but not positive.

(Source: [DP94](#references) §§1.1–1.5 and 2.1, pp.60–64.)

*Needs:* [H1.1 Ordered polarization module](#h11-ordered-polarization-module); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A1`, `A2`, `A3`.

### H1.3 Ordered c-polarization

**Definition** (`CPolarization`). For an ordered invertible O-module c and a real-multiplication abelian scheme A/S, a c-polarization is an ordered isomorphism `c_S≅P(A, ι)`, preserving the positive cones, whose evaluation `A⊗_O c→A∨` is an isomorphism. The Serre tensor, duality and positivity are A2/A3 imports. This is the DP condition, including nonprincipal c.

Its API:

- `CPolarization`: The ordered isomorphism with the DP evaluation condition.
- `cPolarization_eval`: The induced evaluation isomorphism `A⊗_O c≅A∨`.
- `cPolarization_baseChange`: Evaluation and positivity commute with arbitrary base change.
- `cPolarization_rosati`: Every positive section gives a polarization whose Rosati involution fixes O.

**Checks.**

- `cPol_elliptic`: For `F=ℚ, c=ℤ` this is the principal elliptic polarization.
- `cPol_negative`: The negative symmetric map reverses the cone and is not a c-polarization.
- `cPol_nonprincipal`: No global generator of c is required.

(Source: [DP94](#references) §§1.1–1.5 and 2.1, pp.60–64.)

*Needs:* [H1.2 Symmetric real multiplication polarizations](#h12-symmetric-real-multiplication-polarizations), [H1.1 Ordered polarization module](#h11-ordered-polarization-module); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A3`, `A3.9`.

### H1.4 Hilbert PEL instance

**Construction** (`hilbertPELInstance`). For c as in H1, specialize M0/M1 with `B=F, *=id, V=F², L=L_c` and the c-indexed integral trace polarization family. At primes where a chosen positive `a∈c` and d give the good PEL lattice hypotheses, this is the usual trace-pairing PEL datum; the homological h and positivity sign agree with H0. At other primes it is a generic-fibre datum with a DP integral extension constructed in H2, not an application of M2 smoothness.

*Construction.* Insert the actual lattice and scalar involution into M0; verify `ψ(ax,y)=ψ(x,ay)`. Use H0 type witnesses and A2 positivity to match M1’s homological convention. List every inverted prime of the chosen good lattice; do not propagate that list to H2.

Its API:

- `hilbertPELInstance`: The specialization map from the ordered c-polarization data to M0/M1.
- `hilbertPEL_involution`: The adjoint action of every `a∈F` is the identity involution `a↦a`.
- `hilbertPEL_lattice`: The integral lattice is `L_c` and its trace dual is c `L_c`.
- `hilbertPEL_moduli_equiv`: The specialized M1 objects are exactly H1’s HBAV objects with the listed level and determinant conditions.

**Checks.**

- `pel_Q`: For `F=ℚ, c=ℤ` obtain the genus-one PEL object.
- `pel_nonprincipal`: For nonprincipal c the lattice comparison retains c rather than replacing it by O.
- `pel_ramified`: A ramified prime failing the perfect-lattice condition cannot be declared smooth by M2.

(Source: [BHW23](#references) Notation 5.1 and Definition 5.3, pp.1740–1741.)

*Needs:* [H0.6 Hodge and abelian type witnesses](#h06-hodge-and-abelian-type-witnesses), [H0.5 Trace-dual lattice and its stabilizer](#h05-trace-dual-lattice-and-its-stabilizer), [H1.3 Ordered c-polarization](#h13-ordered-c-polarization); [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M0.5`, `M1.2`; Mathlib `AlgebraicGeometry.Scheme`.

### H1.5 Full Hilbert determinant condition

**Theorem** (`hilbertDeterminant`). In characteristic zero, and on the integral Rapoport locus, Lie(A) is rank one over `O⊗𝒪_S` and for every `a∈O` its characteristic polynomial is `Norm_{F/ℚ}(T−a)`. This full polynomial is the M0 determinant condition; equality of traces alone is insufficient in ramified characteristic. The all-base DP implication is proved in H2 from flatness of the universal model and pullback, not from equality on geometric points.

*Proof route.* Use the characteristic-zero Hilbert multiplicities and the free rank-one module on the Rapoport locus to compute the regular-representation norm polynomial. Store all characteristic-polynomial coefficients in M0’s determinant interface and its base-change compatibility. For the ramified non-Rapoport locus use H2’s universal-flatness argument. A DP⇔Kottwitz converse is neither used nor asserted.

(Source: [DP94](#references) Proposition 2.7 and Corollary 2.9, pp.65–66.)

*Needs:* [H1.4 Hilbert PEL instance](#h14-hilbert-pel-instance); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A4`; [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M0.18`.

### H1.6 Hilbert tame level functors

**Definition** (`HilbertTameLevel`). Over `ℤ[1/N], N≥4`, the tame `μ_N` level is an O-linear closed immersion `d⁻¹⊗_ℤμ_N→A[N]`. Define the `K₀(c, N), K₁(c, N)` and K(c, N) variants through the corresponding finite-flat subgroup, marked quotient/Cartier-dual generator, and full lattice-level conditions. Their adelic groups are the row stabilizers of H0 with reductions respectively [[*,*],[0,*]], [[*,*],[0,1]], and `I₂`. The `μ_N` functor matches this `K₁` convention, not an unexplained `e₁` convention.

*Construction.* Specialize the imported finite-flat torsion and M1 level functors with `d⁻¹` visible. Use Cartier duality and the chosen row convention to identify the marked quotient and lower-right 1 subgroup. Define isomorphisms and base change through M1, retaining rigidity `N≥4`.

Its API:

- `HilbertTameLevel`: An O-linear closed immersion `d⁻¹⊗μ_N→A[N], N` invertible.
- `hilbertTameLevel_pullback`: Pullback preserves the level and closed immersion.
- `hilbertTameLevel_K1`: The complex lattice stabilizer is `K₁(c, N)` with lower-right entry 1.
- `hilbertTameLevel_forget`: The full-level, marked-quotient and subgroup levels have their compatible forgetful maps.

**Checks.**

- `tame_Q`: For `F=ℚ` the `μ_N` inclusion is the Cartier-dual version of the usual `Y₁(N)` marking after the stated isogeny/convention comparison.
- `tame_badN`: If N is not invertible, the same level is not silently treated as an étale constant basis.
- `tame_transpose`: Conjugating the row convention by the standard symplectic matrix converts the marked `e₂` quotient stabilizer to the `e₁` stabilizer.

(Source: [BHW23](#references) Definitions 5.2 and 5.4(1), pp.1741–1742.)

*Needs:* [H1.3 Ordered c-polarization](#h13-ordered-c-polarization), [H0.5 Trace-dual lattice and its stabilizer](#h05-trace-dual-lattice-and-its-stabilizer); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A3`; [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M1.7`.

### H1.7 Good-prime representability and universal family

**Theorem** (`goodRepresentability`). For the H1 PEL instance with M2’s good-prime hypotheses, the specialized moduli is a smooth separated finite-type algebraic stack. If `N≥4` rigidifies all automorphisms it is an algebraic space with its descended universal HBAV. Scheme and quasi-projective assertions require the DP representability/ample hypotheses used in H2 or the polarized ample-line construction in H6; they are not inferred merely from trivial inertia. The all-prime DP algebraic-space construction and its scheme refinement `dpHilbertModel_isScheme` (§H2.2b) are H2 targets.

*Proof route.* Apply M2 only after checking the integral lattice and determinant hypotheses. Check that an automorphism fixing the `μ_N` marking and polarization is trivial at the stipulated tame level. Distinguish the representable algebraic-space statement from the stronger DP scheme statement.

**Checks.**

- At an unramified good prime the smooth moduli construction applies.
- At a ramified prime M2 good-prime smoothness gives no conclusion; use the DP construction instead.
- Rigidifying `N≥4` removes inertia, but the global scheme formulation still uses `dpHilbertModel_isScheme` (§H2.2b).

(Source: [BHW23](#references) §5.1.2, pp.1744–1745.)

*Needs:* [H1.4 Hilbert PEL instance](#h14-hilbert-pel-instance), [H1.5 Full Hilbert determinant condition](#h15-full-hilbert-determinant-condition), [H1.6 Hilbert tame level functors](#h16-hilbert-tame-level-functors); [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M2.8`, `M2.9`.

### H1.8 Linearized Hilbert Weil pairing

**Construction** (`linearWeilPairing`). For an integer `m≥1` invertible on S and a c-polarized HBAV, define `ẽ_m:A[m]×A∨[m]→d⁻¹⊗_ℤμ_m` by `ẽ_m(x, y)(a)=e_m(ax, y)`. Under the trace identification `d⁻¹≅Hom_ℤ(O,ℤ)`, it is perfect O-bilinear and `Tr∘ẽ_m=e_m`. Combining `λ⁻¹` with it gives an alternating pairing on `A∨[m]` with target `c d⁻¹⊗μ_m`; equivalently its first argument is twisted by `c⁻¹` and the target is `d⁻¹⊗μ_m`. The pairing on integral finite-flat torsion is an fppf pairing, not a pairing just of geometric points.

*Construction.* Use the A3 Weil pairing and its Rosati adjointness to make `a↦e_m(ax,y)` O-linear. Apply the trace-dual identification; prove perfectness by the imported Cartier-dual Weil perfectness. Transport through the actual `λ` and retain the `c⁻¹` twist.

Its API:

- `linearWeilPairing`: The O-linearized pairing on `A[m]×A∨[m]`.
- `linearWeilPairing_trace`: `Tr(ẽ_m(x, y))=e_m(x, y)`.
- `linearWeilPairing_Olinear`: `ẽ_m(ax, y)=a·ẽ_m(x, y)=ẽ_m(x, ay)`.
- `linearWeilPairing_baseChange`: The construction commutes with base change and compatible torsion transition maps.

**Checks.**

- `weil_Q`: For `O=ℤ, d=ℤ` the linearized and original Weil pairings agree.
- `weil_codifferent`: For ramified F the target is `d⁻¹⊗μ_m`, rather than a canonically identified `O⊗μ_m`.
- `weil_zero`: Pairing either zero torsion section gives the identity section of `μ_m` and the zero additive linearization.

(Source: [BHW23](#references) Definition 5.6 and equation (5.1), p.1743.)

*Needs:* [H1.3 Ordered c-polarization](#h13-ordered-c-polarization), [H0.5 Trace-dual lattice and its stabilizer](#h05-trace-dual-lattice-and-its-stabilizer); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A3`; Mathlib `Submodule.mem_traceDual`, `AlgebraicGeometry.Scheme`.

### H1.9 Pairing and ideal change laws

**Theorem** (`pairingChoiceLaws`). At p, choose `β:c⁻¹O_p≅d⁻¹(1)`. If `β′=u β` with `u∈O_p×` and the pulled-back pairing is `b·⟨` , `⟩_β`, then `b′=u⁻¹b`. Rescaling a c-polarization by `η∈O×,+` while fixing the `A∨` basis changes b to `η⁻¹b`. An ordered isomorphism `c→c′` transports both `λ` and `β` and yields a comparison functor; totally positive multiplication and changes of roots of unity satisfy the corresponding multiplicative cocycle laws. The `μ_N` comparison does not make `c d⁻¹(1)` canonically trivial.

*Proof route.* Compare `β` and `u β` in the determinant pairing to get `b′=u⁻¹b`. Replace `λ⁻¹` by `η⁻¹λ⁻¹` to calculate polarization rescaling. Use Serre tensor functoriality and multiply the scalar changes to prove the cocycle identities.

(Source: [BHW23](#references) Definition 5.6, equation (5.2), footnote(2), pp.1743–1744; Lemma 8.9, p.1769.)

*Needs:* [H1.8 Linearized Hilbert Weil pairing](#h18-linearized-hilbert-weil-pairing), [H1.1 Ordered polarization module](#h11-ordered-polarization-module), [H1.6 Hilbert tame level functors](#h16-hilbert-tame-level-functors).

### H1.10 Complex Hilbert moduli comparison

**Comparison** (`complexHilbertComparison`). For `N≥4` and the selected ideal/lattice data, `X(c, μ_N)_ℂ` identifies with `Sh_{K₁*(c, N)}(G*, X*)`, and the variants identify with their matching `K, K₀, K₁` levels. The isomorphism is induced by polarized homology with the trace lattice and the H0 datum. It includes M3’s actual component decomposition; changing ideal representatives or `β/root` choices changes the displayed moduli trivialization by the H1 comparison laws.

*Proof route.* Apply M3 to the checked Hilbert instance, using A5’s homological polarization convention. Identify the lattice stabilizers through H0 and the tame marking through H1. Keep the ker¹/component labels unless their vanishing is separately proved; verify every level and ideal-change map.

(Source: [BHW23](#references) §5.1.2, pp.1744–1745.)

*Needs:* [H1.4 Hilbert PEL instance](#h14-hilbert-pel-instance), [H1.6 Hilbert tame level functors](#h16-hilbert-tame-level-functors), [H1.9 Pairing and ideal change laws](#h19-pairing-and-ideal-change-laws); [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M3.4`, `M3.6`.

### Examples

Over `ℚ` an ordered c-polarization with `c=ℤ` is a principal polarization of an elliptic curve. For the nonprincipal ideal `c=(2,√10)` of `ℤ[√10]` the polarization module is not free, and the c-polarization is defined without choosing a generator.

### Dependencies

This layer uses earlier layers H0; AbelianSchemesAndArithmeticModuli (A1, A2, A3, A4); PELModuli (M0, M1, M2, M3); Tau Ceti `NumberField.IsTotallyPositive`; Mathlib `AlgebraicGeometry.Scheme`, `FractionalIdeal.dual`, `Submodule.mem_traceDual`.

## Layer H2: Deligne–Pappas models and ordinary neighbourhoods

Construct the prime-to-p tame integral moduli problem at every p, including 2 and the primes ramified in F. Good-prime smoothness and all-prime flatness have different hypotheses. Schemes may be used on fine étale presentations; the global scheme formulation uses `dpHilbertModel_isScheme` (§H2.2b).

### H2.1 Hilbert self-orthogonal local model

**Definition** (`HilbertLocalModel`). For a base S, the Hilbert local model `LM_O/S` classifies `(O⊗𝒪_T)`-submodules `W⊂(O⊗𝒪_T)²` which are locally direct summands of rank g as `𝒪_T`-modules and satisfy `W=W^⊥` for the `O⊗𝒪_T`-valued wedge pairing. It is the corresponding closed subscheme of the rank-g Grassmannian. Rank-one freeness over `O⊗𝒪_T` is an open condition, not part of the whole local model at ramified primes.

*Construction.* Use the imported Grassmannian to impose O-stability and self-orthogonality as closed conditions. Use a local trivialization of the c-polarization module to identify the pairing with the standard wedge. Define the open rank-one locus separately.

Its API:

- `HilbertLocalModel`: The closed self-orthogonal O-stable Grassmannian model.
- `hilbertLocalModel_points`: T-points are exactly the specified rank-g self-orthogonal direct summands.
- `hilbertLocalModel_baseChange`: Construction commutes with arbitrary base change.
- `hilbertLocalModel_rapoport`: The open rank-one `O⊗𝒪_T` submodule locus is the Rapoport local-model locus.

**Checks.**

- `localModel_Q`: For `O=ℤ` obtain `ℙ¹_S`, the space of lines in `𝒪_S²`.
- `localModel_unramified`: After an étale splitting of O at an unramified prime obtain a product of g projective lines.
- `localModel_ramified`: For k[T]/T², the submodule generated by `Te₁` and `Te₂` is self-orthogonal of k-dimension 2 but not free of rank-one over k[T]/T².

(Source: [DP94](#references) §3.2, p.68, and §4.1, pp.70–71.)

*Needs:* [H0.5 Trace-dual lattice and its stabilizer](#h05-trace-dual-lattice-and-its-stabilizer); [AlgebraicModuliForArithmeticGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md) `§1.3`.

### H2.2 Deligne–Pappas integral Hilbert model

**Construction** (`DelignePappasHilbertModel`). Fix a nonzero ordered invertible integral ideal `c, N≥4` with `(N, Norm(c))=1`, and p∤N. The `DP μ_N` functor of H1, including the evaluation isomorphism, has a separated finite-type algebraic-space model over `ℤ_(p)`, with its universal HBAV; an auxiliary sufficiently fine full tame level gives an étale presentation. Its ℚ-fibre is H1’s canonical geometric Hilbert variety. The scheme formulation is `dpHilbertModel_isScheme` (§H2.2b), proved from this all-prime DP construction and its ample-line descent, beyond the good-prime M2 theorem.

*Construction.* Construct the DP functor using the imported abelian and level objects, and use DP2.1’s full-level representability. Pass from a fine full tame presentation to the `μ_N` functor by the matching finite level quotient and effective descent. Compare the generic fibre via H1; do not use M2’s good-prime smoothness to prove an arbitrary-prime statement.

Its API:

- `DelignePappasHilbertModel`: The integral algebraic-space moduli object with universal HBAV.
- `dpHilbertModel_moduli`: Morphisms `T→X_DP` correspond functorially to DP c-polarized HBAVs with `μ_N` level over T.
- `dpHilbertModel_genericFibre`: Its ℚ-fibre identifies with the H1 canonical moduli variety with matching level.
- `dpHilbertModel_changeLevel`: Prime-to-p tame level forgetful maps and the universal family commute with pullback.

**Checks.**

- `dp_Q`: For `F=ℚ, c=ℤ` recover the good integral `Y₁(N)` moduli problem in the `μ_N` convention.
- `dp_dyadic`: For `F=ℚ(√2), p=2, N=5` the DP evaluation functor is allowed; the whole model is not declared smooth.
- `dp_badTame`: N divisible by p is excluded from this prime-to-p tame construction.

(Source: [DP94](#references) §2.1, p.64; BHW §5.1.2, p.1744.)

*Needs:* [H1.3 Ordered c-polarization](#h13-ordered-c-polarization), [H1.6 Hilbert tame level functors](#h16-hilbert-tame-level-functors), [H1.10 Complex Hilbert moduli comparison](#h110-complex-hilbert-moduli-comparison); [AlgebraicModuliForArithmeticGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md) `§3.5`; [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M1.11`.

### H2.2a Finite étale descent with an ample line

**Theorem** (`finiteEtaleAmpleDescent`). Let S be affine noetherian and Y/S quasi-projective of finite type. For a free action of a finite constant group H, construct the quotient scheme Y/H and descend every H-linearized ample invertible sheaf with its actual cocycle. The quotient is quasi-projective over S. Also prove effective descent of quasi-projective schemes along finite étale surjections of affine noetherian bases when an ample-line cocycle is supplied. The group need not be commutative and its order need not be invertible on S. Descend compatible proper polarized abelian families separately using AlgebraicModuliForArithmeticGeometry §3.5.

*Proof route.* Form the algebraic-space quotient using §§5.1–5.4. For an ample A on Y, the conjugate tensor `⊗_{h∈H}h*A` is ample and has the permutation linearization. Construct H-stable affine neighborhoods of each finite orbit by products of suitably chosen ample sections; their invariant affine rings give quotient charts and glue. For a linearized line the free-action torsor gives effective module descent. Products of translates of sections give an ample descended power. For finite étale base descent, pass to a finite Galois splitting cover and apply the same semilinear construction, retaining the supplied line cocycle. Identity and composition follow from effective descent.

**Checks.**

- `H=1` returns Y and its line.
- The nonproper modular curve Y(N) is allowed; proper-family descent alone does not construct its twist.
- A noncommutative symplectic Isom group is allowed; freeness comes from its action on the splitting torsor.
- A free constant `C_p`-action in characteristic p is allowed; no averaging by 1/p is used.

(Source: [Stacks, Groupoids §25, Lemma 39.25.3, tag 0CCJ](https://stacks.math.columbia.edu/tag/0CCJ), finite locally free quasi-projective descent; [Stacks, Algebraic Spaces §14, Lemma 66.14.2, tag 07S7](https://stacks.math.columbia.edu/tag/07S7), finite locally free free actions on quasi-projective schemes; the invariant affine construction supplies the stated ample descent.)

*Needs:* AlgebraicModuliForArithmeticGeometry §§1.4, 3.5, 5.1–5.4 (very ample powers, module descent and effective finite algebraic-space quotients).

### H2.2b Scheme representability of the DP model

**Theorem** (`dpHilbertModel_isScheme`). Under §H2.2's hypotheses on c, N and p, the representing algebraic space `X_DP` is a scheme over `ℤ_(p)`. Construct a sufficiently fine full prime-to-p level presentation with an ample line: choose a positive element of c giving a polarization, construct its polarized-moduli parameter scheme with a projective embedding from ample powers on the abelian schemes, and prove the DP polarized-moduli comparison finite: rigidity makes its fibres discrete, and the positive Rosati norm bounds the images of fixed real-multiplication generators in the endomorphism lattice, giving finite fibres; combine quasi-finiteness with DP properness. Pull back an ample line along this finite comparison. Construct the norm line and its permutation cocycle for the finite level-forgetting group. Since the `μ_N` functor is rigid, this presentation is a finite étale torsor for its effective level group. Apply §H2.2a to descend an ample power and obtain the scheme. No assumption that the level-group order is prime to p is made.

**Checks.**

- For `F=ℚ` this gives the integral Y₁(N) scheme in the `μ_N` convention.
- For `F=ℚ(√2)`, `p=2` and `N=5`, scheme representability holds without asserting smoothness.
- A finite level group of order divisible by p still admits the torsor/norm-line descent; trivial inertia alone would not prove scheme representability.

(Source: [BHW23](#references) §5.1.2, p.1744, for the scheme formulation; [DP94](#references) §2.1, p.64, for the proper comparison to polarized moduli and full-level presentation; §H2.2a for the ample descent.)

*Needs:* [H2.2 Deligne–Pappas integral Hilbert model](#h22-delignepappas-integral-hilbert-model), [H2.2a Finite étale descent with an ample line](#h22a-finite-étale-descent-with-an-ample-line); AbelianSchemesAndArithmeticModuli §§A2.6–A2.8; AlgebraicModuliForArithmeticGeometry Layers 1–2 (projective parameter schemes and ample lines).

### H2.3 Flatness and normality at every prime

**Theorem** (`dpFlatNormal`). For the DP model at p∤N, its structure map is flat and locally a complete intersection of relative dimension g; each geometric special fibre is normal, and its nonsmooth locus has codimension at least 2. The total space over `ℤ_(p)` is normal. If p∤disc(F) the whole model is smooth. These assertions hold at `p=2`; ramified p may have singular points.

*Proof route.* Apply Grothendieck–Messing to identify the polarized O-linear deformation functor with LM: DP3.3, including square-zero and nonreduced bases. For each Eisenstein factor, use the DP4.3 graph chart with N equations in 2 N variables and special fibre dimension N to prove flat local-complete-intersection structure. Use DP4.2 strata dimensions to obtain regularity in codimension-one, combine with Cohen–Macaulay `S₂`, and descend through the étale charts.

(Source: [DP94](#references) Theorem 2.2, Corollary 2.3, Theorem 3.3, Proposition 4.4 and §4.5, pp.64–73.)

*Needs:* [H2.1 Hilbert self-orthogonal local model](#h21-hilbert-self-orthogonal-local-model), [H2.2 Deligne–Pappas integral Hilbert model](#h22-delignepappas-integral-hilbert-model); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A4`; [FiniteFlatGroupsAndIntegralPadicHodgeTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md) `R07.4.20–R07.4.24`, `R07.6.8`.

### H2.4 DP determinant identity on arbitrary bases

**Theorem** (`dpDeterminantAllBases`). The universal DP HBAV satisfies the full norm characteristic-polynomial identity for every `a∈O` on Lie(A). Therefore so does every pullback, including nonreduced bases. Proof uses H2 flatness and the generic H1 determinant identity; it does not infer a sheaf identity merely from field-valued points. This implication does not identify a determinant-only moduli functor with the DP functor.

*Proof route.* On an étale affine presentation, write the characteristic-polynomial coefficients of the locally free Lie bundle. They agree with the norm coefficients after inverting p by H1; flatness makes the coordinate ring p-torsion-free. The coefficient identities descend and pull back to every test scheme.

(Source: [DP94](#references) Proposition 2.7, p.65, and Theorem 2.2, p.64.)

*Needs:* [H1.5 Full Hilbert determinant condition](#h15-full-hilbert-determinant-condition), [H2.3 Flatness and normality at every prime](#h23-flatness-and-normality-at-every-prime), [H2.2 Deligne–Pappas integral Hilbert model](#h22-delignepappas-integral-hilbert-model); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A4`.

### H2.5 Rapoport locus

**Definition** (`HilbertRapoportLocus`). `X_R⊂X_DP` is the open locus where `ω_A` (equivalently, via the polarized Hodge sequence, the relevant Lie module) is locally free of rank-one over `O⊗𝒪_S`. It has smooth structure map of relative dimension g. At unramified p it is all of `X_DP`; at ramified p its complement in each special fibre has codimension at least 2. No characteristic-zero embedding decomposition is imposed on a ramified integral base.

*Construction.* Use the open rank-one freeness condition on the imported differential bundle. Match it to the smooth local-model stratum and use H2 étale charts. Use the unramified factor splitting only where `O⊗𝒪_S` is étale.

Its API:

- `HilbertRapoportLocus`: The open rank-one `O⊗𝒪_S` locus of the DP model.
- `mem_rapoportLocus`: Membership is local rank-one freeness of `ω_A` over `O⊗𝒪_S`.
- `rapoportLocus_baseChange`: The open subspace and `ω` commute with pullback.
- `rapoportLocus_smooth`: Its structure map is smooth of relative dimension g.

**Checks.**

- `rapoport_Q`: For `F=ℚ` the differential bundle is a line and `X_R=X_DP`.
- `rapoport_unramified`: For p∤disc(F), `X_R` is the whole model.
- `rapoport_nonfree`: The k[T]/T² local-model module `⟨Te₁, Te₂⟩` fails the rank-one freeness test.

(Source: [AIP §16](#references) §3.1, p.10, definition of the Rapoport open; [DP94](#references) Theorem 2.2, p.64, smoothness of this open.)

*Needs:* [H2.2 Deligne–Pappas integral Hilbert model](#h22-delignepappas-integral-hilbert-model), [H2.1 Hilbert self-orthogonal local model](#h21-hilbert-self-orthogonal-local-model), [H2.3 Flatness and normality at every prime](#h23-flatness-and-normality-at-every-prime); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A4`.

### H2.6 Ordinary locus and its Rapoport inclusion

**Theorem** (`ordinaryRapoport`). Define the ordinary locus by `A[p^∞]` having ordinary slopes 0 and 1 (height 2g, dimension g), or equivalently invertible determinant Verschiebung on `ω` in characteristic p, using R07.2. For every rational p, this open lies in `X_R`, so its completed neighborhood has the smooth Rapoport geometry. At a ramified prime, `ω` is rank-one over `O⊗k` on this locus; it need not split into embedding lines over the integral base.

*Proof route.* Import the intrinsic ordinary BT criterion from R07.2. Apply the O-linear multiplicative/étale decomposition and the polarized ordinary deformation calculation as in AIP §5.2.4 to identify `ω` as the rank-one `O⊗k` module. Use openness of `X_R` and complete along the ordinary special-fibre open. Hida 9.1 is corroboration only under its own unramified hypotheses.

(Source: [AIP §16](#references) §5.2.4, pp.22–23, ordinary/Rapoport inclusion; §3.1, p.10, Hasse invariant.)

*Needs:* [H2.5 Rapoport locus](#h25-rapoport-locus); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A4`; [FiniteFlatGroupsAndIntegralPadicHodgeTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md) `R07.2`.

### H2.7 Hilbert Hasse ideal

**Definition** (`HilbertHasseIdeal`). On the special fibre, specialize the generic R07.2 invariant `Ha(A[p])=det(V*)∈(det ω_A)^{⊗(p−1)}`. On an integral formal trivializing chart define `I_Ha=(p,Ĥa)`, where Ĥa is any lift of that section. Changes of trivialization multiply the reduction by a unit, and changes of lift add p times a section, so these ideals glue. It defines the ordinary open by invertibility of Ha; the generic `BT₁` invariant and Fargues LF remain owned by R07.2.

*Construction.* Import det(V*) and its base-change/ordinary criterion from R07.2. Trivialize its actual determinant line, lift locally, and compare two lifts modulo p. Glue the ideals using unit transition functions, retaining `p=2` where the exponent `p−1` is 1.

Its API:

- `HilbertHasseIdeal`: The coherent chartwise ideal (p,Ĥa) on the Hilbert formal model.
- `hilbertHasseIdeal_lift`: Replacing Ĥa by Ĥa+pf leaves the ideal unchanged.
- `hilbertHasseIdeal_trivialization`: Changing a line trivialization by a unit gives the same glued ideal.
- `hilbertHasseIdeal_ordinary`: Ha is invertible exactly on the intrinsic ordinary locus supplied by R07.2.

**Checks.**

- `hasse_p2`: At `p=2` the line is `det ω`, with exponent 1.
- `hasse_lift`: The generators (p,Ĥa) and (p,Ĥa+pf) define equal ideals.
- `hasse_supersingular`: For a supersingular elliptic fibre the invariant vanishes and the point is not ordinary.

(Source: [AIP §16](#references) §3.1, p.10, determinant Hasse invariant and Hodge ideal.)

*Needs:* [H2.6 Ordinary locus and its Rapoport inclusion](#h26-ordinary-locus-and-its-rapoport-inclusion); [FiniteFlatGroupsAndIntegralPadicHodgeTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md) `R07.2`.

### H2.8 Formal Hasse neighborhoods and lift independence

**Construction** (`hilbertHasseDomain`). For a complete p-adic base and a rational `0≤ε=a/b<1`, specialize R2’s section-domain construction to `det ω` and Ha. On each trivializing chart take the admissible blowup chart for `(Ĥa^b, p^a)` in which `Ĥa^b` generates, with p-torsion removed; its generic fibre is `|Ĥa|≥|p|^{a/b}`. The chartwise models glue and the rational domain is independent of the lift. The strict `ε<1` is essential; no identical lift-independence assertion is made at `ε=1`.

*Construction.* Apply the exact R2 construction to the Hilbert line and the ordinary formal base. Compare Ĥa and Ĥa+pf using `|p|<|p|^ε`, and use the nonarchimedean triangle inequality to equate the rational subsets. Use R2’s blowup/gluing result; distinguish any AIP indexed-thickening convention from the chosen `ε` convention.

Its API:

- `hilbertHasseDomain`: The formal model and adic rational domain for a/b<1.
- `hilbertHasseDomain_genericFibre`: Generic fibre is the inequality `|Ĥa|^b≥|p|^a` on each chart.
- `hilbertHasseDomain_lift`: Two lifts congruent modulo p determine equal rational domains for `ε<1`.
- `hilbertHasseDomain_monotone`: For `ε≤ε′<1` the ε-domain embeds into the ε′-domain.

**Checks.**

- `hasseDomain_zero`: `ε=0` means `|Ĥa|=1` on the integral generic fibre.
- `hasseDomain_dyadic`: The same rational inequality and lift comparison works at `p=2`.
- `hasseDomain_endpoint`: At `ε=1` the lifts 0 and p of the zero special-fibre section give respectively empty and whole inequality domains.

(Source: [AIP §16](#references) §3.2, Definition 3.1, pp.10–11, formal thickenings; rational-domain comparison by AdicSpacesPartIII R2 (formal schemes, generic fibres and Hasse domains).)

*Needs:* [H2.7 Hilbert Hasse ideal](#h27-hilbert-hasse-ideal); [AdicSpacesPartIII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdicSpacesPartIII/README.md) `R2.10`, `R2.10`.

### H2.9 Polarization representatives at bad primes

**Comparison** (`polarizationRepresentativesAtP`). For any narrow ideal class and `m=p N≠0`, the pinned coprime-representative theorem supplies an integral representative c with gcd(Norm(c), `p N)=1`. Ordered isomorphisms and H1 pairing-choice laws identify the corresponding generic and DP moduli descriptions, and composition obeys the comparison cocycle. Choosing this representative simplifies the integral lattice; it does not remove ramification of F at p or identify different narrow classes.

*Proof route.* Use the pinned theorem instead of reproving approximation for narrow classes. Transport the ordered polarization and tame marking along the positive ideal isomorphism. Check the evaluation and local-pairing diagrams under that transport.

(Source: [BHW23](#references) Definition 5.2 and footnote(2), pp.1741,1744.)

*Needs:* [H1.9 Pairing and ideal change laws](#h19-pairing-and-ideal-change-laws), [H2.2 Deligne–Pappas integral Hilbert model](#h22-delignepappas-integral-hilbert-model); Tau Ceti `NumberField.NarrowClassGroup.exists_mk0_eq_and_isCoprime_absNorm`.

### Examples

If p∤disc(F) the Deligne–Pappas model is smooth and equals its Rapoport locus. At a ramified p the Rapoport locus is open and smooth of relative dimension g, and its complement in each special fibre has codimension at least 2 (§§H2.3, H2.5). Both statements include `p=2`.

### Dependencies

This layer uses earlier layers H0, H1; AbelianSchemesAndArithmeticModuli (A4); AdicSpacesPartIII (R2); AlgebraicModuliForArithmeticGeometry (§1.3, §3.5); FiniteFlatGroupsAndIntegralPadicHodgeTheory (R07.2, R07.6); PELModuli (M1); Tau Ceti `NumberField.NarrowClassGroup.exists_mk0_eq_and_isCoprime_absNorm`.

## Layer H3: Polarization quotients and Hilbert Hecke maps

Identify the exact unit-square kernels, prove their finiteness and construct the arithmetic polarization-class quotient. Isogenies transport the polarization ideal, so correspondences act on the union of its components.

### H3.1 Tame congruence units

**Definition** (`congruenceUnits`). Let `U=O×` and `U⁺=NumberField.totallyPositiveIntegerUnits F`. For a nonzero integral ideal a, define `U_a=ker(U→(O/a)×)`; for an integer M>0 write `U_M=U_{MO}`. Only the congruence subgroup is new; total positivity and subgroup kernels use the pinned carriers.

*Construction.* Use reduction of units and its kernel for `U_a`. Use the square homomorphism on the abelian unit group and the pinned positivity-of-squares theorem to construct `S_M` in `U⁺`.

Its API:

- `congruenceUnits`: The subgroup `η≡1` modulo a.
- `mem_congruenceUnits`: `η∈U_a` iff `(η−1)∈a`.
- `congruenceUnits_mono`: If `a⊂b` then `U_a⊂U_b`.

**Checks.**

- `units_Q_tame`: For `O=ℤ, N≥3, U_N={1}` and `S_N={1}`.
- `units_sign`: Both `η and−η` have totally positive square, but only those congruent 1 modulo N contribute to `S_N`.
- `units_squareRoot`: Congruence of `η²` to 1 modulo N alone does not imply `η∈U_N`.

In [Suggested.lean](Suggested.lean): `congruenceUnits`, `mem_congruenceUnits`, `integerLevelIdeal`.

(Source: [BHW23](#references) Proposition 8.4 and Lemma 8.12, pp.1766,1771.)

*Needs:* Tau Ceti `NumberField.totallyPositiveIntegerUnits`, `NumberField.sq_mem_totallyPositiveIntegerUnits`; Mathlib `QuotientGroup.mk'`.

### H3.2 Congruence square image

**Definition** (`congruenceUnitSquares`). For M>0 let `S_M` be the image of `U_M` under `η↦η²` in the pinned subgroup `U⁺` of totally positive units. The square-root congruence is part of this definition. The image is a normal subgroup since `U⁺` is abelian.

Its API:

- `congruenceUnitSquares`: The image `S_M≤U⁺` of the square homomorphism on `U_M`.
- `mem_congruenceUnitSquares`: `u∈S_M` iff `u=η²` for some `η∈U_M`.
- `congruenceUnitSquares_mono`: If M divides M′, then `S_{M′}≤S_M`.

**Checks.**

- `squareImage_Q`: For `F=ℚ, M≥3` the image is the trivial subgroup.
- `squareImage_positive`: Every image element lies in NumberField.totallyPositiveIntegerUnits F by the pinned square-positivity theorem.
- `squareImage_root`: For `F=ℚ(√2), M=12, ε⁸` is not in `S_12` although `ε⁸≡1` modulo 12: its only roots `±ε⁴` both fail the congruence.

In [Suggested.lean](Suggested.lean): `congruenceUnitSquares`, `congruenceUnitSquares_missingRoot` (the `squareImage_root` Check).

(Source: [BHW23](#references) Proposition 8.4 and Lemma 8.12, pp.1766,1771.)

*Needs:* [H3.1 Tame congruence units](#h31-tame-congruence-units); Tau Ceti `NumberField.sq_mem_totallyPositiveIntegerUnits`.

### H3.3 Positive unit action on polarizations

**Construction** (`polarizationUnitAction`). For the fine `DP μ_N` object, `η∈U⁺` sends `(A, ι, λ, μ_N)` to `(A, ι, ηλ, μ_N)`. This gives an action compatible with base change and the H1 moduli comparisons. The O-linear `automorphism[η]` gives `(A, ι, η²λ, η⁻¹μ_N, ηα)≅(A, ι, λ, μ_N, α)`, with the last marking on `A∨`. The scalar isomorphisms from `U_N` make `S_N` act trivially, so the action factors through `Δ(N)`. This factorization does not identify geometric point stabilizers with `S_N`.

*Construction.* Scale the ordered identification by a positive unit; evaluation remains an isomorphism. Use Rosati adjointness and the actual dual level convention to verify the three isomorphism diagrams. Use the explicit scalar diagrams to kill `S_N`. Rigidity of a polarized marked object does not exclude an isomorphism between distinct polarization scalings.

Its API:

- `polarizationUnitAction`: The `U⁺` action on the c-polarized fine moduli functor.
- `polarizationUnitAction_one`: The unit 1 acts identically.
- `polarizationUnitAction_mul`: `ηθ` acts as `η` after `θ`.
- `polarizationUnitAction_square`: The `displayed[η]` isomorphism identifies square polarization changes with tame/dual-level scalar changes.

**Checks.**

- `unitAction_Q`: For `F=ℚ` the positive unit group is trivial.
- `unitAction_negative`: `−1` is not an allowed polarization-scaling unit for the standard positive cone.
- `unitAction_level`: A root `η≡1 mod N` supplies a scalar isomorphism for `η²`; non-scalar endomorphisms can give additional point stabilizers.
- At `F=ℚ(√3), c=O_F, N=7`, take `E/ℂ` with `End(E)=ℤ[i]`, `A=E²` with product polarization and `ι(√3)=S=[[1,1+i],[1−i,−1]]`. Then `S†=S`, `S²=3I`, and the Rosati-fixed integral centralizer is `ℤ[S]`: its rational Hermitian part is `ℚ+ℚS`, and the entries force both coefficients integral. Thus this is an ordered DP object. Put `u=7+4√3`, `η=u²=97+56√3` and `f=i(7I+4S)`. One has `f†f=ι(η)`. Modulo 7, `f=4iS` is an involution with trace zero; its +1 eigenspace is a line over `ℤ[i]/7=𝔽₄₉`, on which `S=−2i`, hence is free of rank one over `O_F/7`. A marking `𝔡⁻¹⊗μ₇` onto this line is fixed by f. Consequently `[η]` fixes this moduli point, although `η≡−1 mod 7` excludes `η∈S_7`. Its class has order two since `−u²∈U_7`. This also has `7∤disc(F)=12` and permits `p=5`.

(Source: [BHW23](#references) Lemma 8.2, Definition 8.3 and Proposition 8.4, pp.1765–1766.)

*Needs:* [H1.3 Ordered c-polarization](#h13-ordered-c-polarization), [H1.6 Hilbert tame level functors](#h16-hilbert-tame-level-functors), [H3.2 Congruence square image](#h32-congruence-square-image), [H2.2 Deligne–Pappas integral Hilbert model](#h22-delignepappas-integral-hilbert-model).

### H3.4 Finite tame polarization group

**Definition** (`TamePolarizationGroup`). For `N≥4`, define `Δ(N)=U⁺/S_N` with `S_N=U_N²` as in congruence units. The quotient uses the normal subgroup inside `U⁺`, with its natural projection. It is not `U⁺/((U⁺∩U_N)²)`, nor a quotient by units merely congruent 1 after squaring.

*Construction.* Form the quotient in the pinned normal-subgroup carrier. Keep the square-root congruence subgroup before taking its square image.

Its API:

- `TamePolarizationGroup`: The quotient `U⁺/S_N`.
- `tameDelta_mk`: The projection `U⁺→Δ(N)`.
- `tameDelta_eq`: `η` and `θ` have the same class iff `ηθ⁻¹=ν²` for some `ν∈U_N`.
- `tameDelta_changeLevel`: For N|M the inclusion `S_M⊂S_N` induces `Δ(M)→Δ(N)`.
- `tameDelta_lift`: For a group J, any homomorphism `U⁺→J` killing `S_N` factors uniquely through `tameDelta_mk`.

**Checks.**

- `delta_Q`: For `F=ℚ, N≥4, Δ(N)` is trivial.
- `delta_square`: Every `ν∈U_N` maps `ν²` to 1 in `Δ(N)`.
- `delta_notPositiveRoot`: The denominator permits square roots that are not totally positive; replacing it by positive-root squares can change the quotient.

In [Suggested.lean](Suggested.lean): `TamePolarizationGroup`, `tameDelta_mk`, `tameDelta_eq`, `tameDelta_lift`, `HilbertTamePolarizationGroup`.

(Source: [BHW23](#references) Proposition 8.4, p.1766.)

*Needs:* [H3.2 Congruence square image](#h32-congruence-square-image); Mathlib `QuotientGroup.mk'`.

### H3.5 Finiteness of the tame quotient

**Theorem** (`deltaFiniteness`). For every `M>0, Δ(M)` is finite. More precisely, `[U:U_M]<∞` because O/MO is finite, and finite generation of U plus the pinned square-class/unit theorem gives `[U⁺:U_M²]<∞`. For totally real F of degree g, every subgroup of U has square-class size at most `2^g`; this bound will also be used for the connected groups in H4.

*Proof route.* Use the finite residue-unit target to bound the congruence index. Apply the pinned Dirichlet structure theorem to `U_M` and its finite torsion subgroup; do not prove that theorem again. Combine subgroup indices with positivity of unit squares.

**Checks.**

- For `F=ℚ` the totally positive unit quotient is trivial at every positive M.
- At `M=0` the arbitrary-subgroup quotient is P itself; `P=⊥` is trivial even for `F=ℚ(√2)`, whereas the full or totally positive unit group of positive unit rank is infinite.
- The quotient uses squares of `U_M`, including roots that are not totally positive; replacing them by squares of `U_M∩U⁺` can change its size.

In [Suggested.lean](Suggested.lean): `tamePolarizationGroup_finite`.

(Source: [BHW23](#references) Proposition 8.4, p.1766.)

*Needs:* [H3.4 Finite tame polarization group](#h34-finite-tame-polarization-group); Tau Ceti `NumberField.units_sq_index_eq`, `NumberField.unitsMulEquivTorsionProdMultiplicative`.

### H3.6 Arithmetic Hilbert quotient

**Theorem** (`arithmeticQuotient`). With the exact `μ_N` convention, construct the finite quotient `X_G(c,μ_N)=X(c,μ_N)/Δ(N)` in algebraic spaces and the quotient stack `[X(c,μ_N)/Δ(N)]`. The stack atlas is a finite étale Δ(N)-torsor; its coarse quotient has the G canonical Hilbert variety as generic fibre through ShimuraVarieties §§8.1–8.5, 8.22. On the integral DP model the same stack and finite coarse quotient exist. Let `X^free` be the complement of the union of fixed loci of nonidentity elements of Δ(N). This invariant open has trivial geometric stabilizers on every fibre, and `X^free→X^free/Δ(N)` is a finite étale torsor. The whole coarse map is not asserted étale. A universal HBAV descends only with a verified descent datum.

*Proof route.* Factor the action using the scalar diagrams, form the quotient groupoid and use finite effective quotients. The standard atlas identity `X×_[X/Δ]X≅Δ×X` proves the stack torsor. The diagonal of X is separated, so the finitely many fixed loci are closed; outside their union the action is free. Apply the free finite-action theorem there. Identify generic coarse points and the canonical model by H1's comparison and datum functoriality. Equivariant Hecke correspondences descend as quotient stacks and as coarse correspondences; coarse torsor base-change arguments use only the free locus.

**Checks.**

- For `F=ℚ`, Δ(N) is trivial and the stack and coarse quotient coincide with X.
- The `F=ℚ(√3), N=7` CM point of §H3.3 has nontrivial order-two inertia in the quotient stack and is excluded from `X^free`.
- An integral torsor restriction uses trivial stabilizers on all its geometric fibres; generic freeness alone does not suffice.

(Source: [BHW23](#references) Proposition 8.4, p.1766, for the action and quotient; the torsor conclusion here is for the quotient stack and the coarse free locus, with nonfree points as in §H3.3. [Stacks, Lemma 66.14.2, tag 07S7](https://stacks.math.columbia.edu/tag/07S7), for free finite actions.)

*Needs:* [H3.3 Positive unit action on polarizations](#h33-positive-unit-action-on-polarizations), [H3.5 Finiteness of the tame quotient](#h35-finiteness-of-the-tame-quotient), [H1.10 Complex Hilbert moduli comparison](#h110-complex-hilbert-moduli-comparison); AlgebraicModuliForArithmeticGeometry §§5.1–5.4; SchemeAndStackFoundations §§1.19–1.23 (quotient stacks and coarse moduli); ShimuraVarieties §8.3.

### H3.7 Polarization ideal representative comparisons

**Comparison** (`idealClassComparisons`). The disjoint union of Hilbert moduli over a list of narrow ideal-class representatives has explicit comparison isomorphisms for a new list: choose ordered ideal isomorphisms and transport `λ`, lattices and `β`. Their composites obey H1’s cocycle; changing the comparison by a totally positive unit acts on the G* description and disappears after the G polarization-class quotient. Different ideal classes remain different labels.

*Proof route.* Use the pinned narrow-class finiteness to form the finite list. Apply the ordered ideal isomorphism comparison on each class and verify pairings and marking. Track the unit ambiguity explicitly before and after the arithmetic quotient.

(Source: [BHW23](#references) §8.4.1, p.1776, the dependence on the polarization ideal before Lemma 8.22.)

*Needs:* [H1.9 Pairing and ideal change laws](#h19-pairing-and-ideal-change-laws), [H2.9 Polarization representatives at bad primes](#h29-polarization-representatives-at-bad-primes), [H3.6 Arithmetic Hilbert quotient](#h36-arithmetic-hilbert-quotient); Tau Ceti `NumberField.NarrowClassGroup.instFinite`.

### H3.8 Hecke isogenies between polarization components

**Theorem** (`hilbertHeckeIsogenies`). Let S be a scheme over `ℤ[1/N], (A, ι, λ, μ_N) a` c-polarized HBAV over S with its tame `μ_N`-marking `(§H1.6), a⊂O a` nonzero ideal, and `D⊂A[a] a` closed O-stable subgroup scheme that is finite étale over S, étale locally isomorphic to the constant O-module `⊕_i O/b_i`, and disjoint from the image of `μ_N`. Disjointness is automatic when a is prime to N, and étaleness is automatic for a finite locally free D when a is invertible on S. Put `b=∏_i b_i`, the Fitting ideal of D as an O-module; it is locally constant on S. Then:

- (i) **Quotient structure.** `B=A/D` carries a unique HBAV structure `(ι′, λ′, μ′_N)` for which `φ:A→B` is a morphism of HBAVs. Here `ι′` is the quotient action, `μ′_N=φ∘μ_N`, and `λ′` is the unique cb-polarization with `λ∘(φ_D⊗c)=φ^∨∘λ′` as maps `B⊗cb→A^∨`, where `φ_D:B⊗b→A` is the map whose composite with `φ` is the natural map `B⊗b→B`.
- (ii) **Cyclic step.** If D is étale locally isomorphic to O/b, then `λ′` is obtained as follows. Dualizing `A=A⊗b⁻¹⊗b→A⊗b⁻¹` and using `λ` identifies `A[b]^∨` with `A[b]⊗cb`. The Weil pairing `A[b]×(A[b]⊗cb)→𝔾_m⊗𝔡⁻¹` is alternating and O-linear, so the exact annihilator of D is the Cartier dual of `D′=A[b]/D`. Hence `(A/D)^∨≅(A^∨⊗b)/(D′)^∨≅(A/D)⊗cb`, and this isomorphism is `λ′`. A general D has a filtration by O-stable subgroups with cyclic graded pieces; composing the cyclic steps gives the `λ′` of (i), independently of the filtration by the uniqueness in (i).
- (iii) **Ordered target and its classes.** Let c′ be in the narrow class of cb and `ε:cb≅c′` an isomorphism carrying the positive cone of cb onto that of c′. Then `λ′_ε=λ′∘(1⊗ε⁻¹)` is a c′-polarization. The isomorphism class of `(B, ι′, λ′_ε, μ′_N)` depends only on the class of `ε` modulo `S_N=U_N² (§H3.2)`: if `ε` is replaced by `u²ε` with `u∈U_N`, multiplication by `u⁻¹` on B is an isomorphism between the two quadruples, and it fixes `μ′_N` because `u≡1 mod N`. The ordered ideal-isomorphism classes `[ε]` form a torsor under `Δ(N)=U⁺/S_N`; their associated HBAV isomorphism classes can have additional stabilizers.
- (iv) **Correspondence.** For cyclic D with annihilator a, the functor of triples `(A, D, [ε])` over the fine `μ_N`-model is represented by a disjoint union, indexed by the classes `[ε]`, of copies of the quotient by `(O/a)^×` of the open subscheme of the universal A[a] consisting of points that generate O/a. The projection `π₁` forgets D and `[ε]`; `π₂` sends the triple to `(B, λ′_ε, μ′_N)` on the c′-component. Both projections are finite over `ℤ[1/N]` away from the primes dividing a. Over a list `c₁,…,c_{h⁺}` of narrow class representatives the union of these correspondences runs from the `c_i`-component to the `c_j`-component with `[c_j]₊=[c_i a]₊`. A single c-component is preserved only when [a]₊ is trivial.
- (v) **Descent to the arithmetic quotient.** By the uniqueness in `(i), λ′` depends O-linearly on `λ`: replacing `λ` by `ηλ` for `η∈U⁺` replaces `λ′` by `ηλ′`. So the correspondence commutes with the U⁺-action of §H3.3, and on the arithmetic quotients of §H3.6 the choice of `[ε]` disappears: changing `ε` by `η∈U⁺` changes `λ′_ε` by `η⁻¹`. Changing the representatives `c_i` by ordered ideal isomorphisms transports the correspondence through the comparisons of §H3.7. Hence the correspondence on the arithmetic Hilbert quotient is independent of the choices of representatives and of `ε`.

Nothing is asserted at primes dividing a, where D need not be étale. The integral finite-flat subgroup levels of §H4.8 are a separate statement.

*Proof route.* Construct `ι′` and `μ′_N` directly. For a cyclic D build `λ′` from the two isogenies through `A⊗b⁻¹`, the identification of `A[b]^∨` with `A[b]⊗cb`, and Cartier duality of the annihilator (KL05 §1.9). Check that `λ′` is a polarization by pulling back along `φ`, and that it satisfies the diagram in (i). Uniqueness holds because homomorphism groups of abelian schemes are torsion-free, so two maps that agree after composing with the isogenies `φ^∨` and `φ_D⊗c` are equal. Compose cyclic steps for a general D, which is how BHW23 prove Lemma 8.22. Verify the u²-independence by the explicit isomorphism `u⁻¹`. For representability, write the triple functor as a disjoint union over the classes `[ε]` of quotients of the generator locus of the universal A[a]. Then check O-linearity in `λ` and transport along §H3.7. Finally descend the equivariant correspondence through the stack quotient and its coarse quotient of §H3.6; use a coarse torsor only on the free locus.

**Checks.**

- For trivial D, `b=O` and the ordered quotient is A itself; changing ε still gives the positive-unit orbit.
- If `[a]₊` is nontrivial, the Hecke correspondence changes the narrow polarization component, even on the free locus.
- The H3.3 CM point can identify distinct `[ε]` as HBAV classes; quotient descent of the correspondence does not make the coarse polarization map a torsor there.

(Source: [BHW23](#references) Lemma 8.22 and diagram (8.7), pp.1776–1777, for the general D and the characterization of `λ′`; [KL05](#references) §1.9, author version pp.7–9, for the cyclic construction, the classes `[ε]` modulo squares of `U_N` and representability, and §1.10, p.9, for the union over narrow class representatives and finiteness of the two projections.)

*Needs:* [H3.7 Polarization ideal representative comparisons](#h37-polarization-ideal-representative-comparisons), [H3.6 Arithmetic Hilbert quotient](#h36-arithmetic-hilbert-quotient), [H3.4 Finite tame polarization group](#h34-finite-tame-polarization-group), [H1.8 Linearized Hilbert Weil pairing](#h18-linearized-hilbert-weil-pairing); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A2`, `A3`; Tau Ceti `NumberField.NarrowClassGroup.instFinite`.

### Examples

For `F=ℚ` the totally positive units are trivial and every `Δ(M)` is trivial. For `F=ℚ(√3), ε=2+√3` generates U modulo {±1} and is totally positive, so `Δ(1)=⟨ε⟩/⟨ε²⟩` has order two. For `F=ℚ(√2)`, the fundamental unit 1+√2 has norm `−1`; its square generates `U⁺` and `Δ(1)` is trivial. A generator of `U⁺` need not generate U modulo torsion.

### Dependencies

This layer uses earlier layers H1, H2; AbelianSchemesAndArithmeticModuli (A2, A3); AlgebraicModuliForArithmeticGeometry (§§5.1–5.4); ShimuraVarieties (§§8.1–8.5, 8.22); Tau Ceti `NumberField.NarrowClassGroup.instFinite`, `NumberField.sq_mem_totallyPositiveIntegerUnits`, `NumberField.totallyPositiveIntegerUnits`, `NumberField.unitsMulEquivTorsionProdMultiplicative`, `NumberField.units_sq_index_eq`; Mathlib `QuotientGroup.mk'`.

## Layer H4: Full levels, effective actions and connected limits

Construct the hybrid, scalar-multiplier and arithmetic full levels with their distinct comparison maps. Integral subgroup levels use group schemes. The connected unit limit is finite and stabilizes to its images; the unit limit of the whole space behaves differently.

### H4.1 Hybrid full Hilbert level

**Definition** (`HilbertHybridLevel`). Over characteristic-zero S with a fixed c-polarization and `μ_N` marking, a hybrid full `pⁿ` level is an `O/pⁿ` O-linear isomorphism `α_n:(O/pⁿ O)²≅A∨[pⁿ], n≥1`. Denote its fine moduli by `X_Γ(pⁿ)`. It retains `λ` and allows an arbitrary O-unit Weil multiplier. This is a generic-fibre basis; no such constant étale basis is imposed on characteristic p torsion.

*Construction.* Specialize the M1 finite étale frame functor to `A∨[pⁿ]`. Keep the c-polarization and `μ_N` marking on each object. Use H1’s good characteristic-zero comparison for representability.

Its API:

- `HilbertHybridLevel`: A full `O/pⁿ O` basis of `A∨[pⁿ]` on the geometric c-polarized moduli.
- `hybridLevel_forget`: `Forgetα_n` to the fine tame c-polarized moduli.
- `hybridLevel_reduce`: For `r≤n` use `[p^{n−r}]` on torsion and reduction of the basis to obtain `α_r`.
- `hybridLevel_dualConvention`: `λ⁻¹∘(α_n⊗c⁻¹)` identifies the corresponding basis of `A[pⁿ]` only after the `c⁻¹` twist.

**Checks.**

- `hybrid_Q`: For `F=ℚ, c=ℤ` obtain the usual full generic elliptic level on the dual curve.
- `hybrid_twist`: For nonprincipal c a basis of `A∨[pⁿ]` does not canonically give an untwisted basis of `A[pⁿ]`.
- `hybrid_charp`: For an ordinary elliptic curve in characteristic p, E[p] includes `μ_p` and is not a constant étale rank p² group.

(Source: [BHW23](#references) Definition 5.4(4), Remark 5.5 and §8.2, pp.1742,1768.)

*Needs:* [H1.3 Ordered c-polarization](#h13-ordered-c-polarization), [H1.6 Hilbert tame level functors](#h16-hilbert-tame-level-functors), [H1.8 Linearized Hilbert Weil pairing](#h18-linearized-hilbert-weil-pairing); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A3`; [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M1.7`.

### H4.2 Hilbert full-level pairing multiplier

**Construction** (`hilbertPairingMultiplier`). For a compatible local generator `β:c⁻¹O_p≅d⁻¹(1)`, pull back `ẽ_{pⁿ}` using `λ⁻¹(α_n⊗c⁻¹)` and `α_n`. There is a unique `b_n∈(O/pⁿ O)×` such that this pairing is `b_n` times the β-determinant pairing. The construction is a map `e_{n, β}:X_Γ(pⁿ)→(O/pⁿ O)×`, compatible with torsion reduction. `β` is an auxiliary trivialization, with the exact change law of H1.

*Construction.* Use perfect alternating O-linear forms on a rank-two free residue module to obtain a unique unit ratio. Use `β` to express that ratio and H1’s law to compare choices. Check the ratio under every reduction map, rather than choosing `β` independently at each n.

Its API:

- `hilbertPairingMultiplier`: The unique unit ratio of the pulled-back pairing to the `β` pairing.
- `hilbertPairingMultiplier_eq`: `e_{n, β}(α)=b` iff the two forms differ by multiplication by b.
- `hilbertPairingMultiplier_reduce`: The multiplier reduces compatibly from `pⁿ` to `p^r`.
- `hilbertPairingMultiplier_changeBeta`: Replacing `β` by `u β` replaces the multiplier by `u⁻¹b`.

**Checks.**

- `multiplier_identity`: A basis carrying the `β` form to the actual pairing has multiplier 1.
- `multiplier_change`: `β′=u β` gives `b′=u⁻¹b`.
- `multiplier_nonscalar`: For a nonscalar residue unit u the multiplier u is not a G* multiplier relative to the fixed `β`.

(Source: [BHW23](#references) Definition 5.6, equation (5.2), p.1743; equation (8.4), p.1769.)

*Needs:* [H4.1 Hybrid full Hilbert level](#h41-hybrid-full-hilbert-level), [H1.8 Linearized Hilbert Weil pairing](#h18-linearized-hilbert-weil-pairing), [H1.9 Pairing and ideal change laws](#h19-pairing-and-ideal-change-laws).

### H4.3 Scalar-similitude geometric full level

**Definition** (`HilbertGeometricFullLevel`). Let `S_n` be the image of `(ℤ/pⁿ ℤ)×` in `(O/pⁿ O)×`. Define `X_Γ*(pⁿ)=e_{n, β}^{−1}(S_n)` inside the hybrid moduli. Its bases are the G* full-level structures of BHW Definition 5.7, and its acting level group `is{γ∈GL₂(O/pⁿ O):det γ∈S_n}`. A choice of one root/multiplier component is further data and is not folded into this definition.

*Construction.* Take the inverse image of the scalar residue-unit subgroup under the actual multiplier map. Use the trace dictionary to check agreement with the rational-similitude definition. Keep the union of scalar multiplier components until a component is explicitly selected.

Its API:

- `HilbertGeometricFullLevel`: The scalar-multiplier subfunctor of hybrid full level.
- `geometricFullLevel_mem`: A basis is geometric full level iff its multiplier belongs to `S_n`.
- `geometricFullLevel_inclusion`: The natural inclusion `β₁` into the hybrid space.
- `geometricFullLevel_betaTransport`: H1’s comparison identifies the subfunctors for two compatible `β` choices after the stated basis transport.

**Checks.**

- `starLevel_Q`: For `F=ℚ, S_n=(O/pⁿ O)×`, so geometric and hybrid full levels coincide.
- `starLevel_missing`: For g>1 with nonscalar residue units, `β₁` misses their multiplier fibres and is not surjective.
- `starLevel_root`: Fixing one primitive root picks one scalar multiplier component; the entire G* definition does not fix that root.

(Source: [BHW23](#references) Definition 5.7, p.1743; Lemma 8.10, p.1770.)

*Needs:* [H4.2 Hilbert full-level pairing multiplier](#h42-hilbert-full-level-pairing-multiplier), [H0.6 Hodge and abelian type witnesses](#h06-hodge-and-abelian-type-witnesses).

### H4.4 Adjugate action on dual levels

**Theorem** (`adjugateLevelAction`). For `γ∈GL₂(O/pⁿ O)`, let `γ∨=adj(γ)=det γ·γ⁻¹`. The rule `γ·α=α∘γ∨` gives a left action on hybrid levels because `adj(γδ)=adj δ·adj γ`. It changes the pairing multiplier by `det γ`, since `det(adj γ)=det γ` in rank-two. Scaling `λ` by `η∈U⁺` changes that multiplier by `η⁻¹`. The actions commute; the G* action is obtained by the scalar determinant restriction.

*Proof route.* Reuse the pinned adjugate anti-multiplicativity and rank-two determinant formula. Compute the pulled-back alternating form under `α∘adj γ`. Apply H1’s λ-rescaling law to obtain `η⁻¹` and verify commuting actions.

**Checks.**

- `adjugateAction_one`: The identity matrix fixes every frame (`adjugateFrameAction_one`).
- `adjugateAction_scalar`: `uI₂` acts by u, since `adj(uI₂)=uI₂` in rank two (`adjugateFrameAction_scalar`). Precomposition by the inverse would act by `u⁻¹`, and precomposition by `det γ·γ` would act by `u³`.
- `adjugateAction_notRight`: Precomposition by γ gives a right action. Over `ℤ/pⁿℤ` with `n≥1`, take `u=[[1,1],[0,1]]` and `v=[[1,0],[1,1]]`; then `uv=[[2,1],[1,1]]` and `vu=[[1,1],[1,2]]` differ, so this rule fails the left-action law on a faithful frame.

In [Suggested.lean](Suggested.lean): `adjugateFrameAction`, `adjugate_level_action`, `adjugateFrameAction_one`, `adjugateFrameAction_scalar`.

(Source: [BHW23](#references) Remark 5.8 and Lemma 8.9, pp.1744,1769–1770.)

*Needs:* [H4.1 Hybrid full Hilbert level](#h41-hybrid-full-hilbert-level), [H4.2 Hilbert full-level pairing multiplier](#h42-hilbert-full-level-pairing-multiplier), [H3.3 Positive unit action on polarizations](#h33-positive-unit-action-on-polarizations); Mathlib `Matrix.adjugate_mul_distrib`, `Matrix.det_adjugate`.

### H4.5 Unit squares versus scalar levels

**Theorem** (`unitSquareLevel`). For `η∈U_N`, its polarization action by `η²` on the hybrid full-level space equals the level action of the scalar matrix `η⁻¹I₂`. Consequently `S_{pⁿ N}=U_{pⁿ N}²` acts trivially at full `pⁿ` level and is exactly the kernel supplied by scalar isomorphisms; this is not a claim about every geometric point stabilizer. This statement uses the dual-level action and the fixed tame `μ_N` convention; it is recalculated for another tame level.

*Proof route.* Insert `η` into the H3 HBAV isomorphism diagrams. Because `η∈U_N` the tame marking is unchanged; for a scalar rank-two matrix `adj(ηI)=ηI`. The scalar acts trivially on `α_n` exactly when `η≡1` modulo `pⁿ`, and p∤N combines the congruences.

**Checks.**

- For F=ℚ the positive-unit square relation is trivial.
- A scalar root in `U_N` but outside `U_{pⁿ}` changes the full frame even though its square is trivial at tame polarization level.
- The H3.3 CM example illustrates why scalar-kernel calculations do not determine all point stabilizers.

(Source: [BHW23](#references) Lemma 8.12, p.1771.)

*Needs:* [H4.4 Adjugate action on dual levels](#h44-adjugate-action-on-dual-levels), [H3.3 Positive unit action on polarizations](#h33-positive-unit-action-on-polarizations), [H3.2 Congruence square image](#h32-congruence-square-image).

### H4.6 Arithmetic full Hilbert level

**Definition** (`HilbertArithmeticFullLevel`). Define `X_{G, Γ(pⁿ)}` as the polarization-class quotient of the hybrid fine moduli by `Δ(pⁿ N)=U⁺/U_{pⁿ N}²`. Its coarse moduli interpretation retains(A, `ι,[λ], μ_N, α_n`), with isomorphisms acting on the dual basis. Denote `β₂` the coarse quotient map and retain `[X_Γ(pⁿ)/Δ(pⁿ N)]` as its quotient stack. Its atlas is a Δ(pⁿ N)-torsor; the coarse map is a torsor only on the action-free locus. A local HBAV representative may be used for this interpretation; no universal HBAV on the whole arithmetic quotient is part of this definition.

*Construction.* Use the exact full-level kernel and the finite quotient supplied by §§5.1–5.4. Check the polarization-class coarse interpretation with its dual-level isomorphism convention. Compare `β₂` to the G canonical finite-level map by §§8.1–8.5, 8.22.

Its API:

- `HilbertArithmeticFullLevel`: The quotient `X_Γ(pⁿ)/Δ(pⁿ N)`.
- `arithmeticFullLevel_quotient`: Invariant maps from the hybrid space factor uniquely through `β₂`.
- `arithmeticFullLevel_reduce`: The level reductions commute with the corresponding `Δ` quotient maps.
- `arithmeticFullLevel_coarse`: Geometric points have the stated polarization-class and dual-basis interpretation.

**Checks.**

- `arithmeticLevel_Q`: For `F=ℚ` the positive-unit quotient is trivial and all three full levels agree.
- `arithmeticLevel_beta1`: The composite `β₂β₁` need not be surjective and is not a torsor merely from the quotient description of `β₂`.
- `arithmeticLevel_universal`: The coarse interpretation supplies no automatic descended universal abelian scheme.

(Source: [BHW23](#references) Lemma 8.16(1), p.1772.)

*Needs:* [H4.1 Hybrid full Hilbert level](#h41-hybrid-full-hilbert-level), [H4.5 Unit squares versus scalar levels](#h45-unit-squares-versus-scalar-levels), [H3.4 Finite tame polarization group](#h34-finite-tame-polarization-group), [H3.5 Finiteness of the tame quotient](#h35-finiteness-of-the-tame-quotient); [AlgebraicModuliForArithmeticGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md) `§§5.1–5.4`.

### H4.7 Induction from scalar pairing components

**Comparison** (`hybridComparisonMap`). For fixed `β, X_Γ(pⁿ)≅[(O/pⁿ O)××X_Γ*(pⁿ)]/S_n`, where a residue unit u acts through diag(u,1) and `S_n` acts antidiagonally. Thus `β₁` is the scalar-multiplier inclusion and `β₂` is the unit polarization quotient; their distinct images and groups are visible. The assertion is on the generic fibre with compatible pairings.

*Proof route.* Translate a multiplier b to a scalar multiplier using diag(b,1). Compute the ambiguity as `S_n` using the H4 determinant action. Check the induced quotient isomorphism on finite étale frame functors and after base change.

(Source: [BHW23](#references) Corollary 8.11, p.1771.)

*Needs:* [H4.3 Scalar-similitude geometric full level](#h43-scalar-similitude-geometric-full-level), [H4.4 Adjugate action on dual levels](#h44-adjugate-action-on-dual-levels), [H4.6 Arithmetic full Hilbert level](#h46-arithmetic-full-hilbert-level).

### H4.8 Integral Iwahori and higher subgroup levels

**Definition** (`HilbertIntegralGamma0`). An integral `Γ₀(pⁿ)` level is a finite locally free O-stable subgroup `C⊂A[pⁿ]` of `rank p^{ng}`, such that every c-indexed polarized Weil pairing vanishes on `C×C`. Require its generic fibre C[1/p] to be étale locally `O/pⁿ O` of rank one. The inclusion `C⊂A[pⁿ]` imposes pⁿ-annihilation; any stronger ideal-annihilator or flat-closure refinement is a separate ideal-annihilator and flat-closure comparison. For a naive integral functor retain precisely these conditions; any flat closure or refined local-model variant is separately stated. `Γ₁` is an integral generator condition only when its group-scheme formulation has been specified; a full constant basis is restricted to the generic fibre.

A flagged integral level `HilbertIntegralGamma0Flag` consists of inclusions `0=C₀⊂C₁⊂⋯⊂C_n⊂A[pⁿ]`, with each `C_i⊂A[pⁱ]`, for `1≤i≤n`, a level satisfying all the preceding conditions at exponent i, in particular finite locally free of rank `p^{ig}` and isotropic for the level-i pairings. Integral forgetting is truncation of this flag; it is not defined on the unflagged naive functor by intersection with lower torsion.

*Construction.* Use the finite-flat subgroup and pairing carriers to impose these conditions at every step. Pull back the entire flag under base change and truncate for `1≤r≤n`; truncation preserves each stipulated rank and pairing condition and satisfies identity/composition laws. After inverting p the lower terms are uniquely `C_i=p^{n−i}C_n=C_n∩A[pⁱ]`, so the flagged and unflagged generic functors agree. For `F=ℚ`, consume ModularCurves Layers 3B–3D and 8 for finite-flat subgroups, Drinfeld generators and cyclicity; the naive Hilbert functor is not identified with that integral cyclic functor. No flatness or splitting-model identification is asserted for the flagged functor.

Its API:

- `HilbertIntegralGamma0`: The finite locally free O-stable isotropic subgroup-scheme level.
- `HilbertIntegralGamma0Flag`: The integral flag with the required finite-flat ranks and isotropy at every exponent.
- `integralGamma0_baseChange`: Subgroup, rank, isotropy and flags pull back to any base.
- `integralGamma0_generic`: On the generic fibre it is the stated `O/pⁿ O` rank-one subgroup level.
- `integralGamma0_forget`: For `1≤r≤n`, truncate a flagged integral level to its first r terms, compatibly with arbitrary base change and composition. Only on the generic fibre is this induced by `C_n↦C_n∩A[pʳ]` on unflagged levels.

**Checks.**

- `gamma0_ordinary`: For an ordinary elliptic curve, the multiplicative `μ_{pⁿ}` subgroup is a valid `rank pⁿ` integral `Γ₀` level.
- `gamma0_zero`: The zero subgroup has the wrong rank for `n≥1`.
- `gamma0_points`: Replacing `μ_p` by its geometric points loses its scheme rank and fails the test.
- `gamma0_bad_intersection`: In characteristic p, `C₂=E[p]⊂E[p²]` has rank p² and is isotropic for the p²-pairing, with vacuous generic condition. But `C₂∩E[p]=E[p]` has rank p² and `[p]C₂=0`; neither gives a rank-p lower level. A flag must supply such a `C₁` independently.
- `gamma0_flag_truncation`: On an ordinary elliptic curve, `C_i=μ_{pⁱ}` is a flag; forgetting from exponent two to one returns `μ_p` and commutes with base change.

(Source: [BHW23](#references) Definition 5.4(2–3), p.1742, for generic levels; [ModularCurves](../ModularCurves/README.md) Layers 3B–3D and 8, following Katz–Mazur §§1.4, 3.4, 6.4–6.5, for the elliptic finite-flat/Drinfeld comparison; integral flags as specified here.)

*Needs:* [H2.2 Deligne–Pappas integral Hilbert model](#h22-delignepappas-integral-hilbert-model), [H1.8 Linearized Hilbert Weil pairing](#h18-linearized-hilbert-weil-pairing); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A3`; [FiniteFlatGroupsAndIntegralPadicHodgeTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md) `R07.1`; [ModularCurves](../ModularCurves/README.md) `Layers 3B–3D, 8`.

### H4.9 Polarization quotient at subgroup level

**Comparison** (`gamma0Cartesian`). On the generic fibre the `Γ₀(pⁿ)` subgroup-level squares over the quotient stack `[X/Δ(N)]` are 2-Cartesian, since the forgetful map to X is equivariant. For coarse quotients assert the Cartesian square after restricting over `X^free/Δ(N)` of §H3.6. There the same Δ(N)-torsor acts before and after adjoining C. Any invariant rational Hasse neighborhood restricts this finite-level Cartesian diagram. No perfectoid limit theorem is proved or imported here.

*Proof route.* Use `ηC=C` for scalar units on O-stable subgroups in the H3 moduli isomorphism. Apply the quotient-stack pullback identity to the equivariant subgroup functor; use free descent for the coarse Cartesian square over the stated free locus. Restrict to the Hasse domain after verifying invariance of Ha under polarization changes.

**Checks.**

- For F=ℚ the stack square is the ordinary fine modular square.
- Above the H3.3 CM fixed point, coarse Cartesianity cannot be inferred from the quotient-stack identity.
- On any invariant Hasse open inside the free locus, base change retains the coarse torsor square.

(Source: [BHW23](#references) Lemma 8.5, p.1766.)

*Needs:* [H4.8 Integral Iwahori and higher subgroup levels](#h48-integral-iwahori-and-higher-subgroup-levels), [H3.6 Arithmetic Hilbert quotient](#h36-arithmetic-hilbert-quotient), [H2.8 Formal Hasse neighborhoods and lift independence](#h28-formal-hasse-neighborhoods-and-lift-independence).

### H4.10 Connected polarization and residue component groups

**Definition** (`ConnectedPolarizationGroup`). For `n≥1` put `A_n=U_{pⁿ}∩U⁺, B_n=U_{pⁿ N}`, and `Δ_n(N)=A_n/B_n²`. For `r≤n` inclusion induces `Δ_n→Δ_r`; these maps need be neither injective nor surjective. This group preserves a selected paired component and differs from the whole-space quotient `Δ(pⁿ N)=U⁺/B_n²`.

*Construction.* Use `B_n²⊂A_n` and form its normal-subgroup quotient. Use the nested congruence subgroups to define and compose transition homomorphisms. Keep the connected numerator `A_n` separate from the full positive-unit numerator.

Its API:

- `ConnectedPolarizationGroup`: `A_n/B_n²` with the indicated level transitions.
- `connectedDelta_eq`: Classes of `η, θ∈A_n` agree iff `ηθ⁻¹=ν²` for `ν∈B_n`.
- `connectedDelta_transition`: Reduction from n to r is induced by inclusion and satisfies identity/composition laws.

**Checks.**

- `connectedDelta_Q`: For `F=ℚ` all `Δ_n(N)` are trivial.
- `connectedDelta_noninjective`: For `F=ℚ(√2), p=3, N=4` the inclusion-induced `Δ₁(4)→Δ(4)` is not injective, as the counterexamples of [H4.19 Counterexamples to the printed unit stabilization proof](#h419-counterexamples-to-the-printed-unit-stabilization-proof) show.
- `connectedDelta_square`: For `η∈U_{pⁿ N}`, the class of `η²` is trivial in `Δ_n(N)`.

In [Suggested.lean](Suggested.lean): `connectedCongruenceUnits`, `connectedSquareDenominator`, `ConnectedPolarizationGroup`, `connectedDelta_eq`.

(Source: [BHW23](#references) Definition 8.14 and Lemma 8.16, pp.1771–1773.)

*Needs:* [H3.2 Congruence square image](#h32-congruence-square-image), [H3.4 Finite tame polarization group](#h34-finite-tame-polarization-group); Mathlib `QuotientGroup.mk'`.

### H4.11 Residue polarization components

**Definition** (`ResiduePolarizationComponents`). For `n≥1` define `𝒰_n=(O/pⁿ O)×/image (U⁺)`, using reduction of the pinned totally positive units. This is the fixed-c arithmetic multiplier-component group; over all polarization classes it occurs as the kernel in the narrow ray-class extension.

*Construction.* Form the two quotients on their explicit subgroup carriers. Use `B_n²⊂A_n` and the nested subgroup inclusions to define level transition maps. Keep the inclusion `A_n⊂U⁺` separate from any injectivity claim after quotienting.

Its API:

- `ResiduePolarizationComponents`: The quotient of residue units by the positive-unit image.
- `residueComponents_mk`: The residue-unit projection to `𝒰_n`.
- `residueComponents_eq`: Two units have equal classes iff their ratio is the reduction of a totally positive global unit.
- `residueComponents_reduce`: Residue reduction induces compatible maps `𝒰_n→𝒰_r` for `r≤n`.

**Checks.**

- `residueComponents_Q`: For `F=ℚ` the image is {1}, so `𝒰_n=(ℤ/pⁿ ℤ)×`.
- `residueComponents_unit`: Reduction of every positive global unit has trivial class.
- `residueComponents_narrow`: The group for fixed c omits nontrivial narrow ideal classes and is not the whole arithmetic component set.

(Source: [BHW23](#references) Definition 8.14 and Lemma 8.16, pp.1771–1773.)

*Needs:* [H3.1 Tame congruence units](#h31-tame-congruence-units); Mathlib `QuotientGroup.mk'`.

### H4.12 Full and connected component comparisons

**Theorem** (`componentAndTorsorComparison`). With BHW’s fixed c and tame `μ_N` convention, after a splitting/cyclotomic base and the required component choice, `π₀(X_Γ*(pⁿ))=(ℤ/pⁿ ℤ)×, π₀(X_Γ(pⁿ))=(O/pⁿ O)×`, and `π₀(X_{G, Γ(pⁿ)})=𝒰_n` for that c-fibre. Over all c classes the arithmetic labels form the narrow ray-class extension by `Cl⁺(O)`. `β₂` lifts to a Δ(pⁿ N)-torsor over the whole-space quotient stack and a Δ_n(N)-torsor over a paired-component quotient stack. The corresponding coarse maps are torsors only where their respective actions have trivial geometric stabilizers. Base-field Galois actions on the labels are retained.

*Proof route.* Use strong approximation for the imported derived `Res SL₂` group and compute determinant double cosets at this exact tame level. Use the multiplier induction comparison to pass from scalar to O-unit labels. Compute the subgroup preserving the selected multiplier component and divide its scalar kernel, giving `A_n/B_n²`.

**Checks.**

- For F=ℚ the positive-unit groups are trivial.
- A chosen pairing component uses Δ_n(N), not the whole-space Δ(pⁿN).
- A nontrivial geometric stabilizer gives stack inertia rather than a coarse torsor fibre.

(Source: [BHW23](#references) Lemmas 8.15–8.16, pp.1771–1773.)

*Needs:* [H4.10 Connected polarization and residue component groups](#h410-connected-polarization-and-residue-component-groups), [H4.7 Induction from scalar pairing components](#h47-induction-from-scalar-pairing-components), [H3.7 Polarization ideal representative comparisons](#h37-polarization-ideal-representative-comparisons), [H4.6 Arithmetic full Hilbert level](#h46-arithmetic-full-hilbert-level), [H4.11 Residue polarization components](#h411-residue-polarization-components); [AdelicAlgebraicGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md) `§4.2`; [ShimuraVarieties](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md) `§8.3`.

### H4.13 Effective finite level groups

**Definition** (`HilbertFiniteGamma0`). For `0≤m≤n, n≥1`, define `Γ₀(pᵐ, pⁿ)={γ∈GL₂(O/pⁿ O): γ₂₁∈pᵐ O/pⁿ O}`. Its `Γ₀*` subgroup imposes determinant in the scalar image of `(ℤ/pⁿ ℤ)×`. These act on generic full-level frames and forget to the stipulated subgroup level.

*Construction.* Use the lower-left congruence and the scalar determinant condition to define the matrix subgroups. Identify the image of `U_N` by its kernel `U_{pⁿ N}`. Form the two central quotients with the exact combined action relation.

Its API:

- `HilbertFiniteGamma0`: The lower-left congruence subgroup of `GL₂(O/pⁿ O)`.
- `finiteGamma0_mem`: Membership is exactly the lower-left ideal condition.
- `finiteGamma0_star`: The scalar-determinant subgroup `Γ₀*≤Γ₀`.

**Checks.**

- `gamma0_m0`: For `m=0` the lower-left condition is void and `Γ₀=GL₂(O/pⁿ O)`.
- `gamma0_mn`: For `m=n` the lower-left entry is 0 in `O/pⁿ O`.
- `effective_Q`: For `F=ℚ, N≥4, U_N={1}`; hence `Z_n` is trivial and `PΓ₀=Γ₀`.

In [Suggested.lean](Suggested.lean): `HilbertResidueRing`, `HilbertFiniteGamma0`.

(Source: [BHW23](#references) Definition 8.17 and §8.3.1, pp.1773–1775.)

*Needs:* [H4.4 Adjugate action on dual levels](#h44-adjugate-action-on-dual-levels), [H4.5 Unit squares versus scalar levels](#h45-unit-squares-versus-scalar-levels), [H3.2 Congruence square image](#h32-congruence-square-image); Mathlib `QuotientGroup.mk'`.

### H4.14 Diagonal level and polarization group

**Definition** (`HilbertDiagonalLevelGroup`). Define `E(pᵐ, pⁿ)=(Γ₀(pᵐ, pⁿ)×U⁺)/image (η↦(ηI₂, η²), η∈U_N)`. The subgroup is central. For the left adjugate frame action and positive polarization action this is the scalar relation killed in the joint action; point stabilizers need not be scalar.

Its API:

- `HilbertDiagonalLevelGroup`: The central quotient E by the square relation.
- `diagonalLevel_mk`: The product-group projection to E.
- `diagonalLevel_relation`: `(ηI₂, η²)` maps to 1 for `η∈U_N`; these generate exactly the kernel.
- `diagonalLevel_action`: The joint level/polarization action factors through E using H4’s unit-square calculation.

**Checks.**

- `diagonal_Q`: For `F=ℚ, N≥4, E=Γ₀`.
- `diagonal_square`: Its second coordinate is `η²`, matching Rosati polarization scaling.
- `diagonal_notLinear`: The relation `(ηI₂, η)` generally changes the paired moduli and is not substituted.

(Source: [BHW23](#references) Definition 8.17 and §8.3.1, pp.1773–1775.)

*Needs:* [H4.13 Effective finite level groups](#h413-effective-finite-level-groups), [H4.5 Unit squares versus scalar levels](#h45-unit-squares-versus-scalar-levels), [H3.2 Congruence square image](#h32-congruence-square-image); Mathlib `QuotientGroup.mk'`.

### H4.15 Ineffective scalar level subgroup

**Definition** (`hilbertLevelScalarKernel`). Let `Z_n` be the image of `U_N` under scalar reduction `η↦ηI₂` in `Γ₀(pᵐ, pⁿ)`. It is central and its kernel is `U_{pⁿ N}`, because p and N are coprime. Thus `Z_n≅U_N/U_{pⁿ N}`; the tame congruence is not dropped.

Its API:

- `hilbertLevelScalarKernel`: The central image `Z_n` of `U_N` in `Γ₀`.
- `levelScalarKernel_mem`: `γ∈Z_n` iff `γ=ηI₂` for `η∈U_N`.
- `levelScalarKernel_quotient`: `Z_n≅U_N/U_{pⁿ N}`.

**Checks.**

- `scalarKernel_Q`: For `F=ℚ, N≥4, Z_n={I₂}`.
- `scalarKernel_central`: For `η∈U_N` and `u=[[1,1],[0,1]]`, both products `(ηI₂)u` and `u(ηI₂)` equal `[[η,η],[0,η]]` after reduction; replacing the scalar image by a noncentral diagonal subgroup fails this computation.
- `scalarKernel_collision`: For `F=ℚ, N=5, p=2` and `n=1, −1` fails the tame congruence but reduces to 1. Thus the reduction of `−I₂` belongs to `Z₁` via the representative 1; membership is existential in the tame-congruent representative.
- `scalarKernel_tame`: For `F=ℚ, N=5, p=3` and `n=1, U_N={1}` and `−I₂≠I₂`, so `−I₂` is not in `Z₁`. Quotienting by every residue scalar would erase a nontrivial element.

(Source: [BHW23](#references) Definition 8.17 and §8.3.1, pp.1773–1775.)

*Needs:* [H4.13 Effective finite level groups](#h413-effective-finite-level-groups), [H3.1 Tame congruence units](#h31-tame-congruence-units).

### H4.16 Effective projective level group

**Definition** (`HilbertEffectiveGamma0`). Define `PΓ₀(pᵐ, pⁿ)=Γ₀(pᵐ, pⁿ)/Z_n` using the actual ineffective scalar subgroup, not all residue scalar matrices. It acts effectively on the arithmetic full-level moduli over `Γ₀` subgroup level.

Its API:

- `HilbertEffectiveGamma0`: The quotient `PΓ₀=Γ₀/Z_n`.
- `effectiveLevel_mk`: The normal-subgroup quotient projection.
- `effectiveLevel_quotient`: An action trivial on `Z_n` factors uniquely through `PΓ₀`.

**Checks.**

- `effective_Q`: For `F=ℚ, N≥4, PΓ₀=Γ₀`.
- `effective_kernel`: The projection kills exactly `Z_n`.
- `effective_notPGL`: For `F=ℚ` and p odd the scalar `−I₂` survives; this quotient is not `PGL₂`.

(Source: [BHW23](#references) Definition 8.17 and §8.3.1, pp.1773–1775.)

*Needs:* [H4.13 Effective finite level groups](#h413-effective-finite-level-groups), [H4.15 Ineffective scalar level subgroup](#h415-ineffective-scalar-level-subgroup); Mathlib `QuotientGroup.mk'`.

### H4.17 Finite-level torsors and diagonal exact sequences

**Theorem** (`finiteLevelTorsors`). In characteristic zero with the stated fine tame level, `X_Γ*→X_Γ₀*` is a Γ₀* torsor and `X_Γ→X_Γ₀*` a Γ₀ torsor. For the arithmetic maps use quotient stacks: the full-to-subgroup map is a PΓ₀ torsor and the diagonal hybrid-to-arithmetic-subgroup map an E torsor, with exact sequences `1→Γ₀→E→Δ(N)→1` and `1→Δ(pⁿ N)→E→PΓ₀→1`. On coarse spaces the same conclusions hold over opens where the relevant actions have trivial geometric stabilizers; for the diagonal map this means the E-action is free, not merely the frame action. No universal nonsplitting assertion is imposed on these extensions.

*Proof route.* Use finite étale frame moduli to prove the first two torsor diagrams. Calculate the two central quotient kernels directly from the H4 square relation. Obtain the arithmetic and diagonal torsor diagrams from the quotient-stack Cartesian squares and the exact group sequences. Pass to coarse torsor diagrams only on the respective free loci of §H3.6 and §H4.6.

**Checks.**

- For F=ℚ the positive-unit quotient vanishes and the fine frame torsors remain.
- The H3.3 CM stabilizer prevents deducing a coarse diagonal torsor solely from tame rigidity.
- An exact sequence of acting groups alone does not prove that their actions on coarse spaces are free.

(Source: [BHW23](#references) Proposition 8.18, diagram (8.6), Lemma 8.19, pp.1773–1775.)

*Needs:* [H4.13 Effective finite level groups](#h413-effective-finite-level-groups), [H4.12 Full and connected component comparisons](#h412-full-and-connected-component-comparisons), [H4.9 Polarization quotient at subgroup level](#h49-polarization-quotient-at-subgroup-level), [H4.16 Effective projective level group](#h416-effective-projective-level-group), [H4.14 Diagonal level and polarization group](#h414-diagonal-level-and-polarization-group).

### H4.18 Finite connected unit limit and stable images

**Theorem** (`connectedLimitFiniteness`). For every p including 2, the finite groups `Δ_n(N)` have the uniform bound `|Δ_n(N)|≤[U:U_N]·2^g`. Their inverse limit `Δ_∞(N)` is finite. Let `I_n` be the image of `Δ_∞→Δ_n`; the surjective transition maps `I_{n+1}→I_n` are isomorphisms for n≫0, so `Δ_∞≅I_n` eventually. The literal assertion `Δ_∞≅Δ_n` via projection for all large n is false at `p=2`. The whole-space inverse limit lim `Δ(pⁿ N)` is a separate profinite group and is not covered by this bound.

*Proof route.* Write `B_n=U_{pⁿ}∩U_N` and `A_n=U_{pⁿ}∩U⁺`. Bound `[A_n:B_n²]` by `[A_n:A_n∩B_n]·[B_n:B_n²]≤[U:U_N]·2^g` using the pinned unit structure. If an inverse limit had more than that bound many distinct elements, a common finite level would separate them, contradicting the bound; thus the limit is finite. The projections onto `I_n` have surjective transitions; their bounded nondecreasing cardinalities eventually stabilize, hence those transitions become isomorphisms. Do not replace `I_n` by `Δ_n` without an additional proof.

(Source: [BHW23](#references) Lemma 8.20, p.1775, corrected statement; the explicit countercalculations below.)

*Needs:* [H4.10 Connected polarization and residue component groups](#h410-connected-polarization-and-residue-component-groups), [H3.5 Finiteness of the tame quotient](#h35-finiteness-of-the-tame-quotient); Tau Ceti `NumberField.unitsMulEquivTorsionProdMultiplicative`.

### H4.19 Counterexamples to the printed unit stabilization proof

**Application** (`stabilizationCounterexamples`). For `F=ℚ(√2), ε=1+√2: (i) p=3, N=4, η=ε⁴=17+12√2` lies in `U_4` and `η≡−1` modulo 3, so `η²` defines a nonzero class in `Δ₁(4)` which is zero in `Δ(4)`; neither `root±η` lies in `U_12`. (ii) `p=2, N=5` and `n≥2, U_{2ⁿ}=⟨ε^{2ⁿ}⟩` and `U_{2ⁿ 5}=⟨ε^{3·2ⁿ}⟩`, hence `Δ_n(5)≅ℤ/6` with transition multiplication by 2. Its inverse limit is `ℤ/3`; the original maps never stabilize to isomorphisms.

*Proof route.* For (i), compute `η mod 4` and 3 and use that the only field square roots of `η² are±η`. For (ii), verify `O×={±ε^k}` by reducing a positive unit to the interval [`1,ε`) and using the Pell norm equation. Recurrence for `ε^{2ᵐ}=a_m+b_m√2` gives `v₂(b_m)=m`; negative signs fail mod 4. Compute the order of `ε mod 5` as 12. Combine the congruence orders and positive-unit condition, obtaining the cyclic quotients and multiplication-by 2 transitions. The 2-primary factor dies in the inverse limit and the 3-primary factor survives.

(Source: [BHW23](#references) Lemma 8.20 proof, p.1775; explicit countercalculation.)

*Needs:* [H4.10 Connected polarization and residue component groups](#h410-connected-polarization-and-residue-component-groups), [H3.4 Finite tame polarization group](#h34-finite-tame-polarization-group).

### Examples

The adjugate reverses products, `adj(γδ)=adj(δ)adj(γ)`, so `α↦α∘adj(γ)` is a left action; at `p=2` the stabilization counterexamples of §H4.19 show that the projections onto the whole of `Δ_n(N)` need not stabilize.

### Dependencies

This layer uses earlier layers H1, H0, H3, H2; AbelianSchemesAndArithmeticModuli (A3); AdelicAlgebraicGroups (Layer 4); AlgebraicModuliForArithmeticGeometry (§§5.1–5.4); FiniteFlatGroupsAndIntegralPadicHodgeTheory (R07.1); PELModuli (M1); ShimuraVarieties (§§8.1–8.5, 8.22); Tau Ceti `NumberField.unitsMulEquivTorsionProdMultiplicative`; Mathlib `Matrix.adjugate_mul_distrib`, `Matrix.det_adjugate`, `QuotientGroup.mk'`.

## Layer H5: Modular comparisons, Hodge factors and algebraic weights

Normalize the rational case against the modular-curve moduli conventions. Build the restricted cusp and open Hodge-line calculations needed here, and test characteristic-zero descent on a nonprincipal ramified example.

### H5.1 Rational modular-curve comparison

**Comparison** (`rationalModularComparison`). For `F=ℚ` both imported Hilbert groups are `GL₂, d=ℤ`, and a c-polarization becomes the elliptic principal polarization after the positive generator of c is fixed. Match `μ_N⊂E[N]` to the marked-point `Y₁(N)` convention by quotienting E by its `μ_N` image and using the Cartier-dual kernel of the dual isogeny; match full and `Γ₀` levels through the explicit dual/polarization maps. Then all three full-level spaces and their quotients agree with §§8.1–8.5, 8.22/§§3.1, 3.14, 8.1 modular curves, with compatible level and Hecke maps. A fixed-root full pairing component has its actual cyclotomic field.

*Proof route.* Use the imported rational group equalities and identify the c lattice by its chosen positive generator. Construct the `μ_N`-to-point comparison by A3 quotient/Cartier duality, checking the marked `e₁` versus `e₂` convention rather than dropping it. Compare every p-level forgetful/isogeny map with §§8.1–8.5, 8.22 and §§3.1, 3.14, 8.1; retain the field of a selected root component.

(Source: [BHW23](#references) Definitions 5.2–5.7 and Remark 5.8, pp.1741–1744, specialized to `F=ℚ.`)

*Needs:* [H0.2 Independent signs and common signs](#h02-independent-signs-and-common-signs), [H1.6 Hilbert tame level functors](#h16-hilbert-tame-level-functors), [H4.6 Arithmetic full Hilbert level](#h46-arithmetic-full-hilbert-level), [H4.8 Integral Iwahori and higher subgroup levels](#h48-integral-iwahori-and-higher-subgroup-levels); [ModularCurvesPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md) `§§3.1, 3.14, 8.1`; [ShimuraVarieties](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md) `§8.14`, `§8.15`, `§§8.9–8.13`, `§8.21`.

### H5.2 Real quadratic domains and minimal cusps

**Theorem** (`quadraticDomainBoundary`). For real quadratic F the Hilbert domains have complex dimension 2, with four independent-sign G components and two common-sign G* components. Let 𝔫 be a nonzero tame ideal coprime to the different, dividing neither 2 nor 3, and let c be coprime to 𝔫, as in Dimitrov’s `Γ₁(c,𝔫)` construction. Specialize ShimuraVarieties §8.18 (`CanonicalModel.minimal_defined_over_reflex`) to the actual canonical Hilbert open model at this `Γ₁(c,𝔫)` level, retaining the pure datum, specified complex comparison, neat-cover and finite-quotient hypotheses. Identify its boundary as the finite union of zero-dimensional cusp schemes. Over `ℚ`, the cusp indexed by its ideal data is `Spec(ℚ(ζ_e)^{H_C})`, with e the exponent of the cusp quotient b′/b and `H_C` its finite unit action. For a specified characteristic-zero field L, its base change is `Spec(L⊗_ℚ ℚ(ζ_e)^{H_C})`; retain this finite étale L-algebra, which need not be a field. In dimension two the boundary has codimension two. Toroidal boundary divisors and the divisor boundary of a product of compactified modular curves are distinct objects.

Retain Dimitrov's tame-ideal range: 𝔫 is coprime to the discriminant of F and divides neither 2 nor 3, c is prime to 𝔫, and the torsion-free moduli input of Dimitrov §3 is used. Other levels need a separate canonical finite-level comparison.

*Proof route.* Specialize H0 to two real embeddings and identify the actual canonical open at the stipulated level by H1.10 and H3.6. Import its minimal compactification from ShimuraVarieties §8.18. The specified complex Baily–Borel comparison identifies this compactification with the characteristic-zero model of Dimitrov Theorem 8.6. Apply part (iv) for the explicit cusp schemes.

**Checks.**

- Two real embeddings give complex dimension two and respectively four G-domain components and two G*-domain components.
- Each minimal cusp scheme is zero-dimensional; its codimension is two, whereas a toroidal boundary component is a divisor.
- A nontrivial `H_C` acts on `ℚ(ζ_e)`: retain its invariant field before base change. For `e=5` and `H_C={±1}`, that field is `ℚ(√5)`.
- For `e=3`, trivial `H_C` and `L=ℚ(ζ₃)`, the base-changed cusp algebra is `L×L`; replacing the tensor product by the compositum L loses a component.
- The compactification contains the same canonical open at the chosen level; an unrelated projective compactification supplies no cusp identification.

(Source: [Dim05](#references) §8, Theorem 8.6(iv), p.548; tame-ideal hypotheses in the introduction, p.525, and §3.)

*Needs:* [H0.2 Independent signs and common signs](#h02-independent-signs-and-common-signs), [H1.10 Complex Hilbert moduli comparison](#h110-complex-hilbert-moduli-comparison), [H3.6 Arithmetic Hilbert quotient](#h36-arithmetic-hilbert-quotient); [AlgebraicModuliForArithmeticGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md) `§§5.1–5.4`; [ShimuraVarieties](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md) `§§8.1–8.5, 8.18, 8.22`.

### H5.3 Hilbert Hodge splitting and descent

**Comparison** (`hodgeSplittingDescent`). In characteristic zero, `ω_A` is locally free of rank one over `O_F⊗𝒪`. Over a field L containing every embedding `F→L`, the orthogonal idempotents of `F⊗L` give `ω_A⊗L=⊕_τ ω_τ`, with each `ω_τ` an invertible sheaf. Galois permutations of the embeddings and their semilinear descent maps recover the unsplit `O_F⊗𝒪` bundle. Identify each factor on the open moduli variety with the Hodge line in the algebraic coefficient construction, by applying the polarized de Rham Hodge sequence to the universal family. Use the existing tensor, exterior power and determinant functors. At a ramified integral prime the embedding idempotents do not exist in general; use the unsplit module and its filtration. Extension over a compactification requires its own semiabelian and boundary hypotheses.

*Proof route.* Use rank-one freeness on the generic fibre and split the coefficient algebra `F⊗L`. Identify the embedding components with the Hodge lines of the universal family. Use the imported descent before splitting; contrast this with non-étale `O⊗k` at a ramified prime.

(Source: [Dia21](#references) §§3.1–3.2, pp.9–12, specialized to the characteristic-zero fibre; [BHW23](#references) §7.1, pp.1759–1760, Hodge and modified Hodge bundles.)

*Needs:* [H2.5 Rapoport locus](#h25-rapoport-locus), [H1.4 Hilbert PEL instance](#h14-hilbert-pel-instance); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A4`; Tau Ceti roadmap [AlgebraicVectorBundles, roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicVectorBundles/README.md).

### H5.4 Algebraic Hilbert weights and central units

**Theorem** (`algebraicWeightsUnits`). For a field L splitting F, take integers `(k_τ, w)` with `k_τ≡w mod 2` and `m_τ=(w−k_τ)/2`. Let `P_τ` be the rank-two de Rham factor and `N_τ=det(P_τ)`. Construct the line `⊗_τ(ω_τ^{⊗k_τ}⊗N_τ^{⊗m_τ})`, using dual powers for negative exponents. Under a scalar t its coefficient character is `∏_τ τ(t)^{k_τ+2m_τ}=Norm_{F/ℚ}(t)^w`. Prove descent through the effective central kernel exactly when this character is trivial on the scalar stabilizers of the selected level. Totally positive units have norm one; for odd w the remaining norm `−1` units must be absent or their sign action trivialized. Compare with the classical algebraic Hilbert weight convention on the open characteristic-zero variety. Nonalgebraic p-adic weights and integral ramified embedding splittings require other constructions.

*Proof route.* Fix Diamond's parity and determinant-exponent convention: `k_τ≡w (mod 2)` and `m_τ=(w−k_τ)/2`. Check the action of each central scalar on the descended coefficient line, not just on the domain. Use positivity and `Norm(η)=1` for positive units; check finite signs rather than declaring every central action trivial.

(Source: [Dia21](#references) §3.2, Definition 3.2.1 and the paritious-weight paragraph, p.12.)

*Needs:* [H5.3 Hilbert Hodge splitting and descent](#h53-hilbert-hodge-splitting-and-descent), [H3.6 Arithmetic Hilbert quotient](#h36-arithmetic-hilbert-quotient), [H4.15 Ineffective scalar level subgroup](#h415-ineffective-scalar-level-subgroup); Tau Ceti roadmap [AlgebraicVectorBundles, roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicVectorBundles/README.md).

### H5.5 Nonprincipal and ramified comparison example

**Application** (`nonprincipalRamifiedTest`). Take `F=ℚ(√10), O=ℤ[√10], c=(2,√10), N=7, p=5`. The ideal c has norm 2 and is not principal: a generator would have norm±2, impossible modulo 5. The prime p ramifies since `disc(F)=40`, while c and N are prime to p. Construct `L_c` and its dual c `L_c`, the DP model and its Rapoport/ordinary locus with this label. Over a splitting field `ω` has two lines; over the ramified residue base this splitting is not imposed.

*Proof route.* Compute O, disc(F), the quotient O/c and the norm-form congruence `a²−10b²=±2`. Apply H0’s trace-dual formula with the genuine nonprincipal ideal. Apply the arbitrary-prime H2 model with 5∤7 and verify that it does not assert global smoothness or integral embedding splitting.

(Source: [BHW23](#references) Notation 5.1(3), p.1740, and §5.1.2, p.1744; explicit norm and ramification calculations for `ℚ(√10)`; [DP94](#references) Theorem 2.2, p.64, for the integral model used in the example.)

*Needs:* [H0.5 Trace-dual lattice and its stabilizer](#h05-trace-dual-lattice-and-its-stabilizer), [H2.9 Polarization representatives at bad primes](#h29-polarization-representatives-at-bad-primes), [H2.6 Ordinary locus and its Rapoport inclusion](#h26-ordinary-locus-and-its-rapoport-inclusion), [H5.3 Hilbert Hodge splitting and descent](#h53-hilbert-hodge-splitting-and-descent).

### Examples

Take `F=ℚ(√10), O=ℤ[√10], c=(2,√10), N=7` and `p=5 (§H5.5): c` is not principal, since a generator would have norm ±2, which is impossible modulo 5; `p=5` ramifies because `disc(F)=40`. Over a splitting field `ω` has two lines; over the ramified residue base no splitting is imposed.

### Dependencies

This layer uses earlier layers H0, H1, H4, H3, H2; AbelianSchemesAndArithmeticModuli (A4); AlgebraicModuliForArithmeticGeometry (§§5.1–5.4); ModularCurvesPartII (§§3.1, 3.14, 8.1); ShimuraVarieties (§§8.1–8.5, 8.22); the Tau Ceti roadmaps AlgebraicVectorBundles.

## Layer H6: Paired torsion twists and local realizations

Construct the paired Isom torsors and descend the fine moduli space and its family. A selected component has a field of definition. Local nonemptiness is a theorem about the explicitly constructed abelian variety and its markings, under the stated CM and finite-flat hypotheses.

### H6.1 Simultaneous torsion Isom torsor

**Definition** (`HilbertTorsionIsomTorsor`). Let K be a characteristic-zero field and `ℓ₁≠ℓ₂` distinct odd primes, with paired torsion markings at levels `𝔫₁, 𝔫₂`. Each `𝔫_i` is either the full level `ℓ_iO` or, as in Taylor's construction (§H6.5), a prime ideal of O above `ℓ_i` that is unramified over `ℓ_i`. A retained extra tame marking is prime to `ℓ₁ℓ₂`. In the elliptic specialization the two full odd torsion levels themselves supply a fine marking, and a prime level unramified over an odd `ℓ_i` is rigidifying as well, since the kernel of `GL₂(O_{𝔫_i})→GL₂(O/𝔫_i)` has no nontrivial element of finite order. For `i=1,2` let `V_i` be a finite étale `G_K`-module locally free of rank 2 over `O/𝔫_i`, equipped with a perfect alternating pairing `∧²V_i≅(c d⁻¹/𝔫_ic d⁻¹)⊗μ_{ℓ_i}`. Define the symplectic O-linear Isom torsor from the standard torsion module with its matching pairing to `V_i`, and take their product. Its finite structural group is the product of the two symplectic automorphism groups; it need not be commutative.

*Construction.* Construct the finite étale sheaf of actual pairing-preserving O-module isomorphisms. Use the given determinant/pairing identity to ensure the torsor exists locally and identify its structural group. Keep the product cocycle and its pairing target, rather than only the abstract representation dimensions.

Its API:

- `HilbertTorsionIsomTorsor`: The product of the actual finite pairing-preserving Isom torsors.
- `torsionIsomTorsor_points`: Sections are precisely the two O-linear symplectic identifications.
- `torsionIsomTorsor_baseChange`: The torsor pulls back with `V_i` and their actual pairing targets.
- `torsionIsomTorsor_cocycle`: A splitting-field frame gives the cocycle `σ↦frame⁻¹σ(frame)`, and changing the frame gives a cohomologous cocycle.
- `torsionIsomTorsor_ext`: Two sections of the simultaneous Isom torsor agree if both underlying `O/𝔫_i`-linear maps agree; pairing-preservation proofs add no extra data.

**Checks.**

- `torsionTorsor_trivial`: For the standard paired modules with fixed frames, the torsor has a rational section and the twist is untwisted.
- `torsionTorsor_determinant`: A two-dimensional representation whose determinant is not the required cyclotomic pairing character has no equivariant paired Isom section.
- `torsionTorsor_coboundary`: Changing both splitting frames by group elements leaves the descended twist canonically isomorphic.

(Source: [Tay02](#references) §1, p.13, simultaneous torsion moduli.)

*Needs:* [H1.8 Linearized Hilbert Weil pairing](#h18-linearized-hilbert-weil-pairing), [H4.2 Hilbert full-level pairing multiplier](#h42-hilbert-full-level-pairing-multiplier); [AlgebraicModuliForArithmeticGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md) `§3.5`.

### H6.2 Twisted Hilbert torsion moduli

**Construction** (`TwistedHilbertTorsionModuli`). Twist the fine paired `level-(𝔫₁, 𝔫₂)` Hilbert moduli and its universal HBAV by the inverse action of the actual paired torsion Isom torsor. The descended K-space classifies `(A, ι, λ, μ_N, α₁, α₂)` when the Hilbert tame marking is retained, and `(A, ι, λ, α₁, α₂)` when the torsion levels themselves supply the fine marking. In both cases `α_i:V_i≅A∨[𝔫_i]` preserves the c d⁻¹-valued pairing. Over a splitting field it is isomorphic to the untwisted paired `level-(𝔫₁, 𝔫₂)` space. This construction uses effective finite noncommutative descent, not the commutative-Γ torsor twist `torsorTwistSpace` of AlgebraicModuliForArithmeticGeometry §4.5.

*Construction.* Construct the characteristic-zero fine `level-(𝔫₁, 𝔫₂)` torsion moduli using M1/M2 and its actual complex component from M3. For the retained Hilbert `μ_N` convention compare with H4; for Allen’s elliptic specialization use the two full odd torsion levels as the fine marking, without an independent `μ_N` datum. Form the contracted product with the inverse/right-versus-left action. Before descent, restrict an ample line from the projective normal minimal compactification of ShimuraVarieties §8.18 to the untwisted fine moduli. Verify the actual canonical open model, pure Hilbert datum and fixed level of H1.10 and H4, passing to a neat cover and taking its finite quotient for a nonneat fixed level. Tensor the conjugates of this line over the finite splitting field and give the explicit permutation cocycle. Apply `finiteEtaleAmpleDescent` (§H2.2a) to descend the open scheme along the possibly noncommutative Isom torsor. Descend the polarized universal abelian family separately using AlgebraicModuliForArithmeticGeometry §3.5. Verify the moduli universal property by twisting the paired frames in both directions.

Its API:

- `TwistedHilbertTorsionModuli`: The descended simultaneous paired torsion moduli space.
- `twistedHilbertModuli_points`: T-points correspond to the stipulated HBAV and paired `α_i` data.
- `twistedHilbertModuli_split`: A splitting field and chosen paired frames identify the twist with the untwisted `level-(𝔫₁, 𝔫₂)` moduli.
- `twistedHilbertModuli_universal`: The fine universal HBAV descends through the verified cocycle and pulls back to the untwisted family.

**Checks.**

- `twist_trivial`: The trivial framed torsor yields the original fine moduli and family.
- `twist_pairing`: An unpaired abstract `GL₂` torsor can mix Weil-pairing components and is not as this twist.
- `twist_frame_change`: A cohomologous frame cocycle yields an isomorphism preserving the universal moduli interpretation.

(Source: [Tay02](#references) §1, p.13, moduli quintuple and smoothness.)

*Needs:* `finiteEtaleAmpleDescent` (§H2.2a); ShimuraVarieties §8.18 (`CanonicalModel.minimal_defined_over_reflex`, with the actual canonical fixed-level open model and its pure Hilbert datum); [H6.1 Simultaneous torsion Isom torsor](#h61-simultaneous-torsion-isom-torsor), [H4.1 Hybrid full Hilbert level](#h41-hybrid-full-hilbert-level), [H4.3 Scalar-similitude geometric full level](#h43-scalar-similitude-geometric-full-level); [AlgebraicModuliForArithmeticGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md) `§3.5`; [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M1.9`, `M2.8`, `M3.6`; Mathlib `AlgebraicGeometry.Scheme`.

### H6.3 Selected component descent and irreducibility

**Theorem** (`twistedComponentDescent`). Choose a geometric paired-multiplier and narrow-class component of the twisted full-level variety. Its label has a finite Galois orbit, so the component descends to its finite field of definition `K_C`; it descends to K when that label is `G_K`-fixed. The descended component is smooth of dimension g and geometrically irreducible, and the fine universal HBAV restricts to it. Use the ample line and its conjugate-tensor cocycle constructed before descent in §H6.2. This proves that the component is a quasi-projective `K_C`-scheme. A point over a splitting field alone does not show that the component label is `G_K`-fixed.

*Proof route.* Use the exact multiplier/component labels and their Galois action to compute the stabilizer field. Use the complex quotient by the connected symmetric domain and DP’s normal connected-fibre result to obtain geometric irreducibility of the chosen component. Descend smoothness and the fine universal family; obtain quasi-projectivity through the actual ample-line supplier and norm/descent along `K_C`.

**Checks.**

- A `G_K`-fixed label descends to K; a label with a nontrivial orbit requires its stabilizer field `K_C`.
- The elliptic specialization is an open modular curve, and its ample-line descent does not require properness of the open curve.
- At nonneat fixed level, the finite quotient of the neat projective minimal model supplies the containing projective model; uniqueness of the open model alone gives no ample line.
- Over an algebraic closure the paired Isom torsor is trivial, so the selected twisted component is isomorphic to its untwisted component and remains geometrically irreducible even when the residual image is soluble.

(Source: [DP94](#references) §2.4, p.65, geometric irreducibility after Stein factorization; quasi-projectivity uses the canonical open immersion into the projective normal minimal compactification of ShimuraVarieties §8.18 (`CanonicalModel.minimal_defined_over_reflex`); [Tay02](#references) §1, p.13, fine simultaneous torsion moduli and connectedness.)

*Needs:* `finiteEtaleAmpleDescent` (§H2.2a); ShimuraVarieties §8.18 (`CanonicalModel.minimal_defined_over_reflex`, with the actual canonical fixed-level open model and its pure Hilbert datum); [H6.2 Twisted Hilbert torsion moduli](#h62-twisted-hilbert-torsion-moduli), [H4.12 Full and connected component comparisons](#h412-full-and-connected-component-comparisons), [H1.10 Complex Hilbert moduli comparison](#h110-complex-hilbert-moduli-comparison); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A2`; [AlgebraicModuliForArithmeticGeometry](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md) `§3.5`.

### H6.4 Real torsion points with polarization signature

**Theorem** (`realTorsionPoints`). At a real place of `K_C`, require the prescribed `V_i` to have the polarization-compatible odd involution: in a real split `O/ℓ_i` frame, complex conjugation has one+ and `one−` eigendirection and reverses the cyclotomic pairing. If the chosen component’s real signature is compatible, the real HBAV obtained from the ordered trace-polarized real analytic lattice gives paired torsion identifications and a real point on that component. The real local locus is a nonempty open around it. Even residual modules or a mismatched component are not covered.

*Proof route.* Use the ordered module and trace sign to construct the real polarized complex torus with its real involution. Apply A5 algebraicity and compute the torsion conjugation eigenspaces and alternating pairing. Match the prescribed paired frames and the selected component label; use smoothness for the real open.

**Checks.**

- For `F=ℚ` and odd ℓ, a real elliptic curve has one `+1` and one `−1` torsion eigendirection, with cyclotomic determinant `−1`.
- For odd ℓ, the involution `+I₂` has determinant `1` and cannot reverse a perfect alternating pairing with cyclotomic conjugation action `−1`.
- A geometric component whose label is moved by complex conjugation has no real point; the component label must satisfy the real compatibility hypothesis.

(Source: [Tay02](#references) Lemma 1.4, internal p.13, real HBAV construction.)

*Needs:* [H6.3 Selected component descent and irreducibility](#h63-selected-component-descent-and-irreducibility), [H0.4 Integral trace polarization family](#h04-integral-trace-polarization-family), [H1.1 Ordered polarization module](#h11-ordered-polarization-module); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A5`.

### H6.5 Finite local Hilbert torsion points

**Theorem** (`hilbertFiniteLocalPoints`). Under the input contract (C1)–(C6) below, the twisted moduli space X of Taylor's construction has points over the completions of the base field at every place above the two auxiliary characteristics l and p. The points come from explicitly constructed HBAVs (O1)–(O4); no other local Galois module is claimed to be realizable. Notation: the base field is a totally real field K (Taylor's F). The field of real multiplication is the totally real field M of (C5), so the F, O and g of H0–H4 are M, `O_M` and `[M:ℚ]` here. Frobenius elements are arithmetic, `ε` is the mod-l cyclotomic character and `ε_p` the p-adic one.

*Input contract.*

- (C1) **Residual data.** l is an odd prime, `k/𝔽_l` is finite, and `ρ̄:G_K→GL₂(k)` is continuous with `det ρ̄=ε` globally, and supplied with a perfect `G_K`-equivariant alternating pairing `a_λ:∧²V_λ≅k(1)`. Thus `det ρ̄(c)=−1` for every complex conjugation c. At each place v|l there is a continuous character `χ_v:G_v→k^×` such that `ρ̄|_{G_v}` is an extension of `χ_v` by `εχ_v⁻¹`; the extension class may be zero. The local-point theorem assumes (C1)–(C6); no insolubility hypothesis is needed for these local constructions.
- (C2) **Weil numbers at l.** Let `ζ` be a primitive `(#k^×)-th` root of unity and `π_l=(1+√(1−4l))/2`. Then `π_l` is a root of `X²−X+l`, so it is an ordinary Weil l-number. Put `N₀=ℚ(ζ,√(1−4l))`. The prime l is unramified in `N₀` and its residue fields there are isomorphic to k; fix `λ₀|l` in `N₀` with `O_{N₀}/λ₀≅k`, and choose the square root `√(1−4l)` so that `π_l` is a unit at `λ₀`. Since `π_lπ_l^c=l` and `π_l+π_l^c=1`, exactly one of `π_l, π_l^c` lies in `λ₀`; with the other choice every `β_v` below would lie in `λ₀`, and no `b_v` could match the nonzero residue `χ_v(φ_v)`. For v|l choose a totally tamely ramified Galois extension `F̃_v/K_v` of minimal degree over which `χ_v` is unramified, and include this field and a Frobenius lift `φ_v∈G_{F̃_v}` in the input data. Require transport of the construction between choices after passage to a common extension. Put `f_v=[k(v):𝔽_l]` and `q_v=#k(v)`. Put `β_v=ζ^{b_v}π_l^{f_v}`, with `b_v` chosen so that `β_v≡χ_v(φ_v) mod λ₀`; then `β_vβ_v^c=q_v`. Let `χ̃_v:W_{K_v}→N₀^×` be the Teichmüller lift of `χ_v` when `χ_v²=1`. When `χ_v²≠1`, let `χ̃_v` be the character that sends `φ_v` to `β_v` and is the Teichmüller lift of `χ_v` on inertia.
- (C3) **The auxiliary prime.** `p≠l` is an odd prime satisfying four conditions. At every `w|p, ρ̄` is unramified and `ρ̄(Frob_w)` has distinct eigenvalues, which lie in k. p splits completely in the Hilbert class field of `N₀`. p splits completely in K, so that `K_w=ℚ_p`; the global determinant condition gives `det ρ̄(Frob_w)=p` in k. Finally p is prime to `β_v−β_v^c` for every v|l. Fix a prime `℘₀` of `N₀` above p. For each w|p choose `α′_w` in the ring of integers of `ℚ(π_l)`, of norm p and prime to `℘₀`. It exists because p splits completely in the Hilbert class field of `ℚ(π_l)`, which lies in that of `N₀`; the order `ℤ[π_l]` equals that ring of integers only when `1−4l` is squarefree. Then put `α_w=ζ^{a_w}α′_w` with `a_w` chosen so that `α_w` is congruent modulo `λ₀` to an eigenvalue of `ρ̄(Frob_w)`.
- (C4) **The CM character.** L/K is a totally imaginary quadratic extension not contained in `K(ζ_p)`, in which each v|l splits as `v₁v₁^c` and each w|p as `w₁w₁^c`. The character `ψ:G_L→(N̄_{0,℘₀})^×` is continuous, with `det Ind_{G_L}^{G_K}ψ=ε_p`. Its reduction `ψ̄` agrees with `χ̃_v` modulo `℘₀` on `W_{L_{v₁}}=W_{K_v}`. The restriction `ψ|_{G_{w₁}}` is unramified, and `ψ̄` sends `Frob_{w₁}` to `α_w mod ℘₀`. Taylor's Lemma 1.1 constructs such L and `ψ`. Write `ψ̄_{v₁}` and `ψ̄_{v₁^c}` for the restrictions of `ψ̄` to the two places above v, both viewed as characters of `G_v`; then `ψ̄_{v₁}ψ̄_{v₁^c}=ε̄_p` on `G_v`, and, when `χ_v²≠1`, the condition `p∤β_v−β_v^c` gives `ψ̄_{v₁}≠ψ̄_{v₁^c}` by evaluating on `φ_v`. When `χ_v²=1`, put `a=ψ̄_{v₁}`. Then `a²=1` and `ψ̄_{v₁^c}=ε̄_p a⁻¹`, so `ψ̄_{v₁}≠ψ̄_{v₁^c}` if and only if `q_v≢1 mod p`, since `ε̄_p` is unramified at v with arithmetic Frobenius value `q_v mod p`. Distinctness is not required for local points.
- (C5) **The coefficient CM field.** `N/N₀` is a Galois CM extension in which the primes above l split and the primes above p are unramified, and `℘|℘₀` is a prime of N such that `ψ̄` takes values in `O_N/℘`. Fix `λ|λ₀` in N and let M be the maximal totally real subfield of N, with `λ_M=λ∩O_M` and `℘_M=℘∩O_M`. Since `√(1−4l)∈N₀` is not real, `N=M(√(1−4l))`. The number `1−4l` is a square at every prime above l (it is `≡1 mod l`) and above p (p splits in `ℚ(√(1−4l))`), so `λ_M` and `℘_M` split in N, and `O_M/λ_M≅k`.
- (C6) **Ordered class condition.** The norm map from the class group of N to the narrow class group of M is surjective. This holds whenever N/M is ramified at some finite place, because the narrow Hilbert class field of M then meets N only in M. It is used in (O2) and (O3) to make the polarization module isomorphic to `O_M` as an ordered module. A weaker condition suffices: the narrow class of the polarization module produced there lies in the image of the norm.

An M-HBAV over a field is a triple (A, i, j). Here A is an abelian variety of dimension `[M:ℚ], i:O_M↪End(A)`, and j is an ordered isomorphism from the standard ordered module `O_M^+` onto the module P(A, i) of symmetric `O_M`-linear maps `A→A^∨`, ordered by its polarizations. These are the objects of §H1.3 with `c=O_M`. Let `V_λ` be the `O_M/λ_M`-vector space scheme of `ρ̄` and `V_℘` the `O_M/℘_M`-vector space scheme of `Ind_{G_L}^{G_K}ψ̄`, each with a fixed alternating isomorphism `a_λ, a_℘` to its Cartier dual. The moduli space X/K classifies `(A, i, j, m_λ, m_℘)`, where `m_λ:V_λ≅A[λ_M]` and `m_℘:V_℘≅A[℘_M]` carry `a_λ, a_℘` to the j(1)-Weil pairings. X is the prime-level case `𝔫₁=λ_M, 𝔫₂=℘_M` of §H6.2, with `A[𝔫_i]` and `A^∨[𝔫_i]` identified through j(1); both primes are unramified in M. It is fine because `λ_M` is unramified over the odd prime l, so the kernel of `GL₂(O_{M,λ_M})→GL₂(O_M/λ_M)` has no nontrivial element of finite order. It is smooth and geometrically connected.

*Conclusions.*

- (O1) **Multiplicative case: v|l with `χ_v²=1`.** There is an M-HBAV `(A_v, i_v, j_v)` over `K_v` with potentially multiplicative reduction, `A_v[λ_M]≅ρ̄|_{G_v}` and `A_v[℘_M]≅ψ̄_{v₁}⊕ψ̄_{v₁^c}`. A quadratic twist through `[−1]∈O_M^×` twists both torsion modules by `χ_v`, so one may take `χ_v=1`; the two characters `ψ̄_{v₁}` and `ψ̄_{v₁^c}` then become 1 and `ε̄_p`. The extension class of `ρ̄|_{G_v}` is a class `q̄∈H¹(G_v, k(ε))≅K_v^×⊗_ℤ𝔡_M⁻¹/λ_M𝔡_M⁻¹`. Choose `q₀∈K_v^×⊗℘_M𝔡_M⁻¹` reducing to q̄; this is possible because `℘_M` and `λ_M` are coprime. Then choose `q₁∈K_v^×⊗℘_Mλ_M𝔡_M⁻¹` so that the valuation of `q=q₀q₁` is totally positive in `𝔡_M⁻¹`. Let `A_v` be the Tate HBAV with `A_v(K̄_v)≅(K̄_v^×⊗𝔡_M⁻¹)/q^{O_M}` as `O_M[G_v]`-modules. Its `λ_M`-torsion is the extension of k by `k(ε)` with class q̄. Its `℘_M`-torsion splits as `(μ_p⊗𝔡_M⁻¹/℘_M𝔡_M⁻¹)⊕O_M/℘_M`, because q lies in the `℘_M`-divisible part.
- (O2) **Ordinary case: v|l with `χ_v²≠1`.** There is an M-HBAV over `K_v` with potentially good ordinary reduction (good over `F̃_v`) and the same two torsion identifications. It is built in four steps.
  - Honda–Tate gives a simple ordinary `A₀/k(v)` of dimension `[ℚ(β_v):ℚ]/2` with `End(A₀)≅O_{ℚ(β_v)}` and Frobenius `β_v`. Its Verschiebung is `β_v^c`, so `A₀[β_v^c](k̄)≅O_{ℚ(β_v)}/(β_v^c)`, and `A₀[l](k̄)≅O_{ℚ(β_v)}/(l, β_v^c)` is supported at the primes where `β_v` is a unit. Taylor writes `O_{ℚ(β_v)}/(β_v^c)` for the l-torsion; the two agree only when `f_v=1`, and only the support is used below.
  - The Serre tensor `A₁=A₀⊗_{O_{ℚ(β_v)}}O_N` (with `ℚ(β_v)⊂N₀⊂N`) has `i₁:O_N↪End(A₁)` and an ordinary Frobenius `β_v`. A polarization of `A₀` together with the pairing `(a, b)↦tr_{N/ℚ(β_v)}(ab^c)` gives a polarization `μ₁` whose Rosati involution is complex conjugation.
  - The symmetric `O_M`-linear maps `A₁→A₁^∨` form `a∩M` for a fractional ideal a of N, ordered by total positivity. Replacing `A₁` by `A₁/A₁[b]` for an ideal b of N replaces `a∩M` by `abb^c∩M`, so by (C6) one can arrange `P(A₁, i₁|O_M)≅O_M^+`, which gives an M-HBAV `(A₁, i₁|O_M, j₁)`.
  - Lift and descend. By Serre–Tate theory, lifts of `(A₁, i₁|O_M, j₁)` to `O_{F̃_v}` correspond to classes in `H¹_f(G_{F̃_v}, O_{M,l}(ε(χ̃′_v)⁻²))`. Here `χ̃′_v` is the unramified extension of `χ̃_v|_{W_{F̃_v}}`, valued in `O_{N,(β_v^c)}^×≅O_{M,l}^×`, and `H¹_f` is the whole of H¹ because `(χ̃′_v)²` has infinite order. Triples over `K_v` that restrict to such a lift correspond to pairs `(χ′, x): χ′:G_v→O_{M,l}^×` agrees with `χ̃_v` on `W_{F̃_v}`, and x is a `Gal(F̃_v/K_v)`-invariant class. The descent data come from the automorphisms `i₁(γ)` with `γγ^c=1`, which act on classes through `γ²`. Take `χ′=χ̃_v` and choose `x∈H¹(G_v, O_{M,l}(εχ̃_v⁻²))` whose λ-component reduces to the class of `ρ̄|_{G_v}`. Such an x exists because `H²(G_v, O_{M,λ}(εχ̃_v⁻²))=0`: it is dual to `H⁰(G_v, (M_λ/O_{M,λ})(χ̃_v²))`, which vanishes since `χ_v²≠1`.

  The `λ_M`-torsion is then `ρ̄|_{G_v}`. The `℘_M`-torsion is étale. It splits into the ℘-line and the `℘^c`-line: Frobenius acts on them by `β_v` and `β_v^c`, and inertia by the Teichmüller lift of `χ_v` and its inverse, through the descent datum `γ` with `γγ^c=1`. These are `ψ̄_{v₁}` and `ψ̄_{v₁^c}=ε̄_pψ̄_{v₁}⁻¹`.

- (O3) **The auxiliary characteristic: w|p.** There is an M-HBAV over `K_w=ℚ_p` with good ordinary reduction, `A_w[λ_M]≅ρ̄|_{G_w}` and `A_w[℘_M]≅ψ̄_{w₁}⊕ψ̄_{w₁^c}`. Taylor leaves this case to the reader. The route is (O2) with `α_w` in place of `β_v` and no descent step: Honda–Tate over `𝔽_p` with Frobenius `α_w`, the Serre tensor to `O_N`, the class adjustment by (C6), and the canonical Serre–Tate lift, the one with split extension class. The `λ_M`-torsion is unramified with Frobenius eigenvalues `α_w` and `α_w^c mod λ`. These are the two distinct eigenvalues of `ρ̄(Frob_w)`, since `α_wα_w^c=p=det ρ̄(Frob_w)` in k. The `℘_M`-torsion is the sum of the étale and multiplicative parts of the canonical lift. Because `α′_w` is prime to `℘₀`, the étale part has Frobenius `α_w mod` ℘ and is `ψ̄_{w₁}`; the multiplicative part is `ε̄_pψ̄_{w₁}⁻¹=ψ̄_{w₁^c}`.
- (O4) **Matching the fixed pairings.** Each HBAV of (O1)–(O3) gives a `K_x`-point of X once the torsion identifications carry `a_λ` and `a_℘` to the Weil pairings. A residual module with a chosen direct-sum decomposition into two character lines has diagonal automorphisms of every determinant, including when the characters coincide, so every alternating form on it is matched. This covers the `℘_M`-parts, `ρ̄|_{G_w}`, and `ρ̄|_{G_v}` when it is split. On a nonsplit `λ_M`-part at v|l every automorphism has square determinant. For distinct graded characters it is scalar; for a self-extension it has the form `aI+bN`, where `N²=0`, with determinant a². The condition `χ_v²=1` does not force distinct graded characters when `K_v` contains `μ_l`. There one rescales the chosen extension class by a unit u: q̄ in (O1), the λ-component of x in (O2). The module is unchanged up to an isomorphism of determinant u, the Weil pairing on its graded pieces is unchanged, and so the pulled-back form is multiplied by u. Taylor compresses this step into the remark that the alternating forms are equivalent. Together with the real points of §H6.4, this gives `X(K_x)≠∅` at every place x of K above l, p and `∞`.

Nothing is asserted at other places, for other residual modules, or for local modules outside the shapes in (C1).

*Proof route.* Follow the conclusions. (O1) uses Kummer theory and the Tate HBAV of Rapoport §2.9. (O2) uses Honda–Tate, the Serre tensor, the class-group adjustment, Serre–Tate lifting through `H¹_f`, and Galois descent from `F̃_v`. (O3) is the same without descent, and (O4) is the rescaling argument. The Honda–Tate input is stated here as the structured ordinary CM instance that is needed: a simple ordinary abelian variety over a finite field with prescribed CM Weil number and maximal-order endomorphisms, whose l-torsion is computed from its Frobenius. For the Tate HBAV, the algebraization of the rigid quotient by a lattice with totally positive valuation pairing, and its polarization module, are Rapoport §2.9.4–2.9.6. The general polarized rigid uniformization is in NeronModelsAndSemistableAbelianVarieties §3.14.

**Checks.**

- Over `K=ℚ`, `l=3`, `ρ̄=diag(εδ,1)` with δ the even quadratic character of ℚ(√13) has the stated local shape at 3 but fails the global pairing input `det ρ̄=ε`.
- `hilbertSelfExtension_unipotent`: Over ℚ₃(ζ₃), a nonsplit unipotent self-extension has nonscalar automorphisms `I+bN`, all of determinant one; arbitrary alternating pairings still require extension-class rescaling.
- For a ramified quadratic character over ℚ₅, both ℚ₅(√5) and ℚ₅(√10) are minimal-degree tame choices killing its ramification; neither is a distinguished smallest field.
- Take `l=7`, `k=𝔽₇`, `K=ℚ(α)` with `α³−3α+1=0`, `p=19`, and `ρ̄=diag(ε̄₇,1)`. The polynomial has discriminant 81, no root modulo 7 and roots 3, 7, 9 modulo 19; thus K is totally real, 7 is inert and 19 splits completely. At each `w|19` the residual eigenvalues are 5 and 1. Here `χ_v=1`, `q_v=343≡1 mod 19`, and `N₀=ℚ(√−3)` has class number one with 19 split. Choose `π₇=(1+3√−3)/2` unit at `λ₀` and `b_v=0`. Then `β_v=−10−9√−3` has distinct reductions 7 and 11 at the primes over 19, yet `ψ̄_{v₁}=ψ̄_{v₁^c}=1`. The quadratic branch therefore need not have distinct characters even under (C3); rescaling either chosen line still adjusts any alternating pairing.

(Source: [Tay02](#references) §1, pp.6–10, for the residual data, the Weil numbers and the auxiliary prime, Lemma 1.1 and the choice of `L, ψ, N` and M; Lemma 1.2 and proof, pp.10–12; Lemma 1.3, p.12; and the moduli space and its local points, p.13. [Rap78](#references) §§2.9.1–2.9.6, pp.273–274, for the Tate HBAV, its torsion and its polarization module.)

*Needs:* [H6.3 Selected component descent and irreducibility](#h63-selected-component-descent-and-irreducibility), [H6.1 Simultaneous torsion Isom torsor](#h61-simultaneous-torsion-isom-torsor), [H6.4 Real torsion points with polarization signature](#h64-real-torsion-points-with-polarization-signature), [H1.3 Ordered c-polarization](#h13-ordered-c-polarization); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A4`, `A2`, `A3`; [FiniteFlatGroupsAndIntegralPadicHodgeTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md) `R07.4.20–R07.4.24`, `R07.6.8`; [NeronModelsAndSemistableAbelianVarieties](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md) `§3.14`; [ArithmeticGaloisDuality](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticGaloisDuality/README.md) `D7.4`; Tau Ceti roadmap [ClassFieldTheory, layer 12 separate arithmetic global existence the norm index and the global correspondence](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence); Tau Ceti `NumberField.NarrowClassGroup.instFinite`.

### H6.6 Allen elliptic twists and Weil restriction

**Construction** (`AllenEllipticTwist`). Under Allen Assumption 7.2.6 (`ℓ₂` splitting in the coefficient fields; the two residual images containing `SL₂`; `ℓ₁,ℓ₂` unramified in F, outside each `S_i`, of good reduction for E, and `>2m_i+3`), put `K=FF₁⁺` and fix `r_i′` with determinant `ε_{ℓ₂}^{−1}`. Define `Y_i/K` to classify elliptic D with symplectic `α₁:E[ℓ₁]≅D[ℓ₁]` and `α₂:V_{r_i′}∨≅D[ℓ₂]`. This is the paired elliptic specialization of the simultaneous Isom-torsor twist; its selected geometric component is a smooth geometrically irreducible curve. The second residual module is dualized so its pairing has cyclotomic multiplier.

*Construction.* Specialize the paired simultaneous torsion twist to `F=ℚ`. Dualize `V_{r_i′}` so its determinant and alternating pairing have cyclotomic multiplier, and use the stipulated symplectic identifications. Use the fine full-level elliptic moduli at the two distinct odd auxiliary primes, and the selected fixed-pairing component. Over a splitting field this component is the connected modular curve, hence is smooth, geometrically irreducible and one-dimensional. No independent `μ_N` marking is stored in `Y_i`; the two full odd torsion identifications already eliminate elliptic automorphisms. Apply the finite noncommutative descent required, under the supplier contracts, for the twist and the component. Weil restriction is the separate [H6.7 Allen restriction of torsion moduli](#h67-allen-restriction-of-torsion-moduli), not part of this construction.

Its API:

- `AllenEllipticTwist`: The symplectic elliptic moduli `Y_i`.
- `allenElliptic_points`: Points are D with the two stipulated paired torsion isomorphisms.
- `allenElliptic_split`: Over a splitting field it is the compatible Weil-multiplier component of the full elliptic level moduli.

**Checks.**

- `allen_dual`: The undualized second module has inverse cyclotomic determinant and generally fails the pairing condition.
- `allenElliptic_dimension`: `Y_i` has dimension 1.
- `allenElliptic_trivial`: When both paired modules are torsion of one elliptic curve, that curve with identity maps gives a point.

(Source: [ACC+23](#references) §7.2.5, published pp.1103–1106.)

*Needs:* [H6.2 Twisted Hilbert torsion moduli](#h62-twisted-hilbert-torsion-moduli), [H6.3 Selected component descent and irreducibility](#h63-selected-component-descent-and-irreducibility), [H5.1 Rational modular-curve comparison](#h51-rational-modular-curve-comparison); Mathlib `AlgebraicGeometry.Scheme`.

### H6.7 Allen restriction of torsion moduli

**Construction** (`AllenRestrictionModuli`). For `K=FF₁⁺, k=F⁺F₁⁺` in Allen §7.2.5, define `X_i=Res_{K/k}Y_i` using A6’s quasi-projective finite-separable restriction of scalars. It is smooth and geometrically irreducible of dimension `[K:k]=2`. The universal family on `Y_i` gives an abelian-family restriction comparison over `X_i`. At a real place, `X_i(ℝ)=Y_i(ℂ)`, so this CM case requires no real odd involution.

*Construction.* Specialize the actual paired torsion twist to `F=ℚ` and use `V_{r_i′}∨` so its determinant is `ε_{ℓ₂}`. Use A6 finite-separable Weil restriction of the quasi-projective scheme `Y_i`. Use the splitting-product comparison to compute smoothness, dimension and geometric irreducibility; do not repeat the generic Weil-restriction theorem.

Its API:

- `AllenRestrictionModuli`: `X_i=Res_{K/k}Y_i`.
- `allenTwist_points`: `X_i(L)=Y_i(K⊗_k L)`.
- `allenTwist_split`: Its geometric base change is the product of the conjugate `Y_i`.
- `allenRestriction_family`: The finite-étale A6 restriction of the pulled-back elliptic family has relative dimension [K:k].

**Checks.**

- `allen_dimension`: For the quadratic CM extension, `X_i` has dimension 2.
- `allen_real`: For a real place of `k, K⊗_k ℝ≅ℂ` and `X_i(ℝ)=Y_i(ℂ)`.
- `allen_restriction_split`: For `K=k` the restriction is `Y_i` itself.

(Source: [ACC+23](#references) §7.2.5, published pp.1103–1106.)

*Needs:* [H6.6 Allen elliptic twists and Weil restriction](#h66-allen-elliptic-twists-and-weil-restriction); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A6.30`, `A6.31`, `A6.32`; Mathlib `AlgebraicGeometry.Scheme`.

### H6.8 Allen finite local elliptic points

**Theorem** (`allenFiniteLocalPoints`). Retain Allen’s auxiliary-prime and local finite-flat hypotheses. Above `L₀∪{ℓ₁}`, use E after a finite unramified extension whose Frobenius powers match the two paired residual modules. Above `ℓ₂`, when the residual dual is the prescribed supersingular finite-flat type or a peu-ramifié ordinary extension, construct a good-reduction D after a finite unramified extension and pair both torsion identifications. In the ordinary case lift the negative residual extension class using Lemma 7.2.2 and Serre–Tate. For supersingular D descended from `𝔽_{ℓ₂}`, Frobenius over k(w) uses its residue degree: its squared scalar is `(−ℓ₂)^{[k(w):𝔽_{ℓ₂}]}`, not universally `−ℓ₂`.

*Proof route.* At places away from `ℓ₂` choose a common finite unramified extension killing the finite Frobenius discrepancies while preserving the pairing determinant. In the supersingular case choose the compatible finite-flat local type and compute the Frobenius scalar with the actual residue degree; enlarge the unramified degree until the `prime-to-ℓ₂` torsion matches. In the ordinary case choose an ordinary reduction and kill its finite residual unramified characters; use the `H_f` lift surjectivity and the negative class to obtain the dual residual extension. Check the component/pairing and good reduction at every place; use the precise local finite-flat classification and Serre–Tate input rather than assuming every residual module is realized.

(Source: [ACC+23](#references) §7.2.5, published pp.1104–1105; Lemma 7.2.2, published pp.1098–1099; [ACC+23](#references) Lemma 7.1.8(1), pp.1091–1092, with `ℤ_l` coefficients and unramified base; the connected–étale refinement is on p.1105.)

*Needs:* [H6.6 Allen elliptic twists and Weil restriction](#h66-allen-elliptic-twists-and-weil-restriction), [H6.7 Allen restriction of torsion moduli](#h67-allen-restriction-of-torsion-moduli); [AbelianSchemesAndArithmeticModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md) `A4`; [FiniteFlatGroupsAndIntegralPadicHodgeTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md) `R07.4.20–R07.4.24`, `R07.6.8`.

### H6.9 Geometric and local input export

**Application** (`moretBaillyInputExport`). Supply for potential modularity the selected smooth geometrically irreducible quasi-projective `K_C`-scheme, its dimension, field of definition, fine universal family and all constructed nonempty real/finite local opens with their exact local extension and reduction conditions. In the Allen case export `X_i` over k and the corresponding Weil-restriction family, with dimension [K:k]. Moret–Bailly is a downstream theorem consuming these witnesses; it is not a prerequisite proving their existence.

*Proof route.* Assemble the verified component and local constructions into one typed export with all fields and opens. Check every local open refers to that component and base field, not a point on an unrelated split component. Pass the bundle of inputs to the potential-modularity owner; no edge returns from its modularity theorem.

(Source: [ACC+23](#references) §7.2.5, published pp.1103–1106.)

*Needs:* [H6.4 Real torsion points with polarization signature](#h64-real-torsion-points-with-polarization-signature), [H6.5 Finite local Hilbert torsion points](#h65-finite-local-hilbert-torsion-points), [H6.8 Allen finite local elliptic points](#h68-allen-finite-local-elliptic-points), [H6.7 Allen restriction of torsion moduli](#h67-allen-restriction-of-torsion-moduli).

### Examples

In Allen's restriction case `X_i=Res_{K/k}Y_i` is smooth and geometrically irreducible of dimension `[K:k]=2`, and `X_i(ℝ)=Y_i(ℂ)` at a real place, so no real odd involution is needed (§H6.7). The selected Hilbert component has dimension `[F:ℚ]` instead.

Condition (C6) of §H6.5 is not automatic. For `l=5` and `k=𝔽₅` one has `ζ=i` and `N₀=ℚ(i, √−19)`, whose real subfield is `ℚ(√19)`. The fundamental unit 170+39√19 of `ℚ(√19)` has norm +1 and is totally positive, so the narrow class number is 2 although the class number is 1. The genus field `ℚ(i, √−19)` is unramified over `ℚ(√19)` at every finite place, so it is the narrow Hilbert class field. If `N=N₀`, the norm from the class group of N misses the nontrivial narrow class, and the wide-class argument cannot make the polarization module ordered-principal.

### Dependencies

This layer uses earlier layers H1, H4, H0, H5; AbelianSchemesAndArithmeticModuli (A2, A3, A4, A5, A6); AlgebraicModuliForArithmeticGeometry (§3.5); ArithmeticGaloisDuality (D7); FiniteFlatGroupsAndIntegralPadicHodgeTheory (R07.6); NeronModelsAndSemistableAbelianVarieties (§3.14); PELModuli (M1, M2, M3); the Tau Ceti roadmap ClassFieldTheory; Tau Ceti `NumberField.NarrowClassGroup.instFinite`; Mathlib `AlgebraicGeometry.Scheme`.

## Layer R18.1: Quaternionic canonical curves and the PEL bridge

Use the existing quaternion-algebra, Shimura-datum and canonical-model theories. Identify the one-real-split datum and its reflex field, and construct the auxiliary CM bridge without mistaking it for a moduli interpretation of the original group.

### R18.1.1 One-real-split quaternionic datum

**Construction** (`QuaternionicShimuraDatum`). Given a quaternion F-algebra B split at the specified real embedding `τ` and ramified at all other real embeddings, form `G_B=Res_{F/ℚ}B×` on the existing quaternion and restriction-of-scalars carriers. Set `h_B(z)=([[x, y],[−y, x]]⁻¹,1,…,1)` for `z=x+iy` under `B_τ≅M₂(ℝ)`. Its full conjugacy class is `H^±`. Verify §P.1’s SV1–SV3; its real central weight need not be ℚ-rational when `[F:ℚ]>1`, which §P.1 treats as a separate predicate. A totally definite B yields a finite class set in R18.3 instead.

*Construction.* Use the existing quaternion conjugation/norm and restriction-of-scalars group, with the chosen real splitting. Compute the three adjoint Hodge types at `τ` and type (0,0) at compact real factors. At `τ` the induced involution is Cartan on `PGL₂`; at the other factors the identity is Cartan because they are compact. The rational adjoint group is ℚ-simple and h is nontrivial on it.

Its API:

- `QuaternionicShimuraDatum`: The §P.1 datum with one specified real split factor and the displayed h.
- `quaternionicDatum_domain`: Its conjugacy domain is `H^±` and its connected domain is H.
- `quaternionicDatum_splittingChange`: Changing the real matrix splitting conjugates h and yields the same datum class.
- `quaternionicDatum_adjoint`: The adjoint real group is `PGL₂(ℝ)` times compact quaternionic projective groups.

**Checks.**

- `quaternion_Q_split`: For `B=M₂(ℚ)`, the complex domain is the modular `H^±` domain.
- `quaternion_definite`: A totally definite algebra with no chosen split real place does not produce this curve datum.
- `quaternion_dimension`: For degree g>1 with exactly one real split factor the domain is still one-dimensional.

(Source: [YZ18](#references) §4.1, p.561, displayed h and uniformization.)

*Needs:* [ReductiveGroupsPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md) `RG2.0a`; [ShimuraVarieties, §§P.1–P.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#p1-pure-data-and-special-pairs); Tau Ceti roadmap [QuadraticFormInvariants, layer 2 quaternion algebras and the four fold splitting criterion](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/QuadraticFormInvariants/README.md#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion); Mathlib `AlgebraicGeometry.Scheme`.

### R18.1.1a Central twist from the BZ datum

**Comparison** (`quaternionicCentralTwistAdapter`). Keep the Yuan–Zhang datum h of §R18.1.1. Write `h_BZ(z)=([[x,−y],[y,x]],1,…,1)` and define `δ:S→(Res_{F/ℚ} G_m)_ℝ` by `δ(z)=(|z|⁻²,1,…,1)`, so `h=h_BZδ`. The reduced-norm cocharacters of h and `h_BZ` at the distinguished embedding are `t⁻¹` and t, respectively. Apply BZ Proposition 8.4 over the common reflex field `E=τ(F)`: the identity on the complex double quotient induces a geometric isomorphism from the BZ tower to the h tower, equivariant for the same finite Hecke labels and levels, with descent twisted by the central reciprocity cocycle of δ. This is a comparison of canonical models with different descent data.

Locally at `ν|v`, fix a division uniformizer Π and put `π_v=Nrd(Π)` exactly. The inverse local reflex norm of δ sends `a∈F_v×` to the central idele `z_a`, equal to a at v and 1 elsewhere. At maximal division level units act trivially, so this twist is unramified. On the arithmetic formal quotient let `D_BZ=id_Ω×R_(Π⁻¹)×τ_c`, with `τ_c=Spf τ⁻¹`. Then the h descent is `D_h=R_(z_π_v)∘D_BZ=id_Ω×R_s×τ_c`, where `s=z_π_vΠ⁻¹`. Thus the comparison q satisfies `q∘D_h=(id×τ_c)∘q` to the canonical h completion. Here `ord_v Nrd(s)=+1`, and at maximal division level s has the class of Π. The exact element s, rather than a class representative, is used in descent diagrams.

At higher local level use Corollary 8.5's full central Galois cocycle on the geometric generic-fibre tower. Inertia corresponding under arithmetic reciprocity to a unit u contributes `R_(z_u)` in addition to the BZ action. Replacing the Frobenius uniformizer by `uπ_v` changes the central correction by `z_u`; retain this unit and the associated inertia change. No assertion that the twist is unramified survives when central units leave the level. Local RZ spaces, framings and height labels in §§R18.5.4–R18.5.12 retain their BZ conventions; the central twist is applied when comparing them to the canonical h curve. Coefficient sheaves and universal modules pulled through this comparison carry the same central cocycle on their fibres.

*Proof route.* Compute δ and its cocharacter on the restriction-of-scalars centre. Use BZ (8.11), its inverse reflex norm, and Corollary 8.5 to obtain the local cocycle. Combine its central translation with Theorem 6.7's BZ descent. BZ (7.1)–(7.2) identifies the induced action on a constant component set with the displayed translation; the inverse on the base adds no further inverse. Centrality gives level and Hecke compatibility without changing their labels. Extend the maximal-level comparison to stable models by uniqueness, then pass to completions.

**Checks.**

- For `F=ℚ`, B of discriminant 6, maximal levels at 2 and 3, principal level `1+7M₂(ℤ₇)` at 7 and maximal levels elsewhere, the norm component quotient is `(ℤ/7)×`. The 2-uniformizer idele has class `c₂=4`, while `c₂⁻¹=2`. Arithmetic Frobenius for h translates by 4; the BZ descent translates by 2. Multiplying by the central 2-idele contributes `c₂²=2`, giving `2·2=4` modulo 7. These classes have order three and remain distinguished after further tame shrinking.
- Since `π_v=Nrd(Π)`, `sΠ⁻¹=π_vΠ⁻²` is a division-order unit. Replacing s by Π is permitted at maximal division level; at a higher level that unit must be retained.
- For `F=ℚ` the centre has cocharacter `μ_δ(t)=t⁻¹`; its inverse local reflex norm contributes `π_v`, not `π_v⁻¹`. Adjoint homographies and the geometric tree are unchanged.

(Source: [YZ18](#references) §4.1, p.561; [BZ22](#references) (1.1), p.1, Theorem 6.7, pp.49–51, (7.1)–(7.2), p.52, Proposition 8.4 and Corollary 8.5 with (8.11), pp.55–56.)

*Needs:* [R18.1.1 One-real-split quaternionic datum](#r1811-one-real-split-quaternionic-datum); ShimuraVarieties §§4.1–4.2, 4.9, 8.6–8.7; ClassFieldTheory Layer 12; StableReduction Layer 5.

### R18.1.2 Quaternionic reflex field and dimension

**Theorem** (`quaternionicReflexDimension`). For the one-real-split quaternionic datum, the reflex field is `τ(F)⊂ℂ` and the Shimura variety has complex dimension 1. The cocharacter type is nontrivial only at `τ`, so its Galois stabilizer fixes that embedding. This differs from the Hilbert datum’s reflex field `ℚ` and from the auxiliary PEL bridge field F′, which generally only contains `τ(F)`.

*Proof route.* Compute the geometric cocharacter class factor by factor, using its unique active real embedding. Apply the imported reflex-stabilizer definition to identify `τ(F)`. Use the `H^±` domain identification for dimension 1.

(Source: [YZ18](#references) §4.1, p.561, canonical curves over F; compare Proposition 3.1, p.551.)

*Needs:* [R18.1.1 One-real-split quaternionic datum](#r1811-one-real-split-quaternionic-datum); [ShimuraVarieties, §§P.1–P.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#p1-pure-data-and-special-pairs).

### R18.1.3 Canonical quaternionic curve and uniformization

**Construction** (`QuaternionicShimuraCurve`). For compact open `U⊂G_B(A_f)`, apply the general canonical-model theory at the datum’s reflex field `τ(F)`, obtaining `Sh_U(G_B, X_B)`. Its complex points are `G_B(ℚ)\ (H^±×G_B(A_f)/U)`. Level and datum maps are the §§8.1–8.5, 8.22 maps with their effective-kernel hypotheses. The curve is proper when B is division; the split rational case is the nonproper modular curve and obtains cusps from §§3.1, 3.14, 8.1. No general abelian moduli interpretation of this exact `G_B` is asserted.

*Construction.* Apply §§8.1–8.5, 8.22’s canonical-model output for this exact datum and field; §§8.1–8.5, 8.22 covers it although its central weight need not be ℚ-rational. Compare the complex double cosets with the displayed real splitting and reflex embedding. Use quaternionic anisotropy/properness in the division case and the imported modular case when `B=M₂(ℚ)`.

Its API:

- `QuaternionicShimuraCurve`: The canonical finite-level curve over `τ(F)`.
- `quaternionicCurve_complex`: Its complex analytic space is the displayed double-coset quotient.
- `quaternionicCurve_changeLevel`: For `U′⊂U` the canonical level map commutes with Hecke maps and complex uniformization.
- `quaternionicCurve_splitQ`: For `F=ℚ, B=M₂(ℚ)`, matching levels identify it with §§3.1, 3.14, 8.1’s modular curve.

**Checks.**

- `curve_Q_split`: The split rational curve is noncompact before modular compactification.
- `curve_Q_division`: An indefinite quaternion algebra over `ℚ` ramified at two finite primes yields a compact curve.
- `curve_definite`: The totally definite datum is not passed to this one-dimensional constructor.

(Source: [YZ18](#references) §4.1, p.561, complex uniformization and compactness.)

*Needs:* [R18.1.1 One-real-split quaternionic datum](#r1811-one-real-split-quaternionic-datum), [R18.1.2 Quaternionic reflex field and dimension](#r1812-quaternionic-reflex-field-and-dimension); [AdelicAlgebraicGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md) `§3.4`; [ModularCurvesPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md) `§§3.1, 3.14, 8.1`; [ShimuraVarieties](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md) `§8.5`, `§8.3`, `§§8.1–8.5, 8.22`; Mathlib `AlgebraicGeometry.Scheme`.

### R18.1.4 Quaternionic central kernel and small levels

**Theorem** (`quaternionicEffectiveStabilizers`). At finite complex level, quotient `Γ_g=B_+×∩g Ug⁻¹` by its rational scalar subgroup before measuring freeness on H. On the adelic inverse tower the ineffective central subgroup is the closure of `F×` in `B_f×`; it is not in general the discrete subgroup `F×`. For the compact division case and `U⊂(1+NÔ_B)×` with `N≥3`, the effective `Γ_g` acts freely and each compact connected component has `genus≥2`. No `genus≥2` conclusion is applied to the noncompact split rational curve.

*Proof route.* Separate the rational archimedean stabilizer from the adelic closure kernel of the entire tower. For a noncentral fixed-point `γ`, its generated field is CM and `γ/γ̄` is a root of unity congruent 1 modulo N; `N≥3` forces it to be 1, hence `γ` central. After removing those scalars, obtain a free H uniformization; compactness and hyperbolic area give `genus≥2`.

(Source: [YZ18](#references) §4.1, pp.561–562 and Proposition 4.1.)

*Needs:* [R18.1.3 Canonical quaternionic curve and uniformization](#r1813-canonical-quaternionic-curve-and-uniformization); [ReductiveGroupsPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md) `RG2.0`, `RG2.3`; [ShimuraVarieties](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md) `§8.3`.

### R18.1.5 Yuan–Zhang PEL bridge groups

**Definition** (`YuanZhangBridgeGroups`). Choose a quadratic CM extension E/F and nearby CM types `Φ₁, Φ₂` differing at `τ`. Define `G″=Res_{F/ℚ}(B××_{F×}E×)`, quotienting by `(a⁻¹, a)`. Its derived group is Res B¹; `ν(b, e)=(Nrd(b) eē, e/ē)` identifies its derived quotient with `Res F××Res E¹`. Define G′ by `ν₁` lying in diagonal `G_m`. Lift the datum with `h_E(z)=(1, z⁻¹,…, z⁻¹)`. The bridge is auxiliary; it does not redefine the quaternionic datum.

*Construction.* Use the imported central quotient and restriction-of-scalars constructions with the specified `(a⁻¹,a)` kernel. Compute `ν` and its kernel from the quaternion reduced norm and CM conjugation. Combine `h_B` and `h_E` and verify that `ν₁` is rational scalar on h′.

Its API:

- `YuanZhangBridgeGroups`: The central quotient G″ and scalar `ν₁` subgroup G′ on imported group carriers.
- `yzBridge_norm`: `ν₁=Nrd(b) eē` and `ν₂=e/ē`.
- `yzBridge_derived`: Both bridge groups have derived group Res B¹.
- `yzBridge_datum`: The lifted h′ is induced by (`h_B`, `h_E`) with the displayed CM-type convention.

**Checks.**

- `bridge_kernel`: The pair `(a⁻¹, a)` has `ν₁=1` and `ν₂=1` for every `a∈F×`.
- `bridge_scalar`: An arbitrary `ν₁∈F×` is allowed in G″ but not in G′ unless it is rational scalar.
- `bridge_active`: At `τ` the `h_E` factor is 1; at all other CM factors it is `z⁻¹`.

(Source: [YZ18](#references) §3.1, pp.550–551, defining `G″, ν` and G′.)

*Needs:* [R18.1.1 One-real-split quaternionic datum](#r1811-one-real-split-quaternionic-datum); [ReductiveGroupsPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md) `RG2.0a`; [ShimuraVarieties, §§P.1–P.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#p1-pure-data-and-special-pairs).

### R18.1.6 Weighted CM reflex field of the bridge

**Theorem** (`yzBridgeReflex`). The reflex field F′ of (G′, h′), and likewise(G″, h″), is the field fixing the weighted CM type `Φ₁+Φ₂=2(Φ₁∩Φ₂)+τ₁+τ₂`. It contains `τ(F)`, because a stabilizer fixes the unique weight-one pair and hence its restriction to F. Equality `F′=F` is not asserted. In Carayol’s special `E=F(√λ), λ∈ℚ<0`, with the displayed nearby types and `g=[F:ℚ]`, the minimal reflex field is `F′=ℚ` when `g=1`, and `F′=E` in the chosen embedding when `g>1`. In degree one `Φ₁∩Φ₂=∅` and both embeddings of E have weight one, so the whole absolute Galois group fixes the weighted type. Base change from `ℚ` to E remains available.

*Proof route.* Compute the cocharacter multiplicities on E through the two nearby types. Identify the Galois stabilizer of the weighted set and its unique weight-one restriction. For `g>1` in the special case, a weight-two embedding exists; preserving it forces the chosen embedding of `ℚ(√λ)` to be fixed. Together with the unique weight-one restriction to F, this gives stabilizer field E. For `g=1` the weight function is constant one and its stabilizer field is `ℚ`. Preserve the inclusion `τ(F)⊂F′` in the comparison maps.

**Checks.**

- For `F=ℚ` and `E=ℚ(i)`, the types `{τ₁}` and `{τ₂}` have empty intersection; their sum has weights `(1,1)`, invariant under exchange of the two embeddings, and minimal reflex field `ℚ`.
- For `F=ℚ(√5)` and `E=F(i)` with the special nearby types, the weights over the active real place are `(1,1)` and over the other real place `(2,0)`; the stabilizer fixes both `τ(F)` and i, giving `F′=E`.
- In degree one, a compact quaternionic curve of discriminant 6 still has bridge reflex field `ℚ`; quaternionic division does not remove the degree-one exception.

(Source: [YZ18](#references) Proposition 3.1, p.551; special case §3.2, p.552; §5.1, p.571.)

*Needs:* [R18.1.5 Yuan–Zhang PEL bridge groups](#r1815-yuanzhang-pel-bridge-groups), [R18.1.2 Quaternionic reflex field and dimension](#r1812-quaternionic-reflex-field-and-dimension); [ShimuraVarieties, §§P.1–P.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#p1-pure-data-and-special-pairs).

### R18.1.7 Quaternionic PEL bridge instance

**Construction** (`quaternionicPELInstance`). Let `B′=B⊗_FE, V′=B′` with its left B′ module structure. Choose invertible `γ′` with `γ̄′=−γ′` and with the required archimedean positivity. Set `ψ′(v, w)=Tr_{E/ℚ}Trd_{B′/E}(γ′v w̄)`, and `*=γ′⁻¹ℓ̄γ′`. Specialize M0/M1 to obtain the G′ PEL moduli over F′: abelian schemes up to isogeny, B′ action with the full determinant condition determined by `Φ₁+Φ₂`, polarization with this Rosati involution, and U′-orbit of rational adelic similitude frames. An arbitrary anti-fixed `γ′` need not be polarizing.

*Construction.* Compute alternation, nondegeneracy and the adjoint involution from `γ̄′=−γ′`. Check the positivity of `γ′` against h′ rather than inferring it from anti-fixity. Apply the imported rational PEL moduli construction and identify the weighted characteristic polynomial; characteristic-zero trace data here determines the semisimple multiplicities, but the full determinant condition remains the stored interface.

Its API:

- `quaternionicPELInstance`: The M0/M1 specialization with `B′, ψ′,*` and h′.
- `quaternionicPEL_form`: The exact reduced-trace formula for `ψ′`.
- `quaternionicPEL_adjoint`: `ψ′(ℓv, w)=ψ′(v,ℓ*w) with*=γ′⁻¹ℓ̄γ′`.
- `quaternionicPEL_moduli`: The four data of YZ p.552 are the corresponding rational PEL moduli objects at sufficiently small U′.

**Checks.**

- `qpel_nonzero`: `γ′=0` is excluded: it would make `ψ′` degenerate.
- `qpel_positive`: Replacing a polarizing `γ′` by `−γ′` reverses the archimedean sign and cannot pass the same positivity test.
- `qpel_adjoint`: The left B′ action has exactly the stated Rosati involution, including the `γ′` conjugation.

(Source: [YZ18](#references) §3.1, p.552, equations (3.1.1)–(3.1.2) and four moduli conditions.)

*Needs:* [R18.1.5 Yuan–Zhang PEL bridge groups](#r1815-yuanzhang-pel-bridge-groups), [R18.1.6 Weighted CM reflex field of the bridge](#r1816-weighted-cm-reflex-field-of-the-bridge); [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M0.5`, `M0.18`, `M1.9`, `M3.4`; Mathlib `AlgebraicGeometry.Scheme`.

### R18.1.8 Quaternionic and PEL connected comparisons

**Comparison** (`yzComponentComparison`). After base change to an algebraic closure containing F′ and choosing compatible identity components, the quaternionic tower component `X⁰` and the PEL component `X′⁰` have the YZ Proposition 4.2 isomorphism, intertwining the identified effective positive-norm stabilizers through `G_B→G″`. For ideals n supported at p and prime to `d_B`, and sufficiently small `U^p` depending on n, there is a matching `U′^p` and a finite-level connected comparison `X_{n, U^p}⁰≅X′_{n, U′^p}⁰`. Its field and descent maps must be specified: the printed Proposition 4.4 says “over K” without defining K in this passage; construct its local field and descent datum from Carayol’s connected moduli comparison. The ambient canonical models use `τ(F)⊂F′` from §R18.1.6; in degree one both are `ℚ`. Replacing this base by E is an additional base change; the selected connected components still require their own field of definition.

*Proof route.* Identify the connected adjoint domains and the effective positive-norm arithmetic actions, preserving all central quotients. Apply the finite-level subgroup comparison with n prime to `d_B` and choose `U^p` small enough for that n. Descend a finite-type comparison only after choosing its actual field of definition and checking the required local/unramified field used by R18.2; do not invent K from the notation.

**Checks.**

- For `F=ℚ` and `E=ℚ(i)`, both ambient canonical models have base `ℚ`; adjoining i is not required by the bridge reflex field.
- A selected geometric connected component need not descend to the reflex field; the comparison retains its field of definition even when `F′=ℚ`.
- In degree one at p, the minimal reflex completion is `ℚ_p`; a comparison made after extending to a chosen completion of E carries that additional base change explicitly.

(Source: [YZ18](#references) Propositions 4.2 and 4.4, p.563; [Car86](#references) notation following §0, p.155, §§4.5.1–4.5.5, pp.188–189.)

*Needs:* [R18.1.3 Canonical quaternionic curve and uniformization](#r1813-canonical-quaternionic-curve-and-uniformization), [R18.1.4 Quaternionic central kernel and small levels](#r1814-quaternionic-central-kernel-and-small-levels), [R18.1.7 Quaternionic PEL bridge instance](#r1817-quaternionic-pel-bridge-instance); [ShimuraVarieties](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md) `§8.3`.

### R18.1.9 Torus bridge for quaternionic towers

**Comparison** (`yzTorusBridge`). Let `Ψ=Φ₁∩Φ₂` and Y/F′ be the zero-dimensional CM torus Shimura tower for `Res_{E/ℚ}G_m` with `h_Ψ(z)=(1, z⁻¹,…, z⁻¹)`. The product datum map induces `X×_FY→X″` over F′, and the tower comparison `(X×_FY)/Δ(A_{F, f}×)≅X″` uses the twisted `diagonalz↦(z, z⁻¹)`. At finite levels use the image U″ of `U×J` and the induced surjective map; an identical finite quotient description at all levels is not automatic. For `g=1`, `Ψ=∅`, the torus cocharacter is trivial and Y has reflex field `ℚ`, so this product comparison is over `ℚ`. The Tate-module tensor and integral extensions belong to R18.2.

*Proof route.* Apply the generic torus datum/canonical-model supplier to `Ψ` and form the product over the common reflex field. Compute the kernel of `B××E×→G″` as the twisted diagonal `F×` and compare the complex tower quotients including central closures. Check finite-level image groups separately; pass the specific map to R18.2 for the Tate/p-divisible tensor comparison.

**Checks.**

- In degree one `Ψ=∅` gives the trivial cocharacter, fixed by every Galois automorphism, so Y has reflex field `ℚ`.
- For `F=ℚ` and `E=ℚ(i)`, the product datum map is over `ℚ`; its base change to `ℚ(i)` does not change the minimal reflex field.
- A scalar pair `(z,z⁻¹)` maps to the identity in G″ also in degree one; the pair `(2,2)` instead has nonidentity image 4.

(Source: [YZ18](#references) §5.1, pp.571–572, product map and twisted diagonal quotient.)

*Needs:* [R18.1.5 Yuan–Zhang PEL bridge groups](#r1815-yuanzhang-pel-bridge-groups), [R18.1.6 Weighted CM reflex field of the bridge](#r1816-weighted-cm-reflex-field-of-the-bridge), [R18.1.3 Canonical quaternionic curve and uniformization](#r1813-canonical-quaternionic-curve-and-uniformization); [ShimuraVarieties, §§P.1–P.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md#p1-pure-data-and-special-pairs); [ShimuraVarieties](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ShimuraVarieties/README.md) `§8.5`.

### Examples

For `F=ℚ` and B indefinite of discriminant 6 the canonical curve is compact, has no cusps, and is defined over `ℚ` through the unique real embedding. For a real quadratic F the reflex field is `τ(F)`, not `ℚ`.

### Dependencies

This layer uses AdelicAlgebraicGroups (Layer 3); ModularCurvesPartII (§§3.1, 3.14, 8.1); PELModuli (M0, M1, M3); ReductiveGroupsPartII (RG2.0, RG2.0a, RG2.3); ShimuraVarieties (§P.1, §P.3, §P.1); ShimuraVarieties (§§8.1–8.5, 8.22); the Tau Ceti roadmaps QuadraticFormInvariants; Mathlib `AlgebraicGeometry.Scheme`.

## Layer R18.5, part 1: Local Drinfeld geometry, very free quotients and auxiliary PEL factors

Construct the analytic half-plane, its tree and its formal moduli interpretation before using them for integral quaternionic curves; K is a finite extension of `ℚ_p` throughout. The chart-separation predicate needs only a given action on the tree, not the quotient theorem it helps prove. The paired height lattice and the auxiliary PEL local factors prepare the division-prime proof of uniformisation through basic PEL uniformisation.

### R18.5.1 Drinfeld upper half-plane

**Definition** (`DrinfeldHalfPlane`). The Drinfeld half-plane `Ω_K` is the rigid analytic open `P¹_K\P¹(K)`, formed by removing the K-rational analytic points. `Ω_K(C)=P¹(C)\P¹(K)=C\K` in the affine chart with infinity removed. `PGL₂(K)` acts by homographies. This is not the algebraic complement of a Zariski-closed subscheme P¹(K). The affinoid exhaustion supplies its actual analytic open structure.

*Construction.* Construct the standard rational affinoids in P¹ using the imported analytic geometry. Glue their increasing open union and prove its C-point description. Use homographies to transport rational affinoids and descend the centre-trivial `GL₂` action.

Its API:

- `DrinfeldHalfPlane.points`: Its C-points are P¹(C) minus P¹(K).
- `DrinfeldHalfPlane.homography`: `PGL₂(K)` acts through the usual fractional linear formula.
- `DrinfeldHalfPlane.affineChart`: The affine chart identifies the C-points with C minus K.
- `DrinfeldHalfPlane.baseChange`: Scalar extension identifies the `Ω_K` affinoid exhaustion with its C-exhaustion; it does not replace the removed set by P¹(C).

**Checks.**

- `DrinfeldHalfPlane.infinity`: The point infinity is excluded.
- `DrinfeldHalfPlane.quadraticPoint`: For `z∈K₂\K` in a quadratic extension, z lies in `Ω_K(C)`.
- `DrinfeldHalfPlane.scalarAction`: Every central scalar in `GL₂(K)` acts trivially.
- `DrinfeldHalfPlane.algebraicComplement`: Removing finitely many K-rational points is insufficient: all P¹(K) must be excluded.

In [Suggested.lean](Suggested.lean): `DrinfeldHalfPlane.points`, `DrinfeldHalfPlane.affineChart`, `DrinfeldHalfPlane.infinity`.

(Source: [BC91](#references) Part I §§1–2, pp.49–53; [CDN20](#references) §1.2, pp.12–13.)

*Needs:* [AdicSpacesPartIII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdicSpacesPartIII/README.md) `R2.3`; [ReductiveGroupsPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md) `RG2.2`.

### R18.5.2 Affinoid exhaustion and tree reduction

**Construction** (`DrinfeldExhaustion`). For `n≥0`, set `P_{n+1}=P¹(O_K/π^{n+1})` and let `U_n` be `P¹_C` minus the union of open balls of radius `|π|ⁿ` centered at lifts of `P_{n+1}` in the standard projective metric. The complement is independent of the lifts. These affinoids increase to `Ω_C`. The norm-class reduction `r:Ω_C→|T_K|` is PGL₂(K)-equivariant, and `U_n` is the inverse image of the closed tree ball of radius n about the standard vertex. Tree vertices are homothety classes of rank-two lattices; adjacent representatives satisfy `πL⊊L′⊊L`.

*Construction.* Import the `GL₂` Bruhat–Tits tree specialization, including the norm-class realization. Compute vertex/edge affinoids using the two adjacent lattice bases. Identify the finite-ball inverse images and prove increasing exhaustive union.

Its API:

- `DrinfeldExhaustion.affinoid`: Each `U_n` descends from an affinoid over K.
- `DrinfeldExhaustion.increasing`: `U_n⊂U_{n+1}` and their union is `Ω_C`.
- `DrinfeldExhaustion.treeBall`: `U_n=r⁻¹` of the radius-n tree ball.
- `DrinfeldExhaustion.equivariant`: `r(gz)=g r(z)` for `g∈PGL₂(K)`.

**Checks.**

- `DrinfeldExhaustion.residueTwo`: For `q=2 a` vertex has 3 incident edges.
- `DrinfeldExhaustion.firstSphere`: The radius-one tree ball has q+2 vertices.
- `DrinfeldExhaustion.centralScalar`: Scaling a lattice changes neither its vertex nor the reduction class.
- `DrinfeldExhaustion.rationalBoundary`: For `K=ℚ₂` and `n=1`, `z=2` is removed by its class modulo 4; the three centers 0,1,∞ modulo 2 with strict radius 1/2 would incorrectly retain it.

(Source: [CDN20](#references) §§1.1–1.2, pp.11–13; the strict open balls require centers modulo `π^{n+1}` at radius `|π|ⁿ`, correcting the index in §1.2. The `X_n` and formal opens of §R18.5.3 keep their original indices.)

*Needs:* [R18.5.1 Drinfeld upper half-plane](#r1851-drinfeld-upper-half-plane); [ReductiveGroupsPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md) `RG2.2`.

### R18.5.3 Standard Drinfeld formal model

**Construction** (`DrinfeldFormalModel`). Start with `X₀=P¹_O_K` and form `X_n` by blowing up every smooth k-rational special-fibre point of `X_{n−1}`; take the π-adic completions. Remove the smooth k-rational points from `X_n` to form the formal open `Ũ_n`. Then `Ũ_n⊂Ũ_{n+1}`, its generic fibre is `U_n` over K, and `Ω̂=⋃Ũ_n` is a flat regular semistable formal model of `Ω_K`. Its components are `P¹_k` indexed by tree vertices and its nodes by tree edges, locally `xy=π`. The full `GL₂(K)` action factors through `PGL₂(K)`.

*Construction.* Use the existing admissible blow-up and generic-fibre-invariance API. Compute the exceptional and strict-transform components and edge charts. Glue formal opens, not an inverse limit of the projective blow-up models; extend the group action through lattice charts.

Its API:

- `DrinfeldFormalModel.genericFibre`: The generic fibre of `Ω̂` is `Ω_K`.
- `DrinfeldFormalModel.nodeChart`: At an edge the completed local equation is `xy=π`.
- `DrinfeldFormalModel.components`: Special-fibre components and nodes identify with tree vertices and edges.
- `DrinfeldFormalModel.action`: The `PGL₂(K)` action extends the analytic homography action.

**Checks.**

- `DrinfeldFormalModel.centralComponent`: The initial vertex component is `P¹_k` with its q+1 rational attaching points.
- `DrinfeldFormalModel.qTwo`: For `q=2` each component meets three branches in the full model.
- `DrinfeldFormalModel.ramifiedNode`: For `e=2, xy=π′²` is a singular total-space local ring; regularity is not preserved.

(Source: [CDN20](#references) §1.2, pp.12–13; [BC91](#references) Part I §3, pp.53–56.)

*Needs:* [R18.5.2 Affinoid exhaustion and tree reduction](#r1852-affinoid-exhaustion-and-tree-reduction); [AdicSpacesPartIII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdicSpacesPartIII/README.md) `R2.5`, `R2.5`; Tau Ceti roadmap [StableReduction, layer 1 nodes normalization and dual graphs](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-1-nodes-normalization-and-dual-graphs).

### R18.5.4 Special formal quaternionic moduli

**Definition** (`SpecialFormalModuli`). Let D/K be the local division quaternion algebra, `O_D` its maximal order containing the unramified quadratic order `O₂`. A strict special formal `O_D`-module X over a π-nilpotent `O_Ǩ`-scheme has `O_K`-height 4 and Lie(X) locally free of rank one over `O₂⊗O_K O_S` (hence rank two over `O_S`), with strict `O_K` action. Fix a framing `Φ` over k̄. The functor `M_Dr(0)` classifies `(X, ρ)` where `ρ:X_S̄→Φ_S̄` is an `O_D`-linear quasi-isogeny of relative height zero, modulo compatible isomorphism. M̃ allows heights `2m, m∈ℤ`. BC uses the inverse framing arrow; invert it when comparing conventions.

Import generic formal Lie groups, p-divisible groups, dimension and absolute-height carriers from R07.1–R07.2. Construct here the strict `O_K`-action, meaning that `O_K` acts on Lie through the structure map, and the `O_K`-relative group height h characterized by `rank X[π]=q^h`. Prove `height_p(X)=[K:ℚ_p]h`. For an `O_K`-linear quasi-isogeny define relative height by `log_q` of degree after clearing a power of π; prove that absolute isogeny height is `[k:𝔽_p]` times this height. Add the special `O_D`-action and framed moduli data on these carriers.

*Construction.* Specialize the generic p-divisible/Cartier-module carrier with the `O_D` action and special Lie condition. Form the isomorphism-class functor with height-zero framing. Check base change, arrow reversal and the locally constant relative-height components.

Its API:

- `SpecialFormalModuli.specialLie`: Lie is rank one over `O₂⊗O_S`.
- `SpecialFormalModuli.baseChange`: Pull back X and its special-fibre framing along every nilpotent-base map.
- `SpecialFormalModuli.framingAction`: A framing quasi-isogeny `δ` acts by `δ∘ρ`.
- `SpecialFormalModuli.heightComponents`: The arbitrary-height functor decomposes into the height-2m components.

**Checks.**

- `SpecialFormalModuli.heightZero`: The framing object with identity `ρ` lies in `M_Dr(0)`.
- `SpecialFormalModuli.absoluteHeight`: When `[K:ℚ_p]=2` the absolute group p-height is 8.
- Multiplication by π has relative isogeny height four and absolute isogeny height `4[k:𝔽_p]`; for ramified K this differs from the group’s absolute height.
- `SpecialFormalModuli.wrongLie`: An `O_D`-module whose `Lie O₂` action has ranks (2,0) is not special.

(Source: [BC91](#references) Part II §§2, 5.16, Definition 8.1, pp.79–84, 97–98, 107; [BZ22](#references) §5, pp.38–39, (5.18)–(5.20).)

*Needs:* [FiniteFlatGroupsAndIntegralPadicHodgeTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md) `R07.1`, `R07.2`.

### R18.5.5 Drinfeld representability theorem

**Theorem** (`DrinfeldRepresentability`). The special formal `O_D`-module functor `M_Dr(0)` is represented by `Ω̂⊗O_K O_Ǩ`. The equivalence is functorial on π-nilpotent bases, not just a bijection on geometric points, and identifies the universal special formal module. The group of framing quasi-isogenies is `GL₂(K)`; on height zero the normalized action factors through `PGL₂(K)`.

Strict special modules, fixed frame and arrow convention as above.

*Proof route.* Use Dieudonné–Cartier theory to construct the rank-two lattice/sheaf data and its critical-index filtration. Compare with the lattice-chart functor representing `Ω̂`, using BC II §§5–8. Prove both natural transformations inverse on nilpotent bases and match the universal object/actions.

(Source: [BC91](#references) Part II Theorems 8.2,8.4, pp.107–109.)

*Needs:* [R18.5.4 Special formal quaternionic moduli](#r1854-special-formal-quaternionic-moduli), [R18.5.3 Standard Drinfeld formal model](#r1853-standard-drinfeld-formal-model); [FiniteFlatGroupsAndIntegralPadicHodgeTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md) `R07.2`.

### R18.5.6 Height action and Frobenius descent

**Comparison** (`HeightAndDescent`). Normalize arbitrary-height `M̃_Dr≅M_Dr(0)×ℤ` by a division uniformizer `Π` and its Hecke shift `h(Π)`. Under BZ §5.9, `δ∈GL₂(K)` acts by `(ω, m)↦(pr(δ) ω, m+ord_K det δ)`, where `pr(δ)=h(Π)^{−ord det δ}δ` on height zero. The product identification is independent of `Π`. For the BZ datum, arithmetic descent uses `τ_c=Spf τ⁻¹` and the separate right `Π⁻¹` Hecke translation in Theorem 6.7. Apply §R18.1.1a before passing to the canonical datum of this roadmap: its central correction replaces this translation by right s. Neither translation is the normalized `PGL₂` action.

*Proof route.* Identify each height component with height zero using `h(Π)`. Compute the valuation shift and central scalar correction. Compare the BZ Frobenius diagram with BZ 6.7 and (7.1)–(7.2), then apply the central reciprocity cocycle of §R18.1.1a.

**Checks.**

- An element of `SL₂(K)` has zero height shift; its homography can still be nontrivial.
- The central matrix `π·id` has determinant valuation two and trivial homography, so ignoring its height action loses two components.
- The arithmetic order-three component test of §R18.1.1a uses right s for h; the raw BZ `Π⁻¹` translation gives the inverse cycle.

(Source: [BZ22](#references) Proposition 5.9, p.39; Theorem 6.7, p.49.)

*Needs:* `quaternionicCentralTwistAdapter` (§R18.1.1a); [R18.5.5 Drinfeld representability theorem](#r1855-drinfeld-representability-theorem).

### R18.5.7a Arithmetic stabilizers and finite components

**Theorem** (`ArithmeticDrinfeldStabilizers`). Let F be totally real, B/F division split at exactly τ and division at v, and B̌ the totally definite invariant exchange split at v. At `U_v=O_{B,v}×` and fixed compact open tame level `U^v`, compute the finite component representatives and the valuation-zero groups `Γ_g={b∈B̌×∩gU^vg⁻¹ : ord_v Nrd(b)=0}`. Their effective images in `PGL₂(F_v)` are discrete and cocompact. Nested tame levels give subgroups of finite index and compatible component maps. This target constructs the groups and their finiteness properties, independently of their formal quotients.

*Proof route.* Apply adelic class-number finiteness and approximation to B̌, retain the norm-valuation component, and remove the rational scalar kernel before using the tree action. Use discreteness and compactness modulo the centre to obtain discrete cocompact projective stabilizers.

**Checks.**

- Rational central units act trivially on the tree and are removed from each effective `Γ_g`.
- Valuation-zero elements preserve the parity of vertices; their displacements are even.
- Shrinking a tame level gives finite-index subgroups, while cocompactness does not itself exclude torsion.

(Source: [BZ22](#references) §6, proof of Proposition 6.6, pp.47–48; [BC91](#references) Part III §§5.1–5.3, pp.139–142.)

*Needs:* [R18.5.6 Height action and Frobenius descent](#r1856-height-action-and-frobenius-descent); AdelicAlgebraicGroups §§3.4, 4.2–4.3; ReductiveGroupsPartII RG2.2.

### R18.5.8 Auxiliary PEL height lattice

**Definition** (`PelHeightLattice`). The height labels of the distinguished auxiliary PEL local factor form `Λ = {(a,b)` in `ℤ` squared : 2 ∣ a+b}, with componentwise addition. Quaternionic height m embeds as (m,m). The difference character `(a,b) ↦ (a−b)/2`; its kernel in `Λ` is the diagonal and it identifies `Λ` modulo the diagonal with `ℤ`. Both coordinates are half the corresponding relative quasi-isogeny heights, in the conventions of BZ (5.13) and (5.23).

Use the polarized paired `q₀` and `conjugate-q₀` factors of BZ, with the BZ framing arrow Ȳ to X̄. These two integer labels are not absolute p-heights.

*Construction.* Use the polarization relation to impose parity of the two half-heights. Apply the height translations in BZ (5.15) to identify the components with the height-zero component times `Λ`. Check the diagonal embedding in (6.39). For the quotient description, use `a−b` even; `(r,−r) ↦ r` and zero difference forces `a=b`.

Its API:

- `PelHeightLattice.mem`: A pair (a,b) is in `Λ` exactly when 2 ∣ a+b.
- `PelHeightLattice.add`: `Λ` is closed under componentwise addition, contains zero and is closed under negation, agreeing with the existing additive-subgroup vocabulary.
- `PelHeightLattice.diagonal`: For every m in `ℤ, (m,m)` is in `Λ`; the map is injective and additive.
- `PelHeightLattice.difference`: On `Λ` the integer `(a−b)/2` is additive, surjective and has kernel the diagonal.

**Checks.**

- `PelHeightLattice.oddPair`: (1,0) is not a permitted label; using all of `ℤ²` fails.
- `PelHeightLattice.oppositePair`: `(1,−1)` is permitted and has difference character 1; using only the diagonal fails.
- `PelHeightLattice.negativeDiagonal`: `(−1,−1)` is permitted and has difference zero; using nonnegative heights fails.
- `PelHeightLattice.translation`: Adding (1,1) preserves `Λ` and the difference character; changing only one coordinate by 1 does not preserve `Λ`.

In [Suggested.lean](Suggested.lean): `PelHeightLattice`, `PelHeightLattice.mem`, `PelHeightLattice.diagonal`, `PelHeightLattice.difference`, `PelHeightLattice.difference_contract`.

(Source: [BZ22](#references) §5, (5.10) and (5.12), pp.36–37; (5.13), (5.15), (5.23), Proposition 5.11, pp.37–40; §6, (6.39), p.48 ((5.10) labels the open and closed pieces RZ(a,b) by half the relative heights of the two quasi-isogeny components, (5.12) shows a+b is even, (5.23) writes RZ as RZ(0,0) times `Λ`, and (6.39) maps the quaternionic heights diagonally into `Λ`; the difference-character quotient is an elementary consequence))

*Needs:* [R18.5.6 Height action and Frobenius descent](#r1856-height-action-and-frobenius-descent); Mathlib `AddSubgroup`.

### R18.5.9 Very free action on Drinfeld charts

**Definition** (`VeryFreeChartAction`). For the effective projective arithmetic group `Γ` acting on the imported Bruhat–Tits tree T, call the action very free when every gamma different from 1 and every vertex x satisfy `d_T(x,γx)>2`, where `d_T` counts edges. The light predicate also makes sense for an actual group action on a set equipped with a specified ℕ-valued distance. In the geometric use this distance must be the tree distance. This is a sufficient chart-separation condition, stronger than an action free on vertices.

`Γ` is the image in `PGL₂(K)`, after removing the scalar kernel, of the determinant-valuation-zero arithmetic stabilizer. In the geometric theorem `Γ` is discrete and cocompact.

*Construction.* Import the tree, its action and edge-count distance from ReductiveGroupsPartII:RG2.2. Apply BC Part III 5.3.1 to the effective arithmetic group and retain the strict bound greater than 2. Small tame level produces this condition for the arithmetic groups of [R18.5.7 Arithmetic Drinfeld quotient](#r1857-arithmetic-drinfeld-quotient); that is the separate theorem [R18.5.10 Very free arithmetic stabilizers at small tame level](#r18510-very-free-arithmetic-stabilizers-at-small-tame-level), not part of this definition or of the quotient theorem.

Its API:

- `VeryFreeChartAction.distance`: For an actual group action, the condition is the universal strict displacement bound greater than 2.
- `VeryFreeChartAction.free`: If `d(x,x)=0`, the condition excludes every nonidentity vertex stabilizer.
- `VeryFreeChartAction.subgroup`: Restriction to a subgroup preserves the condition with the induced action and the same distance.
- `VeryFreeChartAction.conjugation`: Conjugating `Γ` by a tree isometry preserves the condition; the distance is transported by that isometry.

**Checks.**

- `VeryFreeChartAction.trivialGroup`: The trivial group satisfies the predicate for every vertex set; requiring the bound for the identity would fail.
- `VeryFreeChartAction.translationThree`: On the integer line with edge distance `|x−y|, n` acts by `x ↦ x+3n`; every nonzero n has displacement at least 3.
- `VeryFreeChartAction.translationTwo`: The free action `n: x ↦ x+2n` fails: `n=1` has displacement 2.
- `VeryFreeChartAction.fixedVertex`: An action with a nonidentity element fixing a vertex fails even if other orbits have long displacement.
- The rule `move(g,v)=v+3` for every element of C₂ fails the identity axiom and is not a MulAction input, even though every nonidentity displacement exceeds two.

In [Suggested.lean](Suggested.lean): `VeryFreeChartAction`, `VeryFreeChartAction.integerTranslationAction` (the actual integer translation actions for the distance Checks).

(Source: [BC91](#references) Part III §5.3.1, pp.141–142 (Strict displacement greater than two allows standard formal vertex charts to descend and glue))

*Needs:* [ReductiveGroupsPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md) `RG2.2`; Mathlib `MulAction`.

### R18.5.10 Very free arithmetic stabilizers at small tame level

**Theorem** (`VeryFreeChartAction.smallTameLevel`). In the setting of [R18.5.7a Arithmetic stabilizers and finite components](#r1857a-arithmetic-stabilizers-and-finite-components) (B/F with `B_v` division, B̌ totally definite and split at `v, U_v = O_B,v^×`), fix a tame level `U^v_0`. There is an open compact `U^v_1 ⊂ U^v_0` such that for every open compact `U^v ⊂ U^v_1` and every g in the finite adelic group away from v, the image in `PGL₂(F_v)` of `Γ_g = {b ∈ B̌^× ∩ gU^v g⁻¹ : ord_v Nrd b = 0}` acts very freely on the Bruhat–Tits tree: every nonidentity element moves every vertex a distance greater than 2. Since `ord_v Nrd b = 0`, these displacements are even, so the condition says that no nonidentity element has displacement 0 or 2.

F totally real; B/F split at exactly one real place and division at v above p; B̌ exchanges the invariants at that real place and at v; the fixed away-v identification of B̌ with B.

`Γ_g` is projected to `PGL₂(F_v)` after removing the central kernel; the tree is the imported Bruhat–Tits tree of `PGL₂(F_v)` with edge-count distance.

*Proof route.* Let J be the adjoint group of B̌. It is anisotropic at every real place, so J(F) is discrete in `J(A_F,f)`, and the image of each `Γ_g` in `J(F_v)` is discrete and cocompact (BZ, proof of Proposition 6.6, p.48). For the finitely many double-coset representatives at level `U^v_0` and a finite set of vertex representatives modulo each image, the elements moving some representative vertex by at most 2 lie in a compact subset of `J(F_v)`, hence form a finite set S by discreteness. Every nonidentity element of S is nontrivial in `J(A^v_F,f)`, because `J(F) → J(A^v_F,f)` is injective; choose `U^v_1` normal in `U^v_0` whose images avoid the finitely many elements of S other than 1. Every double coset at a smaller level `U^v ⊂ U^v_1` is represented by `δgk` with `δ` in `B̌^×, g a` representative at level `U^v_0` and k in `U^v_0`; `Γ_{gk}` at level `U^v` lies in `Γ_g` at level `U^v_1` because `U^v_1` is normal in `U^v_0`, and conjugation by `δ` is an isometry of the tree, so the bound persists for all of them.

**Checks.**

- For every sufficiently small tame level, every projected `Γ_g` satisfies [R18.5.9 Very free action on Drinfeld charts](#r1859-very-free-action-on-drinfeld-charts).
- The statement is about the projected groups after the scalar kernel is removed; central elements of `B̌^×` act trivially on the tree and are not counted.
- Freeness on vertices (no nonidentity element with displacement 0) is weaker and is the condition used in BZ's proof of Proposition 6.6; very freeness additionally excludes displacement 2.

(Source: [BC91](#references) Part III §5.3.1, pp.141–142 (Asserts that the stabilizers act very freely on the tree once the tame level is small enough, and uses this to glue the standard vertex charts); [BZ22](#references) §6, proof of Proposition 6.6, p.48 (The discreteness and smallness argument, there given for fixed-point-free action of the projected groups on the building; the same argument with displacement at most 2 gives very freeness))

*Needs:* [R18.5.9 Very free action on Drinfeld charts](#r1859-very-free-action-on-drinfeld-charts), [R18.5.7a Arithmetic stabilizers and finite components](#r1857a-arithmetic-stabilizers-and-finite-components); [ReductiveGroupsPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md) `RG2.2`.

### R18.5.11 Separated Drinfeld quotient charts

**Theorem** (`VeryFreeDrinfeldQuotient`). Let `Γ` be a discrete cocompact subgroup of `PGL₂(K)` acting very freely on T. The standard Drinfeld vertex charts descend to the quotient formal curve `Γ \ Ω̂` and glue with their original edge overlap charts. Its special fibre has one `P1_k` for each vertex orbit and one ordinary node of thickness 1 for each unoriented edge orbit. The quotient map is injective on each radius-one vertex neighbourhood in the tree. There is a proper algebraic curve model whose completion is this formal quotient, with smooth rigid generic fibre `Γ \ Ω`; regularity and semistability follow from the original charts. Each normalized rational component has q+1 distinct attaching points, so the special fibre is stable.

The effective `Γ` action satisfies VeryFreeChartAction. Construct the separated quotient by the stated chart gluing here, and apply Grothendieck's algebraization theorem from AdicSpacesPartIII:F0.8 after constructing an ample line. This theorem uses no general finite-stabilizer quotient assertion.

*Proof route.* If two vertices in one radius-one ball were identified, a nonidentity translate would move a vertex by at most two. Use very freeness to rule this out. Glue the actual BC Part I charts along edge charts, then take a finite fundamental domain for cocompactness to obtain a proper formal curve over O. Algebraize it with Grothendieck's algebraization theorem (AdicSpacesPartIII:F0.8), given a line bundle whose reduction to the special fibre is ample; construct that line here as the relative dualizing line of the semistable formal curve. On each normalized rational component its degree is `−2+(q+1)=q−1>0`, hence it is ample on the proper special fibre. Its compatible restrictions to the thickenings give the line required by F0.8. Read the local equations `xy=π`, identify component and node orbits, and count the q+1 distinct branches on each normalized P¹. Since q is at least 2, every rational component has at least three special points.

**Checks.**

- The chart theorem is sufficient under very freeness; mere vertex freeness is not used as the chart hypothesis.
- No assertion of regularity survives arbitrary ramified base change: `xy=π` becomes `xy=u` times `π_L^e`.
- The unramified local charts have thickness one.
- For `q=2` the dualizing degree on each normalized rational component is one; without an ample line the conditional F0.8 algebraization theorem cannot be applied.

(Source: [BC91](#references) Part I §§2–3, pp.51–56; Part III §5.3.1, pp.141–142 (Standard vertex and edge charts and the sufficient smallness condition for gluing their quotient); [CDN20](#references) §1.2, pp.12–13 (The blow-up union has reduced tree-indexed rational components and original node charts))

*Needs:* [R18.5.9 Very free action on Drinfeld charts](#r1859-very-free-action-on-drinfeld-charts), [R18.5.3 Standard Drinfeld formal model](#r1853-standard-drinfeld-formal-model); [AdicSpacesPartIII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdicSpacesPartIII/README.md) `R2`, `F0.8`; Tau Ceti roadmap [StableReduction, layer 1 nodes normalization and dual graphs](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-1-nodes-normalization-and-dual-graphs); Tau Ceti roadmap [StableReduction, layer 5 regular and minimal models](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-5-regular-and-minimal-models).

### R18.5.7 Arithmetic Drinfeld quotient

**Construction** (`ArithmeticDrinfeldQuotient`). For B/F division split at `τ` only and division at v, let B̌ exchange invariants at `{τ, v}`, so it is totally definite and split at v. For compact level U with `U_v=O_B, v×` and small `U^v`, form `B̌×\ [(Ω̂⊗O_Fv O_Fv̌)×B_f×/U]`, using fixed away-v identifications; `B̌_v×` acts by homography and the local valuation component `ord_v` Nrd. Its finite component decomposition uses `Γ_g={b∈B̌×∩gU^v g⁻¹:ord_v det b=0}`, projected to `PGL₂(F_v)`. These projected groups are discrete cocompact and become torsion-free with sufficiently small tame level.

Global `B/F, τ, v` and level as stated; effective central quotient and finite component representatives fixed.

*Construction.* Apply adelic finiteness and approximation for the definite exchange algebra. Compute the valuation-zero stabilisers and their effective projective images. Apply `VeryFreeChartAction.smallTameLevel` (§R18.5.10) to the groups of §R18.5.7a, then construct their separated quotients and relative dualizing ample lines by `VeryFreeDrinfeldQuotient` (§R18.5.11). Algebraize using AdicSpacesPartIII F0.8 only after this ample-line construction.

Its API:

- `ArithmeticDrinfeldQuotient.components`: Connected pieces are the specified projective `Γ_g` quotients after unramified base change.
- `ArithmeticDrinfeldQuotient.cocompact`: Each effective `Γ_g` is discrete and cocompact in `PGL₂(F_v)`.
- `ArithmeticDrinfeldQuotient.changeLevel`: Nested tame levels give the corresponding finite quotient maps.
- `ArithmeticDrinfeldQuotient.algebraisation`: At sufficiently small level the proper formal curve algebraizes with the same generic fibre.

**Checks.**

- `ArithmeticDrinfeldQuotient.scalar`: Central scalar homographies are ineffective; their valuation effect is retained separately.
- `ArithmeticDrinfeldQuotient.node`: At free level an edge orbit has node chart `xy=π`.
- `ArithmeticDrinfeldQuotient.nonfree`: A quotient with a nontrivial effective vertex stabiliser cannot use the free-action regularity argument.

(Source: [BZ22](#references) §1, pp.1–3; §6, pp.45–50; [BC91](#references) Part III §§5.1–5.3, pp.139–142.)

*Needs:* `ArithmeticDrinfeldStabilizers` (§R18.5.7a), `VeryFreeChartAction.smallTameLevel` (§R18.5.10), `VeryFreeDrinfeldQuotient` (§R18.5.11); [R18.5.6 Height action and Frobenius descent](#r1856-height-action-and-frobenius-descent); [AdelicAlgebraicGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md) `Layer 3`, `Layer 4`; [AdicSpacesPartIII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdicSpacesPartIII/README.md) `R2`; Tau Ceti roadmap [StableReduction, layer 5 regular and minimal models](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-5-regular-and-minimal-models).

### R18.5.12 Local factors of the auxiliary quaternionic PEL space

**Comparison** (`AuxiliaryPelLocalFactors`). For the precise BZ auxiliary PEL datum and chosen compatible framing object, the distinguished local RZ functor is `Ω̂_K` over `O_Ǩ` times `Λ`. The other `p_i` local RZ functors, with their prescribed rigidifications, are constant sheaves `G•_π/K•_π`, after the choice (5.7). Thus the global local factor is the product of the distinguished factor and these discrete coset factors. On (omega,(a,b)), a framing quasi-isogeny (delta1,delta2) acts by (pr(delta1)omega,(a+ord det delta1,b+ord det delta2)), with scalar-product constraint `δ₁δ₂` in `K×`. The corrected Weil datum in BZ Theorem 6.3 translates the distinguished labels by (1,1); its conversion to the BZ theorem’s inverse base automorphism is right multiplication by `Π⁻¹` on the finite-adelic factor. These are the BZ datum and local labels; §R18.1.1a supplies the additional central twist to the canonical h datum.

Distinguished level is maximal and its multiplier subgroup is `O_K` units; other local factors obey BZ (4.6) and (6.31). Preserve the polarization classes and rigidifications in Definitions 5.3 and 5.6.

*Proof route.* Use the strict special-formal-module representability already proved in [R18.5.5 Drinfeld representability theorem](#r1855-drinfeld-representability-theorem). Apply BZ Lemma 5.10 and Proposition 5.11 to the distinguished polarized factor; label it with [R18.5.8 Auxiliary PEL height lattice](#r1858-auxiliary-pel-height-lattice). For each other `p_i`, transport the rigidification to the chosen constant étale framing group and its multiplicative dual; BZ Proposition 5.4 identifies the functor with its coset sheaf. Compute both heights after the central correction in (6.16), as in Theorem 6.3. Keep this arithmetic datum separate from the normalized framing-group action.

**Checks.**

- The auxiliary factor is not just `Ω̂` times one height integer.
- The discrete other-prime factors cannot be omitted when F has several primes above p.
- Switching BC and BZ framing arrows inverts the quasi-isogeny; do not carry the same height sign across both conventions.

(Source: [BZ22](#references) §5, Definitions 5.3 and 5.6, Proposition 5.4, Lemma 5.10, Proposition 5.11, pp.35–40; Theorem 6.3 proof, pp.44–45 (The polarized local-factor decomposition, its action and the corrected height translation))

*Needs:* [R18.5.8 Auxiliary PEL height lattice](#r1858-auxiliary-pel-height-lattice), [R18.5.5 Drinfeld representability theorem](#r1855-drinfeld-representability-theorem), [R18.5.6 Height action and Frobenius descent](#r1856-height-action-and-frobenius-descent); [FiniteFlatGroupsAndIntegralPadicHodgeTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md) `R07.1`, `R07.2`; [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M2`.

### R18.5.13 Quaternionic transfer from basic PEL uniformisation

**Comparison** (`QuaternionicPelUniformisationTransfer`). For the BZ datum, at maximal division-prime level and the other p-adic levels of BZ (6.31), the formal quaternionic uniformisation map factors through the selected open-and-closed quaternionic components of the auxiliary PEL model of Definition 6.5 and is an isomorphism onto those components. The inclusion on local labels is `m ↦ (m,m)`. The rational automorphism group inclusion is controlled by the exact central sequence `1 → F× → B̌× × L× → I(ℚ) → 1`, where L/F is the auxiliary CM extension, with kernel `c ↦ (c, c⁻¹)`. After a cofinal tame shrinking, the induced quotient inclusion is open and closed and hits every selected component. Transporting the PEL uniformisation and its corrected twist first gives the BZ quaternionic formal completion. Apply `quaternionicCentralTwistAdapter` (§R18.1.1a) to obtain the canonical h completion with right `s=Nrd(Π)Π⁻¹` descent, compatibly with the same Hecke labels of `B^×(A_f)` for varying levels of the permitted form (BZ Theorem 6.7 and Corollary 8.5). This division-prime proof route does not use Carayol's split-place connected comparison.

Choose auxiliary CM/tame levels as in BZ Definition 6.5 and (6.31). Retain the central kernel and all components of the selected BZ tower before applying the central twist to the canonical h tower.

The basic PEL uniformisation of BZ Proposition 6.2, including deformation-theoretic étaleness, polarized Hasse-principle surjectivity and Weil equivariance, is a supplier contract, not a consequence of PEL representability or complex uniformisation.

*Proof route.* Identify B̌ using (6.22) and compute the central exact sequence (6.34). Its sequence of rational points is exact by Hilbert 90 for the CM extension L/F: for `x ∈ I(ℚ)` with `x'x = f ∈ F×`, the element f/Nrd(x) of `L^×` has norm 1 to F because `Nrd(x')Nrd(x) = f²`, so it equals `σ(k)/k` for some `k ∈ L×` (Mathlib `groupCohomology.exists_div_of_norm_eq_one`), and then `xk⁻¹` lies in `B̌^×`. In Proposition 6.6 the torus `L×/F×` is anisotropic at infinity; shrink the auxiliary level using the finite relevant unit classes and the congruence argument so that no extra CM translate identifies two quaternionic points. Insert [R18.5.12 Local factors of the auxiliary quaternionic PEL space](#r18512-local-factors-of-the-auxiliary-quaternionic-pel-space) into Proposition 6.2, then use the diagonal height embedding (6.39) and Proposition 6.6 to obtain an open-and-closed immersion of the arithmetic formal quotients. Follow the proof of Theorem 6.7: take compatible special-fibre points over a cofinal system of levels, use properness to choose a compatible framing, and use Hecke transitivity to meet every selected component. Open-and-closed immersion plus surjectivity gives the isomorphism. Convert the corrected PEL Weil datum using Theorem 6.3; the BZ formula is id on `Ω̂` and right multiplication by `Π⁻¹` on the adelic quotient, together with `τ_c=Spf τ⁻¹`. Compose with the central `z_π_v` translation of §R18.1.1a to obtain right s for the canonical h curve.

**Checks.**

- A geometric component isomorphism alone does not prove surjectivity onto all canonical components.
- A raw inclusion of B̌ times in `I(ℚ)` is insufficient without the inverse-diagonal central kernel.
- The division-prime theorem uses no bridge determinant comparison at ramified places.

(Source: [BZ22](#references) §6, Proposition 6.2 and Theorem 6.3, pp.43–45; (6.22), p.45; (6.29)–(6.31), p.46; Definition 6.5, Proposition 6.6 and Theorem 6.7 with its proof, pp.47–51 (Source-specific quaternionic inclusion, central-kernel injectivity, complete component coverage, and descent transport); [KRZ20](#references) Proposition 7.1.11 and proof, pp.115–116; Lemma 7.3.1, p.120; Proposition 7.3.2, p.121 (arXiv v1) (The cited polarized Hasse-principle and Weil-descent arguments underlying BZ Proposition 6.2; transferring them to BZ's actual group remains part of the explicit PEL supplier contract))

*Needs:* `quaternionicCentralTwistAdapter` (§R18.1.1a); [R18.5.12 Local factors of the auxiliary quaternionic PEL space](#r18512-local-factors-of-the-auxiliary-quaternionic-pel-space), [R18.5.7 Arithmetic Drinfeld quotient](#r1857-arithmetic-drinfeld-quotient), [R18.1.1 One-real-split quaternionic datum](#r1811-one-real-split-quaternionic-datum); [AdicSpacesPartIII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdicSpacesPartIII/README.md) `R2`; [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M2`, `M4`; Mathlib `DoubleCoset.Quotient`, `DoubleCoset.eq`, `groupCohomology.H1ofAutOnUnitsUnique`, `groupCohomology.exists_div_of_norm_eq_one`.

### R18.5.14 Kurihara graph with lengths for arithmetic quotients

**Theorem** (`WeightedArithmeticQuotientGraph`). Let `Γ` be a discrete cocompact subgroup of `PGL₂(K)`. Form the formal/algebraic Mumford quotient by first using a normal finite-index Schottky subgroup and then its effective finite quotient. Its dual graph with lengths is `(Γ \ T)*`: take orbits of vertices and oriented edges, delete the edge orbits fixed by reversal, and retain loops and repeated edges among the rest. The length of a retained edge is the order of the stabilizer in `Γ` of any lifted oriented edge. The algebraic model is normal, proper and flat, its generic fibre is smooth of genus `1 + #edges − #vertices` of `(Γ \ T)*` (Kurihara Proposition 3-2, p.286), and its reduced connected special fibre has split ordinary nodes and rational normalizations of components. At an edge of length m the completed local equation is `xy=πᵐ`. Resolution replaces it by a path of m unit-length edges; it preserves cycle homology and the weighted cycle pairing. For positive generic genus, obtaining the minimal regular model also successively contracts rational components of valence one, as in Kurihara Proposition 3-4; valence-two components are not contracted merely for failing stability.

`Γ` acts effectively in `PGL₂(K)`; all oriented-edge stabilizers are finite. Construct the quotient using the actual Drinfeld/Mumford model and a finite-index normal Schottky subgroup. Minimal regular-model statements require generic genus greater than zero.

This is an arithmetic quotient comparison; the generic graph-with-lengths, resolution, Jacobian character lattice and monodromy theorem belong to StableReduction and Layer 4.

*Proof route.* Construct the Mumford quotient by a finite-index normal Schottky subgroup `Γ1` with `det Γ1` trivial modulo squares (Kurihara §3, p.284), algebraize it with AdicSpacesPartIII:F0.8, and divide by the finite group `Γ/Γ1`, which acts effectively on the projective model (Kurihara p.285). Use Kurihara Proposition 3-2 to identify components, split branches, length and the local ring. Edge inversions identify two branches and remove that node; BC Part III §5.4.3 explains the deletion. Use Kurihara Lemma 3-3 for the local finite quotient and the subsequent blow-up description on p.288. A thickness-m edge subdivides to m unit edges after resolving the `xy=πᵐ` singularity. Apply the existing normalization and regular-model suppliers, then the Layer 4 graph/character-lattice theorem. Under subdivision a cycle has the same coefficient on every new segment, hence contributes m times the original edge coefficient product. The generic weighted extension is an extension of that supplier, not constructed here.

**Checks.**

- If `Γ` is Schottky, there are no reversed fixed edge orbits, stabilizers are trivial and every length is one, recovering [R18.5.17 Quaternionic dual graph identification](#r18517-quaternionic-dual-graph-identification).
- An inverted edge must disappear; treating it as a retained loop is wrong.
- A node of thickness m>1 is not regular and cannot be fed to an unweighted regular-model formula without resolution.
- Genus check: the generic genus is the first Betti number of `(Γ \ T)*`, so a quotient whose reduced graph is a tree has genus zero and no minimal regular model statement applies.

(Source: [Kur79](#references) §3, Definition 3-1, pp.285–286; Proposition 3-2, pp.286–287; Lemma 3-3 and blow-up discussion, p.288; Proposition 3-4, p.289 (Arithmetic quotient graph including inversions, edge stabilizer lengths, node local rings and regularization); [BC91](#references) Part III §§5.4.1–5.4.4, pp.144–146 (The arithmetic quotient graph deletes fixed reversals; stabilizers produce thicker node equations and descent acts on the graph))

*Needs:* [R18.5.3 Standard Drinfeld formal model](#r1853-standard-drinfeld-formal-model), [R18.5.7 Arithmetic Drinfeld quotient](#r1857-arithmetic-drinfeld-quotient); [AdicSpacesPartIII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdicSpacesPartIII/README.md) `R2`, `F0.8`; [NeronModelsAndSemistableAbelianVarieties](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md) `§4.2`, `§§4.3–4.4`; Tau Ceti roadmap [StableReduction, layer 1 nodes normalization and dual graphs](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-1-nodes-normalization-and-dual-graphs); Tau Ceti roadmap [StableReduction, layer 4 blowups and intersection theory on arithmetic surfaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces); Tau Ceti roadmap [StableReduction, layer 5 regular and minimal models](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-5-regular-and-minimal-models); Mathlib `LinearMap`.

### Examples

For `K=ℚ_p` the tree is (p+1)-regular and the radius-one ball has p+2 vertices; for `q=2` each vertex has three edges. The paired heights `(1,−1)` and (2,0) both lie in `Λ` and have difference character 1, while `(2,−1)` does not lie in `Λ`. Translation by 3 on the integer line is a very free chart action; translation by 2 is free on vertices but not very free.

### Dependencies

This layer uses earlier layers R18.1; AdelicAlgebraicGroups (Layer 3, Layer 4); AdicSpacesPartIII (F0, R2); FiniteFlatGroupsAndIntegralPadicHodgeTheory (R07.1, R07.2); NeronModelsAndSemistableAbelianVarieties (Layer 4); PELModuli (M2, M4); ReductiveGroupsPartII (RG2.2); the Tau Ceti roadmaps StableReduction; Mathlib `AddSubgroup`, `DoubleCoset.Quotient`, `DoubleCoset.eq`, `LinearMap`, `MulAction`, `groupCohomology.H1ofAutOnUnitsUnique`, `groupCohomology.exists_div_of_norm_eq_one`.

## Layer R18.2, part 1: Quaternionic PEL comparisons

Fix the auxiliary CM extension, the trace lattice and the effective central kernels. Compare the generic connected components and their torsion first; this comparison is the input to arithmetic uniformisation.

### R18.2.1 Quaternionic auxiliary PEL instance

**Construction** (`QuaternionPELInstance`). For `E=F(√λ), λ<0` rational with p split in `Q(√λ)`, specialize the shared PEL datum to `B′=B⊗F E, V′=B′, ψ′(x, y)=Tr_{E/ℚ} Trd_B′/E(γ′xȳ)`, and involution `b*=γ′⁻¹ b̄γ′`. At p use `O_B′, p=O_B, p*⊕O_B, p` and the self-dual lattice `O_B, p^∨⊕O_B, p`. Verify the special `O_B, v` Lie condition and zero Lie component away from v. This full regular representation has abelian dimension `4[F:ℚ]`; the Morita-reduced E-representation has dimension `2[F:ℚ]`. Generic PEL moduli and representability are imports.

`γ′` chosen with the required positivity; sufficiently small tame level; integral trace/different factors retained.

*Construction.* Check involution, trace pairing and positivity on the existing PEL carriers. Compute the split `E_p` factors, dual lattice and determinant/Lie condition; use Carayol §2 and YZ §3.2, with the corrected dimension. Use the PEL representability theorem only at its verified good primes; division-prime geometry is supplied independently by R18.5.

Its API:

- `QuaternionPELInstance.tracePairing`: The specialized pairing is `Tr_{E/ℚ} Trd(γ′xȳ)`, with its induced involution.
- `QuaternionPELInstance.selfDual`: The chosen p-lattice equals its pairing dual.
- `QuaternionPELInstance.lieCondition`: The active v-part is special of rank one over the unramified quadratic order, and the complementary Lie part is zero.
- `QuaternionPELInstance.genericComparison`: The represented generic curve is the auxiliary canonical X′ at the specified level.

**Checks.**

- `QuaternionPELInstance.regularDimension`: For `F=ℚ` the full B′ regular representation yields abelian dimension 4, not 2.
- `QuaternionPELInstance.moritaDimension`: For `F=ℚ` the Morita-reduced E-instance yields abelian dimension 2.
- `QuaternionPELInstance.dualLattice`: If the trace lattice is not self-dual, `O_B, p⊕O_B, p` fails the perfect-pairing test; replacing the first factor by its dual passes.

(Source: [YZ18](#references) §§3.1–3.2, pp.551–555.)

*Needs:* [R18.1.7 Quaternionic PEL bridge instance](#r1817-quaternionic-pel-bridge-instance), [R18.1.3 Canonical quaternionic curve and uniformization](#r1813-canonical-quaternionic-curve-and-uniformization); [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M0`, `M1`, `M2`.

### R18.2.2 Effective small level and genus

**Theorem** (`EffectiveSmallLevel`). If `U⊂(1+N O_B)^×` with integer `N≥3`, each geometric connected component of `X_U` has genus at least 2 and its arithmetic group acts freely on the upper half-plane after quotienting by `F×`. The effective tower action divides out the closure of `F×` in `B_f×`; for `F≠Q` the closure must not be replaced by the discrete rational centre.

Compact curve hypothesis; principal level `N≥3`.

*Proof route.* Specialize [R18.1.4 Quaternionic central kernel and small levels](#r1814-quaternionic-central-kernel-and-small-levels) to the compact canonical tower and the chosen principal integral order level. Reuse its scalar-stabilizer, central-closure and hyperbolic genus conclusions; no second small-level theorem is constructed in R18.2.

(Source: [YZ18](#references) §4.1, pp.561–562, Proposition 4.1.)

*Needs:* [R18.1.4 Quaternionic central kernel and small levels](#r1814-quaternionic-central-kernel-and-small-levels).

### R18.2.3 Quaternionic p-divisible sheaf

**Definition** (`QuaternionPDiv`). On the pro-level canonical curve define `H_n=(B_p/O_B, p×X)/U_p(n)`, with `U_p(n)=(1+n O_B, p)^×` acting on the fibre by right multiplication and n supported above p. For each fixed torsion level m, shrink tame level until `U_p(1)/U_p(m)` acts freely; `H_n[m]` then descends as a finite étale `O_B, p`-module on that finite generic level. Do not assert a common finite tame level for the entire p-divisible group without proof.

The local pro-level action is free, and its lift to coefficients retains the central scalar representation; n may be 1. An effective action on the base alone does not define the coefficient action.

*Construction.* Use the quotient/torsor construction on the imported tower. Construct compatible finite torsion sheaves, verifying freeness at each torsion level. Take the filtered union and descend each finite stage, with tame level allowed to depend on that stage.

Its API:

- `QuaternionPDiv.torsion`: `H_n[m]` has fibre `m⁻¹O_B, p/O_B, p`.
- `QuaternionPDiv.changeLevel`: Pullback along n′-level to n-level identifies `H_n` with `H_n′`.
- `QuaternionPDiv.splitMorita`: At split v, `e11H_v` identifies with Carayol `E∞`.
- `QuaternionPDiv.finiteDescent`: For each m a sufficiently small tame level supports its descended finite étale sheaf.

**Checks.**

- `QuaternionPDiv.unitTorsion`: `H_n[O_F]=0`.
- `QuaternionPDiv.splitRank`: For `F_v=ℚ_p` and `B_v=M₂(ℚ_p), H_v[p]` has geometric cardinality `p^4`; `e11H_v[p]` has cardinality `p^2`.
- `QuaternionPDiv.rightAction`: A local unit u sends a fibre element x to xu; replacing it by ux generally gives a different action.

(Source: [YZ18](#references) §4.1, p.562, p-divisible groups.)

*Needs:* [R18.2.2 Effective small level and genus](#r1822-effective-small-level-and-genus), [R18.1.3 Canonical quaternionic curve and uniformization](#r1813-canonical-quaternionic-curve-and-uniformization); [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M1`.

### R18.5.19 Split-place comparison and its finite-level fields

**Comparison** (`SplitPlaceDescentBoundary`). For Carayol's split finite-place quaternionic and auxiliary PEL towers, with the fixed neutral-component identifications and sufficiently small compatible tame levels, Proposition 4.4.3 gives an isomorphism of level-zero neutral components and their `O_p`-linear p-divisible groups over `F_p^nr`, equivariant for Carayol's inclusion of coefficient extension groups `Δ⁰_coef/SL₂(O_p)→Δ⁰′_coef/SL₂(O_p)`. Here `Δ_coef` and `Δ′_coef` denote the extensions before quotienting by rational central scalars; their effective quotients `Δ̄` and `Δ̄′` act on the curves. The effective isomorphism of the geometric bases does not identify these coefficient extensions. Section 4.5.1 lifts it to the unions of p-power level structures above these level-zero components over `F_p^nr`. For each finite n, Section 4.5.5 compares the chosen neutral connected components over `F_pⁿ`, the abelian extension of `F_p^nr` inside `F_p^ab` that corresponds under local class field theory to the group `U_pⁿ` of units congruent to 1 modulo `pⁿ` (Carayol's notations, p.155); `U_p⁰` is all units, so `F_p⁰ = F_p^nr`. The compatible auxiliary tame level can depend on n. Comparison of a full union over `F_p^nr` and comparison of one selected component over `F_pⁿ` are different contracts. No division-prime or all-n common-tame conclusion follows from these split-place statements.

B at p is `M₂(F_p)`; use the Carayol determinant, reciprocity and right-Galois-action conventions. On the split rank-two Morita coefficient, a rational central scalar z acts by `z_p⁻¹`, although its effective action on the curve is trivial. Retain this scalar representation in the extension-group inclusion and in every finite torsion descent.

The finite torsion component field `F_pⁿ` corresponds by local class field theory to `U_pⁿ`; use Carayol's geometric-Frobenius normalization. Completing the comparison field gives the corresponding completed-field statement, not a descent to a smaller field.

*Proof route.* Use the equivariant geometric connected comparison of §4.2 and compare the two extension groups in §§4.3–4.4. The inertia quotient identifies the descent to `F_p^nr`. Retain the `O_p`-linear p-divisible comparison in Proposition 4.4.3. Pass to compatible torsion-trivialization spaces above the neutral level-zero component as in §4.5.1. Apply the norm-one/tame quotient in §4.5.2 and the neutral-component conclusion of §4.5.5 over its stated `F_pⁿ`. Distinguish field of definition from a theorem of minimality of that field, which is not asserted here.

**Checks.**

- The theorem never assumes `B_p` division.
- At odd p, the rational diagonal scalar −1 is identity in the effective curve group but acts by −1 on nonzero p-torsion. The local element `−1_p∈SL₂(O_p)` also moves the lift in the principal torsor; its associated-bundle relation does not make a vector equal to its negative over a fixed lift.
- `F_p⁰` is `F_p^nr`; for positive n, `F_pⁿ` can be ramified over it.

- The statement gives an auxiliary level for each fixed n, not one small tame level working uniformly at all n.
- For a split place with nontrivial level-n inertia, the full union is defined over `F_p^nr` while a selected connected component is defined over `F_pⁿ`; identifying the latter with a component already defined over `F_p^nr` would incorrectly remove its inertia permutation.

(Source: [Car86](#references) Notations, pp.155–156; §§4.2–4.5, especially Proposition 4.4.3, p.188, and §4.5.1–4.5.5, pp.188–189 (Unramified descent at level zero, torsion-level unions and the explicitly larger fields of selected finite-level components))

*Needs:* [R18.1.8 Quaternionic and PEL connected comparisons](#r1818-quaternionic-and-pel-connected-comparisons), [R18.2.3 Quaternionic p-divisible sheaf](#r1823-quaternionic-p-divisible-sheaf).

### R18.2.4 Connected quaternionic and PEL comparison

**Comparison** (`ConnectedPelComparison`). Over F̄ identify the identity pro-components `X⁰` and `X′⁰` equivariantly for the norm-positive effective groups `Δ̄≅Δ̄′`. At split v, after the indicated norm-one quotient, use `SplitPlaceDescentBoundary` (§R18.5.19): the neutral level-zero components `X₁⁰,X′₁⁰` are defined over `F_v^nr`, and the unions of torsion-level structures descend over that field. On them identify `H|X₁⁰` with `H′|X′₁⁰`, equivariantly for the inclusion of coefficient extensions of §R18.5.19. Only the underlying geometric bases carry the effective isomorphism `Δ̄≅Δ̄′`. The comparison is of connected components with specified descent, not an isomorphism of the full unrelated global towers.

The auxiliary split CM choice and effective central kernels are fixed.

*Proof route.* Reuse [R18.1.8 Quaternionic and PEL connected comparisons](#r1818-quaternionic-and-pel-connected-comparisons) for the geometric connected components over a common algebraic closure; apply Carayol §4.2 for the pro-tower and norm-one quotient. The geometric supplier does not settle arithmetic descent; use the earlier §R18.5.19 for the exact split-place fields and equivariance, and complete those fields only by base change. At division v this target asserts only the geometric comparison over F̄. Transport the p-divisible coefficients by §§4.2.3 and 4.4.3, retaining the coefficient extensions and their local scalar action. The norm-one quotient preserves Carayol's inclusion; the effective isomorphism of the bases is a separate statement.

**Checks.**

- At split v the level-zero neutral components and their divisible groups are compared over `F_v^nr`.
- At division v the geometric F̄-comparison gives no split-place arithmetic descent theorem.
- The base comparison is equivariant for the effective norm-positive groups, whereas coefficients use the unquotiented extension inclusion.
- At odd p, −1 is trivial on the curve and nontrivial on p-torsion; identifying these two acting groups fails this test.

(Source: [YZ18](#references) §4.1, Propositions 4.2–4.3, pp.562–563; [Car86](#references) §§4.2 and 4.4, pp.183–188, connected canonical and auxiliary PEL curves.)

*Needs:* `SplitPlaceDescentBoundary` (§R18.5.19); [R18.2.1 Quaternionic auxiliary PEL instance](#r1821-quaternionic-auxiliary-pel-instance), [R18.2.3 Quaternionic p-divisible sheaf](#r1823-quaternionic-p-divisible-sheaf), [R18.1.8 Quaternionic and PEL connected comparisons](#r1818-quaternionic-and-pel-connected-comparisons).

### R18.2.5 Finite-level PEL comparison

**Comparison** (`FinitePelComparison`). For n supported above p and coprime to `d_B`, and tame `U^p` sufficiently small depending on n, choose `U′^p` so that the geometric connected n-level quaternionic and auxiliary PEL curves are isomorphic; the maps and the finite torsion coefficient stages that descend at the chosen tame level agree under this isomorphism, with the coefficient-extension inclusion retained. The whole p-divisible system remains on the pro-level base. At a split place the level-zero neutral components and the union of the level structures descend to `F_v^nr`, whereas a selected connected component at level n is defined over the finite extension `F_vⁿ` of Carayol §4.5.5; the auxiliary tame level may depend on n. Neither statement is extended to division places or to one tame level uniform in n (Carayol Proposition 4.4.3 and §§4.5.1–4.5.5, pp.184–189; [R18.5.19 Split-place comparison and its finite-level fields](#r18519-split-place-comparison-and-its-finite-level-fields)).

n prime to the quaternion discriminant; smallness depends on n.
At split v use §R18.5.19 for the arithmetic comparison: the full union above the neutral level-zero component is over `F_v^nr`, and a selected connected n-component is over `F_vⁿ`. The completed-field comparison is its base change. No descent of that selected component to K is inferred.

*Proof route.* Use the connected and coefficient comparisons to identify level trivialisations. Choose finite-level tame subgroups killing the effective residual action as in Carayol Proposition 4.5.5. The named R18.1 supplier gives the geometric finite-level comparison only. Use the exact Carayol descent field and cocycle of the earlier §R18.5.19; at a split place the exact fields and equivariance are those of §R18.5.19; any extension to another field needs a separate descent proof.

**Checks.**

- For `n=0` the field is `F_v^nr`.
- For nontrivial level-n inertia, a chosen connected component uses `F_vⁿ`, although the full union is over `F_v^nr`.
- Tame level can depend on n; one level working for every n is not supplied.

(Source: [YZ18](#references) Proposition 4.4, pp.563–564; [Car86](#references) notation following §0, p.155, §§4.5.1–4.5.5, pp.188–189.)

*Needs:* `SplitPlaceDescentBoundary` (§R18.5.19); [R18.2.4 Connected quaternionic and PEL comparison](#r1824-connected-quaternionic-and-pel-comparison), [R18.1.8 Quaternionic and PEL connected comparisons](#r1818-quaternionic-and-pel-connected-comparisons).

### R18.2.6 Carayol split-place integral model

**Theorem** (`CarayolSplitModel`). If `B_v` is split, `U_v=GL₂(O_v)` and tame level is sufficiently small, `X_U` has a proper smooth model over `O_v` with canonical generic fibre; at principal `vⁿ` level the normalised cover is the regular model representing the Drinfeld-basis level problem on the special one-dimensional height-two `O_v`-divisible group. Transition and tame Hecke maps extend over `O_v`. Higher v-level models are not asserted smooth or semistable.

Carayol assumes `[F:ℚ]>1`; for Q use the modular or fake-elliptic supplier separately. The p-components away from v meet the source’s fixed-level hypotheses.

*Proof route.* Construct the auxiliary integral moduli problem by Carayol §5 and its special p-divisible factor. Apply Serre–Tate/deformation theory to this `O_v`-divisible group, allowing its ordinary étale part, and Drinfeld bases in §§6–7; no connectedness condition is imposed at split v. Transfer through the connected PEL comparison and normalisation in §9.

**Checks.**

- At maximal split v-level the model is smooth over `O_v`.
- At an ordinary point the one-dimensional height-two `O_v`-divisible group has a nonzero étale part and is not formal.
- At higher v-level the regular Drinfeld-basis model need not be smooth or semistable.

(Source: [Car86](#references) §0.2, pp.151–154; §5.4, pp.191–192; §§6–7, pp.194–198; §9, pp.207–210.)

*Needs:* [R18.2.5 Finite-level PEL comparison](#r1825-finite-level-pel-comparison); [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M2`, `M4`; Tau Ceti roadmap [StableReduction, layer 5 regular and minimal models](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-5-regular-and-minimal-models).

### R18.2.7 Torus bridge and Tate coefficients

**Comparison** (`BridgeTateComparison`). Import the canonical torus Y and datum morphism `(X×Y)/Δ(A_F, f×)≅X″` from R18.1, with `Δ(z)=(z, z⁻¹)` and effective rational-central closures. On `X₁×Y₁`, identify `f₁*T(H″)` with `π₁*T(H)⊗O_E, p π₂*T(I)`, where `I=(E_p/O_E, p×Y)/O_E, p×`. The two centre actions cancel and `H″|X′=H′`.

E embeds in B; the maximal order contains `O_E, p`, not merely its units; prescribed nearby CM types.

*Proof route.* Apply the imported torus bridge to the actual coefficient actions `x(b,e)=exb`. Compute the three Tate lattices and tensor over `O_E,p`. Check diagonal centre cancellation and finite-torsion descent.

(Source: [YZ18](#references) §5.1, pp.571–573, Proposition 5.1.)

*Needs:* [R18.2.3 Quaternionic p-divisible sheaf](#r1823-quaternionic-p-divisible-sheaf), [R18.1.9 Torus bridge for quaternionic towers](#r1819-torus-bridge-for-quaternionic-towers); [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M1`.

### Examples

The effective small-level condition removes the rational scalar stabilizer, so a level is small exactly when its effective image acts freely; a real-quadratic central unit can act trivially on `ℍ` while lying in the arithmetic group.

### Dependencies

This layer uses earlier layers R18.1; PELModuli (M0, M1, M2, M4); the Tau Ceti roadmaps StableReduction.

## Layer R18.5, part 2: Čerednik–Drinfeld uniformisation, graphs and towers

Apply the local Drinfeld construction with the exact global level and descent conventions. At a division prime the quotient at maximal local level gives the semistable model; uniformisation of the generic fibre at higher level makes no unqualified claim of integral semistability. The compatible level structures are established before the all-level theorem, which is deduced from them.

### R18.5.15 Čerednik–Drinfeld uniformisation

**Theorem** (`TotallyRealUniformisation`). For totally real F, B division split only at `τ, v` with `B_v` division, `U_v=O_B, v×` and the other p-adic factors and tame level as in BZ (6.31), the completion of the canonical integral Shimura curve over `O_Eν` identifies with `B̌×\ [(Ω̂_Fv⊗O_Fv O_Eν̌)×B_f×/U]`. Here `E=τ(F), E_ν=F_v`. It is compatible with level transitions and Hecke operators at the permitted levels. With `τ_c=Spf τ⁻¹`, natural descent corresponds on the quotient to `id_Ω×R_s×τ_c`, where `s=z_π_vΠ⁻¹` and `π_v=Nrd(Π)`, as in §R18.1.1a. The BZ quotient is first twisted by this central reciprocity cocycle; all finite Hecke labels and levels remain the same. For small tame level the model is regular semistable and stable. At the division prime the proof runs through the basic PEL uniformisation transfer of [R18.5.13 Quaternionic transfer from basic PEL uniformisation](#r18513-quaternionic-transfer-from-basic-pel-uniformisation); it does not use the split-place field comparison. The theorem uses the local formal-quotient and PEL-uniformisation targets. One is the separated formal Drinfeld quotient with its dualizing ample line, constructed here in §R18.5.11 and assembled arithmetically in §R18.5.7; AdicSpacesPartIII F0.8 supplies algebraization conditional on that line. The other is basic PEL uniformisation for the auxiliary datum, constructed here in §R18.5.13 from the PELModuli objects.

All local factors match BZ (6.31); sufficiently small `U^v` for the final stable/regular claim.

*Proof route.* Use the shared PEL/Rapoport–Zink basic uniformisation theorem with its Hasse-principle/surjectivity hypotheses. Identify the local RZ factor with Drinfeld moduli, and transfer from the auxiliary PEL curve via the open-and-closed component comparison. Apply BZ Theorem 6.7 and the central-twist comparison of §R18.1.1a, checking the exact right-s Frobenius diagram; obtain regular/stable geometry from Corollary 6.8.

**Checks.**

- At maximal division-prime level and sufficiently small tame level the original node charts have thickness one.
- The arithmetic descent uses right s on the adelic factor, separately from the homography action on Ω̂. The order-three norm-component Check of §R18.1.1a distinguishes it from right Π⁻¹.
- The division-prime theorem uses the quotient dualizing ample line and PEL transfer, and uses no ramified bridge determinant comparison.

(Source: [BZ22](#references) Theorem 6.7 and Corollary 6.8, pp.49–50.)

*Needs:* `quaternionicCentralTwistAdapter` (§R18.1.1a); [R18.5.7 Arithmetic Drinfeld quotient](#r1857-arithmetic-drinfeld-quotient), [R18.2.1 Quaternionic auxiliary PEL instance](#r1821-quaternionic-auxiliary-pel-instance), [R18.1.3 Canonical quaternionic curve and uniformization](#r1813-canonical-quaternionic-curve-and-uniformization), [R18.1.2 Quaternionic reflex field and dimension](#r1812-quaternionic-reflex-field-and-dimension), [R18.5.13 Quaternionic transfer from basic PEL uniformisation](#r18513-quaternionic-transfer-from-basic-pel-uniformisation); [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M2`.

### R18.5.16 Rational-field comparison

**Comparison** (`RationalUniformisation`). For `F=ℚ, a` division quaternion algebra ramified at p and split at infinity, and maximal p-level with sufficiently small tame `U^p`, specialize the uniformisation to BC III Theorem 5.2. Match its left/right actions via the chosen algebra anti-isomorphism and its Frobenius–determinant twist with the BZ convention followed by §R18.1.1a's central correction. The isomorphism also compares the universal special formal `O_D` modules. The split `B=M₂(Q)` modular curve is outside this division-prime assertion.

*Proof route.* Apply the totally real theorem with `F=ℚ`. Identify the invariant-swapped definite algebra and BC’s level component set. Match anti-isomorphism, determinant-valuation descent and universal formal module.

**Checks.**

- For B of discriminant 6 at `v=2`, retain §R18.1.1a's level-7 component quotient: the corrected Frobenius class is 4 rather than 2.
- The split algebra `M₂(ℚ)` has no division-prime special formal module and is excluded.
- Passing between opposite framing arrows reverses quasi-isogeny heights; it does not reverse the central reciprocity cocycle.

(Source: [BC91](#references) Part III Theorem 5.2 and comments, pp.140–142.)

*Needs:* [R18.5.15 Čerednik–Drinfeld uniformisation](#r18515-čerednikdrinfeld-uniformisation); [ModularCurvesPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md) `§§3.1, 3.14, 8.1`.

### R18.5.17 Quaternionic dual graph identification

**Comparison** (`TreeDualGraph`). At small maximal division-prime level, the geometric special-fibre dual graph is the finite disjoint union of `Γ_g\T_K` corresponding to the arithmetic quotient components. Vertices index rational components and edges index nodes, with loops and repeated edges retained in the quotient graph. The graph carries the Frobenius permutation induced by the right-s descent of §§R18.1.1a and R18.5.15, and Hecke/level maps are the transported adelic correspondences on vertex/edge orbits.

Tame level sufficiently small for free local charts; generic dual multigraph supplied by StableReduction.

*Proof route.* Read the quotient’s local semistable charts and index its components and intersections. Apply the generic normalization/dual-graph API with branch incidence, including loops. Transport descent, Hecke and level correspondences through uniformisation.

**Checks.**

- The discriminant-6, level-7 example of §R18.1.1a has the order-three component permutation induced by right s; right `Π⁻¹` gives its inverse.
- A loop contributes a node with two branches on the same component and remains an edge of the dual multigraph.
- Two distinct nodes between the same two components remain two distinct edges; collapsing them changes cycle homology.

(Source: [BC91](#references) Part III §5.4, pp.144–146 (graph); with the general monodromy theorem in Layer 4; [YZ18](#references) §8.3, ‘Multiplicity function: the superspecial case’, pp.619–620.)

*Needs:* [R18.5.15 Čerednik–Drinfeld uniformisation](#r18515-čerednikdrinfeld-uniformisation), [R18.5.3 Standard Drinfeld formal model](#r1853-standard-drinfeld-formal-model); Tau Ceti roadmap [StableReduction, layer 1 nodes normalization and dual graphs](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-1-nodes-normalization-and-dual-graphs).

### R18.5.17a Definite class-set graph at a split prime

**Construction and comparison** (`DefiniteClassSetGraph`). Let F be any totally real number field, D/F totally definite, R an Eichler order of level prime to a finite split place r, and `U=R̂×`, with `U_r=GL₂(O_r)` under the fixed splitting. Take n trivial away from r and `n_r=[[0,1],[π_r,0]]`, and put `R′=D ∩ (R̂ ∩ nR̂n⁻¹)`. Thus R′ agrees with R away from r and is the adjacent Iwahori order at r. Use QuaternionicModularForms' ordinary ideal class sets `Cl(R)=D×\D_f×/R̂×` and `Cl(R′)`, with endpoint maps `a([x])=[x]` and `b([x])=[xn]`.

The tree comparison uses `V_r=Cl(R)/F_r×` and `E_r=Cl(R′)/F_r×`, where the local centre acts through its central ideles. Its uniformizer acts by the ideal class of r; this quotient need not be omitted over F. On these quotients n gives edge reversal, since `n²` is a local central uniformizer. With the away-r component indices of AdelicAlgebraicGroups AA.4.4, identify the resulting weighted dart graph with `⊔_g Γ_g\T_r`, where `Γ_g` is the image of `D× ∩ gU^r g⁻¹` in `PGL₂(F_r)`. Endpoint maps and reversal are part of the identification. A single `Γ_g\T_r` corresponds to its component; strong approximation for D¹ at r does not collapse the reduced-norm component indices of D×.

Use the order of the finite effective vertex or directed-edge stabilizer as its weight. Over `F=ℚ` this is `|R_x×|/2` or `|R′_x×|/2`, respectively. Over general F divide out the actual rational scalar stabilizer before taking the order; the raw order-unit group can be infinite. Keep loops, parallel edges and the reversal of darts. For the geometric dual graph of §R18.5.17 retain its determinant-parity subgroup and component cover; for the shared bipartite graph interface use the two vertex copies and the maps a,b. A reversed edge at a coarse quotient is treated by §R18.5.14's deletion convention, rather than counted as an ordinary loop.

The integral Brandt matrices on free vertex and edge divisor modules, dual to the function operators of §R18.3.6, give NeronModelsAndSemistableAbelianVarieties Layer 4's `HeckeFamily`. Index the operators by split places where R is maximal: away from r use the `T_v,S_v` double cosets of §R18.3.6 on both class sets. At the exceptional place r use vertex adjacency `T_r` and the edge Iwahori operator `U_r`, which counts successor darts without immediate reversal, with orbit multiplicities. On the r-central quotient its incidence identities are `a_* U_r=q_r b_*` and `b_* U_r=T_r b_*−a_*`; hence it preserves the common kernel of the endpoint maps. Prove commutation, equivariance of both incidence maps away from r, and compatibility with the weighted Gram map and inverse-coset adjoints. Transport these actions through the tree comparison, retaining central `S_v` operators. This target follows the class-set graph interface of the Imperial College London FLT project.

*Proof route.* Use the supplier's completed-lattice and ideal-class dictionary. The stabilizers of a vertex and an ordered adjacent pair in `GL₂(F_r)` are `F_r×GL₂(O_r)` and `F_r×U′_r`. Apply the S-arithmetic decomposition of AdelicAlgebraicGroups AA.4.4 and its D¹ strong approximation theorem, retaining the norm fibres. Orbit–stabilizer gives the weights and local neighbour multiplicities. The shared finite Hecke operators give the Brandt matrices and incidence identities. Relate these arithmetic weights to geometric node thickness only through the quotient-chart hypotheses of §R18.5.14.

**Checks.**

- Over `ℚ`, a principal r makes its local central idele trivial on both ordinary class sets. The Hurwitz maximal order has 24 units and effective weight 12, rather than 24.
- At a split r with trivial coefficients, the Brandt operator on constant functions is multiplication by `q_r+1`, even when several neighbours have the same class. Replacing the multigraph by a simple graph loses this multiplicity.
- For a real quadratic F, `O_F×` has positive rank: dividing `R_x×` only by `{±1}` does not produce a finite stabilizer. The effective central quotient does.
- In the rational standard Shimura-curve case the parity-preserving quotient has two vertex copies, as in [Zha14] (3.14)–(3.17). The one-copy class-set correspondence is not already that special-fibre graph.

(Source: [Zha14](#references) §3.4, pp.208–209, (3.14)–(3.17); [BC91](#references) Part III §5.4, pp.144–146; the general-field comparison is the displayed local stabilizer calculation and AdelicAlgebraicGroups AA.4.4.)

*Needs:* [QuaternionicModularForms](../QuaternionicModularForms/README.md) `§§0.1–0.3, 3.1`, with the order interface in Exact supplier contracts; [AdelicAlgebraicGroups AA.4.4](../AdelicAlgebraicGroups/README.md#s-arithmetic-double-cosets) and [AA.4.2](../AdelicAlgebraicGroups/README.md#quaternion-norm-one-strong-approximation); [GL2AutomorphicRepresentationsAndTransfer §R17.1.5](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-1-swapped-quaternion-invariants); [NeronModelsAndSemistableAbelianVarieties Layer 4](../NeronModelsAndSemistableAbelianVarieties/README.md#layer-4-picard-schemes-of-semistable-curves-and-the-monodromy-pairing) for the [weighted graph](../NeronModelsAndSemistableAbelianVarieties/README.md#weighted-graph) and [`HeckeFamily`](../NeronModelsAndSemistableAbelianVarieties/README.md#hecke-family); [R18.3.6 Split Hecke normalization](#r1836-split-hecke-normalization); [R18.5.14 Kurihara graph with lengths for arithmetic quotients](#r18514-kurihara-graph-with-lengths-for-arithmetic-quotients).

### R18.5.18 Quaternionic character lattice and monodromy

**Comparison** (`CharacterMonodromy`). For the Jacobian of a small-level semistable uniformized curve, identify the toric character lattice with `H₁(Γ_g\T_K, ℤ)`, compatibly with Hecke and the right-s descent of §R18.5.17. Under the generic semistable-Jacobian monodromy theorem the pairing is the oriented cycle edge pairing `Σ_e` thickness(e) `a_e` `b_e`. At the unramified regular maximal-level model thickness is 1. Its cokernel presents the geometric component group using the dual lattice; Frobenius descent determines the arithmetic group.

Generic semistable Jacobian/Néron and graph monodromy theorem supplied; connected component handled separately.

*Proof route.* Apply the supplied character-lattice theorem to the identified nodal graph. Compute all edge lengths from `xy=π` charts. Transport Hecke/Frobenius action and distinguish geometric component-group cokernel from its descended points.

**Checks.**

- A graph consisting of one loop of thickness one has character lattice `ℤ` and cycle pairing `(a,b)↦ab`.
- A tree has zero cycle homology and hence zero toric character lattice; counting all edges without the cycle condition gives a wrong rank.
- On the order-three component quotient of §R18.1.1a, Frobenius must transport character lattices by the corrected right-s permutation before arithmetic invariants are taken.

(Source: [BC91](#references) Part III §5.4, pp.144–146 (graph); with the general monodromy theorem in Layer 4.)

*Needs:* [R18.5.17 Quaternionic dual graph identification](#r18517-quaternionic-dual-graph-identification); [NeronModelsAndSemistableAbelianVarieties](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md) `Layer 4`; [WeightsInEtaleCohomology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/WeightsInEtaleCohomology/README.md) `R34.3, Proper specialization over an arithmetic trait`; Tau Ceti roadmap [StableReduction, layer 6 numerical types and picard torsion](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-6-numerical-types-and-picard-torsion).

**Torsion realization** (`ShimuraJacobianTorsionDatum`). Let X/F be a smooth proper quaternionic Shimura curve with sufficiently small tame level and maximal level at two distinct finite division places `r₁,r₂` of B. Let `J=Pic⁰(X/F)`, and let ℓ be a rational prime different from both residue characteristics. At each rᵢ assume the semistable uniformisation hypotheses of §R18.5.15, and use the exchanged definite algebra supplied by GL2AutomorphicRepresentationsAndTransfer §R17.1.5. Construct `TwoPlaceSemistableTorsionDatum` satisfying `TwoPlaceSemistableTorsionLaws` from NeronModelsAndSemistableAbelianVarieties §4.14 on the single global module `T=J[ℓ](F̄)`, with its continuous Galois action and commuting Hecke action. Use the integral Hecke ring in `End_F(J)` generated by the shared good-place presentation of §R18.3.15 and the distinguished bad-place correspondences `t_r₁,t_r₂`; its actions on the lattices, component groups and T all come from these same endomorphisms. For a finite S containing all bad-reduction places and all places above ℓ, use the actual integral Frobenius polynomials `P_v` of the good fibres for its shared global good-place laws.

More explicitly, write `X_i=H₁(Γ_i\T_rᵢ,ℤ)` for the character lattice of §R18.5.18, retaining all arithmetic components. The local filtration has `T_iᵗ=T_i⁰=Hom(X_i,μ_ℓ)` and `T_iᶠ=T^{I_rᵢ}`; the abelian-quotient term is zero. Construct the specialization exact sequences of geometric groups

```text
0 → T_iᵗ → T^{I_rᵢ} → Φ_i[ℓ] → 0,
Φ_i = coker(X_i → X_i∨),
```

where the map to the dual lattice is the thickness-weighted monodromy map. The graph and Brandt identifications use §R18.5.17a with the actual parity/component cover. Prove Hecke equivariance, the dual action on `Hom(X_i,μ_ℓ)`, compatibility with the component-group action, and agreement of the two local structures with the same global T. For arithmetic Frobenius let Fᵢ be its action on Xᵢ obtained from the corrected right-s descent; its toric action is `f ↦ q_rᵢ · (f ∘ Fᵢ⁻¹)`. Identify the distinguished bad-place correspondences with their transported actions, keeping the inverse, dual and central factors. Under the additional operator hypothesis that `t_rᵢ` gives both the character-dual and period actions, deduce the supplier’s `SemistableTorsionFrobeniusLaws`: arithmetic Frobenius is `q_rᵢ t_rᵢ` on `T_iᵗ` and `t_rᵢ` on `T/T_iᵗ`. An involutive Atkin–Lehner normalization is used only when the central action makes it involutive.

*Proof route.* Apply `CharacterMonodromy` at both division places. The uniformized Jacobian has totally toric connected special fibre. Prime-to-residue-characteristic torsion specialization to the Néron model over the strict henselization identifies inertia invariants with special-fibre torsion. Multiplication by ℓ is surjective on the geometric torus, giving the displayed exact sequence onto `Φ_i[ℓ]`. Transport the toric and component maps, including their adjoints, through the shared `HeckeFamily`. Good-reduction specialization and the good-fibre characteristic polynomial give unramifiedness and `P_v(F_v)=0` on T outside S. Continuity of the action on the finite module gives a common finite Galois extension through which both local structures factor. Data and their laws remain separate in the supplier's interface.

**Checks.**

- A split Tate factor with parameter of valuation ℓ has `X_i=ℤ`, monodromy `[ℓ]` and `Φ_i[ℓ]=ℤ/ℓ`. Its toric subgroup is strictly smaller than `T^{I_rᵢ}`; specialization cannot be replaced by zero.
- Both local structures have underlying module `J[ℓ](F̄)` of dimension `2 dim J` over `𝔽_ℓ`. Choosing unrelated modules of that dimension does not give a two-place datum.
- If ℓ equals either residue characteristic, the finite-étale specialization argument does not apply. The target retains both exclusions, including when the places lie over different rational primes.
- On the order-three component quotient of §R18.1.1a, the toric Frobenius formula uses the inverse corrected permutation and the cyclotomic factor; replacing it by an involution loses the descent action.

(Source: [BC91](#references) Part III §5.4, pp.144–146; [Zha14](#references) §6.3, pp.228–229, for the inertia-invariant torsion extension; NeronModelsAndSemistableAbelianVarieties §§4.2–4.5 for graph monodromy and the component cokernel.)

*Needs:* [R18.5.15 Čerednik–Drinfeld uniformisation](#r18515-čerednikdrinfeld-uniformisation), [R18.5.17a Definite class-set graph at a split prime](#r18517a-definite-class-set-graph-at-a-split-prime), [R18.5.18 Quaternionic character lattice and monodromy](#r18518-quaternionic-character-lattice-and-monodromy); [NeronModelsAndSemistableAbelianVarieties Layer 4](../NeronModelsAndSemistableAbelianVarieties/README.md#layer-4-picard-schemes-of-semistable-curves-and-the-monodromy-pairing), including its [two-place torsion interface](../NeronModelsAndSemistableAbelianVarieties/README.md#semistable-jacobian-torsion), and `§§5.0a–5.0c`; [GL2AutomorphicRepresentationsAndTransfer §R17.1.5](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-1-swapped-quaternion-invariants); [R18.3.15 Residual quaternionic Hecke ideal](#r18315-residual-quaternionic-hecke-ideal).

### R18.5.20 Compatible Drinfeld level structures on the uniformized tower

**Comparison** (`DrinfeldLevelStructureComparison`). For sufficiently small tame level in the CDN20 global division-prime setup, pullback of the quaternionic special formal `O_D`-module under uniformisation agrees, with its action and framing convention, with the universal Drinfeld module. Therefore its finite generic-fibre torsion-level functors are the Drinfeld covers `M_n` in the CDN congruence convention, and the quotient identifies the entire inverse system `Sh_n(U)^an` with `B̌ times \ [M_n times B̌(A_f^v) times/U]` for n at least 1. These identifications commute with forgetting local level, shrinking tame level and away-v Hecke correspondences, and carry the full central-twisted Weil action of §R18.1.1a. At higher level both the exact Frobenius translation and the unit inertia correction are retained. This contract refers to an actual module comparison; unrelated isomorphisms of the base curves do not induce it. It makes no semistability or regularity assertion for all integral higher-level covers.

Translate CDN's B (definite) to this document's B̌, CDN's B̌ (indefinite) to B, and CDN's local F to K. Use its exact division congruence subgroup `Ǧ_n=1+ϖ_Dⁿ O_D` for n at least 1, where `ϖ_D` is a division-algebra uniformizer.

At each actual finite moduli level take a fine tame cover on which the universal special formal module exists. Quotient equivariance of this module is part of the theorem, not assumed from a coarse universal family.

*Proof route.* Use the uniformisation with the universal special formal module in BC Part III Theorem 5.2 and the BZ moduli-compatible construction (6.2)–(6.7), transported to the quaternionic selected components. Pull back the module along §R18.1.1a's geometric central-twist comparison, transporting its fibre descent by the central cocycle, and identify it with §R18.2.3's module before applying any torsion-level functor. Identify the canonical-model tower at v with torsion-level spaces of the generic p-divisible group H of [R18.2.3 Quaternionic p-divisible sheaf](#r1823-quaternionic-p-divisible-sheaf). Its ideal-indexed levels `U_p(n) = 1 + nO_B,p` give, at v, only the levels `1 + πᵐ O_D = 1 + Π^{2m} O_D`; the odd division levels `Ǧ_{2m+1}` need the Π-torsion `X[Π^{2m+1}]` of the module itself. Apply the same finite torsion-level functor on both actual modules and the exact `Ǧ_n` division congruence convention. The forgetful maps commute because they are restrictions of compatible trivializations. Descend along the effective arithmetic action and compare with CDN Proposition 5.4. Keep rigid generic fibres throughout the higher-level conclusion.

**Checks.**

- Confusing powers of the central uniformizer with powers of the division uniformizer changes the level.
- The assertion is functorial in n and U, not merely levelwise existence.
- Dropping smallness can remove the natural universal formal-module datum on a coarse quotient.

(Source: [CDN20](#references) §4.1, p.34 (division congruence convention); §5.2.1–5.2.2, Proposition 5.4 and Remark 5.5, pp.40–43 (Congruence-level rigid tower and simultaneous transition compatibility); [BC91](#references) Part III Theorem (5.2), pp.140–141, §5.3.2, p.142, Theorem (5.5), p.146 (Module-compatible rational uniformisation and the loss of a natural universal module at a nonsmall coarse quotient); [BZ22](#references) §6, (6.2)–(6.7), pp.40–42; Theorem 6.7, pp.50–51 (The uniformisation morphism is constructed from the actual p-divisible group, not just the underlying formal curve))

*Needs:* `quaternionicCentralTwistAdapter` (§R18.1.1a); [R18.5.13 Quaternionic transfer from basic PEL uniformisation](#r18513-quaternionic-transfer-from-basic-pel-uniformisation), [R18.2.3 Quaternionic p-divisible sheaf](#r1823-quaternionic-p-divisible-sheaf), [R18.5.4 Special formal quaternionic moduli](#r1854-special-formal-quaternionic-moduli), [R18.5.5 Drinfeld representability theorem](#r1855-drinfeld-representability-theorem); [FiniteFlatGroupsAndIntegralPadicHodgeTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md) `R07.1`.

### R18.5.21 All-level Drinfeld tower uniformisation

**Theorem** (`TowerUniformisation`). In CDN20 §5.2.1, E is totally real with `E_𝔭=K`; B̌ is split only at `∞₀` and division at 𝔭; B exchanges these invariants and is definite. With the fixed identifications of local and away-𝔭 groups, sufficiently small tame U and the exact congruence subgroups `Ǧ_n` at 𝔭, there are rigid isomorphisms `Sh_n(U)^an≅B×\ [M_n×B(A_f^𝔭)×/U]` for every `n≥1`, compatible in n, U and with the full central-twisted Galois action of §R18.1.1a, including its unit corrections. `M_n` is the corresponding Drinfeld cover defined by the universal special formal module’s level structure. The theorem is on rigid generic fibres; it does not assert every high-level integral cover is semistable without alteration. The compatible level structures of [R18.5.20 Compatible Drinfeld level structures on the uniformized tower](#r18520-compatible-drinfeld-level-structures-on-the-uniformized-tower) are established first; the all-level statement is deduced from them, never the reverse.

Exact CDN20 tower convention `Ǧ_n` retained; U sufficiently small.

*Proof route.* Construct the generic Drinfeld covers from the universal formal module and matching local congruence levels. Use the basic Rapoport–Zink uniformisation of the auxiliary PEL family with p-level structures on the rigid generic fibre (PELModuli M2 contract), transported through the open-and-closed component comparison; it identifies the v-part of the quaternionic p-divisible group with the pullback of the universal special formal module, so the level-n covers on both sides are the same torsors of level structures. The maximal-level theorem alone does not give the tower. Apply CDN Proposition 5.4 and verify the commuting transitions and away-level actions.

**Checks.**

- The transition from `n+1` to n restricts a torsion trivialization; composing two transitions agrees with restriction directly to the lower level.
- At higher division level s and Π can differ by a unit outside the level; their right actions cannot then be identified.
- Generic-fibre tower uniformisation does not imply regular semistability of every integral higher-level cover.

(Source: [CDN20](#references) §5.2.1–5.2.2, pp.40–43, Proposition 5.4; [BC91](#references) Part III §5.5, Théorème (5.5), p.146.)

*Needs:* `quaternionicCentralTwistAdapter` (§R18.1.1a); [R18.5.5 Drinfeld representability theorem](#r1855-drinfeld-representability-theorem), [R18.5.15 Čerednik–Drinfeld uniformisation](#r18515-čerednikdrinfeld-uniformisation), [R18.2.3 Quaternionic p-divisible sheaf](#r1823-quaternionic-p-divisible-sheaf), [R18.5.20 Compatible Drinfeld level structures on the uniformized tower](#r18520-compatible-drinfeld-level-structures-on-the-uniformized-tower); [FiniteFlatGroupsAndIntegralPadicHodgeTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md) `R07.1`; [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M2`.

### Examples

For B over `ℚ` of discriminant pq with p a division prime, the special fibre of the maximal-level model at p is a union of P¹'s indexed by the vertices of a finite quotient of the tree of the definite algebra of discriminant `q·∞`; an edge reversed by an element of the stabilizer is deleted rather than turned into a loop.

### Dependencies

This layer uses earlier layers R18.5, R18.2, R18.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory (R07.1); ModularCurvesPartII (§§3.1, 3.14, 8.1); NeronModelsAndSemistableAbelianVarieties (Layer 4); PELModuli (M2); WeightsInEtaleCohomology (R34.3); the Tau Ceti roadmaps StableReduction.

## Layer R18.2, part 2: Integral quaternionic models and Hodge comparisons

Construct the model tower from split-prime deformation theory and division-prime uniformisation. Extend level maps, Hodge lines and p-divisible groups, keeping the fine and coarse cases apart, then prove the integral comparisons along the CM bridge.

### R18.2.8 Regular quaternionic model tower

**Theorem** (`RegularModelTower`). Let n be coprime to `d_B` and `U^p⊂U^p(N)` for an integer `N≥3` prime to p. The minimal regular models `X_{n, U^p}/O_v` form a projective system extending canonical level maps. At v∤n the model is smooth if `B_v` splits and a semistable relative Mumford curve if `B_v` is division. The division case has maximal local level.

Fine principal tame level as stated; no assertion for arbitrary level at `d_B`.

*Proof route.* Use split-place Carayol geometry and the division-place formal uniformisation separately. Use `genus≥2` minimal regular-model uniqueness and the effective-level freeness argument of YZ Theorem 4.5. Extend transition maps through the common moduli/normalisation interpretation.

(Source: [YZ18](#references) §4.2, Theorem 4.5, pp.564–565.)

*Needs:* [R18.2.2 Effective small level and genus](#r1822-effective-small-level-and-genus), [R18.2.6 Carayol split-place integral model](#r1826-carayol-split-place-integral-model), [R18.5.15 Čerednik–Drinfeld uniformisation](#r18515-čerednikdrinfeld-uniformisation); Tau Ceti roadmap [StableReduction, layer 5 regular and minimal models](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-5-regular-and-minimal-models).

### R18.2.9 Coarse quaternionic integral models

**Theorem** (`CoarseModel`). For any decomposed compact open U maximal at each prime dividing `d_B`, construct `X_U` as the effective finite quotient of a sufficiently small normal fine model. It is normal, projective and flat over `O_F`, independent of the auxiliary prime used to rigidify level, and has canonical generic fibre. The quotient map is finite of degree the effective group order; it need not be flat everywhere or have regular target.

Fine normal cover `U′⊂U` and effective group Ū/Ū′; maximality at `d_B`.

*Proof route.* Choose auxiliary p coprime to 2`d_B` with maximal `U_p` and principal p-level. Take the finite invariant quotient on the imported scheme-quotient carrier. Compare two auxiliary primes using the regular tower; deduce normality, projectivity and flatness over the Dedekind base.

(Source: [YZ18](#references) §4.2, p.565 and Corollary 4.6.)

*Needs:* [R18.2.8 Regular quaternionic model tower](#r1828-regular-quaternionic-model-tower); [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M4`; Tau Ceti roadmap [StableReduction, layer 0 relative curves and extensions of dvrs](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-0-relative-curves-and-extensions-of-dvrs); Mathlib `AlgebraicGeometry.Flat`.

### R18.2.10 Integral Hecke extensions

**Theorem** (`HeckeIntegralExtension`). For admissible levels maximal at `d_B`, a finite generic level map extends to the model tower. Tame Hecke correspondences whose local v-component preserves the specified model problem extend via the two finite maps from the common intersection level, with composition and generic-fibre agreement. Finite étaleness over `O_v` is asserted only when local p-level/lattice data are unchanged and the relevant PEL deformation criterion applies.

Both source, target and intersection levels satisfy the model hypotheses. No unqualified extension of every p-isogeny as an étale map.

*Proof route.* Use the projective-system maps and transport the adelic g-action through the local integral moduli interpretation. Apply finite-map comparison and normalization for each leg. Check Hecke composition on the generic fibre and use separatedness for uniqueness.

(Source: [YZ18](#references) Theorem 4.5 and Corollary 4.6, pp.564–566.)

*Needs:* [R18.2.8 Regular quaternionic model tower](#r1828-regular-quaternionic-model-tower), [R18.2.9 Coarse quaternionic integral models](#r1829-coarse-quaternionic-integral-models); [AdelicAlgebraicGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md) `Layer 4`.

### R18.2.11 ℚ-factorial coarse models

**Theorem** (`QfactorialModel`). If L/F is finite and unramified at all finite places where B ramifies or U is not maximal, `X_U⊗O_L` is ℚ-factorial: every Weil divisor has a positive multiple Cartier. This does not assert regularity of the coarse model.

U maximal at `d_B`; unramified base change at the bad set.

*Proof route.* Use regular fine covers after the allowed base extension. Apply the product norm over the finite quotient to local divisor equations. Use two auxiliary primes to cover the entire arithmetic surface.

(Source: [YZ18](#references) Corollary 4.6(2), p.566.)

*Needs:* [R18.2.9 Coarse quaternionic integral models](#r1829-coarse-quaternionic-integral-models); Tau Ceti roadmap [StableReduction, layer 4 blowups and intersection theory on arithmetic surfaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces).

### R18.2.12 Quaternionic arithmetic Hodge line

**Construction** (`QuaternionHodgeLine`). On the normal ℚ-factorial compact curve model construct the hermitian rational line `L_U`, using invertible sheaves, the rational Picard group and norms under finite covers. It is compatible with admissible level pullback; at fine level and maximal `U_v` it is the relative dualizing line. At an archimedean point z its metric has `‖dz‖=2` Im z. On the coarse generic fibre, as a rational divisor class, `L_U=ω_{X_U/F}+Σ_Q(1−1/e_Q)[Q]`, where `e_Q` is the effective ramification index. Construct the local extension as the norm of the fine dualizing line divided by the effective cover degree; prove independence of the cover and glue using two distinct auxiliary primes. The metric is part of this quaternionic line construction; intersection heights require additional arithmetic intersection theory.

U maximal at `d_B`; fine models and rational line bundles supplied; `e_Q` is the effective ramification index.

*Construction.* Apply the generic divisor/line and norm/descent API on each rigidifying cover. Normalize by the effective degree and glue; the regular model tower proves independence. Check the archimedean metric against the explicit Hodge calculation, using the corrected sign.

Its API:

- `QuaternionHodgeLine.pullback`: Every admissible level map pulls `L_target` back to `L_source`.
- `QuaternionHodgeLine.fineDualizing`: At fine maximal local level `L_U|O_v` is the relative dualizing line.
- `QuaternionHodgeLine.coarseCorrection`: At branch point Q the correction coefficient is `1−1/e_Q`.
- `QuaternionHodgeLine.metric`: Under uniformisation the differential dz has norm 2 Im z.
- `QuaternionHodgeLine.unique`: Any system of hermitian Q-line bundles on the models `X_U` (U maximal at `d_B`) that is compatible with level pullback, equals the relative dualizing line at fine level and maximal `U_v`, and has archimedean metric `|dz|=2` Im z, is canonically isomorphic to `L_U` (YZ Theorem 4.7, uniqueness).

**Checks.**

- `QuaternionHodgeLine.unramified`: When every `e_Q=1`, the generic `L_U` equals `ω`.
- `QuaternionHodgeLine.indexTwo`: At an effective ramification point of index 2, the correction is [Q]/2.
- `QuaternionHodgeLine.imaginaryUnit`: At `z=i, |dz|=2`.
- `QuaternionHodgeLine.metric_offAxis`: At `z=1+i`, the norm of dz is 2, whereas `2|z|=2√2`.
- `QuaternionHodgeLine.metric_real`: At real z the formula gives 0; it defines a norm on the Hodge line only for `z∈ℍ`.

In [Suggested.lean](Suggested.lean): `QuaternionHodgeLine.metric`.

(Source: [YZ18](#references) §4.2, Theorem 4.7 and its proof, pp.567–568.)

*Needs:* [R18.2.11 ℚ-factorial coarse models](#r18211-ℚ-factorial-coarse-models), [R18.2.10 Integral Hecke extensions](#r18210-integral-hecke-extensions); Tau Ceti roadmap [JacobianChallenge, layer a line bundles divisors picard group degree](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md#layer-a-line-bundles-divisors-picard-group-degree); Tau Ceti roadmap [AlgebraicVectorBundles, roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicVectorBundles/README.md).

### R18.2.13 Integral quaternionic p-divisible group

**Theorem** (`IntegralPdiv`). For n prime to `d_B` the generic `H_n` extends over the pro-limit of fine models over `O_K`. Its v-factor is a strict special `O_{B,v}`-divisible group and the factors away from v are étale. At a division place the v-factor is formal; at a split place it is the matrix-algebra Morita lift of a one-dimensional height-two `O_v`-divisible group, which may have an étale part. The completed maximal-local-level model is the deformation space with the prescribed `O_B`-action; `n=v^a n′` level classifies a Drinfeld `v^a`-basis and a full étale n′-level structure. At division v the allowed n has `a=0`.

Strict `O_v`-module convention; active relative Lie rank 2 and `O_v`-height 4; absolute p-height `4[F_v:ℚ_p]`.

*Proof route.* Transfer the auxiliary PEL p-divisible group using connected components and finite torsion descent. Apply Carayol deformation theory at split v and Drinfeld representability at division v. Recover the exact integral level problem; retain strictness and coefficient component conditions.

**Checks.**

- At an ordinary split-place point, `H_v=G²` with G ordinary of height two; its étale quotient has `O_v`-height two, so `H_v` is not formal.
- At a division place the special `O_{B,v}`-divisible group is formal of `O_v`-height four.
- Morita reduction at split v gives dimension one and height two; the full `H_v` has dimension two and height four.

(Source: [YZ18](#references) Theorem 4.9, pp.568–569.)

*Needs:* [R18.2.3 Quaternionic p-divisible sheaf](#r1823-quaternionic-p-divisible-sheaf), [R18.2.8 Regular quaternionic model tower](#r1828-regular-quaternionic-model-tower), [R18.5.5 Drinfeld representability theorem](#r1855-drinfeld-representability-theorem); [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M1`.

### R18.2.14 Integral quaternionic Kodaira–Spencer

**Theorem** (`IntegralKodairaSpencer`). Let v|p, allowing `F_v/ℚ_p` ramified, and let `X_{U,v}` be a finite regular fine proper model at maximal v-level over `O_v^{ur}`, the integers of the completed maximal unramified extension K of `F_v`. It is smooth for split `B_v`, and semistable with node equation `xy=π_v` for division `B_v`. First define the finite-level algebraic line `N_U=L_U^{⊗2}(−d_{B,v})` from §R18.2.12, where `L_U=ω_{X_{U,v}}` at this fine level and `d_{B,v}` is zero in the split case and the reduced special fibre in the division case.

Let `q:𝔛_v→X_{U,v}` be the pro-limit of compatible fine tame models and H the integral v-divisible group of §R18.2.13 on that pro-model, a strict special `O_{B,v}`-module of `O_v`-height 4 and relative dimension 2. Form its covariant Dieudonné crystal and Hodge filtration on the completed pro-model `𝔛̂_v`, or on its local PEL deformation charts, not on the finite model. For `J=ker(O_v⊗_{ℤ_p}O_{𝔛̂_v}→O_{𝔛̂_v})`, put

```text
M = D(H)/J·D(H),   W^t = ω_{H^t}/J·D(H) ⊂ M,   W = Lie(H)^∨,   N_pro = det W ⊗ det W^t.
```

Then:

- (i) **Saturated filtration.** `0→W^t→M→Lie(H)→0` is an exact sequence of locally free `O_{𝔛̂_v}`-modules of ranks 2, 4 and 2, stable under `O_{B,v}`. This is the saturated relative filtration. When `F_v/ℚ_p` is unramified it is the summand of the absolute Hodge filtration cut out by the idempotent of the structure embedding.
- (ii) **Kodaira–Spencer on the pro-model.** The descended Gauss–Manin connection induces `N_pro≅q*ω_{X̂_{U,v}}^{⊗2}(−d_{B,v})≅q*N̂_U`. This comparison is compatible with local PEL charts and tame level changes, with their coefficient-extension actions.
- (iii) **Finite-level determinant descent.** Prove that this comparison carries the coefficient determinant action to the pullback action on `q*N̂_U`, including rational central scalars and the entire tame descent groupoid. A scalar a acts with reciprocal weights on the two rank-two Hodge factors; their determinant multipliers `a²` and `a⁻²` cancel. The functorial deformation/connection comparison supplies the cocycle on overlaps. Thus `N_pro` and its Kodaira–Spencer map descend as `N̂_U≅ω_{X̂_{U,v}}^{⊗2}(−d_{B,v})` on the finite formal model. Algebraize that descended isomorphism by proper Grothendieck existence on `X_{U,v}`. The line N_U is already algebraic by its definition; no descent of the whole H to `X_{U,v}` is required.

The quotient of `ω_{H^t}` by `J·ω_{H^t}` (the raw τ-quotient) is not used: when `F_v/ℚ_p` is ramified it does not inject into M.

*Proof route.* All crystalline and tangent calculations take place on the completed pro-model or its local PEL charts. (i) Strictness says that `O_v` acts on Lie(H) through the structure map, so `J·D(H)⊂ω_{H^t}` and the sequence is exact. For local freeness, it suffices that D(H) is locally free over `O_v⊗_{ℤ_p}O_{𝔛̂_v}`. At a closed point the Dieudonné module over the perfect residue field is free over `O_v⊗W(k̄)`: that ring is a finite product of discrete valuation rings, and Frobenius permutes the factors, which forces equal ranks. The fibrewise criterion for flatness over the finite flat `O_{𝔛̂_v}`-algebra `O_v⊗O_{𝔛̂_v}` then gives local freeness of D(H), so M is locally free of rank 4. Lie(H) is locally free of rank 2 by §R18.2.13, hence so is `W^t`. (ii) Over a first-order thickening, Grothendieck–Messing identifies the `O_{B,v}`-stable lifts of `ω_{H^t}` with `O_{B,v}`-linear maps `ω_{H^t}→Lie(H)`. A lift is strict exactly when it contains `J·D(H)`, that is, when the map kills `J·D(H)`. So the tangent space of strict `O_{B,v}`-deformations is `Hom_{O_{B,v}⊗O_{𝔛̂_v}}(W^t, Lie(H))`, and since `𝔛̂_v` is the universal deformation space (§R18.2.13), `ω_{𝔛̂_v}^∨≅Hom_{O_{B,v}}(W^t, Lie(H))`. The Gauss–Manin connection is `O_v`-linear because `O_v`-constants have zero differential, so it preserves `J·D(H)`. Take determinants as in YZ18. At split v the matrix idempotents give the result directly. At division v use the `O_{K₀}`-eigenspaces and the j-grading with `j₁j₂=π_v`. The identity `πω²=N_pro` holds wherever one of `j₁, j₂` is invertible, that is, away from the nodes, where both can be nonunits. Extend the isomorphism of line bundles across the nodes, which have codimension two in each regular two-dimensional finite deformation chart. (iii) Functoriality of the connection and determinant comparison identifies the tame descent cocycle with the pullback cocycle of N_U. Verify the reciprocal central weights before descending. Apply proper existence only to the resulting finite-level formal isomorphism.

**Checks.**

- At split v the pro-level comparison pulls back `N_U=L_U²`; at division v it pulls back `L_U²(−[special fibre])`.
- For `[F:ℚ]>1`, any fixed finite tame level contains the away-p components of an infinite-order global unit ε. Its away-p action is trivial on `X/U_p`, since diagonal ε is central and its p-component lies in U_p, but acts by `ε_v^{±1}` on coefficients and is detected at some finite torsion stage. No fixed tame shrink descends this entire prescribed coefficient system.
- On the determinant line the same scalar contributes `ε_v² ε_v⁻²=1`; this cancellation permits line descent without group descent.
- Proper existence on `X_{U,v}` applies to a formal line and map already descended there, not to a line defined only on `𝔛̂_v`.

(Source: [YZ18](#references) Theorem 4.9, pp.568–569, and Theorem 4.10 with proof, pp.569–570. The paragraph after Theorem 4.10, p.570, defines the finite-level line `N(n)=L(n)²(−d_B)` and its pro-level pullback comparison. The source writes the Hodge pieces of the relative crystal without constructing them at ramified v; the saturated construction (i) and the strict tangent computation in the proof route supply that step.)

*Needs:* [R18.2.13 Integral quaternionic p-divisible group](#r18213-integral-quaternionic-p-divisible-group), [R18.2.12 Quaternionic arithmetic Hodge line](#r18212-quaternionic-arithmetic-hodge-line); AbelianSchemesAndArithmeticModuli §A4.CR.7.2; CrystallineCohomology §CR.7.3; AlgebraicModuliForArithmeticGeometry §3.5 (line descent); SchemeAndStackFoundations §1.22 (descent cocycles); Tau Ceti roadmap [StableReduction, layer 4 blowups and intersection theory on arithmetic surfaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces).

### R18.2.15 Integral torus-bridge model

**Theorem** (`BridgeIntegralModel`). Over `K′=(F′_{v′}^{ur})^`, where F′ is the minimal bridge reflex field of §R18.1.6 and `v′|v`, the bridge identifies `X″₁` with the quotient of `X₁×Y₁`. Extending `Y₁` by copies of Spec `O_K′` transports the model of `X₁` to a flat model of `X″₁` and its open-and-closed `X′₁` components. It is smooth if `B_v` splits and has stable Mumford fibres if `B_v` is division; ramified K′/K base change need not preserve regularity.

For `g=1`, `F′=ℚ` and `K′=(ℚ_p^{ur})^=K`; passing to a completion of E is an additional base change. The bridge’s effective quotient and descent data are supplied.

*Proof route.* Extend the zero-dimensional unramified torus components. Descend the product model along the effective diagonal action. Compute the completed node after ramified base change.

**Checks.**

- For `F=ℚ`, `E=ℚ(i)` and an indefinite B of discriminant 6, at any p the minimal bridge completion has `K′=K=(ℚ_p^{ur})^`.
- If p splits in E in degree one, each completion of E at p is already `ℚ_p`; choosing one does not enlarge K′.
- Under a further ramified extension with `π=uϖᵉ`, `e>1`, a node `xy=π` becomes `xy=uϖᵉ`; its loss of regularity comes from that extension, not from a nonexistent degree-one reflex extension.

(Source: [YZ18](#references) §5.2, pp.573–574.)

*Needs:* [R18.2.7 Torus bridge and Tate coefficients](#r1827-torus-bridge-and-tate-coefficients), [R18.2.8 Regular quaternionic model tower](#r1828-regular-quaternionic-model-tower); [AdicSpacesPartIII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdicSpacesPartIII/README.md) `R2.2`.

### R18.2.16 Pointwise p-divisible extension

**Theorem** (`BridgePointExtension`). Let L/K′ be finite. For points `y∈Y₁(L), x′∈X′₁(L), x″∈X″₁(L)`, assume verified finite-local descent: a finite local field `L₀/ℚ_p` embedded continuously in L, and crystalline `G_{L₀}`-stable Tate lattices with all endomorphisms and pairing tensors, whose restrictions to `G_L` give the three pointwise Tate lattices and their bridge tensor map. In §R18.2.17 require the same finite-local descent for the quaternionic factor `H_x` as well. Require weights in {0,1} in the supplier convention (equivalently {0,−1} for the covariant convention here), including the tensor lattice. Then the corresponding `I_y`, `H′_x′`, `H″_x″` extend uniquely over `O_L` by base change of their Barsotti–Tate realizations over `O_{L₀}`. For H″ use the Tate tensor, checking that at each embedding only one factor contributes weight `−1` so that no weight `−2` occurs. The `p=2` case requires the integral Barsotti–Tate classification including the dyadic theorem. This is pointwise and does not by itself construct a global universal abelian scheme.

The descent lattices and their crystalline weight condition are input data; finite L/K′ alone does not imply them. Full faithfulness over complete mixed-characteristic DVRs identifies the extensions and their structure maps; a finite extension used to lift a bridge point must retain these descent data.

*Proof route.* Compute the torus crystalline character and componentwise weights. Tensor with the strict quaternionic factor, excluding simultaneous weight `−1`. Apply FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.20 only over the finite local field L₀, including at `p=2`, and base change the resulting groups to `O_L`. Tate full faithfulness transports endomorphisms and the stipulated tensors and proves uniqueness. For the bridge tensor use its verified crystalline lattice realization over L₀, not a classification over L itself.

**Checks.**

- K′ has algebraically closed residue field and infinite degree over `ℚ_p`; finite L/K′ is not a finite local field.
- A crystalline descended lattice of weights {0,1} over finite L₀ has a Barsotti–Tate realization at `p=2` as well as odd p, and its base change gives the claimed extension.
- Tensoring two weight-one factors would produce weight two and falls outside the hypothesis; the supplied bridge descent excludes this.

(Source: [YZ18](#references) Proposition 5.2, p.574.)

*Needs:* [R18.2.7 Torus bridge and Tate coefficients](#r1827-torus-bridge-and-tate-coefficients), [R18.2.13 Integral quaternionic p-divisible group](#r18213-integral-quaternionic-p-divisible-group); [FiniteFlatGroupsAndIntegralPadicHodgeTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md) `R07.4`.

### R18.2.17 Filtered bridge crystal comparison

**Comparison** (`BridgeFilteredCrystal`). Let L/K′ be finite and x″ the image of an L-point (x, y) of `X₁×Y₁`, with the verified finite-local crystalline lattice descent of §R18.2.16, including the bridge tensor and its endomorphisms. The covariant filtered integral Dieudonné module of `H″_{x″}` is the coefficient tensor of those of `H_x` and `I_y` over `O_{E,p}⊗O_K`, base-changed to `O_L`. Form the structured crystalline comparison over the finite local descent field of §R18.2.16 and transport it by crystalline base change to `O_L`; the tensor lattice has weights in the Barsotti–Tate range. Assume moreover that `F_v/ℚ_p` is unramified. First select the `O_v`-factor of `O_{F,p}` by its central idempotent. Then `O_v⊗_{ℤ_p}O_K` is a product of copies of `O_K`, and its structure-embedding τ-part is an exact idempotent summand, and on τ-parts

```text
W(H″^t) ≅ W(H^t) ⊗_{O_{E,K}} W(I^t),   W(H″) ≅ W(H) ⊗_{O_{E,K}} W(I^t)^∨,
```

with `W(I_y)=0` and `W(I_y^t)` free of rank one over `O_{E,K}=O_{E,v}⊗_{O_v}O_K`. When `F_v/ℚ_p` is ramified only the first sentence is asserted.

The integral crystalline comparison and Hodge filtration are used on the finite-local descent data, including `p=2`, then base-changed to `O_L`; no essential-surjectivity theorem over arbitrary finite L/K′ is assumed. The bridge model over `O_{K′}` is not assumed regular: at nodes its local equation is `xy=π_{K′}^e` when K′/K has ramification index e, so the comparison is pointwise over `O_L`.

*Proof route.* Apply the Tate tensor comparison and the integral crystalline functor (Kisin for `p≠2`; Kim, Lau and Liu for `p=2`, as cited in YZ18) to identify the filtered modules. At unramified v take the idempotent summand of the structure embedding, which is exact. Use that `I_y` has no Lie algebra on the τ-part, so it shifts H's Hodge pieces by a rank-one twist without creating a second filtration step.

**Checks.**

- For `F_v=ℚ_p` the selected structure-embedding factor is `O_K` itself.
- For `F=ℚ[t]/(t³−t²−3t+1)` at `p=37`, the simple root 30 gives an unramified v, while the double root 4 gives a ramified quadratic factor; only the selected `O_v`-factor is split by this argument.
- A ramified v has no integral embedding idempotent of this kind; the τ-part formulas require unramifiedness.

(Source: [YZ18](#references) Proposition 5.3 and its proof, pp.574–575, and the τ-quotients and Proposition 5.4, p.575. The source takes τ-quotients without a ramification hypothesis; their exactness is proved here only when `F_v/ℚ_p` is unramified.)

*Needs:* [R18.2.16 Pointwise p-divisible extension](#r18216-pointwise-p-divisible-extension); [FiniteFlatGroupsAndIntegralPadicHodgeTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md) `R07.4`, `R07.2`.

### R18.2.18 Bridge Hodge determinant cancellation

**Theorem** (`BridgeDeterminant`). Assume `F_v/ℚ_p` is unramified and the point data have the verified finite-local descent of §§R18.2.16–R18.2.17. At the point x″ of §R18.2.17 the rank-one torus factor twists `W(H″^t)` by `W(I^t)` and W(H″) by its dual. Hence `det W(H″)⊗det W(H″^t)≅(det W(H)⊗det W(H^t))⊗O_L` as `O_L`-lattices in the generic fibre of `ω^{⊗2}` at x″, using the pullback comparison `N_pro≅q*N_U` and finite-level `N_U≅ω^{⊗2}(−d_{B,v})` of §R18.2.14, evaluated at a compatible pro-level lift of the point. The identified determinant lattice is independent of that lift by the determinant descent cocycle. Combined with §R18.2.14 this gives `N_{x″}=det W(H″)⊗det W(H″^t)`. The theorem is not asserted when `F_v/ℚ_p` is ramified. There the type decomposition of the Hodge pieces of H″, which is not a strict `O_v`-module, is not an exact direct-summand decomposition. The saturated construction of §R18.2.14 needs strictness and does not apply. No equality `Hom_{O_E}=Hom_{O_B}` and no unrestricted `O_E`-linear universal deformation is claimed.

`F_v/ℚ_p` unramified; the pointwise integral extensions of §R18.2.16 and the comparison of §R18.2.17.

*Proof route.* Use the τ-part tensor formulas of §R18.2.17. The rank-one factor `W(I^t)` and its dual cancel in the product of the two determinants. Transport the generic Kodaira–Spencer isomorphism `N≅ω²` through the bridge pullback to fix the ambient generic line before comparing its `O_L`-lattices. Identify the result with the Kodaira–Spencer line of §R18.2.14 through the deformation-theoretic chain of YZ §5.2: the Hom of the τ-parts of H″, the Hom of the τ-parts of H tensored up to `O_{K′}`, the `O_{B,v}`-Hom, and finally `ω^{−1}`. The false identification of a rank-two Hom with a rank-one Hom is avoided by working with the `O_{B,v}`-linear Hom throughout.

**Checks.**

- When the torus Hodge line is trivial, the determinant product is N without an additional twist.
- Twisting two rank-two Hodge pieces by a line and its dual contributes opposite determinant exponents and cancels.
- At split v, `d_{B,v}=0` and the product lies in the generic fibre of `ω^{⊗2}`; the tangent Hom line is `ω^{−1}` and is a different object.

(Source: [YZ18](#references) Proposition 5.4, the deformation computation after it, and Corollary 5.5, pp.575–576.)

*Needs:* [R18.2.17 Filtered bridge crystal comparison](#r18217-filtered-bridge-crystal-comparison), [R18.2.14 Integral quaternionic Kodaira–Spencer](#r18214-integral-quaternionic-kodairaspencer).

### Examples

At v∤n with `B_v` division the minimal regular model at maximal local level is a semistable relative Mumford curve; at split v with `U_v=GL₂(O_v)` it is smooth. At principal `v^n` level the regular model represents Drinfeld-basis level structures, and no smoothness or semistability is claimed for it (§§R18.2.6, R18.2.8).

### Dependencies

This layer uses earlier layers R18.2, R18.5; AdelicAlgebraicGroups (Layer 4); AdicSpacesPartIII (R2); AbelianSchemesAndArithmeticModuli (§A4.CR.7.2), CrystallineCohomology (§CR.7.3); FiniteFlatGroupsAndIntegralPadicHodgeTheory (R07.2, R07.4); PELModuli (M1, M4); the Tau Ceti roadmaps AlgebraicVectorBundles, JacobianChallenge, StableReduction; Mathlib `AlgebraicGeometry.Flat`.

## Layer R18.3, part 1: Definite forms, transfer and auxiliary levels

Use QuaternionicModularForms §§0.3, 1.3, 2.1–2.2 and 3.1 for class sets, right coefficients, forms, evaluation and Hecke actions; `DefiniteSpecialisation` (§R18.3.3) is their central-character adapter. Specialize GL2AutomorphicRepresentationsAndTransfer §§R16.6.3, R17.3.9 to totally definite quaternion algebras with the adelic central quotient. The class-set, coefficient and fixed-central-character adapters (§§R18.3.1–R18.3.3), norm-fibre and Ihara targets (§§R18.3.7–R18.3.8), and characteristic-zero transfer targets (§§R18.3.19–R18.3.22) apply to every totally real F. D/F is totally definite, O is the ring of integers of a finite extension of `ℚ_p` with residue field k, U is compact open (or has the explicitly specified dyadic full division factors), and `τ(z)=ψ(z)⁻¹` on `U∩A_{F,f}×`. Each local splitting, stable lattice, common coefficient-model and pairing hypothesis remains in force. The other targets retain the even-degree and unramified-p Khare–Wintenberger hypotheses unless their own statements give a larger domain. The geometry of class sets and auxiliary levels is kept apart from Frobenius control, and every isotropy denominator, factorial obstruction and dyadic sign choice stays explicit. The degree-two quaternionic transfer supplied by GL2AutomorphicRepresentationsAndTransfer is specialized in §§R18.3.19–R18.3.22. The definite Ihara lemma over an arbitrary totally real field (§R18.3.8) is the input that the Ihara argument of R18.4 needs beyond the even-degree Khare–Wintenberger setting.

### R18.3.1 Definite quaternionic class set

**Definition** (`DefiniteClassSet`). Form the central quotient of QuaternionicModularForms §0.3’s class set, `C_U=D×\D_f×/(U A_F, f×)`. Its effective stabiliser at t is `Γ_t=(U A_F, f×∩t⁻¹D×t)/F×`. Use the quotient by the rational centre before asserting finiteness. Changing t by dtu z transports the stabiliser and its coefficient action by conjugation.

*Construction.* Map the supplied class set `D×\\D_f×/U` onto `C_U` by the right adelic centre action. Its finiteness descends to this quotient. Consume the supplied compact stabilizer modulo its central units; the extra central-quotient stabilizers are controlled by the finite unit and ideal square classes in KW §7.2. For a dyadic full-division level, choose a compact sublevel U⁰ with `UZ/U⁰Z` finite, using division valuation parity, and apply the same argument. Transport the supplied representative-change maps and compute the effective coefficient action of §R18.3.3; no second class-set or compact-stabilizer theory is constructed.

Its API:

- `DefiniteClassSet.quotient`: The carrier is DoubleCoset.Quotient `D× (U A_F, f×)`.
- `DefiniteClassSet.finite`: For definite D and admissible U the class set is finite.
- `DefiniteClassSet.stabiliser`: At t the acting finite group is `(UZ∩t⁻¹D×t)/F×`.
- `DefiniteClassSet.changeRepresentative`: Equivalent representatives give conjugate stabilisers and canonically transported invariant modules.

**Checks.**

- `DefiniteClassSet.centralUnits`: For a real quadratic F, quotienting by `F×` removes its infinite central units; the unquotiented arithmetic group is not finite.
- `DefiniteClassSet.trivialOrbit`: A class with `Γ_t=1` contributes exactly W, with no averaging denominator.
- `DefiniteClassSet.doubleCosetEquality`: Two representatives agree exactly when `t′=dtu z` for `d∈D×, u∈U` and `z∈A_F, f×`.
- For `F=ℚ` and D ramified at `{p,∞}`, the central class set and evaluation apply although the field degree is odd.

(Source: [KW09](#references) §7 (opening), pp.57–59, display (5); §7.2, pp.61–62.)

*Needs:* [QuaternionicModularForms](../QuaternionicModularForms/README.md) `§0.3`; [AdelicAlgebraicGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md) `§3.4`, `Layer 3`; Tau Ceti `NumberField.card_elementaryTwoQuotient_units`; Mathlib `DoubleCoset.Quotient`, `DoubleCoset.eq`.

### R18.3.2 Quaternionic integral weights

**Construction** (`QuaternionWeight`). Specialize GL2AutomorphicRepresentationsAndTransfer §R16.6.3 coefficient lattices to parallel weight `k≥2: W_k=⊗_{σ:F→E} Sym^{k−2} O²`, using chosen splittings at v|p and the restricted `U_p` action. The centre acts by `N_{F/Q}(z)^{k−2}`; hence `ψ` near p must have inverse this action. For `p=2 KW` uses `k=2`. At a dyadic ramified division place use its discrete order-two quotient and one of the two sign characters, rather than a nonexistent `GL₂` splitting.

For the general-field coefficient construction choose the local splittings and a U-stable integral coefficient model explicitly; in the displayed split model D is split at each active p-adic weight place and E contains every embedding of F. No degree parity or unramifiedness of p in F is needed for this tensor construction. The KW specialization retains its unramified-p hypothesis and its weight-two restriction at `p=2`.

*Construction.* Import integral symmetric powers and tensor coefficient lattices with their semigroup actions. Supply QuaternionicModularForms §1.3 with the inverse right action `v|u=τ(u)⁻¹v` on this lattice. For a natural column factor `Sym^n(O²)`, the change of variables `J=[[0,1],[−1,0]]` identifies this right action with its polynomial module `L_{n,−n}`: `P|γ(z)=det(γ)^{−n}(cz+d)^n P((az+b)/(cz+d))`. Tensor this comparison over the embeddings and retain the determinant scalar on every Hecke coset. For the dual coefficient use the contragredient `τ∨(u)λ=λ∘τ(u)⁻¹`, so `⟨λ,v|u⟩=⟨τ∨(u)λ,v⟩`. The pairing identification with the dual symmetric power is integral only with its stated unit-denominator hypotheses. Check the product of central scalar powers and its inverse character. For a division dyadic factor distinguish maximal compact from the full `D_v×` and its sign extension.

Its API:

- `QuaternionWeight.rank`: Parallel weight k over a degree-d field has `rank (k−1)^d`.
- `QuaternionWeight.centralAction`: A scalar z acts by `N(z)^{k−2}`.
- `QuaternionWeight.baseChange`: Scalar extension commutes with the tensor of symmetric-power lattices.
- `QuaternionWeight.weightTwo`: At `k=2` the lattice is the trivial rank-one O-representation.

**Checks.**

- `QuaternionWeight.weightTwoRank`: For any d, weight 2 has rank 1.
- `QuaternionWeight.quadraticWeightFour`: For `d=2` and `k=4` the rank is 9.
- At a coefficient prime ramified in F, the tensor lattice still has the stated rank when the local splitting and stable integral model are given.
- `QuaternionWeight.factorialObstruction`: At `p=2` and `k=4` the natural pairing on `Sym²(Z₂²)` pairs X² with Y² to ±2 and XY with itself to ±1, so its Gram matrix has determinant ±4 and it is not perfect over `Z₂`.

In [Suggested.lean](Suggested.lean): `SymWeight`, `QuaternionWeight`, `QuaternionWeight.rank`.

(Source: [KW09](#references) §7 (opening), pp.58–59; [Tay06](#references) §1, pp.741–742.)

*Needs:* [QuaternionicModularForms](../QuaternionicModularForms/README.md) `§1.3`; [GL2AutomorphicRepresentationsAndTransfer, §§R16.2.13, R16.4.5, R16.6.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md#r1663-hilbert-cohomological-algebraic-weights); Mathlib `Representation`.

### R18.3.3 Fixed-central-character algebraic forms

**Definition and comparison** (`DefiniteSpecialisation`). In QuaternionicModularForms §2.1’s common module `M(U,W_A)`, take the central ψ-submodule of functions `f:D_f×→W_A` satisfying `f(dgu)=τ(u)⁻¹f(g), f(gz)=ψ(z) f(g)`. Evaluation at class representatives identifies `S_{τ, ψ}(U, A)` with `⊕_{t∈C_U} W_A^{Γ_t}`. Use the adelic central quotient: a discrete-centre hypothesis alone does not cover `O_F×` of positive rank.

F is any totally real field. A is an O-algebra; a finite free U-stable coefficient module τ and ψ satisfy the stated central compatibility and extend by scalars. The tensor model of §R18.3.2 is used only with its chosen local splittings; arbitrary compatible coefficient modules use the supplied abstract evaluation directly.

*Proof route.* Extend the supplied right coefficient action from U to UZ by `v|(uz)=ψ(z)τ(u)⁻¹v`. The compatibility `τ(z)=ψ(z)⁻¹` on `U∩Z` makes it independent of the factorization uz; it is trivial on rational central elements. Apply the common abstract form/evaluation theorem at the subgroup UZ, then factor its stabilizer action through `Γ_t`. The inverse-action identity is `v|(uu′)=(v|u)|u′`; keep the coefficient comparison of §R18.3.2. For noncompact dyadic factors extend this action by the chosen division characters on the same abstract carrier; use §R18.3.1 for finiteness, since compactness is not a premise of abstract evaluation. The evaluation/reconstruction and transport maps are the supplied maps under these identifications. Restrict the common Hecke action on `M(U,W_A)` to this central ψ-submodule; use its original coefficient semigroup action for Hecke and the extended UZ action for evaluation.

Its API:

- `DefiniteSpecialisation.evaluate_recover`: Evaluate and recover are inverse linear maps; invariance characterizes allowable values
- `DefiniteSpecialisation.transport`: Representative transport and coefficient intertwiners commute with evaluation, with identity/composition laws
- `definiteCoefficient_rightAction`: Inverting a left representation gives the right coefficient action, with the reversed endomorphism composition required by QuaternionicModularForms.

**Checks.**

- Trivial effective stabilizers give unrestricted coefficients at every class.
- For the sign C₂-action over `Z₂`, the integral evaluation component is zero while the mod-two invariant component is `F₂`.
- Replacing t by dtu z transports both stabilizer and coefficient value and preserves the recovered function.
- For `t∈U∩Z`, the decompositions `uz=(ut)(t⁻¹z)` act equally by `τ(t)⁻¹=ψ(t)`; omitting this inverse breaks the central-character specialization.
- Two noncommuting coefficient operators satisfy the inverse right-action order, rather than a left-action order; test the associated singleton Hecke cosets under inversion.

In [Suggested.lean](Suggested.lean): `definiteCoefficient_rightAction`.

(Source: [KW09](#references) §7 (opening), pp.58–59, display (5).)

*Needs:* [QuaternionicModularForms](../QuaternionicModularForms/README.md) `§§1.3, 2.1–2.2`; [R18.3.1 Definite quaternionic class set](#r1831-definite-quaternionic-class-set), [R18.3.2 Quaternionic integral weights](#r1832-quaternionic-integral-weights).

### R18.3.4 Neat-level reduction and base change

**Theorem** (`NeatnessBaseChange`). If every effective `Γ_t` has order invertible in `O, S_{τ, ψ}(U, O)` is finite free and base change to every O-algebra A identifies `S(U, O)⊗A` with S(U, A). Thus reduction modulo the uniformizer is surjective. Taylor Lemma 1.1 ensures this when p>3 is unramified in F in its stated compact definite setup. For `p=2` or 3 use a specified auxiliary torsion-free level, not the automatic p>3 argument.

All stabiliser orders prime to p, or an explicitly constructed auxiliary effective torsion-free level.

*Proof route.* Apply the averaging idempotent `|Γ_t|⁻¹Σγ` to each finite free coefficient module. Its image is a direct summand and scalar extension commutes with the idempotent. Under the alternative hypothesis every effective `Γ_t` is trivial, so no averaging is needed; such levels are supplied by §R18.3.16. The effective torsion-free case uses the explicitly constructed levels of §R18.3.16.

(Source: [Tay06](#references) Lemma 1.1 and Corollary 1.2, pp.738–739; [KW09](#references) §8.2, p.73; §8.4, p.77.)

*Needs:* [R18.3.3 Fixed-central-character algebraic forms](#r1833-fixed-central-character-algebraic-forms); Mathlib `Module.Free`, `Module.Finite`.

### R18.3.5 Perfect quaternionic pairing

**Theorem** (`IntegralPairing`). For a perfect τ-pairing satisfying the determinant/central-character similitude law and prime-to-p effective stabilisers, the sum over class representatives, weighted by `|Γ_t|⁻¹` and `ψ(Nrd t)⁻¹`, is a perfect O-pairing on S(U, O). For the standard differential pairing on `Sym^{k−2}`, require its factorial entries to be units (Taylor uses `2≤k≤p+1`). The adjoint of [UgU] is `ψ(Nrd g)[Ug⁻¹U]` with the matching coefficient action.

A perfect integral coefficient pairing and unit isotropy denominators; Taylor weight range only where invoked.

*Proof route.* Use the invariant direct-summand decomposition and average the coefficient pairing. Check representative independence using the similitude factor. Reverse the finite double-coset correspondence to compute its adjoint.

(Source: [Tay06](#references) §1, pp.741–742.)

*Needs:* [R18.3.4 Neat-level reduction and base change](#r1834-neat-level-reduction-and-base-change); [GL2AutomorphicRepresentationsAndTransfer, §§R16.2.13, R16.4.5, R16.6.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md#r1663-hilbert-cohomological-algebraic-weights); [§R18.3.3 Fixed-central-character algebraic forms](#r1833-fixed-central-character-algebraic-forms).

### R18.3.6 Split Hecke normalization

**Comparison** (`SplitHeckeNormalisation`). At `v∉S` with `D_v=M₂(F_v), U_v=GL₂(O_v)` and unramified coefficients, use AutomorphicFormsOnReductiveGroups §0.5's operators on invariants through `HeckeCoset` and specialize §R18.3.3's double-coset action: `T_v=[U diag(π_v,1) U], S_v=[U diag(π_v, π_v) U]=ψ(π_v)`. The arithmetic Satake polynomial is `X²−T_vX+q_vS_v`. The coefficient action extends to the selected Hecke monoid containing the level and cosets in use. All change-of-level and commuting away-place actions are supplied by that shared operator interface and checked with these local and coefficient conventions.

*Proof route.* Identify QuaternionicModularForms §3.1’s opposite-Hecke action on `M(U,W_A)` with AutomorphicFormsOnReductiveGroups §0.5’s shared operator on invariants, and restrict to the central ψ-submodule. Its slash is `(f|δ)(g)=τ(δ)⁻¹f(gδ⁻¹)`; apply it to inverse cosets to obtain the present operators `Σ_i τ(δ_i)f(gδ_i)`. Transport multiplication through the double-coset inversion anti-involution, along with §1.3’s coefficient determinant scalar. Compute the `q_v+1` terms of `T_v` and the singleton central coset `S_v`, and match the arithmetic Satake normalization to R17.3. Inversion exchanges `T_v` with `S_v⁻¹T_v` and `S_v` with `S_v⁻¹` before this transport.

(Source: [KW09](#references) §7 (opening), p.59; §7.4, p.65.)

**Checks.**

- At a good split place with trivial coefficients, `T_v` has `q_v+1` terms.
- The central singleton acts by `ψ(π_v)`, fixing `S_v` rather than its inverse.
- Two noncommuting normalizing singleton cosets detect the opposite multiplication; inverse-coset transport restores the stated composition.

*Needs:* [R18.3.3 Fixed-central-character algebraic forms](#r1833-fixed-central-character-algebraic-forms); [AutomorphicFormsOnReductiveGroups §0.5](../AutomorphicFormsOnReductiveGroups/README.md#invariants-hecke-operators); [QuaternionicModularForms](../QuaternionicModularForms/README.md) `§§1.3, 3.1`; Mathlib `HeckeCoset`, `IsHeckeTriple`.

### R18.3.7 Norm-factor forms and Eisenstein support

**Theorem** (`NormBranch`). For parallel weight 2 and compatible finite character, and equally for residual k-valued forms whose finite coefficient action is killed by the level, the forms factoring through Nrd are exactly the SL₂-invariant local branch under the strong-approximation hypotheses of KW §7.1. Their good-place Hecke eigenvalues give sums of characters, so their localization at a non-Eisenstein maximal ideal vanishes. Following KW §7, a maximal ideal m of `T_ψ(U)` is Eisenstein if `T_v−2` and `S_v−1` lie in m for all but finitely many places v split in a fixed finite abelian extension of F; non-Eisenstein means not Eisenstein. No Galois representation is constructed here.

Weight 2; strong approximation for D¹ at a chosen split finite place w, with hyperspecial w-level and trivial w-coefficient action. F is any totally real field in the following norm-fibre comparison.

For D/F totally definite and compact open H with hyperspecial `H_w` at the split place w, the prerequisite comparison `definiteNormFibres` identifies the norm quotient of `D×\\D_f×/(D_f¹H)` with `Nrd(D×)\\A_{F,f}×/Nrd(H)`, and proves `Nrd(D×)=F_+×`, where `F_+×` is the totally positive subgroup. Thus a function invariant under H and `D¹(F_w)` factors through the finite narrow ray-class quotient `Q_H⁺=F_+×\\A_{F,f}×/Nrd(H)`. A fixed central character imposes the additional relation `h(a z²)=ψ(z)h(a)`; for trivial ψ it is the further quotient by adelic scalar squares. This relation does not replace `F_+×` by `F×`.

*Proof route.* Obtain the rational norm image from the local norm images and the Hasse–Minkowski scalar-representation theorem applied to the quaternion norm form: finite-place reduced norms are surjective, and real norms of D are positive. Use strong approximation for D¹ at w to pass from local invariance to constancy on these norm fibres. For a norm character χ the good operators have eigenvalues `(1+q_v)χ(π_v)` and `χ(π_v)²`. Over an algebraic closure of the residual field, every simple constituent of the finite abelian norm-quotient module is a character, even when its order is divisible by l. Class field theory gives a finite abelian extension splitting all these characters. This proves Eisenstein support without assuming a semisimple integral or residual character decomposition.

**Checks.**

- For `F=ℚ` at maximal finite level the positive norm quotient is trivial, and constants have `T_v=q_v+1`, `S_v=1`.
- For `F=ℚ(√3)`, D totally definite and unramified at every finite place, and maximal H, `Q_H⁺=Cl⁺(F)` has order two while `Cl(F)=1`. The Minkowski bound is `√12/2<2`; the equation `x²−3y²=−1` is impossible modulo 3, so there is no norm-minus-one unit. The nontrivial narrow character gives a nonconstant norm-invariant function in odd characteristic and survives the scalar-square quotient.
- A scalar z changes its norm argument by z²; a nontrivial ψ requires the displayed transformation law rather than an invariant function on the scalar quotient.
- If l divides the narrow quotient order, its function module need not split into characters, but every simple constituent still has the stated Eisenstein support.

(Source: [KW09](#references) §7 (opening), pp.59–60, definition of Eisenstein maximal ideals and proof of Lemma 7.1; [PRR23](#references) §1.5.2, Theorem 1.34, pp.43–44, for the rational norm image.)

*Needs:* [R18.3.6 Split Hecke normalization](#r1836-split-hecke-normalization); [AdelicAlgebraicGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md) `§4.2`; [GlobalQuadraticForms](../GlobalQuadraticForms/README.md) `§§5.5, 6.1`; [QuadraticFormInvariants](../QuadraticFormInvariants/README.md) `Layers 2, 6`; [ClassFieldTheory](../ClassFieldTheory/README.md) `Layer 12`.

### R18.3.8 Definite Ihara lemma over an arbitrary totally real field

**Theorem** (`definiteIhara_injective`). Let F be any totally real field and D/F a totally definite quaternion algebra, with associated group G, unramified at a finite place w. For a compact open `H⊂G(A_F,f)` unramified at w, write `Y_H=G(F)\G(A_F,f)/H` for the finite definite set, `H⁰(Y_H,F_l)` for `F_l`-valued functions on it, and S for a finite set of places containing those above l, the infinite places, w and every place where H or D ramifies. The anaemic Hecke algebra `T^S` acts by the double-coset operators `T_v` and `S_v` at the split places `v∉S`, and its central part acts through the effective central quotient `Z(A_F,f)/(F×(H∩Z(A_F,f)))`. For every non-Eisenstein maximal ideal m of `T^S⊗ℤ_l` the map `π₁*+π₂*: H⁰(Y_H,F_l)_m⊕H⁰(Y_H,F_l)_m→H⁰(Y_{H₀(w)},F_l)_m` is injective, and dually the two trace maps `H₀(Y_{H₀(w)},F_l)_m→H₀(Y_H,F_l)_m²` form a surjection. No parity condition on `[F:ℚ]` and no condition that l be unramified in F is imposed.

D is totally definite and split at w; H is compact open and unramified at w; l is any prime; m is non-Eisenstein in the sense of [R18.3.7 Norm-factor forms and Eisenstein support](#r1837-norm-factor-forms-and-eisenstein-support), applied to the Hecke algebra away from S.

Constant `F_l` coefficients; central-character parts are taken through the effective central quotient, as in [R18.4.21 Exact central-character localization](#r18421-exact-central-character-localization).

*Proof route.* Consume QuaternionicModularForms §§0.3, 2.1–2.2 and 3.1 for `Y_H`, its finiteness, evaluation and Hecke action over arbitrary totally real F; apply `DefiniteSpecialisation` (§R18.3.3) only when taking the fixed-central-character part. The sets `Y_H` and `C_H` differ by the adelic central quotient; no even-degree hypothesis enters. If (f,g) lies in the kernel, then `f(x)=−g(xω)` with `ω=diag(ϖ_w,1)`; so f is invariant under H and `ω⁻¹Hω`, which together generate a group containing `H^w·SL₂(F_w)`. Apply `definiteNormFibres` (§R18.3.7): strong approximation for D¹, split at w, makes f factor through `Nrd(D×)\\A_{F,f}×/Nrd(H)=F_+×\\A_{F,f}×/Nrd(H)`. Keep the separate relation `h(a z²)=ψ(z)h(a)` on a central-character part. The character-constituent argument of §R18.3.7 puts this entire narrow norm module on Eisenstein support; localizing at a non-Eisenstein m kills it, giving injectivity. Dualize for the trace statement.

**Checks.**

- Injectivity of `π₁*+π₂*` after localization at non-Eisenstein m, for every totally real F.
- For `F=ℚ` and D ramified at `{2,∞}, H` maximal: `Y_H` has one point; the kernel of `π₁*+π₂*` consists of the pairs `(f,−f)` with f constant, which are norm-factoring, so injectivity holds exactly after localizing away from the Eisenstein ideal.
- Without localization the map is not injective: the constant pair `(1,−1)` lies in its kernel.
- At maximal finite level over `ℚ(√3)`, the nonconstant narrow norm character of §R18.3.7 is another Eisenstein kernel branch in odd characteristic; replacing the narrow quotient by the trivial wide quotient loses it, even after imposing trivial central character.

(Source: [MS19](#references) §6.2, Theorem 6.8 and its proof, pp.34–35 (Definite Ihara lemma for a totally definite quaternion algebra over any totally real F, by SL₂-generation and strong approximation for the reduced-norm-one group; MS attribute earlier versions to Ribet over `ℚ` and to Taylor over F))

*Needs:* [QuaternionicModularForms](../QuaternionicModularForms/README.md) `§§0.3, 2.1–2.2, 3.1`; [R18.3.6 Split Hecke normalization](#r1836-split-hecke-normalization), [R18.3.7 Norm-factor forms and Eisenstein support](#r1837-norm-factor-forms-and-eisenstein-support); [AdelicAlgebraicGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md) `§3.4`, `§4.2`; [§R18.3.3 Fixed-central-character algebraic forms](#r1833-fixed-central-character-algebraic-forms).

### R18.3.9 Definite Ihara degeneracy map

**Theorem** (`DefiniteDegeneracy`). At a finite place `w∉Σ` (so D is split at w), with w added to S for the Hecke algebra, compact U with hyperspecial `U_w` and a finite-dimensional residual coefficient module `W̄_τ` over k on which `U_w` acts trivially, the degeneracy map `S_{W̄_τ, ψ̄}(U, k)²→S_{W̄_τ, ψ̄}(U₀(w), k), (f₁, f₂)↦f₁+diag(1, π_w) f₂`, has kernel supported on the norm-factor Eisenstein branch. Hence it is injective after non-Eisenstein localization (KW Lemma 7.1). This theorem supplies the residual input to KW Corollary 7.5; arbitrary coefficient-algebra base change and an integral indefinite Ihara theorem are not consequences of Lemma 7.1.

F is totally real of even degree, p is unramified in F, and D/F is totally definite, with finite ramification set `Σ` as in KW §7. U is compact open. `W̄_τ` is a finite-dimensional continuous representation over the finite residue field k, with `ψ̄:A_F, f×/F×→k×` and `τ̄(z)=ψ̄(z)⁻¹` on `U∩A_F, f×`. The residual action factors through a finite quotient. `w∉Σ, U_w=GL₂(O_w), U_w` acts trivially on `W̄_τ`, and the smaller level changes only its w-component to the Iwahori `U₀(w)`. The Hecke algebra omits w.

*Proof route.* Pass to an open subgroup that kills the finite residual coefficient action. A kernel relation then forces `f₁` to be invariant under `U·SL₂(F_w)`. Use generation by the two conjugate maximal compact subgroups at w, and apply strong approximation for the norm-one quaternion group. The resulting function factors through Nrd and is killed by non-Eisenstein localization. The integral control theorem [R18.4.3 Integral torsion and reduction criteria](#r1843-integral-torsion-and-reduction-criteria) uses this residual injectivity together with its separate equal-rank and characteristic-zero comparisons.

(Source: [KW09](#references) §7 (opening), Lemma 7.1, p.60.)

*Needs:* [R18.3.7 Norm-factor forms and Eisenstein support](#r1837-norm-factor-forms-and-eisenstein-support); [§R18.3.3 Fixed-central-character algebraic forms](#r1833-fixed-central-character-algebraic-forms).

### R18.3.10 Quaternionic isotropy exponent bound

**Theorem** (`IsotropyExponent`). For an auxiliary split place w∤p with hyperspecial local control, write `N_w=|GL₂(k_w)|`. The Sylow-p subgroups of all `Γ_t` have exponent dividing `2N_w` in the compact-level case and `4N_w` in KW’s allowed noncompact dyadic division-factor case. For compact U the reduced norm on `Γ_t(U)` maps to `T=((A_F, f×)²V∩F×)/(F×)²`, where `V=∏_{v<∞}O_v×`; this map need not be surjective. In the allowed noncompact case this norm sequence is asserted for `Γ_t(U⁰)` only, where U⁰ is the compact sublevel. Its target has exact sequence `0→O_F×/(O_F×)²→target→Cl(O_F)[2]→0`. Only finite p-subgroups, not the entire finite norm-one group, inject through reduction at the auxiliary place of residue characteristic different from p. The reduction kernel is pro-residue-characteristic. The norm sequence is left exact, with no surjectivity assertion onto its final square-class term.

U, V and the distinguished w satisfy KW §7.2. In the noncompact case `Γ_t(U⁰)` is normal in `Γ_t(U)` with elementary-two quotient, induced by `UZ/U⁰Z`; this gives the extra factor two in the exponent bound.

*Proof route.* Control the norm-one subgroup by injective reduction at w and divide by ±1. Bound the norm-square quotient by its unit/class-group two-torsion sequence. Combine exponents, distinguishing `p=2` and the extra elementary-two level quotient.

**Checks.**

- For compact U, all finite valuations of a reduced norm are even modulo scalar squares, as required by T.
- Let `F=ℚ(√17)` and `D=(−1,−1)_F`, with maximal orders containing i and j, full division factors at the two places above 2 and maximal compact units elsewhere. Then `b=i+j` has `b²=−2`, `Nrd(b)=2`, and defines an order-two class in `Γ_1(U)`. Its norm has odd valuation at both dyadic places, so it lies outside T and the class lies outside `Γ_1(U⁰)`. Scalar changes multiply the norm by a square and cannot repair its valuations.
- An elementary-two extension of a group with Sylow-p exponent dividing `2N_w` has Sylow-p exponent dividing `4N_w`, without a norm map on the whole extension to T.

(Source: [KW09](#references) §7.2, displays (6)–(7), pp.61–62.)

*Needs:* [R18.3.1 Definite quaternionic class set](#r1831-definite-quaternionic-class-set); [AdelicAlgebraicGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md) `§3.4`, `Layer 3`; Tau Ceti `NumberField.card_elementaryTwoQuotient_units`.

### R18.3.11 Base-changed local characters annihilate isotropy

**Theorem** (`BaseChangeAnnihilator`). Let F′/F be totally real with w split and impose KW Lemma 7.3 residue-field divisibility at the chosen Iwahori places. Choose `χ₀` of p-power order equal to the p-part of `2p(4N_w)`, and `χ=χ₀^{4N_w}`. Then `χ` kills every effective stabiliser; it is nontrivial, and when `p=2` has order 4. Its local action is through the ratio a/d of the triangular reduction. This statement concerns a given F′ and local characters; choosing global auxiliary fields belongs to potential modularity.

The prescribed residue fields admit `χ₀`, and all isotropy exponents divide `4N_w`.

*Proof route.* Compute the norm-ratio image of a stabiliser using the exponent bound. Raise the local character to `4N_w` and verify it vanishes on that image. Check its remaining p-power order, including dyadic order four.

(Source: [KW09](#references) §7.3, Lemma 7.3 and its proof, pp.62–63.)

*Needs:* [R18.3.10 Quaternionic isotropy exponent bound](#r18310-quaternionic-isotropy-exponent-bound).

### R18.3.12 Quaternionic Taylor–Wiles level

**Construction** (`QuaternionTWLevel`). For any finite Q away S with D split, `q_v≡1 mod pⁿ`, and fixed p-power N divisible by all Sylow-p isotropy exponents, let `Δ′_v` be the maximal p-quotient of `k_v×` and `Δ_v=Δ′_v/Δ′_v[N]`. Put `U′_v=Iwahori` and `U_v=ker(a/d:U′_v→Δ_v)`, with unchanged factors away Q. Then `U′_Q/U_Q=Δ_Q=∏_vΔ_v`. The quotient kills N-torsion; it is not the quotient by Nth powers.

N and Q are inputs; no existence or selection of Taylor–Wiles primes is claimed.

*Construction.* Use the cyclic residue-unit group to construct `Δ′` and its N-torsion quotient. Define the ratio on invertible triangular reductions and its open normal kernel. Identify the product quotient and lifts diag(h,1).

Its API:

- `QuaternionTWLevel.diamondGroup`: `Δ_Q` is the product of the maximal residue p-quotients modulo their N-torsion.
- `QuaternionTWLevel.levelQuotient`: `U′_Q/U_Q≅Δ_Q` via the product diagonal ratios.
- `QuaternionTWLevel.normal`: `U_Q` is open normal in `U′_Q`.
- `QuaternionTWLevel.changeQ`: For `Q′⊂Q` the level and diamond quotient forget the factors `Q\Q′`.

**Checks.**

- `QuaternionTWLevel.empty`: At `Q=∅, Δ_Q=1` and `U_Q=U`.
- `QuaternionTWLevel.cyclicOrder`: For `Δ′=C₈` and `N=2, Δ=C₄`.
- `QuaternionTWLevel.torsionNotPowers`: For `Δ′=C₈` and `N=2` the quotient by Nth powers has order 2, and is the wrong quotient.

In [Suggested.lean](Suggested.lean): `QuaternionTWLevel.torsionSubgroup`, `QuaternionTWLevel.diamondFactor`.

(Source: [KW09](#references) §7.4, p.63 (auxiliary levels before Lemma 7.4).)

*Needs:* [R18.3.10 Quaternionic isotropy exponent bound](#r18310-quaternionic-isotropy-exponent-bound); [§R18.3.3 Fixed-central-character algebraic forms](#r1833-fixed-central-character-algebraic-forms); Mathlib `QuotientGroup.mk`.

### R18.3.13 Stabiliser equality at Taylor–Wiles level

**Theorem** (`TwStabilisers`). For the level above, every character of `Δ_Q` kills the effective isotropy at `U′_Q`; the effective stabilisers at `U_Q` and `U′_Q` agree. Consequently `Δ_Q` acts freely on the class-set fibres `C_{U_Q}→C_{U′_Q}`. The invariant coefficient modules attached to all twists have equal O-rank; modulo the uniformizer their identifications are Hecke-equivariant, while arbitrary integral twist identifications need not be.

N kills all p-isotropy exponents; `Δ_Q` is the quotient by `Δ′[N]`.

*Proof route.* Map stabilisers to residue p-quotients and use their exponent bound. Their images vanish in `Δ_Q`, so level reduction preserves isotropy. Compare coefficient invariants and free class-set fibres; distinguish integral and residual Hecke compatibility.

(Source: [KW09](#references) §7.4, proof of Lemma 7.4, display (8), pp.64–65.)

*Needs:* [R18.3.12 Quaternionic Taylor–Wiles level](#r18312-quaternionic-taylorwiles-level), [R18.3.3 Fixed-central-character algebraic forms](#r1833-fixed-central-character-algebraic-forms).

### R18.3.14 Integral diamond freeness

**Theorem** (`TwFreeness`). Under KW Lemma 7.4’s coefficient and level hypotheses, `S_{τ, ψ}(U_Q, O)` is finite free over `O[Δ_Q]`, of `rank rank_O S_{τ, ψ}(U′_Q, O)`. On each free `Δ_Q`-orbit, the common finite-free invariant coefficient summand gives a regular `O[Δ_Q]` factor. The localized non-Eisenstein direct factors inherit freeness when the Hecke idempotent is `Δ_Q`-equivariant.

Invariant coefficient summands finite free as established in the KW setting; an arbitrary representation without this condition is not covered.

*Proof route.* Use the free orbit decomposition and equal stabiliser invariant modules. Identify each orbit module with `O[Δ_Q]⊗_O W^{Γ_t}`. Use locality of the p-group algebra over the local O-ring for finite projective localized factors.

(Source: [KW09](#references) §7.4, Lemma 7.4(2), p.64 (proof p.65).)

*Needs:* [R18.3.13 Stabiliser equality at Taylor–Wiles level](#r18313-stabiliser-equality-at-taylorwiles-level); Mathlib `MonoidAlgebra`, `Module.Free`.

### R18.3.15 Residual quaternionic Hecke ideal

**Construction** (`ResidualHeckeIdeal`). Use AutomorphicFormsOnReductiveGroups §§5.8, 7.3's shared universal anemic algebra `𝕋^S = MvPolynomial ({v ∉ S} × Fin 2) O`, with its O-algebra-map eigensystems and kernel eigen-ideals. The polynomial algebra is a presentation; the faithful image of its action on the chosen quaternionic module is the acting Hecke algebra. Specialize its [`galoisAnemicEigenSystem`](../AutomorphicFormsOnReductiveGroups/README.md#galois-anemic-eigensystem) to a continuous residual `ρ̄:G_E→GL₂(k)` unramified outside S: evaluate `T_v` at `tr ρ̄(Frob_v), S_v` at `q_v⁻¹det ρ̄(Frob_v)`, and coefficients by `O→k`, with arithmetic Frobenius and `q_v` invertible in k. Define `m_ρ̄` as the kernel. Surjectivity of coefficient reduction makes this a maximal ideal. For an acting quotient `𝕋^S/I`, the evaluation factors precisely under the explicit hypothesis `I⊆m_ρ̄`; prove existence and uniqueness of that factorization using the ideal quotient. A given residual representation does not imply this inclusion, and this construction supplies no automorphic eigensystem existence theorem. The polynomial kernel construction uses the layer’s arithmetic Frobenius dictionary and surjective coefficient reduction. CDN §4.1.3 motivates the abstract kernel, but its geometric reciprocity and `ψ=χ_cyc det ρ` convention are different; its displayed values are not the arithmetic normalization used here.

For the CDN application p>2, local `F=ℚ_p`, global E even degree with p completely split, `D₀` definite and finite-unramified; keep E distinct from the earlier auxiliary CM field. `q_v` is a unit in k; arithmetic Frobenius convention fixed.

*Construction.* Specialize the supplier’s universal presentation to the quaternionic good places and its eigensystem map to the given residual traces and determinants. Here O acts on k through the specified coefficient reduction, so polynomial evaluation is an O-algebra map. The generic signatures in Suggested.lean use `V={v ∉ S}` as the variable index and Mathlib’s polynomial carrier directly; they introduce no second universal algebra. Use surjective coefficient reduction for maximality of the kernel. Galois-to-Hecke compatibility is not part of this target: the descent `actingFactor` is constructed only under the explicit hypothesis that the relations of the acting quotient vanish under evaluation, and it is not inferred from a formal evaluation.

Its API:

- `ResidualHeckeIdeal.evalT`: `T_v` evaluates to `tr ρ̄(Frob_v)`.
- `ResidualHeckeIdeal.evalS`: `S_v` evaluates to `q_v⁻¹ det ρ̄(Frob_v)`.
- `ResidualHeckeIdeal.maximal`: Surjective `O→k` makes the evaluation kernel maximal.
- `ResidualHeckeIdeal.actingFactor`: For an acting quotient `𝕋^S/I` with `I⊆m_ρ̄`, the abstract evaluation factors uniquely through that quotient.
- `ResidualHeckeIdeal.actingFactor_unique`: ActingFactor is defined under the explicit relation-kernel inclusion, with uniqueness and commutation with polynomial evaluation

**Checks.**

- `ResidualHeckeIdeal.normThree`: In `k=F₇, q=3` and `determinant=6` give `S=2`.
- `ResidualHeckeIdeal.scalarDeterminant`: The arithmetic polynomial has constant term `qS=det ρ̄(Frob)`.
- `ResidualHeckeIdeal.nonsurjective`: The kernel of `Z→Q` is zero and not maximal; surjectivity cannot be dropped.
- In the acting quotient with relation `T_v=0, a` proposed trace value one prevents descent.

In [Suggested.lean](Suggested.lean): `residualEvaluation`, `ResidualHeckeIdeal`, `ResidualHeckeIdeal.maximal`, `ResidualHeckeIdeal.actingFactor`. These are the residual adapter on the shared polynomial presentation, with generic good-place index V, rather than a separate eigensystem carrier.

(Source: [CDN23](#references) §4.1.3, pp.48–49.)

*Needs:* [R18.3.6 Split Hecke normalization](#r1836-split-hecke-normalization); [§R18.3.3 Fixed-central-character algebraic forms](#r1833-fixed-central-character-algebraic-forms); [AutomorphicFormsOnReductiveGroups §§5.8, 7.3](../AutomorphicFormsOnReductiveGroups/README.md#anemic-eigensystems); Mathlib `MvPolynomial.eval₂Hom`, `RingHom.ker`, `RingHom.ker_isMaximal_of_surjective`.

### R18.3.16 Effective neat level without a field-degree assertion

**Theorem** (`exists_effectiveNeatLevel`). For any compact open U, there is a compact open `U′⊂U` whose image in `PGL₁(D)(A_f)` is contained in a neat compact open subgroup. Every effective `Γ_t(U′)` is trivial. Thus evaluation identifies S(U′,O) with a finite direct sum of coefficient lattices and commutes with every O-algebra base change. This theorem imposes no bound on [F′:F] and makes no field extension.

U is compact. Neatness is imposed on the adjoint group, not just a faithful representation of `D×`.

*Proof route.* Apply the existing neat-level existence theorem to `PGL₁(D)`, and take an open compact subgroup of its inverse image inside U. The image of `Γ_t` is a finite subgroup of a neat arithmetic subgroup; neat torsion-freeness makes it trivial. Use the existing finite class-set and §R18.3.3 evaluation contracts, with `Γ_t=1`.

**Checks.**

- Central units of a real quadratic field survive in `D×` and disappear in the effective quotient.
- At `Γ=1` evaluation commutes with `O→k` even at `p=2`.
- Automatic p>3 neatness in Taylor’s all-finite-split/unramified setup is not asserted for arbitrary F,D.

(Source: [KW09](#references) §7 opening, pp.57–59, evaluation (5) (The finite effective stabilisers are precisely those whose triviality is needed); [Tay06](#references) Lemma 1.1 and Corollary 1.2, pp.738–739 (Distinguishes prime-to-p isotropy and its base-change conclusion from the stronger auxiliary projective-smallness argument))

*Needs:* [R18.3.1 Definite quaternionic class set](#r1831-definite-quaternionic-class-set), [R18.3.3 Fixed-central-character algebraic forms](#r1833-fixed-central-character-algebraic-forms); [AdelicAlgebraicGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md) `§3.4`, `§4.3`, `§4.3`.

### R18.3.17 Division valuation and central-character extension

**Construction** (`DivisionParityCharacter`). For a nonarchimedean quaternion division algebra `D_v`, put `ν_D=v_v∘Nrd:D_v×→ℤ`, with `O_D×=ker ν_D`. Then `ν_D(F_v×)=2Z`, and `D_v×/(F_v×O_D×)≃ℤ/2ℤ`. For `ψ_v` unramified and a chosen `r∈O×` with `r²=ψ_v(Nrd Π)⁻¹`, where `ν_D(Π)=1`, the character `τ_r(g)=r^{ν_D(g)}` extends the trivial compact coefficient action and has `τ_r(z)=ψ_v(z)⁻¹` on scalars. The two extensions are r and `−r`. This is the coefficient action `τ`, so the associated right-translation eigenvalue is `r⁻¹`.

v is finite and `D_v` is division; `ν_D` is normalized to be surjective.

`ψ_v:F_v×→O×` is unramified. A square root is chosen after a finite coefficient extension if necessary; this extension is recorded.

*Construction.* Specialize the extended division valuation in PRR §1.4.2 to index two: twice that valuation equals v∘Nrd, has image Z, and its units are `O_D×`. A division uniformiser has norm valuation one. Central norm is its square. The scalar subgroup has even valuation and surjects onto 2Z, giving the parity quotient. An unramified central character is determined by the norm valuation; the square-root identity proves central compatibility and classifies all extensions trivial on `O_D×`.

Its API:

- `divisionCharacterValue_add`: For any commutative ring R, unit r and integers n,m, `r^(n+m) = r^n r^m`; the parity-value function is multiplicative in the valuation.

- `DivisionParityCharacter.valuation`: `ν_D` is additive and its kernel is `O_D×`.
- `DivisionParityCharacter.effectiveQuotient`: The quotient by scalar and compact elements is `ℤ/2ℤ`.
- `DivisionParityCharacter.apply`: `τ_r(g)=r^{ν_D(g)}` and `τ_r(Π)=r`.
- `DivisionParityCharacter.central`: `τ_r(z)=ψ_v(z)⁻¹` for every scalar z.
- `DivisionParityCharacter.classify`: Extensions trivial on `O_D×` and compatible with `ψ` are exactly the roots r of the displayed square identity.
- `DivisionParityCharacter.changeCoefficients`: A ring map carrying r and `ψ` transports the character; identity and composition agree.
- `DivisionParityCharacter.dyadicReduction`: When `p=2` the choices r and `−r` have identical reductions, without being equal integrally.

**Checks.**

- `DivisionParityCharacter.trivialCentre`: For `ψ_v=1` the two values at `Π` are 1 and `−1`.
- `DivisionParityCharacter.nontrivialCentre`: For `ψ_v(Nrd Π)=4` in a coefficient ring containing 1/2, `r=1/2` satisfies central compatibility and `r=1` does not.
- `DivisionParityCharacter.scalarUniformiser`: A scalar uniformiser has `ν_D=2` and acts by r², as required by `ψ_v⁻¹`. For `r=2∈ℚ×`, the values at valuations 2 and −2 are 4 and 1/4, distinguishing the coefficient character from its inverse.
- `DivisionParityCharacter.dyadicSigns`: Over `Z_2`, the characters with values ±1 at `Π` reduce to the same `F_2`-character.

In [Suggested.lean](Suggested.lean): `divisionCharacterValue`.

(Source: [PRR23](#references) §1.4.2, pp.31–33, (1.16) and the uniformiser construction (For index two, twice the extended valuation is v∘Nrd, takes all integer values, and has the stated maximal compact kernel); [KW09](#references) §7 opening, pp.57–58; §7.1, Lemma 7.2 and remark, pp.60–61 (The full division factors and their uniformiser eigenvalues determine the dyadic coefficient extension and inverse Galois sign))

*Needs:* [R18.3.2 Quaternionic integral weights](#r1832-quaternionic-integral-weights); [SmoothRepresentationsOfLocalGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md) `SR.0.4`; Tau Ceti `QuaternionAlgebra.normForm_coe`.

### R18.3.18 Dyadic division-place sign extensions

**Theorem** (`DyadicSignExtension`). At a dyadic division place with `U_v=D_v×`, its maximal compact `U_v⁰` has quotient `U_vF_v×/(U_v⁰F_v×)` of order two. For weight two, each choice of sign extends the compact coefficient action; over characteristic two the two reductions agree. With a set `Σ₀` of such places there are `2^{|Σ₀|}` sign choices. Compactness-based arguments must use `U⁰` and retain this quotient. Prove the local quotient by using the reduced-norm valuation: `O_D×` is its valuation kernel, a division uniformizer has reduced-norm valuation one, and a scalar uniformizer has valuation two. Modulo `F_v×` only the parity remains. This calculation supplies the two local coefficient extensions without an appeal to a local `GL₂` classification. Extend at an explicitly specified finite set of full division factors using chosen roots `r_v²=ψ_v(Nrd Π_v)⁻¹`. Changing signs gives `2^{|Σ′|}` extensions with identical dyadic reductions. For KW sign control take `Σ′=Σ`, including division places away from two. Values ±1 alone suffice only when the unramified central character value is one.

KW noncompact variant allowed only at the specified dyadic division factors; weight two.

*Proof route.* Use the local valuation on the division algebra and its centre-square valuation. Identify the effective quotient and its two characters. Take products and reduce signs in characteristic two.

Its API:

- `DyadicSignExtension.restrict_compact`: Restriction to the compact action; central compatibility; changeSign with identity/composition; reduction identified through the identity coefficient map

**Checks.**

- Empty `Σ′` gives one extension.
- One factor gives two distinct integral actions with equal dyadic reduction.
- Over `ℤ₂`, take `ψ_v(Nrd Π_v)=9`: the roots `r=±1/3` are units, are distinct integrally and have equal reduction. Their right-translation eigenvalues are `±3`, whose squares are 9; `r=±1` fails scalar compatibility.

(Source: [KW09](#references) §7 (opening), pp.58–59.)

*Needs:* [R18.3.2 Quaternionic integral weights](#r1832-quaternionic-integral-weights), [R18.3.17 Division valuation and central-character extension](#r18317-division-valuation-and-central-character-extension); Tau Ceti roadmap [QuadraticFormInvariants, roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/QuadraticFormInvariants/README.md).

### R18.3.19 Finite quaternion local transfer needed by the definite comparison

**Finite-level comparison** (`finiteQuaternionLocalTransfer`). The local correspondence, character identity, norm-character/Steinberg comparison and twist compatibility are supplied by GL2AutomorphicRepresentationsAndTransfer §§R17.1.1–R17.1.4. The target here is their compatibility with the fixed split identifications, central character and finite-level Hecke actions of §§R18.3.2–R18.3.6.

Smooth admissible characteristic-zero representations over C; coefficient-field descent is a separate GL2AutomorphicRepresentationsAndTransfer §R16.6.3 contract.

Haar measures and the unnormalized split double-coset action are fixed; the elliptic character relation identifies corresponding representations.

*Comparison.* Apply the supplied correspondence with the fixed quaternion splitting and coefficient action. Its elliptic sign and its norm-character/Steinberg branch determine which representations contribute to the finite-level module; transport the unnormalized double-coset action through that identification.

**Checks.**

- A full `O_B×`-fixed division representation is unramified one-dimensional; its transfer is Steinberg, not an unramified principal series.
- An irreducible unramified principal series with two distinct Satake parameters is outside the classical division image.
- For `F=ℚ` the same local comparison at a ramified finite place has no field-degree restriction.

(Source: [JL70](#references) Theorem 4.3(i),(v) and the degree-one special-representation paragraph, p.66; Theorem 15.1, p.239 and its proof, p.248; Proposition 15.5, pp.246–248 (The local correspondence preserves central characters and twists; the degree-one case gives Steinberg. Proposition 15.5 proves the opposite elliptic-character relation, and Theorem 15.1 classifies the local image. Theorems 14.2 and 14.4 are global statements and do not supply this local character identity))

*Needs:* GL2AutomorphicRepresentationsAndTransfer §§R17.1.1–R17.3.9; [SmoothRepresentationsOfLocalGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md) `SR.0.1–SR.0.2`, `SR.0.4`, `SR.3`, `SR.3.4`, `SR.3.3`.

### R18.3.20 Real weight and dual convention in quaternion transfer

**Finite-level comparison** (`realQuaternionWeightJL`). The real quaternionic/discrete-series correspondence is supplied by GL2AutomorphicRepresentationsAndTransfer §R17.1.3 and its cohomological convention by §R16.6.3. The target here is the inverse coefficient-action and norm-twist comparison for the integral form module of §R18.3.3.

`k≥2`; the parallel weight and algebraic central character satisfy the common parity condition.

Complexification is via a fixed embedding `K→C`; p-adic algebraic norm factors are transported with `ψ`, not erased.

*Comparison.* Import Tau Ceti’s existing SU(2) symmetric powers, dimensions, irreducibility and classification. Extend the existing type by the specified real norm character, using GL2AutomorphicRepresentationsAndTransfer §R16.6.3 algebraic-weight transport; SU(2) representation theory is imported from Tau Ceti. Match the parameters `η(x,y)` and `η′(x,y)` in BR Remark 9.6; their difference gives `k−1` and their central characters determine the norm twist. Use the evaluation functional on the dual coefficient type in Taylor’s construction to pin the inverse action.

**Checks.**

- `k=2` has coefficient rank one and discrete-series weight two.
- `k=4` has SU(2)-dimension three and discrete-series weight four.

- Changing `ψ` without the algebraic norm correction fails the central-character comparison.

(Source: [BR10](#references) §§9.2–9.3, pp.18–20, Remark 9.6; §13.1, p.32 (The real discrete-series and quaternionic type have matching parameters and the elliptic character sign); [Tay06](#references) Lemma 1.3 and its proof, pp.741–742 (Supplies the p-adic to complex conversion and the dual weight in the function realization); [Car86a](#references) §0.10, p.412 (Specifies the quaternionic symmetric-power type including its norm twist))

*Needs:* GL2AutomorphicRepresentationsAndTransfer §§R17.1.1–R17.3.9; [R18.3.2 Quaternionic integral weights](#r1832-quaternionic-integral-weights); [GL2AutomorphicRepresentationsAndTransfer, §§R16.2.13, R16.4.5, R16.6.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md#r1663-hilbert-cohomological-algebraic-weights); Tau Ceti `TauCeti.SU2.symPower`, `TauCeti.SU2.finrank_symPower`, `TauCeti.SU2.isIrreducible_symPower`, `TauCeti.SU2.existsUnique_nonempty_equiv_symPower`.

### R18.3.21 Degree-two global inner-form spectral transfer

**Finite-level comparison** (`quaternionicSpectralTransfer`). Global transfer and multiplicity one are supplied by GL2AutomorphicRepresentationsAndTransfer §§R17.3.1–R17.3.6. The target here identifies the finite-level characteristic-zero decomposition of §R18.3.3 with the corresponding fixed-vector spaces, excluding its norm branch; it makes no assertion that integral lattices decompose.

Algebraic weights and central character are transported to C using GL2AutomorphicRepresentationsAndTransfer §R16.6.3 and the real-weight target; unitarise by the appropriate norm twist before applying the unitary theorem.

Only the classical square-integrable local image is included: the extended discrete transfer in BR also handles `GL₂` residual representations and cannot alone justify calling every image cuspidal.

The general inner-form assertion concerns a global division algebra B. For globally split `B=M₂(F)`, use identity on the cuspidal spectrum; dimension greater than one alone does not exclude Eisenstein representations.

*Comparison.* Apply the supplied transfer to the discrete decomposition and remove the one-dimensional norm summands. Evaluate the remaining summands on the coefficient dual and U-fixed vectors. The actual split double cosets give the `T_v` and `S_v` compatibility.

**Checks.**

- At weight two with trivial `ψ` the constant norm form is removed.
- At a split good place the polynomial remains `X²−T_v X+q_v S_v`.
- An integral congruence between cusp and norm branches does not imply an integral direct-sum decomposition.
- The globally split algebra is not an instance of the division-spectrum assertion; its noncuspidal Eisenstein representations are not silently called cuspidal.

(Source: [BR10](#references) Theorem 18.1 and Proposition 18.2, pp.44–45 (Proved global discrete transfer and its cuspidal/residual distinction replace reliance on the conjectural converse in the older source); [JL70](#references) Theorem 14.4, p.238; Theorem 16.1 and proof discussion, pp.252–254 (Classical quaternionic formulation; the converse proof is only sketched there, so this source alone is not used to close that direction); [Tay06](#references) Lemma 1.3, pp.741–742 (The definite all-finite-split case realizes exactly the weight space quotient by norm forms))

*Needs:* GL2AutomorphicRepresentationsAndTransfer §§R17.1.1–R17.3.9; [R18.3.19 Finite quaternion local transfer needed by the definite comparison](#r18319-finite-quaternion-local-transfer-needed-by-the-definite-comparison), [R18.3.20 Real weight and dual convention in quaternion transfer](#r18320-real-weight-and-dual-convention-in-quaternion-transfer), [R18.3.3 Fixed-central-character algebraic forms](#r1833-fixed-central-character-algebraic-forms), [R18.3.7 Norm-factor forms and Eisenstein support](#r1837-norm-factor-forms-and-eisenstein-support); [GL2AutomorphicRepresentationsAndTransfer, §§R16.2.13, R16.4.5, R16.6.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md#r1663-hilbert-cohomological-algebraic-weights); [AutomorphicSpectralTheory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AutomorphicSpectralTheory/README.md) `§4.5`, `§4.7`, `Layer 6`.

### R18.3.22 Definite Jacquet–Langlands realization

**Finite-level comparison** (`DefiniteJl`). The definite correspondence, split Hecke compatibility and rational-model comparison are supplied by GL2AutomorphicRepresentationsAndTransfer §§R17.3.7–R17.3.9. The target here transports the chosen actual coefficient realization to the finite integral module after inverting its uniformizer, compatibly with the pairing and inverse coefficient action of §§R18.3.3–R18.3.6.

Characteristic zero; exclude one-dimensional norm characters and fix embeddings/splittings.

*Comparison.* Decompose the finite-level module into automorphic representations of `D×` using the discrete-spectrum input of AutomorphicSpectralTheory Layer 4, as packaged in [R18.3.21 Degree-two global inner-form spectral transfer](#r18321-degree-two-global-inner-form-spectral-transfer). Match the infinity types by [R18.3.20 Real weight and dual convention in quaternion transfer](#r18320-real-weight-and-dual-convention-in-quaternion-transfer) and the local components at ramified places by [R18.3.19 Finite quaternion local transfer needed by the definite comparison](#r18319-finite-quaternion-local-transfer-needed-by-the-definite-comparison). Use the GL2AutomorphicRepresentationsAndTransfer §R16.4.5 rational-model comparison only after the coefficient field and descent obstruction have been handled.

**Checks.**

- For `F=ℚ` and D ramified at `{p,∞}`, a weight-two Steinberg cusp at p contributes with its maximal-division-level character partner.
- Constants in weight two lie in the norm branch and are excluded.
- A nonunit factorial or isotropy denominator prevents an integral perfect-pairing claim; the characteristic-zero comparison retains the explicitly chosen rational pairing.

(Source: [BR10](#references) §1.5, pp.5–7; §18.1, Theorem 18.1(a)–(b), pp.44–45, specialized to quaternion inner forms; [KW09](#references) §7, pp.59–60, finite-level application.)

*Needs:* GL2AutomorphicRepresentationsAndTransfer §§R17.1.1–R17.3.9; [R18.3.3 Fixed-central-character algebraic forms](#r1833-fixed-central-character-algebraic-forms), [R18.3.7 Norm-factor forms and Eisenstein support](#r1837-norm-factor-forms-and-eisenstein-support), [R18.3.21 Degree-two global inner-form spectral transfer](#r18321-degree-two-global-inner-form-spectral-transfer), [R18.3.20 Real weight and dual convention in quaternion transfer](#r18320-real-weight-and-dual-convention-in-quaternion-transfer), [R18.3.6 Split Hecke normalization](#r1836-split-hecke-normalization); [AdelicAlgebraicGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md) `§4.5`; [GL2AutomorphicRepresentationsAndTransfer, §§R16.2.13, R16.4.5, R16.6.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md#r1663-hilbert-cohomological-algebraic-weights); [§R18.3.3 Fixed-central-character algebraic forms](#r1833-fixed-central-character-algebraic-forms).

### R18.3.23 Liftable reduction with isotropy

**Construction** (`LiftableReductionImage`). For each finite effective `Γ_t` acting on the O-free coefficient lattice W, let `L_t` be the image of `W^{Γ_t}⊗_O k→(W⊗_O k)^{Γ_t}`. Evaluation identifies the image of reduction `S(U,O)⊗k→S(U,k)` with the direct sum of these `L_t`. This reduction map is injective, but its image need not be all residual forms. Use the existing invariant submodule and image operations; `L_t` is a named application of them, not a new invariant theory.

O is a DVR; W is finite free; the effective action is integral and finite.

*Construction.* `W^{Γ}` is saturated in W because each invariance equation has torsion-free target W. Therefore reduction of the inclusion is injective. Evaluation commutes with reduction of actual integral functions and identifies its image term by term. Prime-to-p averaging gives surjectivity when `|Γ|` is a unit; retain only the image in general.

Its API:

- `LiftableReductionImage.inclusion`: The image inclusion is a k-linear map into residual invariant coefficients.
- `LiftableReductionImage.mem`: A residual invariant vector is in `L_t` exactly when it is the reduction of an integral invariant vector.
- `LiftableReductionImage.reductionInjective`: The induced map `W^Γ⊗k→W_k^Γ` is injective for W torsion-free over a DVR. More generally, over any domain, if an invariant vector in a torsion-free representation is divisible by a nonzero scalar in W, its quotient is invariant too.
- `LiftableReductionImage.unitIsotropy`: If `|Γ|` is invertible, `L_t` equals the full invariant submodule. For any finite Γ over a commutative ring O with invertible `|Γ|`, an equivariant surjective O-linear coefficient map carries integral invariants onto target invariants by averaging; no torsion-free or residue-field hypothesis is needed for this assertion.
- `LiftableReductionImage.transport`: Intertwining coefficient maps carry liftable vectors to liftable vectors; identity and composition are inherited from images.
- `LiftableReductionImage.globalEvaluation`: The global liftable subspace is the direct sum over class representatives, naturally under their transport.

**Checks.**

- `LiftableReductionImage.signAtTwo`: The `Z_2` sign representation of `C₂` has zero liftable image but one-dimensional residual invariants.
- `LiftableReductionImage.trivialAction`: For a trivial `C₂` action on `Z_2` the liftable image is the full `F_2`.
- `LiftableReductionImage.oddIsotropy`: For `C₃` over `Z_2` averaging makes every residual invariant liftable. The native mirror `LiftableReductionImage.cyclicPermutation` acts on `ℤ³` by a cyclic coordinate shift; both integral and mod-two invariants are diagonal, and every residual diagonal has an integral invariant lift.
- `LiftableReductionImage.directSum`: For the direct sum of the trivial and sign `Z_2` characters the liftable subspace has dimension one while residual invariants have dimension two. The integral mirror on `ℤ²` has liftable image `{(a,0):a∈F_2}` under coordinatewise reduction.

In [Suggested.lean](Suggested.lean): `liftableResidueImage`, `mem_liftableResidueImage`, `LiftableReductionImage.reductionInjective`, `LiftableReductionImage.unitIsotropy`, `LiftableReductionImage.directSum`, `LiftableReductionImage.oddIsotropy`.

(Source: [KW09](#references) Lemma 7.4(1) and proof, pp.64–65 (The comparison is between images of integral reduction, not all residual forms); [Tay06](#references) Corollary 1.2, p.739 (Prime-to-p isotropy is the stronger situation where arbitrary base change is available))

*Needs:* [R18.3.3 Fixed-central-character algebraic forms](#r1833-fixed-central-character-algebraic-forms); Mathlib `Representation.invariants`, `Module.Free`, `Module.Finite`.

### R18.3.24 Common liftable image of Taylor–Wiles coefficient twists

**Theorem** (`twTwist_commonLiftableImage`). For a fixed admissible Q and exponent bound N, enlarge O to contain the values of all characters of `Δ_Q`. For every `χ:Δ_Q→O×`, evaluation at the same representatives identifies the underlying O-modules `S_{W(χ),ψ}(U′_Q,O)` with the same direct sum `W^{Γ_t}`; reduction gives identical Hecke-stable liftable subspaces in the residual form space. The integral identifications need not intertwine Hecke. Equal reduction images do not identify the entire residual form space when p divides an isotropy order.

`Q, U′_Q, U_Q` and `Δ_Q` use the N-torsion quotient convention. Here U′_Q is the Iwahori level of §R18.3.12, distinct from the compact sublevel U⁰ of §R18.3.10. Characters reduce to 1 in k.

*Proof route.* By the stabiliser theorem every `Δ_Q`-character restricts trivially to `Γ_t`. Evaluation gives identical invariant lattices; the reduction-image construction identifies the common liftable image. The generic Hecke sums reduce to the same operators because the p-power character values reduce to one; no integral Hecke equivariance is asserted.

**Checks.**

- `Q=∅` gives the identity image.

- The dyadic sign example still has residual vectors outside the liftable image.
- For a single auxiliary place, the character twist is a representation of U′_v through `U′_v/U_v=Δ_v`; the kernel level U_v and the compact dyadic sublevel U⁰ are different objects.

(Source: [KW09](#references) Lemma 7.4(1), pp.64–65 (Uses triviality on isotropy and the common reduction image, with a non-Hecke integral comparison))

*Needs:* [R18.3.12 Quaternionic Taylor–Wiles level](#r18312-quaternionic-taylorwiles-level), [R18.3.13 Stabiliser equality at Taylor–Wiles level](#r18313-stabiliser-equality-at-taylorwiles-level), [R18.3.23 Liftable reduction with isotropy](#r18323-liftable-reduction-with-isotropy).

### R18.3.25 Quadratic norm characters descend to dyadic auxiliary level

**Theorem** (`dyadicLevel_det_isSquare`). Choose an exponent bound `N=2^b` with `b≥0`. If `v∈Q` has `v₂(q_v−1)=a≥n>b`, then every `u∈U_{Q,v}` has square determinant in `k_v×`. Consequently any quadratic idele character `χ` unramified outside Q and trivial at the prescribed other factors satisfies `χ(Nrd U_Q)=1`. Together with `Nrd(z)=z²` this makes the norm twist preserve level and central character.

`p=2`, weight two; the finite Q is given, lies away from 2 and the bad factors, and `q_v≡1` modulo `2ⁿ`.

`Δ_v=Δ′_v/Δ′_v[N]`, where `Δ′_v` is the maximal 2-power quotient of `k_v×`. The condition n>b is explicit.

*Proof route.* In the cyclic 2-primary group `C_{2^a}`, the kernel of the quotient by N-torsion is generated by the `2^{a−b}` power of a generator, hence lies in the squares. The odd-order part is also made of squares. For an Iwahori matrix, det modulo v is `a d=(a/d)d²`. Its diagonal ratio lies in that kernel, so its determinant is a square. Apply the local quadratic character to the norm; outside Q use its stated triviality or unramified unit condition. Scalars have square norm.

**Checks.**

- For `Δ′=C₈` and `N=2`, the ratio kernel is {0,4}, contained in the square subgroup {0,2,4,6}.
- For `N=1` the ratio kernel is trivial in the 2-primary quotient, hence still square; this edge case satisfies the determinant conclusion.
- At `Δ′=C₂,N=2` the whole ratio group survives as kernel and contains a nonsquare; the strict inequality a>b is essential.

In [Suggested.lean](Suggested.lean): `twDiagonalTorsion_isSquare`.

(Source: [KW09](#references) §7.4, pp.63–64; §7.5 preceding Proposition 7.6, p.66 (Provides the quotient convention and uses square determinants to prove well-definedness of the twist))

*Needs:* [R18.3.12 Quaternionic Taylor–Wiles level](#r18312-quaternionic-taylorwiles-level); Tau Ceti `QuaternionAlgebra.normForm_coe`.

### R18.3.26 Dyadic reduced-norm twist

**Construction** (`DyadicNormTwist`). For `p=2` and a given quadratic character `χ:G_n/2G_n→O×`, split at S and infinity and unramified outside Q, with `2ⁿ>N` ensuring `χ(Nrd U_Q)=1`, define `T_χf(g)=χ(Nrd g) f(g)`. This O-linear involution preserves the weight, level and central character because `Nrd(z)=z²`. Existence of `χ` and selection of Q belong to the modularity-lifting arguments that use this construction.

`p=2`; `χ²=1`; prescribed `χ` is trivial on the level norms.

*Construction.* Multiply the fixed-central-character functions by `χ∘Nrd`. Check left `D×` invariance, level invariance and the square on the centre. Use `χ²=1` to obtain the inverse and verify reduction `χ≡1 mod` the dyadic maximal ideal.

Its API:

- `DyadicNormTwist.apply`: `T_χf(g)=χ(Nrd g) f(g)`.
- `DyadicNormTwist.involutive`: `T_χ∘T_χ=id` for `χ²=1`.
- `DyadicNormTwist.centralCharacter`: The central character remains `ψ` since `χ(z²)=1`.
- `DyadicNormTwist.reduction`: At residue characteristic two the reduction of `T_χ` is the identity.

**Checks.**

- `DyadicNormTwist.trivial`: The trivial `χ` gives the identity.
- `DyadicNormTwist.scalar`: A central scalar z contributes `χ(z²)=1`.
- `DyadicNormTwist.nonquadratic`: An order-four character with `χ(z)=i` changes the scalar action by `−1` and does not preserve `ψ`.

In [Suggested.lean](Suggested.lean): `normTwist`, `normTwist_involutive`.

(Source: [KW09](#references) §7.5, p.66, before Proposition 7.6.)

*Needs:* [R18.3.12 Quaternionic Taylor–Wiles level](#r18312-quaternionic-taylorwiles-level), [R18.3.3 Fixed-central-character algebraic forms](#r1833-fixed-central-character-algebraic-forms), [R18.3.25 Quadratic norm characters descend to dyadic auxiliary level](#r18325-quadratic-norm-characters-descend-to-dyadic-auxiliary-level); Mathlib `LinearEquiv`.

### R18.3.27 Dyadic twist and Hecke transport

**Theorem** (`DyadicHeckeTwist`). For the norm twist, `T_v` and `U_v` are multiplied by `χ(π_v), S_v` is fixed, and `(f|⟨h⟩)_χ=χ(h)⁻¹(f_χ|⟨h⟩)`. Since `χ≡1` modulo the dyadic uniformizer, the residual maximal ideal is preserved. These equations transport the localized Taylor–Wiles modules and their ranks and coinvariants as in Proposition 7.6, conditional on the given auxiliary character.

The dyadic norm-twist hypotheses and compatible local diamond lifts.

*Proof route.* Move the norm multiplier through each finite coset sum. Use norm of `diag(π,1)`, scalar `diag(π,π)`, and diag(h,1). Reduce the units modulo the dyadic maximal ideal and transport the localized free module.

(Source: [KW09](#references) Proposition 7.6, pp.66–67.)

*Needs:* [R18.3.26 Dyadic reduced-norm twist](#r18326-dyadic-reduced-norm-twist), [R18.3.6 Split Hecke normalization](#r1836-split-hecke-normalization).

### R18.3.28 Unramified Iwahori root and degeneracy normalisation

**Theorem** (`iwahori_selectedRoot`). For an irreducible unramified principal series of `GL₂(L)` with normalized inducing characters `χ₁,χ₂`, its Iwahori fixed space has dimension two, with `U_v` eigenvalues `a=q^{1/2}χ₁(π), b=q^{1/2}χ₂(π)`. The spherical Hecke polynomial is `(X−a)(X−b)=X²−T_v X+q_v S_v`. When `a−b` is a unit in the local integral Hecke algebra, the selected root summand is separated integrally. In the right-translation convention the map `ξ_v(f)=A_v f−R_diag(1,π)f` lands in the summand reducing to `α_v`, where `A_v≡α_v` and `α_v≠β_v`.

v∤p, D split at `v, U_v=GL₂(O_v)`, and coefficients trivial at v.

The coefficient field contains the square root used for normalized induction; statements of T,S,U are independent of this auxiliary choice.

After localization `q≡1 mod p` and the two residual roots are distinct; Hecke algebras are completed so Hensel lifting applies.

*Proof route.* Use Taylor Lemma 1.6(2) for the local principal-series fixed-vector calculation and diamond action. On the two old vectors compute the U matrix in Taylor’s convention; the characteristic polynomial fixes the q S constant term. Lift the simple root by Hensel and apply the explicit `ξ_v` formula; the unit difference gives the complementary projectors.

**Checks.**

- At `q=1` modulo p, roots 1 and 2 in `F₃` are distinct and separate; two roots both equal to 1 do not.
- The constant term is qS, not S.
- The statement does not count a Steinberg component as a second spherical old vector.

(Source: [Tay06](#references) Lemma 1.6(2), pp.744–745; Lemma 2.2 and proof, pp.747–748 (The fixed-vector calculation and degeneracy matrix determine both selected-root and normalization conventions); [KW09](#references) §7.4 between Lemma 7.4 and Corollary 7.5, pp.65–66 (Records the selected root `ξ_v` in the quaternionic setting))

*Needs:* [R18.3.6 Split Hecke normalization](#r1836-split-hecke-normalization); [SmoothRepresentationsOfLocalGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md) `SR.2.2`, `SR.2.3`, `SR.3.4`.

### Examples

For weight two the coefficient module has rank one; for degree two and weight four it has rank nine; the derivative-normalized Sym² pairing has determinant ±4 and is not perfect over `ℤ₂`. In `C₈` with `N=2` the N-torsion kernel {0,4} gives the quotient `C₄`, while the subgroup of doubles gives `C₂`.

### Dependencies

This layer uses QuaternionicModularForms (§§0.3, 1.3, 2.1–2.2, 3.1); AdelicAlgebraicGroups (Layer 3, Layer 4, §4.5); GL2AutomorphicRepresentationsAndTransfer (R16.2.13, R16.6.3, R17.3.9); the fixed-central-character adapter `DefiniteSpecialisation` (§R18.3.3); AutomorphicSpectralTheory (Layer 4, Layer 6); SmoothRepresentationsOfLocalGroups (SR.0:abelian-category, SR.2, SR.3); the Tau Ceti roadmaps QuadraticFormInvariants; Tau Ceti `NumberField.card_elementaryTwoQuotient_units`, `QuaternionAlgebra.normForm_coe`, `TauCeti.SU2.existsUnique_nonempty_equiv_symPower`, `TauCeti.SU2.finrank_symPower`, `TauCeti.SU2.isIrreducible_symPower`, `TauCeti.SU2.symPower`; Mathlib `DoubleCoset.Quotient`, `DoubleCoset.eq`, `LinearEquiv`, `Module.Finite`, `Module.Free`, `MonoidAlgebra`, `MvPolynomial.eval₂Hom`, `QuotientGroup.mk`, `Representation`, `Representation.invariants`, `RingHom.ker`, `RingHom.ker_isMaximal_of_surjective`.

## Layer R18.4: Coefficient cohomology, Ihara's lemma and finite-level comparisons

Attach algebraic coefficient systems to the compact curves and compare their cohomology and Hecke actions, using the existing topological local-coefficient construction. Integral freeness and saturation need their own torsion and residual-vanishing hypotheses; a characteristic-zero transfer theorem does not supply them. The Ihara argument follows Manning–Shotton. It runs through a non-Eisenstein auxiliary prime, local deformation models, a Taylor–Wiles datum and a patched module with its flatness, and ends at the large-image residual lemma and its integral saturation. The Saito projector computes the weight of the coefficient summand of the auxiliary PEL family.

### R18.4.1 Quaternionic algebraic local systems

**Construction** (`QuaternionLocalSystem`). Specialize the shared automorphic local-system construction to `X_U` and a level-stable algebraic B×-representation W that is trivial on every rational scalar stabilizer `Γ_g∩F×`. Require its finite étale reductions to descend through the effective central kernel at every level and correspondence in use. On each complex component `Γ\H`, the Betti system is `(H×W)/Γ`; on the canonical curve the étale `O/lⁿ` systems descend the matching finite-level torsors, compatibly in n. Identify their pullbacks to the complex analytic curve using the fixed coefficient/dual convention. At split quaternionic p-level the rank-two Morita factor of H supplies the standard geometric representation on the framed cover; its coefficient constructions give local systems on the finite-level curve only when they satisfy these scalar-descent conditions. Parallel automorphic weight k uses the corresponding tensor and central twist of `Sym^{k−2}` constituents; automorphic weight two has the trivial rank-one coefficient system.

*Construction.* Import the generic coefficient-lattice and local-system descent API. Factor the arithmetic coefficient action through the effective scalar quotient before forming the associated bundle. Descend each finite reduction through that same kernel and compare the finite torsor descriptions. Apply generic Betti–étale comparison to the coefficient systems, retaining all embeddings and duals.

Its API:

- `QuaternionLocalSystem.betti`: On `Γ\H` the system is the Γ-associated W-bundle.
- `QuaternionLocalSystem.etaleReduction`: Reduction modulo `lⁿ` is the descended finite-level torsor coefficient system.
- `QuaternionLocalSystem.changeLevel`: Level pullback identifies the corresponding local systems.
- `QuaternionLocalSystem.trivial`: Trivial W gives the constant local system in both realizations.

**Checks.**

- `QuaternionLocalSystem.constant`: The trivial rank-one representation gives the constant O-system.
- `QuaternionLocalSystem.rank`: A rank-r lattice gives fibre rank r, not r times the covering degree.
- `QuaternionLocalSystem.monodromy`: On a loop acting by `−1` on W, parallel transport is `−1`; the constant system is wrong when 2 is invertible.
- For `F=ℚ(√2)` the line `W=σ∘Nrd` fails scalar descent: take `u=(1+√2)^{2m}≡1 mod N` with m positive. It fixes H but acts by `σ(u)²≠1` on W. Every sufficiently deep tame level still contains such a unit.

(Source: [Car86](#references) §1.4, pp.159–160; §4.4, pp.186–188.)

*Needs:* [R18.2.3 Quaternionic p-divisible sheaf](#r1823-quaternionic-p-divisible-sheaf); [ArithmeticLocallySymmetricSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md) `ALS.1`; [GL2AutomorphicRepresentationsAndTransfer, §§R16.2.13, R16.4.5, R16.6.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md#r1663-hilbert-cohomological-algebraic-weights); Tau Ceti `TauCeti.LocalCoefficientSystem`.

### R18.4.2 Quaternionic finite-level cohomology

**Construction** (`QuaternionCohomology`). Apply the imported cohomology functors to define `M_U=H¹_et(X_U, F̄, L_O)` and `M_U^B=H¹_B(X_U(C), L_O)`, with continuous `G_F` action on the étale side and finite O-modules. The good-place and change-level Hecke correspondences act by coefficient transport followed by pullback and trace. The Betti–étale comparison is Hecke-equivariant; integral O-freeness is a separate theorem, not part of the definition.

The ordinary Betti/sheaf and integral Betti–étale identifications assume `TopologicalCoefficientInput(O)` and the finite-cell completion comparison of §R18.4.12. The finite reductions and their derived adic comparison retain their finite-coefficient statements independently.

*Construction.* Import étale/Betti finiteness, coefficient comparison and pull-push for finite correspondences. Specialize all functors to the canonical quaternionic curve. Check compositions against generic Hecke convolution and away-place commutativity.

Its API:

- `QuaternionCohomology.hecke`: A correspondence acts by `p₂,*∘coefficientTransport∘p₁*`.
- `QuaternionCohomology.changeLevel`: Level pullback and trace compose with the degree on a finite étale cover.
- `QuaternionCohomology.comparison`: Betti–étale comparison intertwines the Hecke actions.
- `QuaternionCohomology.galoisCommutes`: `G_F` commutes with correspondences defined over F.

**Checks.**

- `QuaternionCohomology.genusTwo`: Constant rational coefficients on a connected genus-two curve give dimension 4.
- `QuaternionCohomology.identityCorrespondence`: The identity correspondence acts as the identity.
- `QuaternionCohomology.coverDegree`: For a finite étale cover of degree `d, trace∘pullback=d` on cohomology.

(Source: [CDN20](#references) §5.2.1, proof of Proposition 5.2, pp.41–42.)

*Needs:* [R18.4.1 Quaternionic algebraic local systems](#r1841-quaternionic-algebraic-local-systems), [R18.2.10 Integral Hecke extensions](#r18210-integral-hecke-extensions); [ArithmeticLocallySymmetricSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md) `ALS.3`, `ALS.5a`; [EtaleCohomologyFoundations, §§F.0–F.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EtaleCohomologyFoundations/README.md); [ClassicalAdicEtaleCohomology, §§1.1–1.5, 9.2–9.7, 11.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md); [ComplexComparisonPartII, §§C6.3–C6.6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md).

### R18.4.3 Integral torsion and reduction criteria

**Theorem** (`IntegralCohomologyControl`). For a maximal ideal m of the good-place Hecke algebra, write `m*=ι(m)` for its corresponding ideal on the Tate-dual coefficients, where `ι(T_v)=S_v⁻¹T_v` and `ι(S_v)=S_v⁻¹`. If `H⁰(X, L_k)_m` and `H⁰(X, L_k∨(1))_{m*}` vanish, then the localized `H¹(X, L_O)_m` is finite free over O, `H²(X, L_O)_m` has no O-torsion, and `H¹(X, L_O)_m⊗k→H¹(X, L_k)_m` is an isomorphism. No equality `m=m*` is assumed. Proving these vanishings for the intended non-Eisenstein systems is an explicit quaternionic coefficient-system obligation; arbitrary non-Eisenstein language alone is not substituted for them.

O is the ring of integers of a finite extension of `ℚ_l`, and the algebraic coefficient lattice is U-stable with a specified central character, trivial on each rational scalar stabilizer, and has finite reductions descending through the effective central kernel as in §R18.4.1; an integral coefficient pairing is required where duality is used. Generic integral coefficient long exact sequences, Poincaré duality, and compatible Hecke localization.

*Proof route.* For a uniformizer λ and residue field k, localize the coefficient sequence `0→L_O→L_O→L_k→0`, with first map multiplication by λ, at m. The first vanishing kills `H¹(X,L_O)_m[λ]`. Residual Poincaré duality pairs `H²(X,L_k)_m` with `H⁰(X,L_k∨(1))_{m*}`, so the second vanishing kills `H²(X,L_k)_m`. The coefficient sequence and Nakayama then give `H²(X,L_O)_m=0`. Finiteness over the DVR gives freeness of H¹, and the same sequence gives the reduction isomorphism, retaining m on the original coefficients and m* on the dual throughout.

**Checks.**

- For constant coefficients on a connected proper curve, unlocalized H⁰ is k, so the criterion needs a localization killing this term.
- The zero localized coefficient module gives the zero free H¹ and its reduction isomorphism.
- At `l=2` a rank-one sign monodromy becomes trivial modulo two; characteristic-zero H⁰ vanishing alone does not supply the residual criterion.
- A good-place eigensystem `(T_v,S_v)=(1,2)` over `F₇` has adjoint `(4,4)`. These maximal ideals differ, so vanishing of the dual group at m cannot replace its vanishing at m*.

(Source: [CDN20](#references) §5.2.1, p.41; [NT16](#references) Proposition 3.7(3), p.32, for inverse-double-coset adjoints.)

*Needs:* [R18.4.2 Quaternionic finite-level cohomology](#r1842-quaternionic-finite-level-cohomology); [ArithmeticLocallySymmetricSpaces, ALS.5a.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md#als5a4-hecke-adjoints-inverse-double-cosets-and-restrictioncorestriction); [EtaleCohomologyFoundations, §§F.0–F.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EtaleCohomologyFoundations/README.md); [ClassicalAdicEtaleCohomology, §§1.1–1.5, 9.2–9.7, 11.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md); [ComplexComparisonPartII, §§C6.3–C6.6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md).

### R18.4.4 Quaternionic cohomological duality

**Comparison** (`CohomologyPairing`). Specialize Poincaré duality to obtain the perfect rational pairing `H¹(X, L_E)×H¹(X, L_E∨(1))→E`. At integral level the duality is a derived duality; it gives a perfect O-pairing on localized H¹ only under the preceding torsion/vanishing criteria and a chosen perfect coefficient lattice pairing. Pullback is adjoint to trace, and Hecke adjoints reverse the correspondence with its coefficient similitude factor.

*Proof route.* Apply generic smooth proper curve duality and the coefficient evaluation map. Compare to Betti cup product and oriented fundamental class. Reverse the correspondence and invoke the integral torsion criterion when asserting perfection over O.

(Source: [CDN20](#references) §5.2.1, pp.41–42.)

*Needs:* [R18.4.3 Integral torsion and reduction criteria](#r1843-integral-torsion-and-reduction-criteria); [ArithmeticLocallySymmetricSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md) `ALS.3`, `ALS.5a`; [EtaleCohomologyFoundations, §§F.0–F.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EtaleCohomologyFoundations/README.md); [ClassicalAdicEtaleCohomology, §§1.1–1.5, 9.2–9.7, 11.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md); [ComplexComparisonPartII, §§C6.3–C6.6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md).

### R18.4.5 Cohomological degeneracy maps

**Construction** (`QuaternionDegeneracy`). At w with B split, hyperspecial level and coefficient system unramified at w, the two canonical maps `X_{U₀(w)}→X_U` induce `δ=(δ₁*, δ₂*):M_U²→M_{U₀(w)}`. Their trace maps give the dual degeneracy map. They commute with `G_F` and away-w Hecke operators; the pullback/trace composition matrix is obtained from the local double-coset computation with degree `q_w+1`. Integral injectivity and saturated image require an Ihara theorem with explicit hypotheses, and are not inferred from the definite Lemma 7.1.

O is the ring of integers of a finite extension of `ℚ_l`, and the algebraic coefficient lattice is U-stable with a specified central character, trivial on each rational scalar stabilizer, and has finite reductions descending through the effective central kernel as in §R18.4.1; an integral coefficient pairing is required where duality is used. The coefficient action extends to the local semigroup; the two level morphisms use a specified `diag(1, π_w)`.

*Construction.* Build the two maps by intersection of U with its conjugate. Transport the coefficient sheaf and apply generic pullback and trace. Compute the degree and off-diagonal double cosets; use the integral Ihara input separately.

Its API:

- `QuaternionDegeneracy.pullback`: `δ` maps (a, b) to `δ₁*a+δ₂*b` with transported coefficients.
- `QuaternionDegeneracy.trace`: The reverse map is the pair of coefficient-compatible traces.
- `QuaternionDegeneracy.awayHecke`: Both maps intertwine all Hecke correspondences away w.
- `QuaternionDegeneracy.degree`: Each hyperspecial-to-Iwahori map has degree `q_w+1`.

**Checks.**

- `QuaternionDegeneracy.qTwo`: For residue field `F₂` the covering degree is 3.
- `QuaternionDegeneracy.tracePullback`: The diagonal trace–pullback composition is `q_w+1`.
- `QuaternionDegeneracy.badPlace`: At a division place there is no hyperspecial `GL₂-to-Iwahori` map of this shape.

(Source: [KW09](#references) §7, Lemma 7.1, p.60, definite analogue only; curve pullback and trace use the canonical level maps and proper-smooth cohomology functoriality.)

*Needs:* [R18.4.2 Quaternionic finite-level cohomology](#r1842-quaternionic-finite-level-cohomology), [R18.3.6 Split Hecke normalization](#r1836-split-hecke-normalization); [ArithmeticLocallySymmetricSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md) `ALS.3`.

### R18.4.6 Finite-level invariants and trace control

**Theorem** (`FiniteLevelDescent`). For a finite effective étale Galois level cover `X_{U′}→X_U` with group `Δ` of order invertible in the coefficient ring and compatible local systems, pullback identifies `H¹(X_U, L)` with `H¹(X_{U′}, L)^Δ` and `|Δ|⁻¹trace` is its inverse on invariants. When p divides `|Δ|`, replace this assertion by the Hochschild–Serre spectral sequence and coefficient torsion terms; no unconditional integral invariants equality is asserted.

O is the ring of integers of a finite extension of `ℚ_l`, and the algebraic coefficient lattice is U-stable with a specified central character, trivial on each rational scalar stabilizer, and has finite reductions descending through the effective central kernel as in §R18.4.1; an integral coefficient pairing is required where duality is used. Cover finite étale on the generic fibre and genuinely effective; `|Δ|` invertible for the displayed equality.

*Proof route.* Apply the generic Cartan–Leray/Hochschild–Serre sequence. Average the finite group to kill higher group cohomology. Check trace/pullback and their equivariance under the away-level Hecke algebra.

**Checks.**

- The identity cover has `Δ=1` and normalized trace is the identity.
- For a degree-two cover with 2 invertible, trace composed with pullback is twice the identity and the inverse on invariants uses division by two.
- At residue characteristic two that averaging operator is unavailable; the Hochschild–Serre terms must be retained.

(Source: [YZ18](#references) §4.2, construction of the coarse models, p.565.)

*Needs:* [R18.4.2 Quaternionic finite-level cohomology](#r1842-quaternionic-finite-level-cohomology), [R18.2.2 Effective small level and genus](#r1822-effective-small-level-and-genus); [EtaleCohomologyFoundations, §§F.0–F.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/EtaleCohomologyFoundations/README.md); [ClassicalAdicEtaleCohomology, §§1.1–1.5, 9.2–9.7, 11.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md); [ComplexComparisonPartII, §§C6.3–C6.6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md).

### R18.4.7 Hecke action on quaternionic connected components

**Construction** (`componentHeckeAction`). For a sufficiently small level K of an indefinite quaternion division algebra D/F split at exactly one real place, retain every geometric connected component. Reduced norm identifies their indexing torsor with `C_K=F_{f}^{×}/(F^{×,+}ν(K))`. On the free finite A-module `A[C_K]`, at v outside the discriminant, level and coefficient-action set, `T_v` acts by (`q_v+1`) times translation by the class `c_v` of a uniformizer, and `S_v` by translation by `c_v²`. On a component character `χ` the spherical polynomial is `(X−χ(c_v))(X−q_vχ(c_v))`. This is a geometric component-action specialization of the existing `GL₂` Hecke normalization.

F totally real; D division and split at exactly one real place; K sufficiently small in the effective central quotient.

A finite coefficient algebra; the two spherical double cosets have `volume(K_v)=1`; translations use the right-level convention.

*Construction.* Use canonical quaternionic components and reduced-norm strong approximation to obtain the finite component torsor. Every representative in `K diag(π_v,1) K` has norm class `c_v`, and the double coset has `q_v+1` right cosets. The scalar double coset has norm class `c_v²`. Extend these permutations A-linearly; the character calculation agrees with §3a.1’s polynomial `X²−T_vX+q_vS_v`.

Its API:

- `components_T`: `T_v[e_c]=(q_v+1)[e_{c c_v}]`.
- `components_S`: `S_v[e_c]=[e_{c c_v²}]`, so `S_v` is invertible.
- `components_character`: At `χ` the two roots are `χ(c_v)` and `q_vχ(c_v)`.
- `components_linearAction`: Extend the right permutation of the finite component torsor to `A[C_K]` by A-linearity; an equivariant identification of torsors induces the corresponding module isomorphism.
- `components_ext`: A-linear maps out of `A[C_K]` are equal if they agree on every component basis vector.
- `components_translation_comp`: Translation by 1 is the identity; translation by c then d is translation by cd, and translation by `c⁻¹` is its inverse. The dual function model acts by f(xc).
- `components_coeffMap`: `A→B` sends each basis vector to the same indexed B-basis vector and commutes with T and S; identity and composite coefficient maps agree.

**Checks.**

- `component_trivial`: For `C_K=1` and `A=F_7, q_v=3, T_v=4` and `S_v=1`.
- `component_central`: For `C_K` cyclic of order 3 and `c_v` a generator, `S_v` is a nonidentity permutation.
- `component_change_uniformizer`: Multiplying `π_v` by `O_v×` leaves both operators unchanged.

In [Suggested.lean](Suggested.lean): `componentTranslation`, `componentT`, `componentS`, `components_character`.

(Source: [MS19](#references) §§2.7–2.9 and proof of Proposition 2.3, pp.8–10 (The component Hecke action forces a reducible unramified characteristic polynomial))

*Needs:* [R18.1.3 Canonical quaternionic curve and uniformization](#r1813-canonical-quaternionic-curve-and-uniformization), [R18.4.1 Quaternionic algebraic local systems](#r1841-quaternionic-algebraic-local-systems); [IntegralHeckeAndGaloisDeterminants](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md) `§3a.1`.

### R18.4.8 Residual Eisenstein vanishing

**Theorem** (`residualEisensteinVanishing`). Let `L_k` be the finite k-local system from a continuous finite-image K-representation, trivial on `K∩Z(F)`, whose action factors through finitely many finite places. Let m be a maximal ideal of the away spherical Hecke algebra with associated absolutely irreducible residual two-dimensional representation. Then `H⁰(X_K,L_k)_m=H²(X_K,L_k)_m=0`. The same conclusion holds for `L_k∨(1)` at the adjoint ideal m*. No bound on the algebraic weight relative to l is required.

The compact curve, level and all components satisfy [R18.4.7 Hecke action on quaternionic connected components](#r1847-hecke-action-on-quaternionic-connected-components).

k is a finite field of characteristic l; the associated residual representation is given in the matched cohomological Hecke/Frobenius convention.

*Proof route.* Trivialize `L_k` at a finite normal finer level. Degree-zero sections embed in component sections with fibre coefficients; their good-place Hecke characters have the reducible polynomial computed by [R18.4.7 Hecke action on quaternionic connected components](#r1847-hecke-action-on-quaternionic-connected-components). Use existing ray-class reciprocity (with inverse arithmetic Artin map for the stipulated geometric convention) to realize each component character as `η` on `G_F`. Its two cohomological Frobenius roots give `η⊕ε⁻¹η`. Chebotarev density and semisimple reconstruction contradict absolute irreducibility for a character supported at m. This is Proposition 2.4’s argument, without assuming the level quotient semisimple. Use curve duality and the adjoint involution to transfer the degree-zero calculation for `L_k∨(1)` at m* to degree two for `L_k` at m.

**Checks.**

- A residual Eisenstein ideal can have `H⁰≠0`; irreducibility is indispensable.
- Use no idempotent averaging over a quotient of order divisible by l.

(Source: [MS19](#references) Propositions 2.3–2.4, pp.9–10 (Constant and finite local coefficient cohomology in degrees zero and two has Eisenstein support))

*Needs:* [R18.4.7 Hecke action on quaternionic connected components](#r1847-hecke-action-on-quaternionic-connected-components); [ArithmeticLocallySymmetricSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md) `ALS.4.10`, `ALS.5a.4`; [IntegralHeckeAndGaloisDeterminants](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md) `§1.2`; Tau Ceti roadmap [ClassFieldTheory, layer 12 separate arithmetic global existence the norm index and the global correspondence](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence); Tau Ceti roadmap [Chebotarev, layer 10 dirichlet density chebotarev](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev).

### R18.4.9 Adjoint Hecke localization and integral duality

**Comparison** (`adjointLocalizationDuality`). For finite free O-local coefficients on the compact curve, the integral Poincaré pairing pairs the m-factor of `H¹(L_O)` with the m*-factor of `H¹(L_O∨(1))`, where m* is the image of m under the anti-involution `T_v*=S_v⁻¹T_v` and `S_v*=S_v⁻¹`. Non-Eisenstein support is preserved by this involution. Under residual degree-zero vanishings on the two factors the pairing is perfect over O, and pullback is adjoint to trace. No equality `m=m*` is assumed.

O is the valuation ring of a finite extension of `ℚ_l`; the coefficients and their dual descend through the effective level.

The residual system and its adjoint factor have vanishing `H⁰` as in [R18.4.8 Residual Eisenstein vanishing](#r1848-residual-eisenstein-vanishing).

*Proof route.* Identify the inverse double cosets: `diag(π⁻¹,1)` is centrally translated from `diag(π,1)`, giving `S⁻¹T`; invert the central scalar double coset to get `S⁻¹`. Apply the derived [R18.4.4 Quaternionic cohomological duality](#r1844-quaternionic-cohomological-duality) and [R18.4.3 Integral torsion and reduction criteria](#r1843-integral-torsion-and-reduction-criteria) to these two localized factors. After residual vanishings eliminate adjacent-degree obstructions, derived duality restricts to a perfect degree-one lattice pairing. The trace identity follows from generic finite-level duality.

**Checks.**

- A central character of order greater than two can have `m*≠m`; the target retains both factors.
- The degree-one pairing is integral only after the stated vanishings.

(Source: [MS19](#references) §2.7 and proof of Proposition 2.3, pp.8–10 (The Hecke adjoint involution relates degrees zero and two); [Mil](#references) Theorem 24.1 and Remark 24.2, pp.144–145 (Curve duality and the trace normalization are compatible))

*Needs:* [R18.4.4 Quaternionic cohomological duality](#r1844-quaternionic-cohomological-duality), [R18.4.3 Integral torsion and reduction criteria](#r1843-integral-torsion-and-reduction-criteria), [R18.4.8 Residual Eisenstein vanishing](#r1848-residual-eisenstein-vanishing); [ArithmeticLocallySymmetricSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md) `ALS.5a.2`.

### R18.4.10 Non-Eisenstein integral cohomology control

**Application** (`nonEisensteinIntegralControl`). For the finite free O-local system `L_O` on `X_K` and a non-Eisenstein maximal ideal m as above, `H⁰(L_O)_m=H²(L_O)_m=0, H¹(L_O)_m` is finite free over O, and `H¹(L_O)_m⊗_O k→H¹(L_k)_m` is an isomorphism. For every `n≥1` the analogous `O/λⁿ` coefficient reduction is an isomorphism. These statements apply at both hyperspecial and sufficiently small Iwahori levels with coefficients descending there.

All localized cohomology groups are finite O-modules as in the [R18.4.2 Quaternionic finite-level cohomology](#r1842-quaternionic-finite-level-cohomology).

Finite free coefficients and their residual dual satisfy [R18.4.8 Residual Eisenstein vanishing](#r1848-residual-eisenstein-vanishing).

*Proof route.* Apply [R18.4.8 Residual Eisenstein vanishing](#r1848-residual-eisenstein-vanishing) to `L_k` and its Tate dual, keeping the adjoint ideal. The coefficient exact sequence and Nakayama kill `H²(L_O)_m`; degree-zero torsion-free sections vanish by reduction. The same sequence makes `H¹(L_O)_m` λ-torsion-free. Apply the control theorem and the pinned PID finite-torsion-free freeness result. Induct on n using coefficient sequences to obtain every finite reduction.

**Checks.**

- The proof applies to all n, not merely rational coefficients.
- No corresponding unqualified freeness assertion is made for an open Hilbert variety.

(Source: [MS19](#references) Proposition 2.4, p.10, and §2.10, p.10 (Residual Eisenstein vanishing supplies the finite-level integral reduction needed for homology and cohomology); [Mil](#references) Theorem 24.1, p.144 (Duality controls the adjacent degree in the coefficient sequence))

*Needs:* [R18.4.2 Quaternionic finite-level cohomology](#r1842-quaternionic-finite-level-cohomology), [R18.4.3 Integral torsion and reduction criteria](#r1843-integral-torsion-and-reduction-criteria), [R18.4.9 Adjoint Hecke localization and integral duality](#r1849-adjoint-hecke-localization-and-integral-duality); Mathlib `Module.free_of_finite_type_torsion_free'`.

### R18.4.11 Finite-cover reduction for Ihara coefficients

**Theorem** (`coefficientDescentForIhara`). Let `H^w` be an open normal subgroup of `K^w` trivializing a finite k-representation `Λ` of `K^w`, trivial on `K∩Z(F)`. At a non-Eisenstein ideal, injectivity of the constant-coefficient degeneracy map at every sufficiently small finer `H^w` implies injectivity for `L_Λ` at K. The quotient `K^w/H^w` may have order divisible by l.

The degeneracy prime w is split for D and `K_w` is hyperspecial.

The coefficient action is away from w; the same normal subgroup is used at both w-levels.

*Proof route.* Use the finite-cover Hochschild–Serre sequence, not division by the covering degree. Its initial `H¹(Δ,H⁰(X_H,k)⊗Λ)` term vanishes after non-Eisenstein localization by [R18.4.8 Residual Eisenstein vanishing](#r1848-residual-eisenstein-vanishing); `H⁰` itself vanishes there. Identify H¹ at K with the Δ-invariants of the localized finer cohomology tensored with `Λ`. An equivariant injective degeneracy map remains injective after invariants.

**Checks.**

- A cover quotient of l-power order is an acceptance case; averaging is unavailable.
- Coefficients acting nontrivially at w are outside this reduction.

(Source: [MS19](#references) Lemma 6.4 and proof, p.34 (Finite local coefficients reduce to constant coefficients by Hochschild–Serre and degree-zero vanishing))

*Needs:* [R18.4.8 Residual Eisenstein vanishing](#r1848-residual-eisenstein-vanishing), [R18.4.5 Cohomological degeneracy maps](#r1845-cohomological-degeneracy-maps); [ArithmeticLocallySymmetricSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md) `ALS.6.2`.

### R18.4.12 Arithmetic coefficient adapter for twisted Betti cohomology

**Comparison** (`bettiCoefficientDualAdapter`). Let R be a commutative ring and W a finite projective R-representation of the arithmetic component group. Assume `TopologicalCoefficientInput(R)` of ALS.F.3 on the spaces and maps used whenever the finite-coefficient supplier does not cover them. Then the ordinary Betti local system `L_W` is compared with Tau Ceti’s existing twisted cochain complex applied to `L_(W∨)` and target R: its cochains take `Hom_R(W∨,R)`, identified with W by biduality. This yields `H^i_B(X_K,L_W)`, naturally for coefficient maps, level pullback and Hecke trace. Applying the existing complex to `L_W` itself would compute dual coefficients.

Finite projective fibres; effective small level; all arithmetic components and the prescribed local coefficient action retained. This includes finite free O-lattices and complex algebraic coefficient systems, with their respective `TopologicalCoefficientInput` hypotheses.

For a complete DVR O with finite residue field and a compatible finite projective O-local system on a supplied finite CW model, or a finite relative Borel–Serre pair for compact support, also identify `C^•(X,W) ≃ Rlim_n C^•(X,W/λⁿ)`, compatibly with its sheaf realization, coefficient change, level maps, traces and support maps. This is the comparison used to pass from derived adic realizations to ordinary nonconstant O-cochains. The analogous complex comparison on the connected-compact quotient uses `TopologicalCoefficientInput(ℂ)`; it does not follow from adic reduction.

*Proof route.* Read the actual twisted complex: it is linear Yoneda applied to twisted chains and is contravariant in its coefficient local system. Use fibrewise finite-projective biduality to identify `Hom_R(W∨,R)` with W, with transport carried by the dual inverse action. Apply ALS.1.4 with its displayed coefficient input; verify naturality under pullback and the stalk-sum trace. For the complete DVR specialization use the supplied finite cellular model with local coefficients: each term is finite projective over O, is λ-adically complete and has surjective reductions. The termwise Mittag–Leffler property kills the derived-limit error on this bounded cochain model, not necessarily on its cohomology groups. Compare it naturally with singular cochains and the sheaf realization using the assumed input. Transport covering transfers, coefficient change and relative pairs through these comparisons; no generic sheaf resolution for infinite coefficients is claimed without that input.

**Checks.**

- For W rank one with monodromy a unit u, the adapted coefficient transport is u; the unadapted Hom complex has `u⁻¹`.
- For the trivial rank-one representation, the adapter gives the ordinary constant R-cochain complex and identity coefficient transport.
- On a circle with an O-line of monodromy u, cellular cochains are `[O → O]` with differential `u−1`. Their derived inverse limit of reductions is this same complex, including when `u−1` is a nonunit and H¹ has torsion.
- On a real-quadratic connected-compact quotient with its circle fibre, nonconstant complex coefficients still require `TopologicalCoefficientInput(ℂ)`; finite freeness over an infinite ring is not a finite coefficient theorem.
- For `W=0`, the twisted cochains, and hence every cohomology group, are zero; no extra constant summand is inserted.

(Source: ArithmeticLocallySymmetricSpaces ALS.F.3 and ALS.1.4 (the wider comparison is a hypothesis), ALS.2.4 (finite relative models); ComplexComparisonPartII §§C6.1, C6.6 (finite local systems and derived adic realization); [Car86a](#references) §§2.1–2.2, pp.417–420 (Arithmetic representations define local systems on quaternionic components); [Mil](#references) Theorem 21.1 and Remark 21.2, pp.129–131 (Finite local coefficient étale/Betti comparison is compatible with the sheaf interpretation))

*Needs:* [ArithmeticLocallySymmetricSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md) `ALS.F.3`, `ALS.1.4`, `ALS.1.1`, `ALS.2.4`, with `TopologicalCoefficientInput(R)` outside the finite domain; Tau Ceti roadmap [AlgebraicTopology, stage 6 cohomology products and manifold duality](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicTopology/README.md#stage-6-cohomology-products-and-manifold-duality); Tau Ceti `TauCeti.LocalCoefficientSystem`, `TauCeti.LocalCoefficientSystem.pullback`, `TauCeti.LocalCoefficientSystem.monodromyRepresentation`.

### R18.4.13 Finite-level Hilbert support comparison

**Comparison** (`hilbertEtaleBettiAdapter`). For a smooth finite-level Hilbert modular variety Y over a number field, algebraic integral coefficients from the Hilbert arithmetic local-system construction, and an embedding into C, finite `O/λⁿ` étale and Betti cohomology agree naturally in every degree, with ordinary and compact supports and the map `H_c^i→H^i`. Passing to compatible O-adic systems gives their derived integral comparison. Inner cohomology is the image of this support map; its rational Hecke eigenspaces use ALS.5a–ALS.5b. No compactness, integral torsion-freeness or degree-g concentration is inferred.

The level is small enough for a smooth scheme or the declared effective groupoid treatment; coefficients are genuinely defined on both sides. Any use of H4.17 as a coarse torsor retains its geometric-freeness hypothesis. A quotient-stack torsor alone supplies no integral invariants comparison on a coarse space.

Support comparisons, constructible extension by zero and inverse-system hypotheses are those of ComplexComparisonPartII §§C6.3–C6.6.

Identifying a derived O-adic realization with ordinary nonconstant O-cochains additionally assumes `TopologicalCoefficientInput(O)` and uses §R18.4.12's finite relative model and completion comparison. Its rational ALS applications retain `TopologicalCoefficientInput` over the chosen characteristic-zero coefficient ring.

*Proof route.* Specialize the arithmetic-local-system and level-pullback targets to the Hilbert space, using the bidual adapter for existing Betti complexes. Import the finite étale/Betti support and trace-orientation comparisons from C6.3–C6.6; take the compatible derived O-adic system. Define the inner groups by the actual image of `H_c→H` and use functoriality to transport Hecke actions; the geometric boundary is not discarded.

**Checks.**

- For a proper smooth finite-level variety, `H_c^i→H^i` is an isomorphism and inner cohomology equals ordinary cohomology.
- For the support-comparison test `Y=𝔸¹` over an algebraically closed characteristic-zero field with constant finite nonzero coefficients, `H⁰` is the coefficient module whereas `H_c⁰=0`; their degree-zero image is zero. This tests the imported comparison before its Hilbert specialization.
- Zero coefficients give zero ordinary, compactly supported and inner groups in every degree.

(Source: [Mil](#references) Theorem 21.1 and Remark 21.2, pp.129–131 (Finite local coefficient comparison extends to constructible support calculations); [Del80](#references) Corollary 3.3.6, printed p.206 (Inner cohomology is the image between the two support theories, not the entire ordinary group))

*Needs:* [H3.8 Hecke isogenies between polarization components](#h38-hecke-isogenies-between-polarization-components), [H4.17 Finite-level torsors and diagonal exact sequences](#h417-finite-level-torsors-and-diagonal-exact-sequences), [R18.4.12 Arithmetic coefficient adapter for twisted Betti cohomology](#r18412-arithmetic-coefficient-adapter-for-twisted-betti-cohomology); [ArithmeticLocallySymmetricSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md) `ALS.1.1`, `ALS.1.2`, `ALS.5a.3`; [ComplexComparisonPartII, §§C6.3–C6.6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c63-finite-level-artin-comparison-for-constructible-coefficients).

### R18.4.14 GL₂ degeneracy Gram operator

**Definition** (`degeneracyGram`). For a commutative Hecke coefficient algebra A acting on an A-module `M, q∈N, T∈A` and `S∈A×`, define `G_(q,T,S)` on `M⊕M` by `(x,y)↦((q+1)x+S⁻¹Ty,Tx+(q+1)y)`. Put `Δ=(q+1)²−S⁻¹T²` and `J(x,y)=((q+1)x−S⁻¹Ty,−Tx+(q+1)y)`. Then `GJ=JG=Δ` id. The chosen ordering corresponds to `T=π₂,*π₁*`.

All scalar operations use the actual commuting Hecke image; S is a unit, not tacitly one.

*Construction.* Form the A-linear product map using scalar endomorphisms and the displayed four entries. Expand compositions to get the scalar `Δ`; commutativity cancels mixed terms. Match the central involution `T*=S⁻¹T` in the geometry below.

Its API:

- `gram_first`: `pr₁G(x,y)=(q+1)x+S⁻¹Ty`.
- `gram_second`: `pr₂G(x,y)=Tx+(q+1)y`.
- `gram_adjugate`: `GJ=JG=Δ` id.
- `gram_baseChange`: Extending scalars carries G, J and `Δ` to the same formulas over the new algebra.
- `gram_linearMap`: For an A-module M, commuting scalars `T∈A, S∈A×` and q, construct G,J as A-linear product maps with the displayed entries, and `Δ∈A`.
- `gram_ext`: Two product-valued linear maps are equal exactly when their first and second component maps agree; the displayed entries therefore determine G uniquely.
- `gram_moduleMap`: Every A-linear `f:M→N` intertwines `G_M` with `G_N` and `J_M` with `J_N` under `f×f`; this includes identities and composites.

**Checks.**

- `gram_zero_hecke`: With `T=0` the matrix is (q+1) times identity, and `Δ=(q+1)²`.
- `gram_central_factor`: Over `Q, q=2, T=3, S=2` gives `G(0,1)=(3/2,3)`; removing `S⁻¹` fails.
- `gram_level_raise`: For `q=2,T=3,S=1` over `Q, Δ=0` and `G(1,−1)=0`.

In [Suggested.lean](Suggested.lean): `degeneracyGram`, `degeneracyDiscriminant`, `degeneracyAdjugate`, `gram_adjugate`.

(Source: [MS19](#references) §§2.6–2.7 and §2.11, pp.8,10–11 (Right-level maps and double cosets determine the two trace-pullback entries; the matrix is derived here with the central adjoint retained))

*Needs:* [R18.4.9 Adjoint Hecke localization and integral duality](#r1849-adjoint-hecke-localization-and-integral-duality); [ArithmeticLocallySymmetricSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md) `ALS.3.5–ALS.3.7`.

### R18.4.15 Geometric degeneracy Gram identity

**Theorem** (`geometricGramIdentity`). At a split hyperspecial prime w, take `ω=diag(π_w,1), K_0(w)` with lower-left entry divisible by `π_w, π₁=ρ_1` and `π₂=ρ_(ω⁻¹)`. Both maps `X_(K_0(w))→X_K` have degree `q_w+1`. For coefficients acted on away from `w, δ=π₁*+π₂*:M²→M_0` and `δ†=(π₁,*,π₂,*)`. With `T_w=π₂,*π₁*` and `S_w` the central scalar double coset, `δ†δ=G_(q_w,T_w,S_w)`.

Use the maps and coefficient identifications of the [R18.4.5 Cohomological degeneracy maps](#r1845-cohomological-degeneracy-maps).

All cohomology is localized at an away Hecke ideal compatible with these maps; integral traces have their unnormalized degree convention.

*Proof route.* Count cosets for both maps, obtaining diagonal trace-pullback `q_w+1`. The composite `π₂,*π₁*` is the `diag(π_w,1)` double coset in the stipulated right-action convention. The reverse composite is its inverse double coset, centrally translated by `S_w⁻¹`. Substitute the four entries in [R18.4.14 GL₂ degeneracy Gram operator](#r18414-gl₂-degeneracy-gram-operator).

**Checks.**

- Changing the ordering of `π₁` and `π₂` transposes the off-diagonal entries; the declared ordering remains fixed.
- The double-coset identity holds before assuming residual Ihara.

(Source: [MS19](#references) §2.11, pp.10–11, with §2.7, p.8 (The two right-level degeneracy maps and the central spherical operator fix the normalization))

*Needs:* [R18.4.5 Cohomological degeneracy maps](#r1845-cohomological-degeneracy-maps), [R18.4.14 GL₂ degeneracy Gram operator](#r18414-gl₂-degeneracy-gram-operator), [R18.4.9 Adjoint Hecke localization and integral duality](#r1849-adjoint-hecke-localization-and-integral-duality); [ArithmeticLocallySymmetricSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md) `ALS.3.8`.

### R18.4.16 Unit-discriminant oldspace splitting

**Theorem** (`oldspaceSplitting`). If `Δ=(q_w+1)²−S_w⁻¹T_w²` is a unit in the localized Hecke image, then `r=Δ⁻¹Jδ†` is an integral left inverse of `δ`. Thus the old module `im δ` is a direct summand of `M_0` and `δ` is injective. With free `M_0` the quotient is O-free. The hypothesis `Δ∈A×` is sufficient for this splitting, not necessary for Ihara saturation.

[R18.4.15 Geometric degeneracy Gram identity](#r18415-geometric-degeneracy-gram-identity); all scalar operators commute and `Δ` is a unit.

The freeness conclusion additionally assumes O a DVR and `M_0` finite free.

*Proof route.* Use the adjugate identity to compute `rδ=Δ⁻¹JG=id`. The idempotent `δr` gives `M_0=im δ⊕ker r`. Finite direct summands of a free DVR module are finite torsion-free and hence free.

**Checks.**

`- Δ≡0 mod λ` does not prove failure of residual Ihara; no converse is asserted.

- The left inverse contains the central operator in J.

In [Suggested.lean](Suggested.lean): `oldspace_split`.

(Source: [MS19](#references) §§2.7 and 2.11, pp.8,10–11 (The trace and degeneracy operators supply the input; this unit-discriminant conclusion is an explicit algebraic deduction))

*Needs:* [R18.4.15 Geometric degeneracy Gram identity](#r18415-geometric-degeneracy-gram-identity); Mathlib `Module.free_of_finite_type_torsion_free'`.

### R18.4.17 Residual injectivity and DVR saturation

**Theorem** (`residualInjectivitySaturation`). For a DVR O with uniformizer `λ`, finite free O-modules M,N and an O-linear `f:M→N`, injectivity of `f mod λ` is equivalent to f being injective with finite free cokernel. Equivalently f is injective and im f is saturated in N. Here saturated means `λy∈im f` implies `y∈im f`; all nonzero scalars then have the same property.

O is a nonfield DVR; `λ` generates its maximal ideal; M and N are finite free.

*Proof route.* If `f mod λ` is injective, divide a purported kernel vector by its minimal coordinate valuation to contradict reduction. If `λy=f(x)`, reduction gives `x=λx′`; torsion-freeness of N gives `y=f(x′)`. Thus the cokernel has no λ-torsion, hence no torsion. Apply the pinned finite-torsion-free freeness theorem. Conversely a short exact sequence with a free cokernel stays exact after tensoring k, so `f mod λ` is injective.

**Checks.**

- Multiplication by `λ` on O is injective but has nonsaturated image and zero residual map.
- The assertion needs both source and target free; rational injectivity alone is insufficient.

In [Suggested.lean](Suggested.lean): `residual_injectivity_saturation`.

(Source: [MS19](#references) Theorem 6.5, p.34, and §2.10, p.10 (The residual theorem is intended for integral localized modules; the equivalence here is the separate DVR algebra needed to deduce saturation))

*Needs:* Mathlib `IsDiscreteValuationRing`, `Module.free_of_finite_type_torsion_free'`.

### R18.4.18 Auxiliary unipotent prime

**Theorem** (`auxiliaryUnipotentPrime`). Suppose `l>2, ρ̄:G_F→GL₂(k)` is absolutely irreducible with finite image whose order is divisible by l. Outside any prescribed finite set there is a split good prime q with `Nq≡1 mod l` and `ρ̄(Frob_q)` conjugate to a nonidentity unipotent matrix. This auxiliary prime is distinct from the Taylor–Wiles primes with distinct residual eigenvalues.

F totally real; k a finite field of characteristic l; extend k to contain the matrix entries.

The excluded set contains l, the discriminant, all level and coefficient-action primes, and the intended degeneracy prime w.

*Proof route.* Cauchy’s theorem gives an element of order l in the residual image; in dimension two it is a nonidentity unipotent, conjugate to `J=(1,1;0,1)`. In a finite extension containing the splitting field and `F(ζ_l)`, lift this element to `σ₀` and take `σ=σ₀^(1−l)`. Its residual matrix remains J and its cyclotomic character becomes one. Apply number-field Chebotarev to this conjugacy class. Inverting Frobenius changes to a conjugate nonidentity unipotent and leaves `Nq≡1` intact.

**Checks.**

- Requiring two distinct residual eigenvalues at this q would contradict its role.
- For an exceptional residual image this argument does not produce q.

(Source: [MS19](#references) Lemma 6.9 and proof, pp.35–36 (Chebotarev jointly prescribes a unipotent residual element and trivial residual cyclotomic value))

*Needs:* [R18.4.7 Hecke action on quaternionic connected components](#r1847-hecke-action-on-quaternionic-connected-components); Tau Ceti roadmap [Chebotarev, layer 10 dirichlet density chebotarev](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev).

### R18.4.19 Local deformation models for quaternionic Ihara

**Construction** (`iharaLocalDeformationModels`). For the auxiliary q, residual unramified J and fixed determinant `θ=ψε⁻¹`, choose `O=W(k)[ζ+ζ⁻¹]` with `ζ a` primitive lth root and `π=(ζ−ζ⁻¹)²`. The q-local fixed-determinant quotients are `R_ps=O[[X,Y₁,P,R]]/(X²Y₁−π), R_unip=O[[X,Y₂,P,R]]/(XY₂), R_nr=R_unip/(X)` and `R_N=R_unip/(Y₂)`. Their residual coordinates identify `Y₁=Y₂=Y`, with `k[[X,Y,P,R]]/(X²Y)→k[[X,Y,P,R]]/(XY)`. At v|l use `R_v`, the reduced O-flat quotient of the framed ring with determinant `θ` whose characteristic-zero points are the lifts that become semistable over the specified finite extension `L′/F_v` with parallel Hodge–Tate weights {0,1}. Spec `R_v` is equidimensional of relative dimension `3+[F_v:ℚ_l]` over O, that is, of Krull dimension `4+[F_v:ℚ_l]`. At v∤l the unrestricted fixed-determinant framed rings are O-flat of relative dimension 3.

l>2; at q the finite-order `ψ` is unramified and `det ρ̄=ψε⁻¹ mod π`.

O has the stated minimal ramification during the regular-model flatness argument. Unrestricted coefficient enlargement is made only after the argument by faithful flatness.

At v|l choose L′ making the finite set of local Weil–Deligne types with the prescribed `K_v⁰` invariants semistable and trivializing `ψ` there.

*Construction.* Apply the generic framed representability target, using local finite Galois cohomology for the finiteness hypothesis, then impose determinant `θ`. At q impose the inertia characteristic polynomials and the unipotent level-raising relation of MS §3.3. In its coordinates eliminate the determinant variable `δ`. Propositions 3.5–3.7 give the four-variable presentations and the common residual coordinate. `R_ps` is regular because its defining equation has uniformizer term; `R_nr` and `R_N` are formal power-series rings.

At v|l the quotient is constructed from Kisin's theorem, not from a predicate on points.

- Let E be the fraction field of `O`, `R^□` the framed lifting ring of `ρ̄|_{G_{F_v}}` over O, and `A=R^□[1/l]`. For each inertial type `τ` trivial on `I_{L′}` and the Hodge type `v₀` of parallel weights {0,1}, Kisin's Theorem (2.7.6) gives a quotient `A^{τ,v₀}` of A characterized on all finite E-algebras B: a map `A→B` factors through `A^{τ,v₀}` exactly when the specialized representation is potentially semistable of type `τ` and Hodge type `v₀`. Let `A^{L′-st}` be the union of these quotients over the finitely many such `τ`; this is Kisin's quotient for semistability over L′ with weights in [0,1].
- Put `R^{□,L′-st}=R^□/𝔞`, where 𝔞 is the kernel of `R^□→(A^{L′-st})_red`. It is O-flat, being a subring of a `ℚ_l`-algebra, and reduced, being a subring of a reduced ring.
- Its points in finite extensions of E are exactly the lifts that are semistable over L′ with weights {0,1}: Kisin's characterization at fields, together with the Jacobson property of A.
- Imposing determinant `θ` gives `R_v`. Because l>2, the framed ring is the completed tensor product of the fixed-determinant ring and the deformation ring of `det ρ̄` (MS (1)). At a point semistable over L′ with weights {0,1}, the determinant differs from `θ` by a residually trivial character that is unramified on `G_{L′}`. Its unique square root deforming the trivial character has the same property, so twisting identifies `R^{□,L′-st}` with `R_v` completed-tensored with the deformation ring of such characters. The generic fibre of that ring has dimension one: unramified twists, together with finitely many finite-order characters of the inertia of `F_v` that are trivial on the inertia of L′.
- Dimension: Kisin's Theorem (3.3.4) makes `Spec A^{τ,v₀}` equidimensional of dimension `d²+dim_E(ad D/Fil⁰ad D)=4+[F_v:ℚ_l]` for `d=2` and weights {0,1}, with a dense formally smooth open subscheme. Fixing `θ` removes this one-dimensional factor, so the generic fibre of `R_v` has dimension `3+[F_v:ℚ_l]`. A complete local O-flat domain has Krull dimension one more than its generic fibre, which gives Krull dimension `4+[F_v:ℚ_l]` on every component of `R_v`.

Its API:

- `local_q_specialise`: Reduction of `R_ps` maps onto `R_unip` modulo `π` with the same X,Y and smooth coordinates.
- `local_q_branches`: `R_nr=R_unip/(X)` and `R_N=R_unip/(Y)`, with these branch labels fixed.
- `local_q_regular`: `R_ps` is regular over the specified O; `R_nr` and `R_N` are formally smooth over O.
- `local_l_pointCriterion`: A map from `R^□` to a finite extension of E factors through `R_v` exactly when the lift has determinant `θ` and becomes semistable with weights {0,1} over L′; `R_v` is reduced, O-flat, and the closure of these points.
- `local_q_lift`: Continuous local O-algebra maps from `R_ps` to a complete separated local O-algebra B correspond to choices of `X,Y₁,P,R` in `m_B` satisfying `X²Y₁=π`; the analogous `R_unip` maps satisfy `XY₂=0`. Evaluation on these coordinates determines the map uniquely.
- `local_framed_universal`: The unrestricted framed `fixed-θ` ring represents continuous lifts in the chosen frame, naturally in Artinian O-algebras.
- `local_l_dimension`: Spec `R_v` is equidimensional of relative dimension `3+[F_v:ℚ_l]` over O, and its generic fibre has a dense formally smooth open subscheme.
- `local_branch_quotient`: The unramified and N branch projections kill X and `Y₂` respectively, with their quotient universal properties; all smooth framing parameters survive these maps.

**Checks.**

- `local_q_thickening`: Modulo `π`, the class XY is nonzero in k[[X,Y]]/(X²Y) but zero in k[[X,Y]]/(XY).
- `local_q_branch`: In the unramified branch `X=0` while Y remains a free coordinate; swapping the labels fails.
- `local_q_determinant`: The fixed-determinant q presentation has four variables; adjoining a free determinant coordinate changes its dimension.
- `local_l_dimensionCount`: For `F_v=ℚ_l, R_v` has Krull dimension 5 and generic fibre of dimension 4; the framed quotient without the determinant condition has Krull dimension 6 and generic fibre of dimension `5=d²+[F_v:ℚ_l]`. A quotient whose count does not drop by one when `θ` is fixed has not removed the twisting factor.
- `local_l_typeExclusion`: A characteristic-zero lift with weights {0,1} whose Weil–Deligne type is nontrivial on the inertia of L′ is potentially semistable but not a point of `R_v`; a quotient defined by potential semistability alone would contain it. L′ is chosen so that the types of all `K_v⁰`-fixed representations are trivial on its inertia.

(Source: [MS19](#references) display (1) and §§3.1–3.3, Remark 3.4 and Propositions 3.5–3.7, pp.13–17, for the fixed-determinant conversion, the regular principal-series model and the nodal unipotent model; §3.2, p.14, and §3.6, pp.17–18, for the use of the l-adic quotient and the choice of L′. [Kis08](#references) Theorem (2.7.6), p.534, for the potentially semistable quotient of a given type and Hodge type; Corollary (2.6.2), p.532, and the theorem of the introduction, pp.513–514, for semistability over a given finite extension; §(3.3.3) and Theorem (3.3.4), p.540, for the framed ring, equidimensionality, the dimension formula and the dense formally smooth open.)

*Needs:* [R18.4.18 Auxiliary unipotent prime](#r18418-auxiliary-unipotent-prime); [ArithmeticGaloisDuality](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticGaloisDuality/README.md) `D7.4`; [LocalGaloisDeformationRings, §§1.1, 1.15–1.16](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalGaloisDeformationRings/README.md#11-the-local-framed-deformation-ring); [FiniteFlatGroupsAndIntegralPadicHodgeTheory, §§R07.3.0–R07.3.3, R07.4.13, R07.4.27–R07.4.28](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#r0730-finite-k-comparison-of-period-rings-and-realizations).

### R18.4.20 Finite-level Taylor–Wiles prime datum

The following three targets use the same totally real F, odd prime l, residual representation, fixed determinant and local conditions as the selection theorem below. The two image assumptions are absolute irreducibility over `F(ζ_l)` and the stated exceptional `l=5` exclusion; l may ramify in F.

**Theorem** (`msDetectingElement`). For each `n≥1` and each nonzero class in the adjoint dual Selmer group, construct a Frobenius conjugacy class outside S, trivial on `F(ζ_{lⁿ})`, whose residual representation has distinct eigenvalues and whose localization detects that class. Prove the detecting-element assertion using the image hypotheses, then apply Chebotarev to obtain arbitrarily many such primes.

**Checks.**

- A detected class has nonzero localization.
- A scalar Frobenius cannot replace the distinct-eigenvalue class.
- Ramification of l in F is allowed.

(Source: [MS19](#references) §4.2, Lemma 4.10, pp.22–24, and its reference to Kisin Proposition 3.2.5 for the detecting argument.)

**Theorem** (`msDualSelmerKilling`). Successively choose detecting primes for a class in the current common localization kernel until it vanishes. Pad to a fixed cardinal r with distinct primes having the same congruence and eigenvalue conditions. Export sets `Q_n` disjoint from S with zero modified adjoint dual Selmer group, chosen residual eigenvalues, and `Nv≡1 mod lⁿ`.

**Checks.**

- Zero initial dual Selmer still permits padding.
- Repeatedly detecting one already killed class does not kill an independent class.
- No prime in `Q_n` is the repeated-eigenvalue auxiliary q.

(Source: [MS19](#references) §4.2, Lemma 4.10, pp.22–24.)

**Theorem** (`msGeneratorCount`). For these `Q_n` and the local models of §R18.4.19, compute the fixed-determinant global tangent and obstruction dimensions by the Selmer localization sequence and global duality. Construct uniform presentations with g variables and prove `dim R_loc=r+j−g+1`, where `j=4|Σ|−1`; adjoining the g variables gives dimension `r+j+1`. This is the numerical calculation for the same framed and unframed determinant θ.

**Checks.**

- Framing adds j parameters.
- Changing the determinant functor changes the count.
- The regular and nodal q-models have the dimensions of §R18.4.19 even when l ramifies in F.

(Source: [MS19](#references) §4.2, Lemma 4.10, pp.22–24.)

**Theorem** (`taylorWilesPrimeDatum`). For the large-image residual representation and exceptional `l=5` condition of [R18.4.32 Large-image residual Ihara lemma](#r18432-large-image-residual-ihara-lemma), fix finite S and local conditions as above. With `Σ` the framed finite places, `j=4|Σ|−1`, there exist integers r,g and sets `Q_n` outside `S, |Q_n|=r`, with `Nv≡1 mod lⁿ` and two distinct residual Frobenius eigenvalues at `v∈Q_n`. Choose one eigenvalue at each v. The framed fixed-determinant global ring `R_(S∪Q_n)^□,θ` admits a surjection `R_loc[[x₁,…,x_g]]→R_(S∪Q_n)^□,θ`. The unframed ring represents strict-equivalence deformations with the same determinant `θ`, and framing is formally smooth of relative dimension j. Set `R_∞=R_loc[[x₁,…,x_g]]` and `S_∞=O[[y₁,…,y_r,w₁,…,w_j]]`; `dim R_loc=r+j−g+1` and `dim R_∞=dim S_∞=r+j+1`.

`ρ̄|_(G_F(ζ_l))` absolutely irreducible; for `l=5` with projective image `PGL₂(F₅), ker` proj `ρ̄` is not contained in `G_F(ζ₅)`.

Finite-order `ψ` trivial on the central level, `θ=ψε⁻¹`, and exactly the same `θ` for framed and unframed functors.

The local deformation models and global ramification set satisfy MS §4.2, with `Σ` containing all l-adic places and auxiliary q.

*Proof route.* Use arithmetic Galois finiteness and generic representability to construct the global fixed-determinant strict and framed functors. Absolute irreducibility removes noncentral infinitesimal automorphisms, giving j frame parameters. The adjoint Selmer/dual Selmer calculation selects r Taylor–Wiles primes with chosen distinct eigenvalues and kills the dual Selmer obstruction. Construct the detecting-element and dual-Selmer-killing steps here as specified above, importing only Selmer structures. Apply the generic minimal-presentation and relation-bound algebra to obtain the uniform surjections and the displayed numerical dimension equality, as in MS Lemma 4.10.

**Checks.**

- The auxiliary q has repeated eigenvalues; `Q_n` has distinct eigenvalues and excludes q.
- A framed ring with determinant `θ` cannot map by forgetting frames to an unframed ring with determinant `ψ`.
- A totally real F ramified at l remains in scope; the selection uses `msDetectingElement`, `msDualSelmerKilling` and `msGeneratorCount` here rather than the unramified-field supplier.

(Source: [MS19](#references) §4.2 and Lemma 4.10, pp.22–24 (Taylor–Wiles primes, global framed presentations and matching numerical dimensions are available under these image hypotheses))

*Needs:* GlobalGaloisDeformations §§3.3–3.7; [R18.4.19 Local deformation models for quaternionic Ihara](#r18419-local-deformation-models-for-quaternionic-ihara); [ArithmeticGaloisDuality](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticGaloisDuality/README.md) `R02.4.4`; [LocalGaloisDeformationRings, §§1.1, 1.15–1.16](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LocalGaloisDeformationRings/README.md#11-the-local-framed-deformation-ring); [SelmerIwasawaCohomology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SelmerIwasawaCohomology/README.md) `Layer 2`.

### R18.4.21 Exact central-character localization

**Theorem** (`centralCharacterExactness`). Let `Γ_K=Z(A_f)/(Z(F)(K∩Z(A_f)))` act freely at the sufficiently small effective level, and let A be a finite local `ℤ_l`-algebra. Put `A∨=Hom_Z_l(A,ℚ_l/ℤ_l)`, with A acting by precomposition with multiplication. The modules `H¹(X_K,A∨)_m` and `H⁰(Y_K,A∨)_m` are injective `A[Γ_K]`-modules. Thus ψ-parts are exact on the particular cohomological sequences with these injective kernels, and Pontryagin duality gives the corresponding homological character quotients, with inverse characters under contragredient duality. This remains valid when l divides `|Γ_K|` and supplies the central-character steps in the patching filtration. The symbol `A∨` denotes the coefficient Pontryagin dual, not `Hom_A(A,A)` or an unspecified dual of H¹.

m non-Eisenstein; `ψ` compatible with the central level and coefficients.

Smallness makes the finite central quotient action free, not just an action of an ineffective center.

The definite clause uses the general-field definite theorem [R18.3.8 Definite Ihara lemma over an arbitrary totally real field](#r1838-definite-ihara-lemma-over-an-arbitrary-totally-real-field), rather than the restricted KW specialisation.

*Proof route.* Apply the finite-cover Hochschild–Serre sequence to the free central quotient action. Degrees zero and two vanish after non-Eisenstein localization. Apply the `Hom_{A[Γ_K]}(-,H¹(X_K,A∨)_m)` calculation in MS Lemma 2.5 to arbitrary finite `A[Γ_K]`-modules. Non-Eisenstein concentration makes this functor exact, proving injectivity. On the definite side the free finite orbits give a coinduced module with injective coefficient cogenerator `A∨`. Take ψ-parts only in the sequences to which this injectivity applies. Pontryagin duality converts them to the homological quotient sequences with the contragredient character. Use the finite central group algebra and the residual central-character block in the final Nakayama step.

**Checks.**

- A central quotient with l-torsion is allowed; the proof does not divide by its order.
- This statement concerns the localized arithmetic modules, not arbitrary `A[Γ_K]`-modules.
- For `A=k[x,y]/(x,y)²`, the socle of A has dimension two, so A is not self-injective. Its k-dual is an injective cogenerator. Replacing the coefficient Pontryagin dual by A would invalidate the general finite-algebra statement.

(Source: [MS19](#references) §1.4, p.7; §2.12 and Lemma 2.5, pp.10–11; end of proof of Theorem 6.5, p.38 (Central-character extraction is exact by injectivity, and the final character reduction is removed by Nakayama))

*Needs:* [R18.4.8 Residual Eisenstein vanishing](#r1848-residual-eisenstein-vanishing), [R18.3.8 Definite Ihara lemma over an arbitrary totally real field](#r1838-definite-ihara-lemma-over-an-arbitrary-totally-real-field); [ArithmeticLocallySymmetricSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md) `ALS.6.2`.

### R18.4.22 Auxiliary-prime integral types

**Construction** (`auxiliaryPrimeIntegralTypes`). Let `G_q=GL₂(k_q), B_q` its upper Borel, `q≡1 mod l, l>2` and O as in the local-model target. The permutation representation `Ind_(B_q)^(G_q)1` splits over O as `1⊕St_O`, where `St_O` is the sum-zero complement (q+1 is a unit). Choose a tame character `χ:k_q×→O[ζ]×` of exact order l. The characteristic-zero type `σ_ps=Ind(χ⊗χ⁻¹)` has an E-model by its Schur-index/descent result and an O-lattice with residual nonsplit sequence `0→1_k→σ_ps,k→St_k→0`. Fix this orientation of the lattice; the reverse extension is not interchangeable. Inflate all types through `GL₂(O_q)→G_q`.

The chosen E is the fraction field of `W(k)[ζ+ζ⁻¹]`; scalar extension to `E(ζ)` defines the inducing characters.

Prescribed central character is unramified at q, so its restriction to `GL₂(O_q)` matches the types.

*Construction.* Construct the permutation representation on `P¹(k_q)`; average only its q+1 basis coordinates, which is permissible since q+1 is a unit. Descend the self-inverse principal-series type from `E(ζ)` by its finite-group Schur-index theorem. Choose a lattice whose socle is `1_k` using the specified nonsplit-extension lattice theorem. Construct these two finite representation-theory comparisons here as part of the auxiliary-prime type target, using the smooth category supplied by SmoothRepresentationsOfLocalGroups SR.0. Reduce the chosen lattice; the order-l characters become trivial but the lattice reduction is the nonsplit extension, rather than a semisimple direct sum.

Its API:

- `type_iwahori_split`: `Ind_B^G 1=1⊕St_O` with its constant and sum-zero inclusions.
- `type_ps_reduction`: The specified lattice gives the exact nonsplit `0→1_k→σ_ps,k→St_k→0`.
- `type_inflate`: Inflation has trivial principal-congruence action and the prescribed unramified central restriction.
- `type_homothety`: Changing the selected lattice by homothety gives an isomorphic integral type and the same extension orientation.
- `type_iwahori_constructor`: Realize `Ind_B^G 1` as O-valued functions on `P¹(k_q)`, constants as the trivial summand and `St_O` as the kernel of the coordinate sum.
- `type_iwahori_mean`: Since `q+1∈O×`, the mean `(q+1)⁻¹Σ_x f(x)` is a G-equivariant retraction onto constants; its complement projects onto `St_O`. Both projections are idempotent and sum to the identity.
- `type_ps_socle`: The selected stable lattice in the E-model of `σ_ps` is characterized up to homothety by residual trivial socle; its quotient is `St_k` and the extension is nonsplit.

**Checks.**

- `type_q11_l5`: For `q=11,l=5` the dimensions are 1,11,12 and 12 is a unit in O.
- `type_ps_not_split`: The residual principal-series lattice has trivial socle and a nonsplit Steinberg quotient; replacing it by `1⊕St` fails.
- `type_l2_excluded`: For `l=2` and q odd, q+1 is not a unit; the splitting step is unavailable.

(Source: [MS19](#references) §3.5, equation (2), p.17 (The principal-series lattice has a residual extension with trivial submodule and Steinberg quotient; the permutation representation splits integrally); [EGS15](#references) Lemma 4.1.1 and proof, p.16 (An irreducible residually multiplicity-free representation has a unique lattice up to homothety with a prescribed simple socle or cosocle))

*Needs:* [R18.4.19 Local deformation models for quaternionic Ihara](#r18419-local-deformation-models-for-quaternionic-ihara); [SmoothRepresentationsOfLocalGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md) `SR.3`.

### R18.4.23 Supersingular cohomology filtration

**Theorem** (`supersingularCohomologyFiltration`). At the auxiliary q, the smooth proper hyperspecial integral model and regular Iwahori model have special fibre consisting of two copies of the hyperspecial curve meeting transversely at supersingular points. The supersingular set is Hecke-equivariantly identified with the definite quaternionic double-coset set for the inner form ramified at the original discriminant together with q and the split real place. After non-Eisenstein localization, `H¹(X_(K_0(q)),k)` has a functorial Hecke-module filtration with graded pieces `N, M⊕M, N`, where `M=H¹(X_K,k)` and `N=H⁰(Y_(K^q),k)`. The ψ-parts and dual homology filtration remain exact. This statement forgets Galois action; no unstated Tate twists are assigned to the graded pieces.

q∤l and outside level/discriminant; sufficiently small level and good integral models.

The auxiliary residual unipotent Frobenius and non-Eisenstein ideal satisfy the hypotheses of the specialization filtration.

*Proof route.* Specialize the regular-model tower at the new split q. The two components and finite étale/supersingular correspondence are MS Theorems 2.6 and 2.10. Identify the definite supersingular function module using the general-field definite theorem [R18.3.8 Definite Ihara lemma over an arbitrary totally real field](#r1838-definite-ihara-lemma-over-an-arbitrary-totally-real-field); the restricted KW coefficient specialisation is insufficient. Use the normalization and vanishing-cycle exact sequences and the degree-zero/degree-two vanishings to identify the remaining degree-one filtration. The proper curve specialization and nodal vanishing-cycle sequence are imported from LefschetzPencilsAndVanishingCycles §§7a.1–7a.2. Use [R18.4.21 Exact central-character localization](#r18421-exact-central-character-localization) and finite-dimensional duality to transfer the filtration to the actual homological modules with transition and degeneracy maps.

**Checks.**

- The definite inner form exchanges two places, maintaining the parity of the quaternion ramification set.
- The filtration is a Hecke-module assertion, not an identification of the two copies of N as Galois representations.
- Without the localized H⁰ and H² vanishings, extra normalization and specialization terms remain; the three displayed graded pieces alone do not describe the cohomology.

(Source: [MS19](#references) Theorems 2.6, 2.10 and 2.11, pp.11–13 (Good and Iwahori models, supersingular identification and the N,M²,N filtration supply the geometric transfer))

*Needs:* [R18.2.8 Regular quaternionic model tower](#r1828-regular-quaternionic-model-tower), [R18.2.6 Carayol split-place integral model](#r1826-carayol-split-place-integral-model), [R18.4.18 Auxiliary unipotent prime](#r18418-auxiliary-unipotent-prime), [R18.4.8 Residual Eisenstein vanishing](#r1848-residual-eisenstein-vanishing), [R18.4.21 Exact central-character localization](#r18421-exact-central-character-localization), [R18.3.8 Definite Ihara lemma over an arbitrary totally real field](#r1838-definite-ihara-lemma-over-an-arbitrary-totally-real-field); [LefschetzPencilsAndVanishingCycles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md) `§7a.1`, `§7a.2`, `§7a.1`.

### R18.4.24 Early quaternionic Jacquet–Langlands bridge

**Theorem** (`quaternionicJacquetLanglandsBridge`). Let F be totally real, B/F split at exactly the real place τ and split at the finite place q, and D/F obtained by exchanging the invariants at τ and q. Fix compatible central character, cohomological weights and away-from-q levels, q-Iwahori level on B and maximal division level on D. Consume the global correspondence, local compatibility, split-place Hecke matching, multiplicity one and rational-model conditions from GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.3.3, R17.3.5–R17.3.9. On the non-norm cuspidal part, the common finite-level characteristic-zero eigensystems are exactly those whose GL₂ component at q is discrete series and has the specified level invariants. Compare the corresponding automorphic multiplicity spaces over an actual common field E of definition; this does not identify all H¹ with all H⁰ or identify integral lattices.

Let A be the common spherical Hecke algebra away from q and the other bad places. For the matched modules, write `I_B` and `I_D` for the kernels of its indefinite and definite actions. Then `I_B⊂I_D`, so the definite Hecke image is a quotient of the indefinite image. The same inclusion holds for the integral images when both modules are finite torsion-free over the coefficient DVR O and their generic fibres are the matched E-realizations. Localize away from the norm-character/Eisenstein part, as in MS Lemma 4.12.

An actual common E-model, after the coefficient enlargement allowed by §R17.3.8, is required. Rationality-field equality alone supplies no such model. The finite-level indefinite cohomological and definite form realizations and their coefficient duals are those of §§R18.4.2 and R18.3.3.

The cohomological realization retains §R18.4.12's non-finite coefficient input over O and the characteristic-zero coefficient fields used; definite form modules themselves need no topological comparison.

*Proof route.* Apply the supplied global transfer to B and D with their fixed local identifications. Match the local invariant spaces at τ and q and the finite-level eigensystems away from the bad set. Use the supplied multiplicity and E-model comparisons to obtain `I_B⊂I_D` after tensoring with E. For an integral element in `I_B`, its action on the definite module vanishes over E and hence already over O by torsion-freeness. This proves the required quotient of integral Hecke images.

**Checks.**

- For `F=ℚ`, B of discriminant 6 is split at `q=5`; exchanging 5 and ∞ gives a definite D of finite discriminant 30. The comparison uses 5-Iwahori level on B and maximal division level on D, with matching levels elsewhere.
- A principal-series `π_q` contributes no q-division definite eigensystem; a Steinberg twist has a division-character partner when its maximal-level invariants are nonzero.
- A rank-two Galois factor in H¹ prevents an unqualified `H⁰≅H¹` statement.
- If an integral endomorphism becomes zero over E, torsion-freeness makes it zero over O; on `O/ϖ` this implication fails, since tensoring with E kills the whole module.

(Source: [BR10](#references) §1.5, pp.5–6, Theorem 18.1, pp.44–45, for the supplied correspondence; [MS19](#references) Lemma 4.12 and proof, p.25, for the finite-level Hecke-kernel inclusion and torsion-free descent.)

*Needs:* [R18.4.2 Quaternionic finite-level cohomology](#r1842-quaternionic-finite-level-cohomology), [R18.3.3 Fixed-central-character algebraic forms](#r1833-fixed-central-character-algebraic-forms); [GL2AutomorphicRepresentationsAndTransfer](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md) `§§R17.3.1, R17.3.3, R17.3.5–R17.3.9`, `§R16.6.3`.

### R18.4.24a Quaternionic geometric semistable comparison

**Comparison** (`quaternionCurveSemistableComparison`). Specialize the geometric semistable-period comparison of WeightsInEtaleCohomology R34.3 to a proper regular strictly semistable model `𝒳/O_L` of a smooth proper quaternionic curve, with `L/ℚ_p` finite and a fixed finite coefficient field `E/ℚ_p`. Identify `D_st(H¹_et(𝒳_L̄,E))` with the coefficient-extended Hyodo–Kato realization and its de Rham filtration after extension to L. Put `e_L=v_L(p)` with `v_L(π)=1`: period monodromy is `N_p=N_HK/e_L`, not the raw HK operator. Retain Frobenius on the full coefficient algebra, Galois/Weil descent, pullback, pushforward and algebraic correspondences through their declared coefficient embeddings.

For a proper strictly semistable auxiliary Kuga model with the Saito correspondence supplied by R34.3, restrict the comparison to its cohomological projector image, retaining duals and Tate twists. Its existence and model hypotheses are required independently of the Galois realization. Over a finite extension of the completed maximal unramified field, use the supplier's separate verified finite-local descent contract rather than treating that field as finite over `ℚ_p`.

**Checks.**

- At good smooth reduction `N=0` and the comparison is crystalline.
- For a split Tate curve `E_π` over ramified L, raw `N_HK` has coefficient 1 and `N_p` coefficient `1/e_L` in the valuation basis.
- Under ramified base change of index d, both raw `N_HK` and `e_L` multiply by d; `N_p` and its descent remain unchanged.
- A cohomological projector need not be an idempotent in the algebraic correspondence ring.

(Source: [Sai09](#references) §§7–8, pp.32–36; WeightsInEtaleCohomology R34.3, ‘Saito’s semistable model and period comparison’ and ‘the geometric semistable-period comparison’, with its normalization `N_HK=e_LN_p`.)

*Needs:* WeightsInEtaleCohomology R34.3 (geometric semistable-period comparison, Saito model and coefficient projector); [R18.4.2 Quaternionic finite-level cohomology](#r1842-quaternionic-finite-level-cohomology).

### R18.4.24b Quaternionic central torus comparison

**Comparison** (`quaternionicCentralTorusComparison`). Let `G_B=Res_{F/ℚ}B×` with the compact quaternionic datum and coefficients satisfying §R18.4.1. Use ALS's maximal ℚ-split centre A∞, balanced central character and all real components. Write `Y_K` for its quotient with full K∞ and `Y_K°` for the connected-compact cover obtained by replacing K∞ with K∞°. Retain the action of `C∞=K∞/K∞°`; full-K∞ relative cohomology is the C∞-invariant part of the connected-compact cohomology. Construct the projection `Y_K°→X_K(ℂ)` by quotienting the remaining positive real centre `T∞=(ℝ_{>0})^Σ/A∞`. In logarithmic coordinates put `V∞=ℝ^Σ/ℝ(1,…,1)` and `Λ_K=log|Γ_g∩F×|`. The fibre is the compact torus `Λ_K\V∞`, of dimension `[F:ℚ]−1`. Rational scalar triviality makes the coefficient system a pullback from the curve. Prove that pullback identifies degree-one cohomology on the non-norm cuspidal summand and commutes with level pullback. For `K′⊂K`, write `δ=[Λ_K:Λ_K′]`; then `tr_Y∘p_K′*=δ·p_K*∘tr_X`. Thus dividing the arithmetic trace by δ identifies it with curve trace. Hecke intersection levels have unchanged central lattice, so their δ is one and the unnormalized Hecke actions agree. Keep the balanced central character and norm-character summands explicit.

Assume `TopologicalCoefficientInput(ℂ)` on both arithmetic quotients, the curve, their coefficient systems, central-torus projection and all level and trace maps. This is the non-finite sheaf/singular input of §R18.4.12; the supplied finite coefficient comparison alone does not identify these complex cochains.

*Construction.* Compute the homogeneous spaces using the fixed real splittings: `Y_K°` has the two-sign curve domain together with the positive central directions modulo A∞. Construct the finite-cover adapter at the relative-cochain level, with the C∞ action retained. Use the supplier's connected-compact K′∞ formulation in AutomorphicSpectralTheory §5.14 before taking finite component-group invariants; an isomorphism on invariant cohomology alone does not recover the cover. Scalar units at finite level have finite index in `O_F×`, so Dirichlet's unit lattice makes each fibre compact. Identify its cohomology with the exterior algebra on the dual of its logarithmic lattice. In the fibre-cohomology spectral sequence the extra degree-one terms come from degree-zero curve coefficients. On a non-norm cuspidal summand those degree-zero terms vanish: invariants under the derived group contribute only norm characters. The edge map is therefore an isomorphism in degree one on that summand. Transport the complex orientation and covering degrees. The finite isogeny on central fibres contributes δ to trace; this accounts for the stated normalization and its composition law.

**Checks.**

- For `F=ℚ`, T∞ is trivial and the connected-compact arithmetic cover has the curve domain. The full-K∞ quotient still takes C∞ invariants and must not identify the two orientations prematurely.
- For real quadratic F, the ALS symmetric space has real dimension three and the connected-compact cover has a circle fibre over the curve; quotienting only A∞ does not give the curve domain.
- With constant coefficients a connected fibre has nonzero H¹ when `[F:ℚ]>1`; the norm-character contribution cannot be removed from the full cohomology by declaring pullback an isomorphism.
- The coefficient line `σ∘Nrd` of §R18.4.1 fails scalar descent and is excluded from this pullback comparison.
- A degree-two cover of the central circle multiplies arithmetic trace by two; the curve trace is recovered only after the δ factor is removed.

(Source: ArithmeticLocallySymmetricSpaces, Conventions and ALS.5b.1, for the quotient, connected-compact cover and de Rham complex; AutomorphicSpectralTheory §5.14, K′∞ and component-group transport; [Car86](#references), §1, pp.154–156, for the two-sign quaternionic domain and central quotient; Mathlib `NumberField.Units.instZLattice_unitLattice` and `NumberField.Units.dirichletUnitTheorem.unitLattice_span_eq_top` for the full logarithmic unit lattice.)

*Needs:* [R18.4.1 Quaternionic algebraic local systems](#r1841-quaternionic-algebraic-local-systems); ArithmeticLocallySymmetricSpaces ALS.1, ALS.5b.1, ALS.F.5–ALS.F.7; AutomorphicSpectralTheory §5.14; AdelicAlgebraicGroups §3.4; Mathlib `NumberField.Units.instZLattice_unitLattice`.

### R18.4.25a Compact quaternionic automorphic comparison input

**Theorem** (`quaternionicCompactFrankeInput`). Specialize AutomorphicSpectralTheory §5.14 (`franke_input`, from §§5.10 and 5.12) to `G_B`, neat K and the finite-dimensional complex algebraic W satisfying §R18.4.1, summand by summand when W is reducible. Retain the supplier's ℚ-split-centre quotient, balanced central character, full K∞ and all real components. Use the connected-compact relative-cochain adapter and central-torus comparison of §R18.4.24b to transport its Hecke and level compatibility to the non-norm cuspidal degree-one curve realization; take C∞ invariants only when returning to the full-K∞ quotient.

Assume `TopologicalCoefficientInput(ℂ)` on the connected-compact quotient and curve with the systems and maps of §R18.4.24b. This hypothesis is separate from the supplied Franke input.

*Proof route.* Apply the supplied Franke theorem and ALS.5b.4 on `Y_K` with exactly these conventions. Since `G_B` is anisotropic modulo its centre, there are no proper rational parabolics and its cuspidal-support decomposition has only the `G_B` summand. Norm characters are still present in that summand and are separated when passing to the curve's non-norm degree-one contribution. Use §R18.4.24b's connected-compact cochain comparison, edge isomorphism, coefficient descent and trace normalization to identify the curve contribution, retaining C∞ throughout. No equality of the full arithmetic quotient with the Shimura curve is used.

**Checks.**

- For constant weight-two coefficients the non-norm degree-one comparison selects the two weight-two discrete-series orientations at the split real place.
- There is no proper-parabolic Eisenstein summand for `G_B`, but norm characters remain distinct from non-norm cuspidal representations.
- For real quadratic F, first remove the circle fibre of §R18.4.24b before identifying the curve contribution.
- An open modular curve with at least two cusps has boundary classes and lies outside this compact specialization.

(Source: AutomorphicSpectralTheory §§5.10, 5.12, 5.14 (`franke_input`); ArithmeticLocallySymmetricSpaces ALS.5b.4; [CDN20](#references) §5.2.1, Proposition 5.2, pp.41–42, for the quaternionic cohomological specialization.)

*Needs:* AutomorphicSpectralTheory §§5.10, 5.12, 5.14; ArithmeticLocallySymmetricSpaces ALS.5b.1, ALS.5b.4, ALS.F.5–ALS.F.7; [R18.4.24b Quaternionic central torus comparison](#r18424b-quaternionic-central-torus-comparison); [R18.4.1 Quaternionic algebraic local systems](#r1841-quaternionic-algebraic-local-systems).

### R18.4.25 Cohomological automorphic eigenspaces

**Comparison** (`CohomologicalEigenspaces`). Over a splitting characteristic-zero field, identify the cuspidal Hecke eigenspaces of the algebraic coefficient H¹ of `X_U` with the automorphic representations cohomological at the split real place and of the specified algebraic type at the other real places. For trivial coefficients the split real component has weight-two discrete series. Galois action on the multiplicity space is retained, but identifying it with a two-dimensional `ρ_π` and proving local–global compatibility are additional Galois representation and local compatibility theorems. The characteristic-zero comparison uses `quaternionicCompactFrankeInput` (§R18.4.25a) and ArithmeticLocallySymmetricSpaces ALS.5b.4, the discrete spectrum of AutomorphicSpectralTheory Layer 4, actual common E-models from GL2AutomorphicRepresentationsAndTransfer §R16.6.3 and the early Jacquet–Langlands bridge of this layer; it does not depend on the early Galois target or on Taylor–Wiles control. Supply the automorphic/cohomological isotypic comparison and its Galois multiplicity factor. The early rank-two Galois identification is owned by [R18.3.29 Early rank-two eigensystem realisation and local compatibility](#r18329-early-rank-two-eigensystem-realisation-and-local-compatibility); it is not taken from AutomorphicGaloisRepresentations and is not a claim that all isotypic H¹ has rank two.

O is the ring of integers of a finite extension of `ℚ_l`, and the algebraic coefficient lattice is U-stable with a specified central character, trivial on each rational scalar stabilizer, and has finite reductions descending through the effective central kernel as in §R18.4.1; an integral coefficient pairing is required where duality is used. Characteristic zero; actual coefficient-field models; the specialized compact Matsushima input of §R18.4.25a, the central-torus comparison of §R18.4.24b and imported strong multiplicity one.

Assume the `TopologicalCoefficientInput` hypotheses of §§R18.4.12, R18.4.24b and R18.4.25a over the characteristic-zero rings used in the Betti, sheaf and automorphic realizations. Integral-to-ordinary Betti identifications also retain `TopologicalCoefficientInput(O)` and the completion comparison of §R18.4.12.

*Proof route.* Compute the degree-one relative Lie algebra cohomology at the split real place. Apply `quaternionicCompactFrankeInput` (§R18.4.25a), ALS.5b.4 with the connected-compact adapter and the non-norm degree-one isomorphism `quaternionicCentralTorusComparison` (§R18.4.24b), with the discrete spectrum of AutomorphicSpectralTheory Layer 4 and actual common E-models from GL2AutomorphicRepresentationsAndTransfer §R16.6.3. Apply [R18.4.24 Early quaternionic Jacquet–Langlands bridge](#r18424-early-quaternionic-jacquetlanglands-bridge) and the transfer targets [R18.3.21 Degree-two global inner-form spectral transfer](#r18321-degree-two-global-inner-form-spectral-transfer), [R18.3.20 Real weight and dual convention in quaternion transfer](#r18320-real-weight-and-dual-convention-in-quaternion-transfer) with exact infinity types. The Galois identification is the separate target [R18.3.29 Early rank-two eigensystem realisation and local compatibility](#r18329-early-rank-two-eigensystem-realisation-and-local-compatibility).

**Checks.**

- Constant weight-two coefficients select weight-two discrete series at the split real place.
- A two-dimensional automorphic level-invariant factor with a rank-two Galois multiplicity factor gives four-dimensional isotypic H¹.
- The compact comparison uses the supplier specialization of §R18.4.25a and the central-torus comparison of §R18.4.24b; for real quadratic F the intervening ALS space has a circle fibre.
- For `F=ℚ`, B of discriminant 6 and `q=5`, the early definite bridge uses D of finite discriminant 30, with 5-Iwahori level on B and maximal division level on D; it requires no even-degree hypothesis.

(Source: [CDN20](#references) §5.2.1, pp.41–42, Proposition 5.2.)

*Needs:* `quaternionicCompactFrankeInput` (§R18.4.25a), `quaternionicCentralTorusComparison` (§R18.4.24b); [R18.4.2 Quaternionic finite-level cohomology](#r1842-quaternionic-finite-level-cohomology), [R18.3.21 Degree-two global inner-form spectral transfer](#r18321-degree-two-global-inner-form-spectral-transfer), [R18.3.20 Real weight and dual convention in quaternion transfer](#r18320-real-weight-and-dual-convention-in-quaternion-transfer), [R18.3.22 Definite Jacquet–Langlands realization](#r18322-definite-jacquetlanglands-realization), [R18.4.24 Early quaternionic Jacquet–Langlands bridge](#r18424-early-quaternionic-jacquetlanglands-bridge); [ArithmeticLocallySymmetricSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md) `ALS.5a–ALS.5b`; [GL2AutomorphicRepresentationsAndTransfer, §§R16.2.13, R16.4.5, R16.6.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md#r1663-hilbert-cohomological-algebraic-weights); [AutomorphicSpectralTheory, §§4.5–4.7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AutomorphicSpectralTheory/README.md#45-finite-multiplicity-in-the-discrete-spectrum).

### R18.3.29 Early rank-two eigensystem realisation and local compatibility

**Theorem** (`quaternionEigenformGaloisCompatibility`). Let F be any totally real field and π a cuspidal automorphic representation of `GL₂(𝔸_F)` of parallel weight `k≥2`, with an actual coefficient-field model. Its eigenpacket f is given either by a non-norm eigenform in `S_{k,ψ}(U,O)_m` through §§R18.3.21–R18.3.22 or by `CohomologicalEigenspaces` on the compact quaternionic curve. Let ψ be its arithmetic central character, including the algebraic weight factor, and retain the acting maximal ideal m wherever a residual assertion is made. In the definite realization, `π_v` is discrete series at every finite v where D ramifies. Say that `π` satisfies Carayol's hypothesis (C) if `[F:ℚ]` is odd or `π_w` is discrete series at some finite place w. For `[F:ℚ]>1` under (C), use the rank-two multiplicity and source-qualified local compatibility supplied by WeightsInEtaleCohomology R34.6; retain its auxiliary-place quadratic base-change reduction where used. This theorem transports that representation and extends it to the Taylor/Kisin and degree-one cases below. After a finite extension of coefficients there is a continuous `ρ_f:G_F→GL₂(O′)` with a stable O′-lattice satisfying (a)–(c).

- (a) **Existence and unramified places.** At every finite v∤p outside the level of `f, ρ_f` is unramified and `ρ_f(Frob_v)` has characteristic polynomial `X²−T_v(f)X+q_vS_v(f)`, with `Frob_v` arithmetic. This holds for every such f: by Carayol's Theorem A when (C) holds, and by Taylor's Theorem 2 when `[F:ℚ]` is even.
- (b) **Finite places v∤p, under (C).** The Frobenius-semisimplified Weil–Deligne representation of `ρ_f|_{G_v}` corresponds to `π_v` under the normalization fixed below. Hypothesis (C) holds automatically whenever `π` is discrete series at some finite place, for instance when D ramifies at a finite place or when `π_v` is a twist of the Steinberg representation. If `π_v` is the Steinberg representation twisted by an unramified character, then `ρ_f|_{G_v}` is an extension of `γ` by `ε_pγ` for an unramified character `γ` with `γ²=ψ_v`.
- (c) **Places v|p.** If the residual representation of m is absolutely irreducible, then `ρ_f|_{G_v}` is potentially semistable with parallel Hodge–Tate weights `{0,1−k}`, and its Frobenius-semisimplified Weil–Deligne representation corresponds to `π_v`. When (C) holds the same is true without the residual hypothesis. In particular, in the definite realization, if `k=2`, `D_v` is division, and `U_v=O_{D_v}×` with trivial local coefficient action (or `U_v=D_v×` with the specified central-compatible unramified coefficient character), then `π_v` is an unramified Steinberg twist and `ρ_f|_{G_v}` is semistable and is an extension of `γ` by `ε_pγ` with `γ` unramified and `γ²=ψ_v`. This is the case used by KW Lemma 7.2.

Not asserted: local compatibility at a place v∤p where `π_v` is not discrete series, when `[F:ℚ]` is even and `π` has no finite discrete-series component. No target of this roadmap uses it. The Steinberg exclusion (§§R18.3.30–R18.3.31) concerns places where `π_v` is a Steinberg twist, and the sign target (§R18.3.32) concerns places where D ramifies; in both cases (C) holds.

**Normalization.** Carayol, Taylor, Saito, Kisin, MS and EGS state the attached representation `ρ_π` with geometric Frobenius. In that convention `ρ_π(Frob_v^{geom})` has characteristic polynomial `X²−t_vX+N(v)s_v`, and Carayol's Hecke correspondence `σ(π_v)` is the contragredient of the Langlands parameter twisted by `|·|^{1/2}`, with `det σ(π_v)=χ_{π_v}⁻¹ω_v⁻¹`. The arithmetic convention of KW and of this layer is the contragredient `ρ_f=ρ_π^∨`. In the filtration-index convention fixed above, `ρ_π` has parallel Hodge–Tate weights `{0,k−1}` and `ρ_f` has `{0,1−k}`. The labelled weights in the finite-flat supplier are their negatives; this sign conversion does not change either representation or its filtration. Then `ρ_f(Frob_v^{arith})` is the transpose of `ρ_π(Frob_v^{geom})`, so the characteristic polynomial is unchanged, and `det ρ_f=(det ρ_π)⁻¹=ε_pψ`. Here `ψ` is attached to the central character by arithmetic reciprocity; the same idèle character attached by geometric reciprocity gives the inverse Galois character, which is the `ψ` of `det ρ_π=ψε_p⁻¹` in MS and EGS.

The stable lattice has the residual eigensystem under discussion. Realizing an arbitrary residual polynomial system as an acting eigensystem is not asserted.

The route through `CohomologicalEigenspaces` retains its `TopologicalCoefficientInput` hypotheses and §R18.4.12's integral completion comparison wherever an ordinary nonconstant Betti realization is used.

*Proof route.*

- (a) In the definite realization transfer f to π; in the curve realization use its supplied cuspidal eigenpacket. For degree greater than one under (C), import R34.6's cohomological decomposition and actual coefficient-field models, and identify its rank-two Galois multiplicity with the one in this curve realization through the matching finite-part model, coefficient sheaf/dual and Hecke actions. In parallel weight k take `k_i=w=k` in that supplier's general multiweight interface. Do not construct a second Carayol multiplicity. Outside (C) use Taylor's congruence construction. In degree one use Carayol's compact quaternionic construction or the classical parabolic realization of ModularCurvesPartII §§14.1–14.4a and AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2 as appropriate. Take the contragredient, then choose the stable lattice for the acting residual eigensystem.
- (b) On the shared degree-greater-than-one range, transport R34.6's Carayol/Saito local parameter through its local-Langlands normalization bridge, then take the contragredient as above. In degree one apply Carayol's Theorem A directly to the supplied compact realization, or the classical realization and its local comparison. Compare the resulting local parameters, including duals and twists. For a Steinberg twist the special Weil–Deligne representation has Frobenius eigenvalues on the two lines differing by `q_v`, which gives the triangular shape with `γ²=ψ_v (KW` Lemma 7.2, proof).
- (c) In R34.6's range import its potential semistability and Frobenius-semisimplified compatibility, with coefficient embeddings, descent and `N_p=N_HK/e_L` retained. Its geometric realization and Hodge filtration give the stated parallel weights after taking the dual. For the additional branch outside (C) apply Kisin's Theorem 4.3 under the absolute residual irreducibility hypothesis, using Taylor's congruences and the potentially semistable quotients. In degree one use the elliptic modular p-adic compatibility theorem cited in [Sai09], introduction p.1 and reference [S], p.46, on the classical realization; identify the compact quaternionic realization by its matching eigenpacket. This degree-one route carries no residual irreducibility hypothesis. For `k=2` at a Steinberg place above p, the Weil–Deligne representation is unramified with `N≠0`, so `ρ_f|_{G_v}` is semistable with Hodge–Tate weights {0,−1}. In its weakly admissible module the kernel of N is the only line stable under `φ` and N. Weak admissibility makes this line, with the induced filtration, an admissible sub-object, and the corresponding sub-representation is `ε_pγ`. This gives the extension of `γ` by `ε_pγ`.

**Overlap comparison.** After a common coefficient extension admitting both finite-part models, the coefficient-model comparison and matching Hecke actions identify the multiplicity with R34.6's representation. Thus `ρ_f≅ρ_R34.6^∨` on the overlap, with the same arithmetic good-prime polynomial and the converted local parameters. Any Taylor/Kisin realization on that overlap has the same good-prime traces and determinants; Chebotarev and Brauer–Nesbitt identify its semisimplification with this absolutely irreducible representation. This compares fraction-field representations, not arbitrary stable lattices. No identification over a rationality field is made without an actual model and descent datum.

**Checks.**

- At weight two the arithmetic representation has weights `{0,−1}`, with its ordinary line `ε_pγ` of weight −1, whereas the cohomological dual has `{0,1}`.
- For v∤p Steinberg, the two diagonal Frobenius eigenvalues differ by the cyclotomic `q_v` factor.
- At a division p-place a non-character irreducible representation with invariants only at deeper level transfers to a supercuspidal representation; the general conclusion is potentially semistable compatibility, not the unramified Steinberg extension.
- The determinant at a good split place is `q_v` `S_v`, not `S_v`.
- This construction must precede [R18.3.31 Localized eigenroot and coinvariant control](#r18331-localized-eigenroot-and-coinvariant-control), and its R34.6 supplier and extensions use no part of that target.
- For the supplied decomposition, if the finite-level automorphic factor has dimension two and the Galois multiplicity factor dimension two, the isotypic cohomology has dimension four; extract the multiplicity factor rather than declaring all of it rank two.
- Conversion: with geometric eigenvalues `α, β` of `ρ_π(Frob_v^{geom}), ρ_f(Frob_v^{arith})` has the same eigenvalues `α, β`, not `α⁻¹, β⁻¹`; taking `ρ_f=ρ_π` instead would give `X²−(t_v/N(v)s_v)X+1/(N(v)s_v)`.

(Source: WeightsInEtaleCohomology R34.6, ‘Hilbert eigensummands and local monodromy weights’, for the shared realization, coefficient descent and source-qualified compatibility; [Car86a](#references) §0.3, p.409, for hypothesis (C); §§0.4–0.5, pp.409–410, for the geometric class-field normalization and the Hecke correspondence; Theorem A, pp.410–411; §§0.10–0.11, pp.411–412, for the Shimura-curve construction. [Tay89](#references) Conjecture 1 and Theorem 2, pp.265–266, for existence when `[F:ℚ]` is even. [Sai09](#references) Theorem 0, pp.10–11, and Theorem 1, p.12. [Kis08](#references) §(4.1), p.542, and Theorem (4.3) with proof, pp.543–544. [KW09](#references) §7, p.60, for the arithmetic convention, and Lemma 7.2 with proof, pp.60–61.)

*Needs:* WeightsInEtaleCohomology R34.6 (Carayol/Saito rank-two multiplicity, coefficient-model descent and source-qualified compatibility); ModularCurvesPartII §§14.1–14.4a; AlgebraicModularFormsAndSerreWeights R15.5A.1–R15.5A.2; [R18.3.21 Degree-two global inner-form spectral transfer](#r18321-degree-two-global-inner-form-spectral-transfer), [R18.3.22 Definite Jacquet–Langlands realization](#r18322-definite-jacquetlanglands-realization), [R18.4.2 Quaternionic finite-level cohomology](#r1842-quaternionic-finite-level-cohomology), [R18.4.25 Cohomological automorphic eigenspaces](#r18425-cohomological-automorphic-eigenspaces); [ArithmeticGaloisRepresentations](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md) `§1.6`, `§1.2`, `§1.9`, `§1.9`, `§2.4`, `§2.4`; [FiniteFlatGroupsAndIntegralPadicHodgeTheory, §§R07.3.0–R07.3.3, R07.4.13, R07.4.27–R07.4.28](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#r0730-finite-k-comparison-of-period-rings-and-realizations); [R18.4.24a Quaternionic geometric semistable comparison](#r18424a-quaternionic-geometric-semistable-comparison).

### R18.4.27 Early finite-level quaternionic Galois–Hecke realization

**Theorem** (`earlyQuaternionicGaloisHeckeSupport`). Consider the compact quaternionic curve with constant weight-two coefficients, a non-Eisenstein maximal ideal m with absolutely irreducible residual representation `ρ̄`, and a finite-order central character `ψ` lifting `det ρ̄·ε`. Let T be the localized O-flat Hecke image acting on H¹. Then T carries a continuous representation `ρ_T:G_{F,S}→GL₂(T)` with the following properties.

- At `v∉S`, with `Frob_v` geometric, `det(X−ρ_T(Frob_v))=X²−T_vX+q_vS_v`.
`- det ρ_T=ψε⁻¹`.

- At each `v|l, ρ_T` is `K_v⁰`-semistable in the sense of §R18.4.19: the specialization of `ρ_T` at every characteristic-zero point of T becomes semistable over the field L′ chosen there, with parallel Hodge–Tate weights {0,1}.

Consequently the unframed global ring with determinant `θ=ψε⁻¹` and these local conditions surjects onto T, compatibly with finer levels; the separate local-type target supplies the q-type factorization. No modularity-lifting theorem is used.

The cohomology module is finite free by [R18.4.10 Non-Eisenstein integral cohomology control](#r18410-non-eisenstein-integral-cohomology-control) and the Hecke image is the actual image on it.

Coefficient field enlarged to split residual `ρ̄`; ψ-central part treated by [R18.4.21 Exact central-character localization](#r18421-exact-central-character-localization).

Every cohomological/automorphic identification used here retains the `TopologicalCoefficientInput` hypotheses of §§R18.4.12 and R18.4.25; integral ordinary Betti realizations also use the finite-cell completion comparison.

*Proof route.*

- **Characteristic-zero points.** T is reduced and finite flat over O. Its maps `x:T→O′` to finite extensions correspond to cuspidal `π_x` of `GL₂(𝔸_F)` of parallel weight two, cohomological at the split real place, that transfer to the quaternion algebra B (§§R18.4.24–R18.4.25). Because B is split at exactly one real place, Carayol's hypothesis (C) of the preceding §R18.3.29 holds for every `π_x`: either `[F:ℚ]` is odd, or B ramifies at some finite place, where `π_x` is then discrete series.
- **Away from l.** Apply the preceding `quaternionEigenformGaloisCompatibility` (§R18.3.29) to the curve eigenpacket `π_x`. Its R34.6 Carayol realization, or the stated degree-one realization, gives the rank-two cohomological representation `ρ_{π_x}` with local compatibility at every v∤l under (C). Take the dual of its arithmetic form to use the geometric normalization below.
- **At v|l.** The same preceding individual theorem supplies the R34.6 compatibility adapter and its stated extensions, including the Frobenius-semisimplified Weil–Deligne parameter. The geometric comparison of §R18.4.24a retains the period normalization. Since `π_{x,v}` has `K_v⁰`-fixed vectors, the choice of L′ in §R18.4.19 (MS §3.6) makes `ρ_{π_x}|_{G_{L′}}` semistable with weights {0,1}.
- **Gluing.** Interpolate the determinants into T using §4.1, then reconstruct `ρ_T` with §1.7 at the absolutely irreducible residue.
- **Local conditions.** The map from the unrestricted global deformation ring to T sends each local framed ring at v|l into T. Every characteristic-zero point of T factors through the reduced O-flat quotient of §R18.4.19, and T is reduced and O-flat, so the intersection of the kernels of its points is zero. Hence the map factors through the local quotient, as in KW's proof of the analogous factorization.
- **Surjectivity and uniqueness.** The universal property supplies `R^θ→T`, which is surjective because the traces and determinants of Frobenius away from S generate T. Chebotarev gives uniqueness and compatibility between levels.

**Checks.**

- This is the minimal input that AutomorphicGaloisRepresentations would otherwise supply; it uses no modularity-lifting result.
- Arithmetic Frobenius uses the normalized reciprocal polynomial; the stated `q_vS_v` determinant is geometric.
- If one `π_x` had a Weil–Deligne parameter at v|l not trivialized on inertia by L′, the factorization through the v|l quotient would fail; the choice of L′ from the finitely many `K_v⁰`-types is what makes the local condition hold at every point.

(Source: [MS19](#references) Lemma 4.11, p.24, and §3.6, pp.17–18; [EGS15](#references) §6.2, pp.34–36, for the Hecke-valued representation and its characteristic polynomials; [Car86a](#references) Theorems A, B′ and §§0.10–0.11, pp.410–412; [Sai09](#references) Theorem 1, p.12; [Kis08](#references) Theorem (4.3), p.543; [KW09](#references) Lemma 9.1 and its proof, pp.80–81, for the factorization through the local quotients.)

*Needs:* [R18.4.10 Non-Eisenstein integral cohomology control](#r18410-non-eisenstein-integral-cohomology-control), [R18.4.19 Local deformation models for quaternionic Ihara](#r18419-local-deformation-models-for-quaternionic-ihara), [R18.4.21 Exact central-character localization](#r18421-exact-central-character-localization), [R18.4.24 Early quaternionic Jacquet–Langlands bridge](#r18424-early-quaternionic-jacquetlanglands-bridge), [R18.4.25 Cohomological automorphic eigenspaces](#r18425-cohomological-automorphic-eigenspaces), [R18.3.29 Early rank-two eigensystem realisation and local compatibility](#r18329-early-rank-two-eigensystem-realisation-and-local-compatibility); [ArithmeticLocallySymmetricSpaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md) `ALS.5b.1`, `ALS.5a–ALS.5b`; [AutomorphicSpectralTheory, §§4.5–4.7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AutomorphicSpectralTheory/README.md#45-finite-multiplicity-in-the-discrete-spectrum); [GL2AutomorphicRepresentationsAndTransfer, §§R16.2.13, R16.4.5, R16.6.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md#r1663-hilbert-cohomological-algebraic-weights); [FiniteFlatGroupsAndIntegralPadicHodgeTheory, §§R07.3.0–R07.3.3, R07.4.13, R07.4.27–R07.4.28](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md#r0730-finite-k-comparison-of-period-rings-and-realizations); [IntegralHeckeAndGaloisDeterminants](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md) `§4.1`, `§1.7`, `§3a.1`; Tau Ceti roadmap [Chebotarev, layer 10 dirichlet density chebotarev](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev).

### R18.4.26 Definite and indefinite Jacquet–Langlands eigenspaces

**Comparison** (`DefiniteIndefiniteComparison`). Over any totally real F, for quaternion algebras `D⁰` and B with invariants exchanged at a finite place v and the designated real place, and a cuspidal `GL₂` representation discrete series at every ramified place of either algebra, apply the two global JL correspondences. At levels transported away `{v, τ}`, identify their away-place Hecke eigensystems and multiplicity factors over actual common rational models. At v the split `GL₂` representation and its division JL partner remain different carriers; the full definite functions and the full curve H¹ are not isomorphic.

O is the ring of integers of a finite extension of `ℚ_l`, and the algebraic coefficient lattice is U-stable with a specified central character, trivial on each rational scalar stabilizer, and has finite reductions descending through the effective central kernel as in §R18.4.1; an integral coefficient pairing is required where duality is used. The transfer domain and infinity weights match; actual common coefficient realizations as in [R18.3.22 Definite Jacquet–Langlands realization](#r18322-definite-jacquetlanglands-realization).

*Proof route.* Exchange the invariants of the two quaternion algebras at the places concerned, under the hypotheses of the CDN comparison. Apply [R18.4.24 Early quaternionic Jacquet–Langlands bridge](#r18424-early-quaternionic-jacquetlanglands-bridge) and [R18.3.21 Degree-two global inner-form spectral transfer](#r18321-degree-two-global-inner-form-spectral-transfer) separately for both ramification sets in the more general domain. Take the specified level invariants and preserve the Hecke operators away from those places.

**Checks.**

- For `F=ℚ` and distinct finite primes p, q, B of discriminant pq and definite D⁰ of finite discriminant p are compared by exchanging q and ∞. This is the reverse finite-place direction from §R18.4.24: use maximal division level on B at q and q-Iwahori level on D⁰, selecting an unramified Steinberg twist on the split side.
- At the exchanged finite place a Steinberg twist and its division character are different local representations with matched Hecke data elsewhere.
- A rank-two curve Galois multiplicity factor prevents identification of the full definite H⁰ with full curve H¹.

(Source: [CDN20](#references) §5.2.1, pp.40–42.)

*Needs:* [R18.3.22 Definite Jacquet–Langlands realization](#r18322-definite-jacquetlanglands-realization), [R18.4.25 Cohomological automorphic eigenspaces](#r18425-cohomological-automorphic-eigenspaces), [R18.3.21 Degree-two global inner-form spectral transfer](#r18321-degree-two-global-inner-form-spectral-transfer), [R18.4.24 Early quaternionic Jacquet–Langlands bridge](#r18424-early-quaternionic-jacquetlanglands-bridge).

### R18.4.28 Early quaternionic local type correspondence

**Theorem** (`quaternionicLocalTypesAndSupport`). At q∤l with `q≡1 mod l` and residual unramified J, local Langlands in the cohomological normalization and local Jacquet–Langlands give the following characteristic-zero support criteria for the prescribed determinant: spherical/trivial type implies `R_nr`; Steinberg type implies `R_unip`; a discrete-series representation compatible with the q-ramified quaternion algebra implies `R_N`; the principal-series inertial type `χ⊕χ⁻¹` for an order-l tame character `χ` implies `R_ps`. For the definite module only the discrete-series alternative occurs. These are factorization assertions for actual cohomological Galois actions, not equivalences for every deformation.

Inflate the finite `GL₂(k_q)` types to `GL₂(O_q)`, with central character compatible with `ψ`.

The underlying Weil–Deligne representation is that of the early quaternionic cohomological realization, with geometric reciprocity and its specified dual/twist.

*Proof route.* For spherical vectors inertia is trivial. Steinberg and principal-series types are detected by their inertia polynomial and the Frobenius/monodromy relation; substitute the defining conditions of MS §3.3. The q-ramified quaternion algebra matches precisely discrete-series `GL₂` representations via local Jacquet–Langlands, so use its N branch. Apply local-global compatibility at q∤l to the actual cohomology representations. The integral factorization follows from O-flatness and the scheme-theoretic characteristic-zero closures in the local models.

**Checks.**

- Steinberg residual support belongs to the union `XY=0`; it is not identified integrally with only one branch.
- No general local Langlands theory is duplicated; this finite list of inputs is independent of GL2AutomorphicRepresentationsAndTransfer.

(Source: [MS19](#references) §3.6, Proposition 3.10, pp.17–18, and Propositions 4.20–4.21, p.30 (Local types cut out the four local deformation quotients supporting the patched modules); [Car86a](#references) §0.5, Theorem A and Theorem B′, pp.410–412 (The geometric cohomological Weil–Deligne normalization and prime-to-l local compatibility are specified))

*Needs:* [R18.4.19 Local deformation models for quaternionic Ihara](#r18419-local-deformation-models-for-quaternionic-ihara), [R18.4.24 Early quaternionic Jacquet–Langlands bridge](#r18424-early-quaternionic-jacquetlanglands-bridge), [R18.4.27 Early finite-level quaternionic Galois–Hecke realization](#r18427-early-finite-level-quaternionic-galoishecke-realization); [SmoothRepresentationsOfLocalGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md) `SR.3`.

### R18.4.29 Quaternionic Ihara patching functor

Define `WeakPatchingSystem` over the integers `O` of a finite extension of `ℚ_l`, with finite residue field, by fixing `S∞ = O[[z₁,…,z_d]]`, annihilating ideals `I_n` eventually contained in every open ideal of `S∞` and finitely generated modules `M_n` with uniformly bounded minimal numbers of generators. A fixed nonprincipal ultrafilter defines the mathematical module `P(M) = lim_a ∏_𝒰(M_n/aM_n)`, over open ideals `a`. The residual version has `ϖM_n = 0` eventually. Define compatible patching algebras and their module morphisms on these systems. Prove finite generation, coefficient quotients, functorial identity/composition, the augmentation isomorphism for an eventually constant quotient system, and finite freeness for systems free of fixed rank over `S∞/I_n`. Exactness requires the MCM quotient conditions of MS Lemma 4.7; it is not asserted for arbitrary inverse systems. This is the weak-patching foundation used for the type functors below. (Source: [MS19](#references), Definition 4.1 and Propositions 4.2–4.6, pp.19–21; Lemma 4.7, p.21.)

**Checks for the patching module.**

- The constant zero system gives the zero module, including after every coefficient quotient.
- For `M_n = S∞/I_n` with the standard cofinal powers-of-augmentation ideals and their annihilators, the patched module has rank one over `S∞`; replacing every module by a rank-two free module gives rank two.
- An eventually constant finite quotient `M_n/aM_n = C` patches to `C` modulo `a`; finitely many exceptional levels do not change this value.
- Uniform generator bounds are essential: an unbounded direct sum of residue-field copies does not satisfy the definition.

**Construction** (`quaternionicIharaPatchingFunctor`). Build the ordinary finite-level type functor `σ↦M_∞(σ)` from the full localized H¹ dual at auxiliary Taylor–Wiles levels, and the definite functor `N_∞`. At `Q_n` use `Δ_n`, the product of maximal l-power residue-field multiplicative quotients, and chosen `U_v` eigenvalues. The finite-level homology modules are finite free over `O[Δ_n]`, with augmentation identifying them with the base-level modules. Frame with j variables and patch over `S_∞` to `R_∞`. `M_∞` is exact on finite `σ`, has the prescribed augmentation `M_∞(σ)⊗_(S_∞)O=M_0(σ)`, and is maximal Cohen–Macaulay on its local-type ring for free `σ`, and modulo `π` for residual `σ`. Patch the N,M²,N filtration compatibly. The full two-dimensional cohomological Galois multiplicity is retained; the functor is not a multiplicity-one module. For a finite torsion type `σ`, its dual means `Hom_O(σ,E/O)`. For a free integral type use the compatible finite `σ/λⁿ` systems and inverse limit to obtain an O-free homology dual, not `Hom_O(H¹(O),E/O)` treated as O-free.

Use the Taylor–Wiles datum, early Galois–Hecke action, local type support and exact central-character parts at every level.

The generic patching theorem must expose cofinal ideals `I_n=((1+y_i)^(l^(e_ni))−1), e_ni≥n`, matched dimensions and maximal Cohen–Macaulay quotients in each exact patched sequence.

The residual filtration is patched only under the exactness hypotheses of MS Lemma 4.7; arbitrary inverse-limit patching is not asserted exact.

*Construction.* Form the fine levels as kernels of the residue-field quotient at `Q_n`; localize `U_v` at the chosen residual eigenvalues and prove the `O[Δ_n]` freeness and augmentation isomorphisms from the finite-level cover action and non-Eisenstein concentration. Adjoin frame variables and apply the MS weak-patching contract required of §R18.4.29. Keep its noetherian, cofinal-ideal and uniform-generator hypotheses, finite-level freeness and numerical equality. No domain hypothesis is imposed on the reducible local tensor product; the existing domain Kisin criterion is not used as if it covered this case. For a finite type `σ` use the arithmetic local coefficient sheaf of `σ∨` in cohomology, dualize and patch; pass compatibly through `σ/πⁿ` for integral free types. Patch the filtration using MCM residual graded quotients; use the early local type theorem to factor each action through `R_nr`, `R_unip`, `R_ps` or `R_N`.

Its API:

- `patch_augmentation`: `M_∞(σ)⊗_(S_∞)O≅M_0(σ)`, naturally in `σ` and level.
- `patch_type_exact`: Finite type exact sequences give exact patched sequences under the MCM quotient criterion.
- `patch_type_support`: `1, St, σ_ps` and definite N have respectively nr, unip, ps and N support.
- `patch_filtration`: The patched q-Iwahori module has graded pieces `N_∞, M_∞², N_∞` and agrees with `M_∞⊕M_∞(St)` by the Iwahori splitting.
- `patch_type_map`: For a single fixed compatible patching datum and ultrafilter, maps of finite types induce R∞-linear maps of patched modules; identities and composites agree, naturally with augmentation and level maps.
- `patch_integral_type`: For a free O-type, construct its patched module from the compatible finite `σ/πⁿ` systems and inverse limit. Reduction to each `σ/πⁿ` agrees under the stated cofinal/freeness hypotheses; a torsion Pontryagin dual is not declared O-free.
- `patch_type_exact_criterion`: Exactness is asserted for the admissible systems of MS Lemma 4.7, not every inverse system; multiplication by `πⁿ` can become zero after patching despite each finite-level map being injective.

**Checks.**

- `patch_zero`: The zero type produces zero, which is handled separately from nonzero MCM support claims.
- `patch_full_multiplicity`: The augmentation returns full H¹ dual, including its rank-two Galois factor; replacing it by a rank-one multiplicity space fails.
- `patch_nonsplit_type`: The type lattice sequence gives `0→M_∞(1)→M_∞(σ_ps,k)→M_∞(St_k)→0` with the declared orientation.

(Source: [MS19](#references) Lemma 4.7, p.21; Propositions 4.14 and 4.16, pp.26–27; Theorems 4.17 and 4.19, pp.28–29; Propositions 4.20–4.21, p.30 (The finite-level systems patch with exactness, augmentation, MCM and local support under these hypotheses))

*Needs:* [R18.4.20 Finite-level Taylor–Wiles prime datum](#r18420-finite-level-taylorwiles-prime-datum), [R18.4.27 Early finite-level quaternionic Galois–Hecke realization](#r18427-early-finite-level-quaternionic-galoishecke-realization), [R18.4.21 Exact central-character localization](#r18421-exact-central-character-localization), [R18.4.28 Early quaternionic local type correspondence](#r18428-early-quaternionic-local-type-correspondence), [R18.4.22 Auxiliary-prime integral types](#r18422-auxiliary-prime-integral-types), [R18.4.23 Supersingular cohomology filtration](#r18423-supersingular-cohomology-filtration); the commutative-algebra targets stated above.

### R18.4.30 Patched Steinberg branch flatness

Specialize DeformationAndDerivedPatchingAlgebra §3.3's generic module miracle flatness as `regularBaseMiracleFlatness`: let `A → R` be a local homomorphism of noetherian local rings, A regular, M a finite MCM R-module and `dim R=dim A+dim(R/m_A R)`. For nonzero M, prove the supplier's support-dimension equality. Put `d=dim A`; the maximal ideal of A has d generators and `dim Supp_R M=dim R`. The dimension bound for quotienting a finite module by d elements and support containment give

`dim R−d ≤ dim Supp_(R/m_A R)(M/m_A M) ≤ dim(R/m_A R)=dim R−d`.

The quotient is nonzero by Nakayama. Thus the two bounds coincide and the supplier theorem makes M A-flat. Treat M=0 separately. Verify this specialization on the actual patched local-type rings, retaining all formally smooth factors. Prove `nodalThickeningTransfer`: for a field `k`, `A = k[[X,Y]]/(X²Y)`, an `A`-algebra `R` and an exact sequence of `R`-modules `0 → L → M → N → 0`, assume `M` is `A`-flat, `XL = 0` and `XYN = 0`. Then `N = M/(XY)M` is flat over `B = A/(XY)` and `N/XN ≅ L`. Finally prove `nodalFiltrationTransfer`: let `R` be a complete local noetherian `B = k[[X,Y]]/(XY)`-algebra with residue field `k`; let `M` be `B`-flat, `YN = 0`, `N` flat over `B/(Y)`, `L ≅ M/XM` and `P ≅ L ⊕ M`. If `P` has a filtration with graded pieces `N`, `L ⊕ L`, `N` in that order, then `0 → N → M/YM → N → 0` is exact as `R`-modules. These are theorem targets with their displayed inputs and conclusions; no domain hypothesis is added. (Source: DeformationAndDerivedPatchingAlgebra §3.3 (generic module flatness); [MS19](#references), Lemmas 5.1–5.3, pp.31–33.)

**Theorem** (`patchedTypeFlatness`). With the preceding finite-level patching datum, `M_∞(1)` is flat over `R_nr`, `N_∞` is flat over `R_N` and `M_∞(σ_ps,O)` is flat over the regular `R_ps`. Residually `M_∞(St_k)` is flat over `B=k[[X,Y]]/(XY)` (with the retained formal smooth parameters), `M_∞(St_k)/X≅M_∞(1_k)`, and there is an exact sequence `0→N_∞→M_∞(St_k)/Y→N_∞→0`. All identifications are `R_∞`-linear and commute with the w-degeneracy maps.

The local rings are precisely the minimal-ramification models above, and the nonzero modules have the stated MCM dimension equality.

The type sequence and N,M²,N filtration are exact and compatible; zero modules are treated as flat separately.

*Proof route.* Apply `regularBaseMiracleFlatness`, the preceding specialization of DeformationAndDerivedPatchingAlgebra §3.3, to `R_nr`,`R_N`,`R_ps`. Verify the ambient ring dimension formula in the actual patched local tensor product and deduce the support-dimension equality for each nonzero MCM module by the displayed bounds. Treat `M=0` separately. Use the MS Lemma 5.2 algebra required of §R18.4.30: over `A=k[[X,Y]]/(X²Y)`, an exact `0→L→M→N→0` with M A-flat, `XL=0, XYN=0` yields `N=M/(XY)M` flat over B and `N/XN≅L`. For Proposition 6.11 use the residual ps patched ambient ring, on which `M(σ_ps)` acts, before passing to the unipotent quotient. Apply the MS Lemma 5.3 algebra required of §R18.4.30 to `M=M_∞(St_k), L=M/XM`, the Iwahori decomposition `P=L⊕M` and its N,L²,N filtration. Its hypotheses include N flat over B/(Y). Obtain the stated exact sequence modulo Y. For Proposition 6.12 use the residual unipotent patched ambient ring; the ps ring does not carry the coordinate-preserving B-algebra structure. This corrects the two swapped ambient rings printed on p.38.

**Checks.**

- For `A=k[[t]]`, `R=A[[x]]` and `M=R`, the closed-fibre support has dimension one and `2=1+1`; the specialization gives A-flatness.
- For `A=k[[t]]`, `R=A` and `M=k`, the MCM hypothesis fails and M is not A-flat; the ambient ring dimension formula alone is insufficient.
- For `M=0`, flatness holds without assigning it the nonzero support dimension used above.
- Replacing X²Y by XY before applying the first lemma invalidates its kernel calculation.
- All smooth framing factors survive; the fixed-determinant q-local core has four variables.

(Source: DeformationAndDerivedPatchingAlgebra §3.3 (generic module flatness); [MS19](#references) Lemmas 5.1–5.3, pp.31–33; Propositions 6.10–6.12, pp.37–38 (Regular-base flatness and the two nodal transfer lemmas yield the Steinberg branch identities))

*Needs:* [R18.4.29 Quaternionic Ihara patching functor](#r18429-quaternionic-ihara-patching-functor), [R18.4.19 Local deformation models for quaternionic Ihara](#r18419-local-deformation-models-for-quaternionic-ihara); DeformationAndDerivedPatchingAlgebra §3.3 (generic module miracle flatness); the two nodal transfer targets stated above.

### R18.4.31 Patched degeneracy surjectivity

**Theorem** (`patchedDegeneracySurjectivity`). For constant residual coefficients and the large-image datum, the homological trace map `M_∞,K_0(w)(St_k)→M_∞,K(St_k)²` is surjective. Specializing by X and then the `S_∞` augmentation gives the surjective finite-level trace `H₁(X_(K_0(w)),k)_m→H₁(X_K,k)_m²`, first on the chosen central character and then on the whole localized module.

The [R18.4.30 Patched Steinberg branch flatness](#r18430-patched-steinberg-branch-flatness) exact sequences are constructed at K and `K_0(w)` compatibly.

The target source levels at w are small and hyperspecial/Iwahori, and definite Ihara is available from R18.3.

*Proof route.* Form the commuting two-row short exact diagram modulo Y with outer terms `N_∞` and `N_∞²`. Use the general-field definite Ihara theorem [R18.3.8 Definite Ihara lemma over an arbitrary totally real field](#r1838-definite-ihara-lemma-over-an-arbitrary-totally-real-field) (MS Theorem 6.8) to make the two outer trace maps surjective after augmentation; the existing restricted KW definite degeneracy theorem alone does not cover this F. The finite patched cokernels vanish by Nakayama; the short exact diagram then makes the middle map modulo Y surjective. Apply Nakayama again with Y in the maximal ideal to get the full Steinberg map surjective. Tensor with the unramified branch `X=0`, using [R18.4.30 Patched Steinberg branch flatness](#r18430-patched-steinberg-branch-flatness), then specialize `S_∞` to k. Remove the central character quotient by the finite central-algebra Nakayama argument.

**Checks.**

- Use surjectivity of finite cokernels and Nakayama; no exactness of tensoring an arbitrary short exact sequence is assumed.
- The proof never uses an `R=T` theorem or a patching outcome of modularity lifting.

(Source: [MS19](#references) Proof of Theorem 6.5, p.38 (A compatible exact diagram transfers definite trace surjectivity to the curve through the two branch specializations))

*Needs:* [R18.4.30 Patched Steinberg branch flatness](#r18430-patched-steinberg-branch-flatness), [R18.3.8 Definite Ihara lemma over an arbitrary totally real field](#r1838-definite-ihara-lemma-over-an-arbitrary-totally-real-field), [R18.4.21 Exact central-character localization](#r18421-exact-central-character-localization), [R18.4.5 Cohomological degeneracy maps](#r1845-cohomological-degeneracy-maps).

### R18.4.32 Large-image residual Ihara lemma

**Theorem** (`residualIharaLargeImage`). Let l>2, D/F a quaternion division algebra split at exactly one real place, K sufficiently small and hyperspecial at a split finite place w, and `Λ a` finite k-representation of `K^w` trivial on the rational central stabilizers. Let m be non-Eisenstein with absolutely irreducible `ρ̄_m`. Assume l divides `|ρ̄_m(G_F)|`. If `l=5` and proj `ρ̄_m(G_F)≅PGL₂(F₅)`, assume ker proj `ρ̄_m` is not contained in `G_F(ζ₅)`. Then `δ:H¹_et(X_K,L_Λ)_m²→H¹_et(X_(K_0(w)),L_Λ)_m` is injective. The exceptional condition is automatic if `√5∉F`. The theorem allows w|l only when the coefficient action is away from w. It makes no assertion for `l=2` or the exceptional small images.

All coefficient and effective smallness hypotheses above; the same away Hecke ideal is used at both levels.

*Proof route.* Choose the auxiliary unipotent q and the minimal coefficient ring. Construct the Taylor–Wiles systems and their local-type patching functor without modularity lifting. Apply [R18.4.31 Patched degeneracy surjectivity](#r18431-patched-degeneracy-surjectivity) and finite-dimensional duality to get constant residual cohomological injectivity. Use [R18.4.11 Finite-cover reduction for Ihara coefficients](#r18411-finite-cover-reduction-for-ihara-coefficients) to extend to `Λ`; descend or extend the finite coefficient field by faithful flatness.

**Checks.**

- The statement does not replace the large-image condition by absolute irreducibility alone.
- The local coefficient factorization at w must be checked even when w lies over l.
- The proof uses two l-adic inputs: the potentially semistable local quotient of §R18.4.19 (Kisin) and the l-adic local–global compatibility of §R18.4.27 (Saito, Kisin). It also uses the local flatness, weak-patching and auxiliary-type targets of §§R18.4.22, R18.4.29–R18.4.30, SelmerIwasawaCohomology §§2A.1–2A.5, GlobalGaloisDeformations §§3.3–3.7 and the MS detecting, selection and dimension targets of §R18.4.20 here. These are inputs of the proof, not additional image hypotheses.

(Source: [MS19](#references) Theorem 6.5 and Remarks 6.6–6.7, p.34; proof, p.38 (The residual Ihara result has the large-image and `l=5` Taylor–Wiles hypotheses, and is proved for arbitrary finite coefficients away from w))

*Needs:* [R18.4.18 Auxiliary unipotent prime](#r18418-auxiliary-unipotent-prime), [R18.4.31 Patched degeneracy surjectivity](#r18431-patched-degeneracy-surjectivity), [R18.4.11 Finite-cover reduction for Ihara coefficients](#r18411-finite-cover-reduction-for-ihara-coefficients).

### R18.4.33 Integral Ihara saturation

**Theorem** (`integralIharaSaturation`). Under [R18.4.32 Large-image residual Ihara lemma](#r18432-large-image-residual-ihara-lemma), let `L_O` be a finite free O-lattice system with reduction `Λ` and coefficient action away from w. Then `δ:H¹_et(X_K,L_O)_m²→H¹_et(X_(K_0(w)),L_O)_m` is injective and its image is saturated; the cokernel is finite free over O. A finite extension of coefficient DVRs preserves injectivity, saturation and a finite-free cokernel. After reduction to `O/λⁿ` the map is a split injection with finite-free cokernel over `O/λⁿ`; no λ-torsion-freeness of this Artinian cokernel is asserted. This is an integral consequence of the residual theorem and the established control isomorphisms; it is independent of `Δ` being a unit.

The localized source and target have the finite-free and reduction statements of [R18.4.10 Non-Eisenstein integral cohomology control](#r18410-non-eisenstein-integral-cohomology-control).

All image, smallness and coefficient hypotheses of the residual theorem hold.

*Proof route.* Identify reduction of the integral degeneracy map with the residual map by functorial cohomology control. Apply [R18.4.32 Large-image residual Ihara lemma](#r18432-large-image-residual-ihara-lemma) and [R18.4.17 Residual injectivity and DVR saturation](#r18417-residual-injectivity-and-dvr-saturation) to obtain injectivity and finite-free cokernel. Tensor the resulting split short exact sequence of finite-free DVR modules to any coefficient extension or `O/λⁿ`.

**Checks.**

- A level-raising ideal with `Δ≡0` is still allowed by Ihara.
- The result is not asserted for arbitrary integral weights that act nontrivially at w.
- For the inclusion `O→O², x↦(x,0)`, the reduced cokernel is `O/λⁿ`. It is free over `O/λⁿ` but has nonzero λ-torsion, so DVR saturation cannot be asserted after Artinian reduction.

In [Suggested.lean](Suggested.lean): `integral_ihara_split`.

(Source: [MS19](#references) Theorem 6.5, p.34, with §2.10 and Lemma 6.4, pp.10,34 (Residual injectivity and local coefficient control are the inputs; saturation is derived here by the stated DVR criterion))

*Needs:* [R18.4.10 Non-Eisenstein integral cohomology control](#r18410-non-eisenstein-integral-cohomology-control), [R18.4.32 Large-image residual Ihara lemma](#r18432-large-image-residual-ihara-lemma), [R18.4.17 Residual injectivity and DVR saturation](#r18417-residual-injectivity-and-dvr-saturation), [R18.4.5 Cohomological degeneracy maps](#r1845-cohomological-degeneracy-maps).

### R18.4.34 Saito quaternionic coefficient projector

**Finite-level specialization** (`quaternionicSaitoProjector`). Let `g=[F:ℚ], k=(k_i,w)` with `k_i≥2`, all `k_i≡w mod 2` and `w≥max_i k_i`. Use Saito’s actual CM/PEL bridge `M×N→M″` and CM elliptic family `A₀→N₀`, not an elliptic family on M. After a splitting coefficient field L, the PEL endomorphism algebra is a product of two `M₂(L)` factors at each i; select the indicated second/conjugate factor and a rank-one matrix idempotent `e_i`. Its action on `R¹a_*L_λ` has rank two. Import Saito’s model and the degree-one, Young/symmetric/determinant and CM projectors from WeightsInEtaleCohomology R34.3, ‘Hilbert and Shimura models’, and specialize them to the matching finite levels. They give `X=α*A^{g(w−2)}×β*A₀^{a}, a=(g−1)(w−2)`, and an L-linear algebraic correspondence e. Write `q₀=(2g−1)(w−2)`. The only nonzero projected `R^j c_*` is `j=q₀`, with `eR^q₀c_*=pr₁*F(k)⊗β*F(χ₀)^a`. Here `F(χ₀)`, after forgetting the torus action, has Tate type `L_λ(−1)`. Leray yields `eH^j(X_Ē,L_λ)≅H^{j−q₀}(M_F̄,F(k))⊗H⁰(N_Ē,F(χ₀)^a), G_E-` and Hecke-equivariantly. Selecting an actual CM eigensummand `L_λ(−a)` identifies the selected `degree-(q₀+1)` factor with `H¹(M,F(k))(−a)`.

Small compatible levels and stable lattices admit the stated PEL and CM abelian schemes and maps `α,β`; the effective descent is part of the coefficient system.

All determinant exponents `(w−k_i)/2` are nonnegative; rational idempotents have denominators, so exclude their support for an integral action.

For the good-model comparison require Saito Lemma 4: p splits in the chosen imaginary quadratic `E₀`, the quaternion algebra is split at the distinguished p-place, K″ has the stated hyperspecial p-component, and compatible level changes retain the p-components (hence induce prime-to-p isogenies). The actual PEL and CM abelian schemes and correspondences extend under these hypotheses; `λ∤p`.

For the invoked semistable-model form of Saito Lemma 4, choose a further sufficiently small level with every geometric curve component of genus greater than one; at a good smooth model the same correspondence extension applies directly.

*Specialization.* Match the supplied α,β bridge, PEL and CM families, coefficient field embeddings, finite levels and lattice pairs with the quaternionic objects of §§R18.2.1 and R18.4.1. Transport the supplied correspondence and projected Leray comparison through these actual identifications, verifying the selected second/conjugate matrix factor and the degree shift q₀. Keep the bridge identity `α*F″(k)≅pr₁*F(k)⊗β*F(χ̄)^a`, where `χ₀=χχ̄`. The selected CM elliptic projector has image `F(χ)` in R¹, of weight one. Tensoring its a factors with the bridge factors `F(χ̄)^a` gives `F(χ₀)^a`; only after this tensor product and forgetting the torus action is the correction Tate `(−a)`. Verify Lemma 4's split-p, fixed-p-component and genus hypotheses before importing the extended model. Preserve its coefficient-linear cohomological projector, descent and prime-to-p isogenies. Choose the CM eigensummand before extracting H¹(−a); no saturated integral image follows from rational projection.

Its API:

- `saito_rank_two`: Each selected `e_iR¹` has rank two, and its symmetric/determinant projector has the advertised representation.
- `saito_unique_row`: `eR^j c_*=0` for `j≠q₀` and the `j=q₀` row is F(k) tensored with the stated CM correction.
- `saito_cohomology`: The Leray comparison is `G_E`- and Hecke-equivariant in all degrees.
- `saito_good_model`: Under the split-p, hyperspecial PEL and fixed-p-level hypotheses of Lemma 4, extend the actual abelian schemes and prime-to-p correspondences, compatibly with good-fibre specialization; exclude projector denominators for integral actions.
- `saito_idempotent`: On every declared cohomological realization the induced action satisfies `e_*²=e_*` and commutes with the indicated Galois and Hecke actions. The L-linear algebraic correspondence itself is not required to satisfy equality `e∘e=e` in the correspondence ring.
- `saito_tame_levels`: Compatible level maps with unchanged p-components give prime-to-p isogenies of the PEL/CM families, intertwine the projectors and satisfy identity/composition compatibility on their cohomological summands.

**Checks.**

- `saito_weight_two`: For `w=k_i=2, q₀=a=0` and the degree-one comparison returns constant weight-two curve cohomology.
- `saito_g2_w4`: For `g=2,w=4, q₀=6` and `a=2`: the selected degree is seven and the cohomology factor is `H¹(F(k))(−2)`.
- `saito_CM_character`: At a good CM elliptic fibre, F(χ) and F(χ̄) each have weight one; their product F(χ₀) has weight two and Tate type `(−1)` after forgetting the torus action. Identifying either R¹ constituent alone with `(−1)` fails this weight test.
- `saito_negative_determinant`: For `k=(6,2),w=4` the exponent `(w−6)/2` is negative; the direct tensor construction is excluded.
- `saito_no_integral_saturation`: An idempotent containing `1/λ` does not define an integral projector on an O-lattice.

(Source: [Sai09](#references) §§4–5, pp.18–24; §§6.1–6.3 and Lemma 3, pp.25–30; Lemma 4, pp.32–33 (The coefficient projector uses higher-dimensional quaternionic PEL powers and a CM correction, with an explicit degree shift and good-model correspondence extension))

*Needs:* [R18.2.1 Quaternionic auxiliary PEL instance](#r1821-quaternionic-auxiliary-pel-instance), [R18.4.1 Quaternionic algebraic local systems](#r1841-quaternionic-algebraic-local-systems); [PELModuli](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/PELModuli/README.md) `M3`; [WeightsInEtaleCohomology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/WeightsInEtaleCohomology/README.md) `R34.3, Hilbert and Shimura models; Saito’s semistable model and period comparison`.

### R18.4.35 Quaternionic and inner-cohomology purity

**Theorem** (`quaternionicCoefficientPurity`). At a good proper model prime `p, λ∤p`, the rank-two Morita summands `V_i` of the genuine quaternionic PEL family are pure of geometric weight one. The raw tensor coefficient `⊗_i Sym^(n_i)V_i⊗det(V_i)^(d_i)(b)` has weight `r=Σ_i n_i+2Σ_i d_i−2b`, hence H¹ on the proper curve has weight r+1. For Saito’s normalized F(k), the selected `degree-(q₀+1)` smooth proper cohomology is pure of weight `q₀+1` and equals `H¹(F(k))(−a)`; therefore H¹(F(k)) has weight `q₀+1−2a=w−1`, and its twist (b) has weight `w−1−2b`. The statement descends from `G_E` to `G_F` at places where the actual coefficient representation is unramified, by taking powers of Frobenius. For a smooth open Hilbert model and a lisse pure coefficient of weight r, its inner `H_!^j=im(H_c^j→H^j)` is pure of weight r+j. No whole-open-cohomology purity, bad-reduction purity or rational/integer Frobenius polynomial for an arbitrary L-projector factor is asserted.

Good smooth proper spreading for the indicated abelian scheme, curve and total projector variety; coefficients and projectors extend at p.

All algebraic and parity hypotheses of [R18.4.34 Saito quaternionic coefficient projector](#r18434-saito-quaternionic-coefficient-projector); its CM eigensummand exists over the chosen coefficient field.

For the open Hilbert clause the actual sheaf extends as lisse pure of weight r on the chosen smooth finite-field fibre.

In the raw tensor formula `n_i` are nonnegative integers and `d_i,b` are integers; negative determinant exponents are inverse line powers over the rational coefficient field.

*Proof route.* Import abelian Weil purity and the operations on pure representations to obtain the raw rank-two tensor weight; apply proper smooth direct-image/cohomology purity. Use [R18.4.34 Saito quaternionic coefficient projector](#r18434-saito-quaternionic-coefficient-projector) and its good-model comparison. The selected smooth proper `H^(q₀+1)` has that weight; its CM factor has weight 2a. Subtract 2a and calculate `(2g−1)(w−2)+1−2(g−1)(w−2)=w−1`. Use generic weights operations for the Tate twist. For descent compare `Frob_u` with `Frob_v^f` at an unramified place; the absolute values of the fth powers imply the same weight at v. For the open Hilbert clause import §7.12, whose compact-support upper and ordinary-support lower bounds meet on the image.

**Checks.**

- For `g=2,w=4` the coefficient H¹ weight is three, not seven.
- Raw coefficients and normalized F(k) must not be assigned the same weight merely because they use the same abelian family.

(Source: [Sai09](#references) Lemma 3, p.30, and Lemma 4, pp.32–33 (The projector realizes normalized coefficients with the CM twist on a good total-space model); [Del80](#references) Corollaries 3.3.4–3.3.6, printed p.206 (The two support bounds imply pure inner cohomology; proper smooth purity is their proper specialization))

*Needs:* [R18.4.34 Saito quaternionic coefficient projector](#r18434-saito-quaternionic-coefficient-projector), [R18.4.13 Finite-level Hilbert support comparison](#r18413-finite-level-hilbert-support-comparison); [DeligneWeightsAndPurity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/DeligneWeightsAndPurity/README.md) `§1.4`, `§4.3`, `§7.12`; [WeightsInEtaleCohomology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/WeightsInEtaleCohomology/README.md) `R34.1, Linear algebra operations and rational integrality`, `R34.2, Purity and integral polynomials at good reduction`.

### R18.4.36 Quaternionic coefficient purity

**Theorem** (`QuaternionPurity`). At a finite good place away l, a specified algebraic projector on the auxiliary abelian scheme gives a rank-two lisse coefficient constituent pure of weight one. An algebraic symmetric/tensor coefficient system of total geometric weight r is pure of weight r; since X is proper smooth, H¹(X, L) is pure of weight r+1 for geometric Frobenius. The quaternionic rank-two constituent and its projector must be verified; an elliptic-family purity theorem alone is insufficient for this higher-dimensional auxiliary PEL family. The weight is computed through the Saito projector and the coefficient-purity theorem of this layer ([R18.4.34 Saito quaternionic coefficient projector](#r18434-saito-quaternionic-coefficient-projector), [R18.4.35 Quaternionic and inner-cohomology purity](#r18435-quaternionic-and-inner-cohomology-purity)); the model and projector are supplied by WeightsInEtaleCohomology R34.3 and specialized at the finite quaternionic levels here.

O is the ring of integers of a finite extension of `ℚ_l`, and the algebraic coefficient lattice is U-stable with a specified central character, trivial on each rational scalar stabilizer, and has finite reductions descending through the effective central kernel as in §R18.4.1; an integral coefficient pairing is required where duality is used. Good smooth fibre; l invertible; compatible Frobenius-commuting projectors and actual pure coefficient constituents.

*Proof route.* Apply the Saito projector [R18.4.34 Saito quaternionic coefficient projector](#r18434-saito-quaternionic-coefficient-projector) to isolate the rank-two Morita constituent of the auxiliary PEL family. Check the Morita/splitting constituent and the symmetric/tensor weight arithmetic. Apply [R18.4.35 Quaternionic and inner-cohomology purity](#r18435-quaternionic-and-inner-cohomology-purity), that is proper smooth Weil II purity, to H¹.

**Checks.**

- For weight-two trivial coefficients, H¹ has geometric weight one.
- A rank-two Morita summand has weight one; the entire auxiliary R¹ is not thereby a rank-two local system.
- A Tate twist by b subtracts 2b from the coefficient and cohomology weights, with the supplied projector and embedding retained.

(Source: [YZ18](#references) §3.2, moduli problem F1, U′p, pp.553–554, the auxiliary family only; specialize the R34.3 coefficient projector with its coefficient embeddings and model hypotheses; [Del80](#references) §3.3, Theorem 3.3.1, p.204, and Corollaries 3.3.4–3.3.6, p.206, pure coefficients on a smooth proper curve.)

*Needs:* [R18.4.1 Quaternionic algebraic local systems](#r1841-quaternionic-algebraic-local-systems), [R18.4.34 Saito quaternionic coefficient projector](#r18434-saito-quaternionic-coefficient-projector), [R18.4.35 Quaternionic and inner-cohomology purity](#r18435-quaternionic-and-inner-cohomology-purity).

### Examples

For the degeneracy Gram operator with `q=2, T=3` and `S=1` the discriminant `(q+1)²−S⁻¹T²` vanishes and `(1,−1)` lies in the kernel; for `S=2` the operator sends (0,1) to (3/2,3). A trivial component group with `q_v=3` gives `T_v=4` and `S_v=1`.

### Dependencies

This layer uses earlier layers R18.2, R18.3, R18.1, H3, H4; ArithmeticGaloisDuality (D7, R02.4); ArithmeticLocallySymmetricSpaces (ALS.1, ALS.3, ALS.4, ALS.5a–ALS.5b, ALS.5a, ALS.6); GL2AutomorphicRepresentationsAndTransfer (AutomorphicSpectralTheory Layer 4, GL2AutomorphicRepresentationsAndTransfer §R16.6.3); AutomorphicSpectralTheory (Layer 6); ClassicalAdicEtaleCohomology (§§1.1–1.5, 9.2–9.7, 11.1), EtaleCohomologyFoundations (§§F.0–F.4), ComplexComparisonPartII (§§C6.3–C6.6); ComplexComparisonPartII (C6.3–C6.6); LocalGaloisDeformationRings (§§1.1, 1.15–1.16); GlobalGaloisDeformations (§§3.3–3.7); local weak patching (§R18.4.29) and branch flatness (§R18.4.30); DeligneWeightsAndPurity (DWP.1, DWP.4, DWP.7); IntegralHeckeAndGaloisDeterminants (Layer 1, §3a.1, Layer 4); LefschetzPencilsAndVanishingCycles (§§7a.1–7a.2); PELModuli (M3); FiniteFlatGroupsAndIntegralPadicHodgeTheory (§§R07.3.0–R07.3.3, R07.4.27–R07.4.28); SelmerIwasawaCohomology (Layer 2); SmoothRepresentationsOfLocalGroups (SR.3); WeightsInEtaleCohomology (R34.1, R34.2); the Tau Ceti roadmaps AlgebraicTopology, Chebotarev, ClassFieldTheory; Tau Ceti `TauCeti.LocalCoefficientSystem`, `TauCeti.LocalCoefficientSystem.monodromyRepresentation`, `TauCeti.LocalCoefficientSystem.pullback`; Mathlib `IsDiscreteValuationRing`, `Module.free_of_finite_type_torsion_free'`.

## Layer R18.3, part 2: Early Galois compatibility and localized control

With finite-level cohomology and its characteristic-zero eigenspaces available, identify the Galois representations attached to the relevant eigensystems at the finite level. Then prove the localized control of auxiliary-level modules that Taylor–Wiles arguments consume. No step uses patching or Taylor–Wiles control itself. The standing hypotheses of part 1 apply to §§R18.3.30–R18.3.32; the individual realization §R18.3.29 has the general totally real field domain stated there.

### R18.3.30 Distinct unramified residual roots exclude Steinberg

**Theorem** (`steinberg_distinctResidualRoots_impossible`). Let `v∤p, q_v≡1 mod p`, and let `ρ_f` be a rank-two representation with a stable lattice whose residual semisimplification is unramified at v and has two distinct Frobenius eigenvalues. If its local semisimplification were `ε_p γ⊕γ` for an unramified `γ`, both residual Frobenius eigenvalues would be equal. Thus no unramified twist of Steinberg compatible with `ρ_f` can contribute to this residual system. Applied using early local compatibility, this supplies the characteristic-zero rank equality in KW Corollary 7.5.

A genuine stable lattice and its residual semisimplification are given; the local special shape is supplied by the early compatibility target when applied to eigenforms.

v∤p; arithmetic Frobenius gives `ε_p(Frob_v)=q_v`; `q_v≡1` in k.

*Proof route.* The special local representation has semisimplified characteristic polynomial `(X−q_v γ(Frob_v))(X−γ(Frob_v))`. Its integral unit-valued `γ` reduces to a single value because `q_v≡1`; lattice reduction preserves the characteristic polynomial. Contradict the distinct-root polynomial of the given residual representation, and combine with the Iwahori fixed-space calculation.

**Checks.**

- For `q≡1` in `F₃, γ=2` yields the repeated root 2.
- If q≢1 the two special roots can be distinct, so the congruence hypothesis cannot be omitted.

(Source: [KW09](#references) Corollary 7.5 proof, p.66 (The local–global input is used only to rule out special components at the selected primes); [Tay06](#references) Lemma 2.2 proof, p.747 (The same exclusion gives equality of ranks after selecting the simple root))

*Needs:* [R18.3.29 Early rank-two eigensystem realisation and local compatibility](#r18329-early-rank-two-eigensystem-realisation-and-local-compatibility), [R18.3.28 Unramified Iwahori root and degeneracy normalisation](#r18328-unramified-iwahori-root-and-degeneracy-normalisation); [ArithmeticGaloisRepresentations](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md) `§2.4`, `§1.9`.

### R18.3.31 Localized eigenroot and coinvariant control

**Theorem** (`TwLocalisedControl`). Let m be non-Eisenstein and let the specified residual system be unramified at each `v∈Q`, with `q_v≡1 mod p` and two distinct arithmetic Frobenius eigenvalues `α_v, β_v`. Retain a characteristic-zero local compatibility hypothesis at these auxiliary places: for every constituent in this localized module, its two-dimensional Galois representation has stable O-lattice with this residual system, and its Frobenius-semisimple Weil–Deligne parameter agrees with the normalized local `GL₂` parameter. Establish the local Steinberg exclusion from these hypotheses: a Steinberg twist has Frobenius eigenvalue ratio `q_v`, hence equal residual eigenvalues when `q_v≡1`, contrary to `α_v≠β_v`. With that exclusion, choose the Hensel root `A_v` lifting `α_v` in `X²−T_vX+q_vψ(π_v)`. Localization at `U_v−α_v` is finite free over `O[Δ_Q]`, of rank `rank_O S(U, O)_m`, and its `Δ_Q`-coinvariants identify with `S(U, O)_m` through `ξ_v(f)=A_v f−diag(1, π_v) f`. The geometric freeness theorem alone makes no assertion that such Galois representations or compatibility data exist.

Residual irreducibility/non-Eisenstein localization; `q_v≡1 mod p`, distinct `α_v, β_v`; actual characteristic-zero local–global compatibility supplied.

*Proof route.* Apply the Hensel eigenroot factorization and construct the `ξ_v` maps. Use [R18.3.29 Early rank-two eigensystem realisation and local compatibility](#r18329-early-rank-two-eigensystem-realisation-and-local-compatibility), the selected-root map [R18.3.28 Unramified Iwahori root and degeneracy normalisation](#r18328-unramified-iwahori-root-and-degeneracy-normalisation) and [R18.3.30 Distinct unramified residual roots exclude Steinberg](#r18330-distinct-unramified-residual-roots-exclude-steinberg) to exclude the unwanted Steinberg branch at Q and obtain the characteristic-zero isomorphism and equal ranks. Use the residual [R18.3.9 Definite Ihara degeneracy map](#r1839-definite-ihara-degeneracy-map) theorem (KW Lemma 7.1) as in KW Corollary 7.5 to prove integral surjectivity. Take the `Δ_Q`-equivariant direct factor and prove the coinvariant/rank comparison.

(Source: [KW09](#references) §7.4, construction of `ξ_v` and Corollary 7.5 with proof, pp.65–66.)

*Needs:* [R18.3.14 Integral diamond freeness](#r18314-integral-diamond-freeness), [R18.3.9 Definite Ihara degeneracy map](#r1839-definite-ihara-degeneracy-map), [R18.3.29 Early rank-two eigensystem realisation and local compatibility](#r18329-early-rank-two-eigensystem-realisation-and-local-compatibility), [R18.3.30 Distinct unramified residual roots exclude Steinberg](#r18330-distinct-unramified-residual-roots-exclude-steinberg), [R18.3.28 Unramified Iwahori root and degeneracy normalisation](#r18328-unramified-iwahori-root-and-degeneracy-normalisation), [R18.3.22 Definite Jacquet–Langlands realization](#r18322-definite-jacquetlanglands-realization), [R18.3.6 Split Hecke normalization](#r1836-split-hecke-normalization).

### R18.3.32 Fixed ramified signs throughout a localized eigensystem

**Theorem** (`ramifiedSign_independentOfEigenform`). Assume the early Galois/local compatibility target. At each finite `v∈Σ`, with `U_v=O_Dv×` for p>2 and `U_v=D_v×` for `p=2`, the representations attached to all eigenforms in `S_{k₀,ψ}(U,O)_m` have a common unramified character `γ_v` and shape `[[ε_p γ_v,*],[0,γ_v]]`, with `γ_v²=ψ_v`. For p>2, under the residual-sign identifiability hypotheses below, the common residual system distinguishes the two square roots; for `p=2` the full division-level coefficient extension fixes the actual uniformiser eigenvalue and hence the lift. In the stated arithmetic Frobenius and right-translation conventions, `γ_v(Frob_v)` equals the eigenvalue `λ_v` of `R_Π`, where `ν_D(Π)=1`. At a full division factor `λ_v=r_v⁻¹`, so `γ_v(Frob_v)` is the inverse coefficient-action value, not the inverse of `λ_v`. The extension class need not be independent of the eigenform.

m is non-Eisenstein and is an actual acting eigensystem; all eigenforms have the common residual representation.

Parallel weight `k₀=2` if `p=2`; `Σ` is disjoint from v|p when `k₀>2`; `ψ_v` is unramified at `Σ`.

At `p=2` use full `D_v×` at every `v∈Σ`, not only those above 2, and fix the chosen central-compatible extension.

For odd p and v∤p require either `1+q_v` nonzero in k or the common residual local representation to be ramified. For v|p retain p unramified in F, so the residual cyclotomic inertia character is nontrivial.

*Proof route.* The finite local transfer identifies compact-fixed division components with unramified Steinberg twists. Apply the early compatibility target to obtain `γ_{v,f}²=ψ_v`. For odd p at v∤p, if `1+q_v` is nonzero the common residual trace `(1+q_v)γ_v(Frob_v)` distinguishes the roots. If the residual representation is ramified, its nonzero unipotent inertia has a unique invariant line, distinguishing the unramified quotient character. At v|p use the nontrivial residual cyclotomic inertia character under the unramified-field hypothesis. Opposite roots in characteristic zero have distinct reductions for odd p. For `p=2` the full division-level coefficient character `τ_r(Π)=r` fixes `R_Π=r⁻¹`. Local transfer sends that right-action character to the Steinberg twist `κ` with `κ(Nrd Π)=r⁻¹`. Arithmetic local compatibility gives `γ(Frob_v)=r⁻¹`, independently of f.

**Checks.**

- At `p=2` the two integral roots reduce equally, so residual data alone cannot fix the sign.
- Fixing `U_v=D_v×` and its coefficient character fixes the local lift even at `p=2`.
- The upper-right extension class may vary while `γ_v` is fixed.
- At `p=3, q_v≡−1, γ(Frob_v)=1` or `−1` gives the same unordered local residual pair `{1,−1}`; an unramified residual representation does not identify the sign.
- Over `ℤ₂`, for `ψ_v(Nrd Π)=9` and coefficient root `r=±1/3`, the two roots are distinct units with equal reduction. The corresponding `R_Π` eigenvalue and `γ(Frob_v)` are `±3`, whose squares are 9. Taking the inverse right-action eigenvalue would give `±1/3` and square `1/9`, contradicting `γ²=ψ`.

(Source: [KW09](#references) Lemma 7.2 and remark, pp.60–61 (Gives the level hypotheses and separates the odd-prime residual argument from the dyadic full-level argument. The uniformizer value is computed from the declared right-translation action; the residual sign inference is restricted by the hypotheses above); [Tay06](#references) Lemma 1.7(1), pp.744–745; arithmetic reciprocity convention, p.733 (For the corresponding Steinberg quotient character away from p, its arithmetic uniformizer value equals the U eigenvalue, consistent with the direct right-translation value after local transfer))

*Needs:* [R18.3.17 Division valuation and central-character extension](#r18317-division-valuation-and-central-character-extension), [R18.3.19 Finite quaternion local transfer needed by the definite comparison](#r18319-finite-quaternion-local-transfer-needed-by-the-definite-comparison), [R18.3.29 Early rank-two eigensystem realisation and local compatibility](#r18329-early-rank-two-eigensystem-realisation-and-local-compatibility), [R18.3.15 Residual quaternionic Hecke ideal](#r18315-residual-quaternionic-hecke-ideal).

### Examples

For `q≡1 mod p` the two diagonal Frobenius factors of a special representation have the same residual root, which is exactly what the distinct-root hypothesis of localized control excludes.

### Dependencies

This layer uses earlier layers R18.3, R18.4; ArithmeticGaloisRepresentations (§§1.1–1.12, §2.4); FiniteFlatGroupsAndIntegralPadicHodgeTheory (§§R07.3.0–R07.3.3, R07.4.13, R07.4.27–R07.4.28) and §R18.4.27.

## Layer R18.6: Interfaces for arithmetic applications

This layer has no targets of its own. It names what the arithmetic applications consume:

- the canonical varieties and their fields, finite levels and effective stabilizers from H1–H4 and R18.1;
- the model, Hodge-line and torsion comparisons from R18.2;
- the definite coefficient modules, their isotropy exponents, the definite Ihara lemma and the conditional auxiliary-level controls from R18.3;
- the integral coefficient cohomology, the Ihara lemma and the saturation hypotheses from R18.4, retaining `TopologicalCoefficientInput(R)` for every non-finite ordinary sheaf/singular identification and §R18.4.12's finite-cell completion comparison for nonconstant O-coefficients;
- the arithmetic Drinfeld quotient, its central-twisted right-s descent action of §R18.1.1a and the corresponding graph, monodromy and tower comparisons from R18.5; the definite class-set `HeckeFamily` of §R18.5.17a and the two-place Shimura-Jacobian torsion realization of §R18.5.18 use the shared Néron-model interfaces; at higher level retain the full unit inertia correction.

For potential modularity, use H6's selected quasi-projective component, its field of definition, its universal family and the constructed real and finite local opens. Each application carries the prime, lattice, component and level hypotheses of the construction it uses. Several things are not provided: local torsion realizability beyond the contract of §H6.5, an unconditional integral Ihara lemma, the bridge determinant comparison at places with `F_v/ℚ_p` ramified, local–global compatibility at non-discrete-series places for fields of even degree when `π` has no finite discrete-series component, a universal family on every coarse quotient, and any proof of Moret–Bailly or of modularity lifting (KW09 §§7.4–7.5, pp.63–67; ACC+23 §7.2.5, pp.1103–1106; CDN20 §§5.2.1–5.2.2, pp.40–43).

## Scope of the comparison theorems

The targets distinguish the following mathematical hypotheses and domains.

- Effective torsion-free levels are constructed by projective neatness in §R18.3.16. The prime-to-p averaging theorem §R18.3.4 uses unit stabilizer orders; it makes no additional auxiliary field-degree claim.
- The odd-prime sign inference of KW Lemma 7.2(i), p.61, fails as written when `q_v≡−1 (mod p)` at an unramified residual place, since the two signs then have the same unordered residual Frobenius data. §R18.3.32 therefore assumes `1+q_v≠0` in k, residual ramification, or the cyclotomic inertia argument above p.
- In the ordinary case of Taylor's Lemma 1.2 (p.11) the polarization module is made principal through the norm from the class group of N. The argument there uses the wide Hilbert class field of M, so it proves surjectivity onto the wide class group only; an ordered isomorphism j needs the narrow class. §H6.5 therefore adds the hypothesis (C6), which holds when N/M is ramified at some finite place. Taylor leaves Lemma 1.3 to the reader; §H6.5 (O3) supplies its route.
- The algebraic-space construction of §H2.2 is refined to a scheme by `dpHilbertModel_isScheme` (§H2.2b); every global scheme use of the DP model includes this refinement.
- The pointwise bridge extension and filtered comparison of §§R18.2.16–R18.2.18 require verified finite-local crystalline lattice descent, including the bridge tensor. The τ-part and determinant comparisons of §§R18.2.17–R18.2.18 additionally require `F_v/ℚ_p` unramified. Yuan–Zhang take τ-quotients of the Hodge pieces of H″ (p.575), which are not exact there, and H″ is not a strict `O_v`-module, so the saturated construction of §R18.2.14 does not apply. A relative filtered tensor comparison for such groups would be needed.
- The separated quotient of the formal Drinfeld curve by a discrete cocompact group, its effective finite quotients and an ample line bundle on it (§§R18.5.7, R18.5.11) are constructed here from AdicSpacesPartIII §§F0.7–F0.8, R2.2–R2.6. Basic PEL uniformisation for the auxiliary datum is constructed in §R18.5.13 using the PELModuli moduli objects.

The local targets retain these hypotheses and construct the quotients, uniformisation and patching inputs specified above.

## Downstream consumers

- **AutomorphicGaloisRepresentations** constructs Galois representations from the quaternionic models, cohomology and uniformisation (R18.2, R18.4, R18.5).
- **GL2ModularityLifting** and **SerreWeightAndLevelOptimisation** use the interfaces of R18.6: definite modules, Taylor–Wiles levels, localized control, the Ihara lemma and level raising, and the graph and monodromy comparisons.
- **PotentialModularityAndCompatibleSystems** uses the paired torsion twists with their local points (H6) for Moret–Bailly arguments, and the definite modules of R18.3. **SmallRamificationAndAbelianVarietyBaseCases** uses the interfaces of R18.6.
- **PadicFamilies** and **OrdinaryAutomorphicFormsAndModularityLifting** use the definite integral forms of R18.3.
- **HodgeTateAndCanonicalSubgroups**, **OverconvergentAutomorphicForms** and **PerfectoidShimuraVarieties** use the integral Hilbert models, Hasse ideals, polarization quotients and full levels of H1–H5.
- **HeegnerPointEulerSystems** and **GrossZagierAndArithmeticHeights** use the quaternionic curves, their integral models, Hodge line and uniformisation (R18.1–R18.5).
- **NeronModelsAndSemistableAbelianVarieties**, **CompletedCohomologyAndLocalGlobalCompatibility** and **PerfectoidShimuraVarieties** use the arithmetic Drinfeld quotient and its graphs.
- The finite-level Saito specialization of §R18.4.34 gives arithmetic applications the quaternionic coefficient realization; its model, projector and geometric comparison come from WeightsInEtaleCohomology R34.3. The shared Carayol/Saito rank-two realization and source-qualified compatibility come from R34.6 through the arithmetic adapter of §R18.3.29.
- Automorphic-bundle, compactification and height applications use the restricted Hodge-line, cusp and metric targets listed under Scope and ownership. The quaternionic transfer theory is supplied by GL2AutomorphicRepresentationsAndTransfer as recorded above.

## References

Page numbers are printed pages unless an entry says otherwise. Each source is cited at its claim by theorem, section and page.

- **[ACC+23]** Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, [Potential automorphy over CM fields](https://math.uchicago.edu/~fcale/papers/Ramanujan.pdf). Annals of Mathematics 197 (2023), 897–1113; published pagination.
- **[AIP §16]** Fabrizio Andreatta, Adrian Iovita and Vincent Pilloni, [The adic, cuspidal, Hilbert eigenvarieties](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf). Author version dated 16 May 2016.
- **[BC91]** Jean-François Boutot and Henri Carayol, [Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf). Astérisque 196–197 (1991), article pp.45–158; full-volume PDF.
- **[BHW23]** Christopher Birkbeck, Ben Heuer and Chris Williams, [Overconvergent Hilbert modular forms via perfectoid modular varieties](https://www.numdam.org/item/10.5802/aif.3560.pdf). Annales de l’Institut Fourier 73 (2023), 1709–1794; published PDF.
- **[BR10]** Ioan Alexandru Badulescu and David Renard, [Unitary Dual of GL(n) at Archimedean Places and Global Jacquet–Langlands Correspondence](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf). Author preprint dated 16 November 2009 of Compositio Mathematica 146 (2010), 1115–1164; locators use preprint pages.
- **[BZ22]** Jean-François Boutot and Thomas Zink, [On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1). arXiv:2212.06886v1, 13 December 2022 (text dated 15 December).
- **[CDN20]** Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2). arXiv:1704.08928v2, 7 June 2018; source for JAMS 33 (2020), 311–362.
- **[CDN23]** Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://arxiv.org/pdf/2204.11214). arXiv:2204.11214v2; source for Forum of Mathematics Pi 11 (2023), e16.
- **[Car86]** Henri Carayol, [Sur la mauvaise réduction des courbes de Shimura](https://www.numdam.org/item/CM_1986__59_2_151_0.pdf). Compositio Mathematica 59 (1986), 151–230; published scan.
- **[Car86a]** Henri Carayol, [Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/item/10.24033/asens.1512.pdf). Annales scientifiques de l’École Normale Supérieure, série 4, 19 (1986), 409–468; published Numdam scan.
- **[DP94]** Pierre Deligne and Georg Pappas, [Singularités des espaces de modules de Hilbert, en les caractéristiques divisant le discriminant](https://www.numdam.org/item/CM_1994__90_1_59_0.pdf). Compositio Mathematica 90 (1994), 59–79.
- **[Del80]** Pierre Deligne, [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf). Publications mathématiques de l’IHÉS 52 (1980), 137–252.
- **[Dia21]** Fred Diamond, [Geometric weight-shifting operators on Hilbert modular forms in characteristic p](https://arxiv.org/pdf/2011.14128v2). arXiv:2011.14128v2, 18 September 2021.
- **[Dim05]** Mladen Dimitrov, [Compactifications arithmétiques des variétés de Hilbert et formes modulaires de Hilbert pour Γ₁(c,𝔫)](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf). Author-hosted typeset text, printed pp.525–551.
- **[EGS15]** Matthew Emerton, Toby Gee and David Savitt, [Lattices in the cohomology of Shimura curves](https://arxiv.org/pdf/1305.1594v3). arXiv:1305.1594v3, 19 November 2014; internal pages.
- **[JL70]** Hervé Jacquet and Robert P. Langlands, [Automorphic Forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2-rpl_1.pdf). Lecture Notes in Mathematics 114 (1970); author-hosted typed reproduction.
- **[KRZ20]** Stephen Kudla, Michael Rapoport and Thomas Zink, [On the p-adic uniformization of unitary Shimura curves](https://arxiv.org/pdf/2007.05211v1). arXiv:2007.05211v1 (10 July 2020).
- **[KL05]** Mark Kisin and King Fai Lai, [Overconvergent Hilbert modular forms](http://people.math.harvard.edu/~kisin/dvifiles/hmf.dvi). American Journal of Mathematics 127 (2005), 735–783; locators use the pages of the author's version (TeX output dated 4 February 2004).
- **[Kis08]** Mark Kisin, [Potentially semi-stable deformation rings](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf). Journal of the American Mathematical Society 21 (2008), 513–546; published PDF.
- **[KW09]** Chandrashekhar Khare and Jean-Pierre Wintenberger, [Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf). Author copy proofs.pdf, 98 pages, dated 30 May 2009; published Inventiones 178 (2009), 505–586.
- **[Kur79]** Akira Kurihara, [On some examples of equations defining Shimura curves and the Mumford uniformization](https://repository.dl.itc.u-tokyo.ac.jp/record/39680/files/jfs250303.pdf). Journal of the Faculty of Science, University of Tokyo, Section IA 25 (1979), 277–300; published scan.
- **[MS19]** Jeffrey Manning and Jack Shotton, [Ihara’s lemma for Shimura curves over totally real fields via patching](https://arxiv.org/pdf/1907.06043v2). arXiv:1907.06043v2, 27 July 2020; internal pages 1–40.
- **[NT16]** James Newton and Jack A. Thorne, [Torsion Galois representations over CM fields and Hecke algebras in the derived category](https://arxiv.org/pdf/1511.04913v1). Forum of Mathematics, Sigma 4 (2016), e21; locators use arXiv:1511.04913v1, internal pages.
- **[Mil]** James S. Milne, [Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf). Version 2.21, 22 March 2013.
- **[PRR23]** Vladimir Platonov, Andrei Rapinchuk and Igor Rapinchuk, [Algebraic Groups and Number Theory, Volume 1](https://doi.org/10.1017/9781139017756.004). Second edition, Cambridge Studies in Advanced Mathematics 205 (2023).
- **[Rap78]** Michael Rapoport, [Compactifications de l’espace de modules de Hilbert–Blumenthal](https://www.numdam.org/item/CM_1978__36_3_255_0.pdf). Compositio Mathematica 36 (1978), 255–335.
- **[Sai09]** Takeshi Saito, [Hilbert modular forms and p-adic Hodge theory](https://arxiv.org/pdf/math/0612077v2). arXiv:math/0612077v2, 11 December 2006; internal pages.
- **[Tay02]** Richard Taylor, [Remarks on a conjecture of Fontaine and Mazur](https://virtualmath1.stanford.edu/~rltaylor/fm.pdf). Journal of the Institute of Mathematics of Jussieu 1(1) (2002), 125–143. Roadmap locators use the linked author's internal pagination.
- **[Tay06]** Richard Taylor, [On the Meromorphic Extension of Degree Two L-Functions](https://ems.press/content/book-chapter-files/27484?nt=1). Documenta Mathematica Extra Volume Coates (2006), 729–779; revised 28 June 2006.
- **[Tay89]** Richard Taylor, [On Galois representations associated to Hilbert modular forms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0098/LOG_0019.pdf). Inventiones Mathematicae 98 (1989), 265–280; GDZ scan of the published article.
- **[Zha14]** Wei Zhang, [Selmer groups and the indivisibility of Heegner points](https://intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a001.pdf). Cambridge Journal of Mathematics 2 (2014), 191–253; §§3.4, 6.3.
- **[YZ18]** Xinyi Yuan and Shou-Wu Zhang, [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf). Annals of Mathematics 187 (2018), 533–638; published PDF.
