# Roadmap: K-theory of finite and local fields

**Summary.** Compute the higher algebraic K-groups of nonarchimedean local fields and their arithmetic maps, using GeneralAlgebraicKTheory's finite-field theorem. The build refines that supplied comparison by normalized classes and operations, passes through henselian rigidity and integral K₂, and constructs the absolute logarithmic Witt and trace calculations needed at the residue characteristic. Its end results distinguish integral groups, finite coefficients and derived completion, identify the completed local groups through Galois cohomology, and compare all these maps with completion of number fields. The characteristic-two hermitian applications and finite-rank symplectic Chern-class calculation retain their separate hypotheses.

## Scope and ownership

This roadmap owns the completed-Adams and normalized-class refinements of the supplied finite-field comparison, its arithmetic operations and transfers, henselian rigidity in this application, Moore's local K₂ structure theorem, the Hesselholt–Madsen logarithmic DVR model and its explicit calculations, the assembly of local higher K-groups, and their arithmetic completion interfaces.

GeneralAlgebraicKTheory supplies exact-category K-theory, its plus comparison, localization, dévissage, products and transfers. AlgebraicKTheory A2/A4 supplies determinant and semilocal K₁, and A5 supplies Matsumoto's presentation and finite-field K₂ vanishing. K2SymbolsBrauer supplies the native Milnor ring, last-slot residues, specializations, Bass–Tate sequence and all finite-extension norms; §3.0 identifies the maps used here with those exports. ClassicalArithmeticCompletion supplies local norm-residue symbols, their tame formula, norm criterion and exponent changes; §§3.0–3.2 construct their K₂ factorization and the tame-boundary comparison. AInfCohomology §AI.7.2 supplies modern THH, TC⁻, TP and cyclotomic Frobenius. The genuine cyclotomic foundations, classical trace model and nilpotent comparisons needed here are targets of Layer 4. CrystallineCohomology supplies classical characteristic-p and relative de Rham–Witt complexes; §5.2a constructs the universal absolute prelog complex in mixed characteristic. GeneralizedCohomology G2–G3 supplies spectra, coherent spectral limits and derived completion; StableHomotopyKTheory supplies plus constructions and K-theory coefficient and completion comparisons. Section 3.0a owns the shared integral Bloch cycle complexes and their moving, localization, product and transfer theory, followed by the additional motivic-to-K tower and norm-residue comparisons; field étale descent is §6.5a. The universal finite-coefficient Chern construction before rigidity is §1.8; §6.10 constructs the diagonal Milnor-valued Chern map. Rational and p-adic regulator constructions are outside this roadmap.

Tau Ceti's GrothendieckEulerForms already owns the Grothendieck-group framework; the library's dimension equivalences give K₀ of a field. LocalFieldsRamification, LocalGaloisGroups, ClassFieldTheory, ProfiniteCohomology and NumberFieldArithmetic already own the local fields, arithmetic reciprocity, Galois coefficients and completion algebras used below. RepresentationTheory/InductionRestriction owns Brauer induction and the integral virtual-character lattice. QuadraticFormInvariants and Tau Ceti's quadratic-form library own their classical Witt rings and cancellation; the symmetric bilinear characteristic-two groups below are a different application of Poincaré-category L-theory. General Poincaré GW/L spectra and the fundamental square are supplier contracts, not reconstructed in this roadmap. Section 6.12a constructs the dyadic field homotopy-limit theorem used in §6.13. Tau Ceti's general additive Tate module is also a supplier, not a second inverse-limit construction here.

## Conventions

Use connective algebraic K-theory unless a nonconnective localization theorem is explicitly invoked. For m ≥ 1 set K(R; ℤ/m) = cofib(m: K(R) → K(R)); write Kₙ(R; ℤ/m) for its homotopy group. The Bockstein lands in Kₙ₋₁(R)[m], not in a quotient. Write K(R; ℤₚ) = holimν K(R; ℤ/p^ν). An integral group, its tensor product with ℤₚ, its ordinary inverse-limit completion, and the homotopy group of this completed spectrum have separate meanings throughout.

A finite field has q = p^f elements, with p prime and f ≥ 1; hence q ≥ 2. A local field E has integer ring O, uniformizer π, finite residue field k = 𝔽q and normalized valuation v(π) = 1. The letter A also denotes a complete mixed-characteristic DVR with perfect residue field k, which need not be finite. Its absolute ramification index is e = v(p). In the mixed-characteristic Hesselholt–Madsen calculations in Layer 5, p is odd. Statements allowing p = 2 say so explicitly.

Write K₂ symbols additively, and roots of unity multiplicatively. Write B for the spectrum-level DVR localization boundary K(L) → ΣK(k). In homotopy degree n ≥ 1 use its uniformizer-last adapter ∂ₙ = δₙ = (−1)^(n−1)Bₙ, integrally and with coefficients. Spectrum localization sequences use B; their homotopy-group comparisons use the same adapter on each boundary. The adapted boundary is left linear: ∂(x·y) = r(x)·∂y for an integral class x, and ∂[π] = 1. Thus ∂{u,π} = ū and ∂{π,u} = ū⁻¹ for u ∈ O×. This is the inverse of the tame symbol used in the K-book's symbol presentation. Local reciprocity sends a uniformizer to arithmetic Frobenius. Our Hilbert symbol is (a,b)ₘ = rec(a)(b^(1/m))/b^(1/m); Sharifi §9.3 reverses the two inputs. Accordingly the tame Hilbert symbol is the negative power of our localization boundary, as computed in Layer 3.

Tate twists use the cyclotomic Galois action. The notation ℚₗ/ℤₗ(i) denotes that twist of a divisible torsion group; it is not its ordinary i-fold tensor product as an abelian group. Put Wᵢ(E) = H⁰(E, ℚ/ℤ(i)) and wᵢ(E) = #Wᵢ(E) when i ≠ 0 and this group is finite. A cyclic description ℤ/w specifies an abstract isomorphism unless a generator or an equivariant map is supplied.

For classical traces, `TRⁿ = T^(C_{p^(n−1)})` for n ≥ 1. R is cyclotomic restriction; F is inclusion of fixed points; V is transfer. Adjacent-level maps require n ≥ 2. On TR = holim_R TRⁿ the map R becomes the identity, and TC is the homotopy equalizer of id and F. Multiplication comes from that equalizer of ring maps, not from treating id − F as a ring map. A pro-isomorphism is never silently replaced by a levelwise isomorphism.

For a commutative ring k and N ≥ 1, `𝕎_N(k)` denotes the big Witt group for the initial truncation set {1,…,N}. It is realised as the multiplicative group of truncated power series with constant term one, `(1 + t·k[t]/(t^(N+1)))ˣ`, on Mathlib's `Polynomial` and `PowerSeries` carriers; `𝕎(k)` is `1 + t·k[[t]]`. The Verschiebung `V_n : 𝕎_m(k) → 𝕎_(mn)(k)` is induced by t ↦ tⁿ, and the Teichmüller class of a is (1 − a t)⁻¹. With this convention 𝕎_N(k) is written additively. For perfect k of characteristic p it splits as the product of the p-typical truncated Witt groups `W_s(k)` indexed by d ≤ N with p ∤ d, where s is the number of j ≥ 0 with d p^j ≤ N.

K-book citations refer to the author draft of 29 August 2013; its PDF page is the printed page plus eight. HM03 means the January 2004 author version of the 2003 Annals paper, with its own page numbers. Other versions are fixed under References.

## Exact supplier contracts

### From Mathlib and Tau Ceti

At the pinned Mathlib revision, use `GaloisField`, `FiniteField.frobeniusAlgEquivOfAlgebraic`, `IsGalois.card_aut_eq_finrank`, `FiniteField.norm_surjective`, `FiniteField.algebraMap_norm_eq_pow`, `Algebra.norm` and `LinearMap.det_restrictScalars`. `Matrix.card_GL_field` supplies the order of GL, not its stable cohomology. `AdjoinRoot.tensorAlgEquiv` and primitive-element/Galois APIs supply the algebraic ingredients for decomposing a finite Galois tensor square. Their use requires a genuine separable extension, not merely an equality of cardinalities.

Use `WittVector` with its ghost components `WittVector.ghostComponent`, injectivity over p-torsion-free rings, `WittVector.constantCoeff`, `WittVector.teichmuller`, Frobenius and `WittVector.verschiebung`, and `TruncatedWittVector` with truncation. These are the carriers for Wₙ; quotienting by the ideal pWₙ(A) is not componentwise reduction. Mathlib's `Perfection.teichmuller` supplies the multiplicative Teichmüller map from the perfection of R/I into an I-adically complete ring R whose quotient has characteristic p; it is the multiplicative input to the coefficient embedding of §5.2, not that embedding. `KaehlerDifferential.D`, exterior powers, polynomial derivatives, `PowerSeries.derivative`, `DividedPowerAlgebra` and Eisenstein polynomials supply the ordinary algebra underlying logarithmic differentials and the divided-power calculations. There is no de Rham–Witt complex, big Witt vector or THH/TR/TC carrier at these pins.

Use `HenselianRing`, `HenselianLocalRing`, `IsDiscreteValuationRing`, `IsLocalRing.ResidueField`, `IsAdicComplete`, `PerfectRing`, `IsNonarchimedeanLocalField`, `AdicCompletion`, `NumberField`, `HeightOneSpectrum.adicCompletion` and their ring maps. Tau Ceti's `HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem` supplies prime-to-residue-characteristic root lifting; `rootsOfUnityEquivResidueField`, the henselian Teichmüller section `TauCeti.teichmuller : (ResidueField R)ˣ →* Rˣ` for finite residue fields, and `normalizedValuation` identify the tame units and fix v(π). Tau Ceti's `HeightOneSpectrum.adicCompletionExtension` and `HeightOneSpectrum.residueFieldEquivAdicCompletion` supply the arithmetic maps and residue identification.

For the elementary group theory of Layers 0 and 6 use Mathlib's `ContinuousAddMonoidHom`, `IsTopologicalAddGroup`, `CompactSpace`, `T2Space`, `DivisibleBy`, `nsmulAddMonoidHom`, `AddSubgroup` lattice operations and `PadicInt.subring`; ℚₚ/ℤₚ is the quotient of `ℚ_[p]` by the additive subgroup of `PadicInt.subring p`.

Use `TauCeti.SplitK0.finrankEquiv` and `TauCeti.AbelianK0.finrankEquiv` for the existing dimension identifications, together with the exact-category comparison supplied below. For representations use `FDRep`, `TauCeti.AbelianK0`, `TauCeti.repRing`, `repRingCharacter`, `virtualCharacters`, and `Representation.baseChange`. Here `repRing` is split K₀. Its character map is injective for finite groups over an algebraically closed characteristic-zero field, as in the complex augmentation calculation; no modular injectivity is asserted. Tau Ceti also supplies `ExactStructure.abelian (FDRep k G)`, its `TauCeti.ExactK0` commutative ring and `TauCeti.ExactK0.fromSplitRingHom` in `TauCeti/RepresentationTheory/GrothendieckGroup/FDRep.lean`. Consume that exact ring for field representations in §0.5, including modular characteristic; compare with the split ring only when all short exact sequences split. The extension to finite A-projective representations for general commutative A is SchemeKTheoryOperations §6.3.4's supplier. None of these constructions makes a modular representation an honest complex representation.

Mathlib's `groupCohomology`, `groupHomology`, `tateCohomology`, projective resolutions and mapping cones provide the algebraic Tate comparison. Tau Ceti's `TateCohomology.H0LinearEquivTrivialIntZModCard` fixes the trivial integral-coefficient computation. Tau Ceti's module `TauCeti.Algebra.Module.Torsion.TateModule` supplies `TauCeti.TateModule p B`, its compatible p-power torsion families, projections `TauCeti.TateModule.proj`, functorial maps `TauCeti.TateModule.map` and `TauCeti.TateModule.mapLinearMap`, the ℤₚ action and the finite-rank freeness criterion. Consume this carrier for Tₚ(B). The additional elementary lemmas needed for completion are stated in §6.2 on this carrier; they are not declarations already supplied by this module. Its `TauCeti.TateModule.nonempty_linearEquiv_of_natCard`, `TauCeti.TateModule.free_of_natCard` and `TauCeti.TateModule.finrank_eq_of_natCard` supply the finite-rank freeness criterion. The latter statement does not identify the Tate module of an infinite direct sum with an unrestricted product. Tₚ(ℤ) = 0, whereas the ordinary p-adic completion of ℤ is ℤₚ.

For §0.4 use Tau Ceti's `TauCeti.completedGroupAlgebra` carrier with `TauCeti.completedGroupAlgebra.proj`, `TauCeti.completedGroupAlgebra.of`, `TauCeti.completedGroupAlgebra.map` and `TauCeti.completedGroupAlgebra.powerSeriesCoordinate` from `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/{Basic,Map,PowerSeries}.lean`, also consumed by ProfiniteProPGroups Layer 9. The coordinate requires an infinite procyclic pro-p group and a topological generator; for ℤₚ× at odd p retain its finite prime-to-p factor. No completed-group-algebra carrier or general coordinate is constructed here.

For cardinal arguments use `exists_isTranscendenceBasis`, `IsTranscendenceBasis.isAlgebraic`, `AlgebraicIndependent.aevalEquiv`, `MvPolynomial.cardinalMk_le_max`, and `Algebra.IsAlgebraic.cardinalMk_le_max`, with its domain and torsion-free scalar hypotheses. `PowerSeries.mk`, `PowerSeries.coeff_mk` and `HahnSeries.ofPowerSeries_injective` embed binary sequences into Laurent series. These inputs do not assert uncountability of a K-group by themselves.

### From the foundational K-theory roadmaps

GeneralAlgebraicKTheory must provide one functor K on exact and Waldhausen categories (Layers 2 and 5–6), its `BGL(R)⁺` comparison on positive homotopy (§§1.5, 3.12), filtered-colimit and finite-product preservation (§2.6), projective resolution and dévissage (§§4.6, 4.8), localization (§§4.14, 6.3), and restriction of scalars for finite projective algebras with its projection formula (§7.7). Products must include the external pairings of §7.4 and the boundary identities below; the mixed finite-coefficient pairings built from them, with the left-linear DVR boundary, are targets of §§1.1 and 2.2. Its §8.12 (`localizationBoundary_DVR_valuation`) identifies the degree-one DVR boundary with the normalized valuation, and its §8.13 (`localizationBoundary_product`) makes the raw boundary B right linear with B[π] = +[k]; the uniformizer-last normalization δₙ = (−1)^(n−1)Bₙ recorded there by `uniformizerLastSign` is exactly ∂ₙ of our Conventions, with δ₁ = B₁ and δ₂ = −B₂. Its ordinary coefficient Bockstein commutes with δ, as derived in §2.2 from the anticommuting raw boundary square. The general DVR sequence used with dualities retains the residue coefficient line, as in GeometryOfNumbersAndQuadraticArithmetic §6.9. AlgebraicKTheory A2 and A4 supply the determinant K₁(F) ≃ F× and, through stable range one, K₁(R) ≃ R× for commutative semilocal R; A5 supplies the field Matsumoto theorem and K₂ of finite fields. GeneralAlgebraicKTheory's scalar-restriction transfer is compared here with the field norm, a target in §1.5; the valuation identification of the boundary is consumed from §8.12, not proved again in §2.2.

GeneralizedCohomology G2 supplies the symmetric-spectrum and ring/module homotopy theory; G3.4 supplies telescope Milnor sequences; G3.8–G3.9 supply coherent spectral homotopy limits, derived prime completion and its exactness. DerivedModuleAlgebra §1.T.1 supplies the countable abelian-tower kernel/cokernel construction of lim and lim¹, its exact sequence and Mittag–Leffler vanishing. StableHomotopyKTheory Layers 1–3 supply classifying spaces, homotopy fibres, plus acyclicity and its universal property for maps to H-spaces. Its §§7.1–7.7 supply Moore cofibres and coefficient maps, §7.9 the homotopy-group tower comparison using that abelian input, §7.11 the completion extension, §7.13 the finite-generation comparison, and §§7.14–7.18 completeness criteria, including bounded prime-power exponent. Its §7.28 supplies homotopy associative and commutative Moore products for prime powers outside {2,3,4,8}, and §7.33 Browder's mod-coefficient products. These contracts use GeneralizedCohomology's spectrum carriers. Surjective or Mittag–Leffler towers have vanishing lim¹ without a finite-group hypothesis. The comparison under pro-isomorphisms is required on the actual transition maps, not on unrelated levelwise groups.

GeneralizedCohomology G5.4 supplies represented KU, its connected rank-zero space BU and Bott periodicity. GeneralAlgebraicKTheory §13.8a supplies `finiteField_adamsInput`, the positive-integer exterior/Adams operations on BU and `finiteGroup_KU_completion`: for finite G, Rℂ(G)^∧_I ≃ KU⁰(BG) and KU¹(BG) = 0, with the finite-skeleton and Adams comparisons. Its underlying KU and telescope carriers are GeneralizedCohomology G5.4 and G3.4. GeneralAlgebraicKTheory §13.8b supplies `finiteField_brauerLift`, the standard-minus-rank virtual Brauer lift, its stable Frobenius homotopy and the equivalence BGL(𝔽q)⁺ ≃ fib(ψ^q−1:BU→BU), including the finite-GL cohomology/detection, stable defining-characteristic and rational homology comparisons. Its §13.8c supplies `finiteFieldKGroups`: K₀ = ℤ, K₂ᵢ = 0 and K₂ᵢ₋₁ ≃ ℤ/(q^i−1), i ≥ 1, including `finiteField_K4_vanishing`. Consume these as one compatible plus/Q comparison; no second proof of Green integrality, standard Brauer lifting or Quillen's equivalence is a target below. The finite-field inputs are supplied together by GeneralAlgebraicKTheory §§13.8a–c.

The supplied fibre is connected and includes paths between ψ^q(x) and x; it has π₂ᵢ = 0 and π₂ᵢ₋₁ = ℤ/(q^i−1). It is neither a strict fixed-point subset nor the rank-inclusive fibre used in §6.12. At q=2 its π₁ is zero while π₃=ℤ/3; at q=5 determinant sends the unit 2 to a generator of π₁=ℤ/4. The standard lift at rank two over 𝔽₃ is a virtual class, and stabilization cancels the added trivial line. These boundary checks fix which supplied comparison is being consumed.

The extra compact augmentation-kernel tower lemma and continuous ℓ-completed unit Adams operations are targets of §§0.1–0.2; the multiplicative Eilenberg–Moore pullback theorem is §0.3. They are refinements beyond the stated integer-Adams and finite-group exports, not consequences of a generic filtered-spectrum spectral sequence. SchemeKTheoryOperations §§6.3.4–6.4 supplies exact representation rings over general commutative rings, their Frobenius-twist/Adams identity, higher λ/Adams operations, Hiller lifting and uniqueness, and the positive-degree identity ψᵏ=(−1)^(k−1)kλᵏ. Section 1.5 derives `frobenius_eq_adams` on higher K and `perfect_positiveK_uniqueDivisible`; these consequences are local targets using those precise exports, not additional unstated supplier theorems.

Consume AlgebraicKTheory A5's Steinberg relations and Matsumoto presentation of K₂ of a field. K2SymbolsBrauer §§5.4–5.8, 7.2, 9.11–9.18 and 10.5–10.25 supply the Milnor ring, its Matsumoto comparison, last-slot residues and arbitrary finite-extension norms, including inseparable extensions and the filtered-colimit export contract. Section 3.0 uses these common objects through `milnorResidueNorm`, and §3.2 proves that the left-linear localization boundary δ₂ of GeneralAlgebraicKTheory §8.13 is the last-slot tame symbol, with δ₂{u,π}=ū. Section 3.1 factors ClassicalArithmeticCompletion §1.14's symbol through Matsumoto's presentation. Its quadratic comparison is the supplied `normResidueSymbol_two_eq_hilbertSymbol`. Section 7.3 transports the symbols at number-field places through completion and the supplied Hilbert product formula; it assumes no global K₂ kernel theorem.

ClassicalArithmeticCompletion §1.14 supplies `normResidueSymbol`, the degree-n norm-residue symbol (a,b)_(F,n) = Art_F(a)(β)/β, βⁿ = b, of a nonarchimedean local field F containing a primitive n-th root of unity, normalized by arithmetic Frobenius; this is our orientation. Its API supplies bimultiplicativity, the Steinberg relation, skew symmetry, perfectness of the pairing on F×/F×ⁿ, the norm criterion `normResidueSymbol_eq_one_iff_mem_normGroup`, the exponent change `normResidueSymbol_pow_of_dvd`, the norm formula, and the tame formula `normResidueSymbol_tame`: for residue characteristic prime to n, (a,b)_(F,n) is the root of unity congruent to ((−1)^(v(a)v(b)) b^(v(a)) a^(−v(b)))^((q−1)/n). Its §1.24 gives the symbol at a place of a number field and §1.52 Hilbert's product formula. These are consumed in Layers 3 and 7, not planned again.

### From trace, differential and arithmetic suppliers

AInfCohomology §AI.7.2 supplies `AInf.Trace.THH`, `AInf.Trace.frobenius`, `AInf.Trace.TCminus`, `AInf.Trace.TP` and `AInf.Trace.bokstedt_periodicity` for connective commutative ring spectra, including their circle actions, products and canonical maps. Section 4.0 constructs the genuine equivariant spectrum and representation-sphere interfaces and cyclic homology; §§4.1–4.4 construct the linear Waldhausen cyclotomic model, trace and bounded-below genuine/modern comparison, and §4.4a proves the nilpotent relative trace theorems. Agreement with ordinary modern THH is proved through the resolution/Morita comparison of §4.7. The logarithmic DVR value is not ordinary THH of the fraction field.

CrystallineCohomology Layer CR.4 (§CR.4.6) supplies the classical characteristic-p and relative p-typical Witt complexes, including R,F,V,d and the projection formula. Its Layer CR.5:log-algebra supplies prelog rings and log structures (§CR.5:log-algebra.1), and §CR.5.1 supplies universal log differentials with their residues. This roadmap owns the mixed-characteristic DVR presentations, homotopy-orbit comparison and trace calculation.

The absolute initial object, level-one comparison and standard filtration are constructed in §5.2a, before the DVR calculations. Relative Wₙ(A)-linear differentials from CrystallineCohomology §CR.4.6 are not used for this purpose: with the same ring as base they kill all positive forms, whereas absolute Witt differentials can retain dV(1). SchemeAndStackFoundations §0.15 supplies `popescu_desingularization` and `popescu_colimit_of_geometricallyRegular` for regular maps of noetherian rings (Stacks Theorem 16.12.1, tag 07GC). Section 5.17 applies these to the geometrically regular map 𝔽ₚ→A, at finite Witt length before any inverse limit. The Geisser–Levine field/sheaf comparisons needed there are separate targets of §5.17, not exports of Bloch–Gabber–Kato alone.

LocalFieldsRamification Layers 0–2 supply finite extensions as local fields, the henselian DVR integer ring, finite roots of unity, the units/principal-units decomposition, unramified extensions and their residue Frobenius. A coefficient-ring presentation for an arbitrary perfect residue field requires the complete Cohen/Witt lifting theorem; the finite-residue unramified-extension theorem alone is insufficient. This additional input is made an explicit target in §5.2. ClassFieldTheory Layers 5–8 supply local reciprocity with arithmetic Frobenius, its norm kernel, finite-module local duality, finiteness and the local Euler characteristic. In particular consume `kummerEquiv_mixed`, `finite_H`, `tateDualityPairing_perfect_mixed`, `eulerCharacteristic_mixed`, and Layer 6’s `cd_p_absoluteGaloisGroup_eq_two`; these are statements for finite smooth discrete coefficients over finite p-adic fields. Layer 7 fixes the absolute Artin map and its cyclotomic unit normalization. ProfiniteCohomology Layer 9 supplies surjectivity of Kummer's map; the pinned `TauCeti.kummerClassMap_injective` supplies its injective half. LocalGaloisGroups Layers 0 and 5–6 supply the cyclotomic-character image and its local reciprocity comparison, including `range_localCyclotomicCharacter_ratPadic` and its finite-extension index bound; use LocalFieldsRamification for the inertia/residue sequence. NumberFieldArithmetic Layer 5 supplies completion maps in towers and `semilocalEquiv v : K_v ⊗[K] L ≃ₐ[K_v] ∏_(w|v) L_w` with its value on pure tensors.

EtaleCohomologyFoundations supplies the field étale/Galois comparison and henselian cohomological rigidity. Section 3.0 consumes K2SymbolsBrauer's Milnor residues and norms and constructs the differential norm-residue comparison; §3.0a constructs the shared Bloch complexes and moving package, their Milnor diagonal identification, norm residue and the motivic-to-K tower. Section 6.5a constructs `periodicEtaleK`, `etaleKComparison`, `etaleDescentFiltration` and `quillenLichtenbaumField`, with restriction and transfer. These are targets here, independent of the odd-prime logarithmic trace calculation. Section 5.17 proves the separate Geisser–Levine concentration and higher-K logarithmic-symbol comparisons.

The map Kᵢᴹ → Kᵢ → Kᵢᴹ has composite (−1)^(i−1)(i−1)! (K-book Lemma V.11.13, p.458). ArithmeticGaloisDuality Layer R02.1 (compact coefficients, limits and continuous extensions; §R02.1.3 for lattice, rational and torsion coefficients) supplies cohomology of ℤₚ(i), ℚₚ(i) and ℚₚ/ℤₚ(i), with lim¹ controlled before exchanging cohomology and limits, and its §R02.3.1 (`RestrictedRamification.unramifiedSubgroup`) supplies the unramified inflation subgroups. The local étale edge in §6.6 uses §6.5a. The universal finite-coefficient Chern maps and finite-field normalization in §1.8 use étale cohomology, classifying spaces and the supplied finite-field comparison; they precede rigidity and do not call motivic K-descent.

GeometryOfNumbersAndQuadraticArithmetic §6.8a supplies the general Poincaré categories, symmetric structures, GW and L spectra, Ξ: L → K^(tC₂), the cartesian GW/L/K homotopy-fixed/Tate square, and the classical-to-symmetric connective comparison. Its §6.9 supplies symmetric localization for Dedekind rings with the derived residue coefficient line. Consume its §6.10 `finiteEvenFieldHomotopyLimit` for finite characteristic-two fields, including the bilinear Witt calculation, equivariant rank comparison and metabolic shifts; those are not additional targets here. Section 6.12a supplies the dyadic field homotopy-limit theorem, including its motivic comparison proof. HermitianKTheoryOfPoincareCategories Layers 0–1 supply general shift transport and periodicity, and its Layer 7 (§§7.1–7.2 and the field L-groups of §7.9) supplies field L-theory comparisons between flavours. The finite 2-power exponent of the Witt group of a finite extension of ℚ₂, used in §6.13, follows from QuadraticFormInvariants Layer 6's classification of forms over a nonarchimedean local field by dimension, discriminant and Hasse invariant. For the finite-rank Sp calculation require the Lang/geometric étale comparison compatible with compact Sp → SU, not merely the order of a finite classical group. These contracts are distinct from the classical characteristic-not-two quadratic Witt ring already present in Tau Ceti.

HermitianKTheoryOfPoincareCategories §7.10, `finite-even-multiplicative-l-tate`, supplies the multiplicative refinement: for a commutative algebra object in small Poincaré ∞-categories, with tensor exact separately and coherent Poincaré multiplication and unit, it supplies compatible lax symmetric monoidal K, GW and L and a natural unital E∞-ring map Ξ. In particular, for every commutative ring R, with no characteristic or finiteness restriction, use Ξ:L(Dᵖ(R),Qˢ_R)→K(Dᵖ(R),Qˢ_R)^(tC₂), with the tensor-product duality. Forgetting the multiplicative structure gives precisely GeometryOfNumbersAndQuadraticArithmetic §6.8a's Ξ and its factorization of GW→K^(hC₂)→K^(tC₂) through L. The GW/L/K square is cartesian in E∞-rings; its underlying fundamental fibre sequence K_(hC₂)→GW→L is a sequence of GW-modules, with scalar actions through forgetting and bordification and with module-linear norm and hyperbolic maps. The underlying square and fibre sequence are the supplied additive ones (Calmès et al. II Corollary 4.4.13 p.107); the multiplicative construction belongs to the hermitian supplier (III Remark 3.1.5 p.51, with its attribution to Paper IV).

HermitianKTheoryOfPoincareCategories §7.11, `multiplicative-l-tate-base-change`, supplies the corresponding comparison for every module P over such a Poincaré algebra A, with action exact separately: Ξ_P is L(A)-linear after restricting scalars along Ξ_A, and its fundamental square and fibre sequence are compatible GW(A)-module diagrams. For a commutative ring map R→S, use derived extension on perfect complexes, carrying an invertible central coefficient line M, its involution and an integer shift r to M_S=S⊗_R M with that shift. The induced comparison square is semilinear, coherently for identities and composites; its relative-tensor scalar-extension maps commute with Ξ. These scalar-extension maps are not assumed to be equivalences. Twisted or shifted symmetric theories are modules over the untwisted symmetric theory; a ring unit is asserted here only for the untwisted commutative-algebra object. These are the module and base-change exports used with §1.7, on the same additive comparison, not a replacement fundamental square.

SchemeAndStackFoundations §0.15 supplies `popescu_desingularization` and `popescu_colimit_of_geometricallyRegular` (Stacks Theorem 16.12.1, tag 07GC). Its regular-map and noetherian hypotheses are retained in §5.17.

For §1.8 consume EtaleCohomologyFoundations §0.9's normalized étale projective-bundle formula and first Chern class, and its underlying cohomology, Kummer, coefficient and proper-smooth comparison exports. SchemeAndStackFoundations §5.4 supplies the flag/splitting geometry. Section 1.8 constructs the higher finite-coefficient Chern operation by universal classes and Moore-Hurewicz; §1.9 constructs the Lang torsor/classifying comparison in the precise low degrees used. These constructions precede the motivic descent of §§3.0a and 6.5a.

HermitianKTheoryOfPoincareCategories is a prior supplier in this build. The finite-field comparison enters from GeneralAlgebraicKTheory §§13.8a–c before the refinements and rigidity here. Independently, those same exports feed GeometryOfNumbersAndQuadraticArithmetic §§6.8a–6.10 and HermitianKTheoryOfPoincareCategories §§7.10–7.11 before §1.7's application. General shift and flavour comparisons come from the hermitian supplier's Layers 0–1 and 7. The trace branch starts with AInfCohomology §AI.7.2 and the genuine foundations of §4.0; the absolute Witt construction of §5.2a precedes its logarithmic calculations. The motivic branch begins in §3.0a and supplies §6.5a without using §6.6's local conclusion.

## How to read the build

Layer 0 supplies the topological refinements used to normalize the imported comparison. Layer 1 supplies finite-residue operations and coefficient interfaces. Layer 2 extracts the prime-to-p information from henselian rigidity. Layer 3 settles integral K₂, including the wild roots of unity. Layer 4 establishes the classical logarithmic trace and its localization interface. Layer 5 performs the residue-characteristic calculations, with the low-degree argument ordered before the Tate-spectral-sequence induction. Layer 6 combines them with local duality and abelian-group structure; Layer 7 exports the resulting maps to arithmetic consumers. Heavy constructions are stated here with their intended APIs; the suggested Lean file records only signatures expressible using the pinned carriers.

## Layer 0: completed KU and pullback cohomology

### 0.0 The maximal divisible subgroup

For an additive abelian group A define `maxDivisible A` as the supremum of its divisible additive subgroups. A subgroup is divisible when multiplication by every positive integer is surjective on that subgroup. Prove the supremum is divisible, contains every divisible subgroup, and has reduced quotient. The API is `maxDivisible_divisible`, membership through a divisible subgroup (`mem_maxDivisible_iff`), `maxDivisible_eq_top_iff`, the reduced quotient `maxDivisible_quotient`, a noncanonical internal complement (`exists_isCompl_maxDivisible`), functoriality under additive homomorphisms (`map_maxDivisible_le`), finite-product compatibility (`maxDivisible_prod`), and triviality on finite groups (`maxDivisible_eq_bot_of_finite`). These are the declarations represented in Suggested.lean. Also prove Div(A) ⊆ ⋂_(m≥1)mA and the classification Div(A) ≃ ℚ^(κ)⊕⊕_ℓ(ℚ_ℓ/ℤ_ℓ)^(λ_ℓ). The inclusions and cardinal ranks are intrinsic; the decomposition and complement are choices (K-book VI.1.6 proof p.467 and VI.7.3 p.509).

Isolate the useful criterion `range_nsmul_eq_maxDivisible`: if w ≥ 1 and mA = wA for every positive multiple m of w, then wA = Div(A) = ⋂_(m≥1)mA. Here wA is the range of `nsmulAddMonoidHom w`. If A/wA is cyclic of order w, obtain an abstract splitting A ≃ Div(A)⊕ℤ/w. For a torsion-free ℤ_(p)-module T with dim_(𝔽p)T/pT = t finite, prove T/p^νT ≃ (ℤ/p^ν)^t, its completion is ℤₚ^t, and the completion kernel is Div(T), a ℚ-vector space. Lifts of a basis mod p generate P ≃ ℤ_(p)^t, with P∩Div(T) = 0; P completes isomorphically onto T^∧, T/(P+Div(T)) is a ℚ-vector space, and T^∧/image(T) is a ℚ-vector space. This does not split the inclusion P→T (K-book VI.7.3 proof p.509 and Warning VI.7.5 p.510; Handbook Corollary 63 p.166). *Needs:* injectivity of divisible abelian groups, elementary structure of finite p-power quotients, and the general completion supplier.

**Checks.**

- Div(ℚ×ℤ/6×ℤ) = ℚ×0×0, by finite-product compatibility. Every fixed wℤ is nonzero, whereas Div(ℤ) = 0 (`maxDivisible_int`). Applied to ℤ, the criterion's hypothesis fails for every w: 2wℤ ≠ wℤ.
- For a finite group A, Div(A) = 0; for A = ℚ/ℤ it is all of A. Quotients need not preserve reducedness: ℤₚ is reduced, while ℤₚ/ℤ_(p) is a nonzero ℚ-vector space.
- Taking T = ℤₚ and P = ℤ_(p) gives a rank-one completion isomorphism and a uniquely divisible quotient T/P. It does not make ℤₚ a direct sum of P and that quotient.
- At t = 0 a torsion-free ℤ_(p)-module T with T/pT = 0 is a ℚ-vector space; its p-completion is zero.

Suggested.lean proves Div(ℚ) = ℚ and Div(ℤ/6) = 0 directly from the definition. Its named control `maxDivisible_int` is the reduced torsion-free non-example above.

### 0.1 Compact towers and stable uniqueness

For a countable inverse system (Cₙ,fₙ) of compact Hausdorff abelian groups with continuous homomorphisms, prove `compactTower_limOne_zero`: the map ∏Cₙ→∏Cₙ, (xₙ)↦(xₙ−fₙxₙ₊₁), is onto. No surjectivity of fₙ is assumed. The finite intersection proof solves the first N equations backwards and then uses compactness of the product. This is an algebraic lim¹ statement about the underlying abelian groups. Use DerivedModuleAlgebra §1.T.1's `CompactCoefficients.Tower`, with a compact Hausdorff topological additive group on each term and continuous transition maps. The conclusion is `Subsingleton A.limOne` for its supplied cokernel of the shift map.

For finite G, let I_G be the kernel of dimension on Rℂ(G) and C_G = lim_s I_G/I_G^s. Prove `augmentationKernel_compact`: these quotients are finite, C_G is compact Hausdorff, KU⁰(BG) ≃ ℤ⊕C_G through the supplied completion theorem, and restriction is continuous on C_G and identity on rank. For Gₙ=GLₙ(𝔽q), deduce lim¹ KU⁰(BGₙ)=0 from the compact kernel and the constant rank tower. Together with KU¹(BGₙ)=0 and both degrees of the telescope Milnor sequence this identifies KU⁰ of stable BGL with the inverse limit and kills KU¹ there. It controls uniqueness of stable Frobenius homotopies; KU¹ vanishing at each finite rank alone does not kill the other lim¹ term (Atiyah–Segal Theorem 2.1 pp.3–4, Proposition 4.2 p.10; Haine Construction 6.11 p.11).

**API.** Functoriality under continuous morphisms of towers, compatibility with splitting off the constant rank, and comparison with the supplied telescope Milnor sequence. Prove quotient finiteness using finite generation of I_G and |G|I_G⊆I_G²; completion, not I_G itself, supplies compactness.

**Checks.**

- The tower ℤ₂ with transition ×2 is not required to be surjective; every inhomogeneous recurrence still has a solution in ∏ℤ₂.
- For G=1 the compact kernel is zero and the rank tower remains ℤ; declaring the entire KU⁰(BG) compact would fail.
- The discrete tower ℤ with transition ×2 has nonzero lim¹ (DerivedModuleAlgebra §1.T.1 `limOne_mul_p` at p = 2): the sequence equal to 1 in even and 0 in odd positions would force x₀ = Σ 4ᵏ = −1/3 in ℤ₂. Its failure of compactness prevents extending the lemma to arbitrary abelian groups.
- For C₂, Rℂ(C₂)=ℤ[t]/(t²−1), I=(t−1), and I²=2I. The kernel completion is ℤ₂, whereas the rank summand stays ℤ.

### 0.2 Continuous unit Adams operations

For every prime ℓ construct `completedAdams ℓ u : KU^∧_ℓ→KU^∧_ℓ` for u∈ℤℓ×. Require ring-spectrum self-equivalences with composition homotopies, ψ¹=id, compatibility with Bott periodicity, and ψ^u acting by u^i on π₂ᵢ=ℤℓ for all i∈ℤ. The topology on homotopy classes of operations is restriction to finite subspectra and finite coefficients. The map u↦ψ^u is continuous in that topology and agrees with the supplied integer operation whenever u is a positive integer prime to ℓ. Construct it through KU cooperations and the evaluation pairing with Cont(ℤℓ×,ℤℓ); extend the integer compatibility across finite stages, rather than postulating integer powers for a profinite exponent (Baker, §2, pp.3–4, equation (2.1)).

**API.** Naturality on completed KU of CW spaces, additivity and multiplicativity, coefficient reduction, external products, action on reduced classes, and commuting homotopies with ψ^q for ℓ∤q. Restrict to connected covers when using BU and to its homotopy equalizer for FPsi q. For finite-stage or stable maps retain the homotopies furnished by §0.1. This target concerns the operations used here; it makes no assertion that arbitrary homotopy actions uniquely rigidify to an action in every higher category.

**Checks.**

- At u=−1 the weights in degrees two and four are −1 and +1. At u=1 the entire operation is identity.
- At ℓ=2 units include −1 and 1+4ℤ₂; no procyclic hypothesis on ℤ₂× is used.
- u=ℓ is excluded: an equivalence cannot multiply the invertible Bott class by a nonunit.
- For ℓ=3 the compatible residues of u∈1+3ℤ₃ give the same operation modulo 3^ν on each fixed finite subspectrum once sufficiently many residues agree; this is finite-stage continuity, not eventual equality of integral operations on all CW spaces.

### 0.3 The multiplicative Eilenberg–Moore comparison

Let X→B←Y be maps of connected CW spaces, B simply connected, with Hⁿ(X;k), Hⁿ(Y;k), Hⁿ(B;k) finite-dimensional for every n≥0 and k a field. Replace one map by a Serre fibration and write P=X×^h_B Y. Construct the two-sided cochain bar comparison and its spectral sequence

```text
E₂^(−s,t)=Tor_(H*(B;k))^(s,t)(H*(X;k),H*(Y;k)) ⇒ H^(t−s)(P;k), s≥0.
```

Prove strong convergence: for each total degree the bar filtration is exhaustive, complete and bounded in the contributing directions, with associated graded E∞. The simply connected base gives positive degree at least two in the reduced base cohomology; finite type allows dualizing the homological comparison. Supply shuffle products with Koszul signs, the diagonal comparison giving the cup product on H*(P;k), and naturality for maps of pullback diagrams. Product on E₂ is the Tor product, and all differentials are derivations. No natural splitting of the limiting filtration follows (Eilenberg–Moore Theorem 12.1 p.220, its cohomological dual, and §16 pp.227–230; Mestel Theorem 19 p.15).

**API.** Independence of the fibration replacement, functoriality, the two pullback edge maps, external products and internal cup products, convergence and identification of the filtration. This is the pullback theorem missing from a generic filtered-spectrum spectral sequence.

**Checks.**

- X=Y=point, B=K(ℤ,2) gives an exterior generator in total degree one from Tor bidegree (−1,2), agreeing with ΩB≃S¹.
- If Y→B is identity, the Tor computation reduces to H*(X;k), with its product and edge map unchanged.
- For B=BU×BU use the diagonal and (id,ψ^q); both inputs are finite type in each degree, although the total cohomology is infinite-dimensional. A finite-total-dimension hypothesis would exclude the required application.
- Dropping simple connectivity is invalid: B=S¹, X=Y=point has ΩB with infinitely many components, outside this convergence statement.

### 0.4 Height-one localization and realization

For p odd write Λ′=ℤₚ[[ℤₚ×]] on the supplied completed-group-algebra carrier. Define `heightOneLocalize X` as localization at KU∧M(ℤ/p), with its natural map from X, exactness, idempotence and invariance under KU/p-equivalence. An excellent Λ′-module is finitely generated of projective dimension at most one. Construct `kuModuleRealization N i` for such N: a localized spectrum with completed KU cohomology N in degree i and zero in the other parity. Prove independence of a length-one projective resolution and uniqueness up to equivalence among localized spectra with one KU-cohomology parity zero and the other an excellent module (DM §§4.7–4.17, pp.15–17).

Construct `heightOneFromZeroSpace`, a functor Φₚ from the pointed homotopy category of spaces to KU/p-local spectra, together with Φₚ(Ω∞₀X)≃`heightOneLocalize X`, natural in spectra X. First apply KU-localization of spaces, then build the functor using periodic Moore-space mapping spectra and their compatible inverse tower. Its API includes identity/composition, homotopy-fibre-square preservation on KU-local spaces, and the comparison on connected covers. A map of zero spaces can therefore be used to construct a map after height-one localization without assuming that it was an infinite-loop map (Bousfield Theorems 2.1 and 2.3, p.3; §§4–6, pp.17–30; DM Proposition 5.7 p.20).

**API.** Realize finitely generated projectives by idempotent telescopes on finite sums of KU, then realize N←P₀←P₁ by the fibre of the induced map of projective realizations. Cohomology is contravariant: a module map N→N′ gives a spectrum map in the opposite direction, with the Hom/Ext¹ comparison detecting equivalences. Changing a topological generator of the same open subgroup gives an equivalent Adams fibre through this module identification. Preserve finite direct sums, suspension and Bott twists. For an open subgroup Γ′⊂ℤₚ× with generator k, prove `adamsFibre_kuModule`: Tₖ=fib(ψᵏ−1:KUₚ→KUₚ) realizes Ind_(Γ′)^(ℤₚ×)ℤₚ(0) in degree zero, and KUₚ realizes Λ′. Use the supplied finite-field comparison and its KU/p-localization, not a conjectural identification of connective and periodic spectra (DM Proposition 4.18, p.17).

**Checks.**

- N=0 realizes the zero spectrum; N=Λ′ realizes KUₚ. A resolution with a redundant projective summand gives the same object.
- A direct sum N₁⊕N₂ gives a wedge of the two realizations. An isomorphism of underlying abelian groups alone does not suffice: the Λ′ action and its Bott twists must agree.
- The trivial Γ′-module has a one-relation resolution by multiplication by k−1 in its completed group ring. Its realization is a fibre, whereas taking a cofiber without the shift reverses the degree.
- Φₚ(point)=0 and Φₚ(Ω∞₀Hℤₚ)=0; removing finitely many homotopy groups does not change height-one localization. For KUₚ its comparison recovers KUₚ from the connected zero space, not a connective KU spectrum.
- Tₖ has π₀=ℤₚ and π₋₁=ℤₚ because ψᵏ acts identically in weight zero. A connective replacement has a different negative homotopy group, even though localization recovers Tₖ.

### 0.5 Burnside transfer detection

Construct stable transfers for finite coverings by stabilizing their finite-sheet embeddings, with independence of the embedding, composition and pullback identities. In this subsection R_A(G) always means exact K₀ of representations finite projective over A, using the field implementation or the general-ring supplier above. For finite G,H define `burnsideModule G H` as the Grothendieck group of finite commuting left-G, free right-H sets under disjoint union. Its API includes the orbit basis G×_K H, augmentation #P/H, A(G)-action, restriction, induction, and transfer followed by the H-bundle classifying map. Put I=ker(#:A(G)→ℤ). Prove the augmentation-completed comparison A(G,H)^∧_I≃[Σ∞BG₊,Σ∞BH₊] and, for finite fields E, R_E(G)^∧_I≃[BG₊,Ω∞K(E)]. These are new theorem targets, not supplied KU completion (DFM §2, pp.3–5).

For p-groups G, p odd, R=ℤ[ζ_(p^b)], b≥1, and a finite residue field E of characteristic different from p for which reduction induces an isomorphism μ(R)≃μ(E) on p-primary roots, define φ_R[P]=[R[P]⊗_(R[μ])R] using μ=μ(R)⊂R×. Prove φ_E:A(G,μ)→R_E(G) onto and ker φ_E⊆ker φ_R. Monomial induction and cyclotomic Morita comparison prove this before completion (DFM Propositions 3.1–3.4, Theorem 3.5, pp.5–9).

**Checks.** G=1 gives A(1,H)=ℤ. H=1 recovers A(G). G=H=Cₚ has p+1 orbit-basis elements, not p. Retain nontrivial μ. The identity-cover transfer is identity; for the n-sheet cover of a point, transfer followed by fold is multiplication by n on the sphere; a pulled-back covering satisfies the transfer/base-change square. In characteristic p, every simple representation of Cₚ is trivial, so R_(𝔽p)(Cₚ)=ℤ and a length-two unipotent extension has class 2. Its split class differs from two trivial lines. This distinguishes the exact completion theorem from a false modular use of `repRing`; in characteristic zero Maschke identifies the two rings.

For p=3 and b=1, reduction from ℤ[ζ₃] to 𝔽₇ identifies both p-primary root groups, of order three. A residue map to 𝔽₁₉ does not satisfy the root-group hypothesis: its target has nine p-primary roots. In residue characteristic p the required injectivity already fails.

For §6.12 prove Sylow-transfer detection for lifting along infinite-loop maps between p-local infinite-loop spaces: lifting or nullity can be tested after restriction to a p-Sylow subgroup. Prove finite-stage lifting for a filtered union X=⋃Xᵢ with finite reduced ℤ_(p)-homology in each degree on every Xᵢ, and loop-space targets with finitely generated ℤ_(p)-homotopy: a map lifts exactly when all restrictions lift. Apply these results, plus universality and the two completion comparisons to construct both retraction homotopies (DFM Propositions 4.2–4.7 and Theorem 4.1 proof, pp.10–12).

### Examples

Use C₂'s representation ring to distinguish compact augmentation kernel from discrete rank, and the ×2 tower over ℤ₂ to test the compact lim¹ proof. Compute the single Tor generator for ΩK(ℤ,2), including its total degree. For the height-one realization, a one-relation induced module produces Tₖ and detects the shift that a homotopy-group table would miss.

### Dependencies

The supplied represented KU, Bott periodicity, finite-group completion and finite-field comparison; general spectra, Milnor sequences, cohomology and classifying-space foundations. Sections 0.1–0.3 precede the finite-field refinements; §§0.4–0.5 are used only for §6.12's local homotopy type. Representation induction supplies the module calculations in §0.5; stable finite-cover transfers are constructed there; its two completion comparisons are targets there.

## Layer 1: finite fields over the supplied Brauer–Quillen comparison

### 1.1 Finite coefficients and their products

Define `coeff R m` and `coeffGroup R m n` by the coefficient cofiber for m ≥ 1. The API consists of `reduce`, `bockstein`, `coeff_exact`, natural ring maps and finite-projective `coeffTransfer`, identity/composition laws, filtered-colimit preservation, coefficient inclusion and reduction for m | m′, and a Chinese-remainder equivalence for coprime moduli. In all degrees the exact sequence is

```text
0 → Kₙ(R)/m → Kₙ(R; ℤ/m) → Kₙ₋₁(R)[m] → 0.
```

Equivalently K(R;ℤ/m) is the smash product of K(R) with the mod-m Moore spectrum, functorial in ring maps; for n ≥ 2, Kₙ(R;ℤ/m) is also the group [Pⁿ(ℤ/m), BGL(R)⁺] of based maps from the mod-m Moore space, and the two descriptions agree through the plus-construction zeroth space (K-book Definition IV.2.4, p.280). Negative groups vanish for connective K, and degree zero is K₀(R)/m. Preserve the inclusion map a ↦ (m′/m)a separately from reduction; their Bockstein squares have different multipliers (K-book IV.2.4–2.5, pp.280–281; PDF288–289). *Needs:* coefficient cofibres and the functor K.

For a commutative ring R, construct products for m = ℓ^ν outside {2,3,4,8} using multiplicative Moore spectra: K(R;ℤ/ℓ^ν) is then a homotopy associative and homotopy commutative ring spectrum, K_*(R;ℤ/ℓ^ν) is graded commutative and natural in R, and reduction K_*(R) → K_*(R;ℤ/ℓ^ν) is a ring homomorphism. Add the products supplied by Browder for every ℓ^ν, including 2, 3, 4 and 8, when positive even and negative homotopy vanish, in particular for K(𝔽q). For composite m whose prime-power factors all lie outside {2,3,4,8}, use the coprime decomposition to define the product on K_*(R;ℤ/m); no multiplication is descended from a larger modulus. Record associativity, unit, graded symmetry and naturality at the exact multiplicative level actually constructed; an arbitrary cofiber is not an Eilenberg–Mac Lane module (K-book IV.2, Products and Theorem 2.8/Scholium 2.8.1, pp.281–282).

**Checks.**

- For m = 1 the spectrum and all coefficient groups are zero.
- K₁(𝔽₅; ℤ/4) = ℤ/4, and degree zero agrees with the supplied dimension equivalence modulo 4.
- K₂(𝔽₃; ℤ/2) = ℤ/2 although integral K₂(𝔽₃) = 0; tensoring the integral group gives the wrong answer.
- K₂(ℤ; ℤ/2) = ℤ/4. This detects the false assertion that every coefficient group is a ℤ/m-module (K-book Example IV.2.5.1, p.280).

### 1.2 Bott classes

For a commutative ring R, construct `bott ω` ∈ K₂(R;ℤ/m) for a root ω ∈ R× of exact order m ≥ 2 using the Moore-space map P²(ℤ/m) → Bμₘ classifying 1 ↦ ω and then Bμₘ → BGL₁(R) → BGL(R)⁺; it depends on ω alone, not on a splitting. Its Bockstein is [ω]. Extend the construction to all μₘ when discussing additivity, retain naturality only with the appropriate image-root hypothesis, and prove compatibility with coefficient reduction and compatible roots. Any other Bockstein lift differs by K₂(R)/m. The map ω ↦ βω is additive when m is not congruent to 2 modulo 4; unrestricted additivity is false (K-book IV.2.5.2–2.5.3 and Exercise 2.4(b), pp.280–281,284). *Needs:* §1.1 and the plus model.

**Checks.**

- For ω = 2 in 𝔽₅× and m = 4, β₂ generates K₂(𝔽₅; ℤ/4), as its Bockstein generates 𝔽₅×.
- For ℤ and m = 2, β₋₁ has order four and 2β₋₁ is the image of {−1,−1}; additivity on μ₂ would incorrectly kill this double.
- Over a field of characteristic two there is no root of exact order two. Over 𝔽₃ the corresponding coefficient Bott class exists and has order two.
- The determinant of the Bockstein is exactly ω, rather than ω⁻¹.

### 1.3 Profinite changes of the supplied Brauer comparison

Fix an embedding ι:𝔽̄p×→ℂ×. For a second embedding ι′=ι∘[u], u∈∏_(ℓ≠p)ℤℓ×, compare the supplied virtual Brauer classes and stable Quillen maps at every prime ℓ≠p through `completedAdams ℓ uℓ`. Require the comparison of maps and their Frobenius homotopies, not merely equality of the induced abstract cyclic groups. At a fixed finite group, u reduces modulo the exponent of the p-regular eigenvalues; the character is the sum of the lifted eigenvalues of the semisimple part. For a p-element this is dimension. These finite restrictions determine the completed comparison using §0.1. This extends the supplied standard lift's fixed-embedding comparison to all prime-to-p profinite embedding changes (Haine Definitions 6.1–6.3 and Construction 6.11 pp.10–11; K-book IV.1.12 p.269).

**API.** Identity and composition in u, compatibility with finite-rank restriction and stabilization, virtual subtraction of rank, determinant, finite coefficients and the plus/Q identification. For representations other than the standard one consume the same Brauer-character construction from GeneralAlgebraicKTheory; no separate general character theory is introduced here. At the residue prime the positive finite-field K-groups have zero completion, so no unit operation ψ^up on p-completed KU is assigned to the prime-to-p embedding parameter.

**Checks.**

- At rank one over 𝔽₅ a change u≡3 modulo four sends the lifted unit 2 to its cube; determinant detects this change.
- Over GL₂(𝔽₃), a unipotent element has Brauer trace 2, while −I has trace −2. Lifting eigenvalues of the full Jordan matrix as an honest U(2)-representation is not the construction.
- At the trivial group, and on p-elements, the reduced rank-zero trace is zero; stabilization adds and then cancels one trivial line.
- A profinite unit can have unrelated components at ℓ=3 and ℓ=5. No single integer exponent is required to represent it on every root of unity at once.

### 1.4 Normalized classes on the supplied finite-field fibre

For ℓ≠p let r be the order of q in 𝔽ℓ×. Refine the supplied finite-field cohomology comparison by specifying its generators. Use §0.3 on the path-space pullback over BU×BU. The Koszul calculation puts c_(jr) in Tor degree (0,2jr) and its odd partner in (−1,2jr), total degree 2jr−1. Since the algebra is generated in columns zero and minus one, multiplicativity forces all higher differentials to vanish. For odd ℓ graded commutativity also kills odd squares; at ℓ=2 only the associated graded/additive description follows without a separate extension argument (Mestel Theorems 19–20 pp.15–16).

Normalize the odd class by the relative integral Chern difference in the mapping-cylinder model: define `normalizedOddChern j` in H^(2jr−1)(FPsi q;ℤ/(q^(jr)−1)) with Bockstein the pullback of the integral universal Chern class c̃_(jr). Its mod-ℓ reduction is e_(jr). Supply the relative cocycle construction, pullback naturality, coefficient changes, and agreement with the generators used by the supplied Quillen map. Merely choosing a nonzero element of the exterior factor does not fix this normalization (Mestel Definition 24 p.20 and Theorem 30 p.25). The resulting odd-prime ring description is the polynomial algebra in c_(jr) tensored with the exterior algebra in e_(jr); its detection and stable equivalence are consumed from GeneralAlgebraicKTheory §13.8b, rather than proved a second time here.

**Checks.**

- For q=4, ℓ=3, r=1 the degree-one normalized class has Bockstein of order three. Its negative has the opposite Bockstein.
- For q=2, ℓ=3, r=2 the first odd class has degree three and H¹=0.
- For q=2, ℓ=7, r=3 the first odd class has degree five; r, not ℓ alone, determines the indexing.
- The supplied stable defining-characteristic vanishing is not a finite-rank statement: H₁(GL₂(𝔽₂);𝔽₂)≠0. It cannot be substituted for a hypothesis of the pullback computation.

### 1.5 Adams, Galois action, restriction and transfer

For every commutative 𝔽p-algebra A and n≥1 prove `frobenius_eq_adams`: scalar extension along absolute Frobenius induces ψᵖ on Kₙ(A). Transport the supplier's identity on exact representation rings through Hiller's genuine-map universality and uniqueness. For every perfect commutative 𝔽p-algebra A prove `perfect_positiveK_uniqueDivisible`: multiplication by p on Kₙ(A), n≥1, is an automorphism; perfect fields are a specialization. Frobenius is an automorphism, and the supplied additive λᵖ satisfies ψᵖ=(−1)^(p−1)pλᵖ. Commutation of λᵖ with integer multiplication gives both injectivity and surjectivity of multiplication by p. The Frobenius/Adams equality also holds on [X,BGL(A)⁺] for pointed CW spaces X by the same universality. Require naturality in perfect-algebra maps and compatibility with coefficient Bocksteins; do not extend this conclusion to K₀. For finite fields, under the supplied equivalence of BGL(𝔽q)⁺ with the fibre of ψ^q−1, absolute Frobenius and the Adams operation ψ^p on that fibre induce the same maps on homotopy groups; Frobenius therefore acts by p^i on K₂ᵢ₋₁(𝔽q), every automorphism Φ^a of 𝔽q acts by p^(ai), and ψ^k acts by k^i. In particular, for q = p^f, ψ^q = (ψ^p)^f = (Φ^f)_* is the identity on Kₙ(𝔽q), n ≥ 1, and on [X,BGL(𝔽q)⁺]. This identification is through the Brauer comparison and universality, rather than an arbitrary automorphism of a cyclic group (K-book IV.5.5.1–5.6 p.314,5.7–5.9.2 pp.315–316; Haine Theorem 3.1(c) p.5).

Define `finiteFieldRes` and `finiteFieldTransfer` by extension and restriction of scalars for 𝔽q ⊂ 𝔽_(q^d), d ≥ 1. Their API includes identities, composition in towers, agreement of plus/Q transfers independently of the chosen basis, Galois invariance, projection formulas, and compatibility with coefficients and Bockstein. Prove tr·res = d and res·tr = ∑g; the algebraic input is S⊗_R S ≃ ∏g S, x⊗y ↦ (x·g(y))_g, with the factor maps given by the actual Galois embeddings, and its consequence that S⊗_R V ≅ ⊕_g g*V naturally for every S-vector space V, where g*V is V with S acting through g (K-book IV.1.1.3 p.261, IV.6.3.2 p.320 and Exercise IV.6.13 p.327).

For i ≥ 1 restriction on K₂ᵢ₋₁ is injective onto Galois invariants and transfer is onto. With compatible choices of cyclic generators, restriction is multiplication by (q^(di)−1)/(q^i−1), and transfer is reduction modulo q^i−1. On K₂ᵢ₋₁(𝔽_(q^d)) ≅ ℤ/(q^(di)−1) the j-th power of the arithmetic q-Frobenius acts by q^(ij), 0 ≤ j < d. Hence the Galois invariants are the elements killed by q^i−1, the unique subgroup of order q^i−1, and ∑g acts by 1+q^i+⋯+q^(i(d−1)) = (q^(di)−1)/(q^i−1). These formulas express the canonical maps but do not choose canonical generators. In degree zero restriction is identity and transfer multiplication by d, so the transfer-surjectivity assertion is explicitly positive-degree (K-book Corollary IV.1.13 p.269). All products of two positive integral classes vanish, by parity; degree-zero integer multiplication remains (Remark IV.1.13.1 p.269). Agreement with determinant, the field norm and the existing Milnor K₂ calculation is a comparison target, rather than a new determinant or symbol theorem.

**Checks.**

- For 𝔽₂ ⊂ 𝔽₄ in degree three, res: ℤ/3 → ℤ/15 has image 5ℤ/15, tr·res = 2 and res·tr = 5 = 1+4. Restriction is not onto and transfer is not injective.
- For 𝔽₃ ⊂ 𝔽₉ in degree one, transfer is x ↦ x⁴ and is onto; res·tr is 1+Frob₃ on the multiplicative group.
- The identity extension gives both identity maps. A degree-two extension gives multiplication by 2 on K₀ transfer, which is not onto ℤ.
- K₁(𝔽₃)·K₁(𝔽₃) lands in zero K₂, whereas 2 ∈ K₀ acts by ordinary doubling.
- For F=𝔽₄, Frobenius squares units and multiplication by 2 on K₁(F)=ℤ/3 is invertible; its inverse is also multiplication by 2. For a perfect field of characteristic two the sign in ψ²=−2λ² remains an additive integer sign.
- For the imperfect field 𝔽p(t), t has no p-th root, so Frobenius on K₁ is not onto. For any field K₀=ℤ, multiplication by p is not onto. Both perfectness and positive degree are essential. The zero algebra has zero positive K-groups and satisfies the perfect-algebra statement; a nonfield perfect algebra such as 𝔽p[x^(1/p^∞)] is included as well.

### 1.6 Coefficients, algebraic closure and derived completion

For m ≥ 1 and i ≥ 1 deduce K₂ᵢ₋₁(𝔽q; ℤ/m) ≃ K₂ᵢ₋₁(𝔽q)/m ≃ ℤ/gcd(m,q^i−1) and, through the Bockstein, K₂ᵢ(𝔽q; ℤ/m) ≃ ₘK₂ᵢ₋₁(𝔽q) ≃ ℤ/gcd(m,q^i−1); K₀(𝔽q;ℤ/m) = ℤ/m. In particular Kₙ(𝔽q;ℤ/p^ν) = 0 for n ≥ 1, and Kₙ(𝔽q;ℤ/m) ≃ ℤ/m for every n ≥ 0 when m | q−1. For a prime power ℓ^ν dividing q−1 choose a generator ζ of 𝔽q× and a primitive ℓ^ν-th root of unity ω; let ζ also denote the reduction of [ζ] in K₁(𝔽q;ℤ/ℓ^ν) = 𝔽q×/ℓ^ν and put β = β_ω. The finite-field product structure, with Browder's refinement where small Moore moduli require it, gives the graded ring (ℤ/ℓ^ν)[β,ζ]/(ζ²), and the Brauer map ρ: BGL(𝔽q)⁺ → BU carries its even part (ℤ/ℓ^ν)[β] isomorphically, as a ring, onto ⊕ₙ π₂ₙ(BU;ℤ/ℓ^ν). The presentation depends on ζ and ω; the ring does not. For composite m | q−1 the coprime decomposition of §1.1, with Browder's products on each factor, gives the ring (ℤ/m)[β,ζ]/(ζ²) (K-book IV.1.13.1 p.269, IV.2.8 p.282). Do not infer a canonical product from the additive Bockstein sequence alone.

Take filtered colimits to obtain, for i ≥ 1, K₂ᵢ(𝔽̄p) = 0 and K₂ᵢ₋₁(𝔽̄p) = colim_ν K₂ᵢ₋₁(𝔽_(p^ν)), a divisible torsion group isomorphic to ⊕_(ℓ≠p)ℚℓ/ℤℓ ≅ 𝔽̄p×. Absolute Frobenius acts on it by p^i, and there is a Γ-equivariant isomorphism with the Tate twist ⊕_(ℓ≠p)ℚℓ/ℤℓ(i), Γ = Gal(𝔽̄p/𝔽p); every abelian-group isomorphism between these two groups is Γ-equivariant, because the automorphisms of ⊕_(ℓ≠p)ℚℓ/ℤℓ form the commutative group ∏_(ℓ≠p)ℤℓ×, which contains the Frobenius scalar p^i. For every 𝔽q ⊂ 𝔽̄p the map Kₙ(𝔽q) → Kₙ(𝔽̄p)^(Gal(𝔽̄p/𝔽q)) is an isomorphism for n ≥ 1. For m ≥ 2 with p ∤ m, Kₙ(𝔽̄p;ℤ/m) is ℤ/m for even n ≥ 0 and zero for odd n; a primitive m-th root of unity ω determines a graded ring isomorphism (ℤ/m)[β] ≃ K_*(𝔽̄p;ℤ/m), β ↦ β_ω, using the prime-power products and their Chinese-remainder product, and g ∈ Γ with g(ω) = ω^a acts on K₂ᵢ(𝔽̄p;ℤ/m) ≃ ₘK₂ᵢ₋₁(𝔽̄p) ≃ μ_m^⊗i by a^i. For p-power coefficients all positive groups vanish (K-book VI.1, finite-characteristic calculation and Corollary VI.1.3.1, p.465; proof of Proposition VI.1.7.1, p.468; Haine Corollary 3.1.1, p.5).

Define `completed R ℓ` as the homotopy limit of coefficient spectra, `toCompleted` as its natural map, and `completedReduce ν` as projection. Its API includes naturality, transfer, products of rings, reduction modulo ℓ^ν and the Milnor exact sequence with lim¹ Kₙ₊₁(R; ℤ/ℓ^ν). Negative homotopy vanishes here because the connective degree-zero reduction tower is surjective. Finite coefficient groups ensure the relevant lim¹ vanishes; finite generation of adjacent integral K-groups gives the usual tensor description (K-book IV.2.9 p.282; Handbook item 59 p.164). *Needs:* §§1.1–1.5 and completion foundations.

**Checks.**

- At the characteristic prime, K₀(𝔽q; ℤₚ) = ℤₚ and all positive completed groups vanish; for ℓ ≠ p the odd answer is the ℓ-primary part of ℤ/(q^i−1).
- The zero ring has zero completed spectrum. A field has completed K₀ = ℤₗ; surjectivity of its K₁ coefficient transition maps kills the possible degree-zero lim¹.
- K₂(ℂ; ℤₗ) = ℤₗ although integral K₂(ℂ) is uniquely divisible and limν K₂(ℂ)/ℓ^ν = 0. The missing term is the Tate module of K₁(ℂ), not an error in the integral group (K-book VI.1.1,1.3 pp.463–465).
- K₂(𝔽₃; ℤ/2) survives although integral positive even groups vanish, while K₂(𝔽̄₃; ℤ/3) is zero.

### 1.7 Perfect characteristic-two comparisons

For a perfect characteristic-two field k, extend the finite-field homotopy-limit supplier to arbitrary perfect k: use unique 2-divisibility of positive K-groups from §1.5, and surjective Frobenius to identify every one-dimensional symmetric bilinear form with ⟨1⟩. Prove 𝔽₂ → k induces an equivalence K(𝔽₂)^∧₂ ≃ K(k)^∧₂, compatible with symmetric duality, with each side Hℤ₂; this concerns derived 2-completion and asserts nothing about integral positive K-groups. Prove it also induces an integral equivalence L(𝔽₂;Qˢ) ≃ L(k;Qˢ): on degree-zero symmetric Witt groups it is rank modulo 2, sending ⟨1⟩ to ⟨1⟩, all odd L-groups vanish and the even ones are ℤ/2. Then deduce the shifted integral GW homotopy-limit equivalence for every integer shift. Retain the coefficient line, its involution and shift until applying metabolic transport. This extension uses symmetric bilinear forms, not quadratic Arf-invariant theory (III Remark 3.1.6 pp.51–52; II Corollary 4.4.13 p.107). *Needs:* the supplied finite-field theorem, §1.6, the finite-field hermitian supplier and the precise Poincaré/homotopy-limit contracts.

For q=2^f, f≥1, consume HermitianKTheoryOfPoincareCategories §7.10's Check that Ξ is an E∞ equivalence for 𝔽_(2^f), with both homotopy rings identified with 𝔽₂[x,x⁻¹], |x|=2. Its unit and degree-two normalization are part of that supplied comparison (Calmès et al. III Proposition 3.1.4 pp.50–51 and Remark 3.1.5 p.51).

Use HermitianKTheoryOfPoincareCategories §7.11's `multiplicative-l-tate-base-change` for the coefficient-module actions, scalar extension and coherent naturality of this comparison. In particular every inclusion 𝔽_(2^f)→𝔽_(2^(fd)), d≥1, preserves the unit and the uniquely normalized degree-two class, and hence its inverse. Retain the coefficient line and every shift for module comparisons; the unital ring statement above concerns Qˢ itself. Forgetting multiplication and module structure recovers the supplied additive Ξ and fundamental fibre sequence, so these refinements are compatible with the perfect-field and shifted comparisons in the preceding paragraph.

**Checks.**

- Over 𝔽₂ the unit form maps to the nonzero element, while a hyperbolic form maps to zero.
- Over 𝔽₄, K₁ = ℤ/3 is nonzero integrally although it disappears on 2-completion; the rank assertion is not an integral K-equivalence.
- For an arbitrary perfect characteristic-two k the argument uses Frobenius/Adams, not finite-field cardinality.
- Odd q is outside the full-spectrum assertion obtained by this even-field proof.
- The trace transfer restricts scalars and composes the pairing with the field trace: for 𝔽₄=𝔽₂[α]/(α²+α+1), the transferred unit line has matrix [[0,1],[1,1]] on (1,α), which is metabolic and gives zero in the Witt group.

### 1.8 Universal finite-coefficient Chern maps before rigidity

For a commutative ring A with ℓ invertible, m=ℓ^ν, ν≥1, construct universal equivariant classes cᵢ(ρ)∈H²ⁱ_et(Spec A,G;μ_m^⊗i) for a representation ρ:G→GL_N(A) of a discrete group. Use the universal vector bundle on the simplicial classifying scheme, its étale projective-bundle relation and the splitting principle. Prove rank vanishing, normalization c₁ of a line bundle as its Kummer class, pullback in A and G, the Whitney formula and stabilization by a trivial line. These are universal cohomology classes; no étale comparison theorem for higher algebraic K-theory enters their construction.

Define `earlyChern i j` on K_(2i−j)(A;ℤ/m), 2i−j≥2 and j≥0, by applying the mod-m Moore-Hurewicz map for BGL(A)⁺ and then slant evaluation of the stable standard-representation class on group homology. The Moore map is formed from a fixed Moore-space model and its top-dimensional mod-m homology class; prove compatibility with plus acyclicity, stabilization and maps of coefficients. For degree one use determinant and Kummer as `earlyChern 1 1`. The universal-class/slant construction and its naturality are WeibelChern §2.1, equation (2.1), Proposition 2.1.1, pp.8–9; the Moore and product comparison is §§1.4–1.6, pp.4–8.

**API.** Ring-map naturality, coefficient inclusion and reduction, comparison with integral Chern operations, restriction in G, Kummer at (i,j)=(1,1), Bott/Bockstein and mixed integral/coefficient product formulas. Prove additivity for degree n≠2 or odd m. At n=2 and even m retain the quadratic correction from the two Bocksteins rather than asserting a group homomorphism in all degrees (WeibelChern §§2.2–2.8 pp.9–12, especially Proposition 2.4 p.10).

Prove `chern_unit_bott`: for a∈A× and a primitive m-th root ζ, the mixed product [a]β_ζ has c_(2,1)=−κ(a)⊗ζ, including m=2. This product uses an integral degree-one factor; it does not require a product of two arbitrary mod-two Bott classes. For other weights keep the source's product hypotheses and its mod-two correction terms (WeibelChern Theorem 3.2 p.13 and Theorem 3.3 pp.14–15).

For F=𝔽q, ℓ∤q, construct `finiteFieldEdgeOne i ν : K_(2i−1)(F;ℤ/ℓ^ν) ≃ H¹(F,ℤ/ℓ^ν(i))`, i≥1, from the supplied Brauer fibre and the two-term Frobenius cochain complex with differential q^i−1. Require its even H⁰/Bockstein companion and naturality in finite fields, restriction, transfer and coefficients. The geometric Bott generator fixes the twist: arithmetic Frobenius acts by q^i. Where μ_(ℓ^ν)⊂F, normalize the edge of [a]β_ζ^(i−1) to κ(a)⊗ζ^(⊗(i−1)), with the supplied finite-field products at the small Moore moduli. The unit a can be chosen to generate F×/(F×)^(ℓ^ν); it is not required to equal ζ.

Prove `chern_edge_finiteField`: `earlyChern i 1` is (−1)^(i−1)(i−1)! times this edge. Use the universal product calculation when roots lie in F, coefficient/Bockstein compatibility for general F, and the supplied Quillen equivalence. The factorial need not be invertible. This proves the finite-field comparison independently of motivic coniveau, descent or regulator constructions (WeibelChern Proposition 5.1 and its proof p.24; Haine Theorem 3.1(c) p.5). §6.6 proves that its local descent edge restricts to this normalization; its local isomorphism theorem is a separate target.

**Checks.**

- For i=1, c_(1,1) is Kummer and the multiplier is +1. A trivial representation has zero positive Chern classes; adding a trivial line changes neither stable class nor slant operation.
- For F=𝔽₇, m=3, ζ=2 and a=2, weight two gives −κ(2)⊗2, a nonzero element of order three. This detects the sign.
- For F=𝔽₃, m=2, weight three has multiplier 2!=0, although both edge groups have order two. A Chern operation is not an edge isomorphism in every weight.
- For F=𝔽₅, m=2, take a=2 and ζ=−1. The Kummer class of a is nonzero; that of ζ is zero. Treating a primitive coefficient root as a generator of F×/(F×)^m fails.
- At A=ℚ₂, m=2, the Bott class has order four with 2β=red{−1,−1}. Neither universal additivity in degree two nor a globally defined square β² is inferred from the weight-two mixed-product formula.

*Needs:* §§1.1–1.2, the supplied finite-field Brauer comparison, §0.2, étale projective-bundle and Kummer cohomology, plus acyclicity and Moore-space homology. The low-dimensional slant, Moore-Hurewicz and equivariant universal-class comparisons are targets here. Local rigidity and motivic descent are downstream.

### 1.9 Finite-rank symplectic degree three

Let q be odd and r ≥ 1. Use SU(2) = Sp(1) = S³, the compact-group sphere quotients and stabilization to prove Sp(r) → SU(2r) induces an isomorphism on H³(−;𝔽₂). Prove the Lang/geometric étale comparison carries this to the finite classical groups. Establish that the integral H₂ of the relevant Sp and SL groups has odd order. It need not be zero: it vanishes except in rank one at q = 9, where H₂(SL₂(𝔽₉);ℤ) ≅ ℤ/3. The homology UCT then identifies H₃(−;ℤ)/2 with H₃(−;𝔽₂), naturally, and gives the stabilization-compatible order-two comparison (Abdurrahman–Venkatesh Lemma 2.7.1 and proof, pp.16–17).

Construct `langTorsor` for a connected smooth affine group G/𝔽q: L(g)=g⁻¹Frob_q(g) is a finite étale torsor for left translation by G(𝔽q). Prove the torsor equivalence, functoriality for group homomorphisms over 𝔽q and its classifying map G_(𝔽̄q)→B(G(𝔽q)). For coefficients 𝔽ℓ with ℓ≠char(𝔽q), construct the corresponding diagram of classifying topoi, or its prime-to-characteristic étale homotopy model, as the pullback of the diagonal BG→BG×BG along (id,BFrob_q). The resulting Lang fibration G→B(G(𝔽q))→BG has a natural multiplicative cohomology spectral sequence. Prove the required base-change comparison using the Borel/flag decomposition, rather than assume properness of the affine group. This is an additional group-scheme comparison target, not a consequence of field Galois cohomology alone (QuillenICM §2, pp.48–50, equations(1)–(3); AV Lemma 2.7.1 proof, pp.16–17).

For G=Sp₂ᵣ or SL₂ᵣ over 𝔽q with q odd and r≥1, prove `langDegreeThreeComparison`: H^j_et(BG;𝔽₂)=0 for 1≤j≤3, the geometric degree-three group and the degree-four universal Chern group are each one-dimensional, and the only possible low-degree transgression is Frob_q*−id, multiplication by q²−1 on c₂. Fix its sign by this convention before reduction modulo two. The edge map H³(G(𝔽q);𝔽₂)→H³_et(G_(𝔽̄q);𝔽₂) is consequently an isomorphism for odd q, compatible with Sp₂ᵣ→SL₂ᵣ and stabilization. Construct the geometric-to-compact comparison through flag varieties, their proper smooth base change and the associated bundle/transgression sequences. Under that comparison Sp(r)→SU(2r) induces the nonzero pullback in degree three. This identifies the actual map, rather than only the dimensions (AV proof of Lemma 2.7.1, equation (2.10), pp.16–17).

**Lang API and checks.** Torsor base change, the pullback square, edge-map naturality and transgression normalization must commute with the group inclusions. For r=1 the Sp₂=SL₂ map is identity; rank zero has no degree-three class and is excluded. For q=3 the integral transgression is 8c₂ and for q=5 it is 24c₂, both zero modulo two; replacing q² by q changes the integral comparison. The Lang map on Gₘ is x↦x^(q−1), an étale μ_(q−1)-torsor, illustrating why connectedness and the arithmetic Frobenius are essential. A disconnected constant group need not have surjective Lang map.

Identify BSL(𝔽q)⁺, the homotopy fibre of determinant on BGL(𝔽q)⁺, with its universal cover; the inclusion induces πₙ(BSL(𝔽q)⁺) ≅ Kₙ(𝔽q) for n ≥ 2, BSL(𝔽q) → BSL(𝔽q)⁺ is an integral homology isomorphism, and BSL(𝔽q)⁺ is 2-connected because K₂(𝔽q) = 0. Hurewicz and the plus map identify K₃(𝔽q) with H₃(SL(𝔽q);ℤ), naturally in finite-field embeddings. Bockstein identifies K₃/2 with K₃(−;ℤ/2), and K₂(−;ℤ/2) with K₁[2]. For every a ∈ 𝔽q× compute

```text
c₂,₁([a]·β₋₁) = −κ(a) ⊗ (−1)  in H¹(𝔽q, μ₂⊗²).
```

Here κ is Kummer, and the second −1 is the nontrivial element of μ₂, not the square class of −1. Under μ₂^⊗2 ≅ μ₂ the value is κ(a), since signs agree modulo two; it is nonzero exactly when a is a nonsquare. Weibel's higher Chern formula gives an isomorphism for i = 2 and modulus two: its multiplier is −(i−1)! = −1. Combined with the previous identifications, it yields an order-two étale Chern isomorphism for finite-rank symplectic H₃, compatible with stabilization (Weibel, *Étale Chern classes at the prime 2*, Theorems 3.2–3.3 pp.13–15 and Proposition 5.1 p.24; Abdurrahman–Venkatesh Lemma 2.7.2 p.17). The early Chern construction and its product formula are §1.8, before rigidity or local descent.

**Checks.**

- For 𝔽₅ take a = 2: its Kummer class is nonzero even though −1 is a square.
- Replacing a by −1 would incorrectly give zero.
- For 𝔽₃ use a = −1, which is a nonsquare there.
- Rank zero has zero H₃ and is excluded.
- The exceptional multiplier H₂(SL₂(𝔽₉);ℤ) ≅ ℤ/3 is handled by odd order, not by asserting universal vanishing. At q = 3 the group SL₂(𝔽₃) is not perfect, yet its H₂ vanishes, since it acts freely on S³; only H₂, not H₁, enters the coefficient comparison.

*Needs:* §§1.1–1.6, §1.8's independent early Chern construction, compact-classical and Lang comparison, and group-homology UCT.

### Examples

The groups in degrees one, two and three are respectively 0,0,ℤ/3 for 𝔽₂ and ℤ/2,0,ℤ/8 for 𝔽₃. These force the fibre model to retain odd homotopy even when determinant is trivial. Over 𝔽₅, finite coefficients modulo four have two adjacent positive groups ℤ/4; the integral even group remains zero. Under 𝔽₂ ⊂ 𝔽₄, the degree-three transfer/restriction pair distinguishes the geometric-series multiplier 5 from the degree 2.

### Dependencies

This layer consumes the foundational K, plus, coefficient, KU/Adams, character and group-cohomology contracts stated above. The even-field hermitian application additionally consumes the Poincaré square and shifted symmetric theory. The finite-rank Sp application consumes the Lang comparison and the independent early Chern construction; it does not consume Layer 6's local-field computation.

## Layer 2: henselian rings away from the residue characteristic

### 2.1 Rigidity for henselian pairs

For a commutative henselian pair (R,I), with I in the Jacobson radical, and m ≥ 1 invertible in R, prove reduction K(R;ℤ/m) → K(R/I;ℤ/m) is an equivalence. Invertibility can be checked in R/I. Deduce mod-m acyclicity of the stable congruence group GL(I). State the result for connective K-theory; arbitrary negative K-groups are not included (Gabber rigidity, K-book IV.2.10 p.283; Clausen–Mathew–Morrow Theorem 1.4 p.3 and Remark 4.37 pp.36–37). *Needs:* Layer 1 coefficient functors, henselian pairs, the congruence-group comparison, and the rigidity proof.

Specialize to any henselian local ring O with residue 𝔽q and p ∤ m. Reduction is the equivalence used in every identification, and gives degree zero ℤ/m and positive adjacent groups ℤ/gcd(m,q^i−1). Taking derived ℓ-completion, ℓ ≠ p, gives ℤℓ in degree zero, ℤ/(q^i−1)_ℓ in degree 2i−1 and zero in degree 2i. The limit is taken on spectra, with the Milnor term justified (K-book V.6.10 p.415; Handbook Proposition 58 and item 59 p.164). Neither completeness nor a DVR hypothesis is needed for this specialization.

**Checks.**

- For R = R/I a field the equivalence is identity; for I = 0 this also tests all coefficient maps.
- For ℤ₅ and m = 4 the first two positive groups are both ℤ/4.
- Taking m = p is outside the theorem: K₁(ℤₚ;ℤ/p) retains principal units, whereas K₁(𝔽p;ℤ/p) is zero.
- A unit ideal in a nonzero ring is not a henselian pair under the Jacobson-radical hypothesis.

### 2.2 Localization, signs and Bocksteins

**Localization and coefficient boundaries** (`localizationBockstein`). For a DVR O ⊂ L with residue k, specialize the supplied localization sequence, retaining the actual dévissage map K(k) → K(O). Its K₀ map i_* is zero, and B₁:K₁(L) → K₀(k) is the normalized valuation with B₁[π] = 1, by GeneralAlgebraicKTheory §8.12. At the spectrum level use the raw boundary B of its §8.13. In homotopy degree n ≥ 1 set ∂ₙ = δₙ = (−1)^(n−1)Bₙ. Establish the coefficient sequence and mixed pairing K_*(O;ℤ/m) ⊗ K_*(L) → K_*(L;ℤ/m) with this left-linear boundary: ∂(a·y) = r(a)·∂y for a coefficient class a in the first factor; placing an integral degree-j class on the right gives the sign (−1)^j. Reduction commutes with ∂. For the ordinary coefficient Bockstein and n ≥ 2 the raw two-boundary square gives B_(n−1) β_(m,n) = −β_(m,n−1) Bₙ, so

```text
∂_(n−1) β_(m,n) = (−1)^(n−2) B_(n−1) β_(m,n)
                 = (−1)^(n−1) β_(m,n−1) Bₙ
                 = β_(m,n−1) ∂ₙ.
```

Thus the adapted boundary commutes with Bockstein. The spectrum-level square retains its suspension sign (K-book IV.2.4–2.5 pp.280–281, V.6.1.1–1.2 p.406, V.6.6 pp.409–410 and V.6.9.2 pp.414–415; GeneralAlgebraicKTheory §8.13). *Needs:* localization, products and §1.1.

**Checks.**

- `localizationBockstein_orderThree`: take O = 𝔽₇[[t]], L = 𝔽₇((t)), m = 3 and the constant-field Bott class b with β₃(b) = [2]. For x = b·[t], the mixed pairing gives ∂₃x = b and β₃x = {2,t}. Hence ∂₂β₃x = 2 = β₃∂₃x in 𝔽₇×. The negative value would be 4, which is distinct. No product of two mod-three coefficient classes is used.
- For any uniformizer π, ∂₁ red[π] = 1 in K₀(k;ℤ/m) = ℤ/m; the sign adapter is +1 in this degree.
- Over residue 𝔽₇, ∂₂{2,π} = 2 and ∂₂{π,2} = 4; the raw B₂ has the opposite values.
- Modulo two the two signs coincide on classes of order two, so that modulus alone cannot distinguish the Bockstein laws.

For a henselian DVR and m invertible in k, prove exactness

```text
0 → Kₙ(O;ℤ/m) → Kₙ(L;ℤ/m) → Kₙ₋₁(k;ℤ/m) → 0  (n ≥ 1).
```

Its section is sπ(a) = r⁻¹(a)·[π]. This uses the coefficient/integral mixed pairing, so no small-modulus ring structure is assumed. For n = 0 the map is an isomorphism. Exactness without this explicit rigidity section holds for a general DVR with m invertible in k, by passage to its henselization (K-book Theorem V.6.9.1 pp.413–414).

### 2.3 Integral torsion and the canonical even splitting

For a henselian local O with finite residue 𝔽q and every ℓ ≠ p, use rigidity in two adjacent degrees and Bockstein to prove reduction identifies the ℓ^ν-torsion and the quotients modulo ℓ^ν in K₂ᵢ₋₁. Prove K₂ᵢ(O), i ≥ 1, is uniquely ℓ-divisible, checking injectivity as well as surjectivity of multiplication by ℓ. The prime-to-p torsion subgroup T₂ᵢ₋₁ of K₂ᵢ₋₁(O) maps isomorphically to K₂ᵢ₋₁(k) ≅ ℤ/(q^i−1); in degree one T₁ = μ_(q−1)(O), the Teichmüller roots of unity. Its canonical complement is the kernel of reduction and is a ℤ_(p)-module; no uniformizer or generator enters this decomposition. These are integral conclusions obtained from divisibility arguments, not from equating integral and completed carriers (Handbook Proposition 58 p.164; K-book VI.7.2–7.3 pp.508–509).

If O is a henselian DVR, prove

```text
0 → K₂ᵢ(O) → K₂ᵢ(L) → K₂ᵢ₋₁(k) → 0.
```

Lift the right group through the prime-to-p torsion of O and multiply by [π]. In the coefficient-to-integral square use ∂β = β∂ and β(b·[π]) = β(b)·[π]; these fix the positive sign of this section. The resulting section is independent of π: changing π multiplies by an integral unit class, whose product with the prime-to-p torsion class is finite prime-to-p torsion in the uniquely prime-to-p divisible even group, hence zero. Its image is exactly the prime-to-p torsion of K₂ᵢ(L). This gives the canonical internal decomposition K₂ᵢ(L) = K₂ᵢ(O) ⊕ K₂ᵢ(L)_(p′). For i = 1 the section is ū ↦ {ω(ū),π}, with ω the Teichmüller lift. For i ≥ 2 prove K₂ᵢ₋₁(O) → K₂ᵢ₋₁(L) is an isomorphism. For i = 1 retain instead 0 → O× → L× → ℤ → 0 (K-book V.6.9.2 p.414; Handbook Proposition 58 p.164). *Needs:* §§2.1–2.2 and Layer 1's finite residue terms.

### 2.4 Uniformizers and the coefficient algebra

For π′ = uπ prove the coefficient sections satisfy sπ′(a) − sπ(a) = r⁻¹(a)·[u]. The valuation section changes by u in degree one, whereas the integral positive-even torsion section of §2.3 is unchanged. For the specialization λπ(y) = ∂([π]·y), compute λπ′(y) = λπ(y) + [ū]·∂y (K-book V.6.6.4 p.410; Handbook Theorem 56 proof p.163). This formula follows from left linearity and uses precisely the specified order of factors.

If m ≥ 2 divides q−1, every positive coefficient degree of L has two copies of ℤ/m. For m = ℓ^ν outside {2,3,4,8}, construct its ring as a free K*(O;ℤ/m)-module on 1,zπ, with zπ = [π] of degree one. With β,ζ from §1.6 its basis over (ℤ/m)[β] is

```text
1, ζ, zπ, ζzπ,        ζ² = 0,        zπ² = [−1] zπ.
```

The last square is zero when q ≡ 1 modulo 2m or q is even. Keeping four basis elements corrects the two-element polynomial-base claim in K-book Proposition V.6.10, p.415. The two-element basis there is valid only over the entire residue K-ring. *Needs:* §§1.6,2.2–2.3 and the multiplicative Moore restrictions.

**Checks.**

- For L = ℚ₅, m = 4, the additive positive groups have rank two over ℤ/4, even though this modulus is excluded from the generic ring construction.
- In K₁(L;ℤ/4), changing π = 5 to 10 adds [2], which is nonzero.
- In integral K₂ the sections ū ↦ {ω(ū),5} and ū ↦ {ω(ū),10} agree.
- The equality ∂{ω(2),5} = 2 and ∂{5,ω(2)} = 3 in 𝔽₅× fixes the two-factor sign.
- For residue 𝔽₂ the prime-to-2 summands of K₁ and K₂ are zero, though K₃ and K₄ have ℤ/3; the valuation summand in K₁ remains ℤ.

### 2.5 Prime-to-p local coefficients and the e-invariant

For L the fraction field of a henselian DVR with residue 𝔽q, prove the integral prime-to-p torsion in both K₂ᵢ and K₂ᵢ₋₁ is cyclic of order q^i−1. For odd degree ≥ 3 and for the even integral complement, the remaining group is a ℤ_(p)-module. In degree one retain the valuation factor separately. For ℓ ≠ p the completed groups are ℤ/(q^i−1)_ℓ in even degrees ≥ 2 and odd degrees ≥ 3; K₁(L;ℤℓ) additionally has ℤℓ. Finite coefficient groups use the uniformizer-dependent direct sum of §§2.1–2.2; these are three separate statements (Handbook §5.6 pp.163–164; K-book VI.7.3 p.509).

For a genuine local field L and i ≠ 0, show inertia acts trivially on ℚℓ/ℤℓ(i), arithmetic Frobenius acts by q^i, and Wᵢ^(ℓ)(L) is cyclic of order (q^|i|−1)_ℓ. Negative i is allowed since q is an ℓ-adic unit. Along finite subextensions of Lˢᵉᵖ, residue fields exhaust 𝔽̄q and reduction gives an equivariant isomorphism K₂ᵢ₋₁(Lˢᵉᵖ){ℓ} ≃ ℚℓ/ℤℓ(i) for i ≥ 1. All abstract isomorphisms between these rank-one divisible torsion Galois modules commute with their scalar Galois actions. Restriction from L identifies its ℓ-primary odd torsion with the invariants, both cyclic of order (q^i−1)_ℓ, giving the local ℓ-primary e-invariant isomorphism K₂ᵢ₋₁(L){ℓ} ≅ Wᵢ^(ℓ)(L) for every ℓ ≠ p; consequently the torsion subgroup of K₂ᵢ₋₁(L) is ℤ/(q^i−1) ⊕ (a p-group) (K-book VI.1.7.1 and Exercise 1.3 pp.468–469; VI.2.3.1 pp.471–472). *Needs:* §2.3, finite-extension local arithmetic, the residue Galois sequence and §1.6. The case i = 0 has infinite invariants and is excluded from wᵢ.

### Examples

For ℚ₃, K₂(ℚ₃){2} and K₁(ℚ₃){2} are ℤ/2, but completed K₁ at 2 is ℤ₂ ⊕ ℤ/2. For 𝔽₂((t)) the entire prime-to-2 finite summand in K₂ is zero. These examples leave the residue-characteristic divisible information undecided, as required before Layer 3. The tame boundary at 5 computed above changes under swapping the inputs, while the boundary map itself never depends on a choice of uniformizer.

### Dependencies

Layer 1, the general K localization/product contracts, Gabber rigidity, henselian root lifting and the local residue/Galois suppliers. No residue-characteristic trace calculation is used in this layer.

## Layer 3: integral K₂ and Moore's theorem

### 3.0 Milnor symbols, residues and norm residue

**Milnor residue and norm supplier comparison** (`milnorResidueNorm`). Use K2SymbolsBrauer's native graded Milnor ring and field maps (§§5.4–5.8), its degree-two Matsumoto identification (§7.2), last-slot residues and specializations (§§9.11–9.18), Bass–Tate sequence and generator-independent Kato norms for every finite extension (§§10.5–10.25). The adapter `milnorResidueNorm` identifies the notation and maps in this roadmap with those exports: K₀ᴹ(F) = ℤ, K₁ᴹ(F) = F×, K₂ᴹ(F) = K₂(F), ∂ᴹ{u₁,…,uₙ₋₁,π} = {ū₁,…,ūₙ₋₁}, and N_(E/F) is the supplied norm, including for inseparable E/F. The degree-two comparison with Quillen's adapted boundary is `tameBoundary_symbol` in §3.2. The specialization supplied here is the unit-coordinate map λπᴹ; §2.4's map y ↦ ∂([π]·y) retains its stated factor order. For a discretely valued field L with residue k, n≥0 and x∈Kₙᴹ(L), write s for the product-symbol map to Quillen K-theory and prove s(λπᴹ x) = ∂(s(x)·[−π]); this specifies the specialization comparison in every degree (K-book III.7.1 pp.244–245, III.7.3–7.6.1 pp.246–249; IV.1.10.1 p.266).

Use the actual colimit maps from K2SymbolsBrauer's §10.25 [export contract](../K2SymbolsBrauer/README.md#milnor-filtered-colimits): for a filtered field system Fᵢ with colimit F, colim K_*ᴹ(Fᵢ) ≃ K_*ᴹ(F). For compatible surjective discrete valuations with value group ℤ and compatible uniformizers, this identification intertwines residues and specializations with the induced residue-field colimit maps. For finite extensions Eᵢ/Fᵢ satisfying Eᵢ ⊗_(Fᵢ) Fⱼ ≃ Eⱼ at every transition, their norms commute with the colimit maps to N_(colim Eᵢ/colim Fᵢ). Retain the supplied transitivity, projection and degree formulas, the degree-zero multiplier and the degree-one field norm on these same maps.

**Checks.**

- On {u,π} the residue is ū; on {π,u} it is ū⁻¹. The degree-two adapter uses the supplied last-slot residue without another inversion.
- On K₀ᴹ=ℤ, restriction is identity and a degree-d norm is multiplication by d; on K₁ᴹ it is the actual field norm.
- For 𝔽ₚ(t)/𝔽ₚ(tᵖ) the supplied norm sends t to tᵖ and N∘res=p. Separability is unnecessary for the degree identity.
- At the filtered union 𝔽̄ₚ = colim 𝔽_(p^d), the common colimit map gives Kₙᴹ(𝔽̄ₚ)=0 for n≥2; a symbol and its Steinberg relation already descend to a finite stage.
- For a unit u, λπᴹ{u} = {ū}, whereas ∂([π]·[u]) = −[ū]. For x={π}, λπᴹx=0 and ∂([π]·[π])=[−1].

*Needs:* K2SymbolsBrauer §§5.4–5.8, 7.2, 9.11–9.18 and 10.5–10.25's independent Milnor constructions and filtered-colimit contract; the supplied Quillen products and §2.2 for the boundary comparison.

**Differential norm residue and characteristic-p torsion** (`blochGabberKato`, `milnor_no_p_torsion`). For every field F of characteristic p and n≥0 prove dlog:Kₙᴹ(F)/p≃ν_F(n), where ν_F(n) is the kernel of 1−C⁻¹:Ωⁿ_F→Ωⁿ_F/dΩⁿ⁻¹_F for the inverse Cartier map. Construct this Cartier operator and the logarithmic length-ν extension Kₙᴹ(F)/p^ν≃W_νΩⁿ_(F,log), with the subgroup on the right generated by dlog symbols. Prove field-map and coefficient naturality and compatibility with residues. Establish divisibility of the p-torsion subgroup and then Izhboldin's theorem Kₙᴹ(F)[p]=0. Use the norm-obstruction argument P(E)=I(E) of III.7.8.1–7.8.2, starting induction at K₁ᴹ=F×, whose p-torsion is zero; its leading-coefficient specialization kills every p-torsion class. The Hilbert-90 corollary follows after this torsion theorem (K-book III.7.7.2–7.8.3 pp.251–253; Geisser–Levine Theorem 8.3 p.491 for logarithmic Witt symbols).

**Checks.**

- For a perfect field F, Ωⁿ_F=0 and Kₙᴹ(F)/p^ν=0 for n≥1, while K₀ᴹ(F)/p^ν=ℤ/p^ν.
- For F=𝔽ₚ(t), dlog t is nonzero and detects the nonzero class of t modulo p-th powers.
- For F=𝔽ₚ(s,t), dlog s∧dlog t is nonzero; p-rank one is essential to the degree-two vanishing used in §3.4.

*Needs:* `milnorResidueNorm`, absolute differentials, and CrystallineCohomology §CR.4.6's characteristic-p Witt complexes. The Cartier, differential-symbol and torsion theorems are constructed here.

### 3.0a Motivic complexes and the motivic-to-K tower

**Shared higher-cycle foundations** (`motivicCycles`). Construct `BlochCycle X r n = z_r(X,n)` for separated finite-type schemes X over an arbitrary field, r ∈ ℤ and n ≥ 0: the free abelian group on dimension-(r+n) integral closed cycles in X × Δⁿ meeting every iterated face in dimension at most r plus the face dimension. Use ordered alternating face intersections for the differential, with degree-one boundary [fiber at 1] − [fiber at 0], and flat degeneracies. Prove the simplicial identities, normalization, nilpotent invariance and finite-disjoint-union decomposition, and define `HigherChow X r n = H_n(z_r(X,*))`, zero for n<0. Identify CH_r(X,0) with the ordinary Chow group by rational-function boundaries; on pure-dimensional X of dimension d set CH^i(X,n)=HigherChow X (d−i) n, componentwise for a smooth X of mixed dimensions. For every commutative coefficient ring R, coefficients are derived tensor products with R, computed termwise by the free cycle groups. Construct proper pushforward, zero on a component whose image dimension drops, flat pullback with its relative-dimension shift, external products with shuffle signs and their base-change and projection identities (MVW Definition 17.1, Exercise 17.3, Properties 17.4 and Appendix 17A pp.135–137,143–146).

For every separated finite-type X over any field and open U=X−Z, let z_r(U,*)_X consist of cycles whose closures in X×Δⁿ remain face-admissible. Prove its inclusion into z_r(U,*) is a quasi-isomorphism, with no smoothness hypothesis on X, U or Z. Deduce the distinguished closed-open triangle z_r(Z,*) → z_r(X,*) → z_r(U,*) → z_r(Z,*)[1], with proper pushforward and open restriction as its first maps. Prove affine homotopy invariance z_r(X,*) ≃ z_(r+e)(X×𝔸^e,*) for all r∈ℤ and e≥0. Construct the face-subdivision and relative moving homotopies from the blow-up/flattening geometry, first for finite families and truncation degrees, then by filtered colimits and affine-cover descent (Levine Theorems 1.7, 1.10, 6.12, Proposition 6.14 and §7 pp.2–5,37–44; MVW Properties 17.4 pp.136–137).

For incidence moving, require the ambient target Y to be smooth, separated and of finite type over the field. For a finite family of locally closed irreducible C_j⊂Y and integers m_j≤i, require each intersection of a codimension-i cycle with C_j×F to have codimension at least m_j inside C_j×F, for every face F. Prove the good-position inclusion is a quasi-isomorphism first for affine smooth Y, including simultaneous conditions for products and composition. For a finite correspondence W:X→Y between smooth schemes, require the pulled-back cycle to meet W×F properly for every face, and define its action there by intersection and pushforward to X×Δⁿ. The support of W need only be locally equidimensional. Establish Zariski descent for both unrestricted and simultaneous-good-position complexes: stratify support projections by fiber dimension and construct relative moving homotopies preserving the incidence conditions on closures and on all affine-cover overlaps. The affine comparison then gives the global quasi-isomorphism and its derived inverse. Use these maps to define pullbacks between smooth schemes, intersection products and finite-correspondence actions; prove independence, graph agreement, identity, additivity, composition, external-product compatibility and agreement with proper and flat maps. These actions on higher Chow groups use the appropriate subcomplexes and their derived inverses (MVW Definition 17.5, Proposition 17.6 and §§17.7–17.21 pp.137–142).

Over finite fields descend the moving comparisons, on their respective geometric domains, using finite separable extensions of two coprime sufficiently large degrees and integral restriction/transfer; the degree formulas and Bézout identity remove the cone. All the preceding maps commute with derived coefficient change to R (Levine Lemma 7.1 and §7 pp.43–44).

For smooth finite-dimensional schemes establish Nisnevich excision and descent and use the resulting cycle-sheaf complex ℤ(i)=z^i(−,2i−*) for i≥0, with ℤ/m(i)=ℤ(i)⊗ᴸℤ/m. Prove H^a(X,ℤ(i))=CH^i(X,2i−a) and the localization, product and transfer identifications on these complexes. All motivic comparisons below use these same complexes and maps (MVW Theorem 19.1 p.159 and Proposition 19.12 p.162 for the perfect-field comparison and Zariski descent; K-book VI.4.2.2 p.481).

**Checks.**

- For a field F, CH^0(F,0)=ℤ and CH^1(F,1)=F×, while CH^1(F,0)=0. Thus weight one places F× in H¹(F,ℤ(1)).
- For {0} ⊂ 𝔸¹ the closed-open sequence retains CH₀(point,0)=ℤ although CH₀(𝔸¹,0)=0. Flat homotopy invariance instead identifies CH₀(point,0) with CH₁(𝔸¹,0)=ℤ.
- A cycle whose closure gains an excess intersection at a vertex is excluded from the admissible-closure subcomplex. Restriction to an open subscheme need not be surjective termwise.
- For X=Spec ℂ[x,y,z]/(xy−z²), vertex o and D=V(x,z), the normal surface's divisor class [D] cannot move off o: in the local ring at o, the divisorial ideal (x,z) needs two generators, so its local class is nonzero, whereas every divisor avoiding o has zero local class. The incidence inclusion for {o} therefore fails on CH₁(X,0); closed-open localization for X and o still applies.
- Over 𝔽₂, moving over a single even-degree extension does not eliminate possible two-torsion in the cone; two coprime degrees do, with integral coefficients.
- Finite-extension pullback followed by pushforward on CH^0 is multiplication by the extension degree, including for a purely inseparable extension. Coefficient homology retains its torsion connecting term.

*Needs:* SchemeAndStackFoundations' cycle, intersection, blow-up, flattening and Nisnevich-site foundations; supplied chain complexes, derived tensor products and sheaf cohomology. The shared cycle and moving package is constructed here before its K-theoretic comparisons.

**Motivic comparison foundations** (`motivicToK`). On `motivicCycles`' shared complexes identify Hⁿ(F,ℤ(n)) with Kₙᴹ(F) for every field F and n≥0. Identify field restriction and every finite-extension pushforward with §3.0's supplied restriction and Kato norm, including inseparable extensions. For codimension-one localization in smooth schemes, specify the purity and degreewise boundary signs so that the diagonal residue is the same last-slot Milnor residue as in §3.0. Construct the symbol map by products of K₁ classes; the diagonal edge of the K-theory tower must equal this map on the common Milnor carrier (MVW Theorem 5.1 and proof pp.29–34, Theorem 19.1 p.159; K-book VI.4.1–4.3 pp.479–481).

For m invertible in F, prove the norm-residue comparison ℤ/m(i)≃τ≤i Rε_*μ_m^⊗i on the Nisnevich site, where ε is the étale-to-Nisnevich morphism; its degree-two field diagonal is `merkurjevSuslin`: K₂(F)/m≃H²(F,μ_m^⊗²). Construct the motivic-to-K tower on the shared complexes and prove its layer identification and convergence, giving E₂^(a,b)=H^(a−b)(X,ℤ/m(−b))⇒K_(−a−b)(X;ℤ/m), with its integral version. Establish edge-symbol, localization, coefficient and finite-extension transfer compatibility on the maps just specified. Prove multiplicativity for m≢2 modulo 4, and retain the integral/coefficient mixed pairing for every m. The diagonal identification, norm-residue theorem and K-theory layer comparison are owned by this target (K-book V.11.11–11.14 pp.457–459, VI.4.1–4.3 pp.479–481).

**Checks.**

- In weight one the norm-residue map is Kummer F×/F×ᵐ≃H¹(F,μ_m); in degree two it sends {a,b} to κ(a)∪κ(b). The diagonal symbol edge is the product of the same K₁ classes.
- For a separably closed field and m invertible, the finite-coefficient spectral sequence leaves μ_m^⊗i in degree 2i and zero odd groups. This tests the weight and total-degree conventions.
- For 𝔽ₚ(t), m=p is outside this étale norm-residue statement; the nonzero class dlog t belongs to §3.0's differential-symbol comparison instead.
- For 𝔽ₚ(t)/𝔽ₚ(tᵖ), the weight-one pushforward is t ↦ tᵖ on the same Kato norm used in §3.0. For a unit followed by a uniformizer, the Milnor-diagonal residue has value ū.

*Needs:* §3.0's common Milnor package, `motivicCycles` and its moving/localization/product/transfer maps, the supplied K-theory localization and products, and EtaleCohomologyFoundations' sites, Kummer cohomology and étale/Galois comparison.

### 3.1 The full norm-residue map

For a local field E let μ(E) be its finite group of roots of unity and w = #μ(E) = (q−1)p^a; a = 0 in equal characteristic. Here w is invertible in E, including equal characteristic where p ∤ w, and E contains a primitive w-th root of unity. Define `normResidueMap : Multiplicative K₂(E) →* μ(E)` by descending ClassicalArithmeticCompletion's `normResidueSymbol` for m = w along AlgebraicKTheory A5's Matsumoto presentation. The supplied `normResidueSymbol_mul_left`, `normResidueSymbol_mul_right` and `normResidueSymbol_one_sub_self` give exactly the bilinearity and Steinberg relations required for this descent, so h_E{a,b} = (a,b)_(E,w) is ClassicalArithmeticCompletion §1.14's `normResidueSymbol`. No primitive root is chosen in the definition. Its API comprises `normResidueMap_symbol` (the value on {a,b}), the identity on a zero K₂ class, bimultiplicativity and the Steinberg relation inherited from the supplied symbol, functorial exponent projections, compatibility with local reciprocity and the tame formula below (K-book III.6.2.3 pp.233–234; Handbook §5.6 p.163).

For every nonarchimedean local field F, every m ≥ 1 invertible in F with μ_m ⊆ F and every d | m, the identity (x,y)_(F,d) = ((x,y)_(F,m))^(m/d) is ClassicalArithmeticCompletion's `normResidueSymbol_pow_of_dvd`; on K₂(F) the d-th symbol is therefore the m-th symbol followed by μ_m → μ_d, ζ ↦ ζ^(m/d). For F = E and m = w this gives (−,−)_(E,d) = h_E^(w/d) for every d | w (K-book Example III.6.2.3 p.233; Milne, *Class Field Theory*, III Remark 4.5 p.114).

For w = ∏ℓ ℓ^aℓ, μ(E) = ∏ℓ μ_(ℓ^aℓ)(E) and h_E is the product of its primary projections πℓ∘h_E. The primary projection is not simply the d-th symbol. If d = ℓ^aℓ and uℓ(w/d) ≡ 1 modulo d, prove πℓh_E = ((−,−)_d)^uℓ; hence h_E and the family ((−,−)_(E,d))_(d|w) determine each other. The congruence has an inverse because gcd(d,w/d) = 1. For ℓ ≠ p the ℓ-primary symbol is tame and is given by §3.2. The wild p-component occurs exactly in mixed characteristic with μ_p ⊂ E; it is not a function of the residue tame symbol, and it is nontrivial on the tame kernel of ℚ₂ (K-book Exercise III.6.7 p.244; Example III.6.2.5 p.234). If char E ≠ 2 then 2 | w and (−,−)_(E,2) = h_E^(w/2) is the quadratic Hilbert symbol by ClassicalArithmeticCompletion's `normResidueSymbol_two_eq_hilbertSymbol`; if char E = 2 there is no quadratic component, since w = q−1 is odd. *Needs:* ClassicalArithmeticCompletion §1.14 and AlgebraicKTheory A5's Matsumoto presentation.

**Checks.**

- For 𝔽₂((t)), w = 1 and h_E is trivial, even though K₂(E) will be a large group.
- For ℚ₅, h_E{5,2} = ω(2) and h_E{2,5} = ω(3); the outputs are inverse primitive fourth roots.
- For ℚ₂, h_E{−1,−1} = −1 while its tame boundary in 𝔽₂× is 1. This detects the wild component.
- For E = ℚ₂(ζ₃), q = 4 and w = 6, the 3-primary projection is the square of the cubic symbol, not the cubic symbol itself.

### 3.2 Coordinate formula and reciprocity witness

For d | q−1 the tame formula is ClassicalArithmeticCompletion's `normResidueSymbol_tame`; we record its coordinate form. Two integral units have trivial d-th symbol. For a uniformizer and a unit, arithmetic reciprocity acting on an unramified Kummer root gives (π,u)_d = ω(ū)^((q−1)/d) in E×, where ω is the Teichmüller lift, and the reverse pair gives ω(ū)^(−(q−1)/d). By bilinearity, for r,s ∈ ℤ and units u,v,

```text
∂{π^r u,π^s v} = (−1)^(rs) ū^s v̄^(−r),
(π^r u,π^s v)_d = ω((−1)^(rs) ū^(−s) v̄^r)^((q−1)/d).
```

The first expression is `tameCoordinate r s ū v̄`, the last-slot tame-symbol coordinate expression; define this light coordinate expression on the unit group of any commutative ring, including the zero ring. Its light API is multiplicativity in the two valuation/unit pairs, inversion on swapping the pairs, the diagonal value (−1)^(r²) = (−1)^r when (s,v) = (r,u), and invariance under π′ = cπ with u′ = c^(−r)u, v′ = c^(−s)v. Prove `tameBoundary_symbol`: the localization boundary ∂₂ = δ₂ = −B₂ from GeneralAlgebraicKTheory §8.13 agrees with this expression on every Matsumoto symbol. Left linearity gives δ₂{u,π}=ū, two integral units have zero boundary, and {π,π}={−1,π} supplies the sign; bilinearity gives all integer valuations. Require naturality for valued field isomorphisms and compatibility with the higher Milnor residue of §3.0. This is a comparison theorem on K₂. The second expression gives `(−,−)_d = (ω∘∂)^(−(q−1)/d)` on K₂(E) with the conventions fixed above. For d = q−1 the symbol h_E^(p^a), followed by the inverse μ_(q−1)(E) ≃ k× of ω, is ∂⁻¹; in characteristic p, where w = q−1, h_E = (ω∘∂)⁻¹ (Sharifi Definition 9.3.2 p.195, Theorem 9.3.8 and proof pp.197–198, with exchanged inputs; K-book III.6.3 p.234). *Needs:* Layer 2's boundary sign, ClassicalArithmeticCompletion §1.14, §3.0 and AlgebraicKTheory A5.

**Checks.**

- Over the zero ring and over 𝔽₂ the unit group is trivial, so every coordinate value is 1; the zero-ring extension does not assert that a zero ring is a residue field.
- With k = 𝔽₅, r = 0,s = 1,u = 2,v = 1, `tameCoordinate` is 2; swapping gives 3. The corresponding fourth Hilbert values are respectively ω(3) and ω(2).
- At r = s = 1,u = v = 1 over 𝔽₅ the boundary and the fourth symbol are −1. The sign factor cannot be suppressed.
- For r = −1,s = 1,u = 2,v = 3 over 𝔽₅ the coordinate is −2·3 = −1, testing negative valuations and negative integer powers. Over 𝔽₂ every coordinate is 1.
- Replacing π by 2π in the first example replaces the unit part of the second input by 3; the coordinate remains 2. This checks the parameter-change direction.

Suggested.lean states `tameCoordinate_swap`, `tameCoordinate_change_uniformizer` and `tameCoordinate_mul_left`, and proves two examples: the unit/uniformizer direction (value 2, where the inverse convention gives 3) and the sign on two uniformizers (value 4; omitting the sign gives 1). The first proved example also checks negative valuations and the direction of a uniformizer change. The trivial values over 𝔽₂ and the zero ring are unit tests for the implementation; the generic swap target retains the inverse-direction comparison.

For d | w, (x,y)_d = 1 exactly when x lies in the norm group of E(y^(1/d))/E; this is ClassicalArithmeticCompletion's `normResidueSymbol_eq_one_iff_mem_normGroup`, a norm criterion with the first variable as the norm, consistent with our reciprocity order. By local class field theory (ClassFieldTheory Layer 6) the index of that norm group is the degree of the extension, equivalently the order of y in E×/E×d; in particular h_E{x,y} = 1 exactly when x is a norm from E(y^(1/w)). For d = 2 this says x = a²−yb² for some a,b ∈ E, ClassicalArithmeticCompletion's `normResidueSymbol_two_eq_hilbertSymbol` (Sharifi Proposition 9.3.4(b) pp.195–196 after interchange; K-book III.6.2.3 p.233).

### 3.3 Surjectivity and the norm-residue kernel

Fix a generator ζ of the whole group μ(E). Prove its class in E×/E×w has order w: a smaller order would produce a root of unity of order larger than w in E. Nondegeneracy of the Hilbert pairing then makes (ζ,−)_w onto μ(E). Choose x with (ζ,x)_w = ζ, not merely with a nontrivial value. Since w{ζ,x} = 0, the formula ζ^j ↦ j{ζ,x} is a well-defined section. For composite w, a nontrivial symbol value need not generate; this is why the precise choice of x matters (K-book III.6.2.3 and Moore proof pp.233–234).

Define `normResidueKernel E` as the additive subgroup corresponding to ker h_E, denoted U(E). Its API is `mem_normResidueKernel_iff`, inclusion, the canonical exact sequence 0 → U(E) → K₂(E) → μ(E) → 0, wK₂(E) ⊂ U(E), compatibility with primary components, and comparison with the tame kernel. Before §3.4 the displayed formula for a section uses choices; prove uniqueness only after the torsion freeness of §3.4. Localization gives the canonical sequence 0 → K₂(O) → K₂(E) → k× → 0 and identifies K₂(O) with the tame kernel (K-book V.6.6.2 p.410; Handbook Proposition 58 p.164). *Needs:* §§3.1–3.2 and Layer 2.

**Checks.**

- Over ℚ₂ the class {−1,−1} belongs to K₂(ℤ₂) but is outside U(E); the two kernels are different.
- Over 𝔽q((t)), h_E = ω∘∂⁻¹, hence U(E) = K₂(𝔽q[[t]]).
- At w = 1 the kernel is all of K₂(E), and the exact sequence has zero finite quotient.
- In every field, {a,1−a} lies in the kernel when a ≠ 0,1, by the Steinberg relation. The ℚ₅ symbol {5,2} does not, giving a non-example with order-four image.

### 3.4 Divisibility at all primes

For ℓ ≠ p prove U(E) is uniquely ℓ-divisible. The canonical prime-to-p torsion splitting of Layer 2 identifies both K₂(E)/ℓ and K₂(E)[ℓ] with their μ(E) counterparts under h_E; equally, the boundary ∂ induces K₂(E)/ℓ ≅ k×/ℓ and K₂(E)[ℓ] ≅ k×[ℓ], because K₂(O) is uniquely ℓ-divisible by §2.3. Surjectivity and injectivity on the kernel follow separately (K-book VI.7.2–7.3 pp.508–509).

**Artin–Schreier Hilbert 90 for K₂** (`artinSchreier_K2_hilbert90`). For every degree-p Artin–Schreier extension L/F in characteristic p with generator σ, prove exactness of 0→K₂(F)→K₂(L)→_(1−σ)K₂(L)→_N K₂(F). Use §3.0's differential-symbol comparison and p-torsion theorem, then descend σ-invariants modulo p and apply the norm/cohomology argument. This is the n=2 instance of K-book Corollary III.7.8.3 p.253. In particular K₂(F)[p]=0 for every characteristic-p field F by §3.0 and Matsumoto, agreeing with Theorem III.6.7 p.238.

**Checks.**

- For F=𝔽ₚ(y), L=𝔽ₚ(x), y=xᵖ−x and σx=x+1, the theorem applies although neither field is perfect.
- For F=𝔽ₚ and L=𝔽_(pᵖ), both K₂ groups vanish and the exact sequence is zero.
- For a purely inseparable degree-p extension there is no such σ; the Hilbert-90 sequence is not asserted, while the norm of §3.0 still exists.

For local E of characteristic p, use the resulting absence of p-torsion. Then prove [E:E^p] = p and Ω²_E = 0; Bloch–Gabber–Kato then gives K₂(E)/p = 0. A field with two independent p-basis elements is outside that latter argument (K-book III.7.7.2 p.251).

In mixed characteristic use Merkurjev–Suslin K₂(E)/p^ν ≃ H²(E,μ_(p^ν)⊗²), local duality and the full symbol to identify the quotient with μ(E)/p^ν. This proves p-divisibility of U(E) without assuming Moore's theorem in the cohomological input. Supply separately Merkurjev's theorem that U(E)[p] = 0, equivalently that the p-primary torsion of K₂(E) injects under h_E. The latter original torsion proof is not replaced by a cardinality argument about quotients (K-book Moore proof p.234 and VI.7 discussion p.508; Handbook Theorem 57 proof p.163, citing Merkurjev 1983). *Needs:* §§3.0–3.0a,3.3, `artinSchreier_K2_hilbert90`, local duality and Matsumoto. The mixed-characteristic kernel torsion theorem is a target here, independent of Moore.

### 3.5 Moore's structure and the integer-ring subgroup

Prove U(E) is uncountable using the theorem that K₂(F) has the cardinality of F whenever F contains ℚ(t), or 𝔽p(t₁,t₂) in characteristic p. The appropriate subfields exist by the local field's uncountable transcendence degree. A finite μ(E) quotient preserves uncountability. Do not use Ω²_E to establish equal-characteristic uncountability, since that differential group is zero (K-book III.6.3.2 p.235; Fesenko §6.1 pp.61–62).

Combine §§3.3–3.4 to prove Moore's theorem: U(E) is an uncountable uniquely divisible group, h_E identifies K₂(E)_tors with μ(E), and

```text
K₂(E) = U(E) ⊕ K₂(E)_tors,
U(E) = wK₂(E) = ⋂_(m≥1)mK₂(E) = Div(K₂(E)).
```

The internal decomposition and inverse of h_E on torsion are canonical. Any initially chosen section equals this inverse because Hom(μ(E),U(E)) = 0. Only a subsequent identification μ(E) ≃ ℤ/w requires a generator (K-book Theorem III.6.2.4 pp.233–234; Handbook Theorem 57 p.163).

Prove K₂(O) = U(E) ⊕ K₂(O)_tors with torsion μ_(p∞)(E). The quotient by K₂(O) is k×, and h_E on that quotient is the inverse tame identification, with the p^a exponent projection retained. In equal characteristic K₂(O) = U(E); its complement in K₂(E) is the canonical prime-to-p torsion section ū ↦ {ω(ū),π}. Under h_E this section sends ū to ω(ū)⁻¹. In mixed characteristic the integer-ring torsion is nonzero exactly when μ_p ⊂ E (Handbook Theorem 57 p.163 and Proposition 58 p.164; K-book errata for the lines before VI.7.1). *Needs:* §§3.1–3.4 and the maximal-divisible algebra of §0.0, whose proof is independent of local K-theory.

### Examples

For ℚ₂, U is uniquely divisible and K₂(ℤ₂)/U = ℤ/2, detected by {−1,−1}; the tame quotient is zero. The symbol {−1,5} is zero: it has order dividing two and trivial quadratic symbol, as the norm equation 5 = 1²+2² shows, so it lies in the torsion-free kernel. Equivalently the conic 1 = −2²+5·1² gives the reciprocal norm criterion. For ℚ₃, h{3,−1} = −1 and {−1,−1} = 0; here μ₃ is absent, so K₂(ℤ₃) = U. For ℚ₃(ζ₃), integer-ring K₂ has a nonzero order-three torsion group. For 𝔽₂((t)), K₂(E) = U(E) is uncountable and uniquely divisible. These cases distinguish mixed characteristic, wild roots and a trivial residue unit group.

### Dependencies

Layer 2, §§3.0–3.0a's Milnor residues, norms, differential symbols and motivic norm residue, ClassicalArithmeticCompletion §1.14's norm-residue symbol, ClassFieldTheory's local duality, and §0.0's abelian-group divisibility. The K₂ factorization, tame-boundary comparison, mixed-characteristic kernel torsion theorem and characteristic-p Hilbert-90 comparison are targets of this layer.

## Layer 4: the logarithmic trace and localization

### 4.0 Genuine equivariant and cyclic foundations

**Genuine cyclotomic foundations** (`genuineCyclotomicModel`). Construct genuine circle spectra and their finite-cyclic restrictions in an orthogonal-spectrum model, including representation spheres S^λ, geometric fixed points, categorical fixed points, transfers, norms and the fixed/orbit/Tate square. Compare the underlying spectra with GeneralizedCohomology G2's carriers. Construct genuine cyclotomic spectra with coherent root-pullback equivalences ρ_p*Φ^(C_p)T≃T and the associated restriction maps. Construct the modern cyclotomic category from circle spectra with equivariant Frobenius maps T→T^(tC_p), and define its TC as the mapping spectrum from the cyclotomic sphere. Its commutative-ring models agree with AInfCohomology §AI.7.2. Retain the distinction between genuine fixed points and homotopy fixed points (HM03 §1.2 pp.11–14; Nikolaus–Scholze §§II.1–II.3).

**Checks.**

- S⁰ is the tensor unit and S^(λ⊕μ)≃S^λ∧S^μ; forgetting the action gives the sphere of real dimension dim ℝ λ.
- For the weight-j complex line ℂ(j), its C_(p^a)-fixed dimension is one if p^a divides j and zero otherwise; geometric fixed points of its representation sphere use this fixed subspace.
- For trivial-action Hℤ, homotopy fixed points and Tate have π₀ equal to ℤ and ℤ/p respectively. They cannot be identified with one another.

*Needs:* GeneralizedCohomology G2's spectra, stable model structures and derived smash, finite/circle representations and classifying spaces, and BordismFormalGroups §F6.5's finite-group Tate functor, also consumed by AInfCohomology §AI.7.2.

**Cyclic homology foundations** (`cyclicHomologyModel`). Use DGAInfinity Layer 8's derived Hochschild chains over the specified base, their normalized comparison and derived Morita invariance, for ordinary algebras viewed as DG algebras in degree zero. Construct the cyclic structure on these chains, the Connes mixed complex, cyclic, negative cyclic and periodic homology and the SBI sequence. Prove functoriality, relative fibres, products and the HKR comparison HHₙ(A/k)≃Ωⁿ_(A/k) for smooth commutative k-algebras, with the characteristic-zero de Rham comparison for cyclic homology. Keep absolute HH over ℤ distinct from HH over a coefficient field (K-book V.4.2.2 p.399; Hesselholt05 §3, Proposition 7 p.22 and Theorem 10 p.28).

**Checks.**

- HH₀(A)=A/[A,A] and HH₁(A/ℤ)=Ω¹_(A/ℤ) for commutative A.
- For ℚ[t] over ℚ, the class of t maps under Connes B to dt and HH₂ vanishes.
- For the singular algebra 𝔽ₚ[ε]/ε², the smooth HKR hypothesis fails; its cyclic bar complex still exists.

*Needs:* DGAInfinity Layer 8's derived Hochschild chains, normalized comparison and derived Morita invariance, derived tensor products and realization from GeneralizedCohomology and DerivedModuleAlgebra, and the ordinary differential algebra supplied by Mathlib.

### 4.1 The classical linear Waldhausen model

For a small category C enriched in abelian groups, with cofibrations and weak equivalences satisfying Waldhausen's axioms, construct `linearWaldhausenTHH C` in the Hesselholt–Madsen model. Its (n,V)-space is the realization of THH^(n)(NʷS^(n)C;S^V), using Eilenberg–Mac Lane spectra of the Hom groups and Bökstedt's homotopy-colimit indexing. The cyclic structure gives the circle action; permutation of the S-directions gives the symmetric-spectrum action. Construct the cyclotomic root-pullback map from geometric fixed points and prove it is an equivalence on all finite p-power fixed points. Positive-level structure maps must be equivalences on every finite cyclic fixed point, not just nonequivariant equivalences (HM03 §1.1 pp.7–12 and §1.2 pp.13–14 (stated there without proof)).

The API comprises exact-functor maps with identity/composition coherence, homotopies from natural weak equivalences, the trace K(C) → T(C)^T from the fixed zero simplices, and multiplication for a strict symmetric monoidal C with biexact tensor product. The comparison with AInfCohomology §AI.7.2's ordinary THH is only asserted where the resolution/Morita theorem below applies. Dependence on the linear Waldhausen input must be preserved; replacing C by its localized stable category would change the logarithmic construction.

**Checks.**

- The zero category gives a contractible spectrum.
- For finite projective R-modules, π₀ = R/[R,R]; for commutative R, π₁ = Ω¹_(R/ℤ), agreeing with ordinary THH in these degrees.
- For R = 𝔽p, the answer is 𝔽p[σ], |σ| = 2; it is not just the degree-zero ring.
- Cᵇ_q(P_ℤₚ) has logarithmic π₀ = ℤₚ and nonzero mod-p π₀, whereas THH(ℚₚ) is p-inverted and has zero mod-p homotopy. A construction through the Dwyer–Kan localization would fail this check.

### 4.2 Classical TR, Frobenius and TC

Specialize genuine fixed points to define `linearTR n C p = T(C)^(C_{p^(n−1)})`, n ≥ 1. Give its API R,F,V, the residual circle action, trace maps from the constant K pro-spectrum, `RF = FR`, `RV = VR`, `FV = p`, projection formulas, and multiplicativity of R and F. V is an additive transfer, not a ring homomorphism. For every commutative ring A and n ≥ 1, identify π₀TRⁿ(A;p) with the supplied Wₙ(A) by the natural ring isomorphism I(a₀,…,aₙ₋₁) = Σᵢ Vⁱ(Δ_(p^(n−1−i))(aᵢ)), where Δ_r : A → π₀T(A)^(C_r) is induced by the edgewise-subdivision diagonal; then RI = IR, FI = IF, VI = IV and I[a]ₙ = Δ_(p^(n−1))(a) on Teichmüller representatives. The same identification π₀TRⁿ(A|K;p) = Wₙ(A) holds for a complete DVR A, using π₀T(A|K) = A from §4.8. Hesselholt–Madsen 1997 index this as π₀T(A)^(C_(pⁿ)) ≅ Wₙ₊₁(A) (HM03 §1.1 pp.8–10; HM97a Theorem 2.3 and its proof p.18 (PDF22); Hesselholt–Madsen's Witt identification used in HM03 §3.3 p.51).

Define `linearTRLimit` as the preferred homotopy limit along R and `linearTC` as hofib(id−F) there; since R induces the identity on the limit, this is TC(C;p) = hofib(R−F: TR(C;p) → TR(C;p)), with natural cofibration sequence TC(C;p) → TR(C;p) → TR(C;p) → ΣTC(C;p). Its API has the Milnor sequence 0 → lim¹_R TR^•ₛ₊₁(C;p) → TRₛ(C;p) → lim_R TR^•ₛ(C;p) → 0, the TC fibre sequence, and the lift of the cyclotomic trace to tr: K(C) → TC(C;p); for strict symmetric monoidal C with biexact tensor product, TR(C;p) and TC(C;p) are ring spectra and F and tr are ring maps. With coefficients put TC_q(C;p,ℤ/m) = π_q(M_m ∧ TC(C;p)) and TC_q(C;p,ℤₚ) = π_q holim_ν(M_(p^ν) ∧ TC(C;p)) for the mod-m Moore spectrum M_m; integral, p-adic and finite-coefficient groups are distinct objects related by the Bockstein and Milnor sequences (HM03 §2.1 p.31). The inverse-limit maps are preferred coherent maps of spectra; an equality of group-level inverse limits alone does not construct them (HM03 §1.1 pp.8–9).

**Checks.**

- TR¹ = T. For 𝔽p, π₀TR² = ℤ/p², R and F both reduce modulo p, and V is multiplication by p.
- Over ℤ at p = 3, R[2]₂ = 2 while F[2]₂ = 8. Defining R as fixed-point inclusion would conflate distinct operators.
- TC(𝔽p;p) has π₀ = π₋₁ = ℤₚ and no other groups. It is not connective.
- Over 𝔽̄p, 1−F on W(𝔽̄p) is onto and TC = Hℤₚ; the negative group from the finite-field case disappears.
- The finite-level fibre of R−F is not TC: its degree-zero and degree-minus-one groups for 𝔽p are ℤ/pⁿ and ℤ/p^(n−1), rather than ℤₚ.

### 4.3 Circle operators and coefficient splitting

Use the complex orientation on T = S(ℂ). Define `connesOperator` from the stable class σ[T] ∈ π₁ˢ(T₊), characterized by Hurewicz value [T] and zero collapse to S⁰, followed by the circle action. Prove naturality, the product derivation formula, and d² = dη = ηd. Thus d² = 0 when η acts trivially, in particular when 2 is invertible. Retain the circle-transfer relation FdV = d+(p−1)η before specializing to odd p. A nonzero η alone does not show ηd is nonzero (HM03 §2.1, (2.1.2), pp.31–32, citing Hesselholt96 Lemma 1.4.2; retain the circle-transfer correction).

For an Hℤ/m-module spectrum X use the canonical coefficient class ε with βε = 1 to split Mₘ∧X ≃ X∨ΣX naturally in Hℤ/m-module maps. This gives π_q(X;ℤ/m) ≃ π_qX ⊕ π_(q−1)X (HM03 (2.1.1) p.31). This theorem does not apply to arbitrary K(R)/m merely because it is a Moore cofiber.

**Checks.**

- A trivial circle action gives d = 0 because the chosen stable circle class has zero collapse.
- On HH(ℤ[x]), d(x) = dx, fixing the orientation against `KaehlerDifferential.D`.
- On mod-p THH(𝔽p), dε = σ with βε = 1; reversing the orientation would change the sign.
- At p = 2 retain d² = ηd. An explicit example with ηd ≠ 0 requires its own calculation; no such example is assumed here. This prevents the unsupported inference from a nonzero Hopf class to a nonzero square.

### 4.4 Norm, homotopy orbits and modern comparison

Construct the norm–restriction cofiber sequence

```text
T(C)_(hC_{p^(n−1)}) → TRⁿ(C;p) →R TRⁿ⁻¹(C;p),  n ≥ 2,
```

and its map to the orbit/fixed/Tate cofiber sequence, with comparison maps Γ and Γ̂. Preserve multiplicative and module structures. Let C have a biexact strict symmetric monoidal structure whose π₀TR is described by Witt vectors, namely C = Cᵇ_q(P_A), Cᵇ_z(P_A) or P_A with A commutative. Then hTRⁿ_*(C;p) = π_*H_•(C_(p^(n−1)),T(C)) is a graded TRⁿ_*(C;p)-module at every prime, and the homotopy-orbit spectral sequence of Wₙ(A)-modules has E²_(s,t) = H_s(C_(p^(n−1)), (F^(n−1))*π_tT(C)), with the Wₙ(A)-action through F^(n−1), and is first quadrant when T(C) is connective. For n ≥ 2, inclusion and transfer give TRⁿ_*-linear maps F: hTRⁿ_* → F*hTRⁿ⁻¹_* and V: F*hTRⁿ⁻¹_* → hTRⁿ_* with FV = p. For odd p these are differential graded modules with FdV = d; at p = 2 retain the circle-transfer identity FdV = d+(p−1)η and the Connes square correction, and assert no differential graded structure without an η-vanishing hypothesis (HM03 §1.1 pp.9–10 and (3.3.2) p.51; HM97a (4.5.2); Hesselholt96 Lemma 1.5.1).

Prove `genuineModernCyclotomicComparison` for bounded-below genuine cyclotomic spectra, identifying classical and modern cyclotomic objects and their TR/TC constructions, including Γ, Γ̂ and the trace. On ordinary commutative rings the modern model is AInfCohomology §AI.7.2's THH; for the linear Waldhausen model use §4.1's genuine spectrum. The index shift is fixed by TRⁿ ↔ C_(p^(n−1)) (Nikolaus–Scholze II.4.4–II.4.10 pp.263–265 and Theorems II.6.3,II.6.9 for the bounded-below cyclotomic categories; HM97a Theorem 3.1 p.19 (PDF23)).

For a bounded-below cyclotomic spectrum T with its circle action, prove the arithmetic homotopy pullback

```text
TC(T) ≃ T^{h𝕋} ×_{∏_p (T_p^∧)^{h𝕋}} ∏_p TC(T;p)_p^∧.
```

The products range over all primes and every completion is derived. The map from T^{h𝕋} is induced by T→T_p^∧. For each p, the other map is the p-completion of TC(T;p)→T^{hC_{p∞}}, followed by the equivalences (T^{hC_{p∞}})_p^∧≃(T_p^∧)^{hC_{p∞}}≃(T_p^∧)^{h𝕋}. The p-typical map comes from the fibre of φ_p−can:T^{hC_{p∞}}→(T^{tC_p})^{hC_{p∞}}. Construct the natural restriction TC(T)→TC(T;p) using C_{p∞}⊂𝕋 before completing. Deduce separately TC(T)^∧_p≃TC(T;p)^∧_p; all p-adic and mod-p^ν statements about TC(C;p) are thus statements about the integral TC(T(C)) after p-completion (NS arXiv v2 Theorem II.4.10 p.52, square (1) and Theorem II.4.11 p.53). Bounded below is an actual input, not an automatic property of every genuine cyclotomic spectrum. *Needs:* §§4.0–4.3, the supplied modern circle/Tate constructions and coherent spectral limits.

**Checks.**

- At TR¹ the genuine construction recovers T; the next fixed-point level corresponds to C_p, not C_(p²).
- For 𝔽ₚ the comparison retains π₋₁TC=ℤₚ, so it cannot include an implicit connective truncation.
- The comparison requires bounded-below underlying spectra; the construction of a genuine cyclotomic spectrum alone supplies no such bound.
- For T=Hℚ with trivial circle action, every finite-group Tate term and every T_p^∧ vanish. The integral pullback gives TC(T)≃(Hℚ)^{h𝕋}, with π_(−2j)=ℚ for all j≥0 and zero odd homotopy. Meanwhile TC(T;p)≃(Hℚ)^{hC_{p∞}}≃Hℚ, whose map to T is an equivalence. This detects the circle classes lost by gluing only over T, and all p-completions of TC(T) vanish.

### 4.4a Nilpotent relative trace comparisons

**Nilpotent trace comparison** (`nilpotentTraceComparison`). For a unital ring A and nilpotent two-sided ideal I, construct the ordinary cyclotomic trace compatibly with §§4.1–4.4 and prove K(A,I)^∧_p≃TC(A,I)^∧_p for every prime p. The relative spectra are fibres over A/I, and completion is derived. For a ℚ-algebra A, prove Goodwillie's rational comparison Kₙ(A,I)⊗ℚ≃HC_(n−1)(A,I) for n≥1 and that the relative K-groups are uniquely divisible, giving the integral relative formula used in §5.17. Prove naturality in nilpotent pairs and compatibility with relative boundary maps (Nikolaus–Scholze Introduction Theorem 1.2; K-book V.4.2.2 p.399; Hesselholt05 Theorem 10 p.28).

**Checks.**

- For I=0 both relative spectra are zero, while absolute K(A) need not equal TC(A).
- For A=ℚ[ε]/ε², I=(ε), relative K₁=ℚ and K₂=0, agreeing with relative HC₀ and HC₁.
- For A=𝔽ₚ[ε]/ε² the nilpotent p-complete trace applies, but the characteristic-zero cyclic-homology formula does not.

*Needs:* §§4.0–4.4, supplied K-theory fibres and coherent derived completion. The relative trace equivalence and rational Chern character are constructed here.

### 4.5 Tate cochains, products and the filtered Tate spectrum

For a finite G, a commutative k and a projective kG-resolution P → k, compare the HM cochain model H_(−*)( (P̃⊗Hom(P,M))^G ) with the supplied `tateCohomology`. Define the comparison using the norm and augmentation quasi-isomorphisms; prove independence of resolution and compatibility of cup products induced by the two resolution diagonals. Its API identifies positive degrees with ordinary cohomology, degrees ≤ −2 with shifted homology, and the exact sequence

```text
0 → Ĥ⁻¹(G,M) → M_G →N M^G → Ĥ⁰(G,M) → 0.
```

Only the comparison model is new here; the underlying algebraic Tate object is supplied (HM03 Definition 4.1.1, Lemma 4.1.2 pp.59–60).

For C_r of odd order r, acting trivially on a commutative k with r = 0 in k, compute Ĥ*(C_r,k) = Λ_k(u)⊗k[t,t⁻¹], |u| = 1, |t| = 2. Fix the low-degree boundary by ∂(ut⁻¹) = −1 (HM03 Lemma 4.2.1 and Addendum 4.2.2 pp.62–64). The odd-order hypothesis is needed for this exterior multiplication formula.

For a finite group G and a G-spectrum T use BordismFormalGroups §F6.5's Borel finite-group Tate functor, norm triangle and coherent products. Construct a natural comparison of its Tate spectrum with the HM model (ẼG∧F(EG₊,T))^G, using a fibrant replacement and preserving the supplied products and module actions. Filter both cells to construct `tateSpectralSequence` with E²_(s,t) = Ĥ^(−s)(G,π_tT), abutting conditionally to π_(s+t)T^(tG). Its API includes naturality, pairings inducing the algebraic cup product, compatibility with the supplied ring/module structures, comparison from E² with Greenlees' filtration, and explicit convergence hypotheses. Do not upgrade conditional convergence to strong convergence merely from bounded-below T (HM03 §4.3 pp.64–69, Remark 4.3.6). For a finite cyclic C ⊂ T and a T-spectrum T, using the C-CW structure of S(ℂ^∞), make Ê^*(C,T) a spectral sequence of left Λ_C-modules, Λ_C = C_*(T/C;k), with x₁ representing the fundamental class: if an infinite cycle z ∈ E¹_(s,t) represents a ∈ π_*Ĥ(C,T) and x₁·z ∈ E¹_(s+1,t) is nonzero, then x₁·z is an infinite cycle representing Connes' operator da (HM03 Proposition 4.4.1 p.71). In odd cyclic order killed on coefficients prove d² = t·d_Connes, with the preceding sign conventions (HM03 §4.4 pp.68–71). *Needs:* BordismFormalGroups §F6.5's Tate functor, norm triangle and coherent products, §4.0's genuine model and the supplied algebraic Tate theory.

**Checks.**

- For C₃ on 𝔽₃, every Tate cohomology group is 𝔽₃; for the trivial group all groups vanish.
- For C₅ on ℤ, Ĥ⁰ = ℤ/5 and Ĥ⁻¹ = 0, agreeing with the library computation. Ĥ⁰ is not H⁰ = ℤ.
- A trivial Eilenberg–Mac Lane 𝔽p spectrum gives the usual Tate groups and a collapsed spectral sequence; induced modules give zero.
- For mod-p THH(𝔽p) at odd p the E² ring has u,ε,t±¹,σ, and d²ε = tσ; E³ is Λ(u)⊗𝔽p[t±¹]. Omitting ε or this differential gives an incorrect answer.
- For trivial-action Hℤ, π₀ of Tate is ℤ/p, whereas π₀ of homotopy fixed points is ℤ. The ẼG factor cannot be omitted.

### 4.6 Additivity and fibration for the linear model

For the functors Φ = THH(−;S^V)^(C_r), verify the HM axioms: the zero category is contractible, products are preserved, and degreewise equivalences remain equivalences under the indicated realization. Prove exact simplicial homotopies induce homotopies, natural transformations through weak equivalences give such homotopies on Nʷ, a natural isomorphism of exact functors f,g: C → D induces an exact simplicial homotopy Δ[1]_• × S_•C → S_•D from S_•f to S_•g (Waldhausen's Lemma 1.4.1), and the nerve-direction degeneracies give Φ(S_•C) ≃ Φ(Nⁱ_•S_•C), so adjoining the isomorphism nerve leaves Φ(NʷS C) unchanged (HM03 Lemmas 1.3.1–1.3.3 and Corollary 1.3.4 pp.15–16).

Prove McCarthy additivity in all four forms: decomposition of the cofibration-sequence category into source and quotient; its unrestricted special case; homotopy between middle object and source-plus-quotient; and additivity on cofibration sequences of exact functors. These equivalent formulations supply both splitting and naturality. Use them to make the relative S-construction square cartesian and obtain its canonical contraction and delooping (HM03 Theorem 1.3.5 and (1.3.6), pp.17–18).

With a cylinder satisfying the cylinder axiom and saturated weak equivalences, prove replacing w by w∩cofibrations preserves Φ(NʷC). Prove the swallowing equivalence for v ⊂ w and its inverse. With the extension axiom added, prove Waldhausen's fibration square for the subcategory of w-acyclic objects. Every one of the cylinder, saturation and extension hypotheses must be checked for the complex categories used below (HM03 Lemmas 1.3.9–1.3.10 and Theorem 1.3.11, pp.19–21). *Needs:* §4.1 and the structural Waldhausen supplier. These are the specialized linear fixed-point statements, not new general K-theory fibration theorems.

For the Bockstein computation of §5.10, establish the signed three-by-three cofiber chase. Write the three rows Eᵢ₁ → Eᵢ₂ → Eᵢ₃ → ΣEᵢ₁ as fᵢ₁,fᵢ₂,fᵢ₃, and the three columns similarly as g₁ⱼ,g₂ⱼ,g₃ⱼ. All squares commute except the final suspended corner, which anticommutes. If a ∈ π_dE₁₂, b ∈ π_dE₂₁ and c ∈ π_(d+1)E₃₃ satisfy g₃₃(c) = (Σf₁₂)(Σa) and f₃₃(c) = (Σg₂₁)(Σb), prove f₂₁(b)+g₁₂(a) comes from π_dE₁₁ through its diagonal map to E₂₂. The plus sign depends on that anticommuting corner. Apply it to multiplication by p on the norm/restriction cofiber sequence in §5.10 (HM03 Lemma 3.3.10 p.58). *Needs:* cofiber exactness, suspension signs and §4.2's norm sequence.

### 4.7 Resolution and torsion complexes

For a full additive subcategory E of an abelian category, closed under extensions and kernels of epimorphisms between its objects, prove E → Cᵇ(E) induces the Φ-equivalence between isomorphisms and quasi-isomorphisms. Do not drop kernel closure (HM03 Theorem 1.4.1 pp.21–22). Apply the Dundas–McCarthy criterion: an exact F induces a fixed-point THH equivalence if the weak-equivalence object-space comparison for S ENDₙ(F) is an equivalence for every n ≥ 0 (HM03 Proposition 1.5.1 p.24, citing the original criterion).

For a commutative noetherian central ring A, an A-algebra B and ideal I, prove a bounded complex of B-modules finite over A with I-power-torsion homology is quasi-isomorphic to a bounded complex of finite I-power-torsion modules. Apply this with a DVR and its maximal ideal to compare torsion modules, complexes with torsion homology and projective complexes. Keep the noetherian centrality and bounded finite-generation assumptions in the replacement lemma (HM03 Lemma 1.5.3 p.25, Theorem 1.5.2 pp.24–25 and Proposition 1.5.4 p.26). *Needs:* §4.6, finite projective resolutions over the DVR, and the END criterion.

### 4.8 The logarithmic DVR spectra and the trace square

For a DVR A with fraction field K define `logTHH A K = T(Cᵇ_q(P_A))`, where q denotes isomorphisms after tensoring with K. Define the ordinary DVR model with quasi-isomorphisms z, and its torsion-homology subcategory. The API includes the map j from the z-model to the q-model, finite-extension functoriality, multiplication, the logarithmic TR and TC objects and, for A of mixed characteristic (0,p), π₀logTHH = A. Prove the z-model and torsion subcategory agree with ordinary THH(A) and THH(k), respectively, using §4.7; hence their TR values agree too (HM03 Definition 1.5.5 and Theorem 1.5.6 pp.26–28).

Prove all three underlying spectra are connective (HM03 Proposition 2.3.4 pp.38–39). This verifies the bounded-below input in §4.4, including the q-model, without identifying it with THH(K). Construct the natural cofiber sequences TRⁿ(k;p) → TRⁿ(A;p) → TRⁿ(A|K;p) and their preferred homotopy limits, compatible with R,F,V and the circle. The middle-to-right map is a ring map; the transfer and boundary are module maps. Passing to TC gives a natural map from K-theory localization to TC localization with third term TC(A|K;p), not TC(K;p). Vertical traces are multiplicative where the source and target carry the relevant ring structures; the suspended boundary is not asserted to be a ring map. These spectrum sequences and trace squares use the raw boundary B. On homotopy groups apply the adapter (−1)^(n−1) to both the K and trace boundaries; their comparison then preserves ∂ and its commuting Bockstein square from §2.2. The norm–restriction boundary of §§4.2 and 4.6 retains its own spectrum-level suspension signs (HM03 Theorem 1.5.6 and Addendum 1.5.7 pp.27–28).

**Checks.**

- For A = ℤₚ, mod-p π₀logTHH = 𝔽p and, for odd p, π₁ = 𝔽p·dlog p; the second group differs from ordinary THH(ℤₚ).
- THH(ℚₚ) has zero mod-p groups, so neither the logarithmic spectrum nor its TC can be replaced by the fraction-field THH construction.
- Rationalizing j gives the expected common differential-form description over K; integral and mod-p comparisons remain distinct.
- The residue term is a module through A → k. Multiplicativity of j does not make the residue transfer a unital ring map.

### Examples

The prime-field TC calculation has a degree-minus-one ℤₚ even though K(𝔽p) is connective, explaining why the trace comparison of §5.15 uses a connective cover or a positive degree range. For A = ℤ₃, R[2] and F[2] differ by 6 in degree zero at length two, even though they agree after evaluating on 𝔽₃. The cyclic Tate boundary ut⁻¹ ↦ −1 and dε = σ fix the orientations used in the ramified calculations.

### Dependencies

Section 4.0's genuine cyclotomic foundations, AInfCohomology §AI.7.2's modern THH/TC⁻/TP, StableHomotopyKTheory's coefficient and convergence theorems, the existing algebraic Tate object and Waldhausen constructions, and the supplied K localization theorem. The linear additivity, torsion-resolution comparison and logarithmic localization are the specialized proof obligations here.

## Layer 5: logarithmic Witt and residue-characteristic calculations

### 5.1 Perfect fields and the prime-field cyclotomic model

Starting with AInfCohomology §AI.7.2's `AInf.Trace.bokstedt_periodicity` over 𝔽ₚ, prove by perfect base change that for every perfect field k of characteristic p, π*T(k) = k[σ], |σ| = 2, integrally and at every prime; for odd p, with the chosen Moore multiplication, π*(T(k);ℤ/p) = Λ{ε}⊗k[σ] with βε = 1 and Connes operator dε = σ. At every n ≥ 1 identify π*TRⁿ(k;p) = Wₙ(k)[σₙ], with Fσₙ = σₙ₋₁, Vσₙ₋₁ = pσₙ, and Rσₙ = pλₙσₙ₋₁ for a specified unit λₙ of the prime-field Witt ring; track coefficient Frobenius and Verschiebung separately from these generator equations. In particular TRⁿ_q(k;p) = 0 for odd q; for n ≥ 2, F: TRⁿ₂(k;p) → TRⁿ⁻¹₂(k;p) is onto with kernel p^(n−1)Wₙ(k)·σₙ, the image of V^(n−1): TR¹₂(k;p) → TRⁿ₂(k;p); and the boundary TR¹₂(k;p) → hTR²₁(k;p) of the norm–restriction sequence is onto. Taking R-limits kills positive degrees and yields TR = HW(k). Therefore TC has π₀ = ker(1−F) = ℤₚ, π₋₁ = coker(1−F:W(k)→W(k)), and no other groups, with the spectrum splitting Hℤₚ∨Σ⁻¹Hcoker(1−F); with ℤ/p coefficients TC₋₁(k;p,ℤ/p) = coker(1−F)/p ≅ coker(1−φ: k → k). For finite k the cokernel is ℤₚ and for algebraically closed k it is zero (HM97a Proposition 4.4 and Theorem 4.5 pp.30–32 (PDF34–36), Theorem B p.ii; HM03 §5.1 pp.74–75). *Needs:* Layer 4, perfectness, Witt operators and control of the R-limit, including lim¹.

For k = 𝔽p prove the first multiplicative extension in the circle homotopy-fixed filtration: p has initial filtration class u v, and p^a has (uv)^a. Consequently

```text
π*TC⁻(𝔽p) = ℤₚ[ũ,v]/(ũv−p),  |ũ| = 2, |v| = −2,
π*TP(𝔽p) = ℤₚ[v,v⁻¹],
can(v) = v,   can(ũ) = pv⁻¹.
```

Both have zero odd homotopy. The canonical map is an isomorphism in nonpositive even degrees and has image p^aℤₚ in degree 2a ≥ 0. Cyclotomic Frobenius has the opposite ranges: it is an isomorphism in nonnegative degrees and has image p^aℤₚ in degree −2a. Its degree-zero map is identity. Use the cyclotomic shift model THH(𝔽p) ≃ sh_p(Hℤₚ^triv) to choose the simultaneous normalization φ(v) = pv, φ(ũ) = v⁻¹. Derive the T/C_p-equivariant equivalence Hℤₚ^(tC_p) ≃ THH(𝔽p)^(tC_p), identify φ_p as the connective-cover map and identify genuine C_(p^n) fixed points with τ≥0Hℤₚ^(tC_(p^(n+1))) (Nikolaus–Scholze IV.4.6–IV.4.16, pp.358–364). Construct the cyclotomic shift model used in these calculations; TC⁻ and TP are the supplied functors.

For a discrete commutative 𝔽p-algebra B, export the p-complete fibre sequence TC(B) → TC⁻(B) →_(can−φ) TP(B), with TP = TC⁻[v⁻¹] and can an equivalence after inverting p. For an E₂-ring with a chosen nullhomotopy of p, prove the corresponding characteristic-p fibre and periodicity statements by the cyclotomic shift argument (Nikolaus–Scholze pp.364–365). These statements allow p = 2.

**Checks.**

- The relation ũv = p has a nonzero right side; an 𝔽p-polynomial ring would lose the extension.
- In degree 2, can has image pℤₚ and φ is onto; in degree −2 the roles reverse.
- Their difference is an isomorphism off degree zero and gives exactly the degree-zero and degree-minus-one TC groups of Layer 4.
- For 𝔽̄p the Artin–Schreier–Witt surjectivity changes the cokernel, so the finite-field negative group is not universal.

### 5.2 Coefficient rings, ghost coordinates and ramification

For a complete DVR A of mixed characteristic (0,p) with perfect residue k, construct a residue-identity embedding f:W(k)→A and, for a uniformizer π, an Eisenstein presentation A ≃ W(k)[X]/(φ_K), where

```text
φ_K(X) = X^e + pθ_K(X),     deg θ_K < e,     θ_K(0) ∈ W(k)×,
−p = π^e θ_K(π)⁻¹.
```

The embedding and presentation are proved here at this generality by the Cohen/Witt coefficient-ring theorem; the finite-residue proof using the maximal unramified p-adic subfield is a special case, not a proof for all perfect k (HM03 (2.2.1) p.33; Sharifi Lemma 6.3.3, Proposition 6.3.4 and Lemma 6.4.1 pp.130–133 for the finite-residue case). The embedding is `exists_wittVector_coefficientEmbedding`: for a domain A with `IsDiscreteValuationRing A`, `CharZero A`, `IsAdicComplete (IsLocalRing.maximalIdeal A) A`, residue field of characteristic p and `PerfectRing (IsLocalRing.ResidueField A) p`, there is an injective ring map f : W(k) → A with `(IsLocalRing.residue A).comp f = WittVector.constantCoeff`. Build it from Mathlib's `Perfection.teichmuller`, which gives the multiplicative lift of k into A, and the universal property of W(k) for p-adically complete targets. Its API includes the residue identity, uniqueness of f, finite freeness of A over f of rank e, derivative and ramification formulas, presentation change and finite-extension compatibility. For p odd, use this presentation throughout §§5.3–5.15.

Reuse ghost injectivity over p-torsion-free rings. Prove the Dwork image criterion `exists_ghostComponent_eq_iff`: in any commutative ring R with a ring endomorphism φ satisfying φ(x) ≡ x^p modulo p, a sequence (w_s) is the ghost sequence of a Witt vector exactly when w_s ≡ φ(w_(s−1)) modulo p^s for every s ≥ 1. Both directions hold without a torsion hypothesis: one solves p^s a_s = w_s − Σ_(i<s) p^i a_i^(p^(s−i)) successively. The same induction gives the length-n statement, a ghost sequence of Wₙ(R) being characterized by these congruences for 0 < s < n; when R is p-torsion-free the Witt vector is unique by ghost injectivity. Consequently, for p-torsion-free R, x ∈ pWₙ(R) exactly when every ghost coordinate of x is divisible by p and the coordinatewise quotient w(x)/p lies in the image of the ghost map; use φ(X_α) = X_α^p on ℤ[X_α] and φ = id on ℤ (HM03 §3.1 p.44). Prove `verschiebung_one_sub_teichmuller_mem`: for every commutative ring R, every Witt length n and odd p, V(1) ≡ [−p]ₙ modulo pWₙ(R); also prove [−1]ₙ ≡ −1 modulo pWₙ(R), and p-th-power additivity [x+y]ₙ^p ≡ [x]ₙ^p+[y]ₙ^p. Do not assume either Witt addition or the quotient ideal is componentwise (HM03 Lemmas 3.1.1–3.1.2 and equation (3.1.3), pp.45–46).

**Checks.**

- For A = ℤₚ take e = 1, π = p and θ = −1; for an unramified extension W(𝔽_(p^f)), use the same e but a larger coefficient field.
- For A = ℤₚ[ζₚ], π = ζₚ−1 and e = p−1, so the formulas involve π rather than substituting p.
- The sign congruences are not asserted uniformly at p = 2: over ℤ the congruence V(1) ≡ [−2]ₙ fails for n ≥ 3, and [−1]ₙ ≡ −1 fails already for n = 2. The named target `dyadic_witt_congruences_fail` records both failures at lengths three and two respectively. No failure over every ring is asserted.
- For R=𝔽ₚ[t]/(t²), x=V(t) in W₂(R) has zero ghost coordinates, yet x∉pW₂(R): pW₂(R) consists of (0,aᵖ), and t is not a p-th power. Thus the ghost-divisibility criterion needs p-torsion-freeness.
- At n = 1 the Witt quotient is A/p, while n = 0 is the zero-length Witt object.

### 5.2a The universal absolute logarithmic Witt complex

Fix an odd prime p and an arbitrary prelog ℤ_(p)-algebra α:M→R. Construct the category `AbsoluteLogWittComplex R M`. An object is a tower of nonnegatively graded log differential rings Eₙ with restriction R, maps λₙ:Wₙ(R)→Eₙ⁰ and dlogₙ:M→Eₙ¹ satisfying dλₙ[α(m)]=λₙ[α(m)]dlogₙ(m), and compatible F:Eₙ→Eₙ₋₁ and additive V:Eₙ₋₁→Eₙ. F is a graded-ring map and V an Eₙ-module map when its source is restricted along F. Require λ to commute with F,V, FV=p, FdV=d, Fd[a]=[a]^(p−1)d[a] and Fdlog(m)=dlog(m). Restriction commutes with these operators. Morphisms preserve the entire structure. The differential is absolute; it is not required to vanish on Wₙ(ℤ_(p)) (HM03 Definition 3.2.1 pp.47–48).

Construct `absoluteLogWitt R M` as the initial object, with API `uniqueMap` to every such complex, uniqueness and composition of that map, functoriality in prelog ring maps, and the canonical surjection Ω*_(Wₙ(R),M)↠Wₙω*_(R,M). Here Ω* denotes the universal absolute log differential algebra. Prove Wₙω⁰=Wₙ(R), and `absoluteLogWitt_levelOne`: Ω*_(R,M)≃W₁ω*_(R,M), compatible with d, dlog and multiplication. The construction uses the solution-set/limit argument for log Witt complexes: bound the subobject generated by λ(W(R)) and dlog(M) under R,F,V,d and products, and impose the Witt relations in the universal log differential algebra. Establish existence and uniqueness before using the universal map to TR; TR itself is not defined as the initial object (HM03 Proposition 3.2.2/Addendum 3.2.3 p.48; HM04 Theorem A p.2 and the log extension on p.4).

Define `standardLogWittFiltration s n i` for 0≤s≤n by

```text
Fil^s Wₙωⁱ = im(V^s:W_(n−s)ωⁱ→Wₙωⁱ)
              + im(dV^s:W_(n−s)ω^(i−1)→Wₙωⁱ),
W₀ω*=0,     Wₙω* / Fil^s ≃ W_sω*.
```

**API.** Each Fil^s is a differential graded ideal, filtration is decreasing and natural, R is onto, the displayed quotient is induced by R^(n−s), F(Fil^s)⊆Fil^(s−1) for s≥1 and V(Fil^s)⊆Fil^(s+1). Do not assert Fil^s·Fil^t⊆Fil^(s+t) in general. Derive dF=pFd, Vd=pdV and V(xdy)=V(x)dV(y) from the defining identities. For trivial log structure compare with the absolute ordinary complex, and in characteristic p with CrystallineCohomology's classical complex; compare to the relative complex by its canonical quotient, without identifying them (HM03 Lemma 3.2.4 pp.48–49; HM04 discussion after Theorem E p.5).

**Checks.**

- At n=1 the construction is absolute log differentials; for M=R× it recovers ordinary absolute differentials, with dlog(u)=u⁻¹du.
- At n=1, R=𝔽p[x,y] with trivial log structure has nonzero dx∧dy killed by p. Universal existence does not imply the higher-form divisibility proved only for the mixed-characteristic DVR in §5.5.
- For a DVR's canonical prelog structure, d[π]=[π]dlog π, and at level one its log residue sends dlog π to 1 while ordinary du has residue zero.
- Fil⁰ is the whole complex, Filⁿ=0, and quotient by Fil¹ is W₁ω*. Replacing the filtration by im V alone loses the dV generators.
- Over ℤₚ the absolute dV^s(1) classes contribute to dlog of principal units modulo p^ν, whereas the relative complex over ℤ_(p) kills them (HM04 p.5, Example 1.2.5). A Wₙ(ℤ_(p))-linear differential would fail this comparison.

*Needs:* supplied Witt vectors, universal absolute log differentials from CrystallineCohomology, graded differential algebra and categorical limits. Initiality, its solution set, level one and the filtration comparison are targets here; no universal relative-Witt assertion replaces them.

### 5.3 The residue coefficient map and modified Verschiebung

Define `wittResidueMap n : k →+* Wₙ(A)/p` by x ↦ [f(x̃)]ₙ^p, where x̃ lifts x^(1/p) to W(k). Prove independence of lift, additivity, multiplicativity, identity, compatibility Rρₙ = ρₙ₋₁ and Fρₙ = ρₙ₋₁Frob_k. This is the k-algebra structure used in all dimension statements; it is not the raw Teichmüller map (HM03 §3.1 p.45).

Define `modifiedVerschiebung` between successive quotients by Vπ(a) = θ_K([π]ₙ)V(a). Its API includes FVπ = 0, Vπ(1) = [π]ₙ^e, FdVπ(a) = θ_K([π])^p da in the log-Witt setting, the projection formula and the exact unit factors in iterates. Specifically Vπ^s(a) = θ_K([π]ₙ)V^s(c_sa), with c_s = ∏_(1≤j<s)F^j(θ_K([π]_(n−j))). These units cannot be omitted merely because images of the operators agree (HM03 (3.1.4) pp.45–46).

Prove Wₙ(A)/p has k-dimension ne, basis Vπ^s([π]^i) for 0 ≤ s < n, 0 ≤ i < e, and multiplication

```text
[π]^i Vπ^t([π]^j) = Vπ^t([π]^(p^t i+j)),
Vπ^s([π]^i)Vπ^t([π]^j) = 0          (0 < s ≤ t),
Vπ^s([π]^(e+i)) = Vπ^(s+1)([π]^(pi)),   Vπ^n = 0.
```

The last relation reduces out-of-range exponents (HM03 Proposition 3.1.5 pp.46–47). *Needs:* §5.2 and the actual Witt-vector carrier.

**Checks.**

- ρ₁ is the coefficient inclusion k → A/p; ρₙ(0) = 0 and ρₙ(1) = 1.
- Over ℤ₃ at n = 2 the lifts 2 and −1 of 2 ∈ 𝔽₃ give [2]₂ ≢ [−1]₂ modulo 3W₂(ℤ₃), so x ↦ [x̃]ₙ depends on the lift; the p-th power of a lift of x^(1/p) removes the choice.
- Over ℤₚ, θ = −1, so Vπ = −V. At odd p and n = 2 their values on 1 are distinct, detecting the sign.
- At n = 1 the source W₀(A)/p is zero; no negative-length source is introduced. The basis has e elements, not one unless the DVR is unramified.

### 5.4 Logarithmic differentials of the DVR

Apply the supplied universal log differential to M = A∩K×. Prove the residue exact sequence 0 → Ω¹_A → ω¹_(A,M) → k → 0, where res(a dlog b) = āv(b); its proof uses only that A is a DVR. Prove the relative sequence 0 → Ω¹_(A/W(k)) → ω¹_((A,M)/W(k)) → k → 0, with ω¹_((A,M)/W(k)) = (Ω¹_(A/W(k)) ⊕ (A⊗K×))/⟨da − a⊗a⟩, and, for a finite extension L/K with integral closure B of A, res_B∘i_* = e_(L/K)·(i∘res_A) (HM03 Proposition 2.2.2 p.33). For the relative module over W(k), prove it is cyclic on dlog π with annihilator ideal (πφ′_K(π)), and

```text
πφ′_K(π) = p(πθ′_K(π)−eθ_K(π)) ∈ pA.
```

The ideal is contained in pA; it equals pA precisely in the tame case p ∤ e. Reversing this containment would give a false ramified statement (HM03 Lemma 2.2.3 and Corollary 2.2.5, pp.34–35).

Describe the absolute module as the coefficient-differential divisible part plus the relative cyclic torsion description; identify the divisible part as the image of A⊗_(W(k))Ω¹_(W(k)). Prove ω^i for i ≥ 2 is uniquely divisible, using the exterior powers of this part. Identify ω¹[p] = (A/p)·dlog(−p), free of rank one over A/p. For finite extensions of complete DVRs prove logarithmic differential base change is an isomorphism exactly when the relative ramification index is prime to p; ordinary differential base change has the stronger unramified requirement (HM03 Lemmas 2.2.4,2.2.6 and Corollary 2.2.5, pp.34–36). The ordinary cyclic HH of a perfect characteristic-p field is concentrated in degree zero; derived HH over ℤ is a different construction, and THH has Bökstedt's degree-two class (HM03 proof of Lemma 2.2.4 p.34). *Needs:* §5.2 and universal log differentials, not a duplicate construction of them.

**Checks.**

- res(dlog π) = 1 whereas res(du) = 0 for an integral unit.
- Over ℤₚ, the relative annihilator is pA.
- For π^p = p, the ideal has the extra valuation contributed by e = p and is strictly smaller than pA.
- Tame ramification and unramified residue extension must both be tested, since logarithmic and ordinary base change have different criteria.

### 5.5 The twisted derivation and the homotopy-orbit module

For a prelog ℤ_(p)-algebra (R,M) define `frobeniusIterD : Wₙ(R) → ω¹_(R,M)` by

```text
F^(n−1)d(a₀,…,aₙ₋₁) = ∑_(j<n)a_j^(p^(n−1−j)−1) da_j.
```

It is a derivation for the module structure through F^(n−1), and d(F^(n−1)a) = p^(n−1)F^(n−1)da. Define `hW n i` as the quotient of ω^(i−1)⊕ω^i with the twisted Wₙ(R)-action

```text
a·(ω₁,ω₂) = (F^(n−1)a·ω₁, F^(n−1)a·ω₂−F^(n−1)da·ω₁)
```

by the image of ω ↦ (p^(n−1)ω,−dω). The API includes the two structure maps, the exact sequence from ω^(i−1)[p^(n−1)] through ω^i to hW and then ω^(i−1)/p^(n−1), naturality for log-ring maps, and the map N:hW→Wₙω given by dV^(n−1)ω₁+V^(n−1)ω₂. Prove exactness hW→Wₙω→_R Wₙ₋₁ω→0 for every such log ring. For the complete mixed-characteristic DVR (A,M) of §5.2 with its canonical log structure, additionally prove unique divisibility of Wₙω^i for i ≥ 2; this is not a theorem for arbitrary (R,M) (HM03 Lemma 3.2.5, Proposition 3.2.6 and Corollary 3.2.7 pp.49–50). *Needs:* the universal log-Witt complex and its actual F,V,d relations.

**Checks.**

- n = 1 gives hW₁ω^i ≃ ω^i; degree zero gives hWₙω⁰ ≃ R with the twisted action.
- On [a]ₙ the derivation is a^(p^(n−1)−1)da, and on V^(n−1)[a] it is da.
- The naive rule D₀(a) = d(a₀) fails twisted Leibniz: at n = 2,p = 3 on ℤ[x], D₀([x]²) = 2x dx, but F([x])D₀([x])+F([x])D₀([x]) = 2x³ dx. The actual Fd([x]²) is 2x⁵ dx.
- Over ℤₚ in length two, hW₂ω¹ has the expected extension by ω⁰/p, so dropping the first summand loses the orbit contribution.
- For R = 𝔽p[x,y] with trivial log structure, W₁Ω² contains the nonzero p-torsion class dx∧dy. Unique divisibility would fail; the DVR hypothesis on that conclusion is essential.

### 5.6 A basis for log-Witt forms modulo p

For the DVR of §5.2 at odd p, prove Wₙω*/p is concentrated in degrees zero and one, both of k-dimension ne. Set r(i) = v_p(i−pe/(p−1)) for 0 ≤ i < e; this argument is nonzero, so its p-adic valuation is finite. A degree-one basis consists of Vπ^s(π^i dlog π) when s ≤ r(i), and dVπ^s(π^i) when s > r(i), with 0 ≤ s < n. Prove the complementary vanishing statements and, with r=r(i)<n,

```text
dVπ^r(π^i) = p^(−r)(i−pe/(p−1)) Vπ^r(π^i dlog π).
```

The coefficient is a p-adic unit before reduction. Specify the module action, rather than only the dimensions. Put B_s = (p^(s+1)−1)/(p−1)−1. For 0 ≤ s,t < n, the products with dVπ^t(π^j) are

```text
s=0:   dVπ^t(π^(p^t i+j)) − i Vπ^t(π^(p^t i+j)dlog π),
0<s≤t: −i Vπ^t(θ(π)^(p^(t−s)B_s) π^(p^(t−s)i+j)dlog π),
s≥t:    j Vπ^s(θ(π)^(p^(s−t)B_t) π^(i+p^(s−t)j)dlog π).
```

The overlapping cases agree. Products with Vπ^t(π^j dlog π) are Vπ^t(π^(p^t i+j)dlog π) if s = 0, Vπ^s(π^(i+p^s j)dlog π) if t = 0, and zero if s,t > 0. Reduce large exponents using §5.3 (HM03 Proposition 3.4.1 pp.58–59). The linear independence here ultimately uses §5.14's TR dimension computation; first establish the spanning relations without it, then return to independence. *Needs:* §§5.3–5.5 and, for the final dimension, §5.14. This ordering avoids assuming the desired basis to prove that same dimension.

**Checks.**

- At n=1 the degree-zero and degree-one spaces each have dimension e, while degree two is zero. Confusing integral forms with their mod-p quotient would fail the last assertion.
- For p=3,e=1 the sole exponent i=0 has r(0)=1; level s=1 uses Vπ(dlog π), whereas s=2 uses dVπ²(1). Replacing the cutoff s≤r(i) by s<r(i) chooses the wrong generator at s=1.
- For p=3,e=1,s=t=1,i=j=0, both overlapping formulas give zero for Vπ(1)dVπ(1). At s=t=0 the two expressions give jπ^(i+j)dlog π. Omitting the −i term in the first expression would fail this degree-zero-level calculation.

### 5.7 Logarithmic trace structure maps

Construct `logTRAlpha n : M →* TRⁿ₀(A|K;p)` as a ↦ [a]ₙ, and `logTRDlog n : M → TRⁿ₁(A|K;p)` from the trace of multiplication by a as a self-weak-equivalence after inverting π. A nonzero a need not be an A-module automorphism. Its API is dlog(ab) = dlog a+dlog b, R- and F-invariance, dα(a) = α(a)dlog a, agreement with u⁻¹du for units, and the valuation boundary ∂dlog₁a = v(a). At odd p, or at n = 1 with the separate degree-one argument, prove the required logarithmic differential graded ring structure (HM03 §2.3 pp.36–39, Proposition 3.3.1 p.51). *Needs:* §4.8 and the Connes operator.

**Checks.**

- dlogₙ1 = 0, while ∂dlog₁π = 1.
- For an integral unit, the boundary is zero and dlog₁u = u⁻¹du, agreeing with Ω¹_A inside logTHH.
- dlog π cannot come from ordinary THH(A), since every class in that image has zero boundary.
- Multiplication by π is a weak equivalence in the q-model but not an A-module automorphism; defining dlog only on Aut_A(A) would omit it.

### 5.8 Ordinary THH of a complete DVR

For the mixed-characteristic DVR at odd p, prove the Lindenstrauss–Madsen p-completed calculation: π₀T(A;ℤₚ) = A, π₂ₘ₋₁ = A/(mφ′_K(π)) for m ≥ 1, and positive even groups vanish. Track the uniquely divisible integral pieces before taking completion; the completed formula does not assert their vanishing integrally (HM03 proof of Proposition 2.3.4 pp.39–40, citing Lindenstrauss–Madsen).

Describe the mod-p ring. If p | e it is (A/p)⊗Λ(α₁)⊗S(α₂). If p ∤ e, let C be the subalgebra of that algebra spanned by aα₁^εα₂^m with a ∈ 𝔪/p, or ε = 1, or p | m; quotient by the ideal generated by aα₁α₂^(m−1), a ∈ 𝔪^(e−1)/p and p ∤ m. In the wild case each degree has dimension e. In the tame case the dimension is e in degrees congruent to −1 or 0 modulo 2p and e−1 otherwise. Under reduction to k, α₁ maps to zero and α₂ to a specified unit times σ (HM03 §2.4 p.40). *Needs:* §§5.2–5.4, the ordinary THH computation and Bockstein. For A = ℤₚ, e = 1, positive degrees outside those two residue classes are zero; this is a useful negative control against extending the wild polynomial answer to all DVRs.

### 5.9 Logarithmic THH and κ

Prove ω^q_(A,M) → π_qT(A|K) is an isomorphism for q ≤ 2 and rationally in every degree. The logarithmic group in degree two is uniquely divisible. Define κ ∈ π₂(T(A|K);ℤ/p) as the unique Bockstein preimage of dlog(−p), and prove

```text
π*(T(A|K);ℤ/p) ≃ ω*_(A,M) ⊗_ℤ 𝔽p[κ],    |κ| = 2,
dκ = κ dlog(−p).
```

The API for `logKappa` includes its Bockstein characterization, naturality under extensions of the DVR, the polynomial-module decomposition, and the displayed Connes formula. First obtain the formula with a unit coefficient; then identify that unit as 1 via the reduction calculation below. This is Theorem B, not a claim about ordinary THH (HM03 Proposition 2.3.4 p.39, Theorem 2.4.1 p.41 and Remark 5.3.3 p.81).

The p-completed groups of logTHH have π₀ = A, π₂ₘ₋₁ = A/(mπφ′_K(π)), and positive even groups zero. The displayed identifications of odd groups are noncanonical and do not determine extension functoriality. For a finite tamely ramified Galois extension L/K, with integer rings B/A and group G, prove T(A|K) → T(B|L)^(hG) induces an isomorphism on homotopy with mod-p coefficients. ClassicalArithmeticCompletion §7.66 supplies projectivity of B over A[G] for this tame extension of Dedekind domains. Base change makes B/pB projective over (A/pA)[G], so its positive group cohomology vanishes. Since multiplication by p is injective on B and H¹(G,B)=0, taking G-invariants of 0→B→_p B→B/pB→0 identifies (B/pB)^G with A/pA. Section 5.4's tame logarithmic differential base change and the natural κ powers identify every nonnegative mod-p homotopy group with B/pB as a G-module. The homotopy-fixed-point spectral sequence collapses for each connective Postnikov truncation; passing to their inverse limit, with each homotopy degree stationary, gives the asserted descent map. When the residue field is finite, ClassicalArithmeticCompletion §7.88's normal integral basis gives the same calculation. For a wild cyclotomic extension ℚₚ(ζ_(p^n))/ℚₚ, n > 1, this descent assertion fails (HM03 Remark 2.4.2 p.43 and Theorem 2.4.3 p.44). *Needs:* §§4.8,5.4,5.7–5.8, group-cohomology spectra and ClassicalArithmeticCompletion §7.66's tame group-ring projectivity.

**Checks.**

- Over ℤ₃, the Bockstein of κ is the nonzero class dlog(−3); replacing κ by −κ gives its negative and fails the normalization. The degree-one dlog 3 class distinguishes logarithmic from ordinary THH of ℤ₃.
- Every mod-p degree of logTHH has dimension e, including the unramified e = 1 case.
- For the unramified degree-p extension W(𝔽_(p^p))/W(𝔽ₚ), G=C_p and B/pB=𝔽_(p^p) is a free 𝔽ₚ[G]-module with invariants 𝔽ₚ. Descent applies even though p divides the group order.
- The coefficient of κ is not obtained by applying the ordinary THH generator formula without the log relation.
- Positive integral uniquely divisible groups can survive while all their completed positive-even images vanish.

### 5.10 Low-degree TR without circular induction

Give TR* the supplied log-Witt universal map. The comparison hWₙω^i → hTRⁿ_i(A|K;p), (ω₁,ω₂) ↦ dV^(n−1)ι(ω₁)+V^(n−1)ι(ω₂), with ι: ω^i → π_iT(A|K) the canonical map, is Wₙ(A)-linear and an isomorphism for i ≤ 1; the same proof gives hWₙΩ¹_R ≅ π₁H_•(C_(p^(n−1)),T(R)) for every ℤ_(p)-algebra R (HM03 Remark 3.3.4 p.52). In degree two prove the exact sequence A/p^(n−1) → hWₙω² → hTRⁿ₂ → 0, with first map a ↦ (da,0): it is the kernel of the comparison that is this image, and hTRⁿ₂ is its cokernel. For n ≥ 2 identify the p-completed group by

```text
(F^(n−1))* (A/p^(n−1)) →_d (F^(n−1))* (ω¹_(A,M)/p^(n−1))
    → hTRⁿ₂(A|K;p,ℤₚ) → 0.
```

Define `[dlog π]ₙ` as the image of dlog π in this degree-two cokernel, not as the degree-one TR logarithmic class. Prove F:hTRⁿ₂(A|K;p,ℤₚ)→hTRⁿ⁻¹₂(A|K;p,ℤₚ) is onto with kernel generated as a Wₙ(A)-module by p^(n−2)[dlog π]ₙ (HM03 Lemmas 3.3.3,3.3.5 pp.51–53). At n = 2 the target hTR¹₂ after p-completion is zero, so the displayed class generates the source; at n = 1 the cokernel is zero because p⁰ = 1. These endpoint checks distinguish this quotient class from dlog₁π ∈ TR¹₁.

Prove first the low-degree short exact sequence and unique divisibility of TRⁿ₂ only for n ≤ 3, using the direct argument in the remark on p.56. This proves the connecting formula

```text
∂κ = dV(1) − V(dlog(−p))
```

of Addendum 3.3.9 pp.56–57 without using the all-level Frobenius-surjectivity theorem of §5.14. Use it in the Tate induction in §§5.12–5.13; then return to prove, for all n, 0→hTRⁿ_i→TRⁿ_i→TRⁿ⁻¹_i→0 for i ≤ 1, unique divisibility of TRⁿ₂(A|K;p) and TRⁿ₂(A;p), and Wₙω^q ≃ TRⁿ_q for q ≤ 2, rationally in every degree (HM03 Proposition 3.3.6, Addendum 3.3.7 and Theorem 3.3.8 pp.53–56; Lemma 5.6.1 p.95). *Needs:* §§5.5,5.7–5.9, the orbit spectral sequence and Layer 4 localization. The all-level conclusion is proved in §5.14, after Frobenius surjectivity has an independent proof.

**Checks.**

- At n=1 the p-completed degree-two orbit group is zero, while dlog₁π is a nonzero degree-one logarithmic class. These cannot be the same definition.
- For n=2 the Frobenius target is zero, so the W₂(A)-span of [dlog π]₂ is the whole source. The exponent p^(n−2) is one here; replacing it by p^(n−1) would kill the generator.
- In the quotient presentation exact logarithmic forms da map to zero. In particular the image of dπ=πdlog π vanishes; the quotient is not the entire module of logarithmic differentials.

### 5.11 Ramified coordinates and TR Bott classes

Suppose μ_p ⊂ K and choose primitive ζ. Construct the polynomial u_K of degree < e with u_K(π)^(p−1) = θ_K(π) and

```text
dlog ζ = −π^(e/(p−1))u_K(π)⁻¹ dlog(−p).
```

The divisibility p−1 | e follows from μ_p ⊂ K. The API for `lubinTateUnit` includes its degree bound, unit constant coefficient, the chosen-root normalization through dlog ζ, and the extension formulas below; the root equation alone admits several choices. Set α_K = u_K(π)⁻¹κ. Prove the presentation Λ(dlog π)⊗k[α_K,π]/(π^e), with dπ = πdlog π and dα_K = eα_Kdlog π. For a finite totally ramified extension with relative Eisenstein unit θ_rel, identify π_K ↦ −θ_rel⁻¹π_L^(e_rel), dlog π_K ↦ e_rel dlog π_L−dlog θ_rel, and α_K ↦ (−θ_rel)^(e_K/(p−1))α_L. The unit itself changes by u_K(π_K) ↦ (−θ_rel(π_L))^(−e_K/(p−1))u_L(π_L). The analogous formulas hold on the Ê² page of the Tate spectral sequence, with the indices {a,r,d}_K = (pa−d)e_K/(p−1)+r of §5.13 (HM03 (5.2.5) and (5.2.7)). These are formulas on the chosen coordinates, not invariant choices of roots (HM03 Lemma 5.2.1, Addendum 5.2.2 and Proposition 5.2.3, pp.75–77).

Define `trBott n ζ` as the trace of the K-theory Bott class with ℤ/p^ν coefficients. Its API is Bockstein dlogₙζ, uniqueness from the low-degree integral divisibility, compatibility with R,F and roots/coefficient changes, and additivity in ζ at odd p. For ν = 1, prove b₁ = −π^(e/(p−1))α_K and b^(p−1) equals the image of the chosen v₁ class, independent of the primitive root (HM03 §5.2 pp.76–78 and Lemma 6.1.2 p.97). *Needs:* §§1.2,5.10 and the ramified coordinates.

**Checks.**

- For K = ℚₚ(ζₚ), π = ζₚ−1 and e = p−1, the formula is b₁ = −πα_K; replacing π by p would give a different valuation and is wrong.
- For p = 3 and this π, θ(π) = 1+π in A/3 = 𝔽₃[π]/(π²). The normalized unit is u_K(π) = 1−π, whose square is 1+π; it gives α_K = (1+π)κ and b₁ = −πκ.
- The other square root −u_K still satisfies the root equation but reverses the nonzero dlog ζ formula. That formula selects the unit associated with ζ.
- For K = ℚ₃, e = 1 and μ₃ is absent; the μ_p-dependent unit and Bott-coordinate presentation above cannot be applied. Logarithmic κ itself still exists by §5.9.
- The trivial root has b = 0. If dlogₙζ ≠ 0, b has no integral lift; it is a coefficient class.
- Bockstein agrees with the trace of βζ from Layer 1, fixing both the sign and the root used.
- For a tame ramification index prime to p the differential multiplier remains visible; in a wild extension it can vanish modulo p.

### 5.12 Reduction, infinite cycles and the comparison theorem

When p | e, compute ordinary THH reduction to A/p, using the classes of §5.16:

```text
ρ*(κ̃) = σ − θ(π)⁻¹c₂
          − ε((e/p)π^(e−1)+θ′(π))θ(π)⁻¹dπ,
κ̃ ↦ σ under A → k,
dκ̃ = −θ′(π)θ(π)⁻¹dπ κ̃.
```

Here βε = 1, and the displayed map is a map of differential graded k-algebras. This determines the universal coefficient in dκ = κdlog(−p), also for fields with p ∤ e (HM03 Proposition 5.3.1 p.78, Lemma 5.3.2 p.80 and Remark 5.3.3 p.81).

For a perfect field k of odd characteristic, the mod-p Tate sequence has E² = Λ(u₁,ε)⊗k[t^±1,σ] and differential d²ε = tσ. Identify Γ̂(ε) and Γ̂(σ) by the permanent representatives u₁t⁻¹ and t⁻¹. For every mixed-characteristic K, dlog π is a permanent cycle representing Γ̂(dlogₙπ). If μ_p ⊂ K and 1 ≤ n < v_p(e), the representatives of Γ̂([π]ₙ) and Γ̂([π]ₙ^(e/p^n)) are π^(p^n) and −τα. Prove this first in ordinary THH, then through its map to logarithmic THH. Also identify −tκ^p and (−tκ)^(p^n) as permanent cycles representing the unit-image of v₁ and V(1) whenever they survive as nonzero classes. Do not infer nonvanishing just from permanence (HM03 Corollary 4.4.2 p.72, Propositions 5.3.4 and 5.3.6 and Lemma 5.3.5 pp.81–83 and Addendum 5.3.7 p.83).

Prove the elementary input `coeff_X_logDeriv_mul_char`: if k is a commutative ring of characteristic p, f ∈ k[[x]] is a unit with inverse g and x f′ g = Σ aᵢxⁱ, then a_(pi) = aᵢ^p for every i ≥ 0. Writing f = c∏_(n≥1)(1 − bₙxⁿ) gives aᵢ = −Σ_(n|i) n bₙ^(i/n), and Frobenius together with nᵖ = n in 𝔽ₚ proves the identity. Use it with the C_p differential calculation in §5.13 to prove `Γ̂ : T(A|K) → T(A|K)^{tC_p}` induces an isomorphism with mod-p coefficients in every nonnegative degree, for every K in the standing scope. Extend to Γ̂ and Γ at every level and with ℤ/p^ν coefficients. For the all-level step, apply NS Corollary II.4.9 p.265 with its strict bound i > −1, using its function-spectrum variant for the dual of the finite mod-p Moore spectrum. The cyclotomic equivalences identify the required geometric fixed-point inputs with the same bounded-below spectrum; the cartesian fixed/homotopy-fixed/Tate square converts the base Γ̂ hypothesis to the fixed-point comparison. Then use the coefficient cofiber sequences to pass to p^ν, retaining connectivity of the fixed-point source at the degree-zero endpoint. This finite-Moore argument does not assume finite residue field or interchange an uncontrolled inverse limit with homotopy. It is a connective comparison; negative Tate groups are not asserted to vanish (HM03 Lemma 5.4.1 and Proposition 5.4.2 pp.84–86, Theorem 5.4.3 p.86 and Addendum 5.4.4 p.87). *Needs:* §§4.3–4.5,5.9–5.11 and the appendix calculations in §5.16.

**Checks.**

- Over k, the nonzero differential on ε removes σ as a polynomial generator but preserves its inverse-filtration representative t⁻¹.
- For n = v_p(e), the deep-ramification representative −τα requires the endpoint replacement in §5.16.
- Γ̂ is an isomorphism in degree zero, while the Tate target has negative homotopy groups.
- The formal series f = 1−x gives a₀ = 0 and aᵢ = −1 for i ≥ 1, and therefore passes the p-th-power identity, including characteristic two as an elementary identity. A constant unit f = c gives aᵢ = 0; the case i = 0 is the identity 0 = 0ᵖ.

### 5.13 All Tate differentials and surviving bases

Assume μ_p ⊂ K or K = K₀. For a polynomial with coefficients in the perfect field k, superscript (j) means applying Frobenius j times to its coefficients, allowing negative j. At C_(p^n), use α = u_K^(-n)(π)⁻¹κ and τ = u_K^(-n)(π)^p t; put u_(K₀) = 1. The E²-algebra is

```text
Λ(uₙ,dlog π) ⊗ k[π,α,τ^±1]/(π^e).
χ(a,r,d) = (pa−d)e/(p−1)+r,
R_v = 2(p^(v+1)−1)/(p−1),    B_v = R_v/2−1.
```

For K₀ the value χ can be rational with denominator prime to p; use its p-adic valuation, with v_p(0) = ∞. For a ∈ ℤ, 0 ≤ r < e and d ≥ 0, the differentials on x = τ^aπ^rα^d with v = v_p(χ) < n, and on the exterior generator, are

```text
d^(R_v)(x) = λ(τα)^B_v τ dlog π · x,
d^(R_n−1)(uₙ) = μ(τα)^B_n τ,
λ = −λ_v p^(−v)χ · u_K^(v−n)(π^(p^v))^(−p),
μ = μₙ u_K(π^(p^n))^(−p).
```

Here λ_v,μₙ are the fixed nonzero elements of 𝔽ₚ supplied by the unramified calculation; λ and μ are units in A/p. All remaining differentials follow by multiplication and linearity; dlog π is permanent. The exact nonzero units matter when specifying a comparison on chosen generators, even though their values do not affect the dimensions (HM03 Theorem 5.5.1 and Remark 5.5.2 p.87).

Prove the page description as well as the differential lengths. For R_(s−1) < q ≤ R_s, 0 ≤ s < n, with R_(−1) = 0, the q-page is the sum of Λ(uₙ) times monomials x dlog π with v_p(χ) = v, 1 ≤ v < s, d < B_v, and Λ(uₙ,dlog π) times monomials x with v_p(χ) ≥ s. The final page is the sum of Λ(uₙ) times x dlog π with 1 ≤ v < n, v_p(χ) = v, d < B_v, and Λ(dlog π) times x with v_p(χ) ≥ n, d < B_n. Empty ranges contribute zero. Keep the filtration and bidegrees on this description; a dimension count alone loses Bott multiplication (HM03 Lemma 5.5.3 p.88).

In the unramified case obtain the successive nonzero differentials on t^(p^(v−1)), 1 ≤ v < n, and on uₙ, together with the permanent classes tκ^p and dlog(−p). Identify (−tκ)^(p^(s+1))dlog(−p), 1 ≤ s < n, with dV^(n−s)(1). In the deep-ramification range n < v_p(e), the successive differentials instead begin on π^(p^v), 0 ≤ v < n, with coefficient −λ_v; τ, α and dlog π survive (HM03 Propositions 5.5.4–5.5.5 pp.89–94). *Needs:* §5.12, the low-level argument of §5.10, and the spanning relations of §5.6. Complete the general induction using extensions with enough ramification and descent, retaining the coefficient changes under ramified base change.

**Checks.**

- For n = 1 the first differential is d² and the exterior generator dies on page 2p+1.
- When χ = 0 its valuation is ∞, so the monomial never enters a finite-v differential.
- With p = 3, e = 2 and x = α, χ = −1 and d² is nonzero; with x = τ α³, χ = 0.
- For n = 1, B₁ = p, so the final α-exponent bound is d < p.
- The deep-ramification and unramified cases have different first generators and cannot be identified by simply setting π = p in a ramified formula.

### 5.14 Bott multiplication and the pro-Witt comparison

Deduce integral surjectivity of F:TRⁿ_(2i+1)(A|K;p)→TRⁿ⁻¹_(2i+1)(A|K;p), for i ≥ 0, n ≥ 2, from the Tate calculation. This completes the all-level argument of §5.10. If μ_p ⊂ K or K = K₀, prove dim_k TRⁿ_q(A|K;p,ℤ/p) = ne for every q ≥ 0 (HM03 Lemma 5.6.1 pp.94–95 and Proposition 6.1.1 p.97).

For μ_p ⊂ K, compute Bott multiplication on the final-page basis. If r+e/(p−1) = a′e+r′, 0 ≤ r′ < e, multiplication by b sends the monomial τ^aπ^rα^d(dlog π)^δ to a nonzero unit times

```text
τ^(a+a′) π^r′ α^(d+a′+1) (dlog π)^δ.
```

Check χ is preserved. If q = q₁(p−1)+q₀, 0 ≤ q₀ < p−1, the representative of b^q has, up to its specified unit, exponents τ^q₁ π^(q₀e/(p−1)) α^(q₁+q). Prove that the image of the logarithmic Witt complex is exactly the portion with χ ≥ 0 (HM03 Lemmas 6.1.2–6.1.3 pp.97–99).

Construct the natural pro-isomorphism

```text
W•ω*_(A,M) ⊗_ℤ S_(ℤ/p^ν)(μ_(p^ν))
    → TR•_*(A|K;p,ℤ/p^ν),     μ_(p^ν) in degree 2,
```

when μ_(p^ν) ⊂ K. Equivalently, first reduce W•ω* modulo p^ν and then tensor over ℤ/p^ν; the integral Witt complex itself is not an ℤ/p^ν-module. R,F,V act as on Witt forms and identically on the root factor, and the differential of that factor is zero. This is an isomorphism of pro-graded groups with the stated operations. Do not upgrade it to a classification of every finite-level coefficient ring, especially for ν > 1. For ν = 1 prove the filtration estimate: choose N with p(q+1)e/(p−1) < p^N; the comparison is an isomorphism on associated grades s < n−N for Filˢ Eₙ = VˢE_(n−s)+dVˢE_(n−s). That estimate, and the fact that a sufficiently deep filtration is killed by restriction, prove the pro assertion (HM03 Theorem 6.1.4 pp.99–101, Theorem C p.5). Also prove the torsion pro-isomorphism W•(A)⊗μ_(p^ν)→W•ω¹[p^ν], x⊗ζ↦xdlog ζ (Remark 6.1.5 p.101). *Needs:* the spanning relations of §5.6, §§5.10–5.13 and coefficient Bockstein sequences.

**Checks.**

- For e = p−1 the Bott carry occurs already at r = e−1 and adds one to the α exponent beyond its degree contribution.
- At n = 1,q = 0 the dimension is e; at n = 2 it is 2e.
- In total degree zero the source at level n is Wₙ(A)/p^νWₙ(A). At n = 1 this is A/p^ν, whereas W₁(A) = A has characteristic zero and cannot itself be a module over ℤ/p^ν.
- Equality of these dimensions does not imply a levelwise Witt–Bott isomorphism.
- If K lacks primitive p^ν-th roots, no such root-factor formula is asserted over K without descent.
- At ν = 1, the exponent inequality gives a concrete restriction level that removes each negative-χ obstruction.

### 5.15 TC, Galois cohomology and the local trace

For finite extensions K/ℚₚ, p odd, identify mod-p logarithmic TC in nonnegative degree:

```text
TC_(2s)(A|K;p,ℤ/p) ≃ H⁰(K,ℤ/p(s)) ⊕ H²(K,ℤ/p(s+1)),
TC_(2s+1)(A|K;p,ℤ/p) ≃ H¹(K,ℤ/p(s+1)),      s ≥ 0.
```

The even splitting here is the natural one from HM03 Theorem 6.1.6 p.101; retain its proof through the Frobenius-fixed unit map in degree zero. Use the local Witt-complex calculation and Galois descent to obtain the positive-degree finite-coefficient comparison for every perfect-residue mixed-characteristic K in the standing odd-p scope. For higher ν retain the natural even short exact sequence and the abstract splitting unless a coherent natural higher-coefficient splitting has been constructed. A coefficient induction showing the abstract groups does not itself construct such a splitting.

For that perfect-residue extension, establish the additional arithmetic inputs at their stated scope: Br(k)[p] = 0, the p-torsion residue identification Br(K)[p] ≃ H¹(k,ℤ/p), the Artin–Schreier identification H¹(k,ℤ/p) ≃ k/(x^p−x), and cd_p(K) ≤ 2. These give H²(K,μ_p) and the cohomological vanishing used in the descent argument. The finite-residue local duality contract alone does not supply them when k is infinite; their proof is part of this application from the general henselian/Galois-cohomology foundations (HM03 proof of Theorem 6.1.6 pp.100–102, citing Serre's residue sequence and cohomological-dimension theorem). *Needs:* henselian residue theory, the inertia exact sequence, Artin–Schreier theory, normal bases and continuous cohomology.

First use the finite-algebra trace theorem: for A finite as a W(k)-module, with k perfect of characteristic p, connective K(A)^∧_p is the connective cover of TC(A;p)^∧_p (HM97a Theorems C–D p.ii (PDF2), §5 pp.32–35 and Appendix B pp.50–52). Combine this with the torsion-complex comparison and the two localization sequences of Layer 4 to prove

```text
K_i(K;ℤ/p^ν) → TC_i(A|K;p,ℤ/p^ν) is an isomorphism,   i ≥ 1.
```

The degree-zero comparison is not an isomorphism in general. This is the local trace theorem, rather than the assertion that THH(K) computes the logarithmic object (HM03 Theorem 6.1.10 pp.103–104 and introductory Theorem A pp.1–3). The odd groups become H¹(K,ℤ/p^ν(i)); the even groups fit the H²/H⁰ exact sequence recorded in §6.6. *Needs:* §§4.6–4.8,5.14 and the local Galois supplier, including its finite-module duality.

**Checks.**

- In degree zero the extra H²(K,ℤ/p(1)) is already a warning against extending the positive-degree trace theorem.
- For K = ℚ₃ and degree two, H²(K,ℤ/3(2)) = 0, while H⁰(K,ℤ/3(1)) = 0, so the mod-3 group is zero.
- For K = ℚ₃(ζ₃), both terms can be nonzero; replacing the full even group by the H² term loses the coefficient Bockstein contribution.

### 5.16 Monoid algebras and truncated polynomial THH

Prove the circle-equivariant equivalence T(A)∧N^cy(Π)→T(A[Π]) and its compatibility with the cyclotomic structure for a pointed monoid Π. For Π_e = {0,1,x,…,x^(e−1)}, split the cyclic bar construction by weight s ≥ 0, with weight zero S⁰. For positive s put d = floor((s−1)/e) and λ_d = ⊕_(i=1)^d ℂ(i). Give the cofiber sequence

```text
S^λ_d ∧ (𝕋/C_(s/e))₊ → S^λ_d ∧ (𝕋/C_s)₊ → N^cy(Π_e;s).
```

The first term is a point when e ∤ s. The second term generally is not; declaring both terms trivial loses all weights not divisible by e. Take the representation spheres from §4.0's genuine equivariant spectra, the divided power algebra Γ from Mathlib's `DividedPowerAlgebra`, and the big Witt groups 𝕎_N from the Conventions (HM97b Theorem B p.75 and Theorem 4.2.10 p.95; Hesselholt05 Theorem 5 p.17; HM03 Appendix A.1 pp.105–106).

When e = 0 in k, compute classical relative Hochschild homology as k[π]/(π^e)⊗Λ(c₁)⊗Γ(c₂), with |c₁| = 1, |c₂| = 2, dπ = c₁ and dγ_m(c₂) = 0. The periodic bimodule resolution has differential on c₂ given by the divided difference of x^e. For a perfect field k of characteristic p and p | e, the corresponding THH algebra has an additional polynomial σ in degree two, and its Connes differential is

```text
dγ_(m+1)(c₂) = −(e/p)π^(e−1)c₁γ_m(c₂)σ.
```

This separates the ordinary Hochschild differential from the topological one (HM03 equation (A.1.3) and Proposition A.1.4 pp.106–107).

With mod-p coefficients and odd p, prove the Tate differentials d²ε = tσ, d²π = tc₁ and d²γ_(m+1)(c₂) = −(e/p)tπ^(e−1)c₁γ_m(c₂)σ; identify the modified divided-power generator on the E³ page and prove all higher differentials vanish. For 1 ≤ n ≤ v_p(e), Γ̂([π]ₙ) is represented by π^(p^n). The representative of Γ̂([π]ₙ^(e/p^n)) is tc₂ for n < v_p(e), and −(e/p^n)uₙπ^(e−1)c₁ at n = v_p(e). Keep this endpoint in the reduction argument of §5.12 (HM03 Addendum A.1.6 and Proposition A.1.7 p.109). *Needs:* §§4.1,4.3–4.5, §4.0's representation spheres, and divided powers.

**Checks.**

- At e = 1 the relative augmentation ideal is zero; the cofiber model must be contractible in positive weights.
- For e = p, the coefficient e/p equals 1, so the THH divided-power differential need not vanish, although e = 0 in k.
- For e = p² it vanishes modulo p.
- In weight s = 1 < e, the circle-orbit term survives even though e ∤ s.
- At n = v_p(e), the displayed odd representative replaces tc₂.

### 5.17 Twisted TR and relative K-theory of nilpotent thickenings

**Characteristic-p motivic concentration** (`geisserLevine_motivicConcentration`). For every field F of characteristic p, n≥0 and ν≥1, prove H^j(F,ℤ/p^ν(n))=0 for j≠n and identify Hⁿ with Kₙᴹ(F)/p^ν, compatibly with differential symbols, field maps, norms and coefficients. Construct the cycle-complex comparison giving concentration from the characteristic-p cycle argument, then extend from p to p^ν through coefficient sequences. This is a target on `motivicCycles`' shared coefficient complexes and their actual field and norm maps, using §3.0's differential-symbol theorem; it does not assume the higher K-theory comparison (Geisser–Levine Theorem 8.1 pp.489–490 and Theorem 8.3 p.491).

**Checks.**

- In weight zero the degree-zero group is ℤ/p^ν; concentration does not imply its vanishing.
- For F=𝔽ₚ(t), the weight-one diagonal contains the nonzero class detected by dlog t, while degree zero in that weight vanishes.
- For F=𝔽ₚ(s,t), the weight-two diagonal contains the nonzero class of {s,t} modulo p; concentration means vanishing away from the diagonal, not vanishing in every positive weight.

First establish `geisserLevine_fieldComparison`: for every field F of characteristic p and n≥0, Kₙ(F) and Kₙᴹ(F) have no p-torsion, and the symbol map Kₙᴹ(F)/p^ν→Kₙ(F;ℤ/p^ν) is an isomorphism for every ν≥1. Its kernel and cokernel before coefficients are uniquely p-divisible; it is not an integral isomorphism in general. Prove naturality in field maps and coefficient changes, and compatibility of the symbol and trace maps. Use `geisserLevine_motivicConcentration`, §3.0a's shared cycle and moving maps, and `motivicToK`'s spectral sequence and diagonal symbol identification; Bloch–Gabber–Kato alone supplies only the differential-symbol half. For smooth schemes X over a perfect field, prove the Zariski sheaf comparison (K/p^ν)ₙ≃W_νω^n_log via their Gersten resolutions, where (K/p^ν)ₙ is the sheafification of U↦Kₙ(U;ℤ/p^ν), not a statement that all global K-groups equal global log forms (Geisser–Levine Theorem 1.1 p.460, Theorem 8.1 pp.489–490 and Theorem 8.3 p.491).

For an essentially smooth local 𝔽ₚ-algebra, construct the finite-length dlog/trace injection Kₙ(A)/p^ν↪W_νΩⁿ_A, identify its image as the subgroup generated by dlog symbols, and prove p-torsion freeness using the preceding sheaf comparison and local Gersten resolution. Track the two maps R,F:W_νΩⁿ_A→W_(ν−1)Ωⁿ_A in the same form degree. If C_νⁿ=ker(R−F), prove

```text
W_νΩⁿ_(A,log) ⊆ C_νⁿ ⊆ W_νΩⁿ_(A,log)+Fil^(ν−1)W_νΩⁿ_A.
```

Use SchemeAndStackFoundations §0.15 to express a regular noetherian local 𝔽ₚ-algebra A as a filtered colimit of essentially smooth local 𝔽ₚ-algebras. The base field 𝔽ₚ is perfect, so 𝔽ₚ→A is geometrically regular; localization at the preimages of the maximal ideal gives the required local diagram. Prove finite coefficients, finite-length Witt differentials, symbols and the displayed inclusions commute with this filtered colimit. Only then take the R-limit, using the standard filtration to remove the error term and controlling lim¹. Deduce `regularLocal_traceKernel`: for n≥0,

```text
Kₙ(A;ℤₚ) ≃ ker(1−F:WΩⁿ_A→WΩⁿ_A).
```

This is the finite-length-to-limit proof route of GH06 Theorem 3.1 p.19, using the supplied Popescu theorem (Stacks Theorem 16.12.1, tag 07GC). No interchange of arbitrary filtered colimits with homotopy inverse limits is asserted. This regular-local trace theorem is proved here once and consumed in §6.11.

**Comparison API and checks.** Retain ring-map and coefficient naturality, dlog of products of units, restriction and Frobenius, the relative kernel for split augmentations, and the trace map to the separately constructed TC object. For a perfect field F, positive-degree W_νΩⁿ_F=0 and positive p-coefficient K-groups vanish; K₀/p^ν is still ℤ/p^ν. For F=𝔽ₚ(t), dlog t is nonzero in degree one, while Ω²_F=0, so the positive-degree vanishing cannot be asserted for every field. For A=𝔽ₚ[[t]], the finite-length comparison applies through Popescu even though A is not of finite type; its principal units are detected in degree one. A singular ring such as 𝔽ₚ[ε]/ε² fails regularity and is not a permitted Popescu application. The R−F map has the same form degree on both sides; a degree n−1 target would fail even the degree-zero Artin–Schreier–Witt case.

For a regular noetherian 𝔽ₚ-algebra A and a complex circle representation λ, put ℓ_s = dim_ℂ λ^(C_(p^s)) for s ≥ 0 and ℓ_s = ∞ otherwise. Prove

```text
TRⁿ_(q−λ)(A;p) ≃
  ⊕_(r=1)^n ⊕_(ℓ_(n−r) ≤ m < ℓ_(n−1−r)) W_rΩ_A^(q−2m).
```

For λ = 0 only r = n contributes and the formula becomes ⊕_(m≥0) WₙΩ_A^(q−2m). Establish the smooth case first and extend at finite TR/Witt length through the preceding regular-to-smooth diagram over 𝔽ₚ; do not apply Popescu to singular algebras (Hesselholt05 Theorem 11 and Proposition 12 p.30; Hesselholt96 Theorem B p.2).

For an arbitrary 𝔽ₚ-algebra A, no longer assumed regular, let e = p^v e′ with p ∤ e′, I_p = {j ≥ 1 : p ∤ j}, and d(r,j) = floor((p^(r−1)j−1)/e), and define L_q(j) = lim_R TR^r_(q−λ_d(r,j))(A;p) and L′_q(j) with TR^(r−v), r ≥ v+1. Prove the relative TC exact sequence

```text
∏_(j∈e′I_p) L′_(q−1)(j) --e′V^v→ ∏_(j∈I_p) L_(q−1)(j)
  → TC_q(A[x]/(x^e),(x);p) → ∏_(j∈e′I_p) L′_(q−2)(j) → … .
```

The restriction level r belongs inside each inverse limit. It is not a second product index. Give the analogous sequence with ℤ/p^ν coefficients for an arbitrary ring A, and the degree bounds that make the relevant contributions finite (Hesselholt05 Proposition 8 p.24 and Lemma 9 p.26).

Deduce for regular noetherian 𝔽ₚ-algebras the exact sequence whose first two terms are

```text
⊕_(m≥1) ⊕_(j∈e′I_p) W_(s−v)Ω_A^(q−2m)
   --e′V^v→ ⊕_(m≥1) ⊕_(j∈I_p) W_sΩ_A^(q−2m)
   → K_(q−1)(A[x]/(x^e),(x)) → … ,
p^(s−1)j ≤ me < p^s j,       W_s = 0 for s ≤ 0.
```

The following terms use q−1−2m. This is integral relative K-theory and its groups are p-primary torsion. For a perfect field k, simplify it to K_(2m−1)(k[x]/(x^n),(x)) ≃ 𝕎_(mn)(k)/V_n𝕎_m(k), and K_(2m) = 0, m ≥ 1. The absolute augmentation sequence splits through k→k[x]/(x^n). Here 𝕎_N denotes big Witt vectors for the initial truncation set {1,…,N}, not the divisor truncation set of N (Hesselholt05 Theorem 13 p.33; HM97b Theorem A p.74).

In characteristic zero, prove first the rational relative cyclic-homology formula ⊕_(i≥1,e∤i) HH_(q−2 floor((i−1)/e))(A)⊗ℚ ≃ HC_q(A[x]/(x^e),(x))⊗ℚ. For regular noetherian ℚ-algebras, use nilpotent relative K/HC comparison and HKR to obtain

```text
K_(q−1)(A[x]/(x^e),(x)) ≃ ⊕_(m≥1) (Ω_A^(q−2m))^(e−1).
```

These groups are uniquely divisible and the relative spectrum admits its rational Eilenberg–Mac Lane decomposition (Hesselholt05 Proposition 7 p.22 and Theorem 10 p.28). Finally prove, for smooth k-algebras and then regular noetherian 𝔽ₚ-algebras, TRⁿ_* ≃ WₙΩ*⊗Wₙ(k)[σₙ], with Fσₙ = σₙ₋₁ and Rσₙ = pλₙσₙ₋₁ for units λₙ. The positive polynomial terms are pro-zero under R; the remaining de Rham–Witt transition system gives the required Milnor-limit comparison TR_* ≃ WΩ*. Derive the long exact TC sequence with 1−F on WΩ, including its relative version. The regular-local trace-kernel theorem above supplies the K-theory comparison in Layer 6, in addition to this TR/TC calculation (Hesselholt96 Theorems B–C p.2 and §1.2 p.5; GH06 Introduction p.3).

**Checks.**

- For n = 1 the truncated-polynomial relative groups are zero, since V₁ is the identity.
- For a perfect k and n = p, the relative K₁ agrees with the principal units 1+xk[x]/(x^p); its additive presentation is 𝕎_p(k)/V_p𝕎₁(k).
- For A[ε] in characteristic zero, K₁ relative is A and K₂ relative is Ω¹_A.
- For λ = 0, the inequality with ℓ_(−1) = ∞ preserves every nonnegative σ exponent.
- For e prime to p the first map is eV⁰ on its indicated weight summands, not multiplication by p.

### Examples

Carry out the log-THH and the first two Witt levels for ℤ₃, ℤ₃[ζ₃], and a totally ramified extension with e divisible by 9. Contrast their common formula dim_k TRⁿ_q = ne with their different Tate representatives. For the nilpotent example 𝔽₃[x]/(x²), K₁ relative has three elements and even positive relative groups vanish. The dual numbers over ℚ have relative K₁ = ℚ and K₂ = 0; over ℚ(t) the latter is the nonzero absolute differential module ℚ(t)dt.

### Dependencies

Layers 1 and 4; LocalFieldsRamification and the existing complete-DVR, Witt, divided-power and differential APIs; CrystallineCohomology for log differentials and classical characteristic-p Witt theory, §5.2a for the universal absolute log-Witt complex; equivariant homotopy theory for representation spheres and genuine fixed points; §4.4a's nilpotent relative trace theorem; local Galois cohomology for §5.15; SchemeAndStackFoundations §0.15 and the Geisser–Levine targets of §5.17 for its regular-local branch. These calculations do not use the integral local K-group classification of Layer 6 or a p-adic regulator.

## Layer 6: completed and integral higher K-groups of local fields

### 6.2 The completion exact sequence

Use the supplied Tate module `TauCeti.TateModule p B` of an abelian group, with transition multiplication by p on p-power torsion. On that carrier prove `tateModule_left_exact` for an exact sequence 0→B′→B→B″ (injectivity of `TauCeti.TateModule.mapLinearMap f` and equality of its range with the kernel of the map induced by g), `tateModule_torsionFree` (`Module.IsTorsionFree ℤ_[p]`), and `tateModule_eq_zero_of_boundedExponent`: if p^N kills B[p^∞] for some N, then Tₚ(B)=0. The bounded-exponent proof evaluates a compatible family at level n as p^N times its level n+N entry. Apply the supplied finite-rank criterion to prove `tateModule_prufer_pow` for B=(ℚₚ/ℤₚ)^r, finite r (Handbook 59 p.164, interpreting its inverse limit of torsion). Specialize StableHomotopyKTheory §7.11’s supplied completion extension to K(R). Under finiteness of K_n(R;ℤ/p^ν) and K_(n+1)(R;ℤ/p^ν) for all ν, identify

```text
0 → lim_ν K_n(R)/p^ν → K_n(R;ℤₚ) → T_p K_(n−1)(R) → 0,
ker(K_n(R)→K_n(R;ℤₚ)) = ⋂_ν p^ν K_n(R).
```

State the more general version with explicit Mittag–Leffler/derived-limit hypotheses, rather than silently dropping finiteness. If adjacent integral K-groups are finitely generated, the middle group is K_n(R)⊗ℤₚ. Without that hypothesis the Tate term can contribute an entire ℤₚ factor and a naive tensor product need not be the completion. The kernel is not automatically the maximal divisible subgroup (K-book IV.2.9 p.282; Handbook Completed K-theory59 and Warning 60 p.164). *Needs:* coefficient Bockstein and Milnor sequences, plus the already supplied Tate module.

**Checks.**

- A finite-exponent p-primary torsion group has zero Tate module; ℚₚ/ℤₚ has Tate module ℤₚ and zero ordinary p-completion.
- For a finitely generated group A, lim A/p^ν = A⊗ℤₚ.
- The ℤₚ contribution to completed K₂(ℂ) comes from T_pK₁(ℂ), while the ordinary p-completion of its divisible integral K₂ is zero.
- Tₚ(0)=0 and Tₚ(ℤ)=0, while Tₚ((ℚₚ/ℤₚ)^2) has rank two. The latter calculation rules out using the p-torsion subgroup itself, which has exponent p. The zero and bounded-exponent cases follow by the same compatibility argument, without a finite-generation hypothesis.

### 6.3 Cyclotomic invariants of a p-adic field

Let L/ℚₚ be finite, d = [L:ℚₚ], residue field 𝔽_q. W_i(L) = H⁰(L,ℚ/ℤ(i)) is the degree-zero continuous cohomology (the invariants) of the discrete Galois module ℚ/ℤ(i), whose twist is given by Tau Ceti's `localCyclotomicCharacter` as in LocalGaloisGroups Layers 0 and 5; ProfiniteCohomology supplies H⁰ and its functoriality, and the primary parts are the ℓ-primary components. The new result here is their local evaluation. For i ≠ 0, W_i^(p)(L) is finite cyclic. For odd p put r = [L(ζₚ):L], p^a = #μ_(p^∞)(L(ζₚ)). Then

```text
w_i^(p)(L) = p^(a+v_p(i)) if r | i, and 1 otherwise.
```

For p = 2 put 2^a = #μ_(2^∞)(L(√−1)), a ≥ 2. If √−1 ∈ L, the order is 2^(a+v₂(i)). If √−1 ∉ L and i is odd, it is 2. For even i and √−1 ∉ L, it is 2^(a+v₂(i)) in the exceptional case and 2^(a+v₂(i)−1) otherwise. Exceptional means that Gal(L(ζ_(2^ν))/L) is noncyclic for all sufficiently large ν; this is a condition on the cyclotomic tower, not on ramification alone. Prove w_(−i)^(p) = w_i^(p), and, for i ≥ 1,

```text
w_i(L) = (q^i−1)w_i^(p)(L).
```

Restriction and corestriction of W_i are those of ProfiniteCohomology's H⁰. For ℚₚ the odd-prime formula is p^(1+v_p(i)) if p−1 | i and 1 otherwise; for ℚ₂ it is 2 for odd i and 2^(2+v₂(i)) for even i (K-book Propositions VI.2.2–2.3 pp.470–471, Example VI.2.3.1 p.471). *Needs:* cyclotomic local extensions, the cyclotomic character, and finite-field Frobenius.

**Checks.**

- w₁^(p)(ℚₚ) = 1 for odd p and w₁^(2)(ℚ₂) = 2.
- The values w₂^(2)(ℚ₂) = 8 and w₆^(3)(ℚ₃) = 9 detect both the dyadic exception and the valuation of the twist.
- An unramified extension leaves the p-primary w₂ equal to 8,3,1 for p = 2,3,≥5 respectively; adjoining ζₚ instead makes the odd-prime p-primary part nontrivial in every positive twist.
- At i = 0 the invariant is infinite and these finite-order formulas do not apply.

### 6.4 Galois cohomology with all three coefficient systems

For i ≠ 0, prove H⁰(L,ℤ/p^ν(i)) = W_i^(p)(L)[p^ν], of order gcd(p^ν,w_i^(p)). On these groups, coefficient inclusions are eventually identities and coefficient reductions are eventually multiplication by p. Thus H⁰(L,ℤₚ(i)) = H⁰(L,ℚₚ(i)) = 0, whereas H⁰(L,ℚₚ/ℤₚ(i)) = W_i^(p)(L).

Import finite local Tate duality, including p = 2, in the precise form H²(L,ℤ/p^ν(j)) ≃ Hom(H⁰(L,ℤ/p^ν(1−j)),ℚ/ℤ), and cohomological dimension two. Deduce H²(L,ℤₚ(i+1)) ≃ ℤ/w_i^(p) for i ≠ 0: finite-level reductions are eventually bijections, while inclusions through a sufficiently large coefficient jump are zero. Consequently H²(L,ℚₚ/ℤₚ(i+1)) = 0. Twist one is exceptional: H²(L,ℚₚ/ℤₚ(1)) ≃ ℚₚ/ℤₚ.

For i ∉ {0,1}, local Euler characteristic and the coefficient sequence identify the torsion subgroup of H¹(L,ℤₚ(i)) canonically with W_i^(p)(L); the torsion-free quotient has rank d. Hence, noncanonically,

```text
H¹(L,ℤₚ(i)) ≃ ℤₚ^d ⊕ ℤ/w_i^(p),
H¹(L,ℚₚ/ℤₚ(i)) ≃ (ℚₚ/ℤₚ)^d ⊕ ℤ/w_(i−1)^(p).
```

The second follows from the natural exact sequence with H¹(L,ℤₚ(i))⊗ℚₚ/ℤₚ and H²(L,ℤₚ(i)). At i = 1, the free rank is d+1 by Kummer theory and the valuation; do not insert it into a formula whose rank is d (K-book VI.7 cohomology calculation p.508 and Remark VI.7.4.3 p.510; Handbook §5.6 p.165). *Needs:* §6.3, local finite-module duality and Euler characteristic, continuous cohomology and its coefficient limits.

**Checks.**

- Over ℚ₂, H⁰(ℤ/2^ν(2)) stabilizes as a group of order eight, but its inverse limit along reductions is zero.
- Its dual H²(ℤ/2^ν(3)) has inverse limit ℤ/8.
- H¹(ℚ₃,ℤ₃(1)) has rank two, while H¹(ℚ₃,ℤ₃(2)) has rank one.
- In twist one the divisible H² is nonzero, unlike every twist i+1 with i ≠ 0.

### 6.5 Residue-characteristic coefficients and the valuation ring

For a local field E of either characteristic, valuation ring V and residue characteristic p, prove K_n(V;ℤ/p^ν)→K_n(E;ℤ/p^ν) and K_n(V;ℤₚ)→K_n(E;ℤₚ) are isomorphisms for n ≥ 2. In degree one give instead the short exact valuation sequences with quotient ℤ/p^ν and ℤₚ respectively. Use Layer 1 to remove all positive-degree p-coefficient groups of the residue field, and retain its degree-zero term (K-book proof of VI.7.4 p.510; Handbook §5.6 p.165). *Needs:* localization, the finite-field computation, and the coefficient Milnor sequence.

**Checks.**

- The class of a uniformizer maps to 1 in ℤ/p^ν, so the degree-one map cannot be onto.
- Principal units contribute on both sides of that sequence.
- In degree zero both rings have rank group ℤ and finite coefficients ℤ/p^ν; the stated high-degree proof cannot be applied by ignoring this surviving rank term.

### 6.5a Periodic étale K-theory and field descent

**Field étale descent** (`periodicEtaleK`, `etaleKComparison`, `etaleDescentFiltration`, `quillenLichtenbaumField`). For a field F, a prime ℓ invertible in F and ν≥1, construct periodic étale K-theory with ℤ/ℓ^ν coefficients by étale hypercohomology of the Bott-periodic K-theory sheaf, its comparison from connective algebraic K and its descent filtration. Construct the separably closed coefficient identification π₂ᵢ=ℤ/ℓ^ν(i), π₂ᵢ₊₁=0, including nonnegative algebraic degrees before periodicization and all integer weights afterwards. Prove restriction, finite-separable transfer, coefficient, Bott and integral/coefficient product compatibility. For finite d=cd_ℓ(F), establish convergence and prove the comparison is an isomorphism in nonnegative degrees n≥d−1 and injective in nonnegative degree n=d−2. Obtain this range by comparing §3.0a's truncated motivic tower with the étale tower, not by assuming local-field K-groups. No chosen roots of unity in F are required (K-book VI.4.1–4.2 pp.479–481, Examples VI.4.5–4.8 pp.483–485; Thomason Theorems 4.1,4.11 pp.516,520). Henselian étale cohomological rigidity and field/Galois identification are consumed from EtaleCohomologyFoundations.

**Checks.**

- For separably closed F with ℓ invertible, d=0 and all nonnegative groups agree with the even Bott calculation; the periodic target also has negative even groups, unlike connective K.
- For finite F of characteristic different from ℓ, d=1 and the comparison covers degree zero; Frobenius acts in weight i by q^i.
- For finite L/ℚ₂ at ℓ=2, d=2 and the range starts at degree one. The two even filtration terms in degree two can form the nonsplit ℤ/4 extension of §6.6.
- In characteristic ℓ the hypotheses fail; logarithmic Witt symbols replace this invertible-coefficient argument. For a real closed field at ℓ=2, finite cd₂ fails as well.

*Needs:* §3.0a's shared `motivicCycles` complexes and maps, `motivicToK`'s norm residue and convergent tower, the supplied coefficient K-theory, EtaleCohomologyFoundations' étale/Galois and hypercohomology constructions, and coherent spectral limits.

### 6.6 The local étale edge comparison

Construct the coefficient edge map `etaleEdgeOne i ν` from K_(2i−1)(F;ℤ/ℓ^ν) to H¹(F,ℤ/ℓ^ν(i)), for i ≥ 1, ℓ invertible in F and cd_ℓ(F) ≤ 2, using the foundational motivic/étale comparison, its descent spectral sequence, and the Bott normalization of Layer 1. Its API must specify naturality among these fields, coefficient inclusions and reductions, products and the even H⁰ edge, the Kummer identification at i = 1, and trace compatibility in the odd-residue-characteristic local application. This is the descent edge used by local K-theory; prove that over finite fields it agrees with §1.8's independently constructed `finiteFieldEdgeOne`. Its construction requires the foundational motivic complexes, norm-residue comparison and descent theorem; these constructions and their hypotheses are targets of §§3.0a and 6.5a, independent of the local-field computations of this layer.

In the larger odd-p mixed-characteristic scope of Layer 5, construct the Dwyer–Friedlander comparison γ_K: K_n(K;ℤ/p^ν) → K_n^ét(K;ℤ/p^ν) and prove it is an isomorphism for n ≥ 1. Specify the étale object by the Thomason–Godement construction over finite Galois subextensions L/K, whose terms are K(L;ℤ/p^ν)^(hGal(L/K)). Its descent spectral sequence has E²_(s,t) = H^(−s)(K, colim_L K_t(L;ℤ/p^ν)). Require the separably closed coefficient calculation: even t ≥ 0 gives μ_(p^ν)^(⊗t/2), and odd t gives zero. The trace identifies this spectral sequence with the logarithmic TC comparison of §5.15. Do not assert that an arbitrary presheaf's homotopy fixed points satisfy descent without the sheafification and convergence argument (HM03 construction(6.1.8), spectral sequence(6.1.9), Theorem 6.1.10 pp.102–104). *Needs:* §5.15, the foundational étale sheafification construction and the separably closed coefficient theorem.

Prove for finite L/ℚₚ and every p, including two,

```text
etaleEdgeOne : K_(2i−1)(L;ℤ/p^ν) ≃ H¹(L,ℤ/p^ν(i)),
0 → H²(L,ℤ/p^ν(i+1)) → K_(2i)(L;ℤ/p^ν)
  → H⁰(L,ℤ/p^ν(i)) → 0,                         i ≥ 1.
```

The right edge is restriction to the separable closure followed by its Bott identification. Its composite with K_(2i)(L)/p^ν is zero. At odd p, Layer 5 also proves the comparison for the larger perfect-residue mixed-characteristic scope and gives a natural mod-p even splitting. At odd p retain the natural exact sequence, abstractly split, for higher coefficients; a coherent natural splitting is a separate proof obligation. At p = 2 assert only the exact sequence, with no splitting. Use the motivic descent argument for finite p-adic fields, not the odd-prime Tate calculation (Handbook Theorem 61 and proof p.165; HM03 Theorem A p.2 and Theorem 6.1.10 pp.103–104; K-book Exercise VI.7.3 p.512).

Compare this descent edge with §1.8's ordinary Chern operations. Prove agreement of its finite-field restriction with `finiteFieldEdgeOne`, including the geometric Bott generator, arithmetic Frobenius and coefficient/Bockstein maps. Thus `chern_edge_finiteField` retains the signed factorial (−1)^(i−1)(i−1)!, whereas `chern_unit_bott` remains valid independently of any local comparison theorem. The ordinary operation is not automatically an isomorphism when the factorial is not a coefficient unit (WeibelChern Proposition 5.1 p.24). *Needs:* §§1.8,3.0a,5.15,6.4–6.5a, and cd_p(L)=2 for finite p-adic L.

**Checks.**

- At i = 1 the edge is the ordinary Kummer map, and c_(1,1) has multiplier +1. At i = 2 over 𝔽₇ with modulus three and ζ=2, c_(2,1)([2]β₂)=−κ(2)⊗2, the negative of the normalized edge. Since 2 is not a cube in 𝔽₇×, this nonzero order-three value detects the sign that mod-two tests cannot distinguish.
- At i = 3 with mod-2 coefficients, the factor 2! is zero. For 𝔽₃ the relevant K₅ mod 2 and H¹(𝔽₃,ℤ/2(3)) both have order two; an ordinary c_(3,1) with this normalization is zero, whereas the edge is an isomorphism. The same factorial obstruction prevents calling every local odd-degree isomorphism an ordinary Chern class.
- For ℚ₂ in degree two, K₂(ℚ₂;ℤ/2) ≃ ℤ/4, not (ℤ/2)²: naturality of the mod-two Bott class gives 2β₋₁ = red{−1,−1}, which is nonzero by its quadratic Hilbert symbol −1. Bockstein sends β₋₁ to −1. Thus the H² and H⁰ terms, each of order two, form a nonsplit extension (K-book IV.2.5.1–2.5.3 pp.280–281 and III.6.2.3–6.2.4 pp.233–234). Replacing the middle group by either H² alone or H²⊕H⁰ is false.
- For a finite field of characteristic p, an ℓ-adic edge with ℓ ≠ p is unramified Frobenius cohomology. This does not authorize an unramified description for p-adic coefficients at a place over p.

### 6.7 Completed groups and explicit small-prime values

Finite-level groups over L/ℚₚ are finite, so pass to inverse limits in §6.6. The H⁰ term has limit zero by §6.4. Obtain canonical cohomological identifications, and abstract module descriptions,

```text
K_(2i)(L;ℤₚ) ≃ H²(L,ℤₚ(i+1)) ≃ ℤ/w_i^(p),       i ≥ 1,
K_(2i−1)(L;ℤₚ) ≃ H¹(L,ℤₚ(i)) ≃ ℤₚ^d ⊕ ℤ/w_i^(p), i ≥ 2.
```

These are also the groups of V in degrees ≥ 2. The odd torsion identification with W_i^(p) is canonical; the free summand is not. For divisible coefficients obtain K_(2i)(L;ℚₚ/ℤₚ) ≃ W_i^(p), i ≥ 1, and K_(2i−1)(L;ℚₚ/ℤₚ) ≃ (ℚₚ/ℤₚ)^d⊕ℤ/w_(i−1)^(p), i ≥ 2. Derive the latter from coefficient colimits or the universal-coefficient sequence, with the coefficient inclusion maps retained (K-book VI.7.4 and Corollary VI.7.4.1 pp.509–510; Handbook Theorem 61 p.165).

Evaluate over ℚ₂: K₂ completed = ℤ/2, K₃ = ℤ₂⊕ℤ/8, K₄ = ℤ/8, K₅ = ℤ₂⊕ℤ/2. Over ℚ₃: K₂ completed = 0, K₃ = ℤ₃⊕ℤ/3, K₄ = ℤ/3, K₁₁ = ℤ₃⊕ℤ/9. Over ℚₚ, p ≥ 5, K₃ completed = ℤₚ; for every odd p, K_(2p−3) completed = ℤₚ⊕ℤ/p. For unramified L, completed K₃ is ℤₚ^d plus torsion of order 8,3,1 at p = 2,3,≥5. For ramified L such as ℚₚ(ζₚ), p-primary K₃ torsion can occur for every odd p. *Needs:* §§6.2–6.6.

**Checks.**

- K₃ at two has order-eight torsion, not order two.
- A formula replacing w_i^(p) by w_i would wrongly retain prime-to-p torsion under p-completion.
- The ordinary integral groups are uncountable by §6.10, despite the finite generation over ℤₚ of these completed groups.
- The i = 1 odd formula has rank d+1 and is deliberately outside the rank-d display.

### 6.8 Integral groups, divisible ranks and lattices

For every i ≥ 1, K₂ᵢ(L)⊗ℚₚ/ℤₚ = 0 and the Bockstein K₂ᵢ(L;ℚₚ/ℤₚ) → K₂ᵢ₋₁(L){p} is an isomorphism, so K₂ᵢ₋₁(L){p} ≅ ℤ/w_i^(p)(L); this is the p-primary part of the e-invariant, which is therefore bijective onto W_i^(p)(L), and Tₚ(K₂ᵢ₋₁(L)) = 0. For i = 1 this group is μ_(p^∞)(L) ⊂ L× (K-book proof of Proposition VI.7.3, p.509). For i ≥ 2, identify the torsion subgroup of K_(2i−1)(L) with ℤ/w_i(L), with its e-invariant an isomorphism to W_i(L). The torsion-free quotient T_i is a ℤ_(p)-module. Prove the abstract splitting K_(2i−1)(L) ≃ T_i⊕ℤ/w_i(L); keep the torsion subgroup canonical and the complement noncanonical. The identification of the p-part of this torsion with W_i^(p) must agree with the connecting map in H¹ of §6.4 (K-book Proposition VI.7.3(a) p.509; Handbook Theorem 61 p.165).

For i ≥ 1 put D_i = Div(K_(2i)(L)). Prove first that the integral Bockstein filtration agrees with the étale filtration: K_(2i)(L)/p^ν maps isomorphically onto H²(L,ℤ/p^ν(i+1)) in §6.6, and its quotient K_(2i−1)(L)[p^ν] maps isomorphically onto H⁰(L,ℤ/p^ν(i)). In particular K_(2i)(L)/p^ν is cyclic of order gcd(p^ν,w_i^(p)). This identifies the actual integral image and torsion quotient, beyond the abstract order of the finite-coefficient group (K-book proof of Proposition VI.7.3 p.509, using VI.4.5(ii) p.483). Then establish

```text
D_i = w_i(L)K_(2i)(L) = ⋂_(m≥1)mK_(2i)(L),
K_(2i)(L) ≃ D_i ⊕ ℤ/w_i(L),
K_(2i)(V) ≃ D_i ⊕ ℤ/w_i^(p)(L),
D_i ≃ ℚ^(κ_i) ⊕ (ℚₚ/ℤₚ)^(λ_i),       λ_i ≤ d.
```

D_i is a divisible ℤ_(p)-module; unique divisibility holds exactly when λ_i = 0. For i = 1 Moore's theorem identifies D₁ = U(L) and λ₁ = 0. No vanishing assertion for the unknown higher λ_i is needed here (K-book Proposition VI.7.3(b) p.509 and Warning VI.7.5 p.510).

Use §6.2 to identify T_pK_(2i)(L) = T_pD_i ≃ ℤₚ^(λ_i), the quotient of K₂ᵢ₊₁(L;ℤₚ) in its completion sequence. With t_i = dim_(𝔽p)T_i/pT_i, prove

```text
0 → lim_ν K_(2i−1)(L)/p^ν → K_(2i−1)(L;ℤₚ)
  → T_pD_(i−1) → 0,
t_i + λ_(i−1) = d,      i ≥ 2.
```

After a torsion splitting, the left term is T_i^∧⊕ℤ/w_i^(p), not generally T_i⊗ℤₚ. In particular t₂ = d. Derive the finite-level odd group, for i ≥ 2,

```text
K_(2i−1)(L;ℤ/p^ν) ≃ (ℤ/p^ν)^d
  ⊕ ℤ/gcd(p^ν,w_i^(p)) ⊕ ℤ/gcd(p^ν,w_(i−1)^(p)).
```

Both adjacent w-invariants bound the stable range; ν large relative only to w_i is insufficient (K-book Remark VI.7.3.1 p.509 and Corollary VI.7.4.1 p.510; Handbook p.165).

Finally find P ≃ ℤ_(p)^d in K₃(V) = K₃(L), meeting torsion trivially, whose completion maps isomorphically to the free quotient of completed K₃. Write T₂ = Div(T₂)⊕R, with P ⊂ R and R/P a ℚ-vector space. This does not prove R = P⊕(R/P). An injective divisible kernel splits; a divisible quotient need not split (Handbook Corollary 63 p.166; K-book Corollary VI.7.4.2 and Warning VI.7.5 p.510). *Needs:* §§0.0,2.3,2.5,3.5,6.2–6.7 and the e-invariant detection theorem.

**Checks.**

- At i = 1 the even torsion of V is the wild p-primary factor, which can be nonzero.
- For ℚ₂, i = 2, ν = 1 the odd finite-coefficient group has three order-two factors: one free reduction and two adjacent torsion contributions.
- For ℚ₃, i = 3, the w₂ contribution survives even though w₃^(3) = 1.
- The rank identity at i = 2 uses λ₁ = 0; extending t_i = d to every i would assume the vanishing of all higher divisible p-ranks.

### 6.9 What the integral completion map retains

For even degree, identify the completion map with the projection of K_(2i)(L)/D_i ≃ ℤ/w_i(L) onto its p-primary part. It is onto, with

```text
ker κ = w_i^(p)K_(2i)(L) = D_i ⊕ K_(2i)(L){p′}.
```

On p-primary torsion its kernel is precisely D_i{p}; on the cohomological target it is the isomorphism of §6.7. For odd degree i ≥ 2, prove

```text
ker κ = Div(K_(2i−1)(L)) ⊕ K_(2i−1)(L){p′},
0 → T_i^∧/image(T_i) → coker κ → T_pD_(i−1) → 0.
```

The first kernel summand is a ℚ-vector space. The first cokernel term is a ℚ-vector space. The image is dense in the closed subgroup lim K_(2i−1)(L)/p^ν inside the completed group; it is dense in the whole completed group exactly when λ_(i−1) = 0. On p-primary torsion κ is an isomorphism onto the torsion of H¹(L,ℤₚ(i)). Record all these kernels and cokernels when using integral classes to define a regulator; an isomorphism after p-completion cannot recover the invisible divisible classes (K-book VI.7.4 proof and Warning VI.7.5 p.510; Handbook Warning 60 p.164 and Remark 62 p.165). *Needs:* §§0.0,6.2,6.7–6.8.

**Checks.**

- For even degree the prime-to-p residue factor has order q^i−1 and is killed, while any divisible p-primary factor is also killed.
- In odd degree the finite p-primary torsion survives injectively.
- For K₃ the image is dense by λ₁ = 0; density is weaker than surjectivity and does not supply a lattice splitting.
- A rank-d completed group alone does not determine t_i and λ_(i−1) separately.

### 6.10 Uncountability and the Milnor summand

Prove an independent positive-characteristic cardinality argument. For finite k, E = k((t)) is uncountable, while an algebraic extension of a rational function field on a countable set over k is countable. Thus any transcendence basis B of E/k is uncountable. Put F = k(B). Fix distinct a₁,…,a_r ∈ B, r ≥ 0. Iterated discrete residues, in the last-slot normalization, define integer-valued maps on K^M_(r+1)(F) that separate the symbols {a₁,…,a_r,b_j}, j ∈ B∖{a₁,…,a_r}. Specify the order of the valuations so that each matching symbol has residue +1. If an integral relation becomes zero over E, its finite presentation descends to a finite intermediate extension F⊂L⊂E. Transfer back to F multiplies it by [L:F], with no separability assumption. Applying the separating maps proves every coefficient zero. Hence algebraic Milnor K_n(E) contains an uncountable independent family for every n ≥ 1. This uses actual Milnor K-theory, not its topological quotient (K-book III.7.3 p.246, III.7.5.3 p.248, and III.7.6.1 discussion p.249).

**Diagonal Milnor-valued Chern map** (`diagonalChernMilnor`). For every field F and n≥1 construct c_(n,n):Kₙ(F)→Hⁿ(F,ℤ(n))≃Kₙᴹ(F) from the integral motivic Chern classes, with field-map naturality and the product formula. Prove that its composite with the symbol map Kₙᴹ(F)→Kₙ(F) is multiplication by (−1)^(n−1)(n−1)! (K-book V.11.11–11.14 pp.457–459, especially Lemma V.11.13 p.458). *Needs:* §3.0a's `motivicCycles` integral complexes and products, `motivicToK`'s identification of their diagonal with the common Milnor carrier, the supplied Quillen K-theory and the integral motivic projective-bundle/splitting construction of Chern classes from V.11.11–11.14, built here with these complexes.

**Checks.**

- At n=1 this composite is identity on F×.
- At n=2 it is −1 on every Matsumoto symbol, detecting the sign.
- At n=3 it is multiplication by 2. Division by this scalar gives a retraction only on a uniquely divisible Milnor group, not on an arbitrary field's K₃ᴹ.

For either kind of local field, prove K^M_n(E) is uniquely divisible for n ≥ 3 using norm-residue comparison, local cohomological dimension and the separate torsion/divisibility theorem. The positive-characteristic vanishing of ordinary forms in degree ≥ 2 does not prove uncountability; the preceding residue argument supplies that missing step. Use the comparison K^M_n→K_n and its reverse map with composite (−1)^(n−1)(n−1)! to get a retraction after dividing in K^M_n. Its image lies in K_n(V), since the finite residue K-group cannot receive a nonzero map from a divisible group. Together with the uncountable Moore kernel for n = 2, conclude K_n(E) and K_n(V) are uncountable and not finitely generated for all n ≥ 2 (K-book Proposition VI.7.1 pp.507–508 and Lemma V.11.13 p.458; Handbook §5.6 p.163). *Needs:* §§3.0–3.0a for Milnor residues, arbitrary finite-extension norms, filtered colimits and norm residue; `diagonalChernMilnor`, the local cohomological-dimension theorem and the local Milnor divisibility argument of K-book VI.7.1.

**Checks.**

- At r = 0 the symbols are units and the separating map is an ordinary valuation.
- A purely inseparable intermediate extension still has positive integer degree, so multiplication by that degree detects the integer residues.
- The proof gives uncountability even though Ω²_(k((t))) = 0.
- Tensoring a finite-rank completed group with ℚₚ does not contradict the uncountable rational summand in integral K-theory.

### 6.11 Equal characteristic: de Rham–Witt and the integral answer

Let V = 𝔽_q[[t]], E = 𝔽_q((t)), I = (t). From the p-basis of size one, prove WₙΩ^j_V = WₙΩ^j_E = 0 for j ≥ 2. On the relative infinite de Rham–Witt groups, prove 1−F is onto and its kernel is the big de Rham–Witt group 𝕎Ω^(j−1)_(𝔽q) = ∏_(p∤r,r≥1) WΩ^(j−1)_(𝔽q). It is nonzero only at j = 1, where it is ∏_(p∤r)W(𝔽_q) (GH06 Theorem B p.3, Proposition 2.8 p.16 and end of §2 p.18).

Consume §5.17's `regularLocal_traceKernel` (GH06 Theorem 3.1 p.19): for a regular local 𝔽ₚ-algebra A, the trace identifies K_j(A;ℤₚ) with ker(1−F:WΩ^j_A→WΩ^j_A). Its relative A[[t]] version requires A finite over A^p. For V the coefficient-field splitting gives K(V) ≃ K(𝔽_q)∨K(V,I), and

```text
K_j(V,I;ℤₚ) ≃ 𝕎Ω^(j−1)_(𝔽q),
K₁(V;ℤₚ) ≃ U₁ = 1+t𝔽_q[[t]],
K₁(E;ℤₚ) ≃ U₁×ℤₚ,
K_j(V;ℤₚ) = K_j(E;ℤₚ) = 0,                   j ≥ 2.
```

Prove finite-coefficient vanishing K_j(V;ℤ/p^ν) = K_j(E;ℤ/p^ν) = 0 for j ≥ 2 and every ν as well, either from the same comparison and coefficient sequence or from CMM Theorem 6.5 pp.52–53 with p-dimension one, while K₁(E;ℤ/p^ν) = E×/E×^(p^ν). Hence the completion map κ: K_j(E) → K_j(E;ℤₚ) is zero for j ≥ 2; in equal characteristic there is no analogue of the rank [L:ℚₚ] or of the p-primary finite components. Deduce unique p-divisibility in degrees ≥ 2 and absence of p-torsion in degrees ≥ 1. Combine prime-to-p rigidity, Layer 2 localization and the uncountability of §6.10 to obtain, for n ≥ 2,

```text
K_n(V) ≃ K_n(𝔽_q) ⊕ U_n,
K_n(E) ≃ K_n(V) ⊕ K_(n−1)(𝔽_q),
U_n = ker(K_n(V)→K_n(𝔽_q)) uniquely divisible and uncountable.
```

The coefficient field fixes the first splitting; Layer 2 gives the canonical integral high-degree localization splitting. Thus K_(2i)(E) ≃ U_(2i)⊕ℤ/(q^i−1), and K_(2i+1)(E) ≃ U_(2i+1)⊕ℤ/(q^(i+1)−1), i ≥ 1; Div(K_n(E)) = U_n. For p ∤ m the coefficient groups split into the two finite-field terms; for p^ν they vanish above degree one. This is the equal-characteristic integral answer, not a zero integral group (K-book Theorem VI.7.2 p.508; Handbook Theorem 56 pp.162–163). *Needs:* §§1.6,2.1–2.3,5.17,6.5,6.10 and the regular-local characteristic-p trace theorem.

**Checks.**

- For 𝔽₂((t)), integral K₂ is uniquely divisible and uncountable, though every mod-2^ν K₂ vanishes.
- For 𝔽₃((t)), K₂ has a residual order-two summand, and K₃ an order-eight summand.
- In degree one U₁ is nonzero and multiplication by p is injective but not onto; the high-degree unique-divisibility claim cannot include it.
- The product over p-prime indices is required to recover all principal units, not just one copy of W(𝔽_q).

### 6.12 The odd-prime homotopy type

For finite L/ℚₚ, p odd, put d=[L:ℚₚ], r=[L(ζₚ):L], p^a=#μ_(p^∞)(L(ζₚ)), choose a topological generator g of ℤₚ×, and set k=g^(p^(a−1)(p−1)/r). The cyclotomic image Γ′_L is the open subgroup generated by k. With §0.2's completed operation let Tₖ=fib(ψᵏ−1:KUₚ→KUₚ) and let FΨᵏ be the rank-inclusive fibre of ψᵏ−1:ℤ×BU→BU after p-completion. Prove the space equivalences

```text
(ℤ×BGL(L)⁺)^∧_p ≃ FΨᵏ × BFΨᵏ × U^d,
(ℤ×BGL(V)⁺)^∧_p ≃ FΨᵏ × BFΨᵏ × U^(d−1) × SU.
```

Here U, SU and BU are p-completed stable complex unitary spaces. FΨᵏ=Ω∞τ≥0 Tₖ has component group ℤₚ and positive odd homotopy ℤₚ/(k^i−1); its even positive groups vanish. Define BFΨᵏ=Ω∞Στ≥0 Tₖ, a connected delooping. It is not Ω∞ΣTₖ, which has extra components. Establish the following intervening targets before deriving the displayed answer (HM03 Theorem D p.6; K-book Theorem VI.7.9 p.511; Handbook Theorem 67 p.167).

**Root lifting before the retract.** Define `rootSpectrumMap A : Σ∞Bμ_(p^∞)(A)₊→K(A)` from the rank-one representation, natural in commutative rings. For the retraction fix b≥1, S=ℤ[1/p,ζ_(p^b)] and a residue field E at a prime away from p with vₚ(#E−1)=b. Reduction identifies μ_(p^∞)(S) with μ_(p^∞)(E)=μ_(p^b). In the following zero-space construction all spectra are p-localized. Construct `rootSpaceRetraction`: a map s:Ω∞₀K(E)→Ω∞₀Σ∞Bμ(E)₊ such that f_E∘s=id and f_S∘s∘f_E=f_S on connected zero spaces. Use §0.5 to construct this actual retraction with both homotopies, first over ℤ[ζ_(p^b)] and then compose with inversion of p. Apply §0.4's Φₚ to get the corresponding height-one localized spectrum maps. Write h=f_S∘s after applying Φₚ. Then h∘f_E=f_S and reduction∘h=id. To prove h multiplicative, precompose its two multiplication candidates with f_E∧f_E, which has right inverse s∧s, and cancel; both composites agree because f_E,f_S are ring maps. The unit, tower and Galois identities follow by the same split-epimorphism cancellation. This proves ring-map compatibility in the homotopy category without assuming Φₚ monoidal or s multiplicative (DM Propositions 5.7–5.8 and proof of Theorem 5.4, p.20, with the p-local convention of §1.13 p.6). Changing the primitive root must commute with its automorphism; applying Φₚ to a retraction preserves its section identity. The hypothesis b≥1 is essential to this contract: when μ=1 the source is the p-local sphere, whose positive stable homotopy need not vanish, and the retraction is not asserted.

**Cyclotomic comparison and retract.** Construct `localCyclotomicRetract`: a map from height-one localized K(L) to Tₖ and a section, with reduced fibre Kʳᵉᵈ_L, rather than assuming a wedge decomposition. Use Dirichlet primes in the required congruence class to choose an auxiliary finite field of prime cardinality q₀≠p whose Frobenius generates Γ′_L (DM §13, p.55). Use its supplied Brauer comparison, compatible roots of unity in the cyclotomic tower, and the ring maps ℤ[1/p,μ_(p^b)]→L(μ_(p^b)) in the root-lifting comparison. Construct the retract at stages containing μₚ, then descend through the finite prime-to-p Galois group to L. The inverse on the Tₖ summand is proved by KU cohomology and Frobenius descent. This uses the preceding root-lifting ring-spectrum map, constructed through Φₚ and the root-space retraction; a map of groups of roots alone is insufficient (DM Theorem 5.4 pp.19–20 and Proposition 13.1 p.55). The API is compatibility with tower restriction and Frobenius, the section identity, and comparison under a change of generator of the same cyclotomic subgroup. The equivalence uses choices.

**The local Iwasawa module.** Define M_L as the abelian pro-p Galois group of the maximal abelian pro-p extension of L(μ_(p^∞)), with its conjugation action of Γ′_L; put Λ′_L=ℤₚ[[Γ′_L]]. Prove `localReduced_kuModule`: completed KU cohomology of Kʳᵉᵈ_L is Ind_(Γ′_L)^(ℤₚ×)M_L in degree −1 and zero in the other parity. Build the comparison through continuous local duality and cyclotomic descent, retaining the inverse action in the dual and Bott twists. Then prove `localIwasawa_decomposition`: M_L≃ℤₚ(1)⊕(Λ′_L)^d. Its proof uses the logarithm on torsion-free principal units, the normal-basis rank in every finite-character idempotent, and the local Brauer/valuation terms in the duality Ext sequence. The free module has rank d; projectivity splits off that free quotient, leaving the Tate-twisted rank-one term. Establish freeness, not merely equality of ranks (DM Proposition 6.11 pp.25–26, Theorem 8.10 pp.34–35, Proposition 8.17 p.36 and Proposition 13.2 p.56).

**Realize the module calculation.** Apply §0.4 to this isomorphism, with its Λ′ action and twists, to construct `localPeriodicSplitting`. The induced ℤₚ(1) in degree −1 realizes ΣTₖ, and a free induced summand in that degree realizes ΣKUₚ. Together with the actual retract this gives

```text
heightOneLocalize K(L) ≃ Tₖ ∨ ΣTₖ ∨ (ΣKUₚ)^d.
```

This is a consequence of projective-resolution realization and the KU-cohomology equivalence criterion; it is not an inference from coinciding homotopy groups. DM Theorem 13.3 p.56 is the resulting theorem, not an earlier hypothesis.

**Positive-degree comparison and spaces.** Prove `localPositiveComparison`: the localization map gives an equivalence τ≥1 K(L;ℤₚ)→τ≥1 heightOneLocalize K(L). Compare its target to Bott-inverted étale K using Thomason Theorems 4.1 and 4.11 pp.516,520, then use §6.6's local comparison in degrees at least one. The local field L has finite cohomological dimension, p is invertible in L, and its finite-coefficient K-groups are finite by §6.6, so the coefficient Milnor lim¹ terms vanish; its continuous étale groups are finitely generated over ℤₚ. These are the completion inputs, without a finite-generation assertion for integral Kₙ(L). After taking τ≥1 of the actual splitting, apply Ω∞ and restore the rank components from K₀(L;ℤₚ)=ℤₚ. The first component together with rank is FΨᵏ; the suspended term is BFΨᵏ and each ΣKU term gives U. No equivalence of τ≥0 spectra is asserted: the periodic right side has two ℤₚ summands in degree zero, while K₀(L;ℤₚ) has one.

**Valuation fibre.** Prove `valuationFibre_spaceSplitting` using completed localization K(V)→K(L)→ΣK(𝔽q). The supplied finite-field answer makes K(𝔽q;ℤₚ)=Hℤₚ; hence on spaces the last map is valuation into K(ℤₚ,1). It is zero on the finite torsion in π₁(FΨᵏ) and primitive on the free part π₁(BFΨᵏ×U^d)=ℤₚ^(d+1), since a uniformizer has valuation one. To realize a change of basis on spaces, split off a K(ℤₚ,1) from BFΨᵏ: choose a generator loop, extend its map S¹→BFΨᵏ across p-completion, and multiply with the fibre of its first Postnikov projection. This induces isomorphisms on every homotopy group and is an equivalence of these nilpotent spaces. Likewise determinant splits U≃K(ℤₚ,1)×SU. A matrix in GL_(d+1)(ℤₚ) now moves the primitive valuation functional to a single circle coordinate. Taking its fibre removes that coordinate and regrouping gives BFΨᵏ×U^(d−1)×SU. This construction supplies the maps and homotopies behind the valuation-ring formula; it does not require an initial splitting already normalized to kill valuation on BFΨᵏ.

**API.** Choice-dependent equivalences, their comparison on positive-degree K-groups, the rank component, the valuation homotopy fibre, and compatibility with the specified determinant and cyclotomic actions. Do not claim a canonical splitting or a natural splitting under every field embedding.

**Checks.**

- For L=ℚ₃, d=1, r=2, a=1 and k=g. The valuation-ring answer has one SU and no remaining U factor. K₁(L;ℤ₃) has two free directions; K₁(V;ℤ₃) has one.
- For L=ℚ₅(ζ₅), r=1 and a=1, so k=g⁴ and π₁(FΨᵏ) has order five. Omitting r changes the torsion.
- Tₖ has π₀=π₋₁=ℤₚ, so Tₖ∨ΣTₖ has π₀=ℤₚ². This explicitly rules out replacing the positive-degree comparison by an equivalence on τ≥0 spectra.
- The map to K(ℤₚ,1) may initially be nonzero on the circle in BFΨᵏ. The primitive-vector argument removes one circle among all d+1 and still gives the stated fibre. A group calculation without the circle sections would not justify that step.
- The π₀ of both completed K-spaces is ℤₚ. The fibre FΨᵏ includes virtual rank, whereas the supplied finite-field fibre in Layer 1 is connected.
- At p=2, ℤ₂× is not procyclic and this choice of g is unavailable. None of this argument gives the dyadic space splitting.

### 6.12a The dyadic field homotopy-limit theorem

**Dyadic field comparison** (`dyadicField_homotopyLimit`). For every finite extension L/ℚ₂ and every integer m, prove GW(L;(Qˢ)[m])→K(L;(Qˢ)[m])^(hC₂) is a 2-adic equivalence. Construct the characteristic-zero finite-virtual-cd₂ field comparison used in this proof via Hu–Kriz–Ormsby's equivariant motivic method: equivariant Nisnevich sheaves, A¹ localization and representation-sphere stabilization, the algebraic K/hermitian K spectra and the identification of their evaluated comparison with the ordinary forgetful map. Establish the slice/filtration comparison and its convergence from finite virtual cd₂, including the fundamental-ideal graded comparison with mod-two Milnor/Galois cohomology and I-adic separation. These constructions and comparisons are part of this target. Specialize at cd₂(L)=2 and transport the signs ±1 to every shift using the supplied metabolic and periodicity maps (Calmès et al. III Theorem 3.1.1 and Remark 3.1.2 p.49; Hu–Kriz–Ormsby §§2–5, Theorems 16–20 pp.30–35).

**Checks.**

- For L=ℚ₂ both signs and all integer shifts are included; 2 is invertible in L even though it is not invertible in its valuation ring.
- A ramified extension such as ℚ₂(√2) still has cd₂=2 and is included without an unramified hypothesis.
- The field result gives a 2-adic comparison. The integral valuation-ring assertion requires §6.13's additional L-theory completeness argument.

*Needs:* §3.0a's mod-two norm residue, the generic hermitian spectra, QuadraticFormInvariants' Witt-ring and local-field theory, ClassFieldTheory's cd₂ theorem, and HermitianKTheoryOfPoincareCategories Layers 0–1's shift transport. The equivariant motivic, graded-Witt and convergence inputs above are constructed here.

### 6.13 Dyadic hermitian rigidity and homotopy fixed points

For finite L/ℚ₂ and its valuation ring V, with residue field 𝔽_q, q even, import the genuine hermitian K/GW/L spectra and their shifted Poincaré structures from the supplier above. Use §6.12a's `dyadicField_homotopyLimit` to prove that the comparison GW(V;(Qˢ)[m])→K(V;(Qˢ)[m])^(hC₂) of full spectra is a 2-adic equivalence for every m: compare the dyadic localization-dévissage fibre sequences GW(𝔽_q;(Qˢ)[m−1])→GW(V;(Qˢ)[m])→GW(L;(Qˢ)[m]) and their K-theory homotopy-fixed-point counterparts, using GeometryOfNumbersAndQuadraticArithmetic §6.10's `finiteEvenFieldHomotopyLimit` on the residue term. Then prove that the relevant L-theory spectra are derived 2-complete, using the finite 2-power exponent of the Witt group of L supplied through QuadraticFormInvariants Layer 6, and apply the supplied cartesian fundamental comparison square Ξ to deduce the integral equivalence GW(V)≃K(V)^(hC₂) as full spectra in every specified symmetric Poincaré shift. The completeness step concerns L-theory; it cannot be replaced by the false claim that integral K(V) is 2-complete. Nor does the resulting integral assertion for V automatically give an integral assertion for L (Calmès et al. III Proposition 3.1.4 pp.50–51 and Remark 3.1.10 pp.52–53). *Needs:* the generic hermitian fibre/Tate square, local quadratic-form classification supplied by QuadraticFormInvariants, GeometryOfNumbersAndQuadraticArithmetic §§6.9–6.10's localization sequence and finite-even-field comparison, HermitianKTheoryOfPoincareCategories Layers 0–1's shift transport, and §6.12a's `dyadicField_homotopyLimit`. The ordinary étale K-comparison of §6.6 alone does not imply the hermitian comparison.

**Checks.**

- At V = ℤ₂ reduction has characteristic two, so an argument that assumes 2 ∈ Vˣ is unavailable.
- Shifting the Poincaré structure changes the duality convention and must commute with comparison.
- After 2-completion both L (by §6.12a) and V (by the theorem) satisfy the comparison; the integral conclusion above is asserted for V with its L-theory completeness proof.
- The finite-even-field input controls the residue term, while `dyadicField_homotopyLimit` controls the fraction-field term; neither term can be omitted from localization.
- Uncountable uniquely divisible integral K-groups from §6.10 are consistent with a 2-adic comparison and forbid calling integral K(V) itself derived complete.

### Examples

Compute the displayed completed groups for ℚ₂, ℚ₃, an unramified quadratic extension and ℚ₅(ζ₅); compare their integral torsion and completion kernels. For E = 𝔽₃((t)), retain the order-two K₂ quotient and the uncountable divisible kernel even though completed K₂ is zero. Use T = ℤₚ as an elementary model of a dense integral image with a nontrivial rational cokernel. These examples distinguish integral, finite-coefficient, ordinary-completed and derived-completed information.

### Dependencies

Layers 1–5, LocalFieldsRamification, ClassFieldTheory and the finite local-Galois cohomology interfaces; the supplied generic Tate module; foundational motivic and étale comparison, with norm-residue theory; Milnor K-theory and its transfer/residue/comparison theorems; de Rham–Witt and regular-local trace theory; p-adic Adams operations; and the generic hermitian/Poincaré package. The arithmetic regulator and the global arithmetic K-group classifications of the downstream roadmaps consume this layer.

## Layer 7: completion maps for arithmetic applications

### 7.1 Arithmetic completion maps

For a number field F, finite place v, completion F_v and integer ring O_v, define `completionMap v` by extension of scalars from F to F_v on projectives and hence on K-theory. Give its integral-ring and localized-ring versions O_F→O_v and (O_F)_v→O_v, finite-coefficient versions and completed versions. Its API is the rank identity, actual field embedding on K₁, preservation of products and symbols, Bockstein and coefficient-map compatibility, and compatibility with the integer-ring maps. Use the pinned completion ring maps and residue-field equivalence; do not choose a field isomorphism merely because the residue cardinalities agree (K-book V.6.8.2 p.413; Handbook Example 65 p.166).

**Checks.**

- On K₀(F) = ℤ, `completionMap` is the identity, not multiplication by a local degree. Transfer has the degree multiplier instead.
- For F = ℚ, v = 5, the unit 2 maps to the 5-adic unit 2 and 10 has valuation one. A residue-only map would lose the latter information.
- Symbols commute with completion: {−1,−1} maps to a nonzero order-two class in K₂(ℚ₂) and to zero in K₂(ℚ₃), as detected by the corresponding Hilbert symbols. Thus completion is not generally injective on K₂, although F×→F_v× is injective on K₁.
- A class coming from K_n(O_F) maps through K_n(O_v), including before changing coefficients.

### 7.2 Restriction, transfer and local boundaries

For E/F finite and w | v, prove c_w res_(E/F) = res_(E_w/F_v)c_v. For transfer prove

```text
c_v Tr_(E/F) = Σ_(w|v) Tr_(E_w/F_v)c_w.
```

Use F_v⊗_F E ≃ ∏_(w|v)E_w, finite-product preservation and flat base change for restriction of scalars; retain the sum over all places. The same compatibility holds on integer rings, finite coefficients and completed spectra (K-book IV.6.3.3 p.320 and Theorem V.3.7.2 p.390). *Needs:* §7.1 and the exact scalar-extension/decomposition supplier contracts.

For a Dedekind domain R and nonzero prime 𝔭, show the 𝔭-component of its global localization boundary is the boundary for R_𝔭. Localization of torsion modules is projection onto that residue summand under dévissage. For a DVR R and completion R̂, show the map of localization sequences is the identity on K(k), after identifying the two residue fields. Deduce the homotopy-cartesian square with rows K(R)→K(R̂) and K(F)→K(F̂), its Mayer–Vietoris sequence, and ∂̂ₙc = ∂ₙ, integrally and with finite or completed coefficients. The spectrum square uses B̂c = B; multiplying both degree-n boundaries by (−1)^(n−1) gives the displayed identity and preserves ∂β = β∂. This is the DVR application of general Karoubi patching; the general theorem remains a foundational supplier (K-book V.6.6.1 p.409 and Proposition V.7.5/Example V.7.5.1 p.424). It follows that ∂_v = ∂̂_v c_v for number fields and S-integers at v ∉ S, and ker c_v ⊆ ker ∂_v. *Needs:* §2.2, exact dévissage, flat completion and coherent localization.

**Checks.**

- On K₀ the transfer identity is [E:F] = Σ_(w|v)[E_w:F_v]; on K₁ it is the product of local norms.
- For x of v-valuation r the two degree-one boundaries both give r, not er after an identity completion.
- For {2,5} at v = 5 the left-linear tame boundary is 2, while the reversed symbol has boundary 3.
- The cartesian square supplies a relative comparison; it does not assert K(R)≃K(R̂) integrally.

### 7.3 Hilbert symbols after completion

Put w_v = #μ(F_v) and h_v = h_(F_v)c_v:K₂(F)→μ(F_v). Prove h_v{a,b} = (a,b)_(F_v,w_v). For μ_m ⊂ F, identify its m-symbol at v, ClassicalArithmeticCompletion §1.24's symbol, with h_v^(w_v/m), with the target inclusion μ_m(F)≃μ_m(F_v) understood only for this m. On torsion classes x ∈ K₂(F), prove c_v(x) = 0 exactly when h_v(x) = 1: the intersection of the local uniquely divisible kernel with torsion is zero. For d | #k(v)−1, identify the d-symbol as the negative (#k(v)−1)/d power of the Teichmüller lift of ∂_v. These compatibilities are the interface with global reciprocity and wild kernels; no global kernel theorem is assumed here (K-book III.6.2.4 p.233 and V.6.8.2 p.413; the sign conversion is §3.2). *Needs:* §§3.1–3.5,7.1–7.2, ClassicalArithmeticCompletion §§1.24 and 1.52 (the symbol at a place and Hilbert's product formula).

**Checks.**

- Over ℚ₅ the symbols (5,2)₄ and (2,5)₄ are respectively 2 and 3 in μ₄ after the chosen residue identification.
- For torsion {−1,−1}, the dyadic detection is nontrivial, while odd local symbols vanish.
- A nonzero element of the local divisible kernel is not detected by h_v; the torsion hypothesis in the kernel criterion is essential.

### 7.4 Étale operations and unramified classes

Prove naturality under completion for the early edge of §6.6 and for the ordinary finite-coefficient étale Chern operations, keeping their factorial relation. On cohomology the map is pullback along Spec F_v→Spec F, equivalently restriction to a decomposition group after choosing a place above v; conjugation makes the resulting cohomology map independent of that choice. At degree one this is Kummer naturality. Pass to continuous coefficients only with the limit comparison already established (K-book Definition V.11.5 p.454 and Example V.11.10 p.456; Handbook §5.4 p.153).

For m invertible at v and x in the image of K_n(O_F[1/m];ℤ/m), show its local Chern class is unramified and equals the inflation of the finite-field Chern class of its reduction. Use henselian rigidity both for K-theory and for étale cohomology, and specify j = 2i−n ≥ 0; for negative j the target is zero. At n = 3,i = 2 this gives the weight-two local class used in the Bloch-unit application, without assuming the analogous statement at v | m (CGZ §4.1, Lemma 4.1 p.21 and proof pp.21–22). *Needs:* §§1.5,1.8,2.1,6.6,7.1–7.2, henselian étale rigidity and the supplied Chern naturality theorem.

**Checks.**

- Kummer sends a global unit a to the class of its actual local image.
- At v ∤ m, an integral class reduces through K_n(k(v);ℤ/m); at v | m the same argument is unavailable.
- The weight-two operation has factorial 1, whereas weight three at m = 2 need not be an isomorphism.
- Unramifiedness concerns the local cohomology class, not the assertion that every class of K_n(F_v;ℤ/m) comes from O_v.

### 7.5 Cyclotomic trace and arithmetic completion

Use naturality of the ordinary cyclotomic trace under O_F→O_v to compare K(O_F)→TC(O_F;p) with K(O_v)→TC(O_v;p). Compose the latter with the logarithmic localization map of §4.8. Prove this equals K(O_F)→K(F)→K(F_v)→TC(O_v|F_v;p), including the specified homotopy of the square. For odd residue characteristic, with ℤ/p^ν coefficients and degree ≥ 1, the last local trace is the isomorphism from §5.15. This computes the local target without identifying TC(F_v) with the logarithmic TC object (HM03 Introduction pp.2–3 and Theorem 6.1.10 pp.103–104). *Needs:* §§4.6–4.8,5.15,7.1–7.2 and trace naturality as a map of localization sequences.

**Checks.**

- The two composites on a projective O_F-module agree after scalar extension.
- The spectrum square commutes with the raw residue boundary B. Applying (−1)^(n−1) on both sides gives the left-linear homotopy-group square, with ∂β = β∂ for n≥2.
- In degree zero the positive-degree local trace theorem cannot be used.
- At p = 2, the odd-prime proof does not furnish this particular trace isomorphism even though §6.6 gives the arithmetic étale comparison by another route.

### 7.6 The semilocal completed map above p

Define `semilocalCompletion F p` in degree n as

```text
λ_(F,p):K_n(F) → ∏_(v|p) K_n(F_v;ℤₚ),
x ↦ (κ_v(c_v(x)))_v.
```

Its API is the component formula, the description by F→F⊗_ℚℚₚ≃∏_(v|p)F_v, compatibility with finite and completed coefficients, products and Bocksteins, and the restriction/transfer formulas induced from §7.2. Finite products commute with both K-theory and completion; no infinite-product assertion is needed. In degree three this is the map used before the p-adic regulator on the semilocal algebra (K-book Example VI.7.8 p.511; Handbook Example 65 p.166).

**Checks.**

- For F = ℚ there is one factor, and the map is ordinary completion followed by coefficient completion.
- For F = ℚ(i), p = 5 there are two factors. The global element 2+i has valuations 1 and 0, in some order, because its norm is 5 and the two residue values are 0 and 4. Omitting either factor breaks the norm identity.
- On K₀ the output is the diagonal rank tuple; transfer back to ℚ multiplies each factor by its local degree and sums.
- In K₁, the order-two element −1 vanishes after 5-completion. This tests that the last κ is part of λ, rather than an integral tuple of local classes.
- For a finite E/F, the v-component of λ_(F,p)Tr is the sum over w | v of local transfers of λ_(E,p), including at ramified places.

### Examples

Follow {2,5} from K₂(ℚ) to its tame boundary and norm-residue value at five, then compare {−1,−1} at two and three. Follow a weight-two integral class at a prime away from its coefficient modulus through rigidity to the finite-field Chern class. For ℚ(i) at five, compute both K₁ components before and after coefficient completion and verify their local-norm product. These examples test the maps, not just the abstract groups.

### Dependencies

Layers 1–6, number-field completion and semilocal tensor decomposition, flat K-theory base change, local and global reciprocity interfaces, henselian étale rigidity, and naturality of trace/Chern/edge operations. Global localization, global wild-kernel structure and global finiteness are outside this roadmap; this layer supplies their local maps.

## Downstream consumers

Section 3.0a supplies the shared `BlochCycle` and `HigherChow` carriers: dimension grading over arbitrary fields, ordered face signs, arbitrary derived coefficients, arbitrary separated finite-type localization and homotopy invariance, smooth-target incidence moving with affine-to-global descent, and the actual proper, flat, product and correspondence maps. These constructions precede the motive-category comparisons in MotivesAndAlgebraicCycles §§4.7–4.8, which use the same carriers and maps. Suslin/Tate transfer complexes, relative-cycle specialization over general bases, cancellation and motive-category comparisons belong to that consumer; `motivicToK` owns the additional diagonal, norm-residue and K-theory layer comparisons here.

Global arithmetic applications use the finite residue groups, transfer normalization, integral local torsion/divisibility and completion maps supplied here. Global number-field w-invariants are outside this roadmap. K3BlochGroups uses the finite-field K₃ group and its compatible local weight-two edge, while HabiroNumberFields uses the prime-to-residue-characteristic reduction square. HabiroRings uses the relative truncated-polynomial calculations of §5.17.

P-adic regulator applications use completed K₃ of unramified local factors and the semilocal map λ_(F,p), with the p = 2,3 torsion retained; their regulator construction and analytic/de Rham comparison are outside this roadmap. Hermitian applications may consume the early edge and local/finite-field comparisons. Profinite arithmetic applications may use the Tate-module comparison but must distinguish the integral completion kernel from the full divisible subgroup.

## References

All descriptions and theorem formulations above are in this roadmap's own words. The linked versions fix the numbering used here; online author files were accessed on 19 October 2026 unless another access date is specified.

- **MVW:** Carlo Mazza, Vladimir Voevodsky and Charles Weibel, *Lecture Notes on Motivic Cohomology*, [published text](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/Lecture_notes_on_motivic_cohology_published.pdf), Theorem 5.1 and proof pp.29–34, Lecture 17 and Appendix 17A pp.135–146, Theorem 19.1 p.159 and Proposition 19.12 p.162. Theorem 19.1 compares the perfect-field motivic complexes; Proposition 19.12 gives cycle-complex Zariski descent over any field. Used for the shared higher-cycle grading, moving/transfer operations and motivic comparison conventions; this linked text was accessed on 22 October 2026.
- **Levine:** Marc Levine, “Techniques of localization in the theory of algebraic cycles,” *Journal of Algebraic Geometry* 10 (2001), 299–363, [archived author preprint](https://web.archive.org/web/20150326202512/https://www.uni-due.de/~bm0032/publ/TechLoc.pdf), Theorems 1.7, 1.10, 6.12, Proposition 6.14 and §7, author pp.2–5,37–44. The finite-field moving argument uses the coprime-degree extensions of Lemma 7.1 p.43; this linked preprint was accessed on 22 October 2026.

- **K-book:** Charles Weibel, *The K-book: An Introduction to Algebraic K-theory*, author draft dated 29 August 2013, [public author PDF](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf). Main local references: III.6.2.4 pp.233–234; IV.1 and IV.2 pp.269–284; V.7.5 p.424; VI.2.2–2.3 pp.470–471; VI.7 pp.507–512. PDF pages are printed pages plus eight. The [archived errata](https://web.archive.org/web/20191110143141id_/https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf), p.2, correct the prime-to-residue-characteristic restriction on the K₂ integer-ring torsion statement.
- **Handbook:** Charles Weibel, “Algebraic K-theory of rings of integers in local and global fields,” *Handbook of K-theory*, Chapter I.5, pp.139–190, [published chapter](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/KZsurvey-published.pdf). Relevant §§5.4–5.6, especially pp.153,162–167; PDF p.1 is printed p.139.
- **Haine:** Peter Haine, *On the K-theory of finite fields*, 25 September 2016, [notes](https://math.berkeley.edu/~phaine/files/KFF.pdf), Theorem 3.1 pp.4–5, Definition 5.7 and Theorem 5.8 p.9, §§6.3–6.11 pp.10–11. These give the finite-field/Brauer proof route, with the foundational comparison inputs stated separately above.
- **QuillenICM:** Daniel Quillen, “Cohomology of groups,” *Proceedings of the International Congress of Mathematicians, Nice 1970*, vol.2 (1971), pp.47–51, [published proceedings](https://www.mathunion.org/fileadmin/ICM/Proceedings/ICM1970.2/ICM1970.2.ocr.pdf), §2 pp.48–50, equations(1)–(3), for the classifying-topos Lang spectral sequence at primes different from the characteristic.
- **Mestel:** David Mestel, *Algebraic K-theory of finite fields*, 2014, [essay](https://www.cs.ox.ac.uk/people/david.mestel/essay.pdf), §§4–9 pp.9–30, especially Theorems 14–15,19–20,35,37–38. It supplies additional details of the cohomological comparison and its spectral-sequence inputs.
- **Atiyah–Segal:** Michael Atiyah and Graeme Segal, “Equivariant K-theory and completion,” *J. Differential Geometry* 3 (1969), 1–18, [public scan](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/atiyahsegal1.pdf), Theorem 2.1 pp.3–4 and Proposition 4.2 p.10. Used as the completion input in the Brauer construction.
- **Baker:** Andrew Baker, “Power operations in K-theory completed at a prime,” [author PDF](https://www.maths.gla.ac.uk/~ajb/dvi-ps/KtheoryPowerOperations-tmj.pdf), §2 pp.3–4, equation (2.1), for completed cooperations and the continuous unit Adams/evaluation pairing.
- **Eilenberg–Moore:** Samuel Eilenberg and John Moore, “Homology and fibrations I. Coalgebras, cotensor product and its derived functors,” *Commentarii Mathematici Helvetici* 40 (1966), 199–236, [public scan](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/eilenberg-moore66.pdf), Theorem 12.1 p.220 and §16 pp.227–230. The source states the homological Cotor comparison; §0.3 states its finite-type field-coefficient cohomological dual, with multiplicativity and convergence.
- **Bousfield:** Aldridge Bousfield, “Uniqueness of infinite deloopings for K-theoretic spaces,” *Pacific Journal of Mathematics* 129 (1987), 1–31, [published scan](https://msp.org/pjm/1987/129-1/pjm-v129-n1-p01-s.pdf), Theorems 2.1 and 2.3 p.3 and construction §§4–6 pp.17–30. Section 0.4 uses the height-one functor and its comparison with the connected zero space of a spectrum.
- **DFM:** William Dwyer, Eric Friedlander and Stephen Mitchell, “The generalized Burnside ring and the K-theory of a ring with roots of unity,” *K-Theory* 6 (1992), 285–300, [author-uploaded manuscript](https://www.researchgate.net/profile/W-Dwyer/publication/226803850_The_generalized_Burnside_ring_and_theK-theory_of_a_ring_with_roots_of_unity/links/53e112b00cf2235f352728a7/The-generalized-Burnside-ring-and-theK-theory-of-a-ring-with-roots-of-unity.pdf). Locators use its 15-page manuscript.
- **DM:** William Dwyer and Stephen Mitchell, “On the K-theory spectrum of a ring of algebraic integers,” *K-Theory* 14 (1998), 201–263, DOI 10.1023/A:1007792408694, [author-uploaded full text](https://www.researchgate.net/publication/2669799_On_the_K-Theory_Spectrum_of_a_Ring_of_Algebraic_Integers). Locators use the 58-page author text: §§4.7–4.18 pp.15–17, Theorem 5.4 pp.19–20, Proposition 6.11 pp.25–26, Theorem 8.10 and Proposition 8.17 pp.34–36, Theorem 9.1 p.40 and §§13.1–13.3 pp.55–56. Its local KU-cohomology and realization arguments give the intermediate targets in §§0.4,6.12; its final splitting is not treated as a separate prerequisite.
- **Thomason:** Robert Thomason, “Algebraic K-theory and étale cohomology,” *Annales scientifiques de l'École Normale Supérieure* 18 (1985), 437–552, [published scan](https://numdam.org/item/10.24033/asens.1495.pdf), Theorem 4.1 p.516 and Theorem 4.11 p.520. Bott inversion and étale comparison are used with the field and cohomological-dimension hypotheses in §6.12.
- **Geisser–Levine:** Thomas Geisser and Marc Levine, “The K-theory of fields in characteristic p,” *Inventiones Mathematicae* 139 (2000), 459–493, [author PDF](https://www2.rikkyo.ac.jp/web/geisser/p-part.pdf), Theorem 1.1 p.460, Theorem 8.1 pp.489–490 and Theorem 8.3 p.491. The characteristic-p K comparison is separate from the Bloch–Gabber–Kato differential-symbol theorem.
- **Popescu:** Stacks Project, [Theorem 16.12.1, tag 07GC](https://stacks.math.columbia.edu/tag/07GC), regular maps of noetherian rings as filtered colimits of smooth algebras; consumed from SchemeAndStackFoundations §0.15, not planned again.
- **CMM:** Dustin Clausen, Akhil Mathew and Matthew Morrow, *K-theory and topological cyclic homology of henselian pairs*, arXiv:1803.10897v2, 20 July 2020, [versioned PDF](https://arxiv.org/pdf/1803.10897v2), Theorem 1.4 p.3, Theorem 4.29 p.33, Theorem 4.36/Remark 4.37 pp.36–37, Theorem 6.5 p.52 and Corollary 6.6 p.53. The source's original arXiv year is not its version date.
- **Fesenko:** Ivan Fesenko, “Topological Milnor K-groups of higher local fields,” *Geometry & Topology Monographs* 3 (2000), 61–74, [public chapter](https://msp.org/gtm/2000/03/gtm-2000-03-006p.pdf), §§6.0–6.1 pp.61–62. Used only with the distinction between algebraic and topological Milnor groups retained.
- **Sharifi:** Romyar Sharifi, *Algebraic Number Theory*, author notes dated 26 September 2026, [public notes](https://math.ucla.edu/~sharifi/notes/algnum.pdf), §§6.3–6.4 pp.130–133 and Definition 9.3.2/Proposition 9.3.4/Theorem 9.3.8 pp.195–198. His Hilbert inputs are reversed relative to this roadmap's reciprocity convention.
- **HM97a:** Lars Hesselholt and Ib Madsen, “On the K-theory of finite algebras over Witt vectors of perfect fields,” *Topology* 36 (1997), 29–101, [author PDF](https://www.math.nagoya-u.ac.jp/~larsh/papers/004/paper.pdf), introductory Theorems A–F pp.i–iv (PDF1–4); §§2.3,3.1,4.2–4.5,5.1,6.1 and Appendix B for the classical trace and Tate machinery. Locators in the body use the author PDF's own numbering.
- **HM97b:** Lars Hesselholt and Ib Madsen, “Cyclic polytopes and the K-theory of truncated polynomial algebras,” [author PDF](https://www.math.nagoya-u.ac.jp/~larsh/papers/007/polytope.pdf), Theorems A–B pp.74–75 (PDF2–3) and Theorem 4.2.10 p.95 (PDF23). Used for the representation-sphere/cyclic-polytope calculation and integral relative groups.
- **HM03:** Lars Hesselholt and Ib Madsen, “On the K-theory of local fields,” *Annals of Mathematics* 158 (2003), 1–113, [arXiv:math/9910186v2](https://arxiv.org/pdf/math/9910186v2), author version 22 January 2004. Theorems A–D pp.1–7; §§2–3 pp.32–64; §§4.3–4.4 pp.65–74; §§5–6 pp.75–104; Appendix A pp.105–110. The individual numbered results are cited next to their uses.
- **HM04:** Lars Hesselholt and Ib Madsen, “On the de Rham–Witt complex in mixed characteristic,” [author PDF](https://www.math.nagoya-u.ac.jp/~larsh/papers/013/final.pdf), introductory Theorems A–E and the following remark pp.1–5. Theorem A p.2 constructs the nonlogarithmic initial complex; p.4 describes its log extension, and p.5 distinguishes absolute from relative forms. The log initiality and filtration used here are HM03 §3.2, constructed in §5.2a.
- **Hesselholt96:** Lars Hesselholt, “On the p-typical curves in Quillen's K-theory,” [author PDF](https://www.math.nagoya-u.ac.jp/~larsh/papers/005/acta.pdf), Theorems B–C p.2, §1.2 p.5 and the Milnor-limit argument in the proof of Corollary 2.4.7 p.24.
- **Hesselholt05:** Lars Hesselholt, “K-theory of truncated polynomial algebras,” handbook survey, [author PDF](https://www.math.nagoya-u.ac.jp/~larsh/papers/s01/handbook.pdf), §§3.5–3.13; all Hesselholt05 page locators denote PDF pages. Theorem 5 is PDFp.17 (printed 87), Proposition 7 PDFp.22 (printed 92), Proposition 8 PDFp.24 (printed 94), Lemma 9 PDFp.26 (printed 96), and Theorems 10–11,13 PDFpp.28,30,33 (printed 98,100,103).
- **GH06:** Thomas Geisser and Lars Hesselholt, “On the K-theory of complete regular local 𝔽ₚ-algebras,” [author PDF](https://www.math.nagoya-u.ac.jp/~larsh/papers/011/paper.pdf), Theorems A–B pp.2–3, Proposition 2.8 p.16, end of §2 p.18 and Theorem 3.1 p.19. The numbered regular-local characteristic-p statements, rather than the filename, fix the results used here.
- **NS:** Thomas Nikolaus and Peter Scholze, “On topological cyclic homology,” *Acta Mathematica* 221 (2018), 203–409, [published PDF](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf). Classical/modern comparison: §§II.4,II.6 and IV.4, including Theorems II.6.3,II.6.9 and especially Theorem II.4.10 and Corollary IV.4.8, Proposition IV.4.9 and Corollary IV.4.10 pp.360–361, with the cyclotomic refinements pp.362–365. For the integral arithmetic pullback use [arXiv v2](https://arxiv.org/pdf/1707.01799v2), Theorem II.4.10 p.52, square (1) and Theorem II.4.11 p.53; these locators use that version's own pagination.
- **Calmès et al. III:** Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus and Wolfgang Steimle, *Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings*, [arXiv:2009.07225v4](https://arxiv.org/pdf/2009.07225v4). Use §3.1 pp.49–53, Corollary R.10 p.10, the shifted localization discussion in §1.3 and Corollary 2.2.5 p.39. This source treats symmetric bilinear characteristic-two theory in its Poincaré convention.
- **Hu–Kriz–Ormsby:** Po Hu, Igor Kriz and Kyle Ormsby, *The homotopy limit problem for Hermitian K-theory, equivariant motivic homotopy theory and motivic Real cobordism*, [author manuscript](https://people.reed.edu/~ormsbyk/ar1105.pdf), §§2–5, Theorems 16–20 pp.30–35. Section 6.12a constructs the field comparison and the equivariant motivic inputs used in its proof.
- **Calmès et al. II:** the same authors, *Hermitian K-theory for stable ∞-categories II: Cobordism categories and additivity*, [author version accessed 19 October 2026](https://arxiv.org/pdf/2009.07224), Example 1.2.5 pp.20–21 and Theorem 4.4.11/Corollary 4.4.13 pp.106–107. These are generic supplier results, including the fundamental cartesian square.
- **AV:** Amina Abdurrahman and Akshay Venkatesh, *Symplectic L-functions and symplectic Reidemeister torsion*, [arXiv:2303.13436v1](https://arxiv.org/pdf/2303.13436v1), and [author revision dated 6 October 2026](https://www.math.ias.edu/~akshay/research/RT.pdf), §2.7 pp.16–17 in both versions. Retain their 4r−1 degree range and coefficient exclusions in §1.9.
- **WeibelChern:** Charles Weibel, “Étale Chern classes at the prime 2,” [author PDF](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chernclass.pdf), §§1.5–1.6,2.1–2.8,3.3 and Proposition 5.1 p.24. The factorial comparison is a warning about identifying ordinary higher Chern operations with an étale edge map.
- **CGZ:** Frank Calegari, Stavros Garoufalidis and Don Zagier, *Bloch groups, algebraic K-theory, units, and Nahm's conjecture*, [arXiv:1712.04887v3](https://arxiv.org/pdf/1712.04887v3), §4.1, Lemma 4.1 p.21 and proof pp.21–22. Used for the local weight-two reduction square, with its invertibility assumption retained.
