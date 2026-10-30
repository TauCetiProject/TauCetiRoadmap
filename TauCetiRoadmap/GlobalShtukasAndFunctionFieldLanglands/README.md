# Roadmap: global shtukas and Langlands over function fields

**Summary.** Let X be a smooth projective geometrically connected curve over a finite field F_q, with function field F, and let G be a connected reductive group over F. This roadmap constructs the moduli stacks of G-bundles on X with level structure, the Beilinson–Drinfeld Grassmannians and Hecke stacks over the powers X^I, and the stacks of G-shtukas with any finite set of legs, together with their ℓ-adic cohomology with rational, integral and torsion coefficients. From the geometric Satake equivalence over finite fields, partial Frobenius and Drinfeld's lemma it builds excursion operators on the space of cuspidal automorphic functions and proves V. Lafforgue's theorem: the cusp space of every level decomposes canonically, compatibly with all Hecke operators, along semisimple global Langlands parameters σ : Gal(F̄/F) → ᴸG(Q̄_ℓ), and at every good place the spherical Hecke operators act through the Satake parameter of σ(Frob_v) (VL, Theorems 11.11 and 12.3). It adds Xue's theorems on the integral finiteness, Weil descent and ind-smoothness of the cohomology of shtukas; the modular (mod ℓ) version of the decomposition; Yun–Zhang's PGL₂ shtukas with fractional infinity and the Eisenstein decomposition of their middle cohomology; and Genestier–Lafforgue's local parameterization, which attaches a semisimple parameter to every irreducible smooth representation over a local function field through the completed Bernstein centre and proves local–global compatibility up to semisimplification at every place, with local gamma factors. For GL_r it builds on L. Lafforgue's global correspondence, which AutomorphicLFunctionsAndLocalFactors provides, to remove the finite-determinant hypothesis, to construct ℓ-adic companions on curves and to identify the two constructions of parameters.

## Scope and ownership

This roadmap owns, for a global function field F = F_q(X) and a connected reductive group G over F:

- the stack of 𝒢-bundles for a smooth affine model 𝒢 with connected fibres, with full level structures, Iwahori flags and fractional twists; Harder–Narasimhan data for coherent sheaves and G-bundles, with the shifted and the parabolic PGL₂ variants; the adelic description of the F_q-points, central lattices, orbit masses, the mass formulas for bundles and torsion sheaves, and the interface with cuspidal automorphic functions (Layer 0);
- the Beilinson–Drinfeld Grassmannian over X^I, Schubert bounds, global and Iwahori Hecke stacks, ℓ-adic sheaves on algebraic stacks of finite type, fusion, the classical (equal-characteristic, finite-field, ℓ-adic) geometric Satake equivalence with its sign and Tate normalizations, nonsplit descent through the L-group, its comparison with spherical functions and the integral version (Layer 1);
- the stacks of global shtukas, their truncations and local models, their cohomology sheaves in all degrees, partial Frobenius, coalescence of legs and Hecke correspondences, including Yun–Zhang's fractional-infinity shtukas and the PGL₂ horocycles (Layer 2);
- creation and annihilation of legs, the Eichler–Shimura relation, Hecke finiteness, cuspidal cohomology and its integral finiteness, finiteness over one local Hecke algebra, and the PGL₂ Eisenstein decomposition (Layer 3);
- Drinfeld's lemma, the Frobenius–Weil group, the product Galois action on Hecke-finite cohomology, the functors `H_{I,W}`, Weil descent and ind-smoothness of the full cohomology (Layer 4);
- global excursion operators and V. Lafforgue's decomposition, with its nonsplit, integral and modular versions (Layer 5);
- constant twists and companions on curves, and the comparison of excursion parameters with the GL_r correspondence (Layer 6);
- restricted shtukas, nearby cycles over higher-dimensional bases, local excursion elements, the Genestier–Lafforgue parameterization, local–global compatibility, local gamma factors and the GL_r comparison with monodromy at every place (Layer 7).

Its boundaries with neighbouring roadmaps are as follows.

- **AutomorphicLFunctionsAndLocalFactors §AL.3** (section *Curve arithmetic and the unramified pure realization*) owns L. Lafforgue's proof of the global Langlands correspondence for GL_r over F at every level: slopes, HN filtrations, their semicontinuity and the bounded loci of vector bundles on X; two-leg Drinfeld shtukas with and without level, their truncations and compactifications; lower-rank counting with a leg in the level; normalized intersection-complex purity and the essential comparison; the negligible-constituent criterion, essential cohomology and the counting comparison through the truncated trace formula; rank-one reciprocity with and without ramification; the function-field converse theorem and strong multiplicity one; and the induction on the rank, with all-place pair factors and temperedness. Layers 6 and 7 use that theorem and restate none of it. The G-bundle HN theory of Layer 0 agrees with AL.3 on vector bundles, and the stack description of rank-one shtukas in Layer 0 is what the horocycle computations here need. §2.1 owns the equivalence of its two-leg GL_r specialization with AL.3’s two-leg carriers, including full levels and their operations; §§2.2 and 2.5 compare the truncation systems and compact-support colimits. The two-leg compactifications and essential-cohomology theory remain in AL.3.
- **EndoscopicTransferAndUnitaryTraceComparison** §3.1 constructs Bun_G for a quasi-split group scheme that is reductive over all of X, and §3.2 the equal-characteristic local loop Grassmannian LG/L⁺G. [§0.1 *Bundles on the global curve*](#01-bundles-on-the-global-curve) extends the first to models that are reductive only over an open U, and [§1.1 *Beilinson–Drinfeld Grassmannians*](#11-beilinsondrinfeld-grassmannians) builds the multi-leg Grassmannian whose fibre over a point is the second.
- **FunctionFieldArithmetic** owns the arithmetic of F over F_q used here: divisor classes and Picard points (FunctionFieldArithmetic §0.3), self-dual volumes of a differential (FunctionFieldArithmetic §2.2), the zeta function (FunctionFieldArithmetic §§5.1 and 5.3), degree-sensitive Chebotarev (FunctionFieldArithmetic §5.8), and the adelic points, automorphic function modules, constant terms, cusp modules and Harder's finiteness theorem for every connected reductive group and every compact open level (FunctionFieldArithmetic §§6.1–6.4). **ArithmeticGaloisDuality** §R02.3.2 owns the ideles, the idele class group and the class formation of F with its Brauer sequence; AutomorphicLFunctionsAndLocalFactors §AL.3, *Curve additive analysis*, owns the completion-valued adeles, the residue character of a differential and the self-dual measures. **AlgebraicCurves** owns function fields of curves, places, divisors and Riemann–Roch; **JacobianChallenge** owns the Picard functor, the Jacobian and the Abel–Jacobi map; **AlgebraicVectorBundles** owns finite locally free sheaves; **SchemeAndStackFoundations** owns algebraic spaces and stacks, torsors, descent, deformation theory and Quot schemes; **ReductiveGroups** and **ReductiveGroupsPartII** own reductive groups, root data, dual groups and L-groups.
- **EtaleCohomologyFoundations** and **EtaleDualityAndPerverseSheaves** own étale cohomology of schemes: constructible coefficients, base change, duality, perverse sheaves, weights, cohomological correspondences and their trace formulas; **DeligneWeightsAndPurity** owns weights and purity. DeligneWeightsAndPurity §8.24 supplies rational étale cohomology of finite-type Deligne–Mumford stacks over F_q; [§1.4 *ℓ-adic sheaves on stacks of finite type*](#14-ℓ-adic-sheaves-on-stacks-of-finite-type) extends the operations this roadmap needs to stacks of finite type. **ClassicalAdicEtaleCohomology** §5.4 owns general oriented products and the Orgogozo modification theorem, and **LefschetzPencilsAndVanishingCycles** owns nearby cycles over a henselian trait; their application to restricted shtukas is [§7.3 *Nearby cycles over higher-dimensional bases*](#73-nearby-cycles-over-higher-dimensional-bases).
- **LanglandsParameterStacks** owns excursion algebras, excursion data and the reconstruction of parameters from their pseudocharacters for an arbitrary group; this roadmap verifies the hypotheses on the cohomology of shtukas and proves continuity for the global Galois group. **IntegralHeckeAndGaloisDeterminants** owns determinants and their reconstruction.
- **SmoothRepresentationsOfLocalGroups** owns Hecke algebras over rings, the Bernstein centre, parabolic induction, the classical Satake isomorphism, the segment/multisegment constructions with their Z/L conventions (§SR.5.2, *segment-representations*) and the public classical correspondence rec over every nonarchimedean local field (§SR.5.2, *classical-llc-normalization*). §7.11 supplies the independent equal-characteristic construction and its identification with this same rec after coefficient transport and the arithmetic/geometric reciprocity comparison; it transports the segments from ℂ to Q̄_ℓ and identifies their special Weil–Deligne blocks.
- **ArithmeticGaloisRepresentations** §§2.5–2.7 owns local Euler factors and local constants in its finite-extension-of-Q_p setting. The equal-characteristic local constants and function-field product formula are supplied by **AutomorphicLFunctionsAndLocalFactors** §AL.3, *Function-field local factors, multiplicity one and converse theorem*. §7.10 uses that prefix to construct gamma factors for reductive groups.
- **GeometricSatakeAndFusion** GS0, *Equal-characteristic Schubert models and coefficient comparison* (`equalCharacteristicSchubertModels`), owns the ordinary local reduced Schubert models, their positive-loop strata, Bruhat closures and finite-jet action comparisons, before taking their perfections. §1.2 transports these same ordinary models over the curve and constructs the reduced multi-leg collision closures. GeometricSatakeAndFusion also owns geometric Satake for the B_dR-Grassmannian over the Fargues–Fontaine curve; the classical equal-characteristic equivalence is Layer 1 here. **HeckeStacksAndLocalShtukas** §§HS2.9 and HS3.1–HS3.2 owns the local-shtuka towers, their Satake coefficients and completed compact-support complexes; comparison of those complexes with this roadmap’s restricted-shtuka construction is not an input here. The comparison between completed and ordinary Bernstein centres is §7.6, and the equal-characteristic construction and comparison with the shared classical GL_r correspondence, including its extension through segments, is §7.11. The generic smooth-category and centre carriers remain those of SmoothRepresentationsOfLocalGroups.
- **SheafTheoreticSmithTheory** §§ST.3 and ST.6 extends the finite-extension coefficient setting of §1.14 to coefficients F̄_ℓ and W(F̄_ℓ), for odd ℓ, over arbitrary separably closed geometric fields, and owns its parity–tilting and normalized constant-term comparisons. The integral and torsion Satake functors over O_E and its quotients on the curve Grassmannians are §1.14 here; the larger adic coefficient ring and Smith-theoretic comparisons are not inputs to that construction.
- The elliptic-sheaf carrier and its comparison with one-leg shtukas belong to §2.7. Generic coherent moduli remain those of AlgebraicModuliForArithmeticGeometry; DrinfeldModulesAndTModules consumes this carrier and owns the Drinfeld-module theory. The unramified local Satake comparison is §5.9 for split groups and §5.10 for nonsplit groups; Layer 7 consumes those statements directly. The function-field SL_r volume and its Tamagawa normalization belong to §0.13; the number-field measure and reduction theory of AdelicAlgebraicGroups is not a function-field volume theorem.
- Drinfeld's companions on smooth varieties of higher dimension are not part of this roadmap.

## Conventions

Throughout, k = F_q has characteristic p and X/k is a smooth projective geometrically connected curve of genus g, with function field F, adele ring A, completions F_v with integers O_v and residue fields κ_v of size q_v = `q^{deg v}`. The generic group G/F is connected reductive, with a chosen smooth affine model 𝒢 over X with connected fibres, reductive over a nonempty open U ⊂ X; the constant split case comes first, and every nonsplit statement says how it descends. A **level** N is a finite closed subscheme of X, nilpotents included; a parabolic or Iwahori flag at a point is different data. A central lattice Ξ ⊂ Z(F)\Z(A) is a discrete subgroup that controls the degree directions detected by F-rational characters (for GL_n, the powers a^Z of an idele a of nonzero degree).

For sheaves, ℓ ≠ p and E is a finite extension of Q_ℓ, large enough for the representations in use, with integers O_E and uniformizer λ; a torsion coefficient ring is O_E/λ^s for a stated integer s ≥ 1. All ranks n used in GL_n, flags and fractional twists satisfy n ≥ 1; the zero group is treated as G=1, not as an elliptic sheaf of rank zero. Schemes and stacks are taken in fixed universes, with the categories of all test schemes and their Ind-categories in a larger universe; no finite-type assertion includes arbitrary-sized disjoint unions. Frob_v denotes a geometric Frobenius element at v, the inverse of arithmetic Frobenius, and traces in the sheaf–function dictionary are traces of geometric Frobenius. Class field theory is normalized so that the arithmetic Artin map sends a uniformizer to arithmetic Frobenius; a rank-one automorphic character χ then corresponds to the Galois character whose geometric-Frobenius value at v is χ(π_v), that is, χ(a) = ρ(Art(a)⁻¹), as in AL.3. For coefficient transport fix a field isomorphism ι:Q̄_ℓ≃ℂ and choose √q as the inverse image of the positive complex square root. Half Tate twists use this choice, with `sqrt(q_v)=sqrt(q)^(deg v)` at a place of degree deg v. For nonsplit G, ᴸG = Ĝ ⋊ Gal(F̃/F) is the finite form of the L-group attached to the fixed field F̃ of the kernel of the pinned Galois action on the full based root datum; Q=Gal(F̃/F) is unramified over U since G extends reductively there. The finite étale cover attached to Q trivializes the pinned outer action. Trivializations of the reductive model use an étale cover of U, with inner transition maps retained; no finite étale cover trivializing the model is assumed. Parameters valued in ᴸG carry the prescribed projection to Gal(F̃/F). For a good place v, fix a decomposition-group embedding and put Q_v=im(Γ_v→Q) and ᴸG_v=Ĝ⋊Q_v; Q_v is cyclic, generated by the image of geometric Frob_v. Spherical Hecke algebras use the Haar measure with vol(G(O_v)) = 1; the normalized spherical function `h_{V,v}` differs from the trace of the perverse Satake sheaf by the sign `(−1)^{⟨2ρ,ω⟩}` of the orbit dimension. Additive local factors use the additive character of a global differential and the corresponding self-dual measures (AutomorphicLFunctionsAndLocalFactors §AL.3, *Curve additive analysis*; FunctionFieldArithmetic §2.2).

In a shtuka, τ is pullback along id_X × Frob_S. The ordered partition of the legs and the bound on each modification are part of the data. A fixed HN bound is not invariant under Hecke operators or partial Frobenius: these maps may increase the bound, so they act on the directed system of truncations. The groupoid of F_q-points of a stack keeps its automorphisms and, for nonsplit G, its components indexed by the pure inner forms. Write Pic_X for the Picard scheme and 𝒫_X for the Picard stack of line bundles and their isomorphisms. Thus Pic_X(F_q) is the ordinary group of line-bundle classes, whereas 𝒫_X(F_q) is the tensor groupoid with scalar arrows; group algebras use the former and the Picard quotient of shtukas uses the latter.

Three finiteness conditions are kept apart. A vector is **Hecke-finite** when it lies in a finitely generated O_E-submodule stable under every integral Hecke operator. The full cohomology can be a finite module over one local Hecke algebra while being infinite over O_E. The untruncated cohomology ind-sheaf can be ind-smooth without being one lisse sheaf of finite rank. Likewise, the excursion decomposition is by generalized eigenspaces; reducedness of the excursion algebra is not asserted. The spherical Hecke operators act by scalars on each block in the characteristic-zero theorem, by a separate adjointness argument; in the modular theory they have generalized eigenvalues.

Sources are cited by the abbreviations of the References: VL (V. Lafforgue), LL (L. Lafforgue), GeL (Genestier–Lafforgue), YZ (Yun–Zhang), Xue-I and Xue-S (Xue's papers on integral coefficients and on smoothness), MV (Mirković–Vilonen), Ric (Richarz), LO-I, LO-II and LO-P (Laszlo–Olsson), and others as listed there. Locators refer to the versions listed in the References.

**Checks.**

- For G_m at a degree-one place, take an unramified character with χ(ϖ)=2 and ℓ=5. Geometric Frobenius acts by 2 and arithmetic Frobenius by 1/2; for a degree-two constant-field Frobenius the values are 4 and 1/4. Reversing Artin inversion would exchange these values.
- At q=3 the GL₂ standard minuscule IC has geometric-Frobenius trace −1/√3 and its normalized Hecke function has value +1/√3; for a torus the orbit dimension is 0 and the correction is +1. Applying the GL₂ correction twice gives (−1)²=1, as the parity rule requires.
- At q=9 the chosen √q is 3, and at a degree-two place √q_v=9. A field isomorphism fixes these rational numbers; choosing −3 could not transport to the positive complex root. At q=3 a degree-two place likewise has √q_v=3, not √3.
- At ℓ=2 and p=3 the torsion coefficient O_E/λ is nonzero and 3 is a unit, whereas s=0 would give the zero ring and is excluded. A finite field has q≥2; q=1 would make the mass denominator q−1 vanish and is outside the convention.

## Exact supplier contracts

### From Mathlib

Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` (with Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`):

- `AlgebraicGeometry.Scheme`: schemes, in which X, the Grassmannians and the bounded shtuka charts live (`Mathlib/AlgebraicGeometry/Scheme.lean`). The scheme structure is a locally ringed space locally isomorphic to affine spectra; smoothness, separatedness, finite type and nonemptiness are separate hypotheses. The generic stack carrier is supplied by SchemeAndStackFoundations Layer 1.
- `CategoryTheory.Pseudofunctor.DescentData` and `CategoryTheory.Pseudofunctor.IsStack`: descent data for a pseudofunctor and effective descent on a site. They give no algebraicity, representable diagonal or atlas; those are SchemeAndStackFoundations Layer 1.
- `CategoryTheory.GaloisCategory`: the axioms of a category admitting a fibre functor to finite sets (`Mathlib/CategoryTheory/Galois/Basic.lean`). The class asserts existence, not a chosen fibre functor or a chosen geometric basepoint; those choices remain explicit here. The recognition of finite étale covers of a scheme as a Galois category is EtaleCohomologyFoundations §F.0.2.
- `ExteriorAlgebra`, `LinearMap.charpoly` and `LinearMap.aeval_self_charpoly` (Cayley–Hamilton for endomorphisms of finite free modules): the linear algebra behind the Eichler–Shimura relation. No endomorphism of the unbounded cohomology is assumed to be of finite rank.
- `Submodule.FG` and `Module.Finite`: finitely generated submodules, in which Hecke finiteness is stated.
- `Algebra.adjoin`, `Module.End.genEigenspace`, `Module.End.iSup_maxGenEigenspace_eq_top` and `Module.End.iSup_iInf_maxGenEigenspace_eq_top_of_iSup_maxGenEigenspace_eq_top_of_commute`: the algebra generated by a family of endomorphisms and the simultaneous generalized-eigenspace decomposition of a commuting family over an algebraically closed field, used for the excursion algebra.
- `CategoryTheory.Ind`, `CategoryTheory.ObjectProperty.IsSerreClass` and `CategoryTheory.ObjectProperty.isoModSerre`: Ind-objects, the Serre-class predicate and the class of morphisms whose kernel and cokernel belong to a chosen Serre class. Layer 3 constructs the localization and establishes its properties for the calculus modulo constructible objects.

### From Tau Ceti

- `TauCeti.FGPointRepresentationCat` and `TauCeti.fgPointRepresentationCategoryEquivalence` (`TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean`): finitely generated representations of the affine group of a commutative Hopf algebra, and their equivalence with finitely generated comodules. Over the coefficient field E these are the finite-dimensional algebraic representations Rep_E(Ĝ) on the representation side of geometric Satake; the geometric side (affine Grassmannians, perverse sheaves on them, convolution and the fibre functor) is absent at the pin.

### From TauCetiRoadmap.ReductiveGroups

Layer 0 (functor of points of a Hopf algebra), Layer 1 (representations as comodules, rigid monoidal), Layer 3 (fppf quotients), Layer 4 (diagonalizable and multiplicative-type groups and their character modules), Layer 6 (central isogenies), Layer 7 (Borel subgroups, maximal tori, parabolics, root data and Weyl groups), Layers 8–9 (classification by root data, pinned Chevalley–Demazure groups).

### From TauCetiRoadmap.SchemeAndStackFoundations

Layer 1, §§1.1 (descent of quasi-coherent modules), 1.15–1.16 (torsors and contracted products), 1.18–1.21 (stacks in groupoids, algebraic and Deligne–Mumford stacks, inertia, quotient stacks); Layer 3 (curves, divisors and Picard objects), especially §3.7 (`picardStack`, `aut_eq_units`, `toPicardSheaf`, `isGerbe`, `tensor`, `baseChange`); Layer 4, §§4.1 and 4.3–4.5 (thickenings, torsors of lifts, deformation functors, obstruction theories) and §4.14 (Hilbert and Quot schemes).

### From TauCetiRoadmap.EtaleCohomologyFoundations

§§F.0.1–F.0.3 (constructible étale sheaves, finite étale Galois categories and the étale fundamental groupoid, Tate twists), §F.1 (bounded constructible and ctf categories), §§F.2.1–F.2.7 (proper and smooth base change, local and universal local acyclicity, Rf_! and compact support, Künneth), §F.8 (perverse t-structures over a field), §§F.10.1–F.10.5 (finite-field descent, Frobenius comparison, traces) and §§G.1–G.3 (compactifications). These are scheme statements.

### From TauCetiRoadmap.AlgebraicVectorBundles

Layers L0A–L2B (module sheaves, finite locally free sheaves, symmetric and exterior powers, relative Spec, geometric vector bundles).

### From TauCetiRoadmap.AlgebraicCurves

function fields, places, divisors, Riemann–Roch and the function-field/curve dictionary (Layers 0–5 and 12).

### From TauCetiRoadmap.JacobianChallenge

Layer D (the relative Picard functor and the Jacobian) and Layer F (the Abel–Jacobi map).

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

§AL.3, section *Curve arithmetic and the unramified pure realization*: the targets *Curve additive analysis* (the completion-valued adeles with integral-volume-one Haar measure, their idele and Picard comparisons, compact rational unipotent quotients with integration in stages, the residue character of a differential with conductor degree 2g − 2, and the self-dual measures), *Curve bundle slopes and Harder–Narasimhan filtrations*, *Harder–Narasimhan polygon semicontinuity*, *Bounded curve-bundle loci and shtuka truncations*, *Rank-one unramified reciprocity*, *Ramified rank-one curve reciprocity*, *Function-field local factors, multiplicity one and converse theorem*, *Two-leg unramified shtukas*, *Shtuka intersection cohomology and essential comparison*, *Essential cohomology and local factors*, *Leveled shtukas and ramified rank induction* and its unramified pure realization theorem. Assumed: the GL_r correspondence for cuspidal representations with finite-order central character at every level, with matching of good-place Frobenius polynomials and of ramification, all-place L- and ε-factors of pairs, temperedness and purity of weight zero, and multiplicity one and strong multiplicity one. The local-factor prefix independently constructs equal-characteristic Artin local constants, their norm-twist and highly ramified-twist laws, and the function-field product formula; Layer 7 consumes this prefix, not the mixed-characteristic epsilon theorem of ArithmeticGaloisRepresentations §2.7. The two-leg inputs to §2.1 are `TwoLegShtuka`, its base-change, leg, central-translation, Hecke and partial-Frobenius interfaces, and the compatible full D-trivializations of *Leveled shtukas and ramified rank induction*. The bounded-locus targets supply the modified-bundle polygon truncations compared in §2.2; they are not identified with the source-bundle HN bounds.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§3.1 (`CurveBundles`, the stack of torsors under a quasi-split reductive group scheme over X, with descent, universal torsor and algebraicity) and §3.2 (`LocalLoopGrassmannian`, the fpqc quotient LG/L⁺G over any base field).

### From TauCetiRoadmap.EtaleDualityAndPerverseSheaves

§0.5 (global Verdier and Poincaré duality), §1.3 (the étale cycle class map), Layer 2 (abstract hearts, the perverse t-structure with torsion coefficients §2.4, the integral perversity and Verdier duality §§2.3–2.5, intermediate extensions and intersection complexes §§2.8–2.10, small and semismall maps §2.12), Layer 5 (mixed perverse sheaves, purity of intersection complexes §5.3, decomposition §5.6), Layer 6 (correspondences §§6.1–6.2, the Lefschetz–Verdier formula §6.3, contracting correspondences and the Fujiwara–Varshavsky formula §6.5). All are for schemes of finite type.

### From TauCetiRoadmap.ClassicalAdicEtaleCohomology

§5.4, OrientedEtaleProduct with its projections, specialization, base change, enough points, shreds and stalk comparison; OrientedNearbyCycles.modificationBaseChange for a coherent irreducible base, finitely presented map and bounded constructible invertible-torsion coefficients. Stack descent uses §1.4.

### From TauCetiRoadmap.DeligneWeightsAndPurity

DWP.0 (§0.12 weights under a finite extension of the base field, §0.15 twists and Tate twists), §5.5 (finite geometric monodromy of rank-one ℓ-adic Weil representations, and finite determinant after a rank-one Weil twist of an irreducible system), DWP.7 (§7.8 weights of R^i f_!, §7.12 weight bounds and purity of the image, §7.15 purity for proper smooth varieties), §8.24 (`dmStack_etaleCohomology`: the rational constructible étale coefficients and cohomology of a finite-type Deligne–Mumford stack over F_q, with its atlas, refinement, pullback, Frobenius and finiteness API).

### From TauCetiRoadmap.FunctionFieldArithmetic

§0.3 (`Cl(F) ≅ Pic(X) ≅ Pic_{X/k}(k)` compatibly with degree, and `Cl⁰(F) ≅ J(k)`), §2.2 (the self-dual measure of a differential and its volumes), §§5.1 and 5.3 (the zeta series with its Euler product and point counts; its rationality), §5.8 (for a finite Galois extension of F, every conjugacy class occurs as arithmetic Frobenius at unramified places of every sufficiently large degree compatible with the constant-field congruence, and at no place of incompatible degree), §§6.1–6.4 (adelic points G(A) of affine groups with G(F) discrete and finite stabilizers; the automorphic function modules of level U modulo a central lattice Ξ with their Hecke action; constant terms and the cusp module when p is invertible in the coefficients; function-field reduction and the uniform finite support and finite generation of cusp forms for every connected reductive G, every compact open U and every Noetherian coefficient ring in which p is invertible, nonsplit and anisotropic groups included). Assumed of Ξ: the double quotient `Z(F)\Z(A)/((Z(A)∩U)Ξ)` is finite, as in §6.2.

### From TauCetiRoadmap.ArithmeticGaloisDuality

§R02.3.2, *Function-field places, ideles and S-units* (`GlobalFunctionField.ideles`, the idele class group, `ideleDegree` with `ideleDegree_surjective` and `compactSpace_ideleClassGroup_degree_zero`) and *The class formation of a global function field* (`GlobalFunctionField.classFormation`: the exact sequence `0 → Br(F) → ⊕_v Br(F_v) → Q/Z → 0` whose last map is the sum of the local invariants, and reciprocity compatible with local reciprocity).

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

§§6.1–6.2 (neutral fibre data over a field, finite reconstruction, and the reconstructed affine group with its antipode and the symmetric monoidal equivalence with its finite-dimensional representations).

### From TauCetiRoadmap.LanglandsParameterStacks

§LP0.1 (restriction and functoriality of crossed cocycles), §LP1.11 (Weil–Deligne parameters), §§LP2e.9–LP2e.14 (excursion algebras of an arbitrary group over a finite quotient, the universal excursion relations, excursion data and excursion matrix coefficients), §§LP2c.1–LP2c.4 (pseudocharacters with prescribed finite projection, reconstruction for an arbitrary group and groups with reductive identity component, Weil continuity). Assumed: reconstruction of a G-completely reducible representation from a pseudocharacter over an algebraically closed field, for an arbitrary group, unique up to conjugacy.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

IHG.0 (*A determinant is determined by its trace when d! is invertible*) and IHG.1 (*Semisimple reconstruction of field determinants*).

### From TauCetiRoadmap.ReductiveGroupsPartII

§RG2.3.7, *lang-theorem* (surjectivity of x↦x⁻¹Frob_q(x) for a smooth geometrically connected finite-type group over F_q, and H¹(F_q,H)=1); §§RG2.5.1–RG2.5.2 (the dual group with its Galois action, and the L-group).

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

§SR.0.4 (admissibility, characters, coefficients and the centre), §SR.1.3 (the Λ-linear Bernstein centre through Hecke corners), §§SR.2.1–SR.2.2 (induction, Jacquet functors and parabolic induction), §SR.3.2 (the Bernstein decomposition and centre), §SR.4.1 (the Satake transform and the classical Satake isomorphism, over `Z[q^{-1}]` and after adjoining a square root of q); §SR.3.1 (cuspidal support and finite length); §SR.5.2, *segment-representations* (over ℂ and a general nonarchimedean local field, segments, multisegments, standard modules and their distinct subrepresentation Z and quotient L conventions), *wd-raw-parameters*, *wd-parameter-operations* and *wd-frobenius-semisimplification* (Weil–Deligne carriers, duals, scalar extension and Frobenius semisimplification, retaining monodromy); *classical-llc-normalization* (the public correspondence rec, from Frobenius-semisimple complex Weil–Deligne parameters to irreducible smooth representations over every nonarchimedean local field, with arithmetic reciprocity and its determinant/central-character normalization). Its correspondence interface is shared; the proof route in §7.11 uses AL.3 independently.

### From TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

Layer LPV.0: nearby and vanishing cycles over a henselian trait.

### From TauCetiRoadmap.RelativeFarguesFontaine

§6.5: the Beauville–Laszlo theorem for modules.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

§1.3: coherent Grassmannians, the Plücker embedding and partial flag bundles.

### From TauCetiRoadmap.GeometricSatakeAndFusion

GS0, *Equal-characteristic Schubert models and coefficient comparison* (`equalCharacteristicSchubertModels`): the ordinary finite-dimensional reduced Schubert schemes for equal-characteristic loop and parahoric quotients, their positive-loop strata and Bruhat closure relations, and their finite-jet action comparisons. Use the ordinary schemes before perfection, including the ordinary GL₂ minuscule model P¹; the multi-leg curve family and its collision closure are §1.2.

## How to read the build

Layer 0 builds Bun_𝒢 with its level structures, flags and HN data, and identifies its F_q-points with adelic double cosets. Layer 1 builds the Beilinson–Drinfeld Grassmannian and Hecke stacks, extends ℓ-adic sheaf theory to the stacks that occur, and proves the geometric Satake equivalence over finite fields with its global, nonsplit and integral variants. Layer 2 constructs shtukas as Hecke stacks pulled back along Frobenius, with their cohomology sheaves, partial Frobenius, coalescence and Hecke operators. Layer 3 controls this cohomology: creation and annihilation, the Eichler–Shimura relation, Hecke finiteness and cuspidality, and the PGL₂ boundary analysis. Layer 4 proves Drinfeld's lemma and constructs the product Galois actions. Layer 5 builds excursion operators and proves the global decomposition. Layer 6 adds constant twists, companions and the GL_r comparison on top of AL.3. Layer 7 constructs the local parameterization and proves the comparisons at every place.

Each target states its hypotheses, sources, API and Checks. Suggested.lean lists the geometric headline theorems and the carriers they lack at the pins. Numerical Checks and abstract algebraic API remain in this README; they are not substitute acceptance theorems.

## Layer 0: bundles, levels and adelic geometry

This layer builds the moduli of bundles on the curve and its adelic description. Three distinctions run through it: a full level structure (a trivialization on a finite subscheme that keeps its nilpotents) is different data from an Iwahori flag; a weighted stack volume is different from an unweighted count of isomorphism classes; and Harder–Narasimhan instability, measured in the adjoint group, does not bound geometric central components. Faithful-representation bounds exhaust the bundle stack; central lattices control rational degree directions, while finite type of adjoint-bounded shtuka quotients also uses Frobenius closure.

Standing hypotheses for this layer: X is a smooth projective geometrically connected curve over k = F_q with function field F; the generic group G/F is connected reductive with a chosen smooth affine model 𝒢/X with connected fibres, reductive over a nonempty open U (split statements use the constant split model); bundle statements are over arbitrary k-schemes S. The Iwahori and shifted-HN targets are stated for GL_n or PGL_2, as indicated.

### 0.1 Bundles on the global curve

Define BunG. For X/F_q smooth projective geometrically connected and a smooth affine model 𝒢/X with connected fibres and reductive generic fibre G, Bun_𝒢(S) is the groupoid of fppf-locally trivial 𝒢-torsors on X×S and equivariant isomorphisms. It is an Artin stack locally of finite type with affine diagonal. Its geometric stabilizers are affine finite-type group schemes; stabilizers of rational objects have finitely many F_q-points.

*Construction.* Use effective fppf descent for torsors, including descent of arrows. For GL_n use the finite locally free sheaves of AlgebraicVectorBundles and bounded Quot charts; for the smooth model use a faithful representation and reductions of structure group. Represent the isomorphism sheaf by sections of the associated affine bundle, and use properness of X and finite presentation for the diagonal and stabilizer assertions.

*Remark.* Keep the stack, its groupoid of F_q-points and its set of isomorphism classes distinct.

*Remark.* GL_n-torsors recover the rank-n vector bundles of AlgebraicVectorBundles.

*Remark.* For a quasi-split model that is reductive over all of X this is the fixed-curve stack `CurveBundles` of EndoscopicTransferAndUnitaryTraceComparison §3.1. This target adds smooth affine models with connected fibres that are reductive only over U, with no parahoric condition at the remaining points, the affine diagonal and the stabilizer statements, and restricts to §3.1 on reductive models.

The API:

- The fppf stack of torsors on X×S.
- Pull back objects and arrows along S′→S with coherent composition.
- A smooth surjective atlas locally of finite type.
- Represent the affine isomorphism sheaf, including all stabilizers.

**Checks.**

- For GL₁ the result is the Picard stack, with automorphism group F_q× at every rational line bundle.
- For a constant G the trivial torsor has rational automorphism group G(F_q).
- On P¹, the degree-zero GL₂ bundles O(m)⊕O(−m), m≥0, have unbounded instability; fixing degree alone does not give a finite-type stack.
- Let 𝒢 be the model of G_m over P¹/F₃ that agrees with G_m away from a rational point x and whose O_x-points are 1 + π_x O_x (locally `Spec O_x[y, (1 + π_x y)⁻¹]` with law y + y′ + π_x y y′; its fibre at x is G_a, so it is smooth affine with connected fibres but not parahoric). Bun_𝒢 is the stack of line bundles with a trivialization of the fibre at x: each degree has one rational isomorphism class, with trivial automorphism group, whereas the same line bundle without the trivialization has automorphism group F₃× of order 2.

Source: [Hein](#references), Proposition 1 and its proof, p. 4 (smooth affine models and their deformation theory); [AH19](#references), Theorem 2.5, p. 8 (flat affine models of finite type); [Var](#references), §2, Notation 2.1(a), p. 4; [VL](#references), §12.1, p. 148.

*Needs:* Mathlib `AlgebraicGeometry.Scheme`; Mathlib `CategoryTheory.Pseudofunctor.IsStack`; SchemeAndStackFoundations Layer 1 (§§1.1, 1.15–1.16 descent, torsors and contracted products; §§1.18–1.21 algebraic and Deligne–Mumford stacks, inertia and quotient stacks); ReductiveGroups Layers 0, 1 and 7 (functor of points, representations as comodules, structure theory); EndoscopicTransferAndUnitaryTraceComparison §3.1 (`CurveBundles`); AlgebraicVectorBundles Layers L0A–L2B; SchemeAndStackFoundations §4.14 (Hilbert and Quot schemes).

### 0.2 Deformations of bundles

At a 𝒢-bundle E, infinitesimal automorphisms, tangent classes and obstructions are H⁰(X,ad E), H¹(X,ad E), H²(X,ad E). The last vanishes on the curve, so Bun_𝒢 is smooth of local dimension −χ(X,ad E). For constant reductive G this is (g−1)dim G; a ramified model uses its actual adjoint-bundle Euler characteristic.

*Proof.* Describe torsor lifts on an affine cover by Čech 1-cocycles with coefficients in ad E; changes of lift are 0-cochains. Coherent H² vanishes on a curve, which gives smoothness; Riemann–Roch gives the dimension after subtracting automorphisms. For Iwahori PGL₂ add one flag dimension at each geometric level point, which gives 3(g − 1) + deg Σ.

*Remark.* H⁰ is the Lie algebra of the stabilizer, not its group of points.

*Remark.* For G_m the dimension is g − 1, although Pic⁰ has dimension g: the stack has a B G_m factor.

Source: [Hein](#references), proof of Proposition 1, p. 4; [YZ](#references), §5.4.1, Proposition 5.17(1), p. 63 (arXiv v2).

*Needs:* [§0.1 *Bundles on the global curve*](#01-bundles-on-the-global-curve); SchemeAndStackFoundations Layer 1 (§§1.1, 1.15–1.16 descent, torsors and contracted products; §§1.18–1.21 algebraic and Deligne–Mumford stacks, inertia and quotient stacks); SchemeAndStackFoundations Layer 4 (§4.1 torsors of lifts, §§4.3–4.5 deformation functors and obstruction theories).

### 0.3 Full level structures

Define BunG.level. For a finite closed subscheme N⊂X, `Bun_{𝒢,N}(S)` consists of a bundle E and a trivialization E|N×S≃𝒢|N×S. Forgetting the trivialization is a torsor under `Res_{N/F_q}(𝒢|N)`, hence representable smooth and surjective. Full congruence level and parabolic flags are different moduli data.

*Construction.* Descend the trivialization with the torsor. Identify changes of trivialization with the Weil-restriction action and check simple transitivity fppf locally.

*Remark.* The finite subscheme retains nilpotents.

The API:

- Bundle with a specified full trivialization on N.
- Forget full level or restrict it to N′⊂N.
- Identify the change-of-trivialization group scheme.

**Checks.**

- N=∅ gives Bun_𝒢.
- For GL_n at a rational reduced point the level group is GL_n/F_q; rational principal congruence level is ker(GL_n(Ov)→GL_n(κv)).
- For G_m at 2v, units 1+πa survive modulo π²: replacing N by its reduction loses level information.

Source: [VL](#references), §1, (1.1), p. 41; §2, Definition 2.1, p. 52.

*Needs:* [§0.1 *Bundles on the global curve*](#01-bundles-on-the-global-curve).

### 0.4 Iwahori flags and fractional twists

Define IwahoriBundle. Bun_n(Σ) consists of rank-n bundles with, at each x∈Σ, a periodic chain E⊃E(−x/n)⊃⋯⊃E(−x), whose n successive quotients are line bundles on x×S. Extend the chain periodically to define fractional twists E(D) for D supported at the level with coefficients in (1/n)Z; for nonrational points use the chosen residue-field sections over S∞. Bun_PGLn(Σ) is the Picard-stack quotient. Fractional twisting induces Atkin–Lehner automorphisms.

*Construction.* Use the finite locally free sheaves of AlgebraicVectorBundles; flags are given by locally free successive quotients, with no generic-position condition. Rotating the periodic lattice chain implements a 1/n twist; integral rotations are tensoring with O(x). Descend tensoring and fractional rotation through the Picard action, using residue-field base changes for the infinity coefficients.

*Remark.* Flags are retained when a moving leg meets Σ.

The API:

- The periodic lattice chain, its inclusions and quotient line bundles.
- Add allowed fractional divisors, with twist(D+D′)≃twist(D)∘twist(D′).
- Quotient simultaneous tensoring by a line bundle.
- On the PGL_n quotient, n rotations at x are the identity.

**Checks.**

- n=1 adds no flag choice and a unit twist is tensoring by O(x).
- For n=2 the half-twist at x replaces the chain E⊃E(−x/2)⊃E(−x) by E(x/2)⊃E⊃E(−x/2), where E(x/2)=E(−x/2)⊗O(x); doing it twice gives tensoring by O(x), so on PGL₂ it is an involution, the Atkin–Lehner involution at x.
- A flag at a degree-d closed point has d geometric flag parameters after splitting; counting only one geometric flag gives the wrong dimension.

Source: [YZ](#references), §3.1, Definitions 3.1–3.2 and (3.1)–(3.4), pp. 17–19 (arXiv v2).

*Needs:* [§0.1 *Bundles on the global curve*](#01-bundles-on-the-global-curve); SchemeAndStackFoundations Layer 1 (§§1.1, 1.15–1.16 descent, torsors and contracted products; §§1.18–1.21 algebraic and Deligne–Mumford stacks, inertia and quotient stacks); AlgebraicVectorBundles Layers L0A–L2B.

### 0.5 Slopes and Harder–Narasimhan data

Define HNType and HNFiltration. For a nonzero coherent sheaf F on X use class (rk F,deg F), slope deg/rk for positive rank and +∞ for torsion. The HN filtration has semistable quotients with strictly decreasing slopes. Its ordered quotient classes define an HN type. For a constant connected reductive group over an algebraically closed field, use its unique canonical parabolic reduction, characterized by semistability of the Levi bundle and a dominant parabolic-regular degree; project its rational coweight to the adjoint group to measure instability. On classes χ((r,d),(r′,d′))=(1−g)rr′+rd′−r′d. Truncations for a general smooth model 𝒢 are constructed separately in §0.6.

*Construction.* The Euler pairing follows from Riemann–Roch and Serre duality on X. First separate the maximal torsion subsheaf, then construct maximal destabilizing saturated subbundles and induct on the rank. The filtration on a geometric fibre is canonical. In a family the HN type can jump; relative sheaf filtrations belong on their HN strata, and no arbitrary-base-change assertion for a filtration on the whole family is made. For reductive G use Schieder's comparison theorem for parabolic reductions and his existence argument, keeping central degree separate from adjoint instability. In arbitrary positive characteristic the map from semistable parabolic reductions to the reduced HN stratum is an almost-isomorphism (finite with a single point in each geometric fibre), not an asserted isomorphism; do not infer uniqueness of reductions over nonreduced bases from uniqueness at geometric points.

*Remark.* The zero sheaf has the empty HN type; no slope is assigned to it. The numerical convention assigns +∞ to rank-zero pairs, including (0,0); the latter only totalizes the numerical function and is not a slope of the zero sheaf.

*Remark.* For vector bundles, slope, semistability and the HN filtration are AutomorphicLFunctionsAndLocalFactors §AL.3, *Curve bundle slopes and Harder–Narasimhan filtrations*. This target adds torsion sheaves (slope +∞), the Euler pairing on classes and the canonical parabolic reductions of G-bundles, and agrees with AL.3 on vector bundles.

The API:

- Ordered ranks and degrees, or canonical parabolic/coweight data for G.
- The canonical filtration with semistable decreasing-slope quotients.
- Any filtration with these properties is the canonical one.
- Hom minus Ext¹ equals the stated numerical pairing.
- Coh(X) is hereditary: Ext^i(F,F′)=0 for i≥2, so χ(F,F′)=dim Hom(F,F′)−dim Ext¹(F,F′) is the numerical pairing on classes.

**Checks.**

- O(2)⊕O(−1) on P¹ has slopes 2,−1, in this order.
- For a length-one skyscraper at a degree-d point the class is (0,d) and its slope is +∞.
- For O on a genus-g curve χ(O,O)=1−g. On P¹ the values χ(O,O(1))=2 and χ(O(1),O)=0 distinguish the sign of the degree term.
- The numerical pairs (0,0) and (0,3) both have the stipulated value +∞, while (2,1) has slope 1/2; only the first is a zero-sheaf totalization.

Source: [Sch](#references), §2.1, pp. 306–308; [Schieder](#references), Theorem 2.3.3 and §2.4.1, pp. 12–13, Theorem 4.5.1, pp. 39–40, and §6.3, pp. 52–54; [VL](#references), §1, (1.3) and the following paragraph, p. 41 (adjoint instability bounds).

*Needs:* [§0.1 *Bundles on the global curve*](#01-bundles-on-the-global-curve); SchemeAndStackFoundations Layer 1 (§§1.1, 1.15–1.16 descent, torsors and contracted products; §§1.18–1.21 algebraic and Deligne–Mumford stacks, inertia and quotient stacks); AutomorphicLFunctionsAndLocalFactors §AL.3, *Curve bundle slopes and Harder–Narasimhan filtrations*; SchemeAndStackFoundations Layer 3 (curves, divisors and Picard objects).

The numerical Euler form and rank-zero slope convention are specified by the preceding formulas and Checks.

### 0.6 Bounded bundle loci

For every smooth affine model 𝒢/X with connected fibres and reductive generic fibre, choose a vector bundle V of rank r with trivialized determinant and a faithful representation ρ:𝒢→SL(V) such that SL(V)/𝒢 and GL(V)/𝒢 are quasi-affine; such a ρ exists for every flat affine group scheme of finite type over X. Then ρ_*:Bun_𝒢→`Bun⁰_{GL_r}` is representable, quasi-affine and of finite presentation, so for every dominant coweight μ of SL_r the inverse image `Bun_𝒢^{≤μ,ρ}` of the HN open `Bun^{0,≤μ}_{GL_r}` is an open substack of finite type. These opens exhaust Bun_𝒢, and a second choice of (V,ρ) gives a cofinal system.

On a connected parahoric model, as constructed in VL §12.1, apply the same construction to the adjoint group: `Bun_{G^ad}^{≤μ}` is the inverse image of the degree-zero vector-bundle HN open under a faithful representation of the adjoint model, and `Bun_G^{≤μ}` is its pullback along G→G^ad. These adjoint truncations are stable under central twisting, but their bundle quotients by Ξ need not be of finite type: F-rational characters can miss geometric central components. The general bundle exhaustion is the faithful-representation system. Finite type of adjoint-bounded shtuka quotients is the separate Frobenius-closure theorem of §2.2. Intrinsic canonical parabolic reductions of arbitrary models are not assumed; for constant split G the bound HN≤μ through the canonical reductions of §0.5 is an open substack of Bun_G. For a fixed coherent-sheaf class each HN type has finitely many rational isomorphism classes; requiring all slopes ≥0 gives finitely many such types and classes. An adjoint HN bound alone does not bound degrees of the centre.

*Proof.* The faithful representation with quasi-affine quotients is AH19 Proposition 2.2(b); finite type of the ρ-truncations is AH19 Remark 2.9, which pulls back the finite-type HN opens of vector bundles along ρ_* (VL Lemma 12.1). Cofinality under a change of (V,ρ) holds because each member of one system is quasi-compact and the other system is an increasing open cover. For vector bundles, embed the bounded bundle problem in bounded Quot families after twisting by a sufficiently positive divisor. Use bounded cohomology and finite generation to obtain finite-type atlases; prove openness by specialization of HN polygons. For coherent sheaves with slopes ≥0, ranks and nonnegative quotient degrees admit only finitely many decompositions of the fixed class.

*Remark.* For G_m the HN condition in the adjoint group is empty, but line-bundle degrees remain unbounded.

*Remark.* For GL₂ in degree zero, `HN^{≤μ}` excludes O(m) ⊕ O(−m) for all sufficiently large m.

*Remark.* For GL_r, openness and finite type of the bounded loci of vector bundles are AutomorphicLFunctionsAndLocalFactors §AL.3, *Harder–Narasimhan polygon semicontinuity* and *Bounded curve-bundle loci and shtuka truncations*; this target is the statement for G-bundles, with the central degree.

**Checks.**

- For G_m on P¹ the adjoint bound is empty, so every O(d), d∈Z, satisfies it, and each degree has exactly one rational class. Through ρ(t)=diag(t,t⁻¹) into SL₂, O(d) goes to O(d)⊕O(−d), so the ρ-truncation for μ=(b,−b) contains exactly the degrees |d|≤b and is of finite type with no central quotient.
- For the constant norm-one torus T of F₉/F₃ on P¹/F₃, the F-rational character group is 0 and degree injectivity forces Ξ={1}. Geometrically Bun_T has components d∈Z, all with adjoint bound 0; the norm-one representation in SL₂ sends d to O(d)⊕O(−d), so a faithful bound (b,−b) retains only |d|≤b. Thus finite rational degree data do not make an adjoint-bounded bundle stack quasi-compact.
- For GL₂ on P¹, O(1)⊕O(−1) has adjoint instability 2: its adjoint bundle O(2)⊕O⊕O(−2) has slopes (2,0,−2), so it lies in the adjoint truncation for μ=(b,0,−b) exactly when b≥2. It fails the bound b=1 and satisfies b=2.
- For PGL₂ and the bundle induced by O(a)⊕O(−a), a≥0, the adjoint representation into SL₃ and its double into SL₆ give vector bundles with slopes (2a,0,−2a) and (2a,2a,0,0,−2a,−2a). They lie in the bounds μ=(b,0,−b) and μ=(b,b,0,0,−b,−b) respectively exactly when 2a≤b, although their HN polygons differ: the two choices of ρ are cofinal on this family, not equal.

Source: [AH19](#references), Proposition 2.2, p. 6, Theorem 2.5 and Remark 2.9, pp. 8–10; [Var](#references), §2, Notation 2.1(b), p. 4; Lemma A.3, p. 29; §3, Lemma 3.1(a), p. 12; [VL](#references), §12.1, Lemma 12.1 and pp. 148–149.

*Needs:* [§0.1 *Bundles on the global curve*](#01-bundles-on-the-global-curve); [§0.2 *Deformations of bundles*](#02-deformations-of-bundles); [§0.5 *Slopes and Harder–Narasimhan data*](#05-slopes-and-hardernarasimhan-data); AutomorphicLFunctionsAndLocalFactors §AL.3, *Harder–Narasimhan polygon semicontinuity* and *Bounded curve-bundle loci and shtuka truncations*.

### 0.7 Adelic bundle groupoids

For the connected-fibre model 𝒢, `Bun_{𝒢,N}(F_q)` is equivalent to the disjoint union, over α∈ker¹(F,G), of quotient groupoids [Gα(F)\Gα(A)/Kα,N], where Gα is the pure inner form and Kα,N is transported integral/congruence level. Automorphisms correspond to Gα(F)∩gKα,Ng⁻¹. For split G the kernel is trivial in the situation of VL Remark 8.21.

The local–global input on torsors is part of this target: the finiteness of ker¹(F, G), the identification of its classes with the generic torsor classes that are locally trivial at every place, the choice of the pure inner form G_α in each class, and local triviality at every place: H¹(O_v,𝒢)=1, that is, every 𝒢-torsor over O_v is trivial. AutomorphicLFunctionsAndLocalFactors §AL.3 supplies the completion-valued adeles, ArithmeticGaloisDuality §R02.3.2 the ideles and the class formation, and FunctionFieldArithmetic §6.1 the adelic points G(A) with G(F) discrete; none of them supplies these nonabelian statements.

*Proof.* Trivialize at the generic point and completed local discs, retaining a generic torsor class when it is not trivial. For local triviality, the special fibre of a 𝒢-torsor over O_v is a torsor under the smooth connected group `𝒢 ⊗ κ_v` over the finite field κ_v, hence has a κ_v-point by Lang's theorem; lift it to an O_v-point through the successive thickenings O_v/π_vⁿ, using smoothness of the torsor, and pass to the limit. Glue the local data and compare changes of trivialization. Identify stabilizers and the locally trivial generic classes; choose the inner form belonging to each class.

*Remark.* Connected fibres are needed for local triviality: if the fibre at v has component group Z/2 with trivial Frobenius action, then H¹(κ_v,Z/2)=Z/2 gives a nontrivial torsor over κ_v, which lifts to a nontrivial torsor over O_v.

*Remark.* The index set classifies generic torsor components, not individual bundles.

*Remark.* For GL₁ isomorphism classes give divisor classes while stabilizers give F_q×.

Source: [VL](#references), §8, Remark 8.21, pp. 116–117; §12.1, Remark 12.2, p. 150.

*Needs:* [§0.3 *Full level structures*](#03-full-level-structures); AutomorphicLFunctionsAndLocalFactors §AL.3, *Curve additive analysis* (completion-valued adeles); ArithmeticGaloisDuality §R02.3.2, *Function-field places, ideles and S-units* (ideles and the idele class group); FunctionFieldArithmetic §6.1 (adelic points of affine groups, discreteness of G(F) and finite stabilizers); ReductiveGroupsPartII §RG2.3.7, *lang-theorem*, for the smooth connected special fibre of 𝒢 over each finite residue field; SchemeAndStackFoundations §4.1 (thickenings and torsors of lifts), for lifting points of the smooth torsor over O_v.

### 0.8 Shifted Harder–Narasimhan filtrations

Define ShiftedHN.semistable and ShiftedHN.filtration. For n≥1 and a dominant real tuple T=(T₁≥⋯≥Tn) define T-semistability of rank-n E by deg F/r−(T₁+⋯+Tr)/r≤deg E/n−(ΣT)/n for every nonzero proper saturated rank-r subbundle. A quotient of ranks (a,b], with 0≤a<b≤n, uses `μ_T=deg/(b−a)−(T_{a+1}+⋯+Tb)/(b−a)`. The canonical T-HN filtration has shifted-semistable quotients with decreasing shifted slopes; it is trivial exactly for T-semistability.

*Construction.* Translate the dominant truncation inequalities into shifted subbundle slopes. Existence and uniqueness of the canonical T-filtration are part of this target. Yu (§3.3.2) takes them from Chaudouard's Theorem 4.1.2; a direct proof is the standard Harder–Narasimhan argument applied to the shifted degree d_T(F) = deg F − (T₁ + ⋯ + `T_{rk F})`. Because T is dominant, r ↦ T₁ + ⋯ + T_r is concave, so d_T(F + F′) + d_T(F ∩ F′) ≥ d_T(F) + d_T(F′) for saturated subbundles, exactly as for the ordinary degree. The canonical filtration is read off from the vertices of the concave envelope of the points (rk F, d_T(F)). Identify Arthur's indicator F^G(g, T) = 1 with T-semistability through maximal-parabolic flags.

*Remark.* The T-HN filtration is not the ordinary HN filtration with relabelled slopes: for O(1) ⊕ O(−1) on P¹ and T = (1, −1) the ordinary filtration is nontrivial while the T-filtration is trivial.

The API:

- The complete family of rank-r inequalities.
- Use the consecutive T block determined by cumulative ranks.
- Canonical filtration with shifted semistable pieces and strictly decreasing shifted slopes.
- Bundle inequalities agree with the adelic truncation indicator.

**Checks.**

- T=(c,…,c) recovers ordinary semistability: for a rank-r block of degree d the value is (d−rc)/r=d/r−c; both sides of every subbundle inequality shift by −c.
- For O(1)⊕O(−1) on P¹, T=(1,−1) makes the rank-one inequality 1−1≤0, so this unstable ordinary bundle is T-semistable.
- For n=3, T=(3,2,0), cumulative ranks 1,3 and second-block degree 4, the shifted slope is (4−2−0)/2=1. Reusing the first two entries gives (4−3−2)/2=−1/2, so the consecutive-block rule is essential.

Source: [Yu](#references), §3.3.1–§3.3.2, (3.3.5), pp. 19–20; [Chau](#references), §4.1, Theorem 4.1.2, p. 17 (author's preprint).

*Needs:* [§0.5 *Slopes and Harder–Narasimhan data*](#05-slopes-and-hardernarasimhan-data).

The numerical shifted-slope formula is tested by the P¹, constant-shift and consecutive-block Checks above.

### 0.9 Parabolic PGL₂ instability

Define ParabolicInstability. Over an algebraically closed field define inst(E†)=min_D inst(E(D/2)), over reduced divisors D⊂Σ. A bundle is purely unstable when this minimum N is positive; then its minimizing D is unique, giving κ=(D,N). Order κ≤κ′ by N′−N≥|D−D′|. The corresponding κ-stratum is isomorphic, via E†↦E(D/2), to the ordinary instability-N PGL₂ stratum.

*Construction.* For a positive-instability rank-two bundle use its unique maximal line and compare push-outs/pull-backs at level points. Each reduced flag rotation changes ordinary instability by ±1. This proves uniqueness of the minimum when positive and reconstructs all flags. Use the inequalities for every D′ to define the bounded open, and identify the closed κ-stratum within it.

*Remark.* The reconstruction of all flags from the minimizing twist (YZ Lemma 3.19(2)) uses reduced divisors D′ ⊂ Σ only, not arbitrary effective divisors.

The API:

- Minimum instability and a positive-minimum index κ.
- The unique reduced D at a positive minimum.
- The open defined by all fractional-twist inequalities.
- The κ-stratum and the ordinary N-stratum after the minimizing twist.

**Checks.**

- With Σ empty, the minimum is ordinary instability and D=0.
- For a purely unstable bundle, rotating one reduced extra flag changes instability by exactly one.
- On P¹ take E=Oe₁⊕Oe₂ with flags e₁ at 0 and e₂ at ∞. The twists for D=0 and D={0,∞} have underlying bundles O² and O(1)², both of instability zero; each single-point twist has type O(1)⊕O and instability one. Thus the zero minimum has two minimizers.

Source: [YZ](#references), §3.4.1–§3.4.2, Lemma 3.19 and Corollary 3.20, pp. 29–30 (arXiv v2).

*Needs:* [§0.4 *Iwahori flags and fractional twists*](#04-iwahori-flags-and-fractional-twists); [§0.5 *Slopes and Harder–Narasimhan data*](#05-slopes-and-hardernarasimhan-data).

### 0.10 Central lattices and finite quotients

Choose a central lattice CentralLattice: a discrete free subgroup Ξ of Z(F)\Z(A) whose central-degree map is injective and has finite-index image in the group of central degrees. The degree map pairs an idele with F-rational characters of G. In particular Ξ∩(Z(F)(Z(A)∩K_N)/Z(F))={1}, so the lattice action introduces no extra degree-zero stabilizers. Central tensoring acts on bundles and shtukas. Rational stabilizer weights are retained; the bounded-shtuka finiteness theorem is §2.2. For GL_n, a nonzero-degree idele a gives the quotient by a^Z. For a general smooth model 𝒢, the saturation `⋃_{ξ∈Ξ} ξ·Bun_𝒢^{≤μ,ρ}` of a ρ-truncation of §0.6 is a Ξ-stable open substack whose quotient by Ξ is of finite type. These quotients exhaust Bun_𝒢/Ξ and are cofinal under a change of faithful representation. There is no such bundle-level cofinality with adjoint truncations for arbitrary nonsplit centres. As in VL, where Ξ is a lattice, Ξ is also required to make `Z(F)\Z(A)/((Z(A)∩U)Ξ)` finite for every compact open U ⊂ G(A), which is the hypothesis on Ξ in FunctionFieldArithmetic §6.2. For split Z, in particular for GL_n, this follows from the finite-index condition; for semisimple G, where Z is finite and Ξ={1}, from compactness of Z(A).

*Proof.* Use the idele-degree exact sequence to isolate the free central directions. Check the tensor action and level compatibility, keeping the finite quotient of rational central degrees separate from geometric bundle components. The saturation is open as a union of opens, and its quotient by Ξ is the image of the finite-type stack `Bun_𝒢^{≤μ,ρ}`, hence quasi-compact and locally of finite type; cofinality between faithful-representation systems follows because their quotients are quasi-compact and form increasing open covers. This argument cannot be applied to an adjoint-bounded bundle quotient without a separate quasi-compactness theorem. For split Z ≅ G_m^d the degree-zero part of `Z(F)\Z(A)` is a product of d compact degree-zero idele class groups (ArithmeticGaloisDuality §R02.3.2), so finite index of the degree image of Ξ makes the double quotient finite. For finite Z, Z(A) is the product of the finite groups Z(F_v) over the bad places with the compact groups Z(O_v) elsewhere, since Z(O_v)=Z(F_v) for a finite model.

*Remark.* For GL_n tensoring by a line bundle of degree d changes degree by nd.

*Remark.* A nonzero-degree a suffices; do not require a rational point or a degree-one closed place.

The API:

- Degree zero detects the identity in Ξ, and the central-degree quotient is finite.
- Tensoring gives an action on bundles and modification chains, compatible with composition and level restriction.
- If Ξ′ is a finite-index subgroup of Ξ, the quotient maps compare the corresponding bundle and cohomology systems; no comparison of unrelated lattice embeddings is assumed.

**Checks.**

- For GL_n, a generator represented by a line bundle of degree d≠0 changes bundle degree by nd; the remaining degree classes are Z/(nd)Z.
- An idele of degree zero cannot generate a central lattice for GL₁: its powers leave infinitely many bundle degrees, and a nontrivial subgroup in degree zero also violates degree injectivity.
- For a semisimple group the central-degree group has rank zero and Ξ={1} is permitted; no artificial nonzero-degree generator is required.
- For T the norm-one torus of F₉/F₃ on P¹, the unit norm is surjective and the Picard norm is d↦2d, with kernel 0; hence H¹(P¹,T)=0 and the rational maximal-compact adelic quotient has one class. Nevertheless all geometric d∈Z survive the adjoint bundle bound with Ξ={1}, whereas a faithful bound retains 2b+1 components for integer b≥0.

Source: [VL](#references), §2, before Definition 2.14, p. 59; §8, Remark 8.21, p. 116.

*Needs:* [§0.6 *Bounded bundle loci*](#06-bounded-bundle-loci); ArithmeticGaloisDuality §R02.3.2, *Function-field places, ideles and S-units* (ideles, `ideleDegree`, its surjectivity and the compact degree-zero idele classes).

### 0.11 Adelic orbit masses

Normalize vol(K)=1 for GL_n. The adelic orbit corresponding to E has mass 1/|Aut(E)|. In the diagonal kernel Σγ∈GL_n(F)1_K(g⁻¹γg), the value is |Aut(E)|; consequently its integral over a finite HN-truncated union counts bundle isomorphism classes without weights. General stack volumes remain weighted.

*Proof.* Compute the quotient measure of one K-orbit from its finite stabilizer. Identify the kernel summands with automorphisms and cancel this factor against the orbit mass.

*Remark.* For a line bundle the mass is 1/(q−1), whereas this diagonal-kernel contribution is 1.

*Remark.* A sum of constant functions on a groupoid gives weighted volume, not an unweighted object count.

Source: [Yu](#references), §3.3.1, Theorem 3.3.1, (3.3.1) and (3.3.6), pp. 18–19.

*Needs:* [§0.6 *Bounded bundle loci*](#06-bounded-bundle-loci); [§0.7 *Adelic bundle groupoids*](#07-adelic-bundle-groupoids); FunctionFieldArithmetic §§6.1–6.2 (finite stabilizers of adelic points; automorphic function modules).

### 0.12 Nonsplit bundle descent

For the fixed model 𝒢, effective torsor descent on any étale cover of X recovers 𝒢-bundles and their arrows. Over the reductive open U, use étale local isomorphisms from 𝒢 to a split pinned model of its root datum. Their transition automorphisms include both the pinned outer part and the inner part; killing the finite outer action does not assert that the isomorphism torsor has a section. The rational groupoid decomposes into the pure-inner-form components indexed by ker¹(F,G), and spherical Hecke correspondences preserve this decomposition.

*Proof.* Apply the torsor and contracted-product descent of SchemeAndStackFoundations §§1.15–1.16 to the fixed group model. On U, retain the isomorphisms on overlaps and their composition on triple overlaps, including inner automorphisms. Transport Hecke modifications and the no-leg identification on each generic torsor component. Show the operations do not change the generic ker¹ class.

*Remark.* The equivalence is independent of the étale trivializations and their refinements.

The descent API includes:

- Pullback of the descent equivalence along any base change.
- Effective descent of objects and arrows, coherent on triple overlaps.
- Independence under refinement of the étale cover.
- Compatibility with bundle isomorphisms and Hecke modifications.

**Checks.**

- For a constant split model the identity trivialization gives identity transition maps.
- For the constant norm-one torus of F₉/F₃, the outer quotient is C₂ and the nonidentity transition acts by d↦−d on geometric degrees; discarding it would descend every d instead of only d=0 among rational bundles on P¹.
- For 𝒢=GL(O⊕O(1)) on P¹/F₃, the generic group is split and Q=1, but Lie(𝒢)=O²⊕O(1)⊕O(−1). After any constant-field extension H⁰(Lie(𝒢)(−1)) has dimension 1, while H⁰(O⁴(−1)) has dimension 0. Connected finite étale covers of P¹ are constant-field extensions, so no such cover trivializes this model; its two standard affine charts do trivialize it and, with t=X₁/X₀ and frames e∞=t e₀ for O(1), the transition from ∞-coordinates to 0-coordinates is inner conjugation by diag(1,t).

*Remark.* Do not replace the disjoint union of groupoids by a vector-space direct sum before taking functions.

Source: [VL](#references), §12.1, Remark 12.2 and Theorem 12.3, pp. 148–152; §12.3.2, pp. 159–161.

*Needs:* [§0.7 *Adelic bundle groupoids*](#07-adelic-bundle-groupoids); Mathlib `CategoryTheory.Pseudofunctor.DescentData`; SchemeAndStackFoundations §§1.15–1.16 (torsors, contracted products and their effective descent).

### 0.13 Bundle and torsion mass identities

With vol(𝒞)=Σ[F]1/|Aut F|, for r≥1 and d∈Z one has `vol(Bun_{r,d})=q^((g−1)(r²−1))|Pic⁰(F_q)|/(q−1)·∏_{i=2}^r` Z_X(q^(−i)). The torsion series is `Σ_{l≥0}` `vol(Coh_{0,l})s^l=∏_{i≥1}Z_X(q^(−i)s)`, equivalently the plethystic exponential Exp([X]s/(q−1)) with Adams operations using all extension-field point counts. For r≥1, the full coherent-sheaf formula is `vol(Coh_{r,d})=q^((g−1)(r²−1))|Pic⁰(F_q)|/(q−1)·∏_{i≥2}Z_X(q^(−i))`.

First prove the function-field volume theorem here: for every r≥1, the quotient SL_r(F)\SL_r(A), with every SL_r(O_v) of volume 1, has volume `q^((g−1)(r²−1))∏_{i=2}^r Z_X(q^(−i))`. Construct the gauge-form product measure, independent of the nonzero F-rational invariant top form by the product formula. Its normalized Tamagawa measure is `q^((1−g)(r²−1))∏_{i=2}^r Z_X(q^(−i))⁻¹` times the volume-one product Haar measure, and its quotient volume is 1. The local integral gauge volume at v is `|SL_r(κ_v)|/q_v^(r²−1)=∏_{i=2}^r(1−q_v^(−i))`. Every zeta value here is finite and positive since i≥2 and q>1.

*Proof.* A route to the volume theorem is Harder's scalar-product and residue calculation (Harder §§3.1–3.3): for SL_r construct the compactly supported Borel theta series, their convergent scalar product, and the residual orthogonal projection onto constant functions of Theorem 3.2.2, with the local spherical integrals and gauge comparison of §3.3. These inputs to the residue calculation are part of this target, before the mass identities; they do not assume the bundle mass. Another proof may use the same intrinsic volume statement. For each degree-d Picard class choose an adelic determinant representative. Right translation identifies its determinant-trivialized fibre with an SL_r adelic quotient whose compact subgroup is a GL_r-conjugate of the standard one. Conjugation on SL_r has modulus 1, so these compact subgroups have Haar volume 1. For one bundle E with determinant in a fixed Picard class, the groupoid of determinant trivializations has mass (q−1)/|Aut(E)|: there are q−1 trivializations before the Aut(E)-action. This does not assume that the determinant map on Aut(E) is surjective. Summing over Pic^d(F_q) therefore gives the bundle formula using §0.11. Factor torsion sheaves by closed-point support and sum local partition masses to obtain the Euler product. Stratify a coherent sheaf by its torsion subsheaf and vector-bundle quotient; the extension factor `q^(−r l)` for torsion degree l yields the infinite product.

*Remark.* r=1 gives |Pic⁰(F_q)|/(q−1).

*Remark.* Rank zero is excluded from the bundle formula: `Bun_{0,0}` consists of the zero bundle with mass 1. For X=P¹ the positive-rank formula formally evaluated at r=0 would give q/(q−1), so it cannot be extended to this case.

*Remark.* The coefficient of s is #X(F_q)/(q−1); Exp here is not the ordinary exponential in this single number.

**Checks.**

- At r=1 the bundle mass is |Pic⁰(F_q)|/(q−1), the SL₁ quotient has mass 1, and the Tamagawa product is empty and equals 1.
- On P¹/F₃ the degree-zero rank-two bundle mass is 1/32, and the determinant-trivialized SL₂ quotient volume is 1/16. Indeed |GL₂(F₃)|=48, and the unstable summands have automorphism orders 4·3^(2m+1) for m≥1: `1/48+Σ_{m≥1}1/(4·3^(2m+1))=1/32`. The gauge normalization multiplier is 16, giving Tamagawa mass 1.
- On P¹/F₂ the degree-one torsion coefficient is 3/(2−1)=3; an ordinary exponential of this coefficient would give 9/2 at degree two, whereas the Euler product gives 16/3: the three rational supports contribute 3·(1/2+1/6)=2, pairs of distinct rational supports contribute 3, and the degree-two point contributes 1/3. Rank-zero bundle mass is 1 and remains outside the positive-rank formula.

Source: [Harder](#references), §§3.1–3.3, especially Theorem 3.2.2 and the Tamagawa computation, pp. 298–305; [Sch](#references), §4.2, Theorem 4.1(i)–(iii), pp. 316–317; Appendix A, p. 356.

*Needs:* [§0.5 *Slopes and Harder–Narasimhan data*](#05-slopes-and-hardernarasimhan-data); [§0.11 *Adelic orbit masses*](#011-adelic-orbit-masses); FunctionFieldArithmetic §§5.1 and 5.3 (the zeta series, its Euler product and point counts; rationality); AutomorphicLFunctionsAndLocalFactors §AL.3, *Curve additive analysis* (restricted-product Haar measure, Riemann–Roch and the canonical divisor).

### 0.14 Cuspidal functions and bundle functions

Define BunG.automorphicFunctions and its cuspidal subspace. Transport the automorphic function modules and constant terms of FunctionFieldArithmetic §§6.2–6.3, applied to each pure inner form G_α of §0.7 at the level `K_{α,N}` and with the central lattice Ξ, to finitely supported functions on the groupoid `Bun_{𝒢,N}(F_q)/Ξ`. A function is cuspidal when every proper-parabolic constant term vanishes, with the unipotent quotient measure normalized to total mass one. This target is the interface between the stack and the adelic description, inner-form components included; automorphic function theory itself is FunctionFieldArithmetic's.

The finiteness of the support of cuspidal functions of fixed level modulo Ξ (Harder; recalled in VL §12.1, p. 151) is FunctionFieldArithmetic §6.4, for every connected reductive group, every compact open level and every Noetherian coefficient ring in which p is invertible; E, O_E and O_E/λ^s qualify because ℓ ≠ p. This target transports it along the groupoid equivalence of [§0.7 *Adelic bundle groupoids*](#07-adelic-bundle-groupoids), for an arbitrary smooth model 𝒢 with connected fibres.

*Construction.* Pull the constant-term maps of FunctionFieldArithmetic §6.3 across the groupoid equivalence of [§0.7 *Adelic bundle groupoids*](#07-adelic-bundle-groupoids). Retain stabilizer weights when the maps are written as sums of bundle correspondences. Use the compact-support theorem of FunctionFieldArithmetic §6.4 with the lattice Ξ, whose finiteness hypothesis is checked in §0.10.

*Remark.* The resulting fixed-level cusp space is finite-dimensional over E.

The API:

- Identify compactly supported functions on the bundle groupoid with the adelic functions of FunctionFieldArithmetic §6.2.
- Transport each proper-parabolic constant term with its measure.
- Intersect cuspidal E-valued functions with the integral function lattice.

**Checks.**

- For a torus there are no proper parabolics, so all compactly supported functions modulo Ξ are cuspidal.
- For GL₂ the constant term along the upper triangular Borel subgroup averages a function over the compact quotient of the unipotent radical, of total mass one. The characteristic function of the trivial bundle O ⊕ O is finitely supported, but its constant term is nonzero at the split B-reduction (the split extension of O by O contributes), so it is not cuspidal: finite support does not imply cuspidality.
- The whole noncompact bundle-function space is not finite-dimensional before the cuspidality and central-quotient restrictions.

Source: [VL](#references), §8, Notation 8.22 and Proposition 8.23, p. 117.

*Needs:* [§0.7 *Adelic bundle groupoids*](#07-adelic-bundle-groupoids); [§0.10 *Central lattices and finite quotients*](#010-central-lattices-and-finite-quotients); FunctionFieldArithmetic §6.2 (automorphic function modules); FunctionFieldArithmetic §6.3 (constant terms and the cusp module); FunctionFieldArithmetic §6.4 (compact support and finiteness of cusp forms).

### 0.15 The Picard stack and rank-one Lang fibres

For G = G_m, identify `Bun_{G_m}` with the Picard stack supplied by SchemeAndStackFoundations §3.7 (picardStack, aut_eq_units, toPicardSheaf, isGerbe, tensor and baseChange). The map 𝒫_X→Pic_X is its supplied G_m-gerbe and retains scalar automorphisms. This target adds the Frobenius–Lang fibres and their central-lattice quotient. A rank-one shtuka with legs is a point of a fibre of the Lang map L = Frob_q − id. On the identity component Pic⁰ the Lang map is a finite étale isogeny with kernel Pic⁰(F_q); on the whole Picard scheme its kernel contains Pic_X(F_q) and is infinite, and only after the quotient by the central lattice Ξ do finitely many degree components remain. Rank-one reciprocity itself, the identification of these Lang torsors with characters of the idele class group under the geometric-Frobenius normalization, is AutomorphicLFunctionsAndLocalFactors §AL.3, *Rank-one unramified reciprocity* and *Ramified rank-one curve reciprocity*; this target is the stack-level description that the horocycle computations of Layer 3 use.

*Proof.* Pass from line bundles to their Picard classes, keeping the scalar automorphisms. Apply Lang's theorem on the connected Jacobian Pic⁰ only, and keep the other degree components until the quotient by Ξ. Compare with the rank-one reciprocity of AL.3, recording the inversion from arithmetic to geometric Frobenius.

**Checks.**

- On P¹/F₃ a line bundle has scalar automorphisms F₃× of order 2, so its stack mass is 1/2; replacing the gerbe by its Picard scheme gives mass 1.
- The Jacobian of P¹ is trivial; its Lang kernel has order 1. The full Picard group has one class in every integer degree, so its Lang kernel has infinitely many components.
- For an elliptic curve, Lang on Pic⁰ has kernel Pic⁰(F_q) and is finite étale; tensoring by a degree-one line bundle changes components and cannot belong to its fixed-degree kernel.

*Remark.* A product decomposition Pic × B G_m needs a chosen trivialization of the gerbe; no canonical product is asserted.

*Remark.* The infinite kernel of the Lang map on the whole Picard scheme must be visible: a statement that is only true on Pic⁰ fails this check.

Source: [LL](#references), Chapter VI §1d, remark after Theorem VI.9, p. 158; §1e, proof of Proposition VI.11, p. 159.

*Needs:* [§0.1 *Bundles on the global curve*](#01-bundles-on-the-global-curve); [§0.10 *Central lattices and finite quotients*](#010-central-lattices-and-finite-quotients); FunctionFieldArithmetic §0.3 (divisor classes and Picard points over a finite field); AutomorphicLFunctionsAndLocalFactors §AL.3, *Rank-one unramified reciprocity* and *Ramified rank-one curve reciprocity*; JacobianChallenge Layers D and F (the Picard functor, the Jacobian and the Abel–Jacobi map); SchemeAndStackFoundations §3.7 (Picard stacks, gerbes, tensor product and base change); ReductiveGroupsPartII §RG2.3.7, *lang-theorem*, applied to the smooth geometrically connected finite-type group Pic⁰.

### Examples

- *Rank one.* For G = G_m the bundle groupoid over F_q has the Picard group as its set of isomorphism classes and F_q^× as the automorphism group of every object; the stack mass of a single line bundle is 1/(q − 1), while the diagonal-kernel contribution of §0.11 is 1 ([§0.11 *Adelic orbit masses*](#011-adelic-orbit-masses)).
- *The projective line.* On P¹ the rank-two bundles O(m) ⊕ O(−m) all have degree zero and instability 2m; they leave every bounded open of [§0.6 *Bounded bundle loci*](#06-bounded-bundle-loci). The bundle O(1) ⊕ O(−1) is unstable in the ordinary sense and T-semistable for T = (1, −1) ([§0.8 *Shifted Harder–Narasimhan filtrations*](#08-shifted-hardernarasimhan-filtrations)).
- *Euler pairing.* On a genus-g curve χ(O, O) = 1 − g; on P¹, χ(O, O(1)) = 2 = h⁰(O(1)) while χ(O(1), O) = 0, which fixes the sign of the antisymmetric term in [§0.5 *Slopes and Harder–Narasimhan data*](#05-slopes-and-hardernarasimhan-data).
- *Masses.* For r = 1 the formula of [§0.13 *Bundle and torsion mass identities*](#013-bundle-and-torsion-mass-identities) gives `vol(Bun_{1,d})` = |Pic⁰(F_q)|/(q − 1), and the coefficient of s in the torsion series is #X(F_q)/(q − 1).

### Dependencies

Mathlib schemes and pseudofunctor descent; ReductiveGroups; AlgebraicVectorBundles; SchemeAndStackFoundations Layers 1, 3 and 4; JacobianChallenge Layers D and F; EndoscopicTransferAndUnitaryTraceComparison §3.1; AutomorphicLFunctionsAndLocalFactors §AL.3 (vector-bundle HN theory, rank-one reciprocity and curve additive analysis); FunctionFieldArithmetic §§0.3, 5.1, 5.3 and 6.1–6.4; ArithmeticGaloisDuality §R02.3.2; ReductiveGroupsPartII §RG2.3.7.

## Layer 1: the Beilinson–Drinfeld Grassmannian and classical Satake

The Beilinson–Drinfeld Grassmannian, its Schubert supports and the bounded Hecke stacks come first; they use no sheaf theory and are the geometric input of everything later. Then come ℓ-adic sheaves on the stacks of finite type that occur in this roadmap, fusion, the Satake category with its corrected commutativity constraint, the geometric Satake equivalence over finite fields with ℓ-adic coefficients, nonsplit descent through the finite-form L-group, the comparison with the classical spherical Satake isomorphism, and the integral version that the modular theory of Layer 5 needs.

Standing hypotheses for this layer, in addition to those of Layer 0: ℓ ≠ p and E/Q_ℓ is a finite extension large enough for the representations in use, with integers O_E and uniformizer λ; half Tate twists use one fixed square root of q; integral and torsion statements replace E by O_E or O_E/λ^s explicitly. A level N ⊂ X is a finite closed subscheme with its nilpotents, and moving legs lie in U ∖ |N|. Whenever bounded geometry is asserted, a finite leg set I, an ordered partition of I and a representation or bound are fixed.

### 1.1 Beilinson–Drinfeld Grassmannians

Define BDGrassmannian. For a finite ordered partition I=I₁⊔⋯⊔Ik, Gr_I^(I₁,…,Ik) over X^I classifies bundles E₀,…,Ek, modifications `E_{j−1}≃E_j` away from the graphs indexed by Ij, and a trivialization of Ek. Beauville–Laszlo gluing identifies it with the same data on the formal discs. It is an ind-scheme, with factorization into products when the corresponding groups of legs are disjoint.

Beauville–Laszlo gluing for G-torsors along the graphs of the legs, deduced from the module statement through a faithful representation and the equations of the reduction to G, is part of this target.

*Construction.* Construct the modification functor and finite-dimensional lattice bounds using a faithful representation. Glue formal torsors with the trivial torsor off the graphs; verify independence from a formal coordinate. Use disjoint formal neighbourhoods for factorization and gluing of trivializations.

*Remark.* Its fibre over a closed point v is the local loop quotient LG/L⁺G of EndoscopicTransferAndUnitaryTraceComparison §3.2 (`LocalLoopGrassmannian`). This target adds the multi-leg geometry over X^I and its factorization.

The API:

- Bundle chains, moving legs and final trivialization.
- Identify the global and formal-disc moduli problems.
- Disjoint-leg products, compatible with refinement of disjoint partitions.
- Base change along X^J→X^I for a map I→J.

**Checks.**

- For I={1} and G=G_m, the geometric points of the fibre form the discrete set Z of lattice exponents; on nonreduced test rings the fibre is not the constant scheme Z.
- For GL₂ and coweight (1,0), the one-leg Schubert fibre is P¹.
- Two distinct legs give the product of local Grassmannians; on collision they give the convolution situation, so the disjoint-product formula is not asserted on the diagonal.

Source: [VL](#references), §1, Definition 1.6, Notation 1.7, Construction 1.8 and Remark 1.9, pp. 43–44.

*Needs:* [§0.1 *Bundles on the global curve*](#01-bundles-on-the-global-curve); SchemeAndStackFoundations Layer 1 (§§1.1, 1.15–1.16 descent, torsors and contracted products; §§1.18–1.21 algebraic and Deligne–Mumford stacks, inertia and quotient stacks); ReductiveGroups Layers 0, 1 and 7 (functor of points, representations as comodules, structure theory); RelativeFarguesFontaine §6.5 (the Beauville–Laszlo theorem for modules); EndoscopicTransferAndUnitaryTraceComparison §3.2 (`LocalLoopGrassmannian`); AlgebraicModuliForArithmeticGeometry §1.3 (coherent Grassmannians and partial flags).

### 1.2 Schubert bounds

Define SchubertBound by transport of the ordinary local Schubert schemes of GeometricSatakeAndFusion GS0, *Equal-characteristic Schubert models and coefficient comparison*. For dominant coweights (ωi), identify the one-leg fibre with that same reduced positive-loop orbit closure at t^ω. Over the disjoint-leg locus take their product and define `Gr_{I,ω}` as its reduced Zariski closure in the iterated BD Grassmannian. This differs in general from the larger representation-theoretic inequality bound `Gr_{I,≲ω}`; do not identify the two functors on nonreduced test rings without a theorem.

*Construction.* Transport the local schemes, strata and finite-jet actions through the formal-coordinate trivializations of §1.1; prove independence of the coordinate and compatibility on overlaps. Use factorization on the disjoint locus and then reduced closure in a finite ambient bound. Compare the transported strata with the local Bruhat order, retaining the distinction between reduced schemes and the full modification functor on nonreduced rings.

*Remark.* Retain closure and inequality notation separately.

The API:

- Dominant coweight tuple and reduced global closed support.
- Identify each one-leg fibre and its open stratum with the same ordinary local model and stratum.
- Reduced closure of the disjoint product, compatible with relabelling of legs.
- Transport the local finite-jet action to each bounded curve chart and compare it on overlaps.

**Checks.**

- ω=0 gives the unit section; under a coordinate change t↦at with a a unit, its position remains 0.
- For G_m each one-leg Schubert variety is a point; weights 1 and −1 collide to weight 0, whereas weights 1 and 1 collide to weight 2.
- For GL₂, (1,0) gives the same ordinary P¹ as the local model, whose quotient determinant has degree +1. Its perfection alone would not retain the nonzero tangent vectors P¹(k[ε]/ε²)→P¹(k), so the ordinary model is required.
- The GL₂ bound (2,0) contains the smaller stratum (1,1); keeping only its open orbit omits that stratum.

Source: [VL](#references), §1, Definition 1.12, p. 46.

*Needs:* [§1.1 *Beilinson–Drinfeld Grassmannians*](#11-beilinsondrinfeld-grassmannians); GeometricSatakeAndFusion GS0, *Equal-characteristic Schubert models and coefficient comparison* (`equalCharacteristicSchubertModels`).

### 1.3 Global Hecke chains

Define GlobalHecke. Hecke_I^(I₁,…,Ik) classifies the same modification chain without the final trivialization. On a fixed bound choose jets ni large enough that the loop action factors through `G_{Σni xi}`. The bounded Hecke stack is `(Gr_bound×_{X^I}Bun_{G,Σni xi})/G_{Σni xi}`; this gives its finite-dimensional local model and composition by gluing chains.

*Construction.* Use the final bundle’s finite-jet trivializations as a torsor. Identify the quotient with the modification moduli problem and establish the local model after smooth base change. Compose chains by forgetting intermediate bundles, keeping the leg partition.

*Remark.* No Satake theorem is needed for this construction.

The API:

- Bounded modification chains and all bundle projections.
- The finite jet quotient description.
- Concatenate chains and compare the two parenthesizations.

**Checks.**

- An empty chain is Bun_G with identical endpoint projections.
- A zero coweight gives the diagonal correspondence.
- For a torus composition adds coweights, with an identity modification giving zero.

Source: [VL](#references), §1, Definition 1.2, (1.8)–(1.9) and Lemma 1.14, pp. 42, 46–47.

*Needs:* [§0.3 *Full level structures*](#03-full-level-structures); [§1.2 *Schubert bounds*](#12-schubert-bounds).

### 1.4 ℓ-adic sheaves on stacks of finite type

Define StackSheaf.constructible. For an algebraic stack 𝒳 locally of finite type over k (a finite field or an algebraic closure of one), with ℓ invertible, and Λ one of O_E/λ^s, O_E or E, define the constructible derived category D_c(𝒳, Λ) on the lisse-étale site, with the operations f^∗, Rf_∗, Rf_!, Rf^!, ⊗ and RHom, the dualizing complex and Verdier duality, and the perverse t-structure with its intermediate extensions. Prove smooth and arbitrary base change for Rf_!, the projection formula, the Künneth formula and the fundamental triangle for an open–closed decomposition; on a Deligne–Mumford stack the étale site gives the same categories (for rational coefficients on a finite-type Deligne–Mumford stack over F_q, the étale theory is the supplied `dmStack_etaleCohomology` of DeligneWeightsAndPurity §8.24, and this target constructs its comparison with the lisse-étale theory, compatibly with that API, and extends it to the Artin stacks, coefficients and six operations stated here), and on a quotient [Y/H] by a smooth affine group H they are the H-equivariant categories of Y. Over F_q, prove the Grothendieck–Lefschetz trace formula for stacks of finite type: for a stratifiable, ι-mixed, convergent complex K₀ bounded above (Sun's class), the sum over the `F_{q^v}-points`, each weighted by the inverse order of its automorphism group, of the traces of Frobenius on stalks equals the absolutely convergent alternating trace of Frobenius on RΓ_c, and Rf_! preserves convergent complexes with the relative version of the formula. These are exactly the operations the shtuka stacks, Hecke stacks and their quotients by Ξ and by finite jet groups need; EtaleDualityAndPerverseSheaves and EtaleCohomologyFoundations state them for schemes.

The morphism f:𝒳→𝒴 is of finite type for the pushforward and extraordinary-operation statements. The domains are those of LO-I and LO-II: Rf_∗:D^+_c→D^+_c, Rf_!:D^−_c→D^−_c, f^∗ and Rf^! on D_c, RHom:(D^−_c)^op×D^+_c→D^+_c, and derived tensor D^−_c×D^−_c→D^−_c. The projection, base-change and Künneth comparisons use these domains, with the factors bounded above in the Künneth formula. Unbounded D_c retains the duality and gluing constructions; this does not assert that every operation is an endofunctor on all of D_c.

*Remark.* On a scheme these categories and operations restrict to those of EtaleCohomologyFoundations and EtaleDualityAndPerverseSheaves.

*Remark.* Rf_∗ and Rf_! need not preserve boundedness on stacks: the cohomology of B G_m is a polynomial ring Q_ℓ[c] with c in degree 2.

The API:

- The constructible derived category D_c(𝒳, Λ) on the lisse-étale site, with its full subcategories D^b_c and D^±_c.
- f^∗ and Rf^!, with identity and composition isomorphisms.
- Rf_∗ and Rf_!, with the forget-supports map Rf_! → Rf_∗ and the projection formula.
- For a cartesian square, b^∗ Rf_! ≅ Rf′_! a^∗.
- Rf_! of an external tensor product is the external product of the Rf_!.
- The dualizing complex Ω_𝒳 and D = RHom(−, Ω_𝒳), with biduality on D^b_c.
- The perverse t-structure glued from a smooth atlas, its heart, intermediate extension and simple objects.
- On a Deligne–Mumford stack the étale and lisse-étale theories agree, compatibly with atlas refinement, pullback and Frobenius; for rational coefficients over F_q the étale side is DeligneWeightsAndPurity §8.24's `dmStack_etaleCohomology`; on a scheme they are the scheme theory.
- For 𝒳₀ of finite type over F_q and K₀ bounded above, stratifiable, ι-mixed and convergent, the weighted point sum equals the convergent alternating trace of Frobenius on RΓ_c, with the relative version for Rf_!.

**Checks.**

- For a separated scheme of finite type the operations agree with the scheme operations of EtaleCohomologyFoundations; in particular Rf_! for an open immersion is extension by zero.
- For 𝒳 = B G_m over F̄_q, H^∗(𝒳, Q_ℓ) = Q_ℓ[c] with c in degree 2, so RΓ of the constant sheaf is not bounded; a theory restricted to D^b_c cannot contain it.
- For a finite constant group Γ over F_q, the Γ-torsors over F_q correspond to the conjugacy classes c of Γ, with automorphism groups the centralizers Z(c), so the weighted point count of B Γ is Σ_c 1/|Z(c)| = Σ_c |c|/|Γ| = 1; this equals the Frobenius trace on H^∗_c(B Γ, Q_ℓ), which is Q_ℓ in degree 0.
- For B G_m over F_q the weighted point count is 1/(q − 1) = `Σ_{i ≥ 1}` `q^{−i}`, matching the convergent alternating trace of Frobenius on H^∗_c(B G_m), which is Q_ℓ(i) in degree −2i for i ≥ 1.
- On the Deligne–Mumford stack B C₂ over F_q with E coefficients, the sign local system has H⁰ = 0 and the constant local system has H⁰ = E, also when ℓ = 2; the comparison with `dmStack_etaleCohomology` must keep these two values apart, so it cannot be a comparison of underlying coefficient spaces that forgets the C₂-action.

Source: [LO-I](#references), Theorem 2.3.3, p. 11; §§3.3–3.5, pp. 23–25; §4, pp. 29–37; §5, Theorem 5.5.6, p. 47, and Theorem 5.7.5, p. 61; [LO-II](#references), Theorems 7.5 and 7.7, pp. 20–23; §9, p. 25; Theorem 11.4, p. 30; Theorem 12.1, p. 31; [LO-P](#references), Theorem 4.2, p. 6; Theorem 5.1, p. 7; §6, p. 9; Theorem 8.2, p. 12; [Sun](#references), Theorem 1.1, p. 2; Theorem 4.2(ii), p. 29; §5, p. 37.

*Needs:* SchemeAndStackFoundations Layer 1 (§§1.1, 1.15–1.16 descent, torsors and contracted products; §§1.18–1.21 algebraic and Deligne–Mumford stacks, inertia and quotient stacks); EtaleCohomologyFoundations §§F.0.1, F.0.3, F.1 and F.2.1–F.2.7 (constructible coefficients, Tate twists, compact support, base change and Künneth); EtaleDualityAndPerverseSheaves §0.5 (global Verdier and Poincaré duality); EtaleDualityAndPerverseSheaves Layer 2 (§2.4 the perverse t-structure, §2.10 intersection complexes, §2.12 small and semismall maps); EtaleCohomologyFoundations §§F.10.1–F.10.5 (finite-field descent, Frobenius comparison and traces); DeligneWeightsAndPurity §8.24 (`dmStack_etaleCohomology` with its atlas, refinement, pullback, Frobenius and finiteness API).

### 1.5 Fusion smallness and convolution

For globally moving legs, the proper map forgetting intermediate bounded modifications is small and is an isomorphism over distinct legs. Its restriction to the full collision diagonal is semismall, not generally small. Consequently proper pushforward identifies the relevant global IC objects, and convolution on the diagonal preserves perversity.

*Proof.* Stratify X^I by collisions. Over the open stratum forgetting is an isomorphism. Reduce each collision block to local convolution, whose fibre dimensions are bounded by semismall Bott–Samelson geometry. The codimension of each non-open collision stratum supplies the strict inequality globally. Apply the small-map IC theorem.

*Remark.* For GL₂ two standard minuscule modifications, the collision fibre over the central coweight (1,1) is P¹; the local map is semismall with equality.

*Remark.* Do not infer local smallness by restricting global smallness to the diagonal.

Source: [Var](#references), Appendix A, Lemma A.12, p. 35; Proposition A.13, pp. 35–36.

*Needs:* [§1.3 *Global Hecke chains*](#13-global-hecke-chains); [§1.4 *ℓ-adic sheaves on stacks of finite type*](#14-ℓ-adic-sheaves-on-stacks-of-finite-type); EtaleDualityAndPerverseSheaves Layer 2 (§2.4 the perverse t-structure, §2.10 intersection complexes, §2.12 small and semismall maps).

### 1.6 Minuscule Hecke geometry at Iwahori level

Define IwahoriHecke. For μ∈{±1}^r, Hk_n^μ(Σ) consists of Iwahori bundles E₀,…,Er and legs xi, with `E_{i−1}→Ei` for μi=1 (the reverse for −1) an injection with invertible cokernel on Γxi preserving every flag step. Legs may meet Σ. Every bundle projection is smooth of relative dimension rn; the bundle-and-leg projection is flat of relative dimension r(n−1), smooth over (X−Σ)^r. Quotient by simultaneous Picard tensoring gives the PGL_n version.

*Construction.* Reduce to one modification and a single level point. Write compatible lines in the projectivizations of the periodic lattice chain; in an étale chart the equation is a product of selected coordinates equal to the leg coordinate t. This equation proves flatness, while forgetting t gives smoothness; off Σ recover a projective bundle. Descend through the Picard action.

*Remark.* At a level point flatness does not imply smoothness over the leg base.

The API:

- Signed minuscule chains including level-leg collisions.
- Every intermediate bundle and each leg.
- Étale chart ∏a_j=t, with the actual chosen coordinate subset.
- Picard quotient preserves the stated smoothness and flatness properties.

**Checks.**

- r=0 gives Bun_n(Σ).
- One GL₂ leg off Σ has fibre P¹ over its bundle and leg.
- At a nodal GL₂ level chart ab=t, the t=0 fibre is singular although the total chart A² and bundle projection are smooth.

Source: [YZ](#references), §3.1.3, Definition 3.3 and Proposition 3.4, pp. 19–20 (arXiv v2).

*Needs:* [§0.4 *Iwahori flags and fractional twists*](#04-iwahori-flags-and-fractional-twists); [§1.3 *Global Hecke chains*](#13-global-hecke-chains).

### 1.7 The classical Satake category

Define ClassicalSatake. For split connected reductive G and coefficient field E of characteristic zero with ℓ≠p, Sat_G is the category of positive-loop-equivariant perverse E-sheaves on Gr_G over F̄_q with finite-dimensional closed support. Convolution uses the twisted product and proper multiplication; the unit is the skyscraper at the unit coset. Total cohomology is the fibre functor after the modified commutativity convention. Finite-field Satake coefficient sheaves carry the specified normalized descent datum; arbitrary Frobenius structures are additional data, treated by the arithmetic Satake category of §1.11.

*Construction.* Define equivariance through finite jets on each support. Descend the exterior product to the twisted product and push it along multiplication. Use semismallness for perversity and fusion for associativity; retain the coefficient-field restriction for semisimplicity.

*Remark.* With coefficients of characteristic ℓ the category is not semisimple; this layer uses positive-characteristic coefficients only through the integral version [§1.14 *Integral geometric Satake*](#114-integral-geometric-satake).

The API:

- Finite-support positive-loop-equivariant perverse sheaves.
- Monoidal convolution with unit and associator.
- Total cohomology with finite-dimensional E-values.
- Simple objects are IC closures indexed by dominant coweights.

**Checks.**

- For G_m, convolution of delta_m and delta_n is `delta_{m+n}`.
- The unit IC_0 convolves identically on either side.
- For GL₂, standard⊗standard has symmetric-square and determinant summands; convolution cannot be defined as pointwise tensor product on the same support.
- For G=1 the geometric category is finite-dimensional E-vector spaces. Over F_q the one-dimensional sheaves with Frobenius +1 and −1 are distinct, although their geometric fibres agree; the entire arithmetic category cannot be identified with Rep_E(1).

Source: [MV](#references), §2, pp. 3–7; §3, pp. 7–13; §§4–6, pp. 13–21; §7, pp. 23–24; [Ric](#references), Theorem 0.1, p. 2, and Theorem 5.1, p. 20 (geometric and arithmetic categories).

*Needs:* [§1.4 *ℓ-adic sheaves on stacks of finite type*](#14-ℓ-adic-sheaves-on-stacks-of-finite-type); [§1.5 *Fusion smallness and convolution*](#15-fusion-smallness-and-convolution); EtaleDualityAndPerverseSheaves Layer 2 (§2.4 the perverse t-structure, §2.10 intersection complexes, §2.12 small and semismall maps); DeligneWeightsAndPurity DWP.0 (§0.12 weights under a finite extension of the base field, §0.15 twists and Tate twists); EtaleCohomologyFoundations §F.8 (perverse t-structures over a field).

### 1.8 Satake signs and Tate normalization

Correct the geometric fusion commutativity by an extra minus sign when both objects lie on odd-dimensional components. Then total cohomology has the ordinary symmetric tensor constraint. With a fixed square root of q, normalize IC by the relative dimension shift and half Tate twist, so the spherical trace convention matches normalized Satake.

*Proof.* Fusion gives the super commutativity on total cohomology. Grade connected components by orbit-dimension parity and remove the super sign on odd-odd exchanges. Track the dimension shift and chosen square-root Tate twist in the function-sheaf dictionary.

*Remark.* For a torus all orbit dimensions are zero.

*Remark.* For the GL₂ standard minuscule P¹ support, odd-odd exchange needs the extra sign.

Source: [MV](#references), §6, Lemma 6.1 and Proposition 6.3, pp. 19–20; [VL](#references), §1, Remarks 1.19 and 1.21, pp. 50–51.

*Needs:* [§1.7 *The classical Satake category*](#17-the-classical-satake-category); DeligneWeightsAndPurity DWP.0 (§0.12 weights under a finite extension of the base field, §0.15 twists and Tate twists).

### 1.9 Classical geometric Satake

The corrected symmetric tensor category Sat_G with its total-cohomology fibre functor is equivalent to Rep_E(Ĝ), where Ĝ has the dual based root datum. A chosen Borel and pinning identify the reconstructed group with the chosen dual group. For moving legs this yields ULA coefficient sheaves `S_{I,W}`, functorial in W, compatible with disjoint factorization, convolution, all coalescence maps and relative IC normalization.

*Proof.* The semi-infinite orbits give weight functors: compactly supported cohomology along them is concentrated in degree ⟨2ρ, ν⟩, and their sum is an exact faithful tensor fibre functor. Apply the neutral Tannakian reconstruction of MotivesAndAlgebraicCycles §§6.1–6.2 to Sat_G with this fibre functor; the Satake-specific hypotheses are established here: Sat_G is E-linear abelian and rigid with End(1) = E, and after the sign correction of §1.8 the fibre functor is symmetric monoidal with the ordinary symmetry (MV §§7 and 11). Identify the reconstructed group, its torus and its root datum through the weight functors and restriction to rank-one Levi subgroups (MV §12). Over a finite field with ℓ-adic coefficients the equivalence is Richarz's theorem: over a separably closed field (Ric, Theorem 0.1) and, after Galois descent, over any field with the full L-group (Ric, Theorem 5.1). The relative version over X^I — ULA Satake sheaves that are perverse on every geometric fibre after the shift by dim X^I, with fusion and coalescence — is part of this target. Globalize by descent along the torsor of formal coordinates and by Beilinson–Drinfeld fusion; VL Theorem 1.17 states the multi-leg compatibilities used later.

*Remark.* For a torus obtain the dual torus and its coweight grading: for G_m the reconstructed coordinate ring is E[z, z⁻¹] with antipode z ↦ z⁻¹, and for G = 1 it is E.

*Remark.* For GL₂ the minuscule IC gives the standard dual representation and associativity agrees under triple fusion.

Source: [MV](#references), §7, Theorem 7.3, p. 23; §11, Proposition 11.1, p. 31; §12, Theorem 12.1, pp. 33–38; [Ric](#references), Theorem 0.1, p. 2; Theorem 5.1, p. 20; [VL](#references), §1, Theorem 1.17, pp. 48–50.

*Needs:* [§1.8 *Satake signs and Tate normalization*](#18-satake-signs-and-tate-normalization); MotivesAndAlgebraicCycles §§6.1–6.2 (neutral fibre data, finite reconstruction, and the reconstructed group with its antipode); Tau Ceti `TauCeti.FGPointRepresentationCat` (finite-dimensional algebraic representations of the dual group); ReductiveGroups Layers 0, 1 and 7 (functor of points, representations as comodules, structure theory); ReductiveGroupsPartII §§RG2.5.1–RG2.5.2 (the dual group with its Galois action, and the L-group); ReductiveGroups Layers 8–9 (classification by root data, pinned Chevalley groups); EtaleCohomologyFoundations §F.2.3 (local and universal local acyclicity).

### 1.10 Central action on Satake sheaves

For split connected reductive G, the positive-loop action of Z(G) on the bounded Grassmannian and its rational Satake sheaves is trivial; central tensoring of the bundle factor therefore preserves the coefficient sheaf. Construct directly the Gᵃᵈ-positive-loop equivariance of the Satake coefficient functor on every bounded support. If a is this action and pr₂ the projection on the product of the adjoint positive-loop group with the support, the linearization is an isomorphism `a^* S_{I,W}` ≃ `pr_2^* S_{I,W}`, natural in W, with the identity and multiplication cocycles. Its pullback along L⁺G→L⁺Gᵃᵈ is the given L⁺G-linearization. On each fixed support both the action and the linearization factor through sufficiently large adjoint finite jets, compatibly with increasing the jets and the support. Prove compatibility with convolution, disjoint factorization, fusion, coalescence and the total-cohomology fibre functor, and with pinned automorphisms of G. No smoothness hypothesis on Z(G) is imposed.

*Proof.* Follow VL Remark 1.20: use the projective objects representing the weight functors on a finite union of Schubert strata, their reconstruction of the Satake category and the central triviality in the MV construction, §9, (9.9). Construct the adjoint linearizations on these projective presentations and their morphisms, and pass to the represented Satake functor. This is a construction of adjoint equivariance, not an inference of surjectivity of L⁺G→L⁺Gᵃᵈ. In the étale setting of §1.9 prove the same reconstruction and the finite-jet formulation stated by VL. Establish the tensor and fusion coherences on the convolution and fusion diagrams, with their unit and associativity constraints; naturality under pinned automorphisms supplies the mixed inner–outer cocycles. Transport these linearizations to the Hecke and shtuka coefficients.

The API:

- Trivial central-loop linearization and invariance under central tensoring of the bundle factor.
- Adjoint linearizations on bounded Satake sheaves, functorial in coefficients, supports and sufficiently large finite jets.
- Identity, multiplication and inner–outer cocycles, compatible with the tensor, fusion and fibre-functor comparisons.

**Checks.**

- For G_m the adjoint group is 1: a central unit fixes the lattices of exponents 0 and 1 and acts as the identity on both delta sheaves. Nevertheless 2 in Z(Ĝ)(E) acts by 2 on the dual weight-one representation; central-loop triviality does not trivialize the dual centre.
- On the GL₂ minuscule P¹ over F₅, h = class(diag(1,2)) sends [1:1] to [1:2] and its inverse sends it to [1:3]. Multiplying the representative by the central scalar 3 leaves [1:2] unchanged, while replacing the adjoint action by the trivial action would give [1:1].
- On that P¹ let h₁ = class(diag(1,2)) and h₂ = class([[1,1],[0,1]]). Both h₁(h₂[1:1]) and (h₁h₂)[1:1] are [2:2]=[1:1], whereas h₂(h₁[1:1])=[3:2]; the cocycle must retain the order of noncommuting transitions.
- For G=1 the adjoint linearization of the unit coefficient is the identity. For G_m fusion of weights 1 and −1 gives weight 0 and identity linearization on either side, including after the legs collide.

*Remark.* Distinguish this geometric central-loop action from the possibly nontrivial action of Z(Ĝ) on a representation.

Source: [VL](#references), §1, Theorem 1.17(a)–(d), pp. 48–50, and Remark 1.20, p. 51; §12.3.1, Theorem 12.16, p. 157; [MV](#references), §9, Proposition 9.1, Corollary 9.2 and (9.9), pp. 27–28 (projective reconstruction).

*Needs:* [§0.10 *Central lattices and finite quotients*](#010-central-lattices-and-finite-quotients); [§1.9 *Classical geometric Satake*](#19-classical-geometric-satake).

### 1.11 Nonsplit Satake descent

On the full reductive open U, descend split Satake along étale local trivializations of the fixed model, as in §0.12. On overlaps, the group isomorphisms act on the Grassmannians and their equivariant Satake sheaves. An inner transition is conjugation by a section of the split adjoint group; apply the directly constructed adjoint positive-loop linearizations and their finite-jet, tensor and fusion coherences from §1.10 on bounded supports, including when the centre is nonsmooth. Prove the cocycle on triple overlaps and compatibility with convolution, fusion and the fibre functor. The finite cover associated to Q records only the pinned outer action; it need not trivialize the reductive model. The resulting global coefficient functor is indexed by algebraic representations of Ĝ⋊Q and is compatible with restriction of the prescribed Γ→Q projection. Geometric and algebraic actions differ by the Tate/pinning normalization and must be compared explicitly.

Over a field k₀, the full arithmetic Satake category is equivalent to representations of Ĝ⋊Gal(k₀^sep/k₀) with algebraic Ĝ-action, with continuous arithmetic action on a finite-dimensional vector space over one finite extension of Q_ℓ, as specified in Ric Theorem 5.1. Here k₀=F_q for §1.7 and k₀=F at the generic point for nonsplit descent. The normalized finite-form L-group coefficient functor above is a specified subfunctor of this arithmetic category, not a description of the full category. Before the pinning comparison the semidirect product uses the geometric Galois action; the following comparison transports it to the pinned action.

For fixed legs, extend the coefficient functor as follows (VL §12.3.1, pp. 158–159). Assign each leg either the moving base U∖|N| with group ᴸG or a fixed good place v with group ᴸG_v; each block of the ordered partition has one such assignment. For a representation of the product of these groups, construct the Satake sheaf on the corresponding product of moving and fixed leg bases. Restriction of a global representation to the local groups agrees with specialization of its global Satake sheaf. Every local representation V is a direct summand of the restriction of the finite-dimensional algebraic global representation obtained by inducing V from ᴸG_v to ᴸG: inclusion into and projection from the identity-coset summand give maps i,p with pi=id_V. For several legs take the corresponding exterior products; induction is used to obtain a retract, not as a tensor functor. Split the specialized coefficient idempotent ip, prove independence of the containing global representation, and compare coefficient morphisms, duals, evaluation and coevaluation. In the shtuka cohomology construction these comparisons must intertwine the induced projections, the Frobenius correspondences returning a fixed v-leg after deg v iterates with residue-field descent, and creation and annihilation after specialization; the identities involving these operations are proved in §§3.6 and 5.10.

The descent and coefficient API includes:

- Isomorphism and refinement of étale trivializations induce coherent identifications on all bounded supports and coefficient sheaves.
- Inner transitions give canonical descent maps by the adjoint linearization, with its identity and multiplication cocycles and its compatibility with the outer action and tensor structure.
- Specialization at a fixed leg identifies global coefficients with their restricted local coefficients; splitting a local idempotent commutes with coefficient morphisms and the allowed fusion maps.
- Evaluation and coevaluation on a local summand agree with those obtained by inserting its inclusion and projection into the global coefficients.

**Checks.**

- For G=1, a rank-one lisse E-sheaf with Frobenius 1+ℓ is arithmetic Satake data of infinite order and cannot factor through any finite Q.
- For the same trivial group Frobenius −1 factors through a quotient of order two (also when ℓ=2 in characteristic-zero coefficients).
- For a nonsplit unramified norm-one torus Frobenius acts by −1 on its rank-one character lattice; trivial arithmetic action would give the wrong spherical algebra.
- For GL(O⊕O(1)) on P¹/F₃ the outer quotient is Q=1, while the two affine charts have transition Ad diag(1,t). Conjugation sends E₁₂ to t⁻¹E₁₂ and E₂₁ to tE₂₁; these transitions recover O(−1) and O(1) rather than constant root lines. Equivariant descent includes the still-good point ∞.
- With Q=C₂×C₂, Q_v the first factor, and the second factor inverting a split dual-torus character z, a local weight-one V need not extend globally. Induction has dimension 2; on restriction its weights are z and z⁻¹, and the identity-coset projector is diag(1,0), with p i=1 and (ip)²=ip. Taking the trace after this projector gives z, whereas omitting it gives z+z⁻¹.
- For SL₂ over F₂, h(t) = class(diag(1,1+t)) in PGL₂(R[[t]]) has no lift to SL₂(R[[t]]) for any nonzero F₂-algebra R, even after a faithfully flat coefficient extension. Such a lift would require a scalar unit a(t) with a(t)²(1+t)=1: its constant coefficient gives a₀²=1 and its t coefficient gives a₀²=0. The contradiction already holds modulo t² and for nonreduced R. The model SL(O⊕O(1)) on P¹/F₂ has this inner transition at the good point x=1, with t=x−1. Direct adjoint equivariance applies there despite the failure of positive-loop lifting; U remains all of X.
- When Q_v=Q, induction and the identity-coset projector are the identity; restricting the trivial coefficient gives the trivial coefficient, with evaluation after coevaluation equal to 1.
- For G = PGL₂ split, so Ĝ = SL₂ with trivial pinned action, γ with cycl(γ) = 3 and u(x) the upper unipotent matrix, the map displayed in Ric Corollary 5.8 sends the product (1,γ)·(u(1),1) of the pinned L-group to (u(1/3),γ), while the product of the two images in the geometric L-group is (u(3),γ). The corrected map below sends both to (u(1)c(γ)⁻¹,γ).

The comparison between the geometric Galois action on Ĝ obtained by Tannakian descent and the algebraic action through a pinning is Ric, Proposition 5.6, p. 22: act_geo(γ) = act_alg(γ) ∘ Ad χ(γ) with χ = ρ ∘ cycl, where cycl is the ℓ-adic cyclotomic character and ρ, the half-sum of positive coroots of Ĝ, is viewed as a cocharacter of Ĝ_ad. To compare the semidirect products, fix a half Tate character ε of Gal(k₀^sep/k₀) with ε² = cycl and put c(γ) = (2ρ)(ε(γ)) in the maximal torus of Ĝ; c is a homomorphism whose image in Ĝ_ad is χ(γ). Then (g,γ) ↦ (g·c(γ)⁻¹, γ) is an isomorphism from Ĝ ⋊ Gal(k₀^sep/k₀) with the pinned action to the same group with the geometric action: multiplicativity follows from act_geo(γ) = act_alg(γ) ∘ Ad c(γ) and from act_alg(γ)(c(δ)) = c(δ), since pinned automorphisms fix 2ρ. This corrects the map displayed in Ric, Corollary 5.8 (Source corrections, E7). For k₀ = F_q the fixed square root of q gives ε, with ε(arithmetic Frobenius) = √q, and for k₀ = F the cyclotomic character factors through the constant field, so the same ε serves; these are the two cases used here. The half Tate character is a genuine hypothesis: for k₀ = R, cycl(complex conjugation) = −1 has no square root among the characters of Gal(C/R). This twist is the Tate normalization fixed above.

*Proof.* Construct descent on the étale trivializations with both inner and outer transition maps, prove the cocycle and independence under refinement, and descend fusion and convolution. For fixed legs use finite-index induction and its local retract, then split the corresponding coefficient idempotents and compare the evaluation and coevaluation diagrams. Compare the geometric and pinned semidirect products by the map (g,γ) ↦ (g·c(γ)⁻¹, γ) above. Keep the action on coefficients distinct from the Weil action on the base.

*Remark.* A split group has trivial Q action.

*Remark.* For a nonsplit torus the dual-character lattice carries the actual Galois action.

Source: [VL](#references), §1, Remark 1.20, p. 51; §12.1, pp. 148–149; §12.3.1, Theorem 12.16 and the fixed-leg extension (12.9)–(12.10), pp. 157–159; §12.3.5(e′), pp. 164–165; [Ric](#references), Theorem 5.1, p. 20; Proposition 5.6 and Corollary 5.8, p. 22.

*Needs:* [§0.12 *Nonsplit bundle descent*](#012-nonsplit-bundle-descent); [§1.9 *Classical geometric Satake*](#19-classical-geometric-satake); [§1.10 *Central action on Satake sheaves*](#110-central-action-on-satake-sheaves); SchemeAndStackFoundations §§1.15–1.16 (torsors and contracted products); LanglandsParameterStacks §LP0.1 (restriction and functoriality of crossed cocycles); ReductiveGroupsPartII §§RG2.5.1–RG2.5.2 (the dual group with its Galois action, and the L-group).

### 1.12 Normalized spherical Satake

At a good place v∈U∖|N| with hyperspecial model, normalize vol(G(O_v)) = 1. For split G, the classical Satake isomorphism of SmoothRepresentationsOfLocalGroups §SR.4.1, with a fixed square root of q, identifies the spherical E-Hecke algebra with E ⊗_Z K₀(Rep Ĝ); for a split torus it is the group algebra of the cocharacter lattice. For irreducible V of highest weight ω, let `h_{V,v}` be the image of [V]. It takes values in O_E, the `h_{V,v}` form an O_E-basis of the integral spherical Hecke algebra, and `h_{V,v}` = `(−1)^{⟨2ρ,ω⟩}` Tr(Frob_v, S_V), with the half Tate twist already fixed. For nonminuscule V the trace of the intersection complex is not the characteristic function of a single double coset.

For unramified nonsplit G, use Q_v and ᴸG_v of the Conventions. The spherical algebra is the algebra of regular functions on the semisimple twisted-conjugacy quotient of the coset Ĝ⋊Frob_v in ᴸG_v. For a finite-dimensional algebraic representation V of ᴸG_v, let `h_{V,v}` be the image of its character restricted to that coset; these local twisted characters span the spherical E-algebra. Their coefficient sheaves are the fixed-leg functor of §1.11. Characters of the global group ᴸG alone need not span this algebra when Q_v is a proper subgroup of Q. For an unramified torus T this is `E[X_*(T)^{Frob_v}]`.

**Checks.**

- For split G_m the lattice is Z and the algebra is E[z,z⁻¹].
- For the norm-one torus of an unramified quadratic extension, Frobenius acts by −1 on Z. Its invariant lattice is 0, T(K)=T(O_K), and the spherical algebra is E. Using the full dual representation ring would give the incorrect E[z,z⁻¹].
- For the GL₂ standard representation the split normalization gives q_v^(−1/2) on its minuscule open double coset; the perverse IC trace has the opposite sign.
- Over F₃(t), take T the product of the norm-one tori of F(√t)/F and F(√(t−1))/F and v=(t−2). The residues 2 and 1 make Frobenius invert the first dual coordinate and fix the second, so Q=C₂×C₂, Q_v=C₂ and the local spherical algebra is E[z,z⁻¹]. A local weight-one character on the second coordinate has trace z; global characters are invariant under z↦z⁻¹. At z=2 and z=1/2 the local character has values 2 and 1/2, whereas each global character has equal values; local coefficients are necessary.

*Proof.* Take the classical Satake isomorphism from SR.4.1, and identify the traces by the sheaf–function dictionary and the compatibility of geometric Satake with convolution. Evaluate the normalized IC traces on local double cosets and compare the triangular bases in dominance order. In the nonsplit case use VL (12.4): restriction of characters of ᴸG_v spans the regular conjugation-invariant functions on its Frobenius coset, since Q_v is cyclic generated by Frob_v and conjugation by ᴸG_v gives the same classes there as conjugation by Ĝ.

*Remark.* h_1 is the unit `1_{G(Ov)}`.

*Remark.* For G_m the basis is `δ_{π^m}` and multiplication adds m.

Source: [VL](#references), §1, after Theorem 1.17 and Remarks 1.20–1.21, pp. 51–52; §12.1, (12.4) and the following paragraph, p. 151; §12.3.1–§12.3.2, pp. 157–161; §6.1, Proposition 6.2, p. 75.

*Needs:* [§0.14 *Cuspidal functions and bundle functions*](#014-cuspidal-functions-and-bundle-functions); [§1.9 *Classical geometric Satake*](#19-classical-geometric-satake); SmoothRepresentationsOfLocalGroups §SR.4.1 (the Satake transform and isomorphism); [§1.11 *Nonsplit Satake descent*](#111-nonsplit-satake-descent), for the nonsplit trace comparison.

### 1.13 Determinant lines and opposition signs

On the equal-characteristic GL_n locus Λ⊂R[[t]]ⁿ with locally free rank-N quotient, define the Satake determinant line by applying the determinant functor of AlgebraicVectorBundles to this quotient: its fibre is ∧^N_R(R[[t]]ⁿ/Λ). Its API is:

- Pullback of a finite locally free quotient pulls back its determinant line.
- A lattice chain gives the determinant isomorphism for its short exact sequence of quotients.
- These isomorphisms agree for a three-step refinement and identify the determinant of the zero quotient with the coefficient ring.

In the simply connected semisimple complex setting of Lusztig–Yun, the normalized opposition anti-involution acts on unshifted `IH^{2j}(Gr≤λ)` by (−1)^j. This is the equal-characteristic input to their numerical identity used by Zhu; the mixed-characteristic Satake theorem belongs to GeometricSatakeAndFusion.

*Proof.* Use the actual finite locally free R-module quotient for the determinant line; its determinant is compatible with families and modification chains. Identify opposition as a monoidal automorphism under equal-characteristic Satake and compute its torus element (−1)^ρ. Normalize by the identity on the open orbit and translate the 2ρ grading to the sign (−1)^j on unshifted intersection cohomology.

**Checks.**

- For Λ=R[[t]]ⁿ, N=0 and the determinant line is canonically R.
- For `Λ=tR[[t]]e₁⊕⊕_{i>1}R[[t]]e_i`, the quotient is Re₁ and scaling e₁ by a unit a acts on the line by a, rather than a⁻¹. This fixes determinant versus inverse determinant.
- For Λ=tR[[t]]², swapping the two quotient basis vectors acts by −1 on ∧²R². Over a ring of characteristic two it acts by +1, as required by the same determinant formula.
- For unshifted IH⁰ and IH² the normalized opposition signs are respectively +1 and −1; shifting the grading before applying this formula fails the second value.

Source: [Zhu](#references), §0.1.4, p. 3; §0.2, pp. 4–5; [LY](#references), arXiv:1203.0521v1, Lemma 3.3 and §3.4, pp. 9–11.

*Needs:* [§1.9 *Classical geometric Satake*](#19-classical-geometric-satake); AlgebraicVectorBundles Layer L0C (exterior powers and determinant); SchemeAndStackFoundations Layer 1 (§§1.1, 1.15–1.16 descent, torsors and contracted products; §§1.18–1.21 algebraic and Deligne–Mumford stacks, inertia and quotient stacks).

### 1.14 Integral geometric Satake

For the split equal-characteristic affine Grassmannian over F̄_q, geometric Satake over O_E identifies representations of the pinned dual group on finitely generated O_E-modules with the integral Satake category, compatibly with weight functors, fusion and extension to E. Its restriction identifies finite free representations with the flat Satake objects. Convolution for general coefficients uses zeroth perverse cohomology of the derived exterior product before descent and proper pushforward; for flat objects this truncation is unnecessary. On the moving-leg Grassmannian construct the fully faithful coefficient functor `Sat^{O_E}_{G,I}` on all finitely generated coefficient representations, including torsion, with the specified finite-field descent, as in Xue-I Theorem 1.1.5. The API is:

- The coefficient functor is fully faithful on all finitely generated coefficient representations.
- Fusion is natural in coefficients and coherent under successive coalescences.
- Flat Satake objects correspond exactly to finite free representations.
- Extension of scalars to E gives the rational coefficient functor and its fusion comparisons.
- The direct adjoint linearizations of §1.10 extend to the integral and torsion coefficient functors, with the same identity, multiplication and fusion coherences, compatibly with extension and reduction of coefficients.

The construction uses the standard integral perverse t-structure; Verdier duality need not preserve that heart. Invariant vectors and covectors give integral creation and annihilation by functoriality. No semisimplicity is asserted over O_E or its residue field.

*Proof.* Use the integral weight-functor reconstruction and the same pinned root datum as the rational theorem. Extend from finite free coefficients to finitely generated coefficients by presentations and the right-exact perverse tensor product, preserving the fusion comparisons. Use the standard integral perversity, without invoking preservation by Verdier duality (EtaleDualityAndPerverseSheaves §§2.3–2.5, the integral perversity and its dual). Transferring MV's integral reconstruction, proved for the complex topology, to étale O_E-sheaves on the equal-characteristic Grassmannian over F̄_q is part of this target; Xue-I §§1.1.1–1.1.7 specify its moving-leg coefficient functor. Carry the projective reconstruction and direct adjoint linearizations of VL Remark 1.20 through the same coefficient presentations; do not use positive-loop lifting for integral or torsion coefficients.

*Remark.* Extension of scalars to E recovers [§1.9 *Classical geometric Satake*](#19-classical-geometric-satake).

*Remark.* Reduction modulo λ need not preserve semisimplicity or diagonalizability of the Hecke action.

**Checks.**

- At the unit point the representation O_E/λ gives the torsion skyscraper O_E/λ, so the coefficient functor is not confined to free modules.
- For G_m, the weight-one object with coefficient O_E/λ has identity adjoint linearization, before and after reduction; its convolution with weight −1 and coefficient O_E has weight 0 and coefficient O_E/λ, with identity linearization on both sides.
- The derived tensor of two copies of O_E/λ at the unit has nonzero Tor₁ in degree −1; its zeroth perverse cohomology is O_E/λ, the ordinary coefficient tensor product. Omitting the perverse truncation fails this test.
- For G_m, convolution of a weight-m object with coefficient M and a weight-n object with coefficient M′ has weight m+n and coefficient `M⊗_{O_E}M′`; for M=M′=O_E it agrees with the flat convolution and rationalizes to the E-valued rule.

Source: [VL](#references), §13, proof of Proposition 13.1, pp. 166–167; Theorem 1.17 and Remark 1.20, pp. 48–51; [MV](#references), §4, (4.2), p. 13, and Theorem 12.1, pp. 33–37; [Xue-I](#references), §§1.1.1–1.1.7, Theorem 1.1.5, pp. 5–6.

*Needs:* [§1.5 *Fusion smallness and convolution*](#15-fusion-smallness-and-convolution); [§1.9 *Classical geometric Satake*](#19-classical-geometric-satake); [§1.10 *Central action on Satake sheaves*](#110-central-action-on-satake-sheaves); EtaleDualityAndPerverseSheaves Layer 2 (§2.4 the perverse t-structure, §2.10 intersection complexes, §2.12 small and semismall maps); ReductiveGroupsPartII §§RG2.5.1–RG2.5.2 (the dual group with its Galois action, and the L-group).

### Examples

- *Tori.* For G = G_m the one-leg Grassmannian has the discrete set Z of geometric points, every Schubert variety is a point, convolution adds coweights, and the Satake category is the category of Z-graded vector spaces, matching Rep(G_m) = Rep(Ĝ).
- *GL₂, minuscule.* For the coweight (1, 0) the Schubert variety is P¹, already closed; its normalized intersection complex goes to the standard representation of GL₂ = Ĝ. The convolution of two copies decomposes as the symmetric square plus the determinant, and the collision fibre of the two-step chain over the central coweight (1, 1) is P¹, which shows the semismall equality case in [§1.5 *Fusion smallness and convolution*](#15-fusion-smallness-and-convolution).
- *Signs.* On the P¹ support of the GL₂ minuscule sheaf, cohomology sits in odd shifted degrees, so the fusion commutativity must be corrected by a sign before the fibre functor is symmetric ([§1.8 *Satake signs and Tate normalization*](#18-satake-signs-and-tate-normalization)); for tori no correction is needed.

### Dependencies

Layer 0; ReductiveGroups and ReductiveGroupsPartII §RG2.5; Tau Ceti `TauCeti.FGPointRepresentationCat`; MotivesAndAlgebraicCycles §§6.1–6.2; SchemeAndStackFoundations Layer 1; RelativeFarguesFontaine §6.5; EndoscopicTransferAndUnitaryTraceComparison §3.2; GeometricSatakeAndFusion GS0, *Equal-characteristic Schubert models and coefficient comparison*; EtaleCohomologyFoundations §§F.0–F.2, F.2.3 and F.8; EtaleDualityAndPerverseSheaves Layers 0, 2 and 5; DeligneWeightsAndPurity DWP.0 and §8.24; SmoothRepresentationsOfLocalGroups §SR.4.1; LanglandsParameterStacks §LP0.1.

## Layer 2: global shtukas and their cohomology

This layer constructs the stacks of shtukas as Hecke stacks pulled back along the graph of Frobenius, their finite-type truncations and smooth local models, and the compactly supported cohomology sheaves over the leg base in every degree. The bound on the source and on the target of every partial Frobenius and Hecke map is kept visible: these maps can enlarge a Harder–Narasimhan bound, so they act on the directed system of truncations, never on one fixed truncation. The fractional-infinity shtukas of Yun–Zhang and the PGL₂ horocycle geometry are specified specializations with their own degree and parity conditions. Standing hypotheses are those of Layer 1.

### 2.1 Global shtukas

Define GlobalShtuka. For legs in U∖|N|, where U is the reductive open of the chosen model, and an ordered partition of I, `Cht_{N,I,W}` classifies bundles E₀,…,Ek with compatible full levels, bounded modifications `E_{j−1}≃Ej` away from the legs in Ij, and a level-preserving isomorphism Ek≃τE₀, where τ=(id_X×Frob_S)∗. It is the Hecke correspondence pulled back along the Frobenius graph of `Bun_{G,N}`. The W-support is pulled back from the reduced global Schubert support.

*Construction.* Form the stack fibre product, using actual isomorphisms at its two endpoints. Pull back the bounded Grassmannian support along the local-model map. Check the determinant/Kottwitz condition for nonemptiness: the total modification class must vanish when the closing twist has degree zero.

*Remark.* For split G, admissibility is Σ[ωi]=0 in π₁(G), equivalently the diagonal dual centre acts trivially on the tensor representation.

The API:

- The bundles, levels, modifications, legs and closing Frobenius isomorphism.
- The morphism to U^I.
- Forget the closing isomorphism.
- Fibre product with the specified reduced Schubert support.
- For the constant GL_r model, r≥1, a natural equivalence with AutomorphicLFunctionsAndLocalFactors §AL.3’s `TwoLegShtuka` and its full-level extension, as specified below.

For this equivalence label the zero z and the pole p, give z coweight (1,0,…,0) and p coweight (0,…,0,−1), and use the ordered partition ({p},{z}). Thus W is the standard representation at z and the dual standard at p. Send the AL.3 diagram E→E′←E″, with σ:τE≃E″, to E₀=E, E₁=E′, E₂=E″: the first modification is the pole injection, the second is the inverse of the zero injection away from z, and the closing isomorphism is σ⁻¹. Conversely the two minuscule conditions recover those injections with line cokernels on their graphs, over every test scheme, including nonreduced schemes and coincident legs. This is the right-shtuka presentation of VL Remark 2.2(b); the map of ordered leg bases is (x_z,x_p)↦(x_p,x_z), the pole–zero order of AL.3. Preserve diagram isomorphisms, arbitrary base change, the closing Frobenius, every compatible full N-trivialization with legs outside |N|, leg projections and central translations. Identify the away-leg Hecke correspondence diagrams and the partial-Frobenius diagrams, including cyclically rotated chain presentations and their pulled-back leg bases; the endomorphism comparison with AL.3’s partial Frobenii is on its distinct-Frobenius-orbit locus. Truncations are compared by cofinality in §2.2, not by equality of bounds.

**Checks.**

- For G_m with two legs of coweights 1,−1, degrees balance; a single coweight 1 without infinity twist has empty moduli.
- A zero modification gives a Frobenius-periodic bundle with compatible level.
- Frobenius acts on S in τE; replacing it by absolute Frobenius on X changes the moduli problem.
- In the two-leg GL_r diagram, if deg E=d, the pole injection has deg E′=d+1 and the zero injection gives deg E″=d. The ordered coweight sums are −1,+1, so the two modifications change degrees by +1,−1. Reversing the second injection would instead give deg E″=d+2, contradicting deg τE=d. For r=1 on P¹ with distinct rational legs, O→O(p)←O and the identity τO≃O give the same object in both presentations.
- When the two GL₂ legs coincide and E=E″=O² with identity composite, E′ ranges over the P¹ of length-one upper modifications in both presentations. At a chosen point its tangent choices over F_q[ε]/ε² form a one-dimensional F_q-space; merging the two steps into the identity would lose that P¹ and its tangent direction.
- For G_m and N=2v at a rational point away from the legs, a level change 1+πa with a∈F_q× is Frobenius-compatible and remains distinct from 1 modulo π² on both sides, while reduction to v gives 1. Over F_q[ε]/ε², the change 1+πε is not Frobenius-compatible: τ(1+πε)=1, so both presentations exclude it. Full level retains the nilpotents of N without adding infinitesimal automorphisms to a shtuka.

Source: [VL](#references), §2, Definition 2.1 and Remark 2.2(b), pp. 52–53; [LL](#references), Chapter I §1a–§1c, Definitions I.1–I.2, pp. 17–19.

*Needs:* [§0.3 *Full level structures*](#03-full-level-structures); [§1.2 *Schubert bounds*](#12-schubert-bounds); [§1.3 *Global Hecke chains*](#13-global-hecke-chains); AutomorphicLFunctionsAndLocalFactors §AL.3, *Two-leg unramified shtukas* (`TwoLegShtuka`, its base change, central translations, Hecke correspondences and partial Frobenii) and *Leveled shtukas and ramified rank induction* (compatible full N-trivializations).

### 2.2 Finite-type shtuka truncations

For a fixed W, HN bound μ and central lattice Ξ, `Cht^{≤μ}_{N,I,W}/Ξ` is a finite-type Deligne–Mumford stack in the source’s bounded setting. Here ≤μ is a Ξ-stable truncation of §§0.6 and 0.10: the adjoint truncation on a connected parahoric model, and a saturated ρ-truncation for a general smooth model 𝒢; over a ρ-truncation itself the bounded shtukas already form a finite-type Deligne–Mumford stack, since bounded global 𝒢-shtukas are relatively representable of finite type over Bun_𝒢 times the leg base. For sufficiently deep nonempty N, depending on μ and W, its components are quasi-projective schemes. With N empty the quotient-of-quasi-projective assertion holds over U^I for every open U⊊X; do not claim the entire unbounded shtuka stack is a scheme.

*Proof.* For a faithful-representation truncation, intersect the bounded Hecke locus with the Frobenius graph over the finite-type bundle open. For adjoint bounds on a connected parahoric model, prove finite type modulo Ξ by VL Lemma 12.19, not by a bundle boundedness assertion: for a torus the Frobenius closing condition makes the bounded shtuka stack, after a finite cover of the leg base, a finite union of torsors under the rational bundle group; quotienting by Ξ makes it finite type. For general G apply the boundedness-under-finite-central-isogeny theorem below to the extended morphism 𝒢→𝒢ᵃᵈ×𝒢ᵃᵇ: the adjoint bound and a finite-type abelianized shtuka locus give a bounded family of underlying product bundles. The theorem puts its inverse image inside a faithful-representation truncation, where the first argument applies. Thus on bounded shtuka quotients the adjoint truncations and the saturated faithful-representation truncations are cofinal: each is an increasing open exhaustion by quasi-compact members. Frobenius-fixed infinitesimal automorphisms vanish, giving the unramified diagonal. Increase the level enough to kill the remaining finite automorphisms uniformly on the fixed bound.

**Boundedness under finite central isogenies.** Fix smooth affine X-models 𝒢 and ℋ with connected fibres and reductive generic fibres, a morphism f:𝒢→ℋ whose generic fibre is a finite central isogeny, and a determinant-one faithful representation ρ:𝒢→SL(V) with quasi-affine quotient as in §0.6. For every finite-type family B→Bun_ℋ there is a dominant bound ν, depending on f, ρ and B, such that every geometric 𝒢-bundle E whose induced ℋ-bundle belongs to B satisfies HN(ρ_*E)≤ν. This includes inseparable isogenies and kernels of order divisible by p; neither smoothness of the kernel nor surjectivity on field-valued points is assumed. This theorem is a prerequisite for the adjoint/faithful truncation comparison above (VL, proof of Lemma 12.19(c), p. 160, with the characterwise replacement specified here).

A route takes a finite separable extension F′/F splitting the multiplicative-type generic kernel K, and the normalization h:Y→X in F′, viewed over its full finite constant field when applying the curve results. On the generic fibre write V=⊕χ Vχ for the nonzero K-character summands and choose an integer e≥1 annihilating X*(K). Each Vχ is G-stable and `V_chi^(tensor e)` has trivial scheme-theoretic K-action. Construct its descended H-representation on the same vector space by factoring the action through the fppf quotient G→H; check this factorization on every value algebra, including nonreduced ones. This descent of the character tensor powers, rather than descent of `V^(tensor e)`, is part of the boundedness target.

Extend these finitely many representations to vector bundles with action of ℋ_Y, and extend the Vχ to 𝒢_Y-stable lattices. AH19 Lemma 2.3(b), pp. 7–8, applied to the regular representation and its finite direct sums, gives the invariant extensions. The generic comparison isomorphisms and their inverses have poles bounded by fixed effective divisors on Y. Clearing these poles gives equivariant inclusions in both directions up to those twists, uniformly after forming associated bundles; flatness of the models extends equivariance from the generic fibre. Include the comparisons between h*V and ⊕χ Vχ and their duals. Thus the bounds apply across every point where the models or the kernel degenerate.

For every nonzero associated summand Eχ, its maximal-slope subbundle gives the inequality `e μ_max(Eχ) ≤ μ_max(Eχ^{⊗e})`. The descended tensor bundle on a member of the pulled-back family B has bounded maximal slope, and the fixed pole divisor adds at most its degree. Apply the same argument to duals, and then the direct-sum comparisons, to bound both extreme slopes of h*(ρ_*E). On each geometric component of Y, of degree d≥1 over X, pullback of a maximal-slope subbundle gives `d μ_max(ρ_*E) ≤ μ_max(h*(ρ_*E))`; use the dual for the lower bound. Fixed rank and degree zero then give ν on X. No equality of tensor-product HN slopes or preservation of semistability under inseparable maps is used. The finite-type HN opens of §0.6 turn these geometric bounds into a truncation containing the whole inverse-image family, also over nonreduced parameter schemes.

Under the two-leg equivalence of §2.1, compare AL.3’s modified-bundle polygon truncations with the source-bundle HN truncations used here, after the same central degree quotient. For each bound in either system prove that its image is contained in some member of the other, compatibly with base change and inclusions. The systems are increasing open exhaustions with quasi-compact members, so quasi-compactness gives these two containment directions; literal equality of polygons or bounds is not asserted (VL, Remark 2.2(b), p. 53). This gives the cofinality adapter for compact-support colimits with the same transported coefficients in §2.5; it identifies neither compactifications nor essential-cohomology summands.

The boundedness interface includes:

- The induced map Bun_𝒢→Bun_ℋ and a uniform inverse-image HN bound for each finite-type family of ℋ-bundles.
- Descent of the individual character tensor powers and the equivariant lattice comparisons, with fixed pole divisors independent of the varying bundle.
- Bounds for duals, finite direct sums and descent along h, with no prime-to-p hypothesis on K.
- Cofinal comparison of the two-leg truncations with AL.3’s modified-bundle polygon system, after the same central quotient.

*Remark.* The depth needed may increase with μ and W.

*Remark.* A single bounded open need not be preserved by all Hecke or partial Frobenius operations.

**Checks.**

- For G=SL₂×SL₂ over F₃ and V=Std₁⊕Std₂, the element (−I,I) acts by −1 on `Std_1 tensor Std_2^(tensor (n-1))` for every n≥1. In particular its value at n=4 is −1, not 1. The separate squares `Std_1^(tensor 2)` and `Std_2^(tensor 2)` have trivial μ₂×μ₂-action and descend; a single power of the direct sum does not.
- For μ_p in characteristic p=2 or 3, take u=1+ε in F_p[ε]/(ε^p). Its standard character has value 1+ε≠1, but its pth tensor power has value 1+ε^p=1. Testing only geometric points would miss the original nontrivial action; the characterwise descent uses the group scheme.
- On P¹, E=O(2)⊕O(−1) has μ_max=2 and its tensor square has slopes 4,1,1,−2, so `2 μ_max(E)=4=μ_max(E^{⊗2})`; the dual gives 2=2. For the degree-two map z↦z² these maximal slopes become 4 and 2 after pullback, fixing the factors e and d. For the identity isogeny and identity curve map one can take e=d=1; zero summands are omitted from slope expressions.
- A fixed lattice comparison O(−x)⊂O⊂O(x) at a degree-one point on P¹ gives slopes −1,0,1. A pole divisor of degree 1 therefore permits an error of 1, not 0; allowing an unbounded pole divisor would destroy the uniform bound.
- For f:G_m→G_m, t↦t^p, on P¹, O(a) induces O(pa). The degree-zero target has a=0, whereas all target degrees would allow every a∈Z; the bounded-family hypothesis cannot be omitted. The identity isogeny has e=1 and leaves every HN bound unchanged.
- For the constant norm-one torus of F₉/F₃ on P¹, the zero-leg Frobenius closing condition is d=−d, hence d=0. The infinitely many geometric bundle components of §0.6 therefore give one allowable degree for these shtukas, with Ξ={1}. For its cubing isogeny the induced geometric degree is 3d; the constant splitting cover has two geometric components, each of degree 1 over P¹, so the slope-descent inequality uses 1, not the total constant-extension degree 2.
- For G_m on P¹, zero-leg Frobenius closure permits every degree d∈Z, but a lattice generator of degree a≠0 leaves |a| degree classes; Frobenius alone would not bound these split central directions.
- For G=1, empty level and no legs, the shtuka stack is a point and every truncation system is constant; there is no positive-rank central lattice to choose.
- On P¹ with coincident rational legs, E=E″=O² and E′=O(x)⊕O give source-bundle centred HN height 0 at rank 1. For AL.3’s modified-bundle degree with index α=1/2, the subdiagram O→O(x) has degree 1/2 and the whole rank-two diagram degree 1/2, so its centred HN height is 1/2−(1/2)/2=1/4. The bounds 0 and 1/4 distinguish the truncations even on this object; cofinality does not identify their numerical parameters.

Source: [VL](#references), §2, Remark 2.2(b) and Proposition 2.6(a), pp. 53–54, and the paragraph before Definition 2.14, p. 59; §12.3.2, Lemma 12.19 with proof, pp. 159–160; [LL](#references), Chapter I §1d, modified-bundle degree and Proposition I.3, pp. 20–22; [Var](#references), §2, Proposition 2.16(a), pp. 7–8; [AH19](#references), Lemma 2.3, pp. 7–8 (invariant lattice extensions), and Theorem 3.15, pp. 15–17 (flat affine models of finite type).

*Needs:* [§0.5 *Slopes and Harder–Narasimhan data*](#05-slopes-and-hardernarasimhan-data); [§0.6 *Bounded bundle loci*](#06-bounded-bundle-loci); [§0.10 *Central lattices and finite quotients*](#010-central-lattices-and-finite-quotients); [§2.1 *Global shtukas*](#21-global-shtukas); AutomorphicLFunctionsAndLocalFactors §AL.3, *Bounded curve-bundle loci and shtuka truncations* and *Leveled shtukas and ramified rank induction* (the two-leg polygon truncations); ReductiveGroups Layers 0–1, 3–4 and 6 (rational representations, fppf quotients, multiplicative-type kernels and central isogenies); SchemeAndStackFoundations §1.1 and §§1.15–1.16 (descent and associated bundles); AlgebraicCurves Layer 12B–12C (normalization and the finite morphism attached to a finite separable extension).

### 2.3 Smooth shtuka local models

For sufficiently large finite jets ni on the fixed Schubert support, the bounded iterated shtuka stack maps smoothly to `Gr_{I,W}/G_{Σ n_i x_i}`, of relative dimension (Σni)dim G in the split constant-model setting. Thus singularities are governed by the Schubert local model, with the perverse shift determined by this relative dimension.

*Proof.* Present the fibre as an equalizer of two maps between smooth bundle-with-level stacks. One map forgets some jet level and is smooth; the other factors through relative Frobenius and has zero differential along the fibres. The equalizer is smooth of the claimed relative dimension, independently of the singularities of the Schubert support.

*Remark.* The theorem is about a smooth map to a possibly singular quotient of a Schubert variety, not smoothness of every shtuka stack.

*Remark.* A minuscule local model, which is smooth, gives a smooth source.

Source: [VL](#references), §2, Proposition 2.8 and its proof, pp. 54–55.

*Needs:* [§0.2 *Deformations of bundles*](#02-deformations-of-bundles); [§1.3 *Global Hecke chains*](#13-global-hecke-chains); [§2.1 *Global shtukas*](#21-global-shtukas).

### 2.4 Fractional-infinity shtukas

Define TwistedShtuka. For Iwahori bundles and μ∈{±1}^r choose D∞ supported on residue-field sections at infinity, with coefficients in (1/n)Z and Σμi=n deg D∞. Require Er≃(τE₀)(D∞), with Frobenius applied before fractional twisting. Form the Frobenius-graph fibre product with AL(−D∞)∘p_r; take the stack quotient by the tensor groupoid 𝒫_X(F_q), acting on every bundle and arrow by tensor product, to obtain PGL_n shtukas. Prove that this quotient is the Frobenius-graph fibre product on the Picard-stack quotients of the Iwahori Hecke and bundle stacks, with maps p₀ and AL(−D∞)∘p_r as in YZ (3.14). The leg map is to X^r×S∞ and includes level collisions.

*Construction.* Construct the twisted graph fibre product and take degrees to prove the balance condition. Redistribute the coefficients by a Frobenius coboundary, compare with ordinary extra legs at infinity, and descend objects and arrows through 𝒫_X(F_q), retaining its scalar isomorphisms. Use the minuscule local model for smoothness of the total stacks and flatness of the leg map, with the ramified leg base change of YZ §3.2. For PGL₂ use sign independence and the standard half divisor to obtain the parity r ≡ #Σ_∞ mod 2. Fractional rotations give commuting Atkin–Lehner involutions.

*Remark.* The standard parity counts closed infinity places, not their total degree.

The API:

- Signed chain, residue sections, degree balance and twisted Frobenius closure.
- The stack quotient by 𝒫_X(F_q), including its action on arrows, and its equivalence with the twisted Frobenius-graph fibre product on Bun_PGLn(Σ).
- Change infinity coefficients by the source’s Frobenius-coboundary rule.
- Commuting fractional rotations, involutive for PGL₂.

**Checks.**

- D∞=0 forces Σμi=0 for GL_n.
- On P¹/F₃, n=1, no legs or flags and D∞=0, a geometric zero-leg GL₁ shtuka in degree d has a nonzero closing scalar a. Changing trivialization multiplies a by b², so there is one geometric isomorphism class in each degree with automorphism group {1,−1}. The groupoid is the disjoint union over d∈Z of B(F₃×): quotienting only by Pic_X(F₃)=Z leaves B(C₂), while quotienting by 𝒫_X(F₃) gives a point, the zero-leg PGL₁ shtuka stack.
- For n=2, one infinity place of degree two still requires odd r in the standard construction.
- With r=1, μ=−1 and D∞=−Γ∞/n the balance is −1=−1; this is the independent Drinfeld-module specialization.

Source: [YZ](#references), §3.2.1–§3.2.8, Definition 3.5, Lemmas 3.6–3.8, Propositions 3.9–3.10, Definition 3.12 and (3.14), (3.18), pp. 21–26 (arXiv v2).

*Needs:* [§0.4 *Iwahori flags and fractional twists*](#04-iwahori-flags-and-fractional-twists); [§0.15 *The Picard stack and rank-one Lang fibres*](#015-the-picard-stack-and-rank-one-lang-fibres); [§1.6 *Minuscule Hecke geometry at Iwahori level*](#16-minuscule-hecke-geometry-at-iwahori-level); [§2.1 *Global shtukas*](#21-global-shtukas).

### 2.5 Shtuka intersection-cohomology systems

Define ShtukaIC and ShtukaCohomology.trunc. Pull the Satake sheaf through the smooth local model, descend by Ξ, and normalize perversely relative to U^I. For the leg map p define `H^{j,≤μ}_{N,I,W}=R^jp_!F_{N,I,W}^{≤μ}` for every j∈Z, and `H^j_{N,I,W}=colim_μ` `H^{j,≤μ}`; the original excursion construction uses j=0. At each finite bound the sheaves are constructible; the colimit is an ind-constructible system, not a single constructible sheaf. Proper partition pushforward identifies different iterated presentations.

*Construction.* Form the coefficients at each bound by descent along an atlas ([§1.4 *ℓ-adic sheaves on stacks of finite type*](#14-ℓ-adic-sheaves-on-stacks-of-finite-type)) and use base change for f_!; no properness of the leg map is assumed. For inclusions of HN opens use extension by zero and the covariant map on compact support. Take the filtered system, and prove independence of the partition by proper pushforward of Satake sheaves.

*Remark.* The degree-zero normalization relative to the leg base must agree with the space of functions in the case of no legs.

The API:

- The relative-perverse coefficient sheaf on each bounded stack.
- The constructible R^jp_! object at μ for each fixed j; j=0 gives the original excursion system.
- Covariant maps as HN opens grow.
- Canonical comparison of iterated presentations, compatible with a third refinement.
- Under §2.1’s two-leg equivalence, identify the compact-support colimits for the same transported coefficient sheaf using §2.2’s cofinal truncation comparison, compatibly with the operations above.

**Checks.**

- For I=∅, W=1, degree-zero compact support gives functions on the rational bundle groupoid modulo Ξ.
- For rank-one two-leg shtukas on P¹/F₂ with distinct rational legs, empty level, constant E coefficients and the same central translation of degree 1, both presentations have one geometric isomorphism class and automorphism group F₂×={1}. Their compact-support colimits in degree zero are both E, of dimension 1; retaining all degrees without the central quotient would give an infinite direct sum instead.
- For G=GL₂ on P¹, I=∅, W=1, empty level, E coefficients and Ξ generated by a degree-one scalar idele, the rational degree-zero bundles of instability at most 2m are O(a)⊕O(−a) with 0≤a≤m. So the degree-zero part of `H^{0,≤μ}` has dimension m+1 (1 for m=0, 2 for m=1), the transition from m to m+1 is extension by zero onto these coordinates, and the colimit is infinite-dimensional: the colimit is not a constructible sheaf on the point, although each truncation is.
- For GL₂ on P¹ at empty level, take a standard leg of coweight (1,0) and a dual-standard leg of coweight (0,−1). Their total degree is 1−1=0. On the collision diagonal, the trivial Frobenius-periodic bundle with identity composite modification gives a point in the one-block shtuka presentation; the fibre of the two-block presentation over it is P¹. Its unshifted compact cohomology has ranks 1 in degrees 0 and 2, matching Std⊗Std∨=1⊕Ad in characteristic-zero coefficients. Treating the fibre as a point loses its degree-two class and the corresponding unit constituent in the normalized Satake decomposition. Two standard legs instead have total degree 2 and give an empty untwisted shtuka stack, although their Grassmannian convolution fibre over (1,1) is also P¹.

Source: [VL](#references), §2, Definition 2.14 and Corollaries 2.15–2.18, pp. 59–60; §4.2, Definition 4.1, p. 65; §4.5, Definitions 4.5 and 4.7, p. 68.

*Needs:* [§1.4 *ℓ-adic sheaves on stacks of finite type*](#14-ℓ-adic-sheaves-on-stacks-of-finite-type); [§1.9 *Classical geometric Satake*](#19-classical-geometric-satake); [§1.10 *Central action on Satake sheaves*](#110-central-action-on-satake-sheaves); [§2.1 *Global shtukas*](#21-global-shtukas); [§2.2 *Finite-type shtuka truncations*](#22-finite-type-shtuka-truncations); [§2.3 *Smooth shtuka local models*](#23-smooth-shtuka-local-models); EtaleCohomologyFoundations §§F.0.1, F.0.3, F.1 and F.2.1–F.2.7 (constructible coefficients, Tate twists, compact support, base change and Künneth); EtaleDualityAndPerverseSheaves Layer 2 (§2.4 the perverse t-structure, §2.10 intersection complexes, §2.12 small and semismall maps).

### 2.6 Twisted zero-leg inner forms

With r=0 and balanced infinity coefficients, the geometric zero-leg GL_n twisted-shtuka groupoid at a fixed ξ∈S∞ is [B×(F)\B×(A)/∏Kx]. Here B is the degree-n central simple algebra split off Σ∞ with inv_x(B)=Σ_i c_x^(i), and Kx are the source’s minimal parahorics at Σ and maximal parahorics elsewhere. The reciprocity sum of invariants is zero. This is a separate twisted specialization of adelic descent.

*Proof.* Construct B from the local invariants and the global Brauer exact sequence. Classify the Frobenius-periodic twisted bundles by the inner form B and compare parahoric stabilizers. YZ state this case without proof (§3.2.2); the classification of the Frobenius-periodic twisted bundles and the comparison of minimal and maximal parahoric stabilizers are part of this target. Abelian reciprocity alone does not give them.

*Remark.* Σ_∞ = ∅ and zero twist recover the split GL_n adelic groupoid.

*Remark.* This is an equivalence of groupoids; automorphism groups are not discarded.

Source: [YZ](#references), §3.2.2, p. 22 (arXiv v2).

*Needs:* [§0.7 *Adelic bundle groupoids*](#07-adelic-bundle-groupoids); [§2.4 *Fractional-infinity shtukas*](#24-fractional-infinity-shtukas); ArithmeticGaloisDuality §R02.3.2, *The class formation of a global function field* (`GlobalFunctionField.classFormation`: the Brauer sequence and local invariants).

### 2.7 Elliptic sheaves as a specialization

For n≥1 and a chosen closed point ∞ of degree d∞≥1, construct rank-n elliptic sheaves as periodic chains of rank-n bundles Fᵢ on X×S, with injections jᵢ:Fᵢ→Fᵢ₊₁ and tᵢ:τFᵢ→Fᵢ₊₁. The squares commute: `j_(i+1) t_i = t_(i+1) tau(j_i)`. Each j-cokernel is an invertible S-module supported on a residue-field section above ∞, each t-cokernel is an invertible S-module on the zero graph, and `F_{i+1}=j_i(F_i)+t_i(τF_i)` when the zero and pole are disjoint. Include the marked periodic identification `F_{i+n d∞}≃F_i(∞)` under which the composite of the j-maps is the natural inclusion, and all t-maps and levels are periodic. The pole sections move by Frobenius through the d∞ residue embeddings. Isomorphisms commute with j, t, periodicity and levels. Construct the groupoid-valued moduli functor with pullback and effective descent; compare its periodic bundle chains with the one-leg, negative-modification, fractional-infinity shtukas of [§2.4 *Fractional-infinity shtukas*](#24-fractional-infinity-shtukas), under the infinity and level conditions of YZ §3.2. For r=1, μ=−1, Σ∞={∞}, D∞=−Γ∞/n, restrict to legs away from ∞ and the degree component deg E₀=n(g−1)+1; YZ §3.2.3 identifies the Drinfeld-module component there. Use the marked degree normalization, pole, zero and level data on both sides; translating the chain index is a different marking until the stated degree component is restored. This comparison is independent of the multi-leg constructions and is not used to define Bun_G or general shtukas.

*Proof.* Write the elliptic-sheaf periodicity as a fractional twist of an Iwahori chain. Compare its Frobenius map and one-leg modification with the twisted closing equation, preserving level.

The API:

- Pullback preserves all chain maps, their commuting squares, quotient lines and marked periodicity.
- The comparison with the one-leg fractional shtuka is an equivalence of groupoids, natural in the base and preserving the chosen degree component.
- Full levels away from pole and zero restrict compatibly, and Iwahori levels agree under the comparison.
- Rotation of the marked chain changes its degree by one; n d∞ rotations tensor by O(∞), increasing degree by n d∞.

*Remark.* Degree balance and the pole at infinity agree on both sides.

**Checks.**

- For r=1 and μ=−1, the twist D∞=−Γ∞/n gives n·deg D∞=−1, matching the single negative modification. A positive modification would fail this balance.
- At a pole of degree two, n d∞=2n successive degree-one quotients have total degree 2n, matching tensoring a rank-n bundle by O(∞); a period n would give n and cannot define this identification. For n=2 on P¹, the distinguished degree is 2(−1)+1=−1. Tensoring by a degree-one line bundle gives degree 1 and leaves that component.
- A leg at ∞ lies outside the specified open X∖{∞}; the comparison cannot identify it with an allowed finite characteristic.

*Remark.* Layers 3–5 do not use elliptic sheaves.

Source: [Sp](#references), §4.1, Remark 4.3(b), p. 622, and §5.2, Definition 5.9, Proposition 5.10 and Remark 5.11(a), pp. 651–653 (the ordinary rank-n chain via the matrix-order equivalence); [YZ](#references), §3.2.3–§3.2.4, Lemma 3.7, pp. 22–23 (arXiv v2).

*Needs:* [§0.4 *Iwahori flags and fractional twists*](#04-iwahori-flags-and-fractional-twists); [§2.4 *Fractional-infinity shtukas*](#24-fractional-infinity-shtukas); AlgebraicVectorBundles Layers L0A–L2B; SchemeAndStackFoundations §§1.1 and 1.15–1.16 (descent).

### 2.8 PGL₂ horocycles

Define HorocycleIndex. A horocycle index is κ=(κ₀,…,κr), κi=(Di,Ni), with |Di−Di−1|+|Ni−Ni−1|=1, Nr=N₀, and Dr differing from Fr(D₀) at exactly one geometric point over each closed place of Σ∞. The κ-horocycle fixes these positive-instability indices in the standard PGL₂ shtuka. I(κ)={i:Ni≠Ni−1} has even size; the leg support X(κ) fixes all other leg coordinates and the infinity sections, so `X(κ)≃X^{I(κ)}`.

*Construction.* Analyze the three one-step cases: N rises, N falls, or D toggles at the level point while N is constant. Impose Frobenius closure to obtain the endpoint condition. Define the horocycle and bounded open, factor the leg map through X(κ), and identify support classes under simultaneous rational-level divisor toggles.

*Remark.* The abstract directed index set allows integer Ni, but geometric purely unstable strata require Ni>0.

The API:

- All adjacency and twisted-Frobenius endpoint constraints.
- The coordinate subscheme X(κ) and free coordinates I(κ).
- The locally closed substack fixing intermediate indices.
- Componentwise ordered bounded opens covering the stack.

**Checks.**

- With Σ=Σ∞=∅ and N>max(2g−2,0), the r=0 tuple ((∅,N)) is admissible, I(κ)=∅ and its support has dimension 0.
- For r=2, ((∅,N),(∅,N+1),(∅,N)) is admissible, I(κ)={1,2} and its support has dimension 2.
- For r=1, ((∅,N),(∅,N+1)) satisfies the step rule but fails Nr=N₀, hence is inadmissible. Local adjacency alone would wrongly accept it.

Source: [YZ](#references), §3.4.3–§3.4.5, Lemma 3.21, Corollary 3.22, Definition 3.23, Lemma 3.24, Definition 3.25, Lemma 3.26 and Corollary 3.27, pp. 30–33 (arXiv v2).

*Needs:* [§0.9 *Parabolic PGL₂ instability*](#09-parabolic-pgl-instability); [§2.4 *Fractional-infinity shtukas*](#24-fractional-infinity-shtukas).

### 2.9 Partial Frobenius

Define Shtuka.partialFrobenius. Rotate the first block of an iterated shtuka chain to the end after Frobenius pullback. This gives the partial Frobenius over `Frob_{I₁}:U^I→U^I`, inducing invertible commuting operators after passage to the cohomological HN colimit. Their product is the canonical total Frobenius. A fixed truncation may map only into a larger bound.

*Construction.* Cut off the first modification block and reglue it using the closing Frobenius isomorphism. Use universal-homeomorphism invariance of étale coefficients and partition independence to obtain the cohomological maps. Check commuting rotations on common refinements and bound growth, then pass to the filtered colimit.

*Remark.* The definition does not assume that a chosen finite bound μ is stable.

The API:

- Rotate a specified leg block and move those legs by Frobenius.
- Induce the coefficient isomorphism and colimit operator.
- The product over a partition is total Frobenius.

**Checks.**

- For one leg the operator is total Frobenius.
- For two disjoint blocks the two orders agree after partition comparison.
- A closed point of degree d returns to its geometric component after d iterates; using one iterate universally gives the wrong local Hecke relation.

Source: [VL](#references), §3, Lemma 3.1 and Propositions 3.3–3.4, pp. 62–64; §4.3, p. 66.

*Needs:* [§2.1 *Global shtukas*](#21-global-shtukas); [§2.5 *Shtuka intersection-cohomology systems*](#25-shtuka-intersection-cohomology-systems).

### 2.10 Coalescence of legs

For ζ:I→J and the diagonal ∆ζ:U^J→U^I, pullback of the cohomology system with coefficient W identifies with the system for W^ζ, restriction along Ĝ^J→Ĝ^I. The comparisons are natural in W and compose coherently for I→J→K. They include noninjective ζ and the creation/removal of trivial legs.

*Proof.* Pull back the Satake fusion isomorphism through the local-model diagram. Use f_! base change and compare cofinal HN systems. Check the associativity diagram on sheaves before taking generic fibres.

*Remark.* All maps I→J are handled, including a surjection merging two legs.

Source: [VL](#references), §4.5, Propositions 4.12–4.14, pp. 69–70; §9, Proposition 9.7, pp. 132–133.

*Needs:* [§1.9 *Classical geometric Satake*](#19-classical-geometric-satake); [§2.5 *Shtuka intersection-cohomology systems*](#25-shtuka-intersection-cohomology-systems).

### 2.11 Hecke correspondences on shtukas

On the locus where all legs avoid its finite place support, a compactly supported bi-K_N-invariant integral Hecke function defines a cohomological correspondence on the shtuka stacks, supported on its finite modification locus. Its action on the HN colimits commutes with partial Frobenius, coefficient maps and coalescence. The action can increase the HN bound; extension across a good place v is a subsequent theorem, proved using the operator `S_{V,v}` of [§3.6 *Hecke operators from Frobenius*](#36-hecke-operators-from-frobenius).

*Construction.* Construct bounded-support Hecke diagrams preserving Frobenius and level. Check properness/étaleness needed for pull-push and compose via common refinements. At a place in the support of the Hecke function, construct the action on the locus where every leg avoids that place. The extension is proved in §3.6.

*Remark.* The action is on the HN system, not on an arbitrarily fixed finite bound.

The API:

- The bounded-support diagram with its coefficient morphism.
- Integral Hecke action on the cohomology colimit.
- Convolution agrees with composition of correspondences.

**Checks.**

- The identity double coset acts as the identity.
- Disjoint-place correspondences commute.
- The adjoint under compact-support duality is the inverse-double-coset correspondence with the chosen measure normalization.

Source: [VL](#references), §2, Construction 2.20, pp. 61–62; §4.4, p. 67; §6.1, Corollary 6.5, p. 75.

*Needs:* [§1.12 *Normalized spherical Satake*](#112-normalized-spherical-satake); [§2.5 *Shtuka intersection-cohomology systems*](#25-shtuka-intersection-cohomology-systems); EtaleDualityAndPerverseSheaves Layer 6 (§6.2 composition and pullback of cohomological correspondences, §6.3 the Lefschetz–Verdier formula, §6.5 contracting correspondences and the Fujiwara–Varshavsky formula).

### Examples

- *No legs.* With I = ∅ and W = 1 a shtuka is a bundle with level and an isomorphism with its Frobenius pullback; by Lang's theorem these are the F_q-points of `Bun_{G,N}`, so the degree-zero compactly supported cohomology is the space of finitely supported functions on `Bun_{G,N}(F_q)/Ξ` ([§2.5 *Shtuka intersection-cohomology systems*](#25-shtuka-intersection-cohomology-systems)).
- *Degree balance for G_m.* With two legs of coweights 1 and −1 the degrees balance; a single leg of coweight 1 and no infinity twist gives the empty stack, because deg τE = deg E ([§2.1 *Global shtukas*](#21-global-shtukas)). With fractional infinity, r = 1, μ = −1 and D_∞ = −Γ_∞/n balances, which is the Drinfeld-module case ([§2.4 *Fractional-infinity shtukas*](#24-fractional-infinity-shtukas)).
- *Partial Frobenius at a degree-d point.* A closed point of degree d returns to its geometric component only after d iterates of the partial Frobenius, which is why the Eichler–Shimura relation of Layer 3 uses `Frob^{deg v}`.

### Dependencies

Layers 0–1; AutomorphicLFunctionsAndLocalFactors §AL.3 (*Two-leg unramified shtukas*, *Leveled shtukas and ramified rank induction*, *Bounded curve-bundle loci and shtuka truncations*); ReductiveGroups Layers 0–1, 3–4 and 6; SchemeAndStackFoundations §1.1 and §§1.15–1.16; AlgebraicCurves Layer 12B–12C; EtaleCohomologyFoundations §§F.0–F.2; EtaleDualityAndPerverseSheaves Layers 2 and 6; ArithmeticGaloisDuality §R02.3.2 (only for [§2.6 *Twisted zero-leg inner forms*](#26-twisted-zero-leg-inner-forms)).

## Layer 3: Hecke finiteness and cohomological control

Creation and annihilation of legs produce the operators `S_{V,v}`. The alternating-tensor proof of their Eichler–Shimura relation uses these geometric operators directly and does not depend on their identification with Hecke operators. Integral Hecke finiteness, with its finite O_E-witnesses, singles out the part of cohomology on which the original Galois construction works. Xue's theorems — integral finiteness of cuspidal cohomology and finiteness of the full cohomology over one local Hecke algebra — control the full cohomology. For PGL₂ with fractional infinity, the ind-perverse boundary analysis and the Eisenstein spectral decomposition of Yun–Zhang are additional targets, with the corrected shifts. Standing hypotheses are those of Layer 1.

### 3.1 Creation and annihilation

For a representation W of Ĝ^I, a diagonal-Ĝ-invariant vector x and covector ξ give maps from the trivial representation to W^ζ and back, where ζ:I→{0}. Transport these coefficient maps by coalescence to create I legs from one trivial leg and annihilate them. These maps are defined on the HN cohomology systems before passage to Hecke-finite fibres. They commute with the integral Hecke action, preserve Hecke finiteness once it is defined, and satisfy the rigid tensor evaluation/coevaluation identities.

*Construction.* Apply coefficient functoriality to x:1→W^ζ and ξ:W^ζ→1. Use fusion comparisons to move to separate legs. Verify the two triangle identities using evaluation and coevaluation before specializing.

*Remark.* The invariant condition is for diagonal Ĝ, not each independent factor of Ĝ^I.

The API:

- Creation from a specified invariant vector.
- Annihilation with a specified invariant covector.
- Rigid tensor triangles survive coefficient functoriality and fusion.

**Checks.**

- For W=1 and x=ξ=1 creation followed by annihilation is the identity.
- For V⊠V∗ the canonical coevaluation and evaluation give the usual trace.
- Scaling x by a scales the composite by a; normalization must not discard the chosen invariant vector.

Source: [VL](#references), §5, Definitions 5.1–5.2 and Lemma 5.3, pp. 71–72.

*Needs:* [§2.10 *Coalescence of legs*](#210-coalescence-of-legs); [§2.11 *Hecke correspondences on shtukas*](#211-hecke-correspondences-on-shtukas).

### 3.2 Integral Hecke finiteness

Define integral Hecke finiteness. An element h in an E-valued shtuka-cohomology fibre is Hecke-finite if it belongs to a finitely generated O_E-submodule stable under every integral Hecke operator. The union of these lattices is an E-vector subspace H^Hf, stable under the Hecke algebra and the existing geometric actions. Finite-dimensional E-stability alone is a different condition.

*Construction.* Close the collection of stable finite O_E-modules under sums. Scale such modules by elements of E to prove the union is an E-subspace. Use commutation with integral Hecke operators to transport finite witnesses through coefficient and geometric maps.

*Remark.* The integral lattice is the witness; the entire E-space is not required to be finitely generated over O_E.

The API:

- Existence of a finite O_E-submodule containing h and stable under all integral operators.
- The E-subspace formed by the union of such modules.
- A Hecke-equivariant linear map carries a finite witness to a finite witness.
- A finite family of Hecke-finite vectors lies in one finite stable O_E-module.

**Checks.**

- Zero lies in the zero stable submodule.
- On E=Q_ℓ, the operator multiplication by ℓ⁻¹ has finite E-dimensional orbit span of 1, but no finitely generated Z_ℓ-submodule containing 1 can be stable under it.
- If every operator is integral scalar multiplication, each O_E·h is a finite stable witness.

Source: [VL](#references), §8, Definition 8.19 and Remark 8.20, p. 115.

*Needs:* [§2.11 *Hecke correspondences on shtukas*](#211-hecke-correspondences-on-shtukas); Mathlib `Submodule.FG` and `Module.Finite`.

The integral-finiteness API includes finite common witnesses, transport under intertwining maps and closure under E-scaling. The inverse-uniformizer example is a README Check.

### 3.3 Horocycle compact direct images

For κ with every Ni>max(2g−2,0), the map qκ from the PGL₂ horocycle to the rank-one shtuka chain of degrees Ni is smooth of dimension d=r−#I(κ)/2, with geometric fibres [G_a^d/Z] for a finite étale translation group Z. Thus `Rπκ!Q_ℓ = Rπ₁!Q_ℓ[−2d](−d)` and `Pκ = Rπκ!Q_ℓ[2r](r) = Rπ₁!Q_ℓ[#I(κ)](#I(κ)/2)`, pure perverse of weight zero on X(κ).

*Proof.* Map each maximal line/quotient ratio to `Pic^{Ni}`, yielding a rank-one shtuka chain. At high instability H¹ of the ratio line bundle vanishes; express each fibre as a quotient of vector groups and impose Frobenius at the endpoints. Compute the vector-group dimension using Riemann–Roch and the number of rising/falling steps. Compact support gives the shift and twist.

*Remark.* The high-instability inequality is needed for the vector-group presentation.

*Remark.* Use the positive shift `[#I(κ)](#I(κ)/2)` from YZ Corollary 3.29; the displayed recall at the start of YZ §3.5.4 has the opposite sign (Source corrections, E1).

Source: [YZ](#references), §3.4.6, Lemma 3.28 and Corollary 3.29, pp. 33–35 (arXiv v2).

*Needs:* [§0.15 *The Picard stack and rank-one Lang fibres*](#015-the-picard-stack-and-rank-one-lang-fibres); [§2.8 *PGL₂ horocycles*](#28-pgl-horocycles); EtaleCohomologyFoundations §§F.0.1, F.0.3, F.1 and F.2.1–F.2.7 (constructible coefficients, Tate twists, compact support, base change and Künneth); DeligneWeightsAndPurity DWP.7 (§7.8 weights of R^i f_!, §7.12 weight bounds and purity of the image, §7.15 purity for proper smooth varieties).

### 3.4 PGL₂ ind-perverse cohomology

Define PGL2Shtuka.indPerverse and PGL2Shtuka.middleCompact. For `K^{≤κ}=Rπ^{≤κ}_!Q_ℓ[2r](r)`, define pH^iK as colimκ `pH^iK^{≤κ}` in Ind(Perv); this notation does not postulate a constructible derived object K for the unbounded stack. Set V=colimκ `H_c^{2r}(Sht^{≤κ},Q_ℓ)(r)`. Hecke correspondences act on the system and on V; Atkin–Lehner involutions commute with them. The cycle class map and the compact-support pairing are equivariant, with inverse correspondences giving adjoints.

The calculus modulo constructible objects is part of this target: form the Ind-category of perverse sheaves on the leg base (Mathlib `CategoryTheory.Ind`), take the Serre class given by the essential image of the natural embedding Perv→Ind(Perv), and work in the localization by morphisms that are isomorphisms modulo that class (Mathlib `CategoryTheory.ObjectProperty.IsSerreClass` and `CategoryTheory.ObjectProperty.isoModSerre`); an mc-isomorphism is a morphism whose kernel and cokernel belong to that essential image. Prove this class is Serre and that the stated localization realizes this calculus (YZ Definition 3.32). A filtered presentation by constructible perverse sheaves does not itself make an ind-object constructible.

*Construction.* Use extension by zero for increasing bounded opens, and form each perverse-degree colimit in the Ind-category. Construct Hecke pull–push maps with their proper support, and compare their compositions. Use proper and étale base change to prove the same statements after the ramified leg base change of YZ §3.2, and check that Atkin–Lehner involutions commute with the correspondences.

The API:

- The filtered perverse-cohomology objects, one object for each i.
- The direct limit V in degree 2r and twist r.
- Correspondences act compatibly with bound transitions.
- Cycle classes, duality adjoints and Atkin–Lehner symmetries.

**Checks.**

- At a fixed finite-type truncation, ordinary constructible compact cohomology is recovered.
- On a geometric point, a rank-two perverse coefficient space belongs to the essential image and becomes zero modulo constructibles. The countable direct sum of one-dimensional spaces has infinite rank and does not belong to it, although every finite partial sum is constructible; treating every filtered presentation as a constructible object would wrongly kill this direct sum.
- The symmetric PGL₂ spherical generator is self-adjoint, since its double coset equals its inverse.
- After a leg base change, pullback of every finite truncation system agrees with the system used for Sht′; do not replace it with an unrelated abstract Hecke module.

Source: [YZ](#references), §3.3, Propositions 3.14–3.15, Lemmas 3.16–3.17 and Remark 3.18, pp. 25–29; §3.5.1–§3.5.2, Definition 3.32, p. 36 (arXiv v2).

*Needs:* [§2.4 *Fractional-infinity shtukas*](#24-fractional-infinity-shtukas); [§2.8 *PGL₂ horocycles*](#28-pgl-horocycles); [§2.11 *Hecke correspondences on shtukas*](#211-hecke-correspondences-on-shtukas); EtaleDualityAndPerverseSheaves Layer 2 (§2.4 the perverse t-structure, §2.10 intersection complexes, §2.12 small and semismall maps); EtaleDualityAndPerverseSheaves Layer 6 (§6.2 composition and pullback of cohomological correspondences, §6.3 the Lefschetz–Verdier formula, §6.5 contracting correspondences and the Fujiwara–Varshavsky formula); EtaleDualityAndPerverseSheaves §0.5 (global Verdier and Poincaré duality); EtaleDualityAndPerverseSheaves §1.3 (the étale cycle class map); Mathlib `CategoryTheory.Ind`, `CategoryTheory.ObjectProperty.IsSerreClass` and the morphism class `CategoryTheory.ObjectProperty.isoModSerre`.

### 3.5 Cuspidal shtuka cohomology

Define ShtukaCohom.cuspidal. For split G and fixed j, I, W, at a geometric point whose coordinates are generic and satisfy no nonzero Frobenius-graph relation (Xue-I §2.3.8; this includes the generic point of the product and the generic point of the diagonal), define `H^{j,cusp,O_E}` as the intersection of the kernels of all proper-parabolic constant-term maps on the HN-colimit compactly supported cohomology `H^{j,O_E}`. The codomain of each constant-term map is the cohomology of the modified Levi stack, with its degree components and support conditions; it cannot be replaced by the cohomology of an unmodified Levi stack. Over E the analogous kernel is `H^{j,cusp,E}`.

The geometric inputs of the constant-term comparison — the contraction of deep horospherical strata onto Levi shtukas and the constant-term geometry of Xue's earlier work on cuspidal cohomology, cited in Xue-I §3.1 — are part of this target.

*Construction.* Use the correspondence through the parabolic, from G-shtukas to Levi shtukas, with the coefficient sheaf pulled back from Satake. Pass to the direct limit in the G-bound and in the modified Levi degree components. Intersect the proper-parabolic kernels and prove Hecke compatibility through the constant-term homomorphism of Hecke algebras.

*Remark.* All proper parabolics, or a source-proved detecting family of maximal ones, are required.

The API:

- The componentwise map to the modified Levi cohomology.
- The simultaneous kernel, with its inclusion into the full HN colimit.
- The map intertwines the unnormalized constant-term homomorphism of the Hecke algebras.
- After tensoring with E, integral cuspidal cohomology gives the rational cuspidal subspace.

**Checks.**

- For a torus the intersection is over an empty family and is all cohomology.
- With no legs, trivial W and j = 0, one obtains the cuspidal functions of [§0.14 *Cuspidal functions and bundle functions*](#014-cuspidal-functions-and-bundle-functions), not all compactly supported functions.
- For GL₂ a compactly supported function with nonzero upper-triangular constant term is excluded, even though its support is finite.

Source: [Xue-I](#references), §2.3.8, Definitions 2.3.10–2.3.12, pp. 16–17; Proposition 4.2.6, p. 25.

*Needs:* [§2.5 *Shtuka intersection-cohomology systems*](#25-shtuka-intersection-cohomology-systems); [§2.11 *Hecke correspondences on shtukas*](#211-hecke-correspondences-on-shtukas); EtaleDualityAndPerverseSheaves Layer 6 (§6.2 composition and pullback of cohomological correspondences, §6.3 the Lefschetz–Verdier formula, §6.5 contracting correspondences and the Fujiwara–Varshavsky formula).

### 3.6 Hecke operators from Frobenius

For a good place v∈U∖|N| and, initially, split G and V∈Rep Ĝ, define `S_{V,v}` by creating V⊠V∗, applying `Frob_first^{deg v}`, then annihilating, with the source’s descent from a geometric point over v. On the locus where existing legs avoid v, this equals `T(h_{V,v})`; hence it extends that spherical Hecke action across v. The dimension-parity sign in the normalized `h_{V,v}` is essential.

For unramified nonsplit G and every V∈Rep_E(ᴸG_v), use the fixed-leg coefficients and restriction/projector comparison of §1.11 with the local twisted character `h_{V,v}` of §1.12. After specializing a containing global coefficient representation at v, insert the local summand projector in creation and annihilation and compare it with the maps defined directly on V; retain the local system of diagonal-Ĝ invariants for moving global legs. The trace is evaluated on the local coset Ĝ⋊Frob_v. This proves the same away-from-v comparison for every local spherical operator, including those not spanned by global L-group characters.

The full correspondence computation of VL §§6.2–6.5, including the identities of Lemmas 6.11–6.15 for intersection complexes and convolution, is part of this target; the minuscule case does not suffice.

*Proof.* Express creation and annihilation by cohomological correspondences supported on the relevant fusion diagonals. Compare the Frobenius-twisted correspondence with the bounded local Hecke correspondence; the general bound uses IC and convolution rather than a minuscule replacement. Apply the trace/correspondence identity and track the normalized sign; commute with total Frobenius to descend from the chosen geometric point.

The API:

- Creation, the specified Frobenius power and annihilation give an endomorphism of the cohomology system.
- Descent makes that endomorphism independent of the geometric point over v.
- Away from v it agrees with the spherical Hecke correspondence, and thus extends its action across v.

**Checks.**

- V=1 gives the identity spherical operator, since evaluation after coevaluation on the unit is 1.
- At a degree-two place the construction uses two partial Frobenius iterates and q_v=q²; a single iterate lies over the wrong point before descent.
- For GL₂ and the minuscule standard representation, the orbit has dimension one. On its open stratum the normalized perverse IC has trace `−q_v^{−1/2}`, while `h_{V,v}` has value `+q_v^{−1/2}`; omitting the parity correction changes the operator's sign.

Source: [VL](#references), §6.1, Proposition 6.2 and Corollary 6.5, p. 75; proof in §§6.2–6.5, pp. 76–100; §12.3.3, (12.15)–(12.16), pp. 161–162; §12.3.5(e′), pp. 164–165.

*Needs:* [§1.12 *Normalized spherical Satake*](#112-normalized-spherical-satake); [§2.9 *Partial Frobenius*](#29-partial-frobenius); [§3.1 *Creation and annihilation*](#31-creation-and-annihilation); [§1.11 *Nonsplit Satake descent*](#111-nonsplit-satake-descent).

### 3.7 The Eichler–Shimura relation

For rational coefficients and an external tensor-product coefficient with distinguished factor V, if dim V=d and F₀ is partial Frobenius on the extra V-leg, then `Σ_{i=0}^d(−1)^i(F₀^{deg v})^i∘S_{Λ^{d−i}V,v}=0`. Here S is the creation–Frobenius–annihilation operator; the relation is proved before identifying S with a Hecke operator. The latter identification gives the polynomial recurrence with integral spherical coefficients.

*Proof.* Form the alternating projector on `V^{⊗(d+1)}` and use `Λ^{d+1}V=0`. Contract all but one tensor factor against Frobenius, grouping permutations by the cycle through the distinguished factor. This gives the signed exterior-power polynomial; this projector argument is restricted to rational coefficients. For integral coefficients use the coefficient-natural Cayley–Hamilton construction of Xue-I §§7.3–7.4, rather than cancelling factorials.

For split G, every finite I=I′⊔{0} and every `W∈Rep_{O_E}(Ĝ^I)` on a finitely generated module admit a finite-free Ĝ-representation M with

    `Σ_{a=0}^{rank M}` (−1)^a `S_{∧^{rank M−a}M,v}` ∘ `(F₀^{deg v})^a` = 0.

This is an identity of maps from the HN-μ system to a sufficiently enlarged HN-(μ+κ) system restricted to the 0-leg at v. It is natural in the finitely generated coefficient W, including torsion, and does not require W to be an external tensor product. For external products of free representations M may be the 0-factor. Construct the regular-coefficient morphism of Xue-I §7.2.12 and carry its Cayley–Hamilton identity to the cohomological system by integral Satake and fusion.

**Checks.**

- For a free rank-one factor the relation is S_M−F=0.
- For a free rank-two factor it is S_det−S_M F+F²=0, with leading coefficient 1.
- On F₂, 2·Id=0 while Id(1)=1≠0. Clearing a factorial cannot justify the integral recurrence.

*Remark.* For d=1, `S_{V,v}=F₀^{deg v}`.

*Remark.* For d=2 the relation is F²−S_V F+S_det=0; reversing exterior indices fails.

Source: [VL](#references), §7, Proposition 7.1 and proof, pp. 102–105; [Xue-I](#references), Proposition 7.2.6, Remarks 7.2.7–7.2.12 and §§7.3–7.4, pp. 44–54.

*Needs:* [§2.9 *Partial Frobenius*](#29-partial-frobenius); [§3.1 *Creation and annihilation*](#31-creation-and-annihilation); Mathlib `ExteriorAlgebra`; Mathlib `LinearMap.charpoly` and `LinearMap.aeval_self_charpoly`; [§1.14 *Integral geometric Satake*](#114-integral-geometric-satake).

The algebraic monic-recurrence consequence is a README target: an operator killed by a monic integral polynomial puts every vector in a finite stable module, generated by its powers below the polynomial degree. It supplies the finite Frobenius box of §4.5.

### 3.8 The no-leg cusp identification

Under the no-leg/trivial-coefficient identification, `H_{∅,1}^Hf=C_c^cusp((⊔αGα(F)\Gα(A)/Kα,N)/Ξ,E)`. In fact finite-dimensionality of the E-orbit under one spherical Hecke algebra at a split place already forces cuspidality. The integral cusp-function lattice is finite and Hecke-stable.

*Proof.* Cuspidal finite-dimensionality and the integral-function lattice give Hecke finiteness. For a nonzero constant term use a contracting central cocharacter in a proper Levi. Its translates shift an integer support coordinate. Compact support bounds that coordinate on one side, incompatible with a nonzero finite-dimensional shift-stable orbit. Thus every proper constant term vanishes.

*Remark.* For a torus the cusp condition is vacuous and the central quotient of `Bun_{T,N}(F_q)` gives the finite function space. For G_m these are ray Picard classes Pic(X,N)/Ξ, specializing to Pic(X)/Ξ only when N=∅.

*Remark.* Finite O_E-generation is asserted for the integral lattice, not for the nonzero E-vector space as an O_E-module.

Source: [VL](#references), §8, Proposition 8.23 and Lemmas 8.24–8.25 with proofs, pp. 117–119.

*Needs:* [§0.14 *Cuspidal functions and bundle functions*](#014-cuspidal-functions-and-bundle-functions); [§2.5 *Shtuka intersection-cohomology systems*](#25-shtuka-intersection-cohomology-systems); [§3.2 *Integral Hecke finiteness*](#32-integral-hecke-finiteness).

### 3.9 PGL₂ boundary constant terms

On a cofinal set of truncations containing the low-instability core, the perverse transitions are injective in degree 0, surjective in degree 1 and isomorphisms otherwise; nonzero perverse degrees eventually stabilize. There is an mc-isomorphism γ:pH⁰K→⊕κ∈K♯r Pκ. It intertwines the Hecke action with the Satake–Picard action modulo constructible errors. Restricting translations to high indices gives an mc-action, not an honest group action on that restricted direct sum.

*Proof.* Use the localization triangles only after all added horocycles satisfy the high-instability hypothesis of YZ Lemma 3.28. Compare the finite-type core and its complement; the core contributes constructible kernel and cokernel. Split the high boundary according to distinct support classes X(κ), identify the top-dimensional generic fibres, and compare Hecke adjacency with Picard translation.

*Remark.* The cofinal high-bound condition prevents applying the pure-perverse calculation to low horocycles.

*Remark.* Do not assume every horocycle is closed over the generic point of its support; YZ Remark 3.35 explicitly avoids that claim.

Source: [YZ](#references), §3.5.1–§3.5.4, Lemmas 3.33, 3.34 and 3.36, (3.32) and Remark 3.35, pp. 36–38 (arXiv v2).

*Needs:* [§1.12 *Normalized spherical Satake*](#112-normalized-spherical-satake); [§3.3 *Horocycle compact direct images*](#33-horocycle-compact-direct-images); [§3.4 *PGL₂ ind-perverse cohomology*](#34-pgl-ind-perverse-cohomology); EtaleDualityAndPerverseSheaves Layer 2 (§2.4 the perverse t-structure, §2.10 intersection complexes, §2.12 small and semismall maps).

### 3.10 Integral cusp finiteness

For split G and all cohomological degrees j, finite leg sets I and finite coefficient representations W in the setting of Xue-I, `H^{j,cusp,O_E}` is finitely generated over O_E, equals the integral Hecke-finite submodule, and extends to `H^{j,cusp,E}=H^{j,Hf,E}`. The cuspidal submodule lies in the image of the cohomology of one sufficiently large HN truncation, which is a finite O_E-module (Xue-I, Proposition 3.2.2); no injectivity of the truncation maps is asserted. This proves the Hecke-finite/cuspidal equality for arbitrary legs and degrees in the split case, strengthening the original empty-leg theorem.

The deep-horosphere contraction and constant-term geometry cited in Xue-I §3.1 are part of this target, as in [§3.5 *Cuspidal shtuka cohomology*](#35-cuspidal-shtuka-cohomology).

*Proof.* Use deep instability and constant-term comparison to show that the image of one sufficiently large truncation contains the entire cuspidal kernel. Its finite-type cohomology is a finite O_E-module. A nonzero proper-parabolic constant term admits central-Levi Hecke translates moving to unbounded degree components; they contradict a finite integral Hecke orbit. Conversely the finite cuspidal module is Hecke-stable. Prove constant-term kernels commute with extension to E using the uniform integral bounds, then use the cuspidal integral lattice to identify rational Hecke-finiteness.

*Remark.* This is not a finiteness assertion for the entire HN colimit.

*Remark.* The nonsplit rational descent theorem below does not by itself extend this integral cuspidal theorem.

Source: [Xue-I](#references), Theorem 3.2.1 and Propositions 3.2.2 and 3.2.7, pp. 18–19; Propositions 6.1.2, 6.2.12 and 6.3.3, pp. 32–37.

*Needs:* [§0.6 *Bounded bundle loci*](#06-bounded-bundle-loci); [§3.2 *Integral Hecke finiteness*](#32-integral-hecke-finiteness); [§3.5 *Cuspidal shtuka cohomology*](#35-cuspidal-shtuka-cohomology).

### 3.11 The PGL₂ Eisenstein spectral decomposition

Let H̄ be the image of H_G^Σ⊗Q_ℓ in End(V)×Q_ℓ[Pic_X(F_q)]^ι. For f in the Eisenstein ideal, fV is finite-dimensional. For every spherical place y, V is finite over H_y⊗Q_ℓ; H̄ is a finite-type algebra of Krull dimension one and V is finite over it. Its reduced spectrum is the disjoint union of the Eisenstein curve Spec Q_ℓ[Pic_X(F_q)]^ι and finitely many isolated points; V=V_Eis⊕V₀ canonically, with V₀ finite-dimensional. The ramified base-changed stack has the analogous decomposition and equivariant pairing.

*Proof.* Compare middle compact cohomology with global sections of pH⁰K; stabilized nonzero perverse degrees give finite-dimensional errors. The mc-zero action of the Eisenstein ideal then has finite rank. Filter by growing instability in steps deg y. The associated graded spherical action is the Picard translation isomorphism in high degree. Use purity of boundary pieces and the stabilized weight≤0 part of H¹ to show a finite initial segment generates V over H_y. Noetherianity makes the Eisenstein ideal finitely generated, so its action has finite-dimensional support. Separate that support from the Eisenstein curve to obtain the canonical splitting.

*Remark.* The isolated non-Eisenstein sector is finite-dimensional; the whole V need not be.

*Remark.* The proof uses any spherical place, not only a specially chosen degree-one place.

Source: [YZ](#references), §3.5.5–§3.5.6, Lemma 3.37, Corollary 3.38, Proposition 3.39, Corollary 3.40 and Theorem 3.41, pp. 39–41 (arXiv v2).

*Needs:* [§3.9 *PGL₂ boundary constant terms*](#39-pgl-boundary-constant-terms); DeligneWeightsAndPurity DWP.7 (§7.8 weights of R^i f_!, §7.12 weight bounds and purity of the image, §7.15 purity for proper smooth varieties).

### 3.12 Finiteness over one local Hecke algebra

For split G, all j,I,W and every good closed place u outside N, `H^{j,O_E}_{N,I,W}` at the geometric fibres specified in Xue-I §2.3.8 is a finite module over the single spherical Hecke algebra `H^{O_E}_{G,u}`. Its O_E-torsion has bounded exponent. It can be infinite over O_E: being finite over a finitely generated Hecke algebra is a different condition from the integral Hecke-finite condition used for the cuspidal subspace.

*Proof.* Filter the colimit by HN bounds. In a sufficiently unstable maximal-parabolic sector, constant terms identify adjacent associated-graded pieces with Levi pieces. A central-Levi cocharacter Hecke operator translates those graded pieces isomorphically toward a bounded region. Induction on the truncation filtration shows one bounded piece generates under `H_{G,u}`. The bounded piece is finite over O_E. The spherical Hecke algebra is Noetherian; the ascending chain of λ-power torsion submodules therefore stabilizes.

*Remark.* The choice of u is arbitrary among good places.

*Remark.* Do not conclude that every vector has a finite O_E Hecke orbit.

Source: [Xue-I](#references), §5, 5.0.1, Proposition 5.0.2, Theorem 5.0.4 and Corollary 5.0.5, pp. 30–31.

*Needs:* [§1.14 *Integral geometric Satake*](#114-integral-geometric-satake); [§2.11 *Hecke correspondences on shtukas*](#211-hecke-correspondences-on-shtukas); [§3.5 *Cuspidal shtuka cohomology*](#35-cuspidal-shtuka-cohomology); [§3.10 *Integral cusp finiteness*](#310-integral-cusp-finiteness).

### 3.13 The PGL₂ finite-type core

For standard Iwahori PGL₂ shtukas of r modifications, the complement of horocycles with every Ni>max(2g−2,0) is of finite type. Subject to the standard parity r≡#Σ∞ mod 2, the entire stack is of finite type exactly when r<#Σ∞. The large-instability horocycles are nonempty and infinite in number in the opposite case.

*Proof.* If one intermediate bundle has bounded parabolic instability, at most r elementary modifications bound the starting ordinary instability by r+max(2g−2,0)+deg Σ. If r<#Σ∞ the divisor endpoint condition prevents any admissible purely unstable sequence. For r≥#Σ∞ construct infinitely many admissible indices with Ni arbitrarily large; use the rank-one quotient of each horocycle to prove nonemptiness.

*Remark.* For Σ∞=∅ and even r the unrestricted stack is not finite type.

*Remark.* With r=0 and #Σ∞>0 even, the finite-type conclusion applies; no universal non-finite-type slogan is used.

Source: [YZ](#references), §3.4.7, Lemma 3.30 and Corollary 3.31, p. 35 (arXiv v2).

*Needs:* [§0.6 *Bounded bundle loci*](#06-bounded-bundle-loci); [§2.8 *PGL₂ horocycles*](#28-pgl-horocycles); [§3.3 *Horocycle compact direct images*](#33-horocycle-compact-direct-images).

### Examples

- *Integral versus rational finiteness.* On E = Q_ℓ with the single operator ℓ⁻¹, the vector 1 spans a one-dimensional stable E-line, but no finitely generated Z_ℓ-submodule containing 1 is stable: ℓ⁻ⁿ is in it for every n. So 1 is not Hecke-finite ([§3.2 *Integral Hecke finiteness*](#32-integral-hecke-finiteness)).
- *Eichler–Shimura for d = 2.* For a two-dimensional V the relation is F² − S_V F + `S_{Λ²V}` = 0, with F the partial Frobenius at the extra leg raised to the power deg v ([§3.7 *The Eichler–Shimura relation*](#37-the-eichlershimura-relation)); reversing the exterior indices gives a different, false relation. A monic relation of this kind is what bounds all Frobenius powers by a finite box in [§4.5 *Finite lisse envelopes*](#45-finite-lisse-envelopes).
- *Tori.* For a torus every constant-term family is empty, so all cohomology is cuspidal, and the no-leg cusp space at level N is the space of functions on the finite set of isomorphism classes of `Bun_{T,N}(F_q)/Ξ`; at empty level this specializes to `Bun_T(F_q)/Ξ`.
- *Full torus level.* For a torus the no-leg cusp space is the function space on `Bun_{T,N}(F_q)/Ξ`. For G_m on P¹/F₃ with N={0,∞}, its degree-zero ray Picard group has order 2, while the ordinary Picard degree-zero group has order 1. Thus the degree-quotient cusp dimensions are 2 and 1 respectively.

### Dependencies

Layers 0–2; Mathlib `Submodule.FG`, `ExteriorAlgebra`, `LinearMap.charpoly`, `CategoryTheory.Ind` and Serre classes; EtaleCohomologyFoundations §§F.0–F.2; EtaleDualityAndPerverseSheaves Layers 0, 1, 2 and 6; DeligneWeightsAndPurity DWP.7.

## Layer 4: Drinfeld descent and product actions

Drinfeld's lemma, for finite étale covers and then for lisse sheaves with finite O_E-coefficients, comes before its use on cohomology. Hecke-finite vectors sit in finite lisse envelopes with partial Frobenius, which carry an action of the product Galois group; such an envelope embeds into one truncated cohomology sheaf only over a dense open where that sheaf is lisse. The functors `H_{I,W}` are assembled from these envelopes. The full-colimit route gives a Weil action of Weil(F)^I on the whole cohomology and its ind-smoothness, with separate hypotheses in the split integral case and the nonsplit rational case. Standing hypotheses are those of Layer 1.

### 4.1 Drinfeld’s lemma for finite étale covers

For a finite family of connected F_q-schemes X_i, i∈I, with chosen geometric points z_i, the finite étale covers T of the product `∏_{i∈I} X_i` over F_q equipped with commuting morphisms F_i, each lying over the Frobenius of X_i times the identity of the other factors, whose composite is the q-Frobenius of T, form a Galois category equivalent to finite sets with continuous ∏_i π₁(X_i,z_i)-action. The functor sends Galois covers U_i of X_i and a finite set A with an action of ∏_i Gal(U_i/X_i) to the contracted product `(∏_i U_i) ×^{∏_i Gal(U_i/X_i)} A` with the partial Frobenius maps `Frob_{U_i} × id`, and full faithfulness and essential surjectivity are proved in this generality (VL Lemma 8.11). For X_i = U, a smooth geometrically connected curve, this gives the equivalence for finite étale covers of U^I with π₁(U)^I, used for shtukas; equivalent formulations use the quotient by the partial Frobenius actions.

*Proof.* Use Lang’s theorem for the smooth geometrically connected finite-type group GL_n over F_q to obtain finite-dimensional semilinear descent for finite étale data after extending constants. Full faithfulness is direct. For essential surjectivity reduce by induction to two factors, then by gluing and a limit argument to reduced irreducible affine factors of finite type, as in the source. Descend finite étale algebras across partial Frobenius and recover the product of the finite-cover fibre functors, including the product-of-lifts condition.

*Remark.* For I={1} recover the ordinary finite étale Galois category.

*Remark.* The factors need not be curves or equal. For X₁=A² and X₂=A¹ over F_q, the character of π₁(A²) through `Gal(F_{q²}/F_q)` and the trivial character of π₁(A¹) give the degree-two cover `A²_{F_{q²}} × A¹` with F_1 = Frob × id and F_2 = id × Frob, whose composite is its q-Frobenius. On the two-element fibre a Frobenius element of π₁(A²) acts by the transposition and π₁(A¹) acts trivially.

*Remark.* An arbitrary nonétale Frobenius-equivariant scheme need not descend: the twisted dual-number example of VL Remark 8.9 is excluded.

Source: [VL](#references), §8, Lemma 8.11 and its proof, pp. 111–112; Lemmas 8.5 and 8.8 and Remarks 8.6 and 8.9, pp. 108–110.

*Needs:* EtaleCohomologyFoundations §F.0.2 (finite étale Galois categories and the étale fundamental groupoid); Mathlib `CategoryTheory.GaloisCategory`; ReductiveGroupsPartII §RG2.3.7, *lang-theorem*.

### 4.2 Drinfeld’s lemma for lisse coefficients

For a lisse sheaf of finitely generated O_E-modules on U^I with the compatible commuting partial Frobenius structure, the fibre carries a continuous π₁(U)^I-action, and the lisse-sheaf construction is inverse. The statement includes torsion modules; finite coefficient quotients and their inverse limits recover the general finitely generated case. For a sheaf initially lisse on a dense open, the extension lemma requires its partial-Frobenius compatibility and finiteness; it is not automatic for arbitrary generic representations.

*Proof.* Apply the finite-cover statement to finite coefficient quotients and use continuous inverse limits. For a dense lisse open, propagate using partial Frobenius and the source’s extension argument before applying the global U^I statement.

*Remark.* Rank one and I=1 agree with the usual lisse representation correspondence.

*Remark.* Without a finite module or locally finite semilinear descent hypothesis, the Laurent-polynomial example of VL Remark 8.6 prevents naïve descent.

Source: [VL](#references), §8, Lemma 8.2, p. 107; Lemma 8.12 and its proof, pp. 111–112.

*Needs:* [§4.1 *Drinfeld’s lemma for finite étale covers*](#41-drinfelds-lemma-for-finite-étale-covers); EtaleCohomologyFoundations §§F.0.1, F.0.3, F.1 and F.2.1–F.2.7 (constructible coefficients, Tate twists, compact support, base change and Künneth).

### 4.3 The Frobenius–Weil group

Define FrobeniusWeil. Let F^I be the function field of X^I and fix an algebraic closure over the constant algebraic closure. FWeil consists of automorphisms whose restriction to the perfection of the constant-closed function field is a product of integer powers of the coordinate partial Frobenius maps. It fits into 1→π₁^geom(η^I)→FWeil→Z^I→0. A specialization to the diagonal supplies the map to Weil(F)^I; basepoint choices must be recorded.

*Construction.* Define the extension using the perfected geometric generic field and coordinate Frobenius. Extend an action of its geometric fundamental subgroup by the commuting partial Frobenius maps. Compare the diagonal specialization and its product Weil degrees; use the geometric constant-field kernel convention.

*Remark.* Feng §5.2.3 writes the wrong constant field in one subscript (Source corrections, E4); use the geometric kernel as in VL Remark 8.18, not the subgroup fixing the whole perfected function field.

The API:

- Automorphisms with a witnessed coordinate-Frobenius degree tuple.
- The homomorphism to Z^I with geometric kernel.
- The specialization-dependent map to Weil(F)^I.

**Checks.**

- For one leg the degree quotient is Z and the geometric kernel is the geometric absolute Galois group.
- For two legs the two coordinate degrees are independent; total Frobenius has degree (1,1).
- An element of the geometric kernel has degree zero in every coordinate; ordinary arithmetic Galois π₁ has a profinite degree quotient instead of Z^I.

Source: [VL](#references), §8, Remark 8.18, pp. 114–115; [Feng](#references), §5.2.3, p. 36.

The rational Frobenius–Weil descent theorem is a separate target: a finite-dimensional E-vector space carrying an E-linear FWeil action whose restriction to the geometric kernel is continuous factors through Weil(F)^I. Continuity here is imposed on the geometric kernel only; no O_E-lattice stable under partial Frobenius is required. Use Xue-S §1.2.9 and Lemma 1.2.10, p. 9, applying the finite-dimensional rational Drinfeld descent argument.

**Checks.**

- In one variable, the unramified line with Frobenius λ⁻¹ has trivial geometric action and descends to Weil(F). The valuation of its nth iterate of 1 is −n, so it has no Frobenius-stable O_E-lattice.
- Frobenius a∈O_E× preserves O_E; its powers have valuation 0, compatible with the integral lisse branch.
- For two variables with trivial geometric action and Frobenius scalars a,b∈E×, degree (m,n) acts by a^m b^n. This is an action of Weil(F)²; it need not have compact image when v(a)<0.

*Needs:* [§4.1 *Drinfeld’s lemma for finite étale covers*](#41-drinfelds-lemma-for-finite-étale-covers), for the rational descent target; [§2.9 *Partial Frobenius*](#29-partial-frobenius); EtaleCohomologyFoundations §F.0.2 (finite étale Galois categories and the étale fundamental groupoid).

### 4.4 Fusion and partial Frobenius

For ζ:I→J, partial Frobenius at a j-leg after coalescence corresponds to the product of the commuting partial Frobenius maps over ζ⁻¹(j), using the canonical coefficient comparison and compatible iterated presentations.

*Proof.* Refine the partitions so each relevant leg is separate. Check the cyclic rotations and the Satake fusion diagram before passing to the HN colimit.

*Remark.* For a bijection this is relabelling; for merging two legs it is a product of two commuting maps.

Source: [VL](#references), §4.5, Proposition 4.14, p. 70.

*Needs:* [§2.9 *Partial Frobenius*](#29-partial-frobenius); [§2.10 *Coalescence of legs*](#210-coalescence-of-legs).

### 4.5 Finite lisse envelopes

Every finite O_E-submodule of the Hecke-finite generic fibre is contained in a finite O_E-module M̃ stable under the product Galois action, factoring through π₁(U′)^I for a dense open U′ depending on that piece. It is the generic fibre of a lisse O_E-sheaf on (U′)^I with compatible partial Frobenius. That sheaf embeds into one sufficiently large HN truncation only on a dense open Ω⊂(U′)^I where the truncation is lisse. No embedding on the whole product, no fixed U′ for every piece, and no single finite lattice for all cohomology are asserted.

*Proof.* Choose a finite integral Hecke-stable module inside one truncation and a product of closed points in its lisse open. At each coordinate use the Eichler–Shimura recurrence of degree deg(v_i)dim(W_i), with Hecke coefficients preserving the module. This bounds all Frobenius powers by a finite box. Take the finite partial-Frobenius-stable enlargement, extend its lisse locus using the source’s extension lemma, and apply Drinfeld’s lemma.

*Remark.* The finite Frobenius box is the missing bridge from Hecke finiteness to a product Galois action.

*Remark.* Retain the Ω restriction of VL Remark 8.28: its equality with the whole product is explicitly not needed or proved there.

Source: [VL](#references), §8, Proposition 8.27 and Remark 8.28 with proof, pp. 119–123.

*Needs:* [§2.5 *Shtuka intersection-cohomology systems*](#25-shtuka-intersection-cohomology-systems); [§3.2 *Integral Hecke finiteness*](#32-integral-hecke-finiteness); [§3.6 *Hecke operators from Frobenius*](#36-hecke-operators-from-frobenius); [§3.7 *The Eichler–Shimura relation*](#37-the-eichlershimura-relation); [§4.2 *Drinfeld’s lemma for lisse coefficients*](#42-drinfelds-lemma-for-lisse-coefficients).

### 4.6 Hecke-finite specialization

For a chosen specialization from the product generic point to the diagonal generic point, the induced map between the corresponding HN-colimit fibres is an isomorphism on Hecke-finite parts. Its inverse is used with the transported product Galois action; the eventual excursion endomorphism is independent of this choice.

*Proof.* For surjectivity, move a finite lisse envelope by partial Frobenius so a diagonal specialization meets its lisse open, then invert the finite Frobenius action. For injectivity, specialize a kernel vector to a closed diagonal point and form its multi-index partial-Frobenius iterates. Use the coordinate polynomial recurrences, density of the partial-Frobenius orbit and invertibility of total Frobenius to force the whole finite recurrence box to vanish.

*Remark.* The proof must establish injectivity as well as existence of a generic lift.

*Remark.* An arbitrary ind-constructible sheaf without the recurrences has no such specialization theorem.

Source: [VL](#references), §8, Propositions 8.31–8.32 and Corollary 8.34, pp. 123–127.

*Needs:* [§3.7 *The Eichler–Shimura relation*](#37-the-eichlershimura-relation); [§4.5 *Finite lisse envelopes*](#45-finite-lisse-envelopes).

### 4.7 The product Galois action

The FWeil action on H^Hf factors uniquely through Gal(F̄/F)^I on an E-representation which is a filtered union of finite-dimensional continuous subrepresentations. Each finite subset is contained in a finite O_E-module whose action factors through π₁(U′)^I for some smaller nonempty U′⊂U; the open may depend on that finite piece.

*Proof.* Place the finite subset in a partial-Frobenius-stable lisse envelope. Apply the lisse Drinfeld lemma and pass through the directed union. Check agreement on overlapping finite envelopes for uniqueness and continuity.

*Remark.* No claim is made that the entire ind-cohomology carries a product Galois action by this argument.

Source: [VL](#references), §8, Proposition 8.27 and its proof, pp. 119–123.

*Needs:* [§4.2 *Drinfeld’s lemma for lisse coefficients*](#42-drinfelds-lemma-for-lisse-coefficients); [§4.3 *The Frobenius–Weil group*](#43-the-frobeniusweil-group); [§4.5 *Finite lisse envelopes*](#45-finite-lisse-envelopes).

### 4.8 The cohomology functors `H_{I,W}`

Define ShtukaH. Define `H_{I,W}` as the Hecke-finite diagonal-generic fibre of the HN cohomology system, transported through the specialization isomorphism when a product-generic fibre is needed. It is an E-linear functor in Rep_E(Ĝ^I), a Gal(F̄/F)^I representation which is a filtered union of finite-dimensional continuous subrepresentations, and has the coalescence isomorphisms χζ and the commuting Hecke action. For I=∅, W=1 it is the cusp space.

*Construction.* Take the specified Hecke-finite subspace and use specialization to transport the product Galois action. Verify naturality and independence of the chosen specialization on common finite lisse envelopes. For split G record the finite-dimensionality improvement cited in Xue-I; the main construction uses only the ind-finite statement and does not assume the improvement for every nonsplit case.

*Remark.* Do not impose a tensor equivalence between all H spaces; the needed structure is the indexed functor with fusion.

The API:

- The specified Hecke-finite fibre and its Hecke action.
- An E-linear coefficient functor in W.
- A continuous action on each finite-dimensional stable piece.
- χζ natural in W and coherent in ζ, including the empty set.

**Checks.**

- `H_{∅,1}` is exactly the cusp space, including the Ξ quotient.
- Adding a trivial leg does not change the underlying Hecke module.
- For ζ merging two legs, coefficients restrict by g↦(g,g), so V⊠V∗ becomes V⊗V∗, rather than forgetting a factor.

Source: [VL](#references), §9, Definition 9.3, Remark 9.5 and Proposition 9.7(a), pp. 130–132; §8, Remark 8.29, p. 120.

*Needs:* [§3.8 *The no-leg cusp identification*](#38-the-no-leg-cusp-identification); [§4.6 *Hecke-finite specialization*](#46-hecke-finite-specialization); [§4.7 *The product Galois action*](#47-the-product-galois-action).

### 4.9 Galois equivariance of coalescence

The map `χζ:H_{I,W}≃H_{J,W^ζ}` intertwines Gal(F̄/F)^J via the coordinate-diagonal map Gal^J→Gal^I. It is E-linear, Hecke-equivariant, natural in W and compatible with composition of maps of finite sets.

*Proof.* Restrict the comparison to common finite lisse envelopes. Compare partial Frobenius and specialization on each envelope, then apply the uniqueness part of Drinfeld descent.

*Remark.* Merging I={1,2} to one leg restricts γ↦(γ,γ), rather than multiplying two Galois elements.

Source: [VL](#references), §9, Proposition 9.7(b) and proof, pp. 132–133.

*Needs:* [§2.10 *Coalescence of legs*](#210-coalescence-of-legs); [§4.8 *The cohomology functors `H_{I,W}`*](#48-the-cohomology-functors-h_iw).

### 4.10 Naturality of leg operations

Creation and annihilation commute with Hecke operators away from the added legs and with partial Frobenius on unaffected legs. After the extended spherical action is constructed, the resulting excursions are endomorphisms of the full Hecke module. On created legs the operations retain the ordered Galois/Frobenius insertion rather than commuting it away.

*Proof.* Compare the Cartesian correspondence diagrams on separate legs. Use coefficient naturality, fusion coherence and the extended Hecke identity to descend the commutation relation.

*Remark.* For W=1 this reduces to commutation of the identity with the Hecke action.

Source: [VL](#references), §5, Definitions 5.1–5.2 and Lemma 5.3, pp. 71–72; §9, proof of Definition–Proposition 9.1, pp. 128–131.

*Needs:* [§2.11 *Hecke correspondences on shtukas*](#211-hecke-correspondences-on-shtukas); [§3.1 *Creation and annihilation*](#31-creation-and-annihilation); [§4.9 *Galois equivariance of coalescence*](#49-galois-equivariance-of-coalescence).

### 4.11 Independence of specialization choices

Changing the product-generic point, specialization arrow or finite lisse envelope changes the transported Galois/fusion data by the corresponding comparison isomorphism. In the creation–action–annihilation composite these comparisons cancel, giving a canonical no-leg endomorphism.

*Proof.* Place both sets of choices inside a common finite lisse envelope. Compare the two specialization maps and use naturality of the coefficient maps at both ends. Cancel the conjugating comparison in the complete excursion composite.

*Remark.* Canonicity is asserted for the endomorphism, not for a chosen basepoint identification of absolute Galois groups.

Source: [VL](#references), §9, Lemma 9.4 and Proposition 9.7, pp. 130–133.

*Needs:* [§4.6 *Hecke-finite specialization*](#46-hecke-finite-specialization); [§4.9 *Galois equivariance of coalescence*](#49-galois-equivariance-of-coalescence).

### 4.12 Weil descent on full cohomology

The Frobenius–Weil action on the full HN-colimit shtuka cohomology factors through Weil(F)^I: with O_E coefficients for split G as in Xue-I, and with E coefficients for the connected reductive nonsplit groups of the parahoric setting of Xue-S §6. This statement is about Weil groups and the full colimit; it does not assert an action of the full profinite Galois group on a finite-dimensional space.

The integral branch uses §3.7 for arbitrary finitely generated coefficients W with its auxiliary finite-free M; no decomposition of W into external products is assumed.

*Proof.* For a finite module M over a finitely generated commutative O_E-algebra A, reduce modulo powers of every maximal ideal m. If λ ∈ m the quotients are finite torsion O_E-modules; otherwise λ is invertible on A/mⁿ and the quotients are finite-dimensional over E. Apply the finite-coefficient lemma or the rational Frobenius–Weil descent theorem of §4.3 accordingly, using continuity on the geometric kernel in the latter case (Source corrections, E6). Use the Krull intersection theorem and localization to kill the kernel of the Frobenius–Weil action on M; in the split integral case use finiteness over one local Hecke algebra. For nonsplit G with rational coefficients, use the finite Hecke envelopes given by the Eichler–Shimura recurrence and finite local Hecke tensor products, and take their directed union. This uses semisimplicity of rational representations, not an integral semisimplicity claim.

*Remark.* A finite A-module need not be finite over O_E.

*Remark.* Descent of the full profinite Galois group on the integral Hecke-finite part is [§4.7 *The product Galois action*](#47-the-product-galois-action), a different theorem.

Source: [Xue-I](#references), §8.2, Lemmas 8.2.2 and 8.2.4 and Proposition 8.2.6, pp. 55–56; [Xue-S](#references), Proposition 1.3.4 and Lemma 1.3.11, pp. 11–12; §6, Lemma 6.0.9 and Proposition 6.0.10, p. 35.

*Needs:* [§3.7 *The Eichler–Shimura relation*](#37-the-eichlershimura-relation); [§3.12 *Finiteness over one local Hecke algebra*](#312-finiteness-over-one-local-hecke-algebra); [§4.1 *Drinfeld’s lemma for finite étale covers*](#41-drinfelds-lemma-for-finite-étale-covers); [§4.2 *Drinfeld’s lemma for lisse coefficients*](#42-drinfelds-lemma-for-lisse-coefficients); [§4.3 *The Frobenius–Weil group*](#43-the-frobeniusweil-group).

### 4.13 Ind-smoothness of full cohomology

For E coefficients and G with the parahoric model and good open of Xue-S §6, the entire cohomology ind-sheaf `H^j_{N,I,W}` is ind-smooth over (U∖|N|)^I: every specialization to the geometric generic fibre induces an isomorphism. The product Weil action factors through Weil(U∖|N|)^I. For split G with O_E coefficients, specialization from the diagonal generic fibre to the generic product is an isomorphism by Xue-I, Proposition 8.1.2; the stronger nonsplit integral assertion is not inferred from the rational theorem.

The pseudo-product sheaves and the specialization theorem for products of strictly henselian traits of Xue-S §§2–3, used in the second step, are part of this target.

*Proof.* First prove invariance under specialization on the generic product, using finite Frobenius envelopes and the injectivity argument. Use the tensor evaluation/coevaluation identity, pseudo-product sheaves and the source’s specialization theorem on products of strictly henselian traits to prove the specialization maps at closed leg tuples are isomorphisms. Factor general specializations through a closed tuple to obtain ind-smoothness on the good product. Apply the same method to the parahoric/nonsplit geometry with its twisted Satake coefficients. Preserve the rational coefficient hypothesis; record the distinct split integral diagonal-specialization theorem.

*Remark.* The untruncated ind-sheaf need not be one finite-rank lisse sheaf.

*Remark.* The theorem includes collision diagonals inside the good product, not just distinct legs.

Source: [Xue-S](#references), Theorem 4.2.3, p. 32; §6, Theorem 6.0.12 and Proposition 6.0.13, p. 36; [Xue-I](#references), §8.1, Proposition 8.1.2, p. 55.

*Needs:* [§2.9 *Partial Frobenius*](#29-partial-frobenius); [§4.6 *Hecke-finite specialization*](#46-hecke-finite-specialization); [§4.12 *Weil descent on full cohomology*](#412-weil-descent-on-full-cohomology).

### Examples

- *One leg.* For I = {1} Drinfeld's lemma is the usual equivalence between finite étale covers of U and finite continuous π₁(U)-sets, and the Frobenius–Weil group is an extension of Z by the geometric Galois group.
- *Two legs.* For I = {1, 2} the degree map of the Frobenius–Weil group is onto Z², total Frobenius has degree (1, 1), and merging the two legs restricts a pair of Galois elements along γ ↦ (γ, γ); it does not multiply them ([§4.9 *Galois equivariance of coalescence*](#49-galois-equivariance-of-coalescence)).
- *A counterexample to naive descent.* A finite module over a finitely generated O_E-algebra need not be finite over O_E: O_E[t]/(λt − 1) is the field E. This is why the Weil descent of [§4.12 *Weil descent on full cohomology*](#412-weil-descent-on-full-cohomology) separates maximal ideals containing λ from the others (Source corrections, E6).

### Dependencies

Layers 2–3; Mathlib `CategoryTheory.GaloisCategory`; EtaleCohomologyFoundations §§F.0.1–F.0.2 and F.2; the source theorems of Xue cited at each target.

## Layer 5: global excursions and the parameterization

This layer realizes the abstract excursion data of LanglandsParameterStacks by creation, Galois action and annihilation of legs on the cohomology of shtukas, proves their relations, continuity and unramifiedness, and applies the reconstruction of parameters from their characters. The result is V. Lafforgue's decomposition of the cusp space into generalized excursion eigenspaces indexed by semisimple global parameters, with scalar spherical Hecke action at good places in characteristic zero. The integral and modular blocks, the action on the full compactly supported cohomology, the conditional comparison with eigensheaves and the conjectural multiplicity description are separate targets, each with its own hypotheses. Standing hypotheses are those of Layer 1.

### 5.1 Global excursion operators

For finite I, W∈Rep_E(Ĝ^I), diagonal-Ĝ-invariant x∈W and ξ∈W∗, and (γi)∈Gal(F̄/F)^I, define `S_{I,W,x,ξ,γ}` on `C_c^cusp(Bun_{𝒢,N}(F_q)/Ξ,E)` by creation at the generic diagonal, inverse coalescence to `H_{I,W}`, action of (γi), coalescence back and annihilation. It is independent of the specialization choices and commutes with the full level-N Hecke algebra.

*Construction.* Identify the trivial-coefficient no-leg space with cusp forms by VL Proposition 8.23. Compose the coefficient maps and the product Galois action on the Hecke-finite space; compare specialization choices using VL Lemma 9.4, p. 130. Use the correspondence naturality on each finite envelope and pass to the union.

*Remark.* The definition is an actual action on the cusp space, not a new abstract generator with assumed relations.

The API:

- The endomorphism from (I,W,x,ξ,γ).
- Any common refinement of the specialization choices gives the same endomorphism.
- It belongs to the commutant of the full level-N Hecke action.

**Checks.**

- For W=1 and ξ(x)=a the operator is a·Id, including a=0.
- With all γi=1 the operator is ξ(x)·Id.
- For I={1,2}, W=V⊠V∗, x=coevaluation and ξ=evaluation, (Frob_v,1) gives the normalized spherical Hecke operator; no ordinary trace at one leg replaces this two-leg construction.

Source: [VL](#references), §9, Definition–Proposition 9.1, pp. 128–129.

*Needs:* [§3.1 *Creation and annihilation*](#31-creation-and-annihilation); [§3.8 *The no-leg cusp identification*](#38-the-no-leg-cusp-identification); [§4.7 *The product Galois action*](#47-the-product-galois-action); [§4.10 *Naturality of leg operations*](#410-naturality-of-leg-operations); [§4.11 *Independence of specialization choices*](#411-independence-of-specialization-choices).

### 5.2 Invariant-function indexing

The shtuka operator depends on (W, x, ξ) only through the function f((g_i)) = ξ((g_i)x) in O(Ĝ\Ĝ^I/Ĝ), and every such invariant function is a matrix coefficient of this form. So the geometric construction gives an operator `S_{I,f,γ}`. This realizes the abstract excursion data of LanglandsParameterStacks §§LP2e.13–LP2e.14; it does not redefine them.

*Proof.* For a matrix coefficient take the cyclic subrepresentation generated by x and quotient by the largest subrepresentation annihilated by ξ. Identify the quotient with the finite-dimensional translation span of f in O(Ĝ^I/Ĝ). Apply naturality of H to the injection and quotient, so the composite depends only on this canonical cyclic coefficient.

*Remark.* No freeness or preferred decomposition of W is used.

*Remark.* For I=1 the double quotient has only constants; conjugation-invariant functions of one group variable correspond to two legs.

Source: [VL](#references), §10, Notation 10.5, Lemma 10.6 and Notation 10.7, pp. 137–138.

*Needs:* [§5.1 *Global excursion operators*](#51-global-excursion-operators); LanglandsParameterStacks §LP2e.13 (excursion data); LanglandsParameterStacks §LP2e.14 (excursion matrix coefficients).

The pointwise matrix coefficient of an abstract group representation is g↦ξ(ρ(g)x). Its identity value is ξ(x); diagonal invariance of x and ξ makes it invariant on both sides as a function on points. Regularity in this target requires the finite-dimensional algebraic representation of Ĝ^I specified above. For example, on (R×)² the abstract action (a,b)↦|a/b| with x=1 and ξ=id is diagonally invariant but not regular on G_m². The abstract excursion datum is supplied by LanglandsParameterStacks.

**Checks.**

- ξ=0 gives the identically zero function, and the identity tuple gives ξ(x).
- With one leg and invariant x the function is the constant ξ(x), even for a nontrivial ambient representation; it is not an arbitrary class function of one group element.
- For Ĝ=SL₂, W=V⊠V∨, and coevaluation/evaluation as x,ξ, the function is tr(g₁g₂⁻¹). At (diag(2,1/2),1) over Q it is 5/2, whereas at (1,1) it is 2. For A=diag(2,1/2), f(A,A)=tr(1)=2, whereas the incorrect tr(A²) is 17/4. This distinguishes the relative inverse from multiplication; the value at (A,1) alone does not.

### 5.3 Satake scalars and parameter separation

For split G and a good place v∈U∖|N|, f(g1,g2)=χV(g1g2⁻¹) and γ∈Gal(F̄_v/Fv) of Weil degree d≥0, `S_{{1,2},f,(γ,1)}` depends only on d, and for d=1 equals `T(h_{V,v})`. For nonsplit unramified G use the twisted-character formulation of §§1.12 and 3.6. Chebotarev and continuity determine all single-element semisimple classes from good-place Satake data. This determines a semisimple GL_r representation by its trace, but does not imply simultaneous conjugacy of general reductive-group parameters; all-tuples excursions supply that stronger separation.

*Proof.* Transport partial Frobenius through the specialization comparison to obtain the dependence on d only, and use VL Proposition 6.2 when d = 1. Use Chebotarev density (FunctionFieldArithmetic §5.8: in every finite quotient of π₁(X∖|N|) each conjugacy class is the Frobenius of unramified places of every sufficiently large compatible degree) only for continuous class functions, which gives information on individual conjugacy classes. For GL_r, use the semisimple reconstruction of determinants over an algebraically closed field and, in characteristic zero, the injectivity of the trace on determinants (IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1; this is Taylor's pseudocharacter theorem, recalled in VL Remark 11.8). For general Ĝ keep the invariants of all tuples.

*Remark.* For general Ĝ, homomorphisms that are conjugate element by element need not be conjugate; only the invariants of all tuples separate parameters, and this theorem uses no more than that distinction.

Source: [VL](#references), §10, Lemma 10.2, p. 135; §11, Remarks 11.6 and 11.8, pp. 142–143; §0.7, pp. 36–37.

*Needs:* [§1.12 *Normalized spherical Satake*](#112-normalized-spherical-satake); [§3.6 *Hecke operators from Frobenius*](#36-hecke-operators-from-frobenius); [§5.1 *Global excursion operators*](#51-global-excursion-operators); IntegralHeckeAndGaloisDeterminants IHG.1 (*Semisimple reconstruction of field determinants*); IntegralHeckeAndGaloisDeterminants IHG.0 (*A determinant is determined by its trace when d! is invertible*); FunctionFieldArithmetic §5.8 (degree-sensitive Chebotarev for finite Galois extensions of F, with the constant-field congruence).

### 5.4 Excursions on full compact cohomology

Define CompactShtukaCohom.excursion. For split G, finite retained legs J, a coefficient representation V ∈ `Rep_{O_E}(Ĝ^J)` on a finitely generated module, finite auxiliary legs I disjoint from J, W ∈ `Rep_{O_E}(Ĝ^I)` on a finitely generated module, diagonal-Ĝ-invariant x ∈ W and ξ ∈ W∗, a tuple γ ∈ Weil(F̄/F)^I and any j∈Z, define `S^{O_E}_{I,W,x,ξ,γ}` on `H^{j,O_E}_{N,J,V}` restricted to the generic point of the diagonal of X^J by creating the legs I, applying the product Weil action (trivially on the J coordinates) and annihilating I. The operators commute with proper-parabolic constant terms and with extension of scalars to E. At J = ∅, V = 1, j = 0 they act on the whole space of compactly supported automorphic functions, including its noncuspidal part. The nonsplit version with E coefficients uses ind-smoothness.

For nonsplit G with torsion coefficients the construction is part of this target: Xue-I §8 treats split G and Xue-S §6 the nonsplit case with E coefficients, while GeL §9 uses the torsion version. The coefficient-natural specialization and constant-term arguments must be checked under the parahoric hypotheses of Xue-S §6.

*Construction.* Use the integral isomorphism of specialization to the diagonal to transport the full product Weil action; this avoids the restriction to Hecke-finite vectors. Create the auxiliary legs with x, insert identities on the retained legs, and annihilate with ξ. Use compatibility of the constant-term correspondences and the coefficient-natural Satake and cohomology maps to obtain the commuting diagrams.

*Remark.* The construction does not extend a finite-dimensional cusp operator to all functions by linear algebra alone.

The API:

- Creation–Weil–annihilation on all cohomological degrees with the retained J legs.
- The proper-parabolic constant term intertwines the G and Levi operators.
- Extension O_E→E intertwines the integral and rational actions.
- Restriction to the cuspidal subspace agrees with the original global excursion.

**Checks.**

- With I empty the operator is the scalar pairing ξ(x) on the unchanged J-cohomology.
- With J empty and V trivial, noncuspidal compactly supported functions remain in the domain.
- The action of an auxiliary tuple inserts identity in each J coordinate; letting it act on a retained leg would fail this test.

Source: [Xue-I](#references), §8.3, Construction 8.3.3, 8.3.4 and Lemma 8.3.5, p. 57; §8.4, Proposition 8.4.2, p. 58.

*Needs:* [§1.14 *Integral geometric Satake*](#114-integral-geometric-satake); [§3.5 *Cuspidal shtuka cohomology*](#35-cuspidal-shtuka-cohomology); [§4.12 *Weil descent on full cohomology*](#412-weil-descent-on-full-cohomology); [§4.13 *Ind-smoothness of full cohomology*](#413-ind-smoothness-of-full-cohomology); [§5.1 *Global excursion operators*](#51-global-excursion-operators).

### 5.5 The global excursion identities

The shtuka realization satisfies the excursion relations of LanglandsParameterStacks §LP2e.10: f ↦ `S_{I,f,γ}` is a unital E-algebra map for each tuple γ; reindexing along ζ : I → J pulls back f and γ compatibly; disjoint unions multiply operators; and the three-copy identity inserts γ_i(γ′_i)⁻¹γ″_i into f. For each fixed f the map on tuples is continuous for the E-adic topology and factors through π₁(U)^I for some U. These relations are proved for the geometric operators, not imposed as axioms on the cusp space.

*Proof.* Tensor products and disjoint legs give multiplication; coefficient naturality gives linearity. Use fusion functoriality for reindexing. Insert coevaluation and evaluation in W⊗W∗⊗W and apply the two zigzag identities for the three-copy relation. Put each finite set of coefficient maps in a finite lisse envelope; this proves continuity without finite-dimensionality of all `H_{I,W}`.

*Remark.* The ordered expression is γ(γ′)⁻¹γ″; this order is what the reconstruction uses.

*Remark.* The universal presentation is LanglandsParameterStacks §LP2e.10's; this target verifies its hypotheses for global cohomology.

Source: [VL](#references), §10, Lemma 10.1 and Proposition 10.8(i)–(iv), pp. 133–139.

*Needs:* [§4.4 *Fusion and partial Frobenius*](#44-fusion-and-partial-frobenius); [§4.9 *Galois equivariance of coalescence*](#49-galois-equivariance-of-coalescence); [§5.2 *Invariant-function indexing*](#52-invariant-function-indexing); LanglandsParameterStacks §§LP2e.9–LP2e.10 (excursion algebras of a group and the universal excursion relations).

### 5.6 Unramifiedness of excursions

Every `S_{I,f,γ}` depends only on the image of γ in π₁(X∖|N|)^I, and the resulting map to the finite-dimensional excursion algebra is E-adically continuous. In the nonsplit case replace |N| by |N|∪(X∖U_𝒢), where 𝒢 is reductive on U_𝒢.

*Proof.* At v outside the bad set, creation is defined over the whole diagonal through v. VL Lemma 10.4 compares local Galois degree d with the d·deg(v) partial Frobenius iterate. For d=0 the created vectors are fixed by inertia in every coordinate, so inserting inertia changes no excursion. Pass from the individual inertia groups to the closed normal subgroup they generate in π₁(U), retaining continuity.

*Remark.* This proves factorization through the entire specified good open, not only an unspecified smaller open.

Source: [VL](#references), §10, Lemma 10.4 and Proposition 10.10, pp. 136–140; §12.1, p. 149; §12.3.4, pp. 162–164.

*Needs:* [§3.6 *Hecke operators from Frobenius*](#36-hecke-operators-from-frobenius); [§4.2 *Drinfeld’s lemma for lisse coefficients*](#42-drinfelds-lemma-for-lisse-coefficients); [§5.5 *The global excursion identities*](#55-the-global-excursion-identities).

### 5.7 The global excursion algebra

Define GlobalExcursion.algebra. `B_{N,Ξ,E}` is the E-subalgebra of `End_Hecke(C_c^cusp(Bun_{𝒢,N}(F_q)/Ξ,E))` generated by all `S_{I,f,γ}`. It is finite-dimensional and commutative, and contains the spherical Hecke operators at good places. After a finite coefficient extension splitting B, the cusp space decomposes into its generalized B-character spaces. Reducedness of B and diagonalizability of every excursion are not asserted.

*Construction.* The disjoint-union formula gives commutativity; finite-dimensionality of the cusp space makes B finite-dimensional. Use VL Lemma 10.2 to embed the spherical operators into B. Apply the primary decomposition for a finite-dimensional commutative algebra acting on a finite-dimensional vector space.

*Remark.* Use generalized eigenspaces even in characteristic zero; a finite-dimensional commutative algebra can have nilpotents.

The API:

- The image algebra inside the Hecke commutant.
- Every geometric excursion has its canonical element of B.
- The simultaneous generalized character subspace.
- After a finite splitting extension the finite direct sum of blocks is the cusp space. Both statements are required: the character blocks are independent and their supremum is the whole cusp space. Over an algebraic closure, the χ-block is the intersection, over a∈B, of the maximal generalized eigenspaces of a for χ(a); an equality of their sum with the whole space alone is insufficient.

**Checks.**

- When the cusp space is zero the image algebra acts on the zero space and there are no nonzero blocks.
- For G_m, ordinary reciprocity characters give the usual rank-one Hecke decomposition.
- On E² a Jordan operator with a nonzero upper entry has one two-dimensional generalized block and a one-dimensional eigenspace; the block API must distinguish them.

Source: [VL](#references), §10, Notation 10.5, p. 137; §11, Remark 11.6, p. 142.

*Needs:* [§3.8 *The no-leg cusp identification*](#38-the-no-leg-cusp-identification); [§5.5 *The global excursion identities*](#55-the-global-excursion-identities); [§5.6 *Unramifiedness of excursions*](#56-unramifiedness-of-excursions); FunctionFieldArithmetic §6.4 (finite generation of the fixed-level cusp module); Mathlib `Algebra.adjoin`, `Module.End.genEigenspace` and `Module.End.iSup_maxGenEigenspace_eq_top`.

Use Mathlib `Algebra.isMulCommutative_adjoin` for the commuting generating family and `FiniteDimensional.finiteDimensional_subalgebra` for its image algebra. The direct-sum target includes both independence and spanning of the generalized character spaces; use `Module.End.independent_iInf_maxGenEigenspace_of_forall_mapsTo` for independence and the simultaneous generalized-eigenspace spanning theorem for spanning. The geometric realization and its parameter-labelled decomposition remain the headline targets.

### 5.8 Global reconstruction of parameters

For a character ν : B → Q̄_ℓ, the maps Θ_n^ν obtained by adding a base leg with γ₀ = 1 form a pseudocharacter of Γ = π₁(X ∖ |N|) with values in Ĝ. The reconstruction theorem for an arbitrary group (LanglandsParameterStacks §LP2c.2) gives a Ĝ-completely reducible σ_ν : Γ → Ĝ(Q̄_ℓ), unique up to Ĝ(Q̄_ℓ)-conjugacy, with `ν(S_{I,f,γ})` = f((σ_ν(γ_i))). The continuity of σ_ν for the profinite topology of Γ and the E-adic topology, its definition over one finite extension E′/Q_ℓ, and the reductivity of its Zariski closure are part of this target (VL Proposition 11.7 and Lemmas 11.9–11.10); LP2c.3–LP2c.4 treat continuity for local Weil groups only. Distinct characters of B give distinct parameter classes.

*Proof.* Use Ĝⁿ//Ĝ ≅ `Ĝ\Ĝ^{n+1}/Ĝ`, (g₁, …, g_n) ↦ (1, g₁, …, g_n), to turn the geometric relations into compatible maps Θ_n. Apply the reconstruction of LP2c.2 to obtain σ_ν up to conjugacy. For continuity, fix a finite tuple whose closure is maximal reductive with minimal centralizer; it lies in one finite extension E′, uniqueness descends every further tuple entry to E′, and surjectivity of restriction to the coordinate ring of the double centralizer gives continuity. The invariant evaluations recover ν on all generators, which proves injectivity of ν ↦ [σ_ν].

*Remark.* The local-Weil continuity statements of LanglandsParameterStacks do not give continuity for the global profinite group; that step is part of this target.

*Remark.* Chebotarev equality of individual semisimple classes does not replace the theorem for all tuples.

Source: [VL](#references), §11, Definition–Proposition 11.3, Proposition 11.7 and Lemmas 11.9–11.10, pp. 141–146.

*Needs:* [§5.6 *Unramifiedness of excursions*](#56-unramifiedness-of-excursions); [§5.7 *The global excursion algebra*](#57-the-global-excursion-algebra); LanglandsParameterStacks §§LP2c.1–LP2c.2 (pseudocharacters with prescribed projection; reconstruction for an arbitrary group).

### 5.9 The global cuspidal decomposition

For split G, fixed N and central lattice Ξ, there is a canonical finite direct-sum decomposition `C_c^cusp(Bun_{G,N}(F_q)/Ξ,Q̄_ℓ)=⊕σ` Hσ into full level-N Hecke submodules indexed by continuous semisimple global parameters unramified outside N, each defined over a finite Q_ℓ-extension. Hσ is the simultaneous generalized excursion eigenspace with evaluation f((σ(γi))). For every good v and irreducible V, `T(h_{V,v})` acts on Hσ by the scalar χV(σ(Frob_v)). Zero summands may be omitted. No converse existence or general multiplicity formula is claimed.

*Proof.* Decompose the cusp space into primary B-character blocks and label each with its unique reconstructed parameter. Spherical Hecke operators have the required generalized eigenvalue by the excursion identity. Their adjoints are again spherical Hecke operators under the standard positive Hermitian pairing after scalar transport to C; commutativity makes them normal and diagonalizable. Their restriction to one generalized block therefore has the indicated scalar action.

*Remark.* The last step gives actual spherical Hecke scalars; it does not prove that every excursion is diagonalizable.

Source: [VL](#references), §11, Theorem 11.11 and proof, p. 148.

*Needs:* [§5.3 *Satake scalars and parameter separation*](#53-satake-scalars-and-parameter-separation); [§5.7 *The global excursion algebra*](#57-the-global-excursion-algebra); [§5.8 *Global reconstruction of parameters*](#58-global-reconstruction-of-parameters).

### 5.10 The nonsplit global decomposition

Let G/F be connected reductive with connected parahoric model 𝒢/X, reductive on U, and let F̃ be the fixed field of the kernel of the pinned Galois action on the full based root datum. This extension is unramified over the full chosen U; use the étale local model descent of §1.11 there, independently of whether the model has a finite étale splitting cover. Put ᴸG = Ĝ ⋊ Gal(F̃/F). The full cusp space on `Bun_{𝒢,N}(F_q)/Ξ`, including ker¹ pure-inner-form components, has the canonical generalized excursion decomposition indexed by continuous semisimple σ : Gal(F̄/F) → ᴸG(E′), unramified outside |N|∪(X∖U), whose projection is the prescribed quotient to Gal(F̃/F). For every v∈U∖|N| and every V∈Rep_E(ᴸG_v), the good-place operator `h_{V,v}` of §1.12 acts by Tr(σ(Frob_v)|V), with the local embedding and prescribed projection understood; the decomposition respects changes of N.

**Checks.**

- For split G_m the pinned action is trivial, so Q=1 and no auxiliary ramification occurs.
- For G_m/F₃(t), U=P¹ and N=∅, F(√t)/F is ramified at 0 and ∞ and is rejected as a prescribed finite quotient: it would force ramification at good places.
- For an unramified nonsplit torus at v, inertia acts trivially on its lattice and hence on Q, whereas Frobenius may act nontrivially.
- For the product torus of §1.12 with Q=C₂×C₂ and Q_v=C₂, a local weight-one V on the split factor gives eigenvalue z(σ(Frob_v)); its dual gives z(σ(Frob_v))⁻¹. At z=2 these are 2 and 1/2, so a statement only about their global sum 5/2 would miss two distinct spherical operators.
- For GL(O⊕O(1)) on P¹/F₃, U=P¹ includes ∞. Descent on its two affine charts yields the usual GL₂ spherical comparison at both 0 and ∞, with Q=1; deleting ∞ from the construction would omit a good place.

*Proof.* Use twisted Satake coefficients, and keep the nonconstant local system of diagonal-Ĝ invariants when defining creation and annihilation before passing to generic fibres. Verify the same identities with `O(Ĝ\(ᴸG)^I/Ĝ)`; functions pulled back from the finite component quotient act by their prescribed scalar values. Apply the reconstruction of LanglandsParameterStacks §§LP2c.1–LP2c.2 for groups with reductive identity component and prescribed finite projection. The scalar values force the required projection, and the unramifiedness argument gives the stated good open. For each good v and local V, choose a global representation whose restriction contains V and insert the local projector through the fixed-leg comparison of §§1.11 and 3.6. For any regular function f on ᴸG invariant under ᴸG_v-conjugacy and restricting to χ_V on ᴸG_v, prove `Theta_1(f)(gamma)=T(h_{V,v})` for γ∈Γ_v of geometric Weil degree 1 (VL §12.3.5(e′)); it depends only on that local restriction, not on f or on the containing representation. Such an f exists by extension by zero from the open-and-closed subgroup ᴸG_v. Reconstruction gives the corresponding generalized eigenvalue, and the spherical adjointness argument of §5.9 gives scalar action. Compare restriction of level and all inner-form components through the common Hecke action.

*Remark.* The finite quotient and its projection are part of the parameter; replacing ᴸG by Ĝ loses the nonsplit arithmetic.

Source: [VL](#references), §12.1, Theorem 12.3 and Remark 12.4, pp. 148–152; §12.3.4–§12.3.5, pp. 162–165.

*Needs:* [§0.12 *Nonsplit bundle descent*](#012-nonsplit-bundle-descent); [§1.11 *Nonsplit Satake descent*](#111-nonsplit-satake-descent); [§1.12 *Normalized spherical Satake*](#112-normalized-spherical-satake); [§3.6 *Hecke operators from Frobenius*](#36-hecke-operators-from-frobenius); [§5.8 *Global reconstruction of parameters*](#58-global-reconstruction-of-parameters); [§5.9 *The global cuspidal decomposition*](#59-the-global-cuspidal-decomposition).

### 5.11 Integral and modular excursion blocks

Integral Satake coefficients make the excursion operators preserve the cusp O_E-lattice. Their reductions give, over F̄_ℓ, canonical generalized blocks indexed by continuous completely reducible parameters into the dual group over F̄_ℓ, with the prescribed L-group projection in the nonsplit case. The good-place Hecke action has the corresponding generalized eigenvalues; scalar action is not asserted in this coefficient branch.

*Proof.* Use the integral Satake coefficients of [§1.14 *Integral geometric Satake*](#114-integral-geometric-satake), with the integral perverse convention, and run the geometric correspondences on the O_E-lattice. Reduce the finite excursion algebra and apply the positive-characteristic reconstruction of LanglandsParameterStacks §LP2c.2, which uses Ĝ-complete reducibility, not the characteristic-zero criterion through reductive closures. Apply primary decomposition, without the Hermitian normality argument, which is unavailable in characteristic ℓ.

*Remark.* The integral Satake equivalence and the positive-characteristic reconstruction are separate inputs; neither follows from the rational Satake theorem.

Source: [VL](#references), §13, Proposition 13.1, Theorem 13.2 and Remark 13.3, pp. 166–169.

*Needs:* [§1.14 *Integral geometric Satake*](#114-integral-geometric-satake); [§5.10 *The nonsplit global decomposition*](#510-the-nonsplit-global-decomposition); LanglandsParameterStacks §§LP2e.9–LP2e.10 (excursion algebras of a group and the universal excursion relations); LanglandsParameterStacks §§LP2c.1–LP2c.2 (pseudocharacters with prescribed projection; reconstruction for an arbitrary group).

### 5.12 The conditional eigensheaf comparison

For split G at empty level, suppose a Ξ-equivariant ℓ-adic Hecke eigensheaf F on Bun_G has eigen-local-system E and has cuspidal trace function f. Assume the additional trace-comparison maps in VL Proposition 15.1 are compatible with partial Frobenius. Then f lies in the global block H_σ for the Galois parameter of E. The required maps are coefficient-natural and fusion-compatible; partial-Frobenius compatibility is the explicitly unwritten input. This conditional application is not a prerequisite of the proven decomposition.

*Proof.* Use the Frobenius-graph trace construction to obtain `π_{F,E,I,W}:colim_μ` `H^{0,≤μ}_{N,I,W}→W_E`, natural in W and compatible with fusion. Assume its partial-Frobenius compatibility, which the source explicitly has not established in writing. Then creation–Galois–annihilation evaluates on f by f_I(σ(γ_i)). The empty-leg trace pairing identifies the resulting vector with the cusp trace function, so primary decomposition places it in H_σ.

*Remark.* This is a conditional statement: its extra hypothesis, compatibility of the trace maps with partial Frobenius, is assumed in VL Proposition 15.1 and is not proved there. It is not used by any other target.

Source: [VL](#references), §15, setting before Proposition 15.1 and Proposition 15.1 with proof, pp. 173–174.

*Needs:* [§4.8 *The cohomology functors `H_{I,W}`*](#48-the-cohomology-functors-h_iw); [§5.10 *The nonsplit global decomposition*](#510-the-nonsplit-global-decomposition).

### 5.13 Multiplicity spaces beyond the theorem

Formulate, as a named conjecture and not as an axiom, V. Lafforgue's expected description `H_{I,W}` ≅ ⊕_σ (A_σ ⊗ `W_{σ^I})^{S_σ}` of the cohomology functors through multiplicity spaces A_σ and centralizer groups S_σ, and prove that its case I = ∅, W = 1 is consistent with the proved decomposition [§5.9 *The global cuspidal decomposition*](#59-the-global-cuspidal-decomposition). The Arthur-parameter and motivic-independence statements of VL Conjectures 12.7 and 12.12 are likewise only formulated. No other target depends on these conjectures; the proved results use generalized excursion eigenspaces and do not assume that the excursion algebra is reduced.

*Proof.* Compare the conjectural formula with the proved no-leg decomposition, keeping its centralizer and invariant factors.

Source: [VL](#references), §0, Remark 0.30 and (0.43), pp. 27–28; §12.2.2–§12.2.4, Conjectures 12.7 and 12.12, pp. 153–155.

*Needs:* [§4.8 *The cohomology functors `H_{I,W}`*](#48-the-cohomology-functors-h_iw); [§5.9 *The global cuspidal decomposition*](#59-the-global-cuspidal-decomposition).

### Examples

- *Trivial data.* For W = 1 and ξ(x) = a the excursion operator is a·Id, including a = 0; with all γ_i = 1 it is ξ(x)·Id ([§5.1 *Global excursion operators*](#51-global-excursion-operators)).
- *Hecke operators are excursions.* For I = {1, 2}, W = V ⊠ V∗, x the coevaluation and ξ the evaluation, the operator attached to (Frob_v, 1) is the normalized spherical Hecke operator `T(h_{V,v})` ([§5.3 *Satake scalars and parameter separation*](#53-satake-scalars-and-parameter-separation)).
- *Generalized eigenspaces.* On E² the operator with matrix rows (1, 1) and (0, 1) has a two-dimensional generalized eigenspace for the eigenvalue 1 but a one-dimensional eigenspace; the excursion decomposition of [§5.7 *The global excursion algebra*](#57-the-global-excursion-algebra) is by generalized eigenspaces.
- *Level control.* For X=P¹/F₃, G=G_m and full level N={0,∞}, the degree-zero ray Picard group is (F₃××F₃×)/F₃×≃F₃× of order 2. After quotienting the degree direction the cusp dimension is 2; erasing level would give dimension 1.
- *Rank one.* For G = G_m the excursion decomposition is the decomposition of the cusp space (all functions on the finite ray Picard group Pic(X,N)/Ξ, the levelled bundle classes `Bun_{G_m,N}(F_q)/Ξ`) into characters, and the parameters are the rank-one Galois characters of class field theory.

### Dependencies

Layers 0–4; LanglandsParameterStacks §§LP2e.9–LP2e.14 and LP2c.1–LP2c.2; IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1; FunctionFieldArithmetic §§5.8 and 6.4; Mathlib `Algebra.adjoin` and generalized eigenspaces.

## Layer 6: coefficient fields, companions and the GL_r excursion comparison

L. Lafforgue's global Langlands correspondence for GL_r over F belongs to AutomorphicLFunctionsAndLocalFactors §AL.3 (see Scope and ownership); this layer builds on it. It removes the finite-determinant hypothesis by constant twists, under the exact algebraicity and plainness conditions that this requires, proves the existence of ℓ-adic companions on curves, and compares the parameters of V. Lafforgue's excursion decomposition for GL_r with those of the correspondence. The comparison is a second route to the rank-r existence statement; the proof in AL.3 does not depend on Layer 5.

Standing hypotheses for this layer: G = GL_r with r ≥ 1; ℓ ≠ p; a fixed isomorphism Q̄_ℓ ≅ C where analytic statements are compared; local factors use one additive character and its self-dual measures.

### 6.1 Constant twists and coefficient fields

For an irreducible lisse Q̄_ℓ-sheaf L on a smooth curve over F_q, a constant rank-one twist makes det L finite order. This normalization is DeligneWeightsAndPurity §5.5 applied to det L: a rank-one ℓ-adic Weil representation has finite geometric image and is a constant Weil character times a finite-order character. For the continuous lisse input the constant scalar is an ℓ-adic unit, so the twist extends continuously to the Galois group of the constant field. The stronger conclusion that this twist is algebraic and plain of characteristic p requires that the Frobenius eigenvalues of L be algebraic and units at every non-p place; being units only at the chosen ℓ-adic place is insufficient. Under Chin Proposition 4.3’s equivalent algebraicity/plainness hypotheses one may choose the constant scalar algebraic and plain of characteristic p, and apply the finite-determinant correspondence to the twisted sheaf. If L is additionally pure of a specified weight w, the normalizing twist can be chosen pure of weight −w; algebraicity and plainness alone do not impose a weight.

*Proof.* Apply DeligneWeightsAndPurity §5.5 to det L to find a constant β, an ℓ-adic unit, whose twist has finite determinant; for example the constant rank-one sheaf with arithmetic Frobenius 1+ℓ is normalized by the twist (1+ℓ)⁻¹ to the trivial character, although 1+ℓ has infinite order. Apply the finite-determinant theorem to the twist. The algebraicity and plainness refinement below is proved here, using Chin Proposition 4.3. Under the algebraic/plain hypotheses compare one Frobenius eigenvalue before and after twisting to prove β has the required number-theoretic properties. Undo the twist only in a coefficient category where the selected scalar is defined; its field need not be Q.

*Remark.* p-plainness is not inferred from continuity at a single ℓ-adic completion.

Source: [Chin](#references), §4.2 and Proposition 4.3, pp. 13–14.

*Needs:* AutomorphicLFunctionsAndLocalFactors §AL.3, the global GL_r correspondence (*Leveled shtukas and ramified rank induction*, with all-place pair factors and temperedness; *Function-field local factors, multiplicity one and converse theorem*; the unramified pure realization theorem); DeligneWeightsAndPurity §5.5 (finite geometric monodromy and rank-one normalization).

### 6.2 Compatible systems on curves

For an irreducible finite-determinant lisse Q̄_ℓ-sheaf of rank r≥1 on a smooth curve, the good-place Frobenius polynomials lie in a number field; its eigenvalues are pure of weight zero and units at every place away from p. For each λ∤p there is an irreducible λ-adic companion with the same polynomials, after a finite local coefficient extension. More generally an algebraic p-plain irreducible sheaf belongs, after extending its number field, to a compatible system by the constant-twist reduction. For the finite-determinant sheaf and a reciprocal Frobenius root α at x and an additive valuation v_λ above p, the normalized slope bound is `|v_λ(α)/v_λ(q^{deg x})|≤(r−1)²/r`, as in LL VII.6(iv). Here deg x>0 and v_λ(q)>0, so the denominator is nonzero; for r=1 the bound is zero. For a general algebraic p-plain sheaf apply this bound after a finite-determinant constant twist; undoing that twist translates every normalized slope by the normalized valuation of the inverse twisting scalar.

**Checks.**

- A finite-order rank-one sheaf has roots of unity as Frobenius eigenvalues, hence normalized slope 0.
- The constant rank-one sheaf with geometric Frobenius q has normalized slope 1, so the uncentered rank-one bound 0 does not apply to it. Twisting by q⁻¹ gives slope 0.
- In rank two the finite-determinant bound is 1/2. Multiplying every Frobenius eigenvalue at x by q^(deg x) translates the allowed slope interval from [−1/2,1/2] to [1/2,3/2].

*Proof.* Use automorphic multiplicity one and the rationality field of π to get one number field for all Frobenius polynomials. Transport the automorphic representation to each λ-adic coefficient field and apply the GL_r theorem again. Use the essential-cohomology realization to descend a finite multiple of each companion and split the resulting central simple algebra over a finite extension. Apply the constant twist criterion for the p-plain extension. Do not assert crystalline companions from this argument.

*Remark.* Companions match the full characteristic polynomials at all good closed points, not only traces at one point.

*Remark.* Drinfeld's companions on smooth varieties of higher dimension are not part of this roadmap.

Source: [LL](#references), Chapter VII §2a, Theorem VII.6 and proof, pp. 198–200; [Chin](#references), §4.6, Theorem 4.6, pp. 15–16; [KZ](#references), §5.3.1, p. 53.

*Needs:* [§6.1 *Constant twists and coefficient fields*](#61-constant-twists-and-coefficient-fields); AutomorphicLFunctionsAndLocalFactors §AL.3, the global GL_r correspondence (*Leveled shtukas and ramified rank induction*, with all-place pair factors and temperedness; *Function-field local factors, multiplicity one and converse theorem*; the unramified pure realization theorem).

### 6.3 The GL_r excursion comparison

Assume the GL_s correspondence for all s < r. A GL_r parameter occurring in the excursion decomposition [§5.9 *The global cuspidal decomposition*](#59-the-global-cuspidal-decomposition) is irreducible and pure of weight zero. It therefore supplies the rank-r existence input of Deligne's induction, and it equals the parameter given by the GL_r correspondence of AutomorphicLFunctionsAndLocalFactors §AL.3. This is a second route; the proof in AL.3 does not use Layer 5.

*Proof.* If an occurring σ were reducible, attach lower-rank cusp representations to its irreducible factors after the required determinant twists. Good-place Satake matching would express L(π∨×π) as a product of unequal-rank Rankin–Selberg functions without its required pole. This is a contradiction. The geometric weight comparison of VL Lemma 16.2 and the finite-order determinant give weight zero; uniqueness identifies the parameter with LL’s σπ.

*Remark.* Layer 5 alone gives no converse theorem or multiplicity statement for general groups; this comparison uses the GL_r rank induction.

Source: [VL](#references), §16, introduction, Lemmas 16.2 and 16.4 with proof, pp. 174–177.

*Needs:* [§5.9 *The global cuspidal decomposition*](#59-the-global-cuspidal-decomposition); AutomorphicLFunctionsAndLocalFactors §AL.3, the global GL_r correspondence (*Leveled shtukas and ramified rank induction*, with all-place pair factors and temperedness; *Function-field local factors, multiplicity one and converse theorem*; the unramified pure realization theorem); DeligneWeightsAndPurity DWP.7 (§7.8 weights of R^i f_!, §7.12 weight bounds and purity of the image, §7.15 purity for proper smooth varieties).

### Examples

- *Rank one.* For r = 1 a lisse rank-one sheaf with algebraic, p-plain Frobenius eigenvalues is a constant twist of a finite-order character; its companions are the λ-adic characters with the same Frobenius values, given by class field theory.
- *Why one ℓ is not enough.* A Frobenius eigenvalue can be an ℓ-adic unit and fail to be a unit at another place away from p; the constant-twist criterion of [§6.1 *Constant twists and coefficient fields*](#61-constant-twists-and-coefficient-fields) needs units at every place away from p.

### Dependencies

Layer 5; AutomorphicLFunctionsAndLocalFactors §AL.3; DeligneWeightsAndPurity §5.5 and DWP.7.

## Layer 7: local excursions and comparison at every place

Genestier and V. Lafforgue restrict global shtukas to finite restricted shtukas near a place and use nearby cycles over the leg base to construct local excursion elements in the completed Bernstein centre. The finite jet budgets, the torsion exponent and the congruence level are kept visible in the finite construction; general-base nearby cycles are transported through the local correspondence before convolution and before passing to completed-centre limits. The endpoint is semisimple local–global compatibility for every connected reductive group, a separate GL_r comparison that keeps the monodromy operator, the action with additional global legs, and local gamma factors.

Standing hypotheses for this layer, in addition to those of Layer 1: K is a local field of characteristic p with finite residue field, and ℓ ≠ p; the restricted-shtuka construction first uses a split group over K with a chosen integral model, and the nonsplit extension uses parahoric models and the finite L-group; the congruence level m, torsion exponent s, jet bounds and Frobenius iteration budget are fixed in each finite construction and every comparison map respects them.

### 7.2 Finite restricted shtukas

Define RestrictedShtuka. Let K be a local field of characteristic p with finite residue field k, choose a smooth k-curve Y with rational point v and completed local field K, and a split reductive G. For fixed ordered legs I,W, large jet multiplicities ni, level nv and integer r≥0, a restricted shtuka is (yi,𝒢,z,θ): a G-torsor on D_r=nv+Σni yi+Σni σ⁻¹yi+⋯+Σni σ⁻r yi, a bounded modification z at Σni yi, and `θ:σ(a_z𝒢)|D_{r−1}≃𝒢|D_{r−1}`. The scheme-theoretic inverse Frobenius divisors retain their thickening. For r=0 read the source convention `D_{−1}=nv`. Restriction from a global shtuka is defined over `U_{I,r}`, with the disjointness condition GeL (2.10), and is smooth; decreasing jet data gives smooth restriction morphisms.

For nonsplit G at bad places the construction uses parahoric global and restricted shtukas and ind-proper affine flag varieties; GeL §9 cites Arasteh Rad–Hartl and Richarz (Theorem A) for these. Use Arasteh Rad–Hartl Theorem 3.15 for the Deligne–Mumford, separated, locally finite-type bounded global-shtuka stacks for flat affine finite-type group schemes on the curve, and its finite étale level-forgetting maps, surjective when the level fibres are smooth and connected. Use Richarz Theorem A for the equivalence between the parahoric condition for a smooth affine model with geometrically connected fibres and ind-properness of its affine flag quotient; the quotient is then ind-projective. The smoothness of the finite restricted-shtuka morphism is proved by the equalizer argument below, not inferred from these algebraicity assertions.

*Construction.* Use finite-jet torsors and the contracted-product modification a_z from the bounded Hecke correspondence. Restrict the Frobenius identification only to the divisor on which both sides are defined; its inverse-image multiplicities are essential. Express a fibre of global restriction as an equalizer: one map is smooth forgetting level and the other has zero relative differential because it factors through Frobenius. This proves smoothness. Use the kernels of the jet-group restriction maps to describe the smooth transition fibres.

*Remark.* The integer r counts Frobenius iterations; it is not a rank.

*Remark.* These restricted shtukas are algebraic stacks of finite type, not the perfectoid local shtuka spaces of HeckeStacksAndLocalShtukas.

The API:

- Finite-jet torsor, bounded modification and restricted Frobenius isomorphism.
- Restriction over the specified `U_{I,r}`, with its smoothness theorem.
- Decrease (n,ni,r), preserving the coefficient comparison.
- For I=∅ identify the stack with B G(O_nv).

**Checks.**

- With I=∅ obtain B G(O_nv), rather than a discrete set with the automorphisms removed.
- For n=0,r=0 obtain the bounded Grassmannian modulo `G_{Σni yi}`.
- One partial Frobenius reduces the available iteration budget r by one; it is not an endomorphism of every fixed finite-jet stack.

Source: [GeL](#references), §2, Definition 2.11, Remarks 2.12–2.14, Definition 2.15, Proposition 2.16 and Lemma 2.17, pp. 14–18 and §9, pp. 43–45; [AH19](#references), arXiv:1302.6351v2, Theorem 3.15, pp. 15–17; [Ric16](#references), arXiv:1311.1008v2, Theorem A.

*Needs:* [§0.3 *Full level structures*](#03-full-level-structures); [§1.3 *Global Hecke chains*](#13-global-hecke-chains); [§2.1 *Global shtukas*](#21-global-shtukas); SchemeAndStackFoundations Layer 1 (§§1.1, 1.15–1.16 descent, torsors and contracted products; §§1.18–1.21 algebraic and Deligne–Mumford stacks, inertia and quotient stacks).

### 7.3 Nearby cycles over higher-dimensional bases

Apply ClassicalAdicEtaleCohomology §5.4 to the Satake sheaf tensored with the regular finite-level local system on a restricted-shtuka chart. Its contract takes a coherent irreducible scheme S, a finitely presented f:Y→S, an integer n>0 invertible on S, and K∈Dᵇ_c(Y,Z/n). After a modification S′→S depending on K, nearby cycles are bounded constructible and commute with every base change to S′. For the leg base choose the smooth geometrically connected curve component containing v; its powers are integral. Integral and rational coefficient systems are obtained only through their specified torsion reductions and limits.

*Proof.* Apply the supplied oriented-product and modification theorem on finitely presented charts with Λ=O_E/λ^s. Descend the Satake coefficients along the finite-jet quotient and tensor with the regular `G(O_{mv})` local system. Use the smooth descent of §1.4 and proper base change to compare the resulting complexes across the restricted-shtuka diagrams.

**Checks.**

- For I=∅ the leg base is Spec k, an integral zero-dimensional scheme; the identity modification suffices for the trivial coefficient object.
- A product of two smooth geometrically connected curve components is integral of dimension 2, so it satisfies the base hypothesis.
- Two distinct crossing components give a reducible base; the stated irreducible-base contract cannot be applied to their union without an additional reduction.

*Remark.* The modification depends on the complex; no uniform modification for every W and s is asserted.

Source: [GeL](#references), Lemma 2.20 and (2.27)–(2.28), pp. 21–22; proof of Proposition 3.2, pp. 25–31; [Org](#references), arXiv:math/0507475v1, Théorème 1.1, pp. 2–3 and Théorème 6.1, p. 16 (published as Theorems 2.1 and 8.1).

*Needs:* [§1.4 *ℓ-adic sheaves on stacks of finite type*](#14-ℓ-adic-sheaves-on-stacks-of-finite-type); [§7.2 *Finite restricted shtukas*](#72-finite-restricted-shtukas); ClassicalAdicEtaleCohomology §5.4; LefschetzPencilsAndVanishingCycles Layer LPV.0.

### 7.4 Transport on local nearby cycles

For δ in the local higher-variable Frobenius–Weil group with degree tuple (di), and a sufficiently increasing tuple (mi) with mi+di≥0, there is a local morphism `Tδ:RΨ_{(mi)}SL→RΨ_{(mi+di)}SL` on the same finite restricted-shtuka special fibre. It intertwines the specialization and FWeil action on every global truncation. The local FWeil group surjects onto Weil(K)^I. The theorem uses the general-base modification theorem and the Gabber composition theorem used together with ULA in GeL (proof of Proposition 3.2); a direct trait specialization argument does not supply it.

*Proof.* Use Orgogozo’s modification so the nearby complex has arbitrary base-change compatibility. Choose the unique point on that modification approached by sufficiently separated Frobenius powers; the valuation comparison of GeL Lemmas 3.5–3.9 proves this independence. Combine the δ-map at the generic product with Gabber’s composition isomorphism and ULA on the good open to compare the generic product and Frobenius diagonal, producing Tδ and the global square. Prove the local Drinfeld equivalence for finite étale algebras over iterated Laurent fields; it yields the required surjection to Weil(K)^I.

*Remark.* The stronger identification with iterated nearby cycles over traits in GeL Remark 3.12 is not used; the proof avoids it.

*Remark.* The specialization comparison between the generic product and Frobenius diagonal is part of this target. Its inputs are ULA on the good open and Gabber's nearby-cycle composition theorem, as in GeL §3, proof of Proposition 3.2.

The Gabber input is composition of nearby cycles after modification (Eteve–Xue, Theorem A.9): for a finitely presented map Y→S of qcqs schemes and a bounded constructible torsion complex A on Y, after a suitable modification of S, every chain of geometric specializations s→t→u has an isomorphism Ψ_(s→u)A→Ψ_(t→u)Ψ_(s→t)A. The coefficients have order invertible on S. The modification making A Ψ-good in Theorem A.4 also suffices for this composition theorem. Apply it to the specialization chains of GeL (3.20), using ULA on the good open to identify the intermediate restriction; apply the chart descent of §1.4 afterwards.

Source: [GeL](#references), §3, Proposition 3.2 with proof and Remark 3.12, pp. 24–31; §4, Lemmas 4.1–4.3, pp. 32–33; [EX24](#references), arXiv:2409.16474v1, Theorems A.4 and A.9, Appendix A.

*Needs:* [§4.1 *Drinfeld’s lemma for finite étale covers*](#41-drinfelds-lemma-for-finite-étale-covers); [§4.3 *The Frobenius–Weil group*](#43-the-frobeniusweil-group); [§7.3 *Nearby cycles over higher-dimensional bases*](#73-nearby-cycles-over-higher-dimensional-bases); LefschetzPencilsAndVanishingCycles Layer LPV.0 (nearby cycles over a henselian trait); EtaleCohomologyFoundations §F.2.3 (local and universal local acyclicity).

### 7.5 Local excursion convolution elements

Define LocalExcursion.convolution. For split G/K, pro-p congruence U_m, whose finite quotients have order prime to ℓ, Λ=O_E/λ^s, f∈O(Ĝ\Ĝ^I/Ĝ)_Λ and (γi)∈Weil(K)^I, the restricted-shtuka composite defines `z_{m,s,I,f,γ}∈C_c(U_m\G(K)/U_m,Λ)`. It is independent of the coefficient realization, leg ordering, local FWeil lift and sufficiently increasing Frobenius tuple; it is continuous in γ, compatible in s,m, and its global convolution equals the modular excursion on all compactly supported automorphic functions, at arbitrary additional level away from v. At a good hyperspecial place, for split G, the spherical local excursion element indexed by f(g1,g2)=χV(g1g2⁻¹) and (Frob_v,1) equals `h_{V,v}`, compatibly with the unramified comparisons of §§5.9–5.10.

*Construction.* Represent f by an integral finite-free matrix coefficient and lift γ to local FWeil. Compose creation, ordered partial Frobenius to (mi), Tδ, return partial Frobenius and annihilation, decreasing jet/iteration budgets as required. At zero legs the regular level local system identifies the result with a compactly supported double-coset function. Cartesian correspondence pullback proves the global convolution identity. Use GeL Lemma 1.4’s Poincaré-series detection with arbitrary away-v level to prove uniqueness, hence independence of every auxiliary choice and continuity. At hyperspecial level identify the two-leg spherical element with `h_{V,v}` by the same creation/Frobenius/annihilation calculation as in the global Hecke comparison of §3.6.

*Remark.* The detection step uses the excursions on full compactly supported cohomology of [§5.4 *Excursions on full compact cohomology*](#54-excursions-on-full-compact-cohomology), in the split case and, for nonsplit G, in the torsion version that target includes. The cuspidal action alone does not suffice.

The API:

- The compactly supported U_m-double-coset element at finite torsion coefficients.
- Every permitted finite-jet construction gives the same local function.
- Right convolution equals the global excursion on C_c at every auxiliary away-v level.
- Reduce s or project the congruence level compatibly.

**Checks.**

- For the two-leg trace function at spherical level, where the prime-to-ℓ convenience is unnecessary, recover `h_{V,v}`.
- For f=1 recover the identity `1_{U_m}` under volume-one convolution.
- Replacing one torsion realization (W,x,ξ) of f or changing a lift δ does not change the double-coset function; this needs the global detection theorem, not a chosen-isomorphism claim.

Source: [GeL](#references), §1, Proposition 1.3 and Lemma 1.4, p. 7, and Remark 1.6, p. 8 (the spherical case); §6, (6.1)–(6.3), Lemma 6.2 and Remark 6.3, pp. 36–40; [VL](#references), §6.1, Proposition 6.2, p. 75.

*Needs:* [§3.6 *Hecke operators from Frobenius*](#36-hecke-operators-from-frobenius); [§5.4 *Excursions on full compact cohomology*](#54-excursions-on-full-compact-cohomology); [§5.11 *Integral and modular excursion blocks*](#511-integral-and-modular-excursion-blocks); [§5.9 *The global cuspidal decomposition*](#59-the-global-cuspidal-decomposition); [§5.10 *The nonsplit global decomposition*](#510-the-nonsplit-global-decomposition); [§7.2 *Finite restricted shtukas*](#72-finite-restricted-shtukas); [§7.4 *Transport on local nearby cycles*](#74-transport-on-local-nearby-cycles); EtaleDualityAndPerverseSheaves Layer 6 (§6.2 composition and pullback of cohomological correspondences, §6.3 the Lefschetz–Verdier formula, §6.5 contracting correspondences and the Fujiwara–Varshavsky formula).

### 7.6 Bernstein centre parameters

The local elements define `z_{I,f,γ}` in the projective limit over U of the ℓ-adic completions of the integral level Hecke centres, with the algebra, reindexing, three-copy and continuity identities. For an integral smooth admissible irreducible G(K)-representation over a finite Q_ℓ-extension, evaluating its central character reconstructs a continuous semisimple Gal(K̄/K)→Ĝ(Q̄_ℓ) parameter. For an arbitrary such irreducible, one obtains a continuous semisimple Weil(K) parameter by constant-character twisting and normalized parabolic induction. The assignment depends only on its Bernstein central character and respects normalized induction.

*Proof.* Global detection makes each finite-level element central and compatible with level and with reduction of the torsion exponent; take the completed inverse limit. Evaluate on an integral character and use the Weil-continuity clause of the reconstruction (LanglandsParameterStacks §§LP2c.2–LP2c.4). Integral values of the invariants allow conjugation into Ĝ(O_E′), so the representation extends from the Weil group to the profinite Galois group. Prove the Levi constant-term identity (GeL Theorem 1.1(vi)). Twist arbitrary supercuspidals to integral ones and extend through supercuspidal support and normalized parabolic induction. Apply the same detection argument to prove uniqueness and dependence only on the central character.

*Remark.* The initial theorem is for split G; GeL §9 provides the nonsplit finite-L-group adaptation.

*Remark.* An arbitrary nonintegral Weil parameter need not extend continuously to Gal(K̄/K).

The comparison with the ordinary smooth Bernstein centre is a separate target of this section. Fix m, I, an integral invariant f with its reductions modulo λ^s, and γ. Prove that one finite set of U_m-double cosets contains the support of every torsion function `z_{m,s,I,f,γ}`; the set may depend on m, I, f and γ. Consequently the integral inverse-limit element has finite support, and extending its coefficients to E gives an element of the ordinary level Hecke centre. Apply SmoothRepresentationsOfLocalGroups §SR.1.3, *bernstein-centre-corners*, to this compatible family to obtain its ordinary smooth-centre action, and compare its evaluation on every level-generated representation with the completed action. Scaling f extends the comparison to E-valued invariants.

A route proves a uniform nearby-cycle modification for the fixed Satake coefficient realization tensored with the fixed regular level local system, simultaneously for all its reductions modulo λ^s. This geometric assertion is part of the target: on finite-type restricted-shtuka charts use proper Demazure resolutions, express the rational Satake sheaf as a direct summand of a proper direct image of constant coefficients, normalize in the finite level cover, and control the remaining integral torsion at a fixed exponent. The support of the resulting correspondence composite is then bounded by one Frobenius iteration budget. GeL Remark 6.3 describes this route; Remarks 1.2 and 1.5 identify its consequence for the ordinary centre. Compatibility of completed corners alone does not prove the support bound.

**Checks.**

- For f=1 the support is the identity double coset at every s, and the resulting action is Id at every level.
- On G_m(K), the completed function assigning λ^j to the coset of ϖ^j for j≥0 has reduction supported on 0≤j<s, but its integral support is infinite. It is excluded by the uniform bound; mere compatibility in s would wrongly accept it.
- If a vector is fixed at levels m and m′, transition compatibility gives the same central action on that vector; for a scalar a both evaluations are a times the vector, including a=0.

Source: [GeL](#references), Theorem 0.1, pp. 2–3; §1, Theorem 1.1, Remarks 1.2 and 1.5 and the reduction to Proposition 1.3, pp. 5–9; Remark 6.3, pp. 39–40.

*Needs:* [§7.5 *Local excursion convolution elements*](#75-local-excursion-convolution-elements); LanglandsParameterStacks §§LP2c.1–LP2c.4 (prescribed-projection pseudocharacters and abstract reconstruction in §§LP2c.1–LP2c.2; relatively discrete and discrete-coefficient Weil continuity in §§LP2c.3–LP2c.4); SmoothRepresentationsOfLocalGroups §§SR.0.4, SR.1.3 and SR.3.2 (admissibility and the centre, the Λ-linear Bernstein centre, the Bernstein decomposition); SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.2 (induction, Jacquet functors and parabolic induction).

### 7.7 Local excursions on compact cohomology

With integral coefficients O_E and arbitrary additional legs J and coefficient V, the local elements `z_{m,I,f,γ}` = lim_s `z_{m,s,I,f,γ}` act by right convolution on colim_μ `H^{0,≤μ,O_E}_{N,J,V}` at the generic point of the diagonal, and this action equals the global excursion on compactly supported shtuka cohomology. The inverse-limit function tends to zero at infinity in the ℓ-adic topology. Finite support of every torsion reduction gives this decay; the stronger finite-support assertion for these excursion elements is the independent target of §7.6.

*Proof.* Use the integral excursion action on compactly supported cohomology of [§5.4 *Excursions on full compact cohomology*](#54-excursions-on-full-compact-cohomology), with its coefficient and fusion compatibilities. Repeat the cartesian comparison of correspondences with the extra legs J present. Pass through coefficient reduction and the inverse limit, keeping apart finite support at each s and decay at infinity.

*Remark.* For J = ∅ one recovers convolution on compactly supported automorphic functions.

*Remark.* This completed-action comparison uses finite support at each torsion exponent and decay of the limit. Its proof does not require the uniform support theorem of §7.6; that theorem identifies the resulting action with the ordinary smooth-centre action.

Source: [GeL](#references), §8, Proposition 8.1, pp. 42–43; Remark 6.3, pp. 39–40.

*Needs:* [§2.5 *Shtuka intersection-cohomology systems*](#25-shtuka-intersection-cohomology-systems); [§5.4 *Excursions on full compact cohomology*](#54-excursions-on-full-compact-cohomology); [§7.5 *Local excursion convolution elements*](#75-local-excursion-convolution-elements).

### 7.8 Semisimple local–global compatibility

If π=⊗v πv occurs in a global cusp block Hσ, then at every place v the local Genestier–Lafforgue parameter is Ĝ-conjugate to (σ|Gal(F̄_v/Fv))^ss in the integral case, and to the semisimplified Weil restriction in the wider coefficient case. For nonsplit G use ᴸG_v and its prescribed finite quotient. This is equality of semisimple parameters, with no general monodromy operator and no multiplicity in local L-packets attached.

For nonsplit G this uses the parahoric construction included in [§7.2 *Finite restricted shtukas*](#72-finite-restricted-shtukas).

*Proof.* Restrict the global excursion-convolution identity to Hσ. Its scalar character evaluates every invariant function on the tuple σ(γi), while the local centre character evaluates it on the local reconstructed tuple. Use the all-tuples semisimple character theorem to obtain conjugacy; retain the finite-quotient projection for nonsplit G.

*Remark.* Equality of spherical eigenvalues at good places alone does not prove ramified local–global compatibility.

Source: [GeL](#references), Theorem 0.1(b), p. 2; Theorem 1.1(v), p. 6; §6, Lemma 6.2, p. 38; §9, Theorem 9.1, pp. 43–45.

*Needs:* [§5.10 *The nonsplit global decomposition*](#510-the-nonsplit-global-decomposition); [§7.5 *Local excursion convolution elements*](#75-local-excursion-convolution-elements); [§7.6 *Bernstein centre parameters*](#76-bernstein-centre-parameters).

### 7.9 Semisimplification and monodromy

For general G the preceding construction retains the ordinary semisimple local Galois/Weil parameter and cannot in general determine a nilpotent monodromy operator N from πv. For GL_r the full classical local correspondence uses a Frobenius-semisimplified Weil–Deligne pair (r_v,N_v); Frobenius semisimplification retains N_v. Ordinary semisimplification and Frobenius semisimplification must therefore be separate operations and separate comparison statements.

*Proof.* Use the Weil–Deligne parameters of LanglandsParameterStacks §LP1.11 with their monodromy convention. Compare two Weil–Deligne pairs with the same semisimple Weil part and different N: their excursion invariants agree. Use the division-algebra example of GeL Remark 0.3: one local representation of D^× can occur in global representations with different monodromy before semisimplification.

*Remark.* The semisimple theorem gives no ramified Weil–Deligne comparison for general G.

Source: [GeL](#references), Remark 0.3, p. 3; [LL](#references), Chapter VII §1c, Corollary VII.5, p. 197.

*Needs:* [§7.8 *Semisimple local–global compatibility*](#78-semisimple-localglobal-compatibility); LanglandsParameterStacks §LP1.11 (Weil–Deligne parameters).

### 7.10 Local gamma factors

For a connected reductive group over a local function field K, a finite-dimensional algebraic representation ρ of its finite L-group, a smooth irreducible representation π and characters χ:K×→Q̄_ℓ× and nontrivial ψ:K→Q̄_ℓ×, define γ(s,ρ,π,χ,ψ) by the Artin local factor of (ρ∘σπ)⊗χ. After coefficient identification with C these rational functions satisfy naturality, direct-sum multiplication, rank-one reciprocity, normalized parabolic induction, the change-of-ψ law, highly ramified stability and the global functional equation. They extend the existing function-field gamma-factor theories in their common ranges. These gamma factors depend only on the semisimple parameter, unlike separate L and epsilon factors in general.

Use the equal-characteristic local constants and function-field product formula of AutomorphicLFunctionsAndLocalFactors §AL.3, *Function-field local factors, multiplicity one and converse theorem*, with its residue character, geometric Frobenius and self-dual measure. For a Weil–Deligne representation V put `L(s,V)=det(1−q_K^{−s}Frob_K` | (ker N)^I)⁻¹ and define LocalGamma=ε(s,V,ψ)L(1−s,V∨)/L(s,V). Prove cancellation of the monodromy correction in this quotient, so the factor agrees with that of the semisimplified Weil representation.

The API:

- Isomorphic parameters and coefficient transport give the same rational function.
- Direct sums multiply the gamma factors, with the zero representation giving 1.
- In rank one the factor is Tate's factor under the chosen reciprocity convention.
- Normalized parabolic induction restricts the L-group representation to the dual Levi.
- Scaling the additive character obeys the change law below.
- Twists of sufficiently large conductor have the Artin stability formula, with the conductor threshold depending on the parameter.
- For a global cuspidal parameter and a global differential character, the product of the local gamma factors gives the global functional equation.

For ψ_a(x)=ψ(ax), the change is `det(V)(a)|a|^{dim(V)(s−1/2)}`, with det(V)(a) read by the fixed geometric reciprocity convention.

*Proof.* Apply the supplied Artin factors to the semisimple local parameter and use its normalized induction compatibility. Verify the seven identities of GeL §7.1, using AL.3's product formula for the global functional equation. For uniqueness globalize supercuspidal data by Poincaré series and isolate the desired place with highly ramified twists. The strengthened globalization cited in GeL Remark 7.1 proves uniqueness without making stability an extra uniqueness axiom.

*Remark.* The rank-one factor is Tate’s local factor with the same reciprocity convention.

*Remark.* Do not deduce ramified L or epsilon factors for general G from the gamma-factor identity.

**Checks.**

- For a two-dimensional special Weil–Deligne block with geometric Frobenius diag(a,b), N=E₁₂ and a=b/q_K, put T=q_K^(−s). The monodromy epsilon correction is −bT; the change in the ratio of L-factors is `(1−1/(bT))/(1−bT)=−1/(bT)`. Their product is 1 as a rational function, so gamma agrees with the N=0 semisimplification even though the separate L-factors differ.
- The zero coefficient representation has L=ε=γ=1; the multiplicative unit is not zero.
- For the trivial rank-one character and ψ of conductor zero, with vol(O_K)=1, `γ(s,1,ψ)=(1−q_K^{−s})/(1−q_K^{s−1})`. The numerator vanishes at s=0 and the denominator does not, since q_K>1. Inverting this quotient reverses the zero and pole.
- For the same character, replacing ψ by ψ(ϖ·) multiplies γ by `q_K^{1/2−s}`. This fixes the sign of the exponent and includes the change of self-dual measure; for two copies of the character the multiplier is `q_K^{1−2s}`.

Source: [GeL](#references), §7.1–§7.3 and Remark 7.1, pp. 40–42; §9, p. 45; [Del73](#references), §3.12, pp. 533–534, Theorem 4.1, p. 535, Lemmas 4.12–4.16, pp. 544–546, and §8.12, p. 572.

*Needs:* [§7.6 *Bernstein centre parameters*](#76-bernstein-centre-parameters); [§7.8 *Semisimple local–global compatibility*](#78-semisimple-localglobal-compatibility); AutomorphicLFunctionsAndLocalFactors §AL.3, *Function-field local factors, multiplicity one and converse theorem* (equal-characteristic Artin local constants, norm twists, highly ramified twists and the function-field product formula); AutomorphicLFunctionsAndLocalFactors §AL.3, *Curve additive analysis* (the residue character of a global differential); FunctionFieldArithmetic §2.2 (the self-dual measures of a differential); LanglandsParameterStacks §LP1.11 (Weil–Deligne parameters).

### 7.11 The ramified GL_r local comparison

For every local field K of characteristic p with finite residue field, ℓ≠p and r≥1, construct the equal-characteristic realization of the shared local Langlands bijection between irreducible smooth Q̄_ℓ-representations of GL_r(K) and rank-r Frobenius-semisimple Weil–Deligne parameters, with monodromy retained. It is characterized by rank-one reciprocity, preservation of central characters, contragredients, character twists and all local pair L- and epsilon factors, using the fixed geometric reciprocity convention. Its API includes invariance under isomorphism and coefficient transport, the determinant/central-character identity, and compatibility of its semisimple Weil part with normalized parabolic induction. The coefficient transport of the supplied segments, the extension from supercuspidals and its all-pair-factor comparison in equal characteristic are part of this target; its proof uses the global function-field correspondence of AL.3 independently of the supplied classical correspondence theorem.

For a parameter D=(r,N) in this geometric normalization and its representation π, prove the identification `iota_* pi ≅ rec((iota_* D)^dual)` with SmoothRepresentationsOfLocalGroups §SR.5.2, *classical-llc-normalization*. Here ι_* is coefficient transport and the full algebraic dual is D∨=(r∨,−Nᵗ), with r∨(w)=(r(w)⁻¹)ᵗ. This reconciles the supplier’s arithmetic reciprocity with χ(a)=r(Art(a)⁻¹) here: in rank one rec(D∨)(a)=r(Art(a))⁻¹=χ(a). In rank r the central character at a∈K× is det r(Art(a)⁻¹), equal to det r∨(Art(a)). The identification uses the classical rec with central character det of the arithmetic parameter; the half-norm twist in the supplier’s generic Breuil–Schneider representation belongs to that separate construction. Prove compatibility of this identification with contragredients, character twists, coefficient transport with the chosen square root, and all pair factors in the respective conventions.

A route starts from AL.3's global GL_r correspondence, globalizes supercuspidals, and proves independence, injectivity and surjectivity as in LL Theorem VII.3, including the counting argument used for surjectivity. Use SmoothRepresentationsOfLocalGroups §SR.5.2, *segment-representations*, through the coefficient transport below, and identify its generalized Steinberg representations with special Weil–Deligne blocks. LL's paragraph after Proposition VII.4 extends the correspondence and its pair factors. Unramified character twists remove the finite-order central-character restriction, and the segment construction permits different twists on different supercuspidal constituents. The statement allows every Frobenius-semisimple Weil–Deligne parameter, including those whose Frobenius eigenvalues are not ℓ-adic units.

**Coefficient transport of segments.** Use the field isomorphism ι:Q̄_ℓ≃ℂ and the compatible square root of q_K fixed in Conventions. Transport the supplied segment/multisegment construction through the exact equivalence of smooth representation categories induced by ι; no continuity of ι is required. Prove compatibility with normalized induction, cuspidal support, standard modules, the unique irreducible subrepresentation Z and quotient L, and the supplier's ordering conventions. Express each segment intrinsically as the finite string `tau, tau nu, ..., tau nu^(a-1)`, with a≥1 and ν=|det|, so no real-valued exponent or unitary structure is imposed on Q̄_ℓ. Prove that the resulting Z/L isomorphism classes depend only on these strings and their multiset and are independent of ι when the square-root normalization is fixed: the linkage/precedes relations and the unique subrepresentation/quotient characterizations are preserved by coefficient equivalences. Match L of a length-a segment with the special Weil–Deligne block whose Weil constituents are the parameters of `tau, tau nu, ..., tau nu^(a-1)`; if τ is on GL_d, the resulting rank is ad and the monodromy rank is d(a−1). These are the transport and parameter-identification targets of this section (LL, Chapter VII §1b–§1c, pp. 195–197, and Appendix B §b, Theorem B.4, pp. 222–223).

For the global GL_r correspondence of AutomorphicLFunctionsAndLocalFactors §AL.3, at every place v the Frobenius-semisimplified Weil–Deligne representation attached to σ_π restricted to Gal(F̄_v/F_v) corresponds to π_v under this local Langlands correspondence for GL_r over F_v, monodromy and all local pair factors included. The local factor π_v is characterized by its central character and its pair factors with all lower-rank cuspidal representations (LL Proposition VII.4), and the comparison follows by induction on r (LL Corollary VII.5).

*Proof.* Apply the all-place pair-factor identities of AL.3 and the local characterization LL Proposition VII.4. Keep N in the Weil–Deligne pair while semisimplifying Frobenius, and induct on the rank.

**Checks.**

- A one-term segment has Z=L=τ. At q_K=3 the two-term segment `[nu^(-1/2),nu^(1/2)]` has Z=1 and L=Steinberg. Its special block has geometric Frobenius `diag(3^(-1/2),3^(1/2))` and N=E₁₂, so FNF⁻¹=(1/3)N and rank N=1; the parameter of Z has N=0. Swapping Z and L would interchange these ranks.
- Under a coefficient isomorphism fixing √q_K, ν(ϖ)=q_K⁻¹ and `nu^(1/2)(varpi)=q_K^(-1/2)` retain those values. Replacing √q_K by its negative changes the half-norm value to `-q_K^(-1/2)`; transport without the stated normalization would change this inducing character.
- At r=1, ℓ=5 and χ(ϖ)=2, D has geometric-Frobenius value 2 and arithmetic-Frobenius value 1/2. Its dual has arithmetic value 2, so rec(D∨)(ϖ)=2 agrees with χ; rec(D)(ϖ)=1/2 would fail. Squaring Frobenius gives 4 and 1/4 respectively, and taking the dual twice restores D.
- For the q_K=3 special block above, full duality gives geometric Frobenius diag(√3,1/√3) and N=−E₂₁; its arithmetic Frobenius is diag(1/√3,√3), and arithmetic conjugation scales N by 3. The monodromy rank stays 1. Inverting matrices without transposition would instead scale E₁₂ by 3 at geometric Frobenius, contrary to the required factor 1/3.
- For GL₂, Steinberg and the trivial representation have the same semisimple Weil part but monodromy ranks 1 and 0. The bijection distinguishes them, whereas §7.8 forgets that difference.
- A rank-one unramified Weil character with Frobenius λ⁻¹ is allowed; its nth power has valuation −n, so it has no continuous extension to the full profinite Galois group. Requiring unit eigenvalues would wrongly discard this nonintegral local representation.

*Remark.* This comparison does not require that every global shtuka be uniformized by local shtukas.

*Remark.* HeckeStacksAndLocalShtukas §§HS2.9 and HS3.1–HS3.2 constructs the local-shtuka towers, their Satake coefficients and completed compact-support complexes intended for a cohomological realization of the local correspondence. These sections do not assert a parameter/cohomology identification; a comparison with this layer’s restricted-shtuka construction is not an input here.

Source: [LL](#references), Chapter VII §1b–§1c, Theorem VII.3, Proposition VII.4 and Corollary VII.5, pp. 195–197; Appendix B §b, Theorem B.4, pp. 222–223.

*Needs:* [§7.9 *Semisimplification and monodromy*](#79-semisimplification-and-monodromy); AutomorphicLFunctionsAndLocalFactors §AL.3, the global GL_r correspondence (*Leveled shtukas and ramified rank induction*, with all-place pair factors and temperedness; *Function-field local factors, multiplicity one and converse theorem*; the unramified pure realization theorem); SmoothRepresentationsOfLocalGroups §§SR.2.1–SR.2.2 (normalized induction and Jacquet functors), §SR.3.1 (cuspidal support) and §SR.5.2, *segment-representations* (the shared segment/multisegment constructions and Z/L ordering conventions, transported from ℂ as specified above), *wd-raw-parameters*, *wd-parameter-operations* and *wd-frobenius-semisimplification* (the shared Weil–Deligne carriers and operations), and *classical-llc-normalization* (the shared rec interface and its arithmetic normalization, for the comparison theorem).

### Examples

- *Spherical level.* At a hyperspecial place, the local excursion element of the two-leg trace function f(g₁, g₂) = χ_V(g₁g₂⁻¹) and (Frob_v, 1) is the normalized spherical function `h_{V,v}`; for f = 1 the element is the unit `1_{U_m}` ([§7.5 *Local excursion convolution elements*](#75-local-excursion-convolution-elements)).
- *No legs.* With I = ∅ the restricted-shtuka stack is the classifying stack of `G(O_{nv})`, not a discrete set ([§7.2 *Finite restricted shtukas*](#72-finite-restricted-shtukas)).
- *Monodromy.* The Steinberg representation of GL₂(K) and the trivial character of GL₂(K) have the same semisimple parameter, with Weil part `|·|^{1/2}` ⊕ `|·|^{−1/2}`; the Steinberg representation has a nonzero monodromy operator and the trivial character has N = 0, so only the comparison with monodromy distinguishes them ([§7.9 *Semisimplification and monodromy*](#79-semisimplification-and-monodromy)).
- *Rank one.* For G = G_m the local gamma factor is Tate's local factor of the character, with the same reciprocity convention ([§7.10 *Local gamma factors*](#710-local-gamma-factors)).

### Dependencies

Layers 0–6; SmoothRepresentationsOfLocalGroups §§SR.0.4, SR.1.3, SR.2.1–SR.2.2, SR.3.1–SR.3.2 and SR.5.2 (*segment-representations*, the Weil–Deligne carriers and *classical-llc-normalization*); LanglandsParameterStacks §LP1.11 and §§LP2c.1–LP2c.4 (abstract reconstruction and prescribed projection in §§LP2c.1–LP2c.2; Weil continuity in §§LP2c.3–LP2c.4); LefschetzPencilsAndVanishingCycles Layer LPV.0; ClassicalAdicEtaleCohomology §5.4; EtaleDualityAndPerverseSheaves Layer 6; AutomorphicLFunctionsAndLocalFactors §AL.3 (including *Curve additive analysis*); FunctionFieldArithmetic §2.2.

## Source corrections

The following points in the sources need care. Each is described in our own words, with the corrected statement used in this roadmap.

- **E1** (YZ, §3.5.4, p. 38 of arXiv v2; the same text is on p. 38 of v1). The recall of Pκ uses the negative shift and twist `[−#I(κ)](−#I(κ)/2)`. Corollary 3.29, p. 35 instead gives `Rπκ!Q_ℓ = Rπ₁!Q_ℓ[−2r+#I(κ)](−r+#I(κ)/2)`. Applying `[2r](r)` gives the positive shift and twist `[#I(κ)](#I(κ)/2)`. The support has dimension #I(κ), so this is the perverse normalization. Used in [§3.3 *Horocycle compact direct images*](#33-horocycle-compact-direct-images).
- **E2** (YZ, §3.5.4, p. 38). The rank-one map on one fixed-degree component is a torsor under Pic⁰_X(k), not under Pic_X(k); only the union of all degree translates is a Pic_X(k)-torsor, because a line bundle of nonzero degree changes the degree component. Used in [§3.9 *PGL₂ boundary constant terms*](#39-pgl-boundary-constant-terms).
- **E3** (YZ, §3.5.4, p. 38). In the direct sum over the translates κ′ ∈ κ + Z, the summand indexed by κ′ must use the projection for N(κ′), not the fixed projection for N(κ); otherwise the action of Pic_X(k) by translation is lost. Used in [§3.9 *PGL₂ boundary constant terms*](#39-pgl-boundary-constant-terms).
- **E4** (Feng, §5.2.3, p. 36 of arXiv v6). In the definition of the Frobenius–Weil automorphisms, the subscript names the algebraic closure of F_q, while that paper's curve lives over F_ℓ; the closure of the actual base field is meant. This roadmap uses k = F_q throughout and defines the Frobenius–Weil group through the geometric kernel, as in VL Remark 8.18. Used in [§4.3 *The Frobenius–Weil group*](#43-the-frobeniusweil-group).
- **E5** (LL, Theorem I.13, pp. 31–32 of the author copy). The author copy corrects the trace formula of the earlier book: the lower-rank error terms are polynomials times exponentials in the iteration exponent, not pure exponentials, and the positive-degree polynomial parts cancel only after comparison with cohomological traces. AutomorphicLFunctionsAndLocalFactors §AL.3 uses this corrected form.
- **E6** (Xue-I, proof of Lemma 8.2.4, p. 55 of arXiv v2). The proof treats A/mⁿ as a finite torsion O_E-module for every maximal ideal m of a finitely generated O_E-algebra A. This fails when λ ∉ m: for A = O_E[t] and m = (λt − 1), A/m = E. The repair separates the two cases. If λ ∈ m, A/m is a finite field and M/mⁿM is a finite torsion O_E-module, so the finite-coefficient Drinfeld lemma applies. If λ ∉ m, λ is invertible on A/mⁿ, A/m is finite over E, and M/mⁿM is a finite-dimensional E-vector space with continuous geometric-Galois action, so Xue-S Lemma 1.2.10 applies as in §4.3; a lattice stable under partial Frobenius is not required. The Krull intersection argument then proceeds as written, and the statement of Proposition 8.2.6 is unaffected. Used in [§4.12 *Weil descent on full cohomology*](#412-weil-descent-on-full-cohomology).
- **E7** (Ric, Corollary 5.8, p. 22 of arXiv v2). The displayed map (g,γ) ↦ (Ad χ(γ⁻¹)(g), γ) from the pinned to the geometric L-group is not multiplicative: on the pair (g,γ), (1,γ′) the two sides differ by Ad χ(γ′) in the first coordinate, and the SL₂ unipotent example of §1.11 gives u(1/3) against u(3). With a half Tate character ε, ε² = cycl, and c = (2ρ)∘ε, the map (g,γ) ↦ (g·c(γ)⁻¹, γ) is an isomorphism; Proposition 5.6 is unaffected, and Corollary 5.9 holds with this map whenever such an ε exists, in particular over F_q and over F. Used in [§1.11 *Nonsplit Satake descent*](#111-nonsplit-satake-descent).
- **E8** (VL, proof of Lemma 12.19(c), p. 160). A tensor power of a faithful representation need not kill a finite central kernel: for SL₂×SL₂ over F₃, K=μ₂×μ₂ and V=Std₁⊕Std₂, (−I,I) acts by −1 on `Std_1 tensor Std_2^(tensor (n-1))` for every n≥1, including n=#K=4. After splitting K, take powers of each central-character summand separately; their descended representations, fixed lattice comparisons and slope inequalities give the boundedness theorem of [§2.2 *Finite-type shtuka truncations*](#22-finite-type-shtuka-truncations). The finite-type statement is retained.

## Downstream consumers

- **GlobalShtukasAndFunctionFieldLanglandsPartII** builds on Layers 2–7: weight bounds of Ramanujan and Arthur type for the parameters of Layer 5, the uniformization of global shtukas by local shtukas, and the comparison of the local parameters of Layer 7 with those of Fargues–Scholze.
- **KloostermanSheavesAndBesselIsocrystals** uses Bun_G, the Beilinson–Drinfeld Grassmannian and geometric Satake (Layers 0–1); **SheafTheoreticSmithTheory** uses the Grassmannian, Schubert bounds, Hecke stacks and finite-extension integral Satake of Layer 1 as inputs to its broader coefficient setting; **CountingBundlesAndHallAlgebrasOfCurves** uses the bundle stacks and masses (Layer 0).
- **DrinfeldModulesAndTModules** uses the shtuka stacks and the elliptic-sheaf comparison (Layer 2); **MetaplecticAutomorphicForms** uses the excursion operators and the excursion algebra (Layer 5); **HodgeStructuresPartII** uses the companions on curves (Layer 6).
- Roadmaps that need the GL_r correspondence itself (for example GlobalGaloisDeformationsPartII and ShimuraVarietiesPartII) take it from AutomorphicLFunctionsAndLocalFactors §AL.3.

## References

- **[VL]** Vincent Lafforgue, *Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale*, J. Amer. Math. Soc. 31 (2018). Locators refer to [arXiv:1209.5352v10](https://arxiv.org/pdf/1209.5352v10) (10 January 2018), 184 pages.
- **[LL]** Laurent Lafforgue, *Chtoucas de Drinfeld et correspondance de Langlands*, Invent. Math. 147 (2002), 1–241. Locators refer to the [author copy](https://www.laurentlafforgue.org/math/fulltext.pdf) (IHÉS preprint M/00/70).
- **[GeL]** Alain Genestier and Vincent Lafforgue, *Chtoucas restreints pour les groupes réductifs et paramétrisation de Langlands locale*, [arXiv:1709.00978v3](https://arxiv.org/pdf/1709.00978v3) (30 July 2026), 47 pages.
- **[Del73]** Pierre Deligne, *Les constantes des équations fonctionnelles des fonctions L*, in *Modular Functions of One Variable II*, Lecture Notes in Mathematics 349 (1973), 501–597. Locators refer to the [author's IAS copy](https://publications.ias.edu/sites/default/files/Number20.pdf).
- **[MV]** Ivan Mirković and Kari Vilonen, *Geometric Langlands duality and representations of algebraic groups over commutative rings*, Ann. of Math. 166 (2007). Locators refer to [arXiv:math/0401222v5](https://arxiv.org/pdf/math/0401222v5).
- **[Ric]** Timo Richarz, *A new approach to the geometric Satake equivalence*, Doc. Math. 19 (2014). Locators refer to [arXiv:1207.5314v2](https://arxiv.org/pdf/1207.5314v2) (24 September 2012).
- **[YZ]** Zhiwei Yun and Wei Zhang, *Shtukas and the Taylor expansion of L-functions (II)*, Ann. of Math. 189 (2019). Locators refer to [arXiv:1712.08026v2](https://arxiv.org/pdf/1712.08026v2) (13 June 2020); v1 numbers the results of §3.4 one higher.
- **[Yu]** Hongjie Yu, *Comptage des systèmes locaux ℓ-adiques sur une courbe*, [arXiv:1807.04659v5](https://arxiv.org/pdf/1807.04659v5) (18 July 2022).
- **[Xue-I]** Cong Xue, *Cohomology with integral coefficients of stacks of shtukas*, [arXiv:2001.05805v2](https://arxiv.org/pdf/2001.05805v2) (30 August 2023).
- **[Xue-S]** Cong Xue, *Smoothness of cohomology sheaves of stacks of shtukas*, [arXiv:2012.12833v1](https://arxiv.org/pdf/2012.12833v1) (23 December 2020).
- **[Var]** Yakov Varshavsky, *Moduli spaces of principal F-bundles*, Selecta Math. 10 (2004). Locators refer to [arXiv:math/0205130v2](https://arxiv.org/pdf/math/0205130v2).
- **[Hein]** Jochen Heinloth, *Uniformization of G-bundles*, Math. Ann. 347 (2010). Locators refer to [arXiv:0711.4450v2](https://arxiv.org/pdf/0711.4450v2).
- **[Schieder]** Simon Schieder, *The Harder–Narasimhan stratification of the moduli stack of G-bundles via Drinfeld's compactifications*, Selecta Math. 21 (2015). Locators refer to [arXiv:1212.6814v2](https://arxiv.org/pdf/1212.6814v2).
- **[Chau]** Pierre-Henri Chaudouard, *Sur le comptage des fibrés de Hitchin*, Astérisque 369 (2015), 223–284. Locators refer to the [author's preprint](https://webusers.imj-prg.fr/~pierre-henri.chaudouard/contrib-Laumon.pdf), with its own pagination.
- **[Sch]** Olivier Schiffmann, *Indecomposable vector bundles and stable Higgs bundles over smooth projective curves*, [Ann. of Math. 183 (2016), 297–362](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf).
- **[Zhu]** Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*, Ann. of Math. 185 (2017). Locators refer to [arXiv:1407.8519v3](https://arxiv.org/pdf/1407.8519v3).
- **[LY]** George Lusztig and Zhiwei Yun, *A (−q)-analogue of weight multiplicities*, [arXiv:1203.0521v1](https://arxiv.org/pdf/1203.0521v1).
- **[Feng]** Tony Feng, *Smith theory and cyclic base change functoriality*, [arXiv:2009.14236v6](https://arxiv.org/pdf/2009.14236v6) (29 November 2023).
- **[Chin]** Cheewhye Chin, *Independence of ℓ of monodromy groups*, [arXiv:math/0206147v3](https://arxiv.org/pdf/math/0206147v3).
- **[KZ]** Mark Kisin and Rong Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*, [arXiv:2103.09945v2](https://arxiv.org/pdf/2103.09945v2), §5.3.
- **[Org]** Fabrice Orgogozo, *Modifications et cycles évanescents sur une base de dimension supérieure à un*, [arXiv:math/0507475v1](https://arxiv.org/pdf/math/0507475v1); the published version numbers the cited theorems 2.1 and 8.1.
- **[LO-I]** Yves Laszlo and Martin Olsson, *The six operations for sheaves on Artin stacks I: finite coefficients*, Publ. Math. IHÉS 107 (2008). Locators refer to [arXiv:math/0512097v2](https://arxiv.org/pdf/math/0512097v2).
- **[LO-II]** Yves Laszlo and Martin Olsson, *The six operations for sheaves on Artin stacks II: adic coefficients*, Publ. Math. IHÉS 107 (2008). Locators refer to [arXiv:math/0603680v1](https://arxiv.org/pdf/math/0603680v1).
- **[LO-P]** Yves Laszlo and Martin Olsson, *Perverse t-structure on Artin stacks*, Math. Z. 261 (2009). Locators refer to [arXiv:math/0606175v1](https://arxiv.org/pdf/math/0606175v1).
- **[Sun]** Shenghao Sun, *L-series of Artin stacks over finite fields*, Algebra Number Theory 6 (2012). Locators refer to [arXiv:1008.3689v2](https://arxiv.org/pdf/1008.3689v2).

- **[EX24]** Arnaud Eteve and Cong Xue, *Nearby cycles commute with proper direct image on stacks of shtukas*, [arXiv:2409.16474v1](https://arxiv.org/abs/2409.16474v1) (2024), Appendix A, Theorems A.4 and A.9.
- **[Ric16]** Timo Richarz, *Affine Grassmannians and geometric Satake equivalences*, [arXiv:1311.1008v2](https://arxiv.org/abs/1311.1008v2), Theorem A.
- **[AH19]** Esmail Arasteh Rad and Urs Hartl, *Uniformizing the moduli stacks of global G-shtukas*, [arXiv:1302.6351v2](https://arxiv.org/abs/1302.6351v2) (2019), Theorem 3.15, pp. 15–17.

- **[Sp]** Michael Spieß, *Twists of Drinfeld–Stuhler modular varieties*, Documenta Mathematica, Extra Volume Suslin (2010), 595–654. Locators refer to the [publisher PDF](https://ems.press/content/book-chapter-files/27506?nt=1).

- **[Harder]** Günter Harder, *Chevalley groups over function fields and automorphic forms*, Ann. of Math. 100 (1974), 249–306. Locators refer to the [university-hosted article](https://campuscore.ariel.ac.il/wp/yuval-flicker/wp-content/uploads/sites/316/2026/03/HarderChevalleyGpsFunFields1974.pdf).
