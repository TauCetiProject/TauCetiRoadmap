# Roadmap: p-adic cohomology comparisons

**Summary.** Build the comparison maps between étale, `A_inf`, crystalline, de Rham, infinitesimal and Hyodo–Kato cohomology, keeping their coefficient maps, Frobenius, Galois actions, filtrations and integral lattices compatible. The main results are the good-reduction crystalline comparison and lattice recovery of Bhatt–Morrow–Scholze, the semistable comparison of Česnavičius–Koshikawa, the proper rigid `C_st` comparison of Colmez–Nizioł, and the relative filtered comparison of Guo–Reinecke. Trace and Chern classes, integral torsion bounds, the nearby-cycle square, and Pan's finite-period modular-curve comparisons are applications of the same maps.

## Scope and ownership

This roadmap owns comparison maps, their common normalizations, and proofs that competing constructions agree, together with the relative analytic-crystal interface, additional semistable log-prismatic period and Hyodo–Kato compatibility diagrams, and the class-map agreements specified below. AInfCohomology §AI.6.5 supplies the canonical `B_dR⁺` cohomology of a smooth proper rigid space over `C`; its relative infinitesimal realization and relative coefficient comparison are constructed here. It owns neither the coefficient rings nor the general cohomology theories: AInfCohomology supplies `AΩ` and Breuil–Kisin–Fargues theory; CrystallineCohomology supplies crystalline and log crystalline sites, crystals and Hyodo–Kato complexes; PrismaticCohomology supplies prisms and relative prismatic cohomology in Layers 0–2; PrismaticCohomologyPartII supplies absolute Nygaard data and the Frobenius-pulled AΩ comparison, and PrismaticCohomologyPartIII supplies syntomic coefficients and the graded Beilinson square; PrismaticCohomologyPartIV supplies the generic logarithmic prismatic theory and its comparisons; PadicHodgeTheory supplies local period sheaves, admissible representations, the finite-`K` rational constant-coefficient maps of §8.1 and the specialization agreement of §8.2; PadicPeriodRings supplies the coefficient period rings. This roadmap extends those maps to the broader bases and derived diagrams below, with `finiteBaseComparisonAgreement` in their common range.

The geometric suppliers are AdicSpacesPartII, AdicSpacesPartIII and AdicEtaleGeometry. EnhancedDerivedSheaves supplies derived completion, enhanced tensor products, descent and coherent diagrams; an ordinary triangulated category records only their underlying maps. FiniteFlatGroupsAndIntegralPadicHodgeTheory supplies the small-weight integral correspondence and the separate all-weight Kisin functor. EtaleCohomologyFoundations supplies étale traces, purity, cycles, Gysin maps and the basic projective-bundle formula; EtaleDualityAndPerverseSheaves supplies higher Chern and refined flag formulas. CompletedCohomologyPartII supplies completed cohomology, its arithmetic realizations and transported actions, and locally analytic representation theory. Layer 6.2 constructs the genus-one perfectoid compactified modular tower and its Hodge–Tate map from finite-level curves and maps supplied by ModularCurvesPartII §§3.15, 4.11. PrismaticCohomologyPartIV §8.60 supplies the shared log adic structures and Kummer-étale site; the additional pro-Kummer tower, logarithmic period sheaf and affinoid-perfectoid flag basis are constructed in Layer 6 in the restricted modular-curve setting; the shared small-Hasse canonical-subgroup package for abelian families is a target of §6.2, before its modular specialization. No general higher-dimensional perfectoid Shimura theorem is required.

From the existing Tau Ceti roadmaps, AlgebraicVectorBundles L0B and L2B supplies finite locally free sheaves, their tensor/dual operations and geometric vector-bundle total spaces. Its projective/flag-bundle and characteristic-class successors are motivation, rather than constructed targets. SchemeAndStackFoundations §§5.4–5.6 supplies projective/flag geometry, while EtaleCohomologyFoundations §§0.9, F.6–F.7 and EtaleDualityAndPerverseSheaves §§1.1–1.3, 4.4 supply its étale class maps; their étale Kummer, crystalline PD, prismatic logarithmic and p-adic de Rham compatibility is proved here. DifferentialGeometry owns smooth real de Rham theory and its real geometric comparisons; that roadmap constructs them. The p-adic continuous differentials and period filtrations here use adic geometry. IntegralLattices, LocalGaloisGroups and ProfiniteArithmetic retain their general lattice and Galois-group constructions. AdicSpaces Layer 6.1 equips `A_inf=W(𝒪_F)`, for a perfectoid field `F` of characteristic `p`, with its `(p,[ϖ])`-adic Huber structure for the Fargues–Fontaine curve and leaves `B_dR`, `B_cris`, untilts and `θ` out of scope; the `Ainf O p` here is the bare ring `W(O^♭)` of Mathlib's tilt of a mixed-characteristic `O`, with no topology, carrying `θ` and `B_dR⁺` from Mathlib. No general real, operator, spin or peripheral-action theory is part of this build.

There are four distinct ranges. Integral smooth results concern a proper smooth p-adic formal scheme over `O_C` or `O_K`. Integral logarithmic results concern the vertical semistable charts of Česnavičius–Koshikawa. Rational proper rigid results require no chosen semistable formal model; the Colmez–Nizioł constructions and comparisons in §§4.8–4.11 use a base `K` with countable perfect residue field and `C=widehat(K̄)`. The algebraic Beilinson theorem has its own broader range of algebraic varieties, including singular and nonproper ones, and uses the supplied h-descent cohomology. Integral and proper-rigid statements do not acquire that broader range merely by sharing a comparison diagram. Betts–Stix's trace and cycle statements below are restricted to smooth proper algebraic varieties over `K` and their analytifications.

## Conventions

Let `p` be prime, `C` a complete algebraically closed extension of `ℚ_p`, `O=O_C` and `k` its perfect residue field. For arithmetic descent let `K⊂C` be a complete discretely valued field of characteristic zero with perfect residue field `k₀`, ring of integers `O_K`, absolute Galois group `G_K` and `C=widehat(K̄)` with its canonical continuous `G_K` action. This restriction applies to every arithmetic assertion, invariant-field identity and lattice export involving `G_K`, including the Česnavičius–Koshikawa comparisons. Statements without arithmetic descent retain the arbitrary complete algebraically closed `C` range unless a further hypothesis is stated. Mixed characteristic and these completeness hypotheses are standing assumptions; a DVR of equal characteristic is outside the period-ring statements. Distinguish a formal special fibre over `O/p` from its further reduction over `k`. In particular, `O/p` is not identified with `k`.

Use cohomological degrees and derived scalar extension. A completed tensor includes its named completion ideal; it is never replaced silently by an ordinary tensor. Frobenius is semilinear, or written as its linearization `φ* M→M`. A tensor Frobenius acts on both factors. Likewise monodromy on a Hyodo–Kato tensor is `N_HK⊗1+1⊗N_Bst`. Decreasing filtrations use the convolution of the Hodge and coefficient filtrations, not coefficient powers alone. Cohomological perfection means a bounded finite-projective complex; finite freeness of each cohomology group is a stronger conclusion requiring its own theorem.

Choose a primitive compatible p-power root system `ε` and put `μ=[ε]−1`, `ξ=μ/φ⁻¹(μ)`, `ξ̃=φ(ξ)` and `t=log[ε]`. The expression for `ξ` is the geometric-sum element, not division by a possibly zero element of `A_inf`. Write `θ̃=θφ⁻¹`. The trivial root system gives `μ=0` and cannot define localization maps to the nonzero period field. `ℚ_p(1)` has character `χ_p` and Hodge–Tate weight `+1`; thus `H²_ét(P¹,ℚ_p)=ℚ_p(−1)` has weight `−1`. Integral Breuil–Kisin twists remain distinct until a specified scalar-extension isomorphism identifies them with Tate twists.

For logarithmic periods use CK’s p-normalized coordinate `T`, `N_Bst=−d/dT` and `Nφ=pφN`. Distinguish raw arithmetic monodromy `N_raw` at the uniformizer log point, with its sign translated to our negative evaluation convention, from `N_norm=N_raw/e`, where `e=v_π(p)`. Write `N_HK=N_norm` in every tensor with CK’s `B_st`; its period monodromy has `N_Bst(log[π♭])=−1/e`. A uniformizer-coordinate translation by `log_K(u)` becomes a p-normalized translation by `e log_K(u)`. Evaluating total-monodromy horizontal sections therefore gives `ρ_{πu}=ρ_π exp(−log_K(u)N_raw)=ρ_π exp(−e log_K(u)N_norm)`. Transport supplier signs and scalings before use. For lengths over a ramified DVR normalize `v(p)=1`: `val_{O_K}(O_K/(π))=1/e`; ordinary module length is still 1. Length over `W(k)` agrees with p-adic valuation length.

Write `a:B_dR(−1)≃B_dR⟨−1⟩` for the trace-normalized Tate-line isomorphism of Layer 6. Its scalar value uses the generator of `ℚ_p(−1)` dual to the chosen generator of `ℚ_p(1)`. A comparison of a class with twist `r` uses `c_dR⊗a^{−r}`. After choosing a generator of `ℚ_p(1)` and viewing the class in untwisted groups, this says `c_dR(cl_ét)=a^r cl_dR`. The two formulations have the same direction. Do not identify `a` with the canonical Fontaine Tate-line isomorphism without a further normalization theorem. Use quotient-line projective bundles: `h=c₁(O(1))` and the relation `hⁿ−c₁(E)hⁿ⁻¹+⋯+(−1)ⁿc_n(E)=0`.

## Exact supplier contracts

### From Mathlib and the current Tau Ceti library

At Mathlib commit `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, use `WittVector`, `WittVector.fontaineTheta`, and `WittVector.frobeniusEquiv` for the perfect residue ring. `BDeRhamPlus` is the specified adic completion and `BDeRham` its localization. Their definitions alone do not supply the complete-DVR, field, filtration or period-invariant theorems consumed below; those are PadicPeriodRings §§1.5, 4.1–4.3. Use `AdicCompletion`, `AdicCompletion.eval_of`, `AdicCompletion.ext` and the finitely generated-ideal completeness theorem `AdicCompletion.isAdicComplete` for the algebraic envelope. A topological Tate presentation also needs the closedness and completed-differential results supplied by adic geometry.

`DerivedCategory (ModuleCat R)` and its homology functors give the underlying ordinary derived signatures. `TensorProduct` and `ModuleCat.extendScalars` give ordinary scalar extension. They do not provide filtered stable categories, homotopy pullback coherence or derived completion. `Module.length` takes values in `ℕ∞` and measures module length; `Module.finrank` measures the free rank and cannot measure torsion. `cyclotomicCharacter` fixes the Tate-action convention. At Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, use `TauCeti.PadicTateTwist`, its `galoisRepresentation` and `finrank` from `TauCeti.RingTheory.RootsOfUnity.PadicTateTwist` for integral root-system twists. Use `TauCeti.ValuationSpectrum.spaRationalFamily` and `TauCeti.ValuationSpectrum.inter_mem_spaRationalFamily` from `TauCeti.AlgebraicGeometry.AdicSpace.Spa.RationalSubset.Basis` for the generic rational basis and finite intersections. `TauCeti.AlgebraicGeometry.AdicSpace.FarguesFontaine.Window` supplies the rational-window geometry; Layer 6 adds the perfectoid inverse-image and finite-level density properties of the modular-curve Hodge–Tate map. `WittVector.frobeniusEquiv_symm_teichmuller` in `TauCeti.RingTheory.WittVector.Frobenius` supplies inverse Frobenius on Teichmüller representatives. The scalar transport `monodromyTransport c N` uses Mathlib's `IsNilpotent.exp` and `IsNilpotent.exp_add_of_commute`; Tau Ceti's integer-parameter unit-valued exponential in `TauCeti.RingTheory.Nilpotent.Exp` has a different domain and codomain.

For the underlying algebraic envelope use `AdicCompletion.evalₐ`, `AdicCompletion.evalₐ_of`, `AdicCompletion.ext_evalₐ` and `AdicCompletion.isAdicComplete`. These supply projection, evaluation, extensionality and finite-ideal completeness directly; no second API for these facts is requested. `AdicCompletion.liftRingHom` builds a ring map into a completion from compatible quotient maps, and `IsAdicComplete.liftRingHom` and `IsAdicComplete.eq_liftRingHom` do the same for a complete target. The supplied envelope interface in §2.2 includes automatic continuity and uniqueness under its finite-generation hypothesis.

`Suggested.lean` declares only what these libraries can carry at the pins: the coefficient maps of Layer 0 over Mathlib's `PreTilt`, `WittVector.fontaineTheta`, `WittVector.frobeniusEquiv`, `PreTilt.untilt` and `BDeRhamPlus`; the algebraic interface to AInfCohomology §AI.6.5’s envelope in Layer 2 as `AdicCompletion` with its supplied projections and extensionality; the monodromy transport of Layer 4 through `IsNilpotent.exp`; the truncated torsion length of Layer 5 through `Module.length` and `Submodule.torsion`; and the quotient-line projective-bundle relation of Layer 6 as a polynomial. The ring `O=O_C` is described there in Mathlib's vocabulary: `IsDomain`, `ValuationRing`, `Ring.KrullDimLE 1`, `CharZero`, `IsAlgClosed (FractionRing O)`, `p` not a unit and `IsAdicComplete (Ideal.span {p})`. Every cohomology theory, site, period sheaf and enhanced square below is a target of this document with its intended signature, not a declaration of that file.

### From the geometric and derived suppliers

AdicSpacesPartII §§R0.15–R0.17 supplies continuous differentials, smooth/étale morphisms and toric charts. AdicSpacesPartIII F0 supplies p-adic formal schemes and special/generic fibres; R2 supplies formal models, admissible blow-ups and Raynaud's theorem; §§R3.6–R3.7 supplies proper coherent finiteness, continuous de Rham complexes, flat base change and GAGA. Use these with the descended families and their integrable connections.

AdicEtaleGeometry §§A1.10–A1.12 supplies the pro-étale projection, field-extension slices and profinite covers with the corrected covering condition in Scholze's erratum. ClassicalAdicEtaleCohomology §§1.3–1.4 supplies the étale/pro-étale coefficient dictionary; §4.1 supplies formal specialization; §§8.2, 9.5, 9.7 and 11.1 supplies proper comparison, traces, analytification and the resulting rational Galois actions. PerfectoidSpaces §P3.21 (`etale-almost-acyclicity`) supplies almost acyclicity on affinoid-perfectoid objects.

EnhancedDerivedSheaves Layers E0, E1 and E5:abstract supply stable symmetric-monoidal enhancements and enhanced tensor products. E2 supplies hypercover descent and coherent limits; E4 supplies derived completion and coefficient reconstruction, with the coherent diagrams of E3. DerivedDeRhamCohomology §§1.14–1.22, 2.22–2.26 and 5.23–5.24 supplies filtered derived categories, Hodge and p-completion, completed tensor products and proper smooth de Rham base change. In the nearby-cycle square retain its Hodge-completed tensor with `A_dR` and convolution filtration (AMMN Construction 7.12 and Theorem 7.13, pp.53–54); tensoring only with `Fil^i A_dR` gives a different object.

AlgebraicModuliForArithmeticGeometry §§6.1, 7.8 and 8.2 supplies algebraic approximation, proper-space formal existence and deformation effectivity. Together with AdicSpacesPartIII F0/R2 these are inputs to AInfCohomology §AI.6.5’s proper spreading theorem consumed in §2.7. SchemeAndStackFoundations §§4.11, 5.4–5.6 supplies blow-ups, projective/flag bundles and intersection geometry. AlgebraicModuliForArithmeticGeometry §§9.4–9.7 supplies characteristic-zero resolution and SNC compactification; the algebraic h-descent realization in §4.8 is constructed here from these geometric inputs, crystalline cohomology and enhanced descent. Layer 6.4a constructs the algebraic de Rham trace pairing, Gysin and cycle maps using SchemeAndStackFoundations Layer 2’s coherent duality. The Enriques construction of §5.11 is a target here. CrystallineCohomology §CR.3.5 supplies the finite-group quotient/torsor surface used in §5.12.

### From `A_inf`, crystalline and prismatic cohomology

AInfCohomology §§AI.0.1, AI.0:integral.1–AI.0:integral.2 and AI.0:period-comparison.1 supplies `θ`, `θ̃`, `μ`, `ξ`, residue reduction and their actual period maps. §§AI.1.1–AI.1.4 supplies `Lη` and its multiplicative Bockstein reduction, with the Bockstein comparison in §AI.1.4. AI.2 supplies the finite-free Breuil–Kisin–Fargues classification of an étale lattice together with a `B_dR⁺` lattice, the torsion dévissage and the base-change injection/equality criterion. AI.3–AI.4 supplies `AΩ`, its local toric Koszul models and global descent. AI.5 supplies proper perfectness and the cohomology module properties used in BMS Theorems 14.1 and 14.3. Its perfectness proof must use those local constructions, not a comparison target from this roadmap as an input.

AInfCohomology §AI.6.5 supplies the infinitesimal envelopes, very-small approximation, normal forms and refinement maps, canonical `K_dR⁺`, proper spreading, finite freeness, descended filtered identification and integral/rational map agreement. In particular use `AInf.canonical_deformation_free`, `AInf.canonical_rational_comparison` and `AInf.integral_deformation_agreement`. Sections 2.1–2.13 and 2.16–2.17 below record these supplier interfaces; the relative site, coefficient functor and relative comparison in §§2.18–2.24 are targets here. AInfCohomology §AI.7.2 supplies `AInf.Trace.THH`, its circle/Tate and cyclotomic maps and `AInf.Trace.bokstedt_periodicity`; PrismaticCohomologyPartIII §7.0 supplies the rational trace square, its uniform denominator refinement and the graded Beilinson comparison recorded in §3.7.

For the logarithmic range use AI.6.3 for log de Rham specialization, AI.6.4 for the global crystalline map and its de Rham square, and AI.6.6 for étale comparison and `B_dR` agreement. AI.6.7 supplies degreewise specializations, crystalline and de Rham torsion bounds, rank equality, the de Rham lattice functor and model independence. Use AI.6.4 `Semistable.hyodoKatoInterface` (iv) for the CK Proposition 9.2 `B_st⁺` adapter, including its two log bases, tensor Frobenius, total monodromy and Galois action; §4.2 transports this supplied map to our conventions. Retain the vertical semistable charts and the consecutive-degree freeness assumptions of each lattice assertion.

CrystallineCohomology §§CR.1.1–CR.1.4 supplies crystalline sites, crystals, connections and Witt evaluation; §§CR.2.1–CR.2.3 supplies embedding computations, the PD Poincaré lemma and smooth-lift filtrations. §§CR.3.1–CR.3.5 supplies descent, base change, perfectness, products, the first crystalline Chern class and torsion examples. The crystalline projective-bundle formula and higher Chern classes are constructed in §6.8. §CR.3:Frobenius-isogeny.1 supplies the affine rational Frobenius-isogeny input for residue-section descent (BMS Proposition 13.21, p.116). §§CR.4.6–CR.4.7 supplies de Rham–Witt/crystalline comparison with degree-scaled Frobenius. §§CR.6.1–CR.6.3 supplies Hyodo–Kato complexes, log base change, `Nφ=pφN`, uniformizer change and the Tate-curve examples; §§CR.6.4–CR.6.5 supplies the log rigid overconvergent realization. Section 4.8 constructs the algebraic h-realization over uncompleted `F^{nr}`. Section 4.9a constructs the analytic semistable descent realization needed by the proper rigid theorem; §CR.6.5 supplies its semistable residue-model values. CrystallineCohomology §CR.3:duality.1 supplies the crystalline trace, Poincaré pairing and Gysin maps; §6.6 compares these with the other realizations.

PadicPeriodRings §3 and DerivedDeRhamCohomology §§PD.1–PD.7 supplies the principal Fontaine envelope and general PD envelopes, respectively. PadicPeriodRings §§4.1–4.3 and DerivedDeRhamCohomology §5.14 supplies `A_cris` and its filtered embedding into `B_dR⁺`.

PrismaticCohomology §§0.73–0.82, 1.1–1.23 and 2.1–2.30 supplies bounded/perfect prisms, relative and animated prismatic cohomology, crystalline and Hodge–Tate comparisons, Frobenius-twisted de Rham comparison and proper smooth perfectness, with derived/site agreement in §§2.10–2.12. PrismaticCohomologyPartII §§5.23–5.25 supplies the Frobenius-pulled AΩ/prismatic comparison and perfect-prism uniqueness with its structural transformation; §1.7 proves agreement with the chosen specializations. Its §§3.9–3.10, 3.20 and 4.25–4.31 supplies completed absolute Nygaard, twist and divided-Frobenius data. PrismaticCohomologyPartIII §§6.8–6.9 supplies `Prismatic.Syntomic.syntomicComplex` and `Prismatic.Syntomic.syntomicCup`; §7.0 supplies `Prismatic.Trace.rationalBeilinson`, `Prismatic.Trace.relativeComparison_boundedDenominators`, `Prismatic.Beilinson.chi`, `Prismatic.Beilinson.square`, `Prismatic.Beilinson.cofibre` and `Prismatic.Beilinson.chi_boundedDenominator`. Section 1.11 constructs the additional class-map agreements using these coefficients. Relative analytic F-crystals, their extension to perfect-complex F-crystals and relative étale–crystalline equivalence are constructed in §2.24.

PrismaticCohomologyPartIV §§8.1–8.29 supplies logarithmic delta rings, prisms, sites, cohomology, Frobenius and completed base change. Its §§8.35, 8.41–8.42, 8.56 and 8.69 supply the log-crystalline, semistable `AΩ` and period, log-de Rham and Kummer-étale comparison maps used in §4.6, with each comparison's boundedness, integrality, Cartier-type and perfect-log-base hypotheses. Its §8.60 supplies shared log adic structures, logification, pullback, integral fs charts and the Kummer-étale site used in §6.1. The additional period and Hyodo–Kato agreements of §4.6 and the pro-Kummer tower and logarithmic period sheaf of §6.1 are constructed here.

### From local p-adic Hodge theory and integral representation theory

PadicPeriodRings §§1.5, 3 and 4.1–4.3 supplies the period-field/DVR theorems, crystalline/de Rham embeddings, semistable rings, invariant fields and continuous Galois actions for `C=widehat(K̄)` in arithmetic statements. PadicHodgeTheory §§0.2–0.5 supplies the relative filtration and logarithm adapters. Its §§2.1–2.7 supplies local period sheaves, toric and profinite-product calculations, the structural Poincaré lemma and primitive finite-coefficient/almost comparison, including the p-completed proper-space extension. Use these local results before the global comparison here. Its §§3.1–3.5 supplies period functors and filtered realizations using FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.1–R07.3.3 for admissibility and weak admissibility. PadicHodgeTheory §§8.1–8.2 supplies the finite-`K` rational constant-coefficient maps and `prismaticSpecializationAgreement`; §§3.4–3.5 and 4.3–4.4 retain them through `finiteBaseComparisonAgreement`, and §§1.7–1.8 transport the supplied specialization square. PadicHodgeTheory §§6.1–6.2 supplies the Fontaine–Laffaille sign dictionary; §§7.1–7.3 supplies filtered connections and relative de Rham comparison. `G_K` acts on period coefficients, in particular nontrivially on the geometric `W(k)[1/p]`. The overconvergent syntomic-to-étale map and Banach–Colmez exactness needed for the broader `C_st` theorem are local construction targets in §4.10.

FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 supplies the finite flat group schemes used in the torsion examples. §§R07.3.15–R07.3.17 supplies its lattice correspondence and full faithfulness only for the unramified Fontaine–Laffaille interval `[0,p−2]` with the supplier's endpoint conventions; at `p=2` this interval is `[0,0]`. R07.4 must supply the all-weight crystalline-lattice Kisin functor, its `B_cris⁺` realization, `A_inf` extension and full-faithfulness over the p-power-root tower used in BMS Theorem 4.4 and Proposition 4.34. A theory restricted to finite flat groups or weight one is insufficient for the unrestricted cohomological lattice recovery.

### From duality and completed cohomology

EtaleCohomologyFoundations §§0.9–0.11 and F.5–F.7 supplies the Kummer first Chern class, traces, smooth purity, Poincaré pairing, cycles, Gysin maps, self-intersection and projective bundles with their pullback injectivity. EtaleDualityAndPerverseSheaves §§1.1–1.3 and 4.4 supplies higher Chern and Chow classes and flag integration. SchemeAndStackFoundations §§5.4–5.6 supplies projective and complete flag geometry over the base, and AlgebraicVectorBundles L0B/L2B supplies finite locally free sheaves and their total spaces. For quotient lines use the supplied line-projective bundle of `E∨`, transporting the Chern classes by `c_r(E∨)=(−1)^r c_r(E)`; the quotient relation is then the alternating-sign relation fixed above.

CompletedCohomologyPartII §§2.2–2.3, 2.5, 2.7 and 2.9 supplies the bounded-torsion inverse-limit control; §§4.3–4.5 supplies integral completed cochain models and coefficient interchange. §§8.4, 8.6–8.7 supplies the modular-tower comparison, fixed-exponent convention and transported continuous Galois actions. Its F.4 supplies derived locally analytic operations on LocallyAnalyticDistributions §§0.0–0.3. The exactness and character-decompletion assertions for Pan's specific period representations are proved in §6.11 here; the infinite-level modular-curve geometry and its flag basis are constructed in §6.2.

## How to read the build

Layer 0 fixes coefficient maps and transport conventions. Layer 1 assembles integral smooth specializations. Layer 2 consumes the canonical `B_dR⁺` construction and lattice from AInfCohomology §AI.6.5 and constructs the relative infinitesimal site and relative coefficient comparison. In that relative branch construct §2.24’s perfect-complex extension and crystalline realization before extending §2.22 from vector-bundle to perfect coefficients and applying §6.3. Layer 3 then descends the crystalline comparison and builds the nearby-cycle pullback square. Layer 4 treats vertical semistable and broader rational `C_st` comparisons in their separate ranges. PrismaticCohomologyPartIV precedes this roadmap and supplies the generic logarithmic theory consumed by §§4.6 and 6.1. Layer 5 derives torsion inequalities and integral lattice recovery, with counterexamples guarding their hypotheses. Layer 6 proves trace, cycle and Chern compatibility and the modular-curve finite-period comparisons. Within Layer 6, construct §6.2’s shared small-Hasse canonical subgroups before its geometric tower, flag basis and finite-level descent, then §6.1’s logarithmic period sheaf, then §6.11 and §§6.11a–6.15, proving the fixed-exponent compactification restriction before the almost comparison in §6.11a. In the class-comparison branch, construct §6.4a’s de Rham maps and the bundle/class API at the start of §6.8 before §§6.5–6.7, then prove §6.8’s higher-class comparison. A source-labelled isomorphism always means the constructed comparison map, with its specified scalar extensions and choices.

## Layer 0: Coefficient maps and normalization

### 0.1 Normalized specialization diagram

Define `SpecializationDictionary` to bundle the coefficient maps used by the cohomological comparisons, together with their normalization equations. For the ring of integers `O=O_C` of a complete algebraically closed extension `C/ℚ_p` and its residue field `k`, the entries are `θ:A_inf→O`, `θ̃=θφ⁻¹`, `w:A_inf→W(k)`, `A_inf→A_cris→B_dR⁺`, and the rational factorization `A_inf[1/μ]→B_cris→B_dR`. Choose `ε=(1,ζ_p,ζ_{p²},…)` with primitive compatible p-power roots and put `μ=[ε]−1`, `ξ=μ/φ⁻¹(μ)`, `ξ̃=φ(ξ)`. The quotient expression is implemented by the geometric sum in `[ε^{1/p}]`, so it makes sense inside `A_inf` without division.

Record `ker θ=(ξ)`, `ker θ̃=(ξ̃)`, `θ(μ)=θ(ξ)=0`, `w(μ)=0` and `w(ξ)=p`. The `B_dR⁺` arrow must be the canonical map into the completion, including its equality with the composite through `A_cris`. This is a dictionary of existing coefficient objects: the new work is their commuting diagram. In particular `w` and `θ` have different values on `ξ`. For localization at `μ`, carry the primitive-system hypothesis through every map; `ε=1` gives `μ=0` and cannot define the indicated map to a nonzero period field.

Split the dictionary into data and equations. `SpecializationDictionary A O W Acrys BdRPlus` bundles the Frobenius automorphism `phi` of `A`, the maps `theta`, `thetaTilde`, `witt`, the Witt vector Frobenius `phiW` of `W`, the maps `toAcrys`, `acrysToBdRPlus`, `toBdRPlus`, and the elements `xi` and `mu`; put `xiTilde = phi xi`. The predicate `SpecializationDictionary.IsNormalized d p` records the equations `θ̃=θφ⁻¹`, the factorization of `A→B_dR⁺` through `A_cris`, `θ(ξ)=0`, `ker θ=(ξ)`, `ker θ̃=(ξ̃)`, `w(ξ)=p`, `w(μ)=0`, `wφ=Fw` and the geometric-sum identity `μ=ξ·φ⁻¹(μ)`. The last equation is what "`ξ=μ/φ⁻¹(μ)`" means; it holds for every `ε`, including `ε=1` where both sides vanish. The rational factorization `A_inf[1/μ]→B_cris→B_dR` is not a field of this structure, whose carriers are those available at the pins: it is stated with the `B_cris` of PadicPeriodRings §§1.5, 4.1–4.3, for a primitive `ε`, as the commuting square of the `B_dR⁺` arrow above after inverting `μ`.

The standard value `SpecializationDictionary.standard O p Acris toAcris acrisToBdRPlus ε` takes `A=W(O^♭)` (`Ainf O p`, the Witt vectors of Mathlib's `PreTilt`), its Witt vector Frobenius `ainfFrobenius`, Mathlib's `θ`, `fontaineThetaTilde=θ∘φ⁻¹`, the Witt reduction `wittReduction=W(residueOfTilt)`, where `residueOfTilt:O^♭→k` is the zeroth coordinate in `O/p` followed by `O/p→k`, with the Witt vector Frobenius of `W(k)`, the canonical map `ainfToBdRPlus` into Mathlib's `BDeRhamPlus`, and the elements `xiOf=Σ_{i<p}[ε^{1/p}]^i`, `muOf=[ε]−1` and `xiTildeOf=φ(xiOf)`, where `epsRoot ε=ε^{1/p}` is the inverse Frobenius in the perfect ring `O^♭`. The ring `A_cris` and its two maps are those of PadicPeriodRings §3 and enter as parameters. The predicate `IsPrimitiveRootSystem ε` says that the untilt of `ε` is 1 and the untilt of `ε^{1/p}` is not, so that the untilts of the `ε^{1/p^n}` are primitive `p^n`-th roots of unity.

Prove `SpecializationDictionary.standard_isNormalized`: for `O=O_C`, a primitive root system `ε`, and `A_cris→B_dR⁺` restricting on `A_inf` to the canonical map, the standard dictionary is normalized. Its components are the theorems `muOf_eq_xiOf_mul` (no hypothesis on `ε`), `fontaineTheta_xiOf` (`O` a domain), `wittReduction_xiOf`, `wittReduction_muOf` and `wittReduction_comp_ainfFrobenius` (`O` local), and `ker_fontaineTheta`, `ker_fontaineThetaTilde` (`O=O_C`). The reduction `w(ξ)=p` uses only that `𝔪` is prime and contains `p`: `ζ_p^p=1` gives `(ζ_p−1)^p∈pO`, so `ζ_p≡1` modulo `𝔪` and each `[ε^{1/p}]` reduces to 1.

The API of a normalized dictionary is `SpecializationDictionary.thetaTilde_apply` (`θ̃` as `θφ⁻¹`), `period_composite` (the two `B_dR⁺` arrows agree), `theta_xi` (value zero), `witt_xi` (value `p`), `witt_mu` (value zero), `ker_theta` (the two principal kernels), `witt_frobenius` (residue reduction intertwines the two Frobenii) and `thetaTilde_xiTilde` (`θ̃(ξ̃)=0`). All names in this paragraph belong to `SpecializationDictionary`, and each follows from `IsNormalized` without unfolding the standard value.

**Checks.**

- Compute `θ(ξ)=0` for the standard dictionary.
- If `p≠0` in `W(k)`, compute `w(ξ)=p≠0`. A dictionary that replaces Witt reduction by `θ` fails.
- On an arbitrary `a∈A_inf` compute the same image in `B_dR⁺` by the direct arrow and by `A_cris`.
- Identify the standard `θ` with `WittVector.fontaineTheta` and its completion target with `BDeRhamPlus`, rather than an unrelated quotient ring.
- For the trivial compatible root system `ε=1`, compute `μ=0`; the required localization-to-period-field denominator is not a unit. This is a negative control on the primitive-root hypothesis, which `ε=1` fails because the untilt of `1^{1/p}=1` is 1.
- Check `μ=ξ·φ⁻¹(μ)` by expanding `(Σ_{i<p}[ε^{1/p}]^i)([ε^{1/p}]−1)=[ε]−1`, using `φ⁻¹[ε]=[ε^{1/p}]`. Taking `ξ=μ`, or `ξ=φ(μ)/μ`, fails this identity, and taking `ξ̃=φ⁻¹(ξ)` fails `θ̃(ξ̃)=0`.

The coefficient components have the following API and checks. They specialize the supplied Witt/completion constructions, with no additional topological `A_inf` carrier.

| Definition | Required API | Checks |
| --- | --- | --- |
| `Ainf O p` | Witt coordinates, Teichmüller representatives and scalar maps inherited from `WittVector p (PreTilt O p)` | The zeroth coordinate of `[x]` is `x`; `[xy]=[x][y]`; the tilt's characteristic `p` does not force `p=0` in its Witt ring. |
| `ainfFrobenius` | Forward and inverse action on Witt coordinates and Teichmüller representatives | `φ[x]=[x^p]`; `φ⁻¹[x]=[x^{1/p}]`; `φ` fixes `p` rather than taking it to `p^p`. |
| `epsRoot` | Inverse Frobenius, multiplicativity and compatibility with untilt | `(ε^{1/p})^p=ε`; the root of 1 is 1; for a primitive system its untilt is `ζ_p≠1`. |
| `IsPrimitiveRootSystem` | Primitive `p^n`-th roots under iterated inverse Frobenius, and compatibility under transition | `exists_primitiveRootSystem` supplies a primitive system under the `IntegersOfC` hypotheses of Suggested.lean; the trivial system fails; from a primitive `ε`, the constructed delayed system `ε′=ε^p` satisfies `epsRoot ε′=ε` and fails the first-root condition, while `untilt(epsRoot(epsRoot ε′))≠1`. |
| `muOf` | Teichmüller formula, `θ` and Witt reduction, and geometric-sum factorization | At `ε=1` its value is zero; `θ(μ)=0` for a primitive system; `μ=ξφ⁻¹(μ)`, detecting the wrong choice `μ=ξ`. |
| `xiOf` | Geometric-sum formula, kernel generator and `θ/Witt` values | At `ε=1` its value is `p`; at a primitive system `θ(ξ)=0`; Witt reduction is `p`, distinguishing it from `μ`. |
| `xiTildeOf` | Frobenius transport of `ξ` and generator of `ker θ̃` | At `ε=1` its value is `p`; `θ̃(ξ̃)=0`; `φ⁻¹(ξ̃)=ξ` rather than `φ(ξ̃)=ξ`. |
| `fontaineThetaTilde` | `θ∘φ⁻¹` and its principal-kernel normalization | Applied to `φ(a)` it gives `θ(a)`; it kills `ξ̃`; its kernel is `(ξ̃)`, whereas `θ` has kernel `(ξ)`. |
| `residueOfTilt` | Zeroth coordinate modulo `p` followed by the residue quotient; functoriality in local ring maps | A primitive `ε` reduces to 1; `ε^{1/p}` also reduces to 1 although its untilt is not 1 in `O`; an element whose untilt is a unit with nontrivial residue keeps that residue (at odd `p`, the tilt element `−1` has residue `−1≠1`). |
| `wittReduction` | Witt functor of `residueOfTilt`, Teichmüller images and Frobenius compatibility | `w(μ)=0`; `w(ξ)=p`; `wφ=Fw`, with `F` acting on coefficients rather than fixed pointwise. |
| `ainfToBdRPlus` | Canonical localization/completion map and equality with the `A_cris` composite | Both composites agree on each `[x]`; `p` becomes invertible; a primitive system's `ξ` reduces to zero under `θ`, while `ainfToBdRPlus_xiOf_irreducible` gives its nonzero irreducible image in the actual `BDeRhamPlus` in the `O_C` range, hence a uniformizer in the supplied complete DVR. |
| `SpecializationDictionary.xiTilde` | `φ(ξ)`, specialization and inverse transport | `θ̃(ξ̃)=0` for normalized data; `φ⁻¹(ξ̃)=ξ`; the standard value equals `xiTildeOf`. |
| `SpecializationDictionary.IsNormalized` | The nine displayed equations and the projection API above | Standard primitive data satisfies it; replacing `w` by `θ` violates `w(ξ)=p`; reversing `φ` in `θ̃` changes the required kernel. |
| `SpecializationDictionary.standard` | Identification of each entry with the actual supplied coefficient map and the normalization theorem | Its `θ` is `WittVector.fontaineTheta`; its `μ` at `ε=1` is zero; with primitive `ε` the two arrows to `B_dR⁺` agree by the stated `A_cris` restriction hypothesis. |

(Bhatt–Morrow–Scholze, §1.2 for primitive root systems and the `B_dR⁺` uniformizer; §3.1, p.20, for `θ_r=θ̃_rφ^r`; Lemma 3.12, p.23; Example 3.16, p.25; Definition 3.22, p.27; §4.3, p.40.)

*Needs:* AInfCohomology `AI.0:integral`; PadicPeriodRings §3; DerivedDeRhamCohomology PD; PadicPeriodRings §§1.5, 3, 4.1–4.3; Mathlib `WittVector.fontaineTheta`; Mathlib `BDeRhamPlus`; Mathlib `WittVector.frobeniusEquiv`; Mathlib `PreTilt.untilt`; Mathlib `WittVector.map`; AInfCohomology `AI.0:period-comparison`; PadicPeriodRings §4.1.

### 0.2 Formal and analytic cohomology dictionary

For a proper smooth scheme `X₀/O_K`, form its p-adic completion `𝔛₀`, the completed base change `𝔛/ O_C`, the geometric analytic generic fibre `X_C` and the residue scheme `X_k`. Introduce the comparison dictionary identifying algebraic and analytic étale cohomology of the proper generic fibre, algebraic de Rham cohomology and the continuous formal de Rham complex, and the crystalline complexes of the common residue scheme. These identifications must be the maps produced by completion and proper GAGA, natural in `X₀`, rather than merely isomorphisms of abstract groups.

There are two different special-fibre bases in the integral diagram: `Y=𝔛×Spec(O_C/p)` is the base for the `A_cris` comparison, whereas `𝔛_k` is the base for the `W(k)` comparison. Retain both named fibre maps. The ring `O_C/p` is not a field, and replacing `Y` by `𝔛_k` loses the actual crystalline input. The common geometric point `K̄→C` also fixes which Galois representation the generic cohomology means.

(Bhatt–Morrow–Scholze, Theorem 1.1 and Remarks 1.2–1.3, pp.2–4; §13.4, p.116.)

*Needs:* ClassicalAdicEtaleCohomology §4.1; CrystallineCohomology `CR.3`; ClassicalAdicEtaleCohomology §11.1.

### 0.3 Compatible geometric fibres and sites

Construct the derived comparison maps associated to `ν:X_proét→X_ét` and to formal specialization, and prove their compatibility with pullback, pushforward and the fibre identifications above. For a space descending to `K`, use the same embedding `K̄→C` on both sites. In these conventions the `G_K` action on the two cohomology complexes is transported by the comparison map, not recreated from a different choice of geometric fibre.

The pro-étale covers and field-extension slices are those of the corrected site theory. Prove compatibility using those covers and their descent maps; do not use the point-description statements removed by Scholze's erratum. For modular curves use PrismaticCohomologyPartIV §8.60's Kummer-étale projection and Layer 6's additional pro-Kummer projection. The logarithmic crystalline PD site has different objects and cannot supply these projections.

(Scholze, official erratum, Erratum (1)–(3), pp.1–2.)

*Needs:* AdicEtaleGeometry `A1`; AdicEtaleGeometry §§A1.10–A1.12; ClassicalAdicEtaleCohomology §4.1; ClassicalAdicEtaleCohomology §§1.1–1.4.

### 0.4 Twists, Frobenius and filtration conventions

Fix the twist dictionary before comparing modules. `ℚ_p(1)` has `G_K` action `χ_p` and Hodge–Tate weight `+1`. Put `t=log[ε]`, so `φ(t)=pt` and `Fil^r B_dR=t^r B_dR⁺` for every integer `r`. The integral Hodge–Tate sheaves use `Ω^j{−j}` with the Breuil–Kisin twist; the identification with a Tate twist after a period extension must be an explicit map. Display a semilinear Frobenius as its linearization `φ* M→M`.

For the chosen uniformizer `π` of `O_K` and compatible roots `π^{1/p^n}`, write `𝔖₀=W(k₀)[[u]]`. In the convention used for BMS lattice recovery, `ι₁:𝔖₀→A_inf` sends `u` to `[π♭]^p` and uses Witt Frobenius followed by the coefficient inclusion `W(k₀)→A_inf`; the specialization `ε₁:𝔖₀→W(k₀)` sends `u` to zero and uses the same coefficient Frobenius. Geometric specialization is `ε₁` followed by `W(k₀)→W(k)`. Keeping that twist visible is essential for identifying the lattice with its `φ`-action. As a normalization witness, `φ(t)=pt` gives weight `+1` to `ℚ_p(1)`, while the degree-two cohomology of `P¹` is `ℚ_p(−1)`, of weight `−1`.

**Checks.**

- For `K=ℚ_p`, the arithmetic ring is `𝔖₀=ℤ_p[[u]]`; its geometric extension has coefficients `W(𝔽̄_p)`.
- There is no unital map `W(𝔽̄_p)→ℤ_p`: reduction modulo `p` would embed `𝔽̄_p` into `𝔽_p`. Thus the arithmetic coefficient lift cannot start from `W(k)`.
- At `u=0`, `ε₁` is Frobenius on `W(k₀)`; for `k₀=𝔽_(p²)` it differs from the identity on a Teichmüller element outside `𝔽_p`.

(Bhatt–Morrow–Scholze, Example 4.24, p.41; §4.4, pp.43–44; introduction p.4.)

*Needs:* Layer 0.1 (Normalized specialization diagram); AInfCohomology `AI.2`; Mathlib `cyclotomicCharacter`; PadicPeriodRings §§1.5, 3, 4.1–4.3.

### 0.5 Coefficient choices and transport

Separate canonical scalar maps from proof choices. If `K⊂C` is complete discretely valued with perfect residue field, construct its unique continuous lift `K→B_dR⁺`. This is the scalar structure used in descended de Rham comparisons. No section of `θ` on all of `C` is part of the construction. Over an imperfect residue field, first-order lifts are governed by the nonzero torsor `Hom(Ω̂¹_{O_K},C(1))`; uniqueness cannot be transferred from the perfect-residue case.

For a smooth affinoid spreading algebra `A/K`, choose a lift `A→B_dR⁺` only to calculate the completed envelope. Compare two such choices through a common enlargement of the embedding coordinates. The resulting cohomological identification must satisfy the refinement cocycle. A choice `k→O_C/p` in rational crystalline base change is another, separate choice: retain it in the map and assert independence only within the exact cases of BMS Remark 13.22.

(Bhatt–Morrow–Scholze, Lemmas 13.11–13.13, pp.109–112; Remark 13.20, p.114; Remark 13.22, p.116.)

*Needs:* Layer 0.1 (Normalized specialization diagram); PadicPeriodRings §§1.5, 3, 4.1–4.3.

### Examples

At the primitive cyclotomic system, `θ(ξ)=0` and `w(ξ)=p` separate the two scalar maps. At `ε=1`, `μ=0`; localization at that `μ` is the zero ring and cannot map unitally to the nonzero period field. For `ℚ_p(1)` the Frobenius equation `φ(t)=pt` fixes the positive Tate weight, while `P¹` has degree-two weight `−1`. The coefficient lift `K→B_dR⁺` is canonical only in the complete perfect-residue range stated above.

### Dependencies

Mathlib Witt vectors, Fontaine `θ`, BDeRhamPlus, BDeRham and cyclotomicCharacter; AInfCohomology AI.0; PadicPeriodRings §3; PadicPeriodRings §§1.5, 4.1–4.3; AdicSpacesPartIII F0/R2/R3; AdicEtaleGeometry A1; ClassicalAdicEtaleCohomology §§1.3–1.4, 4.1, 8.2, 9.5, 9.7, 11.1. The perfect-residue coefficient lift is an arithmetic period input.

## Layer 1: Integral specialization squares

### 1.1 Proper smooth `A_inf` input package

For a proper smooth p-adic formal scheme `𝔛/O_C`, take `K_A=RΓ(𝔛,AΩ_𝔛)`, with its geometric functoriality and Frobenius, from the `A_inf` cohomology construction. Use the perfectness theorem for this very complex. Its cohomology is finitely presented over `A_inf` and becomes finite free after inverting `p`; the associated Breuil–Kisin–Fargues data come with the actual generic and special fibres.

Organize the comparison input as named maps from `K_A` to the de Rham, Witt-crystalline, `A_cris`-crystalline and `μ`-inverted étale specializations. Each scalar map is fixed by Layer 0. The purpose is to make later assertions statements about these particular maps. A collection of perfect complexes with matching ranks does not specify the geometric comparison, its Galois action or the lattice recovered in Layer 5. Perfectness must be supplied without assuming any comparison proved from it here.

(Bhatt–Morrow–Scholze, Theorems 14.1 and 14.3, pp.118–120.)

*Needs:* AInfCohomology `AI.4`; AInfCohomology `AI.5`; Layer 0.1 (Normalized specialization diagram).

### 1.2 Integral de Rham specialization

For the same proper smooth `𝔛`, prove that the `θ`-specialization of `K_A` is the continuous de Rham complex:

```text
K_A ⊗^L_{A_inf,θ} O_C  ≃  RΓ(𝔛, Ω^{•,cont}_{𝔛/O_C}).
```

Identify this arrow with the local `AΩ` comparison after descent. It preserves the multiplication in the smooth BMS setting. Use completed continuous differential forms appropriate to the formal model, including the restriction maps used to calculate global sections. The assertion is a derived equivalence, even if a cohomology group has p-torsion. Extracting an ordinary tensor formula for `H^i` requires the separate base-change argument and its Tor hypotheses.

(Bhatt–Morrow–Scholze, Theorem 14.1(ii), p.118; Theorem 14.3(ii), p.120.)

*Needs:* Layer 1.1 (Proper smooth `A_inf` input package); Layer 0.1 (Normalized specialization diagram); AInfCohomology `AI.4`.

### 1.3 Hodge–Tate specialization and Bockstein

Use `θ̃` rather than `θ` to obtain the Hodge–Tate object. On the formal scheme its degree-`j` cohomology sheaf is `Ω^j_{𝔛/O_C}{−j}`; the Bockstein connecting differential identifies with the de Rham differential after applying the specified Breuil–Kisin twists. Prove compatibility of this identification with products, including the graded Leibniz rule for the Bockstein.

The output is an identification of cohomology sheaves and their differential, not a canonical splitting into untwisted differential forms. In degree one a wrong convention loses the invertible twist line. The comparison with the preceding `θ`-complex is made by the coefficient dictionary and the Bockstein construction; it is not an equality between `θ` and `θ̃`. Keep the local sheaf statement until the derived global comparison has been applied.

(Bhatt–Morrow–Scholze, Theorem 8.3, p.61; Theorem 9.2(i), p.69; Proposition 6.12, p.52; Theorem 14.1 proof, p.118.)

*Needs:* AInfCohomology `AI.4`; Layer 0.1 (Normalized specialization diagram); AInfCohomology §AI.1.4.

### 1.4 Derived Witt crystalline specialization

Prove the `W(k)` specialization using the derived p-completed tensor:

```text
K_A ⊗̂^L_{A_inf,w} W(k)  ≃  RΓ_crys(𝔛_k/W(k)).
```

Locally this comparison is the de Rham–Witt complex. Match its Frobenius with crystalline Frobenius by the explicit degree-scaled operators of that complex and by `wφ=Fw`. This compatibility is an additional comparison target: the statements of BMS Theorems 14.1(i) and 14.3(i) supply the equivalence but do not separately state its Frobenius law.

The coefficient computation `w(ξ)=p` explains the completion ideal on this specialization. Treat integral cohomology after derived base change; the term involving Tor of `H^{i+1}(K_A)` may contribute. The free crystalline lattice in Layer 5 follows only after the torsion hypotheses remove that contribution.

(Bhatt–Morrow–Scholze, Theorem 14.1(i), p.118; Theorem 14.3(i), p.120.)

*Needs:* Layer 1.1 (Proper smooth `A_inf` input package); Layer 0.1 (Normalized specialization diagram); CrystallineCohomology §CR.4.7; CrystallineCohomology §§CR.4.6–CR.4.7.

### 1.5 Integral `A_cris` specialization

For `Y=𝔛_{O_C/p}`, construct the actual comparison `K_A⊗̂^L_{A_inf}A_cris≃RΓ_crys(Y/A_cris)`. Use the PD embedding complex of `Y` and the explicit `AΩ` maps to identify the morphism. In the proper smooth case, justify any replacement of a completed tensor by an ordinary derived tensor from perfectness and the source's coefficient argument; no such replacement is asserted for arbitrary complexes.

Prove the Frobenius commutation equation on the local maps before passing to global sections. BMS Theorem 12.1 and Theorem 14.3(iii) do not include that equation in their stated conclusions. Their smooth multiplicative assertion is about commutative algebra objects in the derived category. A coherent `E∞` enhancement further needs the monoidal décalage and completed-tensor construction specified below.

(Bhatt–Morrow–Scholze, Theorem 12.1, p.96; Theorem 14.3(iii), p.120.)

*Needs:* Layer 1.1 (Proper smooth `A_inf` input package); AInfCohomology `AI.4`; CrystallineCohomology `CR.2`; PadicPeriodRings §3; CrystallineCohomology §CR.2.2.

### 1.6 Étale specialization after `μ` inversion

For a proper smooth formal model with geometric generic fibre `X_C`, use the primitive comparison to obtain

```text
K_A[1/μ] ≃ RΓ_ét(X_C,ℤ_p) ⊗^L_{ℤ_p} A_inf[1/μ].
```

The map is the `μ`-localized local comparison to `Rν_*A_inf,X`, descended through the common covering. Check its Frobenius law using the trivial Frobenius on the étale factor and the Witt Frobenius on coefficients, and check its products on the same local morphism. These structure laws are targets beyond the bare global equivalence of BMS Theorem 14.3(iv).

Keep properness in this theorem; the assertion is not a blanket comparison for all qcqs nonproper formal schemes. For extension to `W(C♭)`, use flatness of that extension and invertibility of `μ` there to pass to degreewise cohomology. Neither operation implies integral flatness of the Witt reduction `A_inf→W(k)`.

(Bhatt–Morrow–Scholze, Theorem 14.3(iv), p.120; Lemma 4.26, p.41.)

*Needs:* Layer 1.1 (Proper smooth `A_inf` input package); AInfCohomology `AI.0:integral`.

### 1.7 Prismatic Frobenius pullback

Use PrismaticCohomologyPartII §§5.23–5.25 for the Frobenius-pulled AΩ/prismatic comparison and perfect-prism uniqueness with its structural transformation. For the perfect bounded prism `(A_inf,ker θ)`, the supplied comparison identifies `φ*RΓ_Δ(𝔛/(A_inf,ker θ))` with `K_A`. State the comparison as a Frobenius-pullback map and identify its crystalline, de Rham and étale specializations with the chosen maps. Use PadicHodgeTheory §8.2’s `prismaticSpecializationAgreement` for the crystalline/de Rham square in its bounded-prism range with `W(A/I)` p-torsion-free, retaining its coefficient Frobenius; transport that supplied square through the Frobenius-pulled AΩ identification. The additional étale and structural-transformation agreements belong here. A formulation with `ker θ̃` is transported by `φ` together with its scalar structure.

For map agreement use the precise uniqueness result over a perfect prism `(A,I)`: put `R=A/I`, work on p-completely smooth `R`-algebras, and keep the symmetric monoidal functor `G` into derived `(p,I)`-complete `A`-complexes together with its symmetric monoidal structural transformation `η:id→G⊗^L_A R`. In this category the prismatic object has only the identity endomorphism. This controls natural transformations with `η`, rather than arbitrary isomorphisms of cohomology groups. Frobenius compatibility is not an extra premise of that uniqueness theorem. Verify that the compared constructions inhabit this category before using uniqueness.

(Bhatt–Scholze, Theorem 17.2, p.117 (proof pp.117–121); Notation 18.1, Theorem 18.2 and Lemma 18.3, pp.122–123.)

*Needs:* Layer 1.1 (Proper smooth `A_inf` input package); Layer 0.1 (Normalized specialization diagram); PrismaticCohomologyPartII §§5.23–5.25; PadicHodgeTheory §8.2 (`prismaticSpecializationAgreement`).

### 1.8 Crystalline–de Rham overlap square

Use the mixed-characteristic overlap supplied by PadicHodgeTheory §8.2’s `prismaticSpecializationAgreement`, transported by §1.7, for the two paths from the `A_inf` complex to continuous de Rham cohomology: direct `θ`-base change, and `A_cris` base change followed by `θ:A_cris→O_C` and crystalline-to-de Rham reduction. The comparison is that supplied natural map, with the associativity isomorphism for successive scalar extensions in the square. Any enhanced product or Bockstein refinement of §1.9 must have this underlying square.

On the `W(k)` side, crystalline reduction to `k` uses its Frobenius-normalized scalar structure and the corresponding de Rham complex. It does not give the `θ̃` Hodge–Tate complex. The square must carry the multiplication and the scalar normalization of the maps in the preceding subsections. Comparing only the resulting dimensions would lose the filtration and class compatibilities needed later.

(Bhatt–Morrow–Scholze, Theorem 14.1 proof, pp.118–119; §12.2.)

*Needs:* Layer 1.5 (Integral `A_cris` specialization); Layer 1.2 (Integral de Rham specialization); Layer 1.4 (Derived Witt crystalline specialization); CrystallineCohomology `CR.2`; PrismaticCohomology §§1.14, 1.21–1.23; CrystallineCohomology §CR.2.3; Layer 1.7 (Prismatic Frobenius pullback); PadicHodgeTheory §8.2 (`prismaticSpecializationAgreement`).

### 1.9 Multiplication and Bockstein coherence

Enhance the smooth integral comparison diagram with products, linearized Frobenius and Bockstein operators. Prove the associativity squares for iterated derived scalar extensions and identify their coherent homotopies in the enhanced category. The constructions must use the same morphisms as the preceding diagram, so changing parenthesization of the tensor does not change the comparison map.

Supply the décalage multiplication and the lax symmetric monoidal refinement needed to lift the ordinary derived-category statement. BMS's global smooth assertion alone does not furnish all of these coherent data. The Bockstein obeys the signed Leibniz formula in cohomological degree, so two classes of degree one provide a check on the sign. The log-semistable diagram has its own product scope; none of these enhancements is transferred to it without the corresponding logarithmic comparison theorem.

(Bhatt–Morrow–Scholze, Theorem 14.1 opening and proof, pp.118–119.)

*Needs:* AInfCohomology `AI.1`; EnhancedDerivedSheaves `E4`; Layer 1.8 (Crystalline–de Rham overlap square); AInfCohomology §AI.1.4.

### 1.10 Derived tensor and completion boundary

Record the extension interface for singular, semiperfectoid and nonproper inputs with the actual derived-complete or animated construction supplied by its owner. Each comparison specifies its completion ideal, boundedness or finiteness assumptions and local descent category. The proper smooth theorem above is already complete in its own range; its proof is not permission to discard these hypotheses elsewhere.

For a commutative ring `R`, a non-zero-divisor `a∈R` and any `R`-complex `K`, construct the natural short exact sequence `0→H^i(K)/a→H^i(K⊗^L_R R/a)→H^{i+1}(K)[a]→0`. For arbitrary `a`, the same sequence uses the derived quotient `cofib(a:R→R)` in place of the ordinary `R/a`. Construct its maps from the multiplication triangle in the enhanced tensor theory. This example explains why a cohomology-level ordinary tensor cannot substitute for a derived comparison, and why ordinary `DerivedCategory` alone does not encode animated prisms or filtered `E∞` cohomology.

**Checks.**

- For `R=ℤ`, `a=p` and `K=(ℤ/p)[0]`, the derived reduction has `ℤ/p` in degrees `−1,0`; the degree `−1` term is the adjacent-cohomology torsion term.
- For `R=ℤ/4`, `a=2` and `K=(ℤ/2)[0]`, a periodic free resolution gives `H⁻²(K⊗^L_R R/a)=ℤ/2`, so ordinary `R/a` cannot satisfy the two-term formula without regularity.
- With the derived quotient for this same zero divisor, tensoring gives the two-term zero-differential complex on `ℤ/2` in degrees `−1,0`, and no degree `−2` term.

(Bhatt–Morrow–Scholze, Lemma 4.16, p.38; Theorems 14.1–14.3; the multiplication triangle for the derived quotient.)

*Needs:* EnhancedDerivedSheaves `E4`; PrismaticCohomology §§2.1–2.12; AInfCohomology `AI.5`; EnhancedDerivedSheaves E4; PrismaticCohomology §§2.10–2.12.

### 1.11 Syntomic coefficients and classes

For a p-complete quasisyntomic ring `R` and `i≥0`, use PrismaticCohomologyPartII §§3.9–3.10, 3.20 and 4.25–4.31 for the Nygaard-complete absolute prismatic object `Δ̂_R`, its filtration `N^{≥i}`, Breuil–Kisin twists, divided Frobenius `φ_i` and inclusion `can`. Use PrismaticCohomologyPartIII §§6.8–6.9 for syntomic coefficients and products. Write `SyntomicCoefficient R i` for the supplied complex, with its fibre convention transported by the negative identity on the target:

```text
ℤ_p(i)(R) = fib(can − φ_i : N^{≥i} Δ̂_R{i} → Δ̂_R{i}),
ℚ_p(i)(R) = ℤ_p(i)(R)[1/p].
```

The supplied API gives pullback, products, twist addition, derived p-completeness and quasisyntomic descent; PartIII §7.0 supplies the identification with the degree-normalized weight-`i` piece of `TC`. Transport products together with the fibre equivalence from `φ_i−can` to `can−φ_i`. For smooth `O_C`-algebras retain the truncated nearby-cycle comparison, not an unrestricted equality on all rings. Construct here the line-bundle Kummer/dlog class and its agreement with the supplied syntomic and prismatic coefficient maps, using the supplied products. Construct the projective-bundle splitting needed by §§6.7–6.8. The map from syntomic to twisted prismatic coefficients is `Prismatic.Syntomic.syntomicToFil` followed by `can`.

**Checks.**

- At `Spec F_p` the weight-zero operator is zero, so its fibre retains the shifted term.
- At `Spec F_p` in positive weight the rational operator `φ−p^i` is a nonzero scalar and its fibre vanishes.
- At `R=ℤ_p` and `i=1` the rational complex is `ℚ_p[−1]`, rather than the generic-fibre étale complex; §3.7 computes this from the square.

Sources: Bhatt–Morrow–Scholze, *Topological Hochschild homology and integral p-adic Hodge theory*, Theorem 1.12(3)–(5), Remark 1.14, Theorem 1.15 and §10; AMMN Example 6.13, equation (54), and Construction 6.16, pp.43–44. The cycle products and projective-bundle descent are the additional compatibility targets of §§6.7–6.8.

*Needs:* PrismaticCohomologyPartII §§3.9–3.10, 3.20, 4.25–4.31; PrismaticCohomologyPartIII §§6.8–6.9, 7.0; PrismaticCohomology §§2.1–2.30; AInfCohomology AI.1–AI.4; DerivedDeRhamCohomology §§1.14–1.22, 2.22–2.26; EnhancedDerivedSheaves E0, E2 and E5:abstract. AInfCohomology §AI.7.2 supplies the cyclic bar, circle-action and cyclotomic constructions used to identify the graded TC object; PartIII §7.0 supplies the graded comparison and cartesian-square theorem.

### Examples

For the proper smooth point, each specialization is its coefficient ring in degree zero and all positive cohomology vanishes. Derived base change of the perfect two-term complex `[ℤ_p —p→ ℤ_p]` retains a nonzero Tor contribution after reduction modulo `p`; computing only the ordinary tensor of one cohomology group misses it. Thus consecutive-degree torsion assumptions are necessary for degreewise integral identities.

### Dependencies

Layer 0; AInfCohomology AI.1–AI.5; CrystallineCohomology CR.1–CR.4 and PadicPeriodRings §3; PrismaticCohomology Layers 1–2 and §1.7 here; PadicHodgeTheory §§2.1–2.7; ClassicalAdicEtaleCohomology §§8.2, 9.5, 9.7, 11.1; EnhancedDerivedSheaves E2/E4 and DerivedDeRhamCohomology §§2.22–2.26. No global comparison from Layer 2 is an input to the early primitive theorem.

## Layer 2: Canonical and relative infinitesimal `B_dR⁺` cohomology

### 2.1 Very small affinoid embeddings

Use AInfCohomology §AI.6.5’s very-small-affinoid basis and enlarged Laurent presentations, with common coordinate refinements. The presentation includes the torus coordinates and the redundant units making it surjective.

(Bhatt–Morrow–Scholze, Definition 13.5 and Construction 13.6, p.106.)

*Needs:* AInfCohomology §AI.6.5.

### 2.2 Presented infinitesimal envelope

Use AInfCohomology §AI.6.5’s infinitesimal envelope `D_Σ(R)` and `AInf.bdr_infinitesimal_envelope` coordinate, universal-map, enlargement and derivation API. Its presentation is `P_Σ=lim_n(B_dR⁺/ξ^n)⟨X_u^{±1}⟩`, and its completion is along the whole kernel of `e:P_Σ→R`, including the coordinate relations.

The light algebraic interface in `Suggested.lean` abbreviates the supplied completion by `InfinitesimalEnvelope e = AdicCompletion (RingHom.ker e) P`. `InfinitesimalEnvelope.exists_map` expresses the supplied refinement map for `e′∘g=e`. `InfinitesimalEnvelope.existsUnique_lift` expresses its universal extension to a `P`-algebra `S` complete for an ideal `J` containing the image of `ker e`, with `ker e` finitely generated. Finite generation makes extensions automatically continuous. The boundary target `InfinitesimalEnvelope.coordinate_survives_second_projection` states that for `ℚ[X]→ℚ`, `X↦0`, the completed coordinate has zero first projection and nonzero second projection. These signatures describe the supplier's envelope, rather than a second analytic construction. The projection and extensionality API is Mathlib's `AdicCompletion.evalₐ`, `AdicCompletion.evalₐ_of`, `AdicCompletion.ext_evalₐ` and `AdicCompletion.isAdicComplete`.

**Checks.**

- For `e=id_B`, the completion is `B`, including the zero ring.
- For `e:ℚ[X]→ℚ`, `X↦0`, the completed `X` is nonzero modulo `(X²)`.
- Its first projection is zero; the first quotient does not determine the completed element.

(Bhatt–Morrow–Scholze, Construction 13.6, p.106; Lemma 13.4, pp.105–106.)

*Needs:* AInfCohomology §AI.6.5; Mathlib `AdicCompletion`.

### 2.3 Noetherian approximation for embeddings

Use AInfCohomology §AI.6.5’s smooth noetherian approximation of very small affinoids, retaining the torus chart, surjective Laurent presentation and specified `C`-valued fibre.

(Bhatt–Morrow–Scholze, Lemmas 13.7–13.10, pp.106–109.)

*Needs:* AInfCohomology §AI.6.5.

### 2.4 Completed smooth lift over `B_dR⁺`

Use AInfCohomology §AI.6.5’s completed smooth lift `R_A⊗̂_A B_dR⁺` for a chosen lift `A→B_dR⁺`, with its flatness, `ξ`-completeness, reduction to `R` and topologically free finite reductions. No section on all of `C` is chosen.

(Bhatt–Morrow–Scholze, Lemma 13.11, pp.109–110.)

*Needs:* AInfCohomology §AI.6.5.

### 2.5 Embedding envelope normal form

Use AInfCohomology §AI.6.5’s normal form `D_Σ(R)≃(R_A⊗̂_A B_dR⁺)[[X_u−ũ:u∈Σ\{T₁,…,T_d}]]`. The torus coordinates lift by étaleness; only redundant units contribute formal variables.

(Bhatt–Morrow–Scholze, Lemma 13.12, pp.110–111.)

*Needs:* AInfCohomology §AI.6.5.

### 2.6 Embedding independence and de Rham reduction

Use AInfCohomology §AI.6.5’s refinement quasi-isomorphisms, de Rham reduction and comparison of spreading lifts, including the common-enlargement cocycle. These are the transition maps used by the relative agreement theorem in §2.23.

(Bhatt–Morrow–Scholze, Lemma 13.13 and Definition 13.14, pp.111–112.)

*Needs:* AInfCohomology §AI.6.5.

### 2.7 Spreading out proper smooth rigid spaces

Use AInfCohomology §AI.6.5’s proper smooth spreading theorem, including descent of proper flat formal deformations, effectivity, the smooth parameter neighbourhood and the specified fibre identification. It applies without projectivity.

(Bhatt–Morrow–Scholze, Proposition 13.15 and Corollary 13.16, pp.112–113.)

*Needs:* AInfCohomology §AI.6.5.

### 2.8 Canonical `B_dR⁺` cohomology

Write `K_dR⁺(X)` for the canonical deformation cohomology supplied by AInfCohomology §AI.6.5, defined on the very-small basis by the refinement system of envelope de Rham complexes. Consume its pullbacks, derived `ξ`-completeness, proper smooth perfectness and canonical derived `C`-reduction to `RΓ_dR(X/C)`.

(Bhatt–Morrow–Scholze, Definition 13.18, p.114.)

*Needs:* AInfCohomology §AI.6.5.

### 2.9 Finite freeness of `B_dR⁺` cohomology

Use `AInf.canonical_deformation_free` of AInfCohomology §AI.6.5: for proper smooth `X/C`, every `H^i(K_dR⁺(X))` is finite free and its `C`-specialization is `H_dR^i(X/C)`. This uses proper spreading and a connection, rather than perfectness alone.

(Bhatt–Morrow–Scholze, Theorem 13.19, p.114.)

*Needs:* AInfCohomology §AI.6.5.

### 2.10 Local `B_dR` period comparison map

Use AInfCohomology §AI.6.5’s `AInf.canonical_bdr_etale_map`, with degree-zero coordinates `X_u↦[u♭]`, its normalized logarithmic Koszul operators and compatibility with coordinate/tower refinements. The map is defined on the common all-coordinate tower.

(Bhatt–Morrow–Scholze, Theorem 13.1 proof, p.115; Proposition 12.9.)

*Needs:* AInfCohomology §AI.6.5.

### 2.11 Canonical de Rham period comparison

Use `AInf.canonical_rational_comparison` of AInfCohomology §AI.6.5: for proper smooth `X/C`, the canonical deformation-to-étale map becomes an equivalence after `ξ` inversion, with target `RΓ_ét(X,ℤ_p)⊗^L B_dR`. Its filtered enhancement over `C` is constructed in §4.11.

(Bhatt–Morrow–Scholze, Theorem 13.1 and proof, pp.104,115.)

*Needs:* AInfCohomology §AI.6.5.

### 2.12 Descended de Rham lattice

For proper smooth `X₀/K`, `K` complete discretely valued with perfect residue field, use the descended identification in `AInf.canonical_deformation_free` and map agreement in `AInf.canonical_rational_comparison` of AInfCohomology §AI.6.5. They identify `H^i(K_dR⁺(X₀⊗̂_K C))` with `H_dR^i(X₀/K)⊗_K B_dR⁺` through the unique continuous lift `K→B_dR⁺`.

(Bhatt–Morrow–Scholze, Remark 13.20, p.114; Theorem 13.1 proof, p.115.)

*Needs:* AInfCohomology §AI.6.5.

### 2.13 Filtered de Rham comparison over `K`

For proper smooth `X₀/K` in §2.12, use AInfCohomology §AI.6.5’s descended filtered comparison and `AInf.canonical_rational_comparison`. For arithmetic equivariance take `C=widehat(K̄)`. Its de Rham filtration is the convolution `Fil^r(H_dR⊗B_dR)=Σ_a Fil^a H_dR⊗Fil^{r−a}B_dR`, and the étale side has the period filtration. The supplier includes agreement with the structural-period-sheaf map.

(Bhatt–Morrow–Scholze, Theorem 13.1 proof, p.115; Scholze, p-adic Hodge theory, Theorem 8.4 and its proof, pp.48–49.)

*Needs:* AInfCohomology §AI.6.5.

### 2.14 Hodge–de Rham degeneration

For every proper smooth rigid `X/C` in characteristic zero, prove `E₁^{a,b}=H^b(X,Ω_X^a)⇒H_dR^{a+b}(X/C)` degenerates at `E₁`. If `X` descends to `K`, apply the strict filtered comparison and the finite-dimensional cohomology inputs. In general use the proper smooth family and constancy of relative cohomology ranks to pass from descended fibres to `X`.

In degree `n`, obtain `dim_C H_dR^n(X)=Σ_{a+b=n}dim_C H^b(X,Ω_X^a)`. This is the characteristic-zero rigid theorem; it does not assert degeneration for integral formal cohomology or the positive-characteristic special fibre. The sums are finite and the coherent cohomology groups are finite-dimensional by properness. Keep that finiteness before expressing the conclusion using natural-number dimensions.

(Bhatt–Morrow–Scholze, Theorem 13.3(i) and proof, pp.104,116.)

*Needs:* Layer 2.7 (Spreading out proper smooth rigid spaces); Layer 2.13 (Filtered de Rham comparison over `K`); AdicSpacesPartIII §§R3.6–R3.7.

### 2.15 Hodge–Tate degeneration

For proper smooth `X/C`, prove degeneration at `E₂` of `E₂^{a,b}=H^a(X,Ω_X^b)(−b)⇒H_ét^{a+b}(X,ℚ_p)⊗C`. The sign of the Tate twist is `−b` in the Hodge–Tate convention fixed above. Derive the dimension equality from the canonical finite-free `B_dR⁺` lattice and Hodge–de Rham degeneration, using the proper primitive finiteness theorem to identify the étale rank.

A degree-two class on `P¹` has `b=1` and twist `(−1)`; this is the basic sign check. Degeneration supplies a filtration with these associated graded pieces. It does not supply a canonical splitting in every descended family. Preserve the spectral-sequence indexing independently of the `E₁` indexing of the preceding de Rham sequence.

(Bhatt–Morrow–Scholze, Theorem 13.3(ii) and proof, pp.105,116.)

*Needs:* Layer 2.14 (Hodge–de Rham degeneration); Layer 2.9 (Finite freeness of `B_dR⁺` cohomology); Layer 2.11 (Canonical de Rham period comparison); PadicHodgeTheory §§2.1–2.7.

### 2.16 The canonical `B_dR⁺` lattice in good reduction

For proper smooth formal `𝔛/O_C`, generic fibre `X_C` and `Y=𝔛_{O_C/p}`, use `AInf.integral_deformation_agreement` of AInfCohomology §AI.6.5: `RΓ_crys(Y/A_cris)⊗^L_{A_cris}B_dR⁺≃K_dR⁺(X_C)`. Its degreewise lattice form uses the supplied rational crystalline-freeness bridge.

(Bhatt–Morrow–Scholze, Proposition 13.23, p.117.)

*Needs:* AInfCohomology §AI.6.5.

### 2.17 Agreement of integral and rational period maps

Use `AInf.integral_deformation_agreement` and `AInf.canonical_rational_comparison` of AInfCohomology §AI.6.5 for equality of the integral-derived and rational period maps after `B_dR` extension, including the descended structural-period-sheaf comparison. The equality uses their common Teichmüller coordinates, logarithmic Koszul corrections, refinements and descent.

(Bhatt–Morrow–Scholze, Theorem 14.5(i) proof, p.121; Theorem 13.1 proof, p.115.)

*Needs:* AInfCohomology §AI.6.5.

### 2.18 Relative `B_dR⁺` infinitesimal site

Use the Frobenius-twisted period diagram throughout §§2.18–2.24 and §6.3. Write `B_dR,GR⁺=(A_inf[1/p])^∧_(ξ̃)`, augmented by `θ̃`; write `A_cris,GR` for the p-completed PD envelope of `(ξ̃)⊂A_inf` and use its compatible map to `B_dR,GR⁺` and the compatible `θ̃_K`-augmented map from `A_inf,K`. Construct the filtered isomorphism `F_GR:B_dR,GR⁺≃B_dR⁺` induced by `φ⁻¹`. It sends `ξ̃` to `ξ` and the GR element `t=log[ε]` to `t/p`. Transport the crystalline-envelope map, every coefficient map and twist, the `W(k)` scalar structure and the fixed `O_K` lift along `F_GR` before comparing with §0.1. In particular the scalar square has top `W(k)→B_dR,GR⁺`, bottom the transported `W(k)→B_dR⁺`, left the identity and right `F_GR`; if both Witt arrows are written using the same canonical inclusion, the left arrow is instead `F_W⁻¹`. The analogous `O_K` square uses its fixed lift on top and its transported lift on the bottom. All relative-site notation below uses this GR diagram; §2.23 applies `F_GR` to identify it with the canonical absolute diagram.

Fix a complete discretely valued `K/ℚ_p` with perfect residue field `k₀`, put `A_inf,K=A_inf⊗_{W(k₀)}O_K` using the GR scalar inclusion `W(k₀)→A_inf`, namely `φ∘j` for the canonical inclusion `j`, so `θ̃_K(a⊗b)=θ̃(a)b` is balanced, and fix a map `O_K→B_dR,GR⁺` lifting `K→C`. Write `B_dR,GR,e⁺=B_dR,GR⁺/(ξ̃)^e`. For a smooth morphism `f:X→Y` of smooth formal `O_K`-schemes let `Y_{B_dR,GR⁺,e}` be the completed base change of `Y` along `O_K→A_inf,K→B_dR,GR,e⁺`; for an affine open `Spf R` of `Y` it is the affinoid adic space of `((R⊗_{O_K}A_inf,K)^∧_p[1/p])⊗_{A_inf,K}B_dR,GR,e⁺`.

Define `RelativeInfinitesimalSite X/Y_{B_dR,GR⁺,inf}` with this intended signature.

```text
object       (U, T, e, i):  U ⊆ X_C open;  T an adic space topologically of finite type over Y_{B_dR,GR⁺,e}
                            for some e ≥ 1;  i : U → T a Zariski closed immersion cut out by a nilpotent ideal
morphism     (U₁,T₁) → (U₂,T₂):  an open immersion U₁ → U₂ and a map T₁ → T₂ over Y_{B_dR,GR⁺,e} (e ≫ 0)
                            commuting with the closed immersions
cover        {(Uᵢ,Tᵢ) → `(U,T)`} with {Uᵢ → U} and {Tᵢ → T} analytic coverings
structureSheaf   O_inf`(U,T)` = O_T(T)
crystal      a vector bundle (or perfect complex) F_T on each T with base-change isomorphisms along morphisms
```

Thickenings over different finite levels `e` are compared by enlarging `e`. An ind-system `{(U_j,T_j)}` of objects is weakly final when the colimit of the sheaves it represents surjects onto the final object of the topos; it need not map uniquely, or at all globally, to a given thickening.

The API is as follows. `RelativeInfinitesimalSite.object` and `morphism` carry the data above, with identity and composition. `structureSheaf` is `O_inf` with its restriction maps. `baseChange` pulls back thickenings and crystals along a base change `Y′→Y` of smooth formal `O_K`-schemes compatible with the fixed `O_K→B_dR,GR⁺`. `envelope`: let `Z` be a smooth adic space over `Y_K` with a closed immersion `X_C→Z_C`, and let `Z_{m,e}` be the `m`-th infinitesimal neighbourhood of `X_C` in `Z_{B_dR,GR⁺,e}`; then the ind-system `D_Z(X)={Z_{m,e}}_{m,e}` is weakly final. `envelope_selfProduct`: for `n≥0`, the `(n+1)`-fold self-product of `{Z_{m,e}}_{m,e}` in the topos is represented by the ind-system `{Z^n_{m,e}}_{m,e}`, where `Z^n` is the `(n+1)`-fold fibre product of `Z` over `Y_K` and `Z^n_{m,e}` is the `m`-th infinitesimal neighbourhood of the diagonal copy of `X_C` in `Z^n_{B_dR,GR⁺,e}`. `envelope_cech`: the projections and diagonals of the `Z^n` make `[n]↦{Z^n_{m,e}}` the Čech nerve of `D_Z(X)`, compatibly with the identifications of `envelope_selfProduct`; this cosimplicial ind-object is what Layer 2.19 evaluates. `envelope_framing`: when `Y=Spf R`, `X=Spf R′` is smooth over `Y` and `Σ⊂R′^×` is an enlarged framing (`R⟨x_u^{±1}:u∈Σ⟩→R′` surjective, with `d` of the `u` giving an étale map to the relative torus), and `Z` is the generic fibre of `Spf R⟨x_u^{±1}⟩`, the value of `O_inf` on `D_Z(X)` is the completion `D_Σ(R′)` of `R⟨x_u^{±1}⟩_{B_dR,GR⁺}→R′_C`, and its value on the `n`-th self-product is the completion `D_{Σ^n}(R′)` of `(R⟨x_u^{±1}⟩^{⊗̂ n+1})_{B_dR,GR⁺}→R′_C` along the diagonal.

Proof of `envelope`: restrict to thickenings over a fixed `Y_{B_dR,GR⁺,e}`; for such `(U,T)`, smoothness of `Z_{B_dR,GR⁺,e}` over `Y_{B_dR,GR⁺,e}` gives, analytically locally on `T`, a map `T→Z_{B_dR,GR⁺,e}` restricting to `U→X_C→Z_C`, and nilpotence of the ideal of `U` in `T` makes it factor through some `Z_{m,e}`. Proof of `envelope_selfProduct`: `n+1` such maps from `T` compatible with `U` are the same as one map from `(U,T)` to an infinitesimal neighbourhood of `U` in `Z^n_{B_dR,GR⁺,e}`; take the union over `m`. Weak finality is the property used by Čech descent; no uniqueness of the local maps `T→Z_{m,e}` is asserted.

**Checks.**

- The coefficient transport sends `ξ̃` to `ξ` and `t` to `t/p`; using §0.1’s canonical arrow before transport would send `ξ̃` to an element with `θ`-value `p`, a unit after p-inversion, so cannot define this completion.
- On canonical Witt elements `F_GR(j(w))=j(F_W⁻¹(w))`; on the GR scalar inclusion `φ∘j` this gives `F_GR(φ(j(w)))=j(w)`, including when Frobenius on `k₀` is nontrivial.
- Over the point, the structure-sheaf cohomology of `Spa C` is `B_dR,GR⁺` in degree zero.
- For an identity relative smooth morphism the relative de Rham complex of sheaves has only degree zero and agrees with its Čech-envelope calculation as a sheaf complex; derived global sections may have higher cohomology.
- A nilpotent thickening without a map to the specified finite-level `Y` base is not a relative object, even when it is an absolute `B_dR,GR⁺` thickening.
- For `X=Y`, `f` the identity and `Z=Y_K`, every self-product `Z^n` over `Y_K` is `Y_K` itself, so each `Z^n_{m,e}` with `m≥e` is `Y_{B_dR,GR⁺,e}` (Guo–Reinecke, Example 10.5(1)). The constant nerve resolves the structure sheaf in degree zero; its derived global sections retain the coherent cohomology of `Y_{B_dR,GR⁺,e}`. Forming the self-products over `Spa K` instead gives diagonal neighbourhoods in `Y_K^{n+1}` and introduces relative differentials of `Y`.
- For an enlarged framing consisting of the `d` torus coordinates and one redundant unit `u`, `D_Σ(R′)` is `R′_{B_dR,GR⁺}[[x_u−u]]`, with `u` read in `R′_{B_dR,GR⁺}`: the torus coordinates lift by étaleness and contribute no variable, as in Bhatt–Morrow–Scholze Lemma 13.12, and the redundant unit contributes one formal disc. A normal form with one variable for every element of `Σ` has relative dimension `d+|Σ|` instead of `|Σ|` and fails. Completing only along the GR period ideal `(ξ̃)`, rather than along the whole embedding kernel, also gives a different ring.

(Guo–Reinecke, §1.4, pp.10–11, for the period diagram and PD envelope; §10.1, p.93, for the `θ̃_K`-augmented coefficients; Definition 10.1 and Remark 10.2, p.94; Lemma 10.3 and proof, p.94; Convention 10.4 and Example 10.5, p.95; Construction 10.6(1), p.95.)

*Needs:* AdicSpacesPartII R0; AdicEtaleGeometry `A1`; CrystallineCohomology `CR.1`; CrystallineCohomology §CR.1.2; Layer 2.2 (Presented infinitesimal envelope).

### 2.19 Relative Čech–de Rham comparison

In the smooth formal affine setup of GR Convention 10.4, for a vector-bundle crystal `F` and a smooth affinoid ambient embedding `X_C→Z_C` over `Y_C`, prove the Čech–Alexander complex of the weakly final envelope computes `RΓ_inf(X/Y_{B_dR,GR⁺},F)`: evaluate `F` on the Čech nerve `[n]↦{Z^n_{m,e}}` of `RelativeInfinitesimalSite.envelope_cech` and take the limits over `m,e` and the cosimplicial index as in Construction 10.6. The affinoid neighbourhoods have no higher vector-bundle cohomology, giving the ordinary evaluations used in this calculation. Compare with the completed relative de Rham complex on the envelope. Its connection is supplied by the crystal's cartesian descent; the maps are natural in `F` and the embedding.

In the formal affine smooth setup, use the canonical lift and an enlarged Laurent framing to construct the particular equivalences in GR Corollary 10.8. The ambient envelope has an ind-system of nilpotent neighbourhoods; treating it as a single final object would give an incorrect proof. Retain the completion topology on the relative differentials when identifying the two complexes.

For general smooth `X,Y` and ambient `Z`, apply this calculation on compatible affine opens and their refinements, and use derived covering descent to obtain the global equivalence of Corollary 10.8. The de Rham side is global hypercohomology. Ordinary global sections on a nonaffinoid envelope do not replace that descent.

**Checks.**

- For the identity of a smooth affinoid and the structure crystal, the relative complex is the coefficient ring in degree zero.
- At `p=5`, for the formal elliptic curve `y²z=x³−xz²` and its identity morphism, the constant envelope nerve has structure sheaf in degree zero, but `H¹(Y_{B_dR,GR⁺,e},O)` is free of rank one over `B_dR,GR⁺/(ξ̃^e)`.
- Restricting a framed affine to a rational affinoid and then refining the framing gives the same comparison as refining first and restricting; these are the descent maps in the global formula.

(Guo–Reinecke, Construction 10.6 and Theorem 10.7, pp.95–96; Corollary 10.8, p.97.)

*Needs:* Layer 2.18 (Relative `B_dR⁺` infinitesimal site); Layer 2.2 (Presented infinitesimal envelope); CrystallineCohomology `CR.2`; EnhancedDerivedSheaves `E4`; CrystallineCohomology §CR.2.2; CrystallineCohomology §CR.2.3.

### 2.20 Relative infinitesimal perfectness

If `f:X→Y` is proper smooth between smooth formal `O_K`-schemes, `Y=Spf R` and `F` is a vector-bundle crystal on the relative infinitesimal site, prove `RΓ_inf(X/Y_{B_dR,GR⁺},F)` is perfect over `R_{B_dR,GR⁺}`. Identify its derived `I`-reduction with relative de Rham cohomology of the associated vector bundle with flat connection on `X_C/Y_C`.

The theorem supplies perfectness and derived base change. It does not imply that all higher direct images are free over an arbitrary base. For a proper smooth connected genus-`g` curve over a point and the trivial rank-one crystal, the fibre ranks are `1,2g,1` in degrees `0,1,2`. An arbitrary vector-bundle crystal need not have those ranks. That distinction separates the general perfectness statement from the worked curve calculation.

(Guo–Reinecke, Corollaries 10.8–10.9, p.97.)

*Needs:* Layer 2.19 (Relative Čech–de Rham comparison); EnhancedDerivedSheaves `E4`; AdicSpacesPartIII §§R3.6–R3.7.

### 2.21 Crystalline-to-infinitesimal coefficient functor

Construct the coefficient functor `D_perf(X_{p=0,crys})→D_perf(X/Y_{B_dR,GR⁺,inf})` and show it sends vector-bundle crystals to vector-bundle crystals. On a chosen enlarged framing, its value is `E′(D_pd,Σ^n)⊗^L_{D_pd,Σ^n}D_Σ^n`. Define the ring map by first inverting `p` and then completing along the full embedding ideal.

Prove compatibility of these local extensions with the crystal transition isomorphisms and with self-products of the embedding. They are the descent data needed to globalize the functor. The PD envelope and the infinitesimal envelope are different rings with different completions; one cannot replace the coefficient functor by an unnamed identification of their module categories.

(Guo–Reinecke, Proposition 10.10 and proof, pp.97–98.)

*Needs:* PadicPeriodRings §3; DerivedDeRhamCohomology PD; Layer 2.19 (Relative Čech–de Rham comparison); CrystallineCohomology §CR.1.2.

### 2.22 Relative crystalline–infinitesimal base change

For the smooth relative affine setup of GR Convention 10.4 and a vector-bundle crystalline crystal `E′`, compare its crystalline cohomology over `R`, its crystalline cohomology over `R_Acrys`, and the infinitesimal cohomology of the resulting `F` over `R_B_dR,GR⁺`. Each identification uses the specified completed `B_dR,GR⁺` scalar extension. Construct the comparison from the preceding coefficient functor on the same Čech envelopes. Extend it, by exactness, finite cones, retracts and descent, to the perfect crystalline complexes arising from §2.24; use derived tensor products and the same completions throughout, without assuming their cohomology sheaves are vector bundles.

Check the induced connections agree: the infinitesimal connection is the `ker θ̃_K`-completion of `∇_crys[1/p]`. State the three arrows and the scalar maps of equation (36), rather than an uncompleted base-change equality. Compatibility with the connection is required for the later section-independent structural `OB_dR` comparison and its Hodge filtration.

(Guo–Reinecke, Proposition 10.11, pp.98–99, equation (36).)

*Needs:* Layer 2.21 (Crystalline-to-infinitesimal coefficient functor); Layer 2.19 (Relative Čech–de Rham comparison); CrystallineCohomology `CR.3`; EnhancedDerivedSheaves `E4`; CrystallineCohomology §CR.3.2; Layer 2.24’s perfect-complex extension and crystalline realization for the perfect-coefficient extension.

### 2.23 Absolute and relative infinitesimal agreement

For smooth `X/C` over the point, prove the infinitesimal cohomology defined by completed thickenings agrees with the canonical BMS envelope cohomology. After transport by `F_GR` of §2.18, the relative construction specializes to the absolute one on the transported embedding ideals and coefficient maps. Compare the Čech–de Rham computations and their refinement maps to obtain a natural equivalence, not only a comparison after `ξ` inversion.

The smooth statement is the input here. Guo's proper singular comparison additionally uses éh descent and the derived de Rham construction; those are required in the separate singular coefficient interface of the suppliers. A smooth-envelope calculation alone proves no singular extension. Over the point the relative construction gives `B_dR,GR⁺` and the canonical construction gives `B_dR⁺`, both in degree zero; the equivalence on coefficients is `F_GR`.

(Guo, Theorem 1.2.7 and Corollary 1.2.11, pp.5–6; Guo, Definition 2.2.1, Remarks 2.2.2–2.2.4, pp.12–13; Lemma 4.1.10, p.31.)

*Needs:* Layer 2.8 (Canonical `B_dR⁺` cohomology); Layer 2.19 (Relative Čech–de Rham comparison).

### 2.24 Relative analytic prismatic F-crystals

For a smooth p-adic formal `O_K`-scheme `Y`, construct `AnalyticPrismaticFCrystal Y` on its absolute bounded-prism site: on a prism `(A,I)` over `Y` its value is a finite locally free sheaf on `Spec A` minus `V(p,I)`, with cartesian transition isomorphisms and a Frobenius isomorphism after inverting `I`. Require the analytic extension and descent conditions of Guo–Reinecke §3; an arbitrary module over `A[1/I]` is not such an object. Morphisms commute with Frobenius and the transition maps. The coefficient ring and bounded-prism site come from PrismaticCohomology Layers 0–2; the analytic vector bundles and their descent are constructed here.

Construct `PerfectPrismaticFCrystal Y`, the category `D^φ_perf(Y_Δ)` of cartesian perfect complexes with Frobenius invertible after inverting the prism ideal, and the fully faithful functor `analyticToPerfect : AnalyticPrismaticFCrystal Y→PerfectPrismaticFCrystal Y` induced by pushforward from the punctured prism spectra (GR Theorem 5.10, pp.51–53). Construct it on a noetherian regular Breuil–Kisin prism and its faithfully flat Čech nerve, then descend, proving compatibility with pullback between smooth formal `O_K`-schemes. A section module on an arbitrary punctured prism is not assumed finite projective. Construct `perfectCrystallineRealization` by restriction to `Y_{p=0,Δ}` and GR Theorem 6.4’s equivalence with perfect crystalline coefficients, with its Frobenius-equivariant coefficient comparison. Construct `perfectRelativeCohomology` for proper smooth morphisms, its perfectness, Frobenius and base-change maps, including the rational crystalline evaluation of Corollary 6.14. Use `analyticToPerfect E` whenever writing `RΓ_Δ(-,E)` or invoking Theorem 9.15; §2.22’s extended coefficient base change applies to its crystalline realization.

Build the integral étale realization `T` on `Y_K` and the F-isocrystal realization `E′` on `Y_{p=0}`. Prove the equivalence between analytic prismatic F-crystals and crystalline `ℤ_p`-local systems in Guo–Reinecke Theorem A, p.3, and §§3–4, with tensor, dual, pullback and coefficient-extension compatibility. For proper smooth `f:X→Y` between smooth formal `O_K`-schemes, prove the relative étale–crystalline comparison with these coefficients over every perfectoid prism over `Y`, retaining the completed tensor and Frobenius structures of Theorem 9.15. This is the input to §6.3; the filtered infinitesimal comparison and its connection are proved there.

The API includes both categories, `analyticToPerfect`, `perfectCrystallineRealization`, `perfectRelativeCohomology`, their pullback and descent compatibilities, and the analytic category’s tensor unit, duals and pullbacks; both realization functors and their descent maps; full faithfulness and essential surjectivity in the crystalline-local-system range; and the natural relative comparison, compatible with composition of base changes. No claim identifies every lisse sheaf with a crystalline one.

**Checks.**

- The tensor unit gives the constant `ℤ_p`-local system and the trivial rank-one F-isocrystal; for the identity map its relative comparison is the identity.
- At `Y=Spf O_K` the realization recovers the crystalline lattice functor of Guo–Reinecke Theorem 1.2, p.2, with the same period maps; merely giving this point case does not specify a family.
- On a regular noetherian Breuil–Kisin chart with puncture inclusion `j`, the extension evaluates as the perfect module `j_*E`; pulling it to each term of the faithfully flat Čech nerve gives the extension there.
- For two composable pullbacks of smooth formal schemes, the two extensions and crystalline realizations agree with the composite; the unit extends to the structure sheaf.
- For the identity proper smooth morphism, `perfectRelativeCohomology` returns the coefficient complex; a shifted unit or finite cone retains its shift or cone under the crystalline comparison and §2.22 base change.
- The Kummer extension from a Tate curve with nonzero monodromy is semistable and noncrystalline, so it does not lie in the essential image.
- Pullback through two maps `Y″→Y′→Y` agrees with their composite on both realizations; it retains the chosen perfectoid scalar map.

Sources: Guo–Reinecke, §§3–4 (analytic prismatic F-crystals and realizations), Theorem A, p.3, Theorem 5.10, pp.51–53, Theorem 6.4, pp.56–58, Corollary 6.14, p.61, and Theorem 9.15, p.92; the application to the filtered map is Theorem 10.13 and Remark 10.14, pp.99–100.

*Needs:* PrismaticCohomology §§1.1–1.10, 2.28–2.30; AdicSpacesPartII R0; AlgebraicVectorBundles L0B–L0C; CrystallineCohomology §§CR.1.2–CR.1.3, CR.3 proper base change; the vector-bundle coefficient functor of Layer 2.21; DerivedModuleAlgebra §§1.1–1.9 for perfect-complex descent; PadicHodgeTheory §§2.1–2.7, 7.1–7.3; EnhancedDerivedSheaves E2/E4.

### Examples

For `e:ℚ[X]→Q`, `X↦0`, the envelope is the `(X)`-adic completion: `X` mod `X²` is nonzero but `X` mod `X` is zero. This detects the full embedding ideal. On `P¹_C` the canonical `B_dR⁺` groups are rank one in degrees zero and two and zero in degree one. Adding a redundant unit to a torus presentation changes its envelope model but not its de Rham cohomology. In a relative thickening the map to the specified base is indispensable.

### Dependencies

Layer 0 and the integral maps of Layer 1 for good-reduction agreement; AdicSpacesPartII R0 and AdicSpacesPartIII R2/R3 and AlgebraicModuliForArithmeticGeometry §§6.1, 7.8, 8.2 for the local and proper approximation; PadicHodgeTheory §§2.1–2.7 and PadicPeriodRings §§1.5, 4.1–4.3 for periods; EnhancedDerivedSheaves E2/E4 for completion, descent and filtrations; CrystallineCohomology CR.1–CR.3 for coefficients; the local relative analytic F-crystal construction in §2.24, with the full GR Theorem 9.15 range.

## Layer 3: Rational crystalline comparison and nearby cycles

### 3.1 Residue-section descent adapter

Apply the rational crystalline base-change theorem to relate the `O_C/p` object to the `W(k)` object. Given the appropriate section of the residue map, construct `H_crys^i(Y/A_cris)[1/p]≃H_crys^i(𝔛_k/W(k))⊗A_cris[1/p]` and compose it with the rational period comparison. For a descended `O_K`-model, use the arithmetic Witt lift `W(k₀)→O_K` and a sufficiently small nilpotent reduction to normalize its residue-section descent.

Show exactly where the arithmetic coefficients `W(k₀)` are extended to the geometric `W(k)` and where Frobenius acts on them. Here `𝔛_k=𝔛₀,k₀×_{k₀}k` for a descended model. The original section must remain visible for a general `O_C`-model. Any section-independence statement is restricted to the source's hypotheses, and all these maps are rational; no integral invariance under arbitrary sections is claimed. The affine Frobenius-isogeny/base-change proof is part of the required crystalline supplier contract.

(Bhatt–Morrow–Scholze, Proposition 13.21 and Remark 13.22, p.116; Theorem 14.6 proof, p.122.)

*Needs:* CrystallineCohomology `CR.3`; CrystallineCohomology §CR.3:Frobenius-isogeny.1; Layer 0.1 (Normalized specialization diagram).

### 3.2 From derived to rational cohomology

Prove the cohomology-level passage used above for the proper perfect `K_A` whose `H^j[1/p]` are free. Localization `A_cris→B_cris` at `μ` is flat, and `B_cris` is `ℤ_p`-flat. Identify the natural maps from the ordinary scalar extensions of `H^i` to `H^i` of the corresponding derived scalar extensions, using the rational `A_inf` finiteness in the remaining passage.

Track these maps in the comparison diagram rather than replacing them by chosen inverses of unrelated group isomorphisms. The argument concerns rational period coefficients. It proves no integral formula `H^i(K_A⊗^L W(k))=H^i(K_A)⊗W(k)`. In the latter calculation the next-degree Tor term is the precise obstruction addressed by the adjacent-degree freeness hypotheses of Layer 5.

(Bhatt–Morrow–Scholze, Theorems 14.3–14.5, pp.119–121; §1.2, p.6.)

*Needs:* AInfCohomology `AI.5`; Layer 1.1 (Proper smooth `A_inf` input package); Layer 1.5 (Integral `A_cris` specialization); Mathlib `DerivedCategory`; Mathlib `TensorProduct`.

### 3.3 Rational crystalline comparison over `O_C`

For proper smooth formal `𝔛/O_C`, compare `H_crys^i(𝔛_{O_C/p}/A_cris)⊗_{A_cris}B_cris` with `H_ét^i(X_C,ℤ_p)⊗_{ℤ_p}B_cris`, for every `i≥0`. Construct the isomorphism by extending the `A_cris` and `μ-inverted A_inf` maps, using `B_cris=A_cris[1/μ]`. The rational freeness theorem for the geometric `A_inf` complex justifies passage from the derived maps to these degreewise tensors.

After extending to `B_dR`, prove the comparison agrees with the canonical `K_dR⁺` lattice comparison under the good-reduction identification. The compatibility includes the actual local morphisms of Layer 2. Over `O_C` alone this theorem is not a statement about a `G_K` representation until descent data are supplied. It retains the `O_C/p` crystalline object rather than substituting residue-field cohomology by an unrecorded section.

(Bhatt–Morrow–Scholze, Theorem 14.5(i), pp.120–121.)

*Needs:* Layer 1.5 (Integral `A_cris` specialization); Layer 1.6 (Étale specialization after `μ` inversion); Layer 2.16 (The canonical `B_dR⁺` lattice in good reduction); CrystallineCohomology `CR.3`; Mathlib `TensorProduct`.

### 3.4 Crystalline comparison over a discretely valued base

For proper smooth formal `𝔛₀/O_K` with `K` complete discretely valued over `ℚ_p` and perfect residue `k₀`, obtain

```text
H_ét^i(X_C,ℤ_p) ⊗ B_cris ≃ H_crys^i(𝔛₀,k₀/W(k₀)) ⊗ B_cris.
```

Prove `G_K` equivariance and Frobenius compatibility, and prove the induced `B_dR` map preserves the convolution Hodge filtration. Use the preceding `O_C` theorem, the canonical residue-section descent, and the equality of de Rham comparison maps from Layer 2. These ingredients yield that `H_ét^i(X_C,ℚ_p)` is crystalline. Proper smooth formal is the full geometric hypothesis; no algebraic projective model is required. The filtration is read only after the specified embedding into `B_dR`.

**Agreement with the finite-base maps** (`finiteBaseComparisonAgreement`). PadicHodgeTheory §8.1 owns the rational constant-coefficient crystalline, semistable and de Rham maps and their period-module identifications for finite `K/ℚ_p`. In that range use its maps in §§3.4–3.5 and 4.3–4.4. Prove that the degreewise maps of the derived comparisons here equal those supplied maps, with the direction inverted where necessary. The crystalline part is the agreement in §§3.4–3.5; §§4.3–4.4 give its semistable part. For arbitrary perfect `k₀` the constructions in those sections give their extension. Equality follows from the common integral period maps, residue-section bridge and structural-period-sheaf de Rham comparison; derived enhancements retain these underlying maps.

**Checks.**

- For `K=ℚ_p` and a point, the two crystalline maps are the identity on `B_cris`, with arithmetic realization `ℚ_p`.
- For `P¹` over any finite `K`, the degree-two maps agree on the normalized Tate line; a scalar different from 1 cannot be absorbed by equality of ranks.
- For a split Tate curve over a ramified finite `K`, the semistable maps use the same normalized `N_raw/e` and agree after the chosen `B_st→B_dR` extension.

(Bhatt–Morrow–Scholze, Theorem 14.6(i), pp.121–122; Česnavičius–Koshikawa, Proposition 6.8 and Theorem 9.5, pp.66–68,76; PadicHodgeTheory §8.1.)

*Needs:* Layer 3.3 (Rational crystalline comparison over `O_C`); Layer 3.1 (Residue-section descent adapter); Layer 2.12 (Descended de Rham lattice); Layer 2.13 (Filtered de Rham comparison over `K`); PadicHodgeTheory §§3.1–3.5, 8.1.

### 3.5 Crystalline representation export

For the proper smooth good-reduction representation `V=H_ét^i(X_C,ℚ_p)`, take `G_K` invariants of the `B_cris` comparison to identify `D_cris(V)` with `H_crys^i(𝔛₀,k₀/W(k₀))[1/p]` as a `φ`-module. The dimension criterion follows from `B_cris^{G_K}=K₀`, where `K₀=W(k₀)[1/p]`, and the period functor's admissibility theory. After `K₀→K`, the filtered realization is `H_dR^i(X_K/K)`. For finite `K/ℚ_p`, this is the supplied PadicHodgeTheory §8.1 identification through `finiteBaseComparisonAgreement`.

Use the rational period functors and their fully specified coefficient embeddings supplied by p-adic Hodge theory. This target connects geometric cohomology with those functors; it does not rebuild them. In particular the perfect residue-field hypothesis controls `K₀` and the canonical `K`-lift. A representation merely known to be de Rham is not covered by the good-reduction crystalline conclusion.

(Bhatt–Morrow–Scholze, Theorem 14.6(i), p.121.)

*Needs:* Layer 3.4 (Crystalline comparison over a discretely valued base); PadicPeriodRings §§1.5, 3, 4.1–4.3; PadicHodgeTheory §§3.1–3.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.1–R07.3.3.

### 3.6 Good reduction examples

Transport the supplied crystalline calculation for an ordinary good-reduction elliptic curve: its degree-one Newton slopes are `0` and `1`. For a supersingular curve the two slopes are `1/2`. In both cases the Hodge numbers in degree one are `1,1`. Identify these `φ`-modules with `D_cris` of the actual étale representation via the comparison, retaining the Hodge filtration on the `K`-realization.

These examples distinguish the crystalline slope data from the Hodge filtration. The proper smooth formal theorem also covers a model whose generic fibre is nonprojective whenever such a model is given. No existence theorem for a particular nonprojective example is inferred from the comparison itself. This application records the absence of projectivity from its hypotheses while keeping the supplied geometric computation separate.

(Bhatt–Morrow–Scholze, Theorem 14.6, p.121.)

*Needs:* Layer 3.5 (Crystalline representation export); CrystallineCohomology `CR.3`.

### 3.7 Graded Beilinson square

For a p-torsion-free quasisyntomic `ℤ_p`-algebra `R` and `i≥0`, use PrismaticCohomologyPartIII §7.0’s natural map `χ_i:ℚ_p(i)(R/p)→(LΩ_R)_Qp` and its supplied homotopy-cartesian square

```text
ℚ_p(i)(R)   ─────────→  ℚ_p(i)(R/p)
   │                        │ χ_i
   ▼                        ▼
(LΩ_R^{≥i})_Qp ───────→ (LΩ_R)_Qp
```

in the derived `∞`-category `D(ℚ_p)`. Here `ℚ_p(i)` is the supplied p-adic syntomic complex, `LΩ` is the p-completed derived de Rham complex with its Hodge filtration, and the lower arrow is the Hodge-filtration inclusion. The intended signature is the following, with all four corners functors on the relative site `qSyn_{ℤ_p}` of p-completely flat quasisyntomic `ℤ_p`-algebras (hence p-torsion-free), and the supplied square in `D(ℚ_p)_{≥0}`-valued sheaves there.

```text
gradedBeilinsonSquare (i : ℕ) : for R ∈ qSyn_{ℤ_p}, natural in R,
  top     red_i  : ℚ_p(i)(R) → ℚ_p(i)(R/p)                 reduction modulo p of syntomic complexes
  left    s_i    : ℚ_p(i)(R) → (LΩ_R^{≥i})_Qp               graded piece of the trace TC → HC⁻
  right   χ_i    : ℚ_p(i)(R/p) → (LΩ_R)_Qp                  supplied by PartIII §7.0
  bottom  ι_i    : (LΩ_R^{≥i})_Qp → (LΩ_R)_Qp               Hodge-filtration inclusion
  h_i            : ι_i ∘ s_i ≃ χ_i ∘ red_i                  a specified homotopy
  integral form  χ_i^int : ℤ_p(i)(R/p) → p^{−N(i)} LΩ_R     with N(i) depending only on i, rationalizing to χ_i
```

The left arrow comes from the trace `TC(R;ℤ_p)→HC⁻(R;ℤ_p)`: for `R` p-torsion-free quasiregular semiperfectoid, `HC⁻` is even with `π_{2i}=L̂Ω_R^{≥i}`, so on graded pieces of the motivic filtrations it gives `ℤ_p(i)(R)→L̂Ω_R^{≥i}`; this unfolds to all `R∈qSyn_{ℤ_p}` and factors through the uncompleted `LΩ_R^{≥i}` because `ℤ_p(i)` is left Kan extended from p-complete polynomial algebras (AMMN Construction 6.16, p.44).

Use PrismaticCohomologyPartIII §7.0 (`Prismatic.Trace.rationalBeilinson`, `Prismatic.Trace.relativeComparison_boundedDenominators`, `Prismatic.Beilinson.chi`, `Prismatic.Beilinson.square`, `Prismatic.Beilinson.cofibre`, `Prismatic.Beilinson.chi_boundedDenominator`) for the rational trace square and graded Beilinson comparison, including the relative cyclic bar theory and denominator bound in each fixed weight. This subsection records that supplied square and its maps. Section 3.8 constructs the nearby-cycle corner identifications and transported homotopy. No bound uniform in all weights is asserted.

The following interface names record the supplied results of PartIII §7.0. `gradedBeilinsonSquare_map`: for a map `R→R′` in `qSyn_{ℤ_p}`, the four corner maps and `h_i` are natural, so the squares for `R` and `R′` form a commutative cube with the induced homotopies. `gradedBeilinsonSquare_zero`: for `i=0` the bottom arrow is the identity of `(LΩ_R)_Qp`, hence `red_0` is an equivalence `ℚ_p(0)(R)≃ℚ_p(0)(R/p)`. `gradedBeilinsonSquare_cartesian`: the square with `h_i` is a pullback, equivalently the induced map from `ℚ_p(i)(R)` to the fibre product is an equivalence, equivalently `cofib(red_i)≃cofib(ι_i)=(LΩ_R/LΩ_R^{≥i})_Qp`. `gradedBeilinsonSquare_integral`: `χ_i` is the rationalization of `χ_i^int`, and the integral diagram commutes. `gradedBeilinsonSquare_local`: for `R` p-torsion-free quasiregular semiperfectoid the square is the shift of `τ_{[2i−1,2i]}` of the rational square `TC(R)→TC(R/p)` over `HC⁻(R)→HP(R)`, after the Hodge completion is removed. The weight-`i` maps are the supplied natural ones determined by the syntomic coefficients of §1.11, the derived de Rham filtration of DerivedDeRhamCohomology §§2.22–2.26, and enhanced filtered completion and rationalization from EnhancedDerivedSheaves E4.

**Checks.**

- At `i=0` the lower filtration inclusion is the identity; the pullback therefore makes the upper reduction map an equivalence.
- Separately from evaluation of the relative square, at the characteristic-p crystalline point `Spec F_p`, Frobenius on `A_crys(F_p)=ℤ_p` is the identity. In weight one the operator `φ−p` is multiplication by `1−p`, a unit, so `ℤ_p(1)(F_p)=0` and its rationalization vanishes; equivalently `1−φ/p` is multiplication by `1−1/p≠0`. For `R=ℤ_p` and `i=1`, where `(LΩ^{≥1}_{ℤ_p})_Qp=0` and `(LΩ_{ℤ_p})_Qp=ℚ_p`, the square then computes `ℚ_p(1)(ℤ_p)≃ℚ_p[−1]`, concentrated in cohomological degree one, in agreement with `H¹` of `ℤ_p(1)(ℤ_p)` being the p-completion of `ℤ_p^×` (Layer 1.11 (Syntomic coefficients and classes)); a right corner that did not vanish at `F_p` in weight one would change this value.
- In the separate characteristic-p weight-zero computation at that point the operator `φ−1` is zero. Its derived fibre is `ℤ_p⊕ℤ_p[−1]`, with a degree-one term, and cannot be replaced by its ordinary kernel alone.

*Needs:* the syntomic construction of §1.11 syntomic complexes; DerivedDeRhamCohomology §§2.22–2.26 p-completed derived de Rham complexes; EnhancedDerivedSheaves E4 stable enhancements, rationalization and enhanced fibres, and DerivedDeRhamCohomology Layer 1 derived completion. AInfCohomology §AI.7.2 supplies the spectral trace, circle/Tate and cyclotomic inputs. PrismaticCohomologyPartIII §7.0 supplies the rational square, uniform denominator refinement, two-degree graded comparison, `χ_i` and its cartesian property, in the p-torsion-free range above (AMMN Definition 5.5, p.26; Construction 6.16 and Theorem 6.17, pp.44–45).

### 3.8 Nearby-cycle crystalline–de Rham pullback

Let `𝔛₀/O_K` be smooth proper, with the standing perfect-residue mixed-characteristic DVR assumptions. Write `𝔛` for its completed `O_C` base change, `X₀` for the rigid generic fibre and `𝔛̄₀` for reduction modulo the uniformizer `π`. For every `i≥0`, construct the homotopy-cartesian square in `D(ℚ_p)` with corners

```text
RΓ(𝔛_proét, τ≤i Rψ_*ℚ_p(i)) → (A_cris ⊗^L_{W(k)} RΓ_crys(𝔛̄₀/W(k)))^{φ=p^i}[1/p]
                ↓                                      ↓
Fil≥i(RΓ_dR(X₀/K) ⊗^L_K B_dR⁺) → RΓ_dR(X₀/K) ⊗^L_K B_dR⁺.
```

The bottom arrow is the filtration inclusion. Define the upper-right eigenspace as the derived fibre of `φ−p^i` on the underlying integral complex, followed by p-inversion. The upper-left truncation is taken on the nearby-cycle sheaf before derived global sections. Use the finite Hodge filtration convolved with the `ξ`-adic period filtration on the lower row.

Apply `gradedBeilinsonSquare` of Layer 3.7 to the p-adic formal scheme `𝔛` (by descent from affine opens), and identify its four corners one at a time; each identification is a separate input. Upper left: the p-adic nearby-cycle sheaf `Rψ_*ℤ_p(i)` on `𝔛_proét` is defined by pro-étale cohomology of `A[1/p]` on affine pro-étale opens `Spf A` (AMMN Definition 7.10, p.52), and for formally smooth `O_C`-algebras `ℤ_p(i)≃τ^{≤i}Rψ_*ℤ_p(i)` as sheaves (AMMN Theorem 7.11, p.52, from Bhatt–Morrow–Scholze); this identification is Layer 1.11 (Syntomic coefficients and classes) and is consumed, not reproved. Upper right: `ℚ_p(i)(𝔛/p)→ℚ_p(i)(𝔛/π)` is an equivalence because Frobenius acts on `ℤ_p(i)` of an `F_p`-algebra by `p^i` (AMMN Lemma 6.19, p.45); then `𝔛⊗O_C/π≃𝔛̄₀⊗_k O_C/π`, the Künneth formula for derived de Rham–Witt cohomology gives `LWΩ_{𝔛/π}≃LWΩ_{𝔛̄₀}⊗_{W(k)}A_crys`, and the description `ℤ_p(i)(S)≃ker(φ−p^i on A_crys(S))` for quasiregular semiperfect `S`, `i>0`, with the homotopy fibre of `φ−1` at `i=0` (AMMN Example 6.13, equation (54), p.43), identifies the corner with the derived Frobenius eigenspace. Lower row: the Hodge-filtered `LΩ_{𝔛/O_K}` satisfies the Künneth formula `LΩ_{𝔛/O_K}≃LΩ_{𝔛₀/O_K}⊗_{O_K}LΩ_{O_C/O_K}`, the Hodge filtration of `LΩ_{𝔛₀/O_K}` is finite by perfect `O_K`-modules, and the rationalized Hodge completion of `LΩ_{O_C/O_K}` is `B_dR⁺` with its `ξ`-adic filtration (AMMN Construction 7.12 and the proof of Theorem 7.13, pp.53–54). Transport the commutativity homotopy `h_i` along these explicit corner identifications. In the triangulated shadow, the maps are `TL→TR⊕BL` with components (top,left), and `TR⊕BL→BR` with components `(right,−bottom)`; their composite is zero and they extend to a distinguished triangle. Establishing equality with an independently normalized classical Fontaine map is a further map-agreement assertion, not a consequence of the homotopy pullback theorem. At `i=0` the statement still uses derived fixed points and sheaf truncation, with no positive-twist shortcut.

(Antieau–Mathew–Morrow–Nikolaus, Definition 7.10 and Theorem 7.11, p.52; Construction 7.12, Theorem 7.13 and proof, pp.53–54; Theorem 6.17, pp.44–45; Example 6.13, p.43; Lemma 6.19, p.45.)

*Needs:* Layer 0.1 (Normalized specialization diagram); Layer 3.7 (Graded Beilinson square); Layer 1.11 (Syntomic coefficients and classes); DerivedDeRhamCohomology §2.26; CrystallineCohomology §CR.3.3; CrystallineCohomology §CR.3.2; EnhancedDerivedSheaves `E4`; DerivedDeRhamCohomology §§1.14–1.22, 2.22–2.26.

### Examples

For proper good reduction the rational comparison recovers the crystalline representation; projective space supplies each Tate degree. In particular `H²_ét(P¹_C,ℚ_p)=ℚ_p(−1)` has nontrivial cyclotomic inertia despite good reduction. In the separate characteristic-p syntomic computation the point `Spec F_p` at weight one has operator `1−1/p`, hence zero derived fibre after rationalization. At weight zero the operator is zero and its shifted fibre term survives. The homotopy-pullback triangle uses the arrow `(right,−bottom)`: if both corner maps are the identity, the diagonal followed by this arrow is `x−x=0`, rather than `x+x`.

### Dependencies

Layers 0–2; CrystallineCohomology CR.3 Frobenius-isogeny and residue-section descent; AInfCohomology AI.2/AI.5; PadicPeriodRings §§4.1–4.3 and PadicHodgeTheory §§3.1–3.5; the syntomic construction of §1.11 syntomic cohomology; DerivedDeRhamCohomology Layers 1–2 completion and Hodge-completed tensors; EnhancedDerivedSheaves E4 enhanced fibres. AInfCohomology §AI.7.2 supplies the spectral trace inputs; PrismaticCohomologyPartIII §7.0 supplies the graded Beilinson square; this layer constructs the nearby-cycle corner identifications and transports its homotopy.

## Layer 4: Semistable and logarithmic comparison

### 4.1 Logarithmic integral comparison adapter

Let `𝔛₀` be proper flat p-adic formal over `O_K`, with its divisorial log structure and an étale cover by semistable charts `t₀⋯t_r=π′`, where `π′` is a nonzero nonunit and may vary with the chart. Keep the pure-dimensional special-fibre assumption of CK §7.1. After `O_C` base change, place the supplied semistable `A_inf` complex and its `θ`-log de Rham, Witt-log crystalline, `A_cris`-log crystalline and `μ`-inverted étale maps in the coefficient diagram.

Record the logarithmic bases explicitly: `W(k)` with the `Q_{≥0}` log base occurs in the geometric integral construction, while `W(k₀)` with `N→W(k₀)`, `1↦0` occurs in arithmetic Hyodo–Kato theory. Properness remains part of the étale comparison. Products are retained only in the source-proved range; the full all-coordinate semistable `A_cris` morphism is not asserted to be multiplicative from the smooth theorem.

(Česnavičius–Koshikawa, §7.1–7.2, pp.68–69; Corollary 5.43, pp.58–59; Theorem 2.3, p.9.)

*Needs:* AInfCohomology §AI.6.3; AInfCohomology §AI.6.4; AInfCohomology §AI.6.6; Layer 0.1 (Normalized specialization diagram).

### 4.2 Hyodo–Kato log-base adapter

Use AInfCohomology §AI.6.4 `Semistable.hyodoKatoInterface` (iv) for the `B_st⁺` base-change adapter between geometric log crystalline cohomology and arithmetic Hyodo–Kato cohomology, with its two log bases, Frobenius, total monodromy and Galois action. Transport that supplied map to this roadmap’s conventions for use in §4.3. The CK Proposition 9.2 map preserves `φ` and `N`. On the Hyodo–Kato tensor, `N` is `N_HK⊗1+1⊗N_Bst`; on the `A_cris` tensor it acts on the period coefficient only.

Use parts (i)–(iii) of the same supplied interface for descent from `k` to `k₀` and the arithmetic log-base comparison. The period map does not by itself identify the integral log objects or their coefficient fields. `G_K` acts semilinearly on the unramified extension `F^{nr}`; an element acting nontrivially on `k` does not fix that coefficient field pointwise. Carry this action into the balanced tensor and into subsequent period invariants.

(Česnavičius–Koshikawa, Proposition 9.2 and Remark 9.3, pp.75–76.)

*Needs:* AInfCohomology §AI.6.4 `Semistable.hyodoKatoInterface` (i)–(iv); CrystallineCohomology `CR.6`; PadicPeriodRings §§1.5, 3, 4.1–4.3; Layer 4.1 (Logarithmic integral comparison adapter); CrystallineCohomology §CR.6.1.

### 4.3 Semistable period comparison

Under the proper semistable formal hypotheses above, with perfect residue `k₀`, prove a natural `G_K`-equivariant derived equivalence

```text
RΓ_ét(X_C,ℤ_p) ⊗^L B_st ≃ RΓ_logcrys(𝔛₀,k₀/W(k₀)) ⊗^L B_st.
```

The arithmetic log base is `N→W(k₀)`, `1↦0`. The comparison respects `φ` and total `N`, with `Nφ=pφN`. Its degreewise consequence identifies the semistable period module and proves `H_ét^i(X_C,ℚ_p)` semistable over `K`. Use the log-base adapter and the actual semistable `A_inf` maps in constructing this equivalence. Potential semistability of a general proper rigid space, proved below, is a different theorem and has a different descent object.

For finite `K/ℚ_p`, take the rational degreewise comparison and period-module identification from PadicHodgeTheory §8.1. The derived equivalence and arbitrary-perfect-residue extension here refine that map by `finiteBaseComparisonAgreement` of §3.4.

(Česnavičius–Koshikawa, Theorem 9.5, p.76.)

*Needs:* Layer 4.1 (Logarithmic integral comparison adapter); Layer 4.2 (Hyodo–Kato log-base adapter); CrystallineCohomology `CR.6`; PadicPeriodRings §§1.5, 3, 4.1–4.3; PadicHodgeTheory §§3.1–3.5, 8.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.1–R07.3.3; PadicPeriodRings §4.1.

### 4.4 Semistable de Rham agreement

Choose an `A_cris`-algebra embedding `B_st→B_dR` of the Fontaine/CK kind. Extend the semistable period comparison along it and prove equality with the canonical de Rham comparison in the intersection of their hypotheses. Use CK Proposition 6.8 on the actual integral-to-de Rham morphisms before passing to cohomology.

Transport the Hodge filtration through the corresponding Hyodo–Kato-to-de Rham identification; the resulting `B_dR` isomorphism is strict. The embedding is a choice, so `B_st` does not acquire a choice-free filtration simply from this statement. Changing the choice is governed by the signed monodromy transport next. Include the scalar and logarithm conventions in both sides of the agreement, rather than saying only that some filtered period isomorphism exists.

For finite `K/ℚ_p` this is the de Rham agreement supplied by PadicHodgeTheory §8.1; prove the derived diagram here induces it through §3.4's `finiteBaseComparisonAgreement`. The same common integral maps give the agreement for arbitrary perfect `k₀`.

(Česnavičius–Koshikawa, Remark 9.6, p.77; Proposition 6.8, pp.66–68.)

*Needs:* Layer 4.3 (Semistable period comparison); Layer 2.12 (Descended de Rham lattice); Layer 2.13 (Filtered de Rham comparison over `K`); AInfCohomology §AI.6.6.

### 4.5 Uniformizer change and monodromy transport

Let `π` be a uniformizer, `u∈O_Kˣ` and `e=v_π(p)`. Use AInfCohomology §AI.6.4's `Semistable.pNormalizedMonodromy`, including its sign, scaling `N_norm=N_raw/e`, nilpotence, ramified base change and relation `Nφ=pφN`. Use `N_HK=N_norm` with CK’s p-normalized `B_st`, whose operator is `N_Bst=−d/dT` and satisfies `N_Bst(log[π♭])=−1/e`. A coordinate for the uniformizer torsor translates by `log_K(u)`; the induced coordinate on the p-torsor translates by `e log_K(u)`.

Define `ρ_π` by evaluating total-monodromy horizontal sections at `T_π=0`. Such a section associated to `x` is `exp(T_π N_norm)x`. Since `T_{πu}=T_π+e log_K(u)`, the signed target is

```text
ρ_{πu} = ρ_π ∘ exp(−log_K(u) N_raw)
       = ρ_π ∘ exp(−e log_K(u) N_norm).
```

Using the supplied nilpotence, prove this evaluation formula and the unit cocycle by additivity of `log_K` and the finite exponential. CK §9.1 gives the p-torsor and its translation rule; the arithmetic uniformizer formula uses the supplied normalization and arithmetic log-base comparison.

The two-term witness is `N(e₁)=e₀` and `N(e₀)=0`. Then `exp(−cN)e₁=e₁−ce₀` and `exp(−cN)e₀=e₀`. This pins both the sign and the direction of coordinate transport. At `u=1` the map is the identity; at `N=0` the uniformizer choice disappears.

Define `monodromyTransport c N` as `exp(−cN)` for `c∈K` and `N` in a ring `A` that is a `K`-algebra and a `Q`-module, using Mathlib's `IsNilpotent.exp` (the finite exponential series, meaningful for nilpotent `N`). The cohomological statement takes `A=End_{K₀}(H_HK^r)` after base change, `N=N_norm` and `c=e log_K(u)` (equivalently `N=N_raw` and `c=log_K(u)`). Its API: `monodromyTransport_zero_left` (`c=0` gives the identity), `monodromyTransport_zero_right` (`N=0` gives the identity) and `monodromyTransport_add` (for nilpotent `N`, transport along `c+d` is the product of the transports along `c` and `d`, the unit cocycle, since `log_K(uu′)=log_K(u)+log_K(u′)`).

**Checks.**

- For `N(e₁)=e₀`, `N(e₀)=0` on `K²`, `monodromyTransport c N` sends `e₁` to `e₁−ce₀`; a transport `exp(+cN)` would send it to `e₁+ce₀`.
- At `c=0`, and at `N=0`, the transport is the identity.
- For `e=2`, `N_raw=E₁₂`, `N_norm=E₁₂/2` and `ℓ=log_K(u)`, `monodromyTransport (2ℓ) N_norm=1−ℓE₁₂`; using `ℓ` with `N_norm` would instead give `1−(ℓ/2)E₁₂`.
- For `N` with `N²=0`, transports along `c` and `d` compose to the transport along `c+d`, which is `1−(c+d)N`.

The Tate-curve relation of Layer 4.7 has the matrix witness `φ=diag(1,p)`, `N=E₁₂` on `K²`: `Nφ=pφN` holds, and the reversed relation `φN=pNφ` fails as soon as `p²≠1`.

(Česnavičius–Koshikawa, §9.1 and Proposition 9.2, pp.75–76; AInfCohomology §AI.6.4, `Semistable.pNormalizedMonodromy`.)

*Needs:* CrystallineCohomology `CR.6`; AInfCohomology §AI.6.4 `Semistable.hyodoKatoInterface` and `Semistable.pNormalizedMonodromy`; PadicPeriodRings §§1.5, 3, 4.1–4.3; Layer 4.4 (Semistable de Rham agreement); CrystallineCohomology §CR.6.2.

### 4.6 Log prismatic comparison boundary

Use PrismaticCohomologyPartIV §§8.1–8.29 for logarithmic delta rings, prisms, the log-prismatic site and its cohomology, including restriction, logification invariance, Frobenius and completed base change. The relative input is a bounded prelog prism `(A,I,M_A)` with `M_A` integral and an integral qcqs log formal scheme smooth over `(A/I,M_A)` in Koshikawa's sense. Exact closed immersions and integral log base changes are those of the supplied site.

In the vertical semistable chart range of §4.1 use PrismaticCohomologyPartIV §§8.41–8.42's Frobenius-pulled-back, `(p,μ)`-completed log-prismatic identification with `AΩ` and its proper semistable period diagram. Prove that these supplied maps agree with this roadmap's log-de Rham, log-crystalline and étale specializations after the specified coefficient extensions. Koshikawa's q-crystalline intermediate retains the coefficient Frobenius twist. No unrestricted multiplicativity is inferred from its `AΩ` comparison: Koshikawa Remark 8.2 does not prove that enhancement. The proper period diagram retains its `B_dR⁺` comparison map, which becomes an isomorphism after passage to `B_dR`.

For the general integral smooth log input use PrismaticCohomologyPartIV §§8.35 and 8.56: the log-crystalline comparison requires prism ideal `I=(p)`, Cartier type and the rank-one or log-ring base condition of §8.35; the smooth log-de Rham comparison requires the mod-p fibre to be of Cartier type. Apply its §8.69 Kummer-étale comparison in the vertical semistable fs-chart range of §4.1 with a sheafy analytic generic fibre `X_η`. Retain the bounded perfect associated log prism, saturated prelog presentation, descent from an fs chart `M₀`, qcqs descended formal scheme and Cartier-type mod-p fibre hypotheses, for every `n≥1` and with derived Frobenius fixed points. The general log-crystalline and log-de Rham comparisons keep their separate ranges; a general log-diamond generic fibre is outside this étale application. Use the supplied products, completed base change, Frobenius-pullback scalar maps and exact chart restrictions within each map's range.

For the semistable chart range compare the rational log-crystalline specialization with the Hyodo–Kato realization of §4.2, carrying both `φ` and `N`, and prove agreement after period extension. This agreement uses the common log-crystalline maps rather than an identification of log bases.

**Checks.**

- Trivial log structures recover the smooth comparison of §1.7.
- The relative log differential module of `t₀t₁=π` is free of rank one, generated by `dlog t₀`, with `dlog t₁=−dlog t₀`.
- On the closed annulus `ℚ_p⟨x,y⟩/(xy−p)`, the convergent form `ω=(Σ_{m≥1}p^m x^{p^m})dlog x` has residue zero but is not exact: a primitive would have positive Laurent coefficients 1 at every exponent `p^m`. These do not tend to zero. Its class and `[dlog x]` are independent in ordinary analytic de Rham cohomology; the completed log-crystalline chart has the same obstruction. Rank one for the differential module therefore asserts no rank-one ordinary local cohomology theorem.
- A global split Tate elliptic curve retains nonzero rank-one monodromy on its two-dimensional Hyodo–Kato module after gluing, as in §4.7.
- At a good-reduction point the comparison gives the coefficient ring in degree zero and `N=0`.
- A nonexact chart is not an object of the stated site; ordinary ring maps alone do not meet its conditions.

Sources: [Koshikawa, *Logarithmic prismatic cohomology I*](https://arxiv.org/pdf/2007.14037v3), Definition 4.1, §§5–6, Theorem 8.1, Remarks 8.2–8.3 and Theorem 8.5; [Koshikawa–Yao, *Logarithmic prismatic cohomology II*](https://arxiv.org/pdf/2306.00364), Theorem 2(3)–(5), pp.3–4; Česnavičius–Koshikawa, §9 and Theorem 9.5, pp.75–76.

*Needs:* PrismaticCohomologyPartIV §§8.1–8.29, 8.35, 8.41–8.42, 8.56 and 8.69 (generic logarithmic constructions and comparison maps with their respective hypotheses); CrystallineCohomology CR.5–CR.6; Layer 4.1 (Logarithmic integral comparison adapter); Layer 4.2 (Hyodo–Kato log-base adapter); EnhancedDerivedSheaves E2/E4.

### 4.7 Good reduction and Tate-curve monodromy

For a proper smooth good-reduction model, the supplied Hyodo–Kato calculation has `N=0`. Prove the semistable comparison specializes to the crystalline comparison through the common period embedding. For a split Tate elliptic curve `E_q` with `q` nonzero and of positive valuation, use its two-dimensional Hyodo–Kato module with nonzero rank-one `N`.

In a compatible basis take `N(e₁)=e₀`, `N(e₀)=0`, `φ(e₀)=e₀` and `φ(e₁)=pe₁`, giving `Nφ(e₁)=pe₀=pφN(e₁)`. The de Rham filtration records the chosen logarithm of `q` after the period embedding. This shows why the Tate-curve representation is semistable but not crystalline, and supplies a concrete test that a comparison preserving only `φ` would miss. Keep the logarithm branch and uniformizer normalization tied to the preceding transport theorem.

(Česnavičius–Koshikawa, §9 introduction, p.75; Theorem 9.5, p.76; §9.1, p.75.)

*Needs:* Layer 4.3 (Semistable period comparison); Layer 4.4 (Semistable de Rham agreement); Layer 3.4 (Crystalline comparison over a discretely valued base); CrystallineCohomology `CR.6`; PadicHodgeTheory §§3.1–3.5; CrystallineCohomology §CR.6.3.

### 4.8 Algebraic period comparison without smoothness

Throughout §§4.8–4.11 take `K` complete discretely valued of characteristic zero with countable perfect residue field, and `C=widehat(K̄)`. These are the base hypotheses of the Colmez–Nizioł constructions and Banach–Colmez argument used here (CN5, p.2 and footnote 6, p.12).

For any algebraic variety `X_K/K` and every `r≥0`, construct Beilinson's `B_st`-linear, `G_K`-equivariant comparison `H_ét^r(X_K̄,ℚ_p)⊗B_st≃H_HK^r(X_K̄)⊗_{F^{nr}}B_st`. It preserves `φ` and `N` and induces the filtered comparison with `H_dR^r(X_K)`. Smoothness and properness are not hypotheses here.

Use the h-descent Hyodo–Kato and de Rham realizations for arbitrary varieties, including the original algebraic comparison and the compatible descent maps. Their construction is included below; the cohomology of a smooth proper semistable model does not define them for a singular or open variety. The Galois action on the right includes its semilinear action on `F^{nr}`. This theorem follows the source's algebraic scope, while the rigid statements below use overconvergent analytic constructions.

Construct the algebraic h-sheaf realizations from proper hypercovers with semistable alterations, using cohomological descent and common refinements. The Hyodo–Kato realization is over the algebraic unramified union `F^{nr}`; it carries compatible Frobenius, monodromy and descent data. Its scalar extension to de Rham cohomology uses the chosen geometric embedding. Prove independence of the hypercover and comparison with the log rigid complexes of CrystallineCohomology §§CR.6.4–CR.6.5. The API comprises pullback, descent, scalar extension, products and the comparison with the classical semistable model when one is given. A proper semistable model reproduces its usual Hyodo–Kato complex; a smooth nonproper algebraic variety retains boundary terms; a singular variety uses the full hypercover rather than its smooth locus.

(Colmez–Nizioł, Theorem 6.2 and footnote 17, p.40.)

*Needs:* CrystallineCohomology `CR.6`; AlgebraicModuliForArithmeticGeometry §§9.4–9.7; SchemeAndStackFoundations §§5.4–5.6; PadicHodgeTheory §§3.1–3.5; EnhancedDerivedSheaves E2; EnhancedDerivedSheaves `E2`.

### 4.9 Period recovery and Hom descriptions

For the preceding algebraic variety, recover its rational étale group as the intersection of `(H_HK^r⊗B_st)^{φ=1,N=0}` with `Fil⁰(H_dR^r⊗B_dR)` through the comparison maps. The Frobenius and monodromy fixed conditions refer to the total operators on the tensor. The filtration uses the same chosen period embedding as the de Rham comparison.

Prove the two dual descriptions in the source's scope: `Hom^sm_{G_K}(H_ét^r,B_st)≃(H_HK^r)^*` as `(φ,N,G_K)`-modules, and `Hom_{G_K}(H_ét^r,B_dR)≃(H_dR^r)^*` as filtered `K`-spaces. Retain the smooth-vector condition for `B_st` and the duals on the right. Replacing smooth Hom by unrestricted Hom or erasing the dual changes the theorem. Use the uncompleted `F^{nr}` realization for this formulation; a scalar-extended completed carrier needs a separately proved descent statement.

(Colmez–Nizioł, Theorem 6.2, equation (6.3), p.40; Remark 6.7, p.41.)

*Needs:* Layer 4.8 (Algebraic period comparison without smoothness); PadicHodgeTheory §§3.1–3.5.

### 4.9a Analytic Hyodo–Kato realization

Construct `RigidHyodoKatoCohomology X` for smooth separated rigid `X/C`, taut and countable at infinity, under the countable-residue base assumptions of §4.8. It is the overconvergent analytic semistable descent complex over the uncompleted algebraic union `F^{nr}`, with semilinear Frobenius, nilpotent cohomological monodromy, `Nφ=pφN`, functorial pullback and `G_K` action when descent data are given. Use the dagger/log-rigid semistable residue-model complexes of CrystallineCohomology §CR.6.5 as local values, distinct from ordinary completed log-crystalline cohomology on nonproper charts.

Construct the analytic semistable covering and alteration inputs: semistable formal-model covers after finite extensions, the associated analytic hypercovers, common refinements and cohomological descent for the local overconvergent complexes. Prove hypercover independence and agreement with the supplied log rigid Hyodo–Kato complex on a semistable model. Its ordinary log-crystalline identification uses a proper semistable model as in CrystallineCohomology §CR.6.5; the dagger-to-completion comparison uses partial properness as in CN I, Corollary 4.32. Construct the Hyodo–Kato comparison; for proper smooth `X`, its deformation form is `Rlim_n (RigidHyodoKatoCohomology X ⊗^L_{F^{nr}} B_dR⁺/ξ^n) ≃ K_dR⁺(X)`, with its compatible `C`-reduction to de Rham cohomology. Here the displayed limit specifies derived `ξ`-completion. The API includes descent, refinement cocycles, scalar extension, products and agreement with §4.8 on analytifications of smooth algebraic varieties. Finiteness in the proper case follows through this comparison and proper de Rham finiteness; no finiteness for arbitrary nonproper rigid spaces is asserted.

**Checks.**

- On `Spa C` the complex is `F^{nr}[0]`, with Witt Frobenius and `N=0`.
- For a proper smooth good-reduction model it recovers the rational crystalline realization and has `N=0`.
- On a split Tate curve it is two-dimensional in degree one with nonzero rank-one `N`; refinements preserve `Nφ=pφN`.

(Colmez–Nizioł, *On the cohomology of p-adic analytic spaces I*, §2, Theorems 4.6 and 4.27 and Corollary 4.32; *II*, proof of Theorem 6.4, p.41.)

*Needs:* CrystallineCohomology §CR.6.5; AInfCohomology §AI.6.5; AdicSpacesPartIII F0/R2; AdicSpacesPartIV dagger/overconvergent geometry; SchemeAndStackFoundations Layer 4 alterations; EnhancedDerivedSheaves E2/E4. The analytic semistable covering and descent assertions are targets of this subsection.

### 4.10 Proper rigid `C_st` comparison over `K`

Under §4.8’s countable-residue assumptions, for proper smooth rigid `X_K/K` and `r≥0`, prove the natural `G_K`-equivariant `B_st` comparison with `H_HK^r(X_C)⊗_{F^{nr}}B_st`, compatible with `φ` and `N`. It induces the strict filtered `B_dR` comparison. Conclude that `H_ét^r(X_C,ℚ_p)` is potentially semistable.

Use the overconvergent syntomic comparison in the high-twist range, the proper Hyodo–Kato/de Rham finiteness theorems, and the Banach–Colmez dimension calculation named in the analytic supplier contract. These are early analytic inputs to the proof, not consequences of this comparison. The `F^{nr}` object with `G_K` action is the potential period realization. Without a semistable model over `O_K`, the theorem does not say the representation is semistable over `K` itself.

Construct the overconvergent syntomic complex in twist `r` as the homotopy fibre of the Hyodo–Kato Frobenius/monodromy map to its de Rham quotient by `Fil^r`, with the completed period coefficients of Colmez–Nizioł §5. Construct its map to étale cohomology and prove it is an equivalence after truncation in degrees `≤r`. Prove the Banach–Colmez exactness and dimension/height comparison used in their Theorem 6.4, retaining `r≥i` when recovering degree `i`. These local mathematical targets are part of the proof here; the presence of `B_st` and its invariant field alone is insufficient.

(Colmez–Nizioł, Theorem 6.4 and proof, pp.40–41.)

*Needs:* Layer 4.9a (Analytic Hyodo–Kato realization); CrystallineCohomology `CR.6`; Layer 2.13 (Filtered de Rham comparison over `K`).

### 4.11 Proper rigid period comparison over `C`

For proper smooth rigid `X/C`, with `C=widehat(K̄)` and `K` as in §4.8, prove the `φ,N`-compatible `B_st` comparison with `H_HK^r(X)⊗_{F^{nr}}B_st`. Its `B_dR` extension is filtered for the intrinsic canonical de Rham deformation cohomology. Define `Fil^i H^r(K_dR⁺)` as the image of `H^r(Fil^i K_dR⁺)→H^r(K_dR⁺)`, and then form the indicated rational period filtration.

This is the filtered over-`C` theorem, extending the underlying comparison and finite-free lattice of Layer 2. A `B_dR⁺` lattice alone does not recover this filtration on cohomology. No `G_K` action is part of the statement unless `X` is equipped with descent to `K`. The overconvergent analytic proof retains its derived filtered complexes when extracting the cohomological comparison.

(Colmez–Nizioł, Theorem 6.8 and Remark 6.10, p.42.)

*Needs:* Layer 4.9a (Analytic Hyodo–Kato realization); CrystallineCohomology `CR.6`; Layer 2.8 (Canonical `B_dR⁺` cohomology); Layer 2.11 (Canonical de Rham period comparison).

### 4.12 Proper-curve potential period interface

For a proper smooth curve `X_K` over a finite extension `K/ℚ_p` and `X=X_K⊗C`, put `V=H_ét¹(X,ℚ_p)`. Identify `D_pst(V)` with `H_HK¹(X)`, give its Hodge–Tate weights as 0 and `−1`, and identify `Fil¹D_dR(V)` with `H⁰(X_K,Ω¹)`. This is the potential-period and differential input used for the proper-curve calculation in CDN Proposition 3.12.

Use the rigid potential comparison and degeneration, with their common filtered map. The theorem need not assume semistable reduction over the original `K`. The modified Hyodo–Kato object and its further identity involving pro-étale `H¹`(Ô) require the fundamental period exact sequence supplied elsewhere; this interface returns only the comparison and filtration data just listed.

(Colmez–Dospinescu–Nizioł, §3.3, Proposition 3.12 and first proof paragraph, p.36.)

*Needs:* Layer 4.10 (Proper rigid `C_st` comparison over `K`); Layer 2.14 (Hodge–de Rham degeneration); PadicHodgeTheory §§3.1–3.5.

### Examples

For `N(e₁)=e₀` and `N(e₀)=0`, the horizontal section `e₁+T e₀` becomes `e₁+(T′−c)e₀` under `T′=T+c`. Evaluating at `T′=0` gives `e₁−ce₀`, fixing the negative exponential. At `c=0` transport is the identity, and if `N=0` every uniformizer gives the same map. The relation `Nφ=pφN` holds with `N=−d/dT` and `φ(T)=pT` on the period factor. Good reduction has `N=0`, whereas a Tate curve supplies a nonzero rank-one `N`. Over `C` alone no `G_K` equivariance is asserted without descent data.

### Dependencies

Layers 0–3; AInfCohomology AI.6 exact log comparison maps; CrystallineCohomology CR.6 vertical integral and overconvergent Hyodo–Kato theory with `N`; PrismaticCohomologyPartIV §§8.1–8.29, 8.35, 8.41–8.42, 8.56 and 8.69 for the supplied log-prismatic theory used by §4.6's compatibility diagrams; PadicPeriodRings §§4.1–4.3 and PadicHodgeTheory §§3.1–3.5, the local/syntomic stable-range period maps and Banach–Colmez exactness constructed in §4.10; EnhancedDerivedSheaves E2/E4 h-descent and filtered tensors; AlgebraicModuliForArithmeticGeometry §§9.4–9.7 and SchemeAndStackFoundations §§5.4–5.6 for the algebraic range.

## Layer 5: Integral torsion inequalities and lattice recovery

### 5.1 Crystalline and de Rham torsion-freeness

For proper smooth formal `𝔛/O_C` and each degree `i`, prove `H_crys^i(𝔛_k/W(k))` is p-torsion-free exactly when `H_dR^i(𝔛/O_C)` is p-torsion-free. In this case `H_Ainf^i(𝔛)` is finite free and `H_ét^i(X_C,ℤ_p)` is torsion-free. Apply the generic `A_inf` complex criterion to the actual geometric `K_A` and its two specified specializations.

This is a degreewise equivalence between crystalline and de Rham torsion-freeness, followed by an implication to étale freeness. The implication has no converse from étale cohomology, as the Enriques example below shows. The generic module theorem belongs to the `A_inf` supplier; here the comparison identifies which geometric groups meet its hypotheses. Adjacent-degree assumptions are reserved for the stronger lattice equality.

(Bhatt–Morrow–Scholze, Remarks 14.4 and 14.7, pp.120,122; the generic criterion is their Lemma 4.18, p.39, supplied by AInfCohomology AI.5.)

*Needs:* AInfCohomology `AI.5`; Layer 1.2 (Integral de Rham specialization); Layer 1.4 (Derived Witt crystalline specialization).

### 5.2 Integral torsion-length inequality over `O_C`

For proper smooth formal `𝔛/O_C` and `i≥0`, prove for every `n≥0`

```text
length_Zp(H_ét^i(X_C,ℤ_p)_tor/p^n)
    ≤ length_W(k)(H_crys^i(𝔛_k/W(k))_tor/p^n).
```

Also identify the ranks of the two cohomology groups. In particular vanishing crystalline torsion forces étale torsion-freeness. Use the generic `A_inf` torsion comparison on `K_A` and the geometric specializations; the length is the finite length of the torsion quotient, not a dimension of the whole group.

At `n=0` both quotients are zero. The inequality for each truncation is stronger information than an inequality of total lengths but does not yield an embedding or subquotient relation of the torsion modules. The later degeneration example separates these assertions. Finiteness of the groups is established before treating the extended-natural `Module.length` as an integer.

Define `truncatedTorsionLength R M π n` as `Module.length` over `R` of `M_tor/π^n M_tor`, where `M_tor` is Mathlib's `Submodule.torsion R M` and `π^n M_tor` is `(π^n)·M_tor`; its values are in `ℕ∞`. The inequality above compares `truncatedTorsionLength ℤ_p H_ét^i p n` with `truncatedTorsionLength W(k) H_crys^i p n`. Its API: `truncatedTorsionLength_zero` (value 0 at `n=0`), invariance under `R`-linear isomorphisms, and finiteness for finitely generated modules over a discrete valuation ring `R` with uniformizer `π` (over `ℤ_p` and `W(k)` with `π=p`), where `M_tor/π^n M_tor` is a finite direct sum of cyclic modules `R/π^a`.

**Checks.**

- At `n=0` the quotient is zero, so the value is 0 for every `M`.
- A torsion-free module, such as `ℤ` over `ℤ`, has value 0 for every `n`; the definition must not measure the free rank.
- Over `ℤ` with `π=p`, `ℤ/p²` has values 1 at `n=1` and 2 at `n=2`, while `(ℤ/p)²` has value 2 at both; a definition using the length of `M_tor` itself gives 2 for both at `n=1` and fails.

(Bhatt–Morrow–Scholze, Theorem 14.5(ii), pp.120–121.)

*Needs:* AInfCohomology `AI.5`; Layer 1.1 (Proper smooth `A_inf` input package); Layer 1.4 (Derived Witt crystalline specialization); Layer 1.6 (Étale specialization after `μ` inversion); Mathlib `Module.length`.

### 5.3 Lattice recovery over `O_C`

Assume `H_crys^i(𝔛_k/W(k))` is p-torsion-free for proper smooth `𝔛/O_C`. Then `T=H_ét^i(X_C,ℤ_p)` is finite free. Attach its finite-free BKF module to the pair `(T,H^i(K_dR⁺(X_C))⊂T⊗B_dR)` through the Fargues equivalence. Prove `H_Ainf^i(𝔛)` identifies with that module and that its `W(k)`-specialization injects `φ`-compatibly into `H_crys^i`.

If additionally `H_crys^{i+1}` is p-torsion-free, prove this inclusion is equality. The second hypothesis removes the next-degree base-change obstruction, so in this stronger range crystalline cohomology with `φ` is recovered from `T` together with its canonical `B_dR⁺` lattice. Keep the two levels of conclusion distinct: degree-`i` freeness gives the BKF identification and inclusion, whereas equality requires the adjacent degree too.

(Bhatt–Morrow–Scholze, Theorem 14.5(iii), pp.120–121.)

*Needs:* AInfCohomology `AI.5`; AInfCohomology `AI.2`; Layer 1.1 (Proper smooth `A_inf` input package); Layer 2.16 (The canonical `B_dR⁺` lattice in good reduction); Layer 2.17 (Agreement of integral and rational period maps).

### 5.4 Crystalline lattice recovery from the `G_K`-lattice

Take `C=widehat(K̄)` with its canonical continuous `G_K` action. For proper smooth `𝔛₀/O_K`, assume `H_crys^i` and `H_crys^{i+1}` are p-torsion-free. Fix `π` and its compatible roots, and apply the all-weight crystalline-lattice Kisin functor to the `G_K`-lattice `T=H_ét^i(X_C,ℤ_p)`. Its finite-free module `BK_K(T)` over `𝔖₀=W(k₀)[[u]]` has the `B_cris⁺` identification with crystalline cohomology supplied by BMS Proposition 4.34 and the crystalline period comparison.

Use the convention `u↦[π♭]^p` with Witt Frobenius on coefficients for `𝔖₀→A_inf`, and `u↦0` with Witt Frobenius for `𝔖₀→W(k₀)`. After identifying the common rational `W(k₀)[1/p]` module, prove `BK_K(T)⊗_{𝔖₀,ε₁} W(k₀)=H_crys^i(𝔛₀,k₀/W(k₀))` as lattices with `φ`. After scalar extension `W(k₀)→W(k)`, this yields the geometric crystalline lattice with its induced Frobenius. This is recovery from the `G_K` action, not merely from the rank of `T`. The supplied Kisin theorem is the all-weight crystalline-lattice theorem; finite-flat or p-divisible-group classification alone is weaker than this input.

(Bhatt–Morrow–Scholze, Theorem 14.6(iii) and proof, pp.121–122.)

*Needs:* AInfCohomology `AI.2`; FiniteFlatGroupsAndIntegralPadicHodgeTheory `R07.4`; Layer 3.4 (Crystalline comparison over a discretely valued base); Layer 5.3 (Lattice recovery over `O_C`); Layer 0.4 (Twists, Frobenius and filtration conventions); CrystallineCohomology `CR.3`; CrystallineCohomology §CR.3.2.

### 5.5 Torsion lengths over a discretely valued base

For proper smooth formal `𝔛₀/O_K` with the perfect-residue mixed-characteristic DVR assumptions, prove the all-`n` torsion inequality between `H_ét^i(X_C,ℤ_p)` and `H_crys^i(𝔛₀,k₀/W(k₀))`. The ranks agree, and crystalline p-torsion-freeness implies étale p-torsion-freeness. The result uses completed geometric base change to `O_C` and the rationally normalized crystalline descent.

Record the lengths over `ℤ_p` and `W(k₀)`, each with `p` as the truncation parameter. No ordinary length over ramified `O_K` replaces either coefficient ring in this statement. Include `n=0` and the vanishing-rank case in the checks. The geometric variant follows by `W(k₀)→W(k)` and has the same finite torsion lengths. The opposite torsion-freeness implication fails, and no integral étale realization is determined only by the residue scheme.

(Bhatt–Morrow–Scholze, Theorem 14.6(ii), pp.121–122.)

*Needs:* Layer 5.2 (Integral torsion-length inequality over `O_C`); CrystallineCohomology `CR.3`; Mathlib `Module.length`; CrystallineCohomology §CR.3.2; CrystallineCohomology §CR.3.5.

### 5.6 Mod-p de Rham dimension bound

For proper smooth `𝔛₀/O_K`, prove `dim_{k₀} H_dR^i(𝔛₀,k₀)≥dim_Fp H_ét^i(X_C,F_p)`. Use derived base change for crystalline and étale complexes, together with finite generation of integral cohomology. Reduction modulo `p` in degree `i` has contributions from torsion in both degree `i` and degree `i+1`; include both before applying the two all-`n` inequalities at `n=1`.

After extension `k₀→k`, the geometric de Rham group has the same dimension over `k`. The result concerns the mod-p cohomology groups themselves, not only reduction of integral `H^i`. This explains why the next-degree torsion must appear in the proof even though the bound is stated in one degree. Finiteness lets the result use natural-number dimensions; no comparison of infinities or infinite-dimensional affine de Rham groups is intended.

(Bhatt–Morrow–Scholze, Theorem 1.1 and inequality (1), pp.2–3.)

*Needs:* Layer 5.5 (Torsion lengths over a discretely valued base); CrystallineCohomology `CR.3`; AInfCohomology `AI.5`; Mathlib `Module.finrank`; CrystallineCohomology §CR.3.2.

### 5.7 Semistable log crystalline torsion export

For the proper semistable `A_inf` complex and its logarithmic specializations, transport CK Theorem 7.9 into the same diagram. For every integer `i` and `n≥0`, the étale torsion quotient has `ℤ_p`-length at most the `W(k)`-length of `H_logcrys^i(𝔛_k/W(k))_tor/p^n`. Also retain the finite-coefficient inequality comparing `H_ét^i(X_C,Z/p^n)` with `H_logcrys^i(𝔛_k/W_n(k))`.

Use the supplied rank equality when moving between full finite-coefficient groups and torsion quotients. The log bases and the properness assumptions are those of Layer 4. This is a geometric diagram/export of the logarithmic generic torsion theorem, with the two scalar maps kept visible. At `n=0` the coefficient ring `W₀` and `Z/p⁰` are zero, so both finite-coefficient groups vanish.

(Česnavičius–Koshikawa, Theorem 7.9 and proof, p.70.)

*Needs:* AInfCohomology §AI.6.7; Layer 4.1 (Logarithmic integral comparison adapter).

### 5.8 Normalized log de Rham torsion export

Transport the corresponding logarithmic de Rham torsion and finite-coefficient inequalities with valuation normalized by `v(p)=1`. For the torsion quotient, use `v_OC(H_logdR^i(𝔛/O_C)_tor/p^n)` on the right and the usual `ℤ_p`-length on the left. For a finitely presented torsion cyclic `O_C`-module `O_C/(a)` with `a≠0`, the normalized quantity is `v(a)`, defined through the zeroth Fitting ideal; keep its real-valued codomain and its scalar-extension invariance.

If the model is defined over a discrete `O_K` of absolute ramification `e`, its normalized torsion length is `length_OK/e`. Thus `O_K/(π)` has value `1/e` and `O_K/(p)` has value 1. These are the tests that distinguish normalized valuation length from unscaled module length. The source's finite-coefficient log de Rham inequality is retained with the same normalization.

**Checks.**

- `O_K/(π)` has normalized value `1/e`.
- `O_K/(p)` has normalized value 1, including over ramified `K`.
- For `a=0`, `O_C/(a)=O_C` is free, its zeroth Fitting ideal is zero and its valuation is infinite; it lies outside the real-valued torsion statement.

(Česnavičius–Koshikawa, §7.10, Lemma 7.11 and Theorem 7.12, p.71.)

*Needs:* AInfCohomology §AI.6.7; AInfCohomology `AI.5`; Layer 4.1 (Logarithmic integral comparison adapter).

### 5.9 Functorial log de Rham lattice export

Take `C=widehat(K̄)` with its canonical continuous `G_K` action. For the geometric étale lattice `T` in the proper semistable range, use the supplied BKF module `M(T)` attached to `(T,D_dR(T)⊗B_dR⁺)` and define `L_dR(T)=(M(T)⊗_{A_inf,θ}O_C)^{G_K}`. For a proper flat semistable model whose `H_logdR^i` and `H_logdR^{i+1}` are both free over `O_K`, identify `L_dR(H_ét^i)` with `H_logdR^i` inside `H_dR^i(X_K)`.

Use the actual filtered comparison and its lattice inclusion to identify this image. The result makes the logarithmic de Rham lattice functorial and independent of models satisfying those adjacent-degree conditions. Neither condition can be dropped merely because the generic rational representation is semistable. Keep the `θ`-specialization here; Witt reduction yields a different integral realization.

(Česnavičius–Koshikawa, §8.5–8.6, p.73; Theorem 8.7 and Remark 8.8, p.74.)

*Needs:* AInfCohomology §AI.6.7; Layer 2.12 (Descended de Rham lattice); Layer 4.4 (Semistable de Rham agreement).

### 5.10 Small-weight integral arithmetic interface

For an absolutely unramified `K`, compare the geometric lattice with the supplied Fontaine–Laffaille realization after a common Tate shift puts all filtration indices in `[0,p−2]`. This is the unrestricted safe interval for torsion full faithfulness. For indices in `[0,p−1]`, impose the exact restricted subcategories excluding the endpoint subobjects or quotients of the Fontaine–Laffaille theorem. At `p=2` the unrestricted interval is `[0,0]`.

In the Breuil–Kisin branch, retain the supplier's height, ramification and dyadic restrictions and compare with the lattice recovered using the Kummer tower and Frobenius-twisted `𝔖₀` specialization. The comparison identifies geometric outputs of these classification theories; it constructs no new classification. Equality of a crystalline lattice still uses the freeness assumptions from lattice recovery, independent of the weight interval.

(Bhatt–Morrow–Scholze, §4.4, pp.43–44; Theorem 14.6(iii), pp.121–122.)

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory `R07.3`; FiniteFlatGroupsAndIntegralPadicHodgeTheory `R07.4`; PadicHodgeTheory §§6.1–6.2; Layer 5.4 (Crystalline lattice recovery from the `G_K`-lattice); FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.15–R07.3.17; PadicHodgeTheory §6.1.

### 5.11 Enriques torsion counterexample

Construct the smooth projective geometrically connected surface over `Z₂` of BMS Theorem 2.1: all its geometric generic integral étale cohomology groups are free, while degree-two crystalline cohomology of the special fibre has torsion `F₂`. Use the singular Enriques lift with `Pic^τ=μ₂`, its K3 cover and an ordinary elliptic curve. The composite `Z/2→μ₂→E` is nonzero generically and vanishes on the special fibre, giving an `E`-torsor threefold `D`.

Take a sufficiently ample smooth hypersurface and use weak Lefschetz and the crystalline calculation to obtain the surface and its asserted groups. Construct the required singular Enriques lift, compute its crystalline torsion and prove the positive-characteristic Bertini and weak-Lefschetz assertions in precisely this surface construction. These are targets of this subsection, with the flat group-scheme and crystalline interfaces supplied as indicated below. The example proves that étale torsion-freeness does not force crystalline torsion-freeness, even with projectivity and geometric connectedness.

(Bhatt–Morrow–Scholze, Theorem 2.1 and Proposition 2.2 with proofs, pp.13–15.)

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory `R07.1`; CrystallineCohomology `CR.3`; EtaleCohomologyFoundations F.5–F.6.

### 5.12 Degenerating torsion counterexample

Use CrystallineCohomology §CR.3.5, “Proper smooth tests and a crystalline torsion surface”, for the smooth projective surface `H/O_C`, its geometric quotient/torsor construction and its groups `H²_ét(H_C,ℤ_p)_tor≃ℤ/p²` and `H²_crys(H_k/W(k))_tor≃k⊕k`. Compute their truncated torsion lengths and deduce that generic torsion is not a subquotient of special torsion. The algebraic boundary target `truncatedTorsionLength_cyclic_vs_split` states the lengths at `n=1,2` for `ℤ/p²` and `(ℤ/p)²`, as `ℤ`-modules, distinguishing equal total length from equal exponent.

**Checks.**

- At `n=0` both truncated lengths are zero.
- At `n=1` the lengths are `1,2`; at `n≥2` they are `2,2`.
- The special torsion is killed by `p`, while the generic torsion is not. Every subquotient of a module killed by `p` is killed by `p`, so equal total length supplies no inclusion.

(Bhatt–Morrow–Scholze, Lemmas 2.5, 2.7, 2.9 and Theorem 2.10 proof, pp.15–17.)

*Needs:* CrystallineCohomology §CR.3.5; Layer 5.2 (Integral torsion-length inequality over `O_C`).

### 5.13 Special-fibre non-determination

Use the two smooth projective `Z₂` lifts `D` and `D′=S×E` from the Enriques construction, with the same special fibre `S_k×E_k`. Compute their different degree-two generic integral étale torsion. The isomorphism of special fibres therefore does not determine integral generic étale cohomology.

Through the `A_inf` specializations, the same example prevents `RΓ_Ainf`, even modulo `p`, from being a functor only of the residue scheme. Retain the full formal model as input to the integral comparison. This application does not contradict rational crystalline invariance or the residue-section theorem, which concern different coefficients and do not reconstruct generic integral torsion from the special fibre.

(Bhatt–Morrow–Scholze, Remark 2.4, p.15.)

*Needs:* Layer 5.11 (Enriques torsion counterexample); CrystallineCohomology `CR.3`.

### Examples

For every torsion-length formula, `n=0` gives the quotient by 1 and both sides are zero. A free module contributes zero torsion length. Over a DVR with `e=v_π(p)`, `O_K/(π)` has ordinary length 1 and normalized valuation length `1/e`; `O_K/(p^n)` has ordinary length `en` and normalized length `n`. At `p=2` the Fontaine–Laffaille interval `[0,p−2]` contains only weight zero. The Enriques example prevents reversal of the torsion-free implication, and the degenerating-group example separates equal length from equal exponent or isomorphic torsion.

### Dependencies

Layers 0–4; AInfCohomology AI.2, AI.5 and the named AI.6 torsion/lattice maps; CrystallineCohomology CR.3/CR.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/R07.3 and the all-weight R07.4 scope; PadicHodgeTheory §§6.1–6.2 for small-weight rational consequences for the exact torsion examples; Mathlib Module.length and ordinary module base change.

## Layer 6: Relative, product and arithmetic comparisons

### 6.1 Logarithmic period construction on modular curves

For the fixed-tame-level compactified modular-curve tower constructed in §6.2, with the cohomological realization and transported actions of CompletedCohomologyPartII §§8.4, 8.6–8.7, choose a sufficiently small finite level `V₀` defined over a finite `K/ℚ_p` and enlarge `K` so its cusps `D` are rational. Use PrismaticCohomologyPartIV §8.60's shared log structures, logification, pullback and integral fs charts to equip `V₀` with the divisorial fine saturated log structure of `D`, with cusp charts `N→O⁺_{V₀}`, `1↦q`, and trivial log structure away from `D`. Its Kummer-étale site and projection to the étale site are supplied by §8.60 in the locally noetherian fs range. Construct the additional pro-Kummer-étale site over this supplied site. A tower object is a compatible inverse system of Kummer-étale finite-level maps, with the corrected inverse-limit cover condition; its projection to the Kummer-étale site and restrictions preserve the supplied log structure. The inverse system of level and field extensions giving `V∞` is an object on this site. This is an analytic log construction and does not use the log crystalline PD site.

Construct `OB_dR,log⁺` there by the completed monoid-algebra presentation: match finite-level chart elements with their tilted Teichmüller lifts, complete in the full kernel of `θ_log`, pass through the finite period levels and sheafify. Prove independence of the chart and of the finite-level presentation. The filtration is the power filtration of that full kernel. At a one-dimensional chart identify the sheaf locally with `B_dR⁺[[X]]`, with `X` of filtration degree one. Construct its logarithmic connection and prove the strict Poincaré sequence and its first graded sequence

```text
0 → B_dR⁺ → OB_dR,log⁺ → OB_dR,log⁺ ⊗ Ω¹_{V₀}(D) → 0,
0 → O_{V∞}(1) → gr¹ OB_dR,log⁺ → O_{V∞} ⊗ Ω¹_{V₀}(D) → 0.
```

The differential module in the first sequence has degree one. Symmetric powers of the second sequence produce the finite filtration on every `gr^i` with successive terms `O_{V∞}(j)⊗Ω¹_{V₀}(D)^{⊗(i−j)}`. Prove that the construction is independent of `V₀` and respects `G_K` and the small level subgroup. (Diao–Lan–Liu–Zhu, Definition 2.2.10, p.13, Proposition 2.3.15, pp.18–19, Corollary 2.4.2, pp.20–21, and Corollary 2.4.5, p.21; Pan II §§6.3.5–6.3.8, pp.99–101.)

The intended signature uses the shared log structures, charts, Kummer-étale site and projection `ν′` of PrismaticCohomologyPartIV §8.60; the pro-Kummer-étale site, projection `ν` and period sheaf are constructed here.

```text
data       K/ℚ_p finite; G₀ ⊆ GL₂(ℤ_p) a sufficiently small open subgroup; V₀ = V_{G₀,K} a finite-level
           affinoid of the compactified modular curve over K whose cusps D are K-rational; the divisorial
           fine saturated log structure M_D on V₀ (integral charts N → O⁺_{V₀}, 1 ↦ q at a cusp; trivial away from D)
sites      (V₀)_két and (V₀)_prokét, with ν : (V₀)_prokét → (V₀)_két and ν' : (V₀)_két → (V₀)_ét
tower      V∞ = lim_{L, K_p} V_{K_p, L} ∈ (V₀)_prokét over finite L/K in C and open K_p ⊆ G₀, the inverse image
           π_HT⁻¹(U) of a basis open U of Layer 6.2 (the geometric tower and map are constructed in Layer 6.2)
panLogPeriod     OB⁺_dR,log : a sheaf of B⁺_dR-algebras on (V₀)_prokét
  θ_log           : OB⁺_dR,log → Ô, surjective, with Fil^r = (ker θ_log)^r
  ι               : B⁺_dR → OB⁺_dR,log, strict for the filtrations, θ_log ∘ ι = θ
  j               : colim_{L,K_p} O_{V_{K_p,L}} → OB⁺_dR,log, with θ_log ∘ j the inclusion into Ô
  ∇_log           : OB⁺_dR,log → OB⁺_dR,log ⊗_{O_{V₀}} Ω¹_{V₀}(D), B⁺_dR-linear, Leibniz, ∇_log(j(f)) = j_*(df)
  actions         G_K and G₀ act compatibly with θ_log, ι, j and ∇_log
```

On a log affinoid perfectoid `U=lim U_i` with chart monoids `M_i` and tilted monoid `M♭`, the presheaf value is the colimit over `i` of the completions `Ŝ_i=lim_{r,s}S_{i,r}/(ker θ_log)^s`, where `S_{i,r}` is the monoid algebra of `M_i×_M M♭` over `R_i⊗̂_{W(κ)}W(R♭⁺)/ξ^r` modulo the relations `α_i(a′)=[α♭(a″)]e_a` (DLLZ, Definition 2.2.10, pp.12–13). The connection is the unique `B⁺_dR/ξ^r`-linear log connection extending `d` and `δ` with `∇(e_a)=e_aδ(a′)` (DLLZ, (2.2.13)–(2.2.15), p.14).

The API is as follows. `panLogPeriod_restrict`: the construction is compatible with restriction along a change of chart, of finite level `K_p` and of field `L`, with the chart-refinement cocycle, and the resulting sheaf and `∇_log` do not depend on `G₀` or `K`. `panLogPeriod_theta`: `θ_log` is surjective, `Fil^r=(ker θ_log)^r` is exhaustive and complete, and `Sym^i_{gr⁰}gr¹≃gr^i` for `i≥0`. `panLogPeriod_local`: at a chart with one log coordinate, for `X∈Fil¹` whose image generates `Ô⊗Ω¹_{V₀}(D)`, the map `B⁺_dR(V∞)[[X]]→OB⁺_dR,log(V∞)` is a filtered isomorphism with `X` in degree one (DLLZ, Proposition 2.3.15, pp.18–19; Pan II, (6.3.3), p.100). `panLogPeriod_connection`: `∇_log` is a log connection, `B⁺_dR`-linear, satisfying `∇_log(j(f))=j_*(df)` on finite-level functions, with `∇_log(j(q))=j(q)·dlog(q)` at a cusp, and the Poincaré sequence `0→B⁺_dR→OB⁺_dR,log→OB⁺_dR,log⊗Ω¹_{V₀}(D)→0` is exact and strict, with `Ω¹_{V₀}(D)` in degree one (DLLZ, Corollary 2.4.2, pp.20–21; Pan II §6.3.6, pp.99–100). `panLogPeriod_faltings`: taking `gr¹` gives the logarithmic Faltings extension `0→Ô(1)→gr¹OB⁺_dR,log→Ô⊗Ω¹_{V₀}(D)→0` (DLLZ, Corollary 2.4.5, p.21; Pan II (6.3.2), p.100), and its `i`-th symmetric power filters `gr^i` with graded pieces `Ô(j)⊗Ω¹_{V₀}(D)^{⊗(i−j)}`, `j=0,…,i`. Ordinary period sheaves come from PadicHodgeTheory Layer 2; the cusp monoid relation in the period sheaf, the pro-Kummer projection and this logarithmic extension are constructed here over the supplied log structures and Kummer-étale site.

**Checks.**

- On the local formal-coordinate presentation `B_dR⁺[[X]]`, reduction sends `X` to zero but `X` is nonzero modulo the square of the full kernel. Keeping only the structure quotient loses the extension.
- Normalize the local lift so `∇log(X)` is the chosen generator of `Ω¹(D)`; then `∇log(1)=0` and `∇log(X²)=2X∇log(X)`. These equations fix the direction of the connection.
- On a cusp chart `∇_log(j(q²))=2j(q)∇_log(j(q))=2j(q)²dlog(q)`. The differential `dlog(q)` has residue 1, whereas dlog of the constant unit 1 has residue 0. Replacing `Ω¹(D)` by regular differentials at the cusp fails the residue test.

*Needs:* PrismaticCohomologyPartIV §8.60 (shared log structures, logification, pullback, integral fs charts and Kummer-étale site on locally noetherian fs spaces); AdicSpacesPartIII F0 and AdicSpacesPartII R0 cusp charts, completed monoid algebras and continuous logarithmic differentials; AdicEtaleGeometry A1 corrected inverse-limit covers; PadicHodgeTheory §§2.1–2.7 period sheaves and completed local Poincaré calculations; Layer 6.2 geometric tower, flag basis and finite-level descent; CompletedCohomologyPartII §§8.4, 8.6–8.7 cohomological realization and transported actions; EnhancedDerivedSheaves E2/E4 sheafification and filtered descent. The pro-Kummer tower and logarithmic extension are constructed in this subsection, with their stated chart range.

### 6.2 Affinoid-perfectoid flag basis for the modular-curve tower

**Shared small-Hasse canonical subgroups** (`smallHasseCanonicalSubgroups`). Let `R` be a p-adically complete flat algebra over the completed cyclotomic integers `ℤ_p^cycl`, containing the fractional powers of `p` used below. For an abelian scheme `A/R` of dimension `g`, `m≥1` and rational `0≤ε<1/2`, assume `Ha(A)^((p^m−1)/(p−1))` divides `p^ε` modulo `p`. Construct the unique finite flat subgroup `C_m⊂A[p^m]` whose reduction modulo `p^(1−ε)` is `ker F^m`, of rank `p^(mg)`. Prove flat base change and isomorphism compatibility. For p-complete `ℤ_p^cycl`-flat test algebras `R′`, sections congruent to zero modulo `p^((1−ε)/p^m)` belong to `C_m(R′)`; equality holds when `R′` is integrally closed in `R′[1/p]`.

Under the strong bound `Ha(A)^(p^m)|p^ε`, prove nesting and functoriality for homomorphisms of abelian schemes with strong level `m`. If `A` has strong level `a`, then `A/C_a` has strong level `b` exactly when `A` has strong level `a+b`; in that range `0→C_a→C_{a+b}→C_b(A/C_a)→0` is exact. A principal polarization makes `C_m` isotropic. The API comprises `smallHasseCanonicalSubgroups_reduction`, `smallHasseCanonicalSubgroups_unique`, `smallHasseCanonicalSubgroups_baseChange`, `smallHasseCanonicalSubgroups_points`, `smallHasseCanonicalSubgroups_quotient` and `smallHasseCanonicalSubgroups_polarization` with these hypotheses. This is the shared abelian-family subgroup; the modular tower uses its dimension-one specialization.

Use the supplied finite-flat homomorphism obstruction and Hasse invariant: the weak bound kills the co-Lie obstruction for the Frobenius kernel. Uniqueness follows from the homomorphism estimate with `1−ε>ε`, independently of any point characterization over nonnormal rings. Reduction then gives the strong quotient identities and polarization compatibility.

(Scholze, *On torsion in the cohomology of locally symmetric varieties*, preprint III §2, Theorem III.2.1, Corollaries III.2.2 and III.2.6, Lemma III.2.4, Definition III.2.7 and Proposition III.2.8, pp.31–35; point equality uses the stated integral-closedness hypothesis.)

**Checks.**

- On the ordinary locus, `C_m` is the multiplicative subgroup of rank `p^(mg)`; the étale subgroup has the wrong Frobenius-kernel reduction.
- At `m=1` the weak Hasse exponent is 1; at `m=2` it is `p+1`. The strong level-two quotient identity uses the level-one subgroup of `A/C₁`.
- At `p=2`, `m=1`, `ε=0`, let `R′={(a,b)∈O_C² : a≡b mod 2}`. On an ordinary elliptic curve, `C₁=μ₂`, and `s=(−1,1)` belongs to it. But `s−1=(−2,0)` is not divisible by `√2` in `R′`, since the coordinate difference of `(-√2,0)` is not divisible by 2. Point inclusion can therefore be strict over a nonnormal test ring; uniqueness and existence still apply at `p=2`.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.6.6 (`illusieObstructionHomomorphisms`), R07.2.21 (Hasse invariant); AbelianSchemesAndArithmeticModuli A0–A4; PELModuli M3 (abelian quotients and polarizations); DerivedModuleAlgebra §§0.4, 0.8 (cotangent complexes).

For tame level `K^p⊂GL₂(A_f^p)` contained in the full level-`N` subgroup for some `N≥3` prime to `p`, construct `panModularTower`, the geometric compactified perfectoid tower

```text
X_{K^p,C} ∼ lim_{K_p} (X_{K^pK_p} ×_{ℚ_p} C),    π_HT : X_{K^p,C} → Fl=P¹_C.
```

Retain the full finite-level component system. The right `GL₂(ℚ_p)` level action is over `C`; the `G_{ℚ_p}` action is semilinear over its action on `C`, commutes with level and tame Hecke actions, and makes `π_HT` Galois-equivariant. The level-equivariance uses the corresponding action on quotient lines in `P¹_C`. The cyclotomic presentation over `ℚ_p^cycl` is separate: the full similitude action changes its structural morphism, so a single fixed-pairing component base-changed through one embedding does not supply the full geometric action. Assemble all finite-level pairing components before geometric base change.

Use ModularCurvesPartII §3.15 `contractionMapsBetweenLevels` and §4.11 `fixedPairingIntegralComponents` for the finite-level compactified curves and maps. Prove the perfectoid-limit assertion and cusp charts using the shared small-Hasse subgroup above, and glue the Hodge–Tate maps with level and field compatibility. On a finite-level affinoid `V₀/K`, identify the geometric inverse image with the completed tilde-limit of `V_{K_p,L}` over finite `L/K` in `C` and open `K_p`; as a pro-Kummer object this is exactly the field-varying presentation of §6.1. The identification preserves the projections, completed `O_C`-algebras, period sheaves and commuting actions. Use `X_{K^p}=X_{K^p,C}` throughout §§6.1 and 6.11a–6.15, with the `O_C`-almost structure. CompletedCohomologyPartII §§8.4, 8.6–8.7 supplies the cohomological realization and transported actions. Then construct the basis and its properties. (Pan I §4.1, Theorems 4.1.2 and 4.1.7, pp.33–36; Pan II §3.3.1, pp.23–24; Scholze, Theorem 3.1.2(i)–(iii) and footnote 7, pp.971–972.)

```text
panBasis : Set (Opens Fl)
  x := e₂/e₁                       the standard coordinate, e₁, e₂ the images of the standard basis in ω
  U₁ := {|x| ≤ 1},  U₂ := {|x| ≥ 1}  the two standard closed unit charts
  panBasis := nonempty finite intersections of rational subsets of U₁ or of U₂, together with the empty open
panBasis_isBasis      : panBasis is a basis of the topology of Fl, stable under binary and nonempty finite intersections
panBasis_perfectoid   : ∀ U ∈ panBasis, π_HT⁻¹(U) is affinoid perfectoid
panBasis_finiteLevel  : ∀ U ∈ panBasis, ∃ K_p ⊆ GL₂(ℤ_p) open and an affinoid V_{K_p} ⊆ X_{K^pK_p} with
                        π_HT⁻¹(U) the inverse image of V_{K_p}, and the map
                        colim_{K'_p ⊆ K_p} H⁰(V_{K'_p}, O) → H⁰(π_HT⁻¹(U), O) has dense image
panBasis_inter        : for U, U' ∈ panBasis, π_HT⁻¹(U ∩ U') = π_HT⁻¹(U) ∩ π_HT⁻¹(U'), a rational localization
                        of each, again affinoid perfectoid
```

Prove `panBasis_isBasis` from the description of rational subsets of `P¹` and closure of the generating family under binary intersection. Prove `panBasis_perfectoid` and `panBasis_finiteLevel` for `U₁` and `U₂` from the tower's construction, and pass to rational subsets and their nonempty finite intersections by the rational-localization theory of perfectoid spaces: a rational subset of an affinoid perfectoid space is affinoid perfectoid, and it is the inverse image of a rational subset at sufficiently small finite level. Equivariance of `π_HT` transports inverse images under `g∈GL₂(ℚ_p)`, which is how translates of basis opens are used later. Identify the pushforward along `π_HT` of the period sheaves with the sheaves on the étale flag site used below. The perfectoidness of these particular inverse images and their finite-level descent are the targets here, not a claim about inverse images under arbitrary maps to a flag variety. (Scholze, On torsion in the cohomology of locally symmetric varieties, Theorem 3.1.2(i)–(iii), pp.971–972, genus `g=1`; Pan II §3.2, p.19, and Lemma 7.2.6, p.120.)

**Checks.**

- The two standard charts cover `P¹_C`, and neither covers alone: 0 lies in `U₁` but not in `U₂`, and `∞` lies in `U₂` but not in `U₁`.
- Their intersection is the annulus `|x|=1`, which lies in the basis; a family consisting of `U₁` and `U₂` alone is not stable under intersection and fails `panBasis_isBasis`. The inverse image of the annulus is affinoid perfectoid as a rational localization of both inverse images.
- For `U=∅`, both the finite-level colimit and the infinite-level section ring are zero, and the dense map is surjective. For any basis open, any analytic section and any positive error tolerance, the density theorem supplies a finite-level function approximating it. This uses completion of the colimit and does not assert nonsurjectivity.
- At a cusp the perfectoid tower chart adjoins all compatible `p`-power roots of the Tate parameter; its transitions and Hodge–Tate map agree with the finite-level cusp maps.
- Changing the Weil pairing by a determinant with nontrivial cyclotomic action moves its pairing component; the full `C`-tower retains that component, and its level action commutes with Galois.
- On every `V₀/K`, the field-varying pro-Kummer limit and the inverse image in `X_{K^p,C}` have the same completed section algebra and `O_C`-almost ideal.
- The nullary intersection is `P¹_C` and is excluded: its finite-level inverse image is a proper compactified curve, which is not affinoid. The empty open remains in the basis.

*Needs:* ModularCurvesPartII §§3.15, 4.11 finite-level compactified curves and maps; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 for the finite flat groups in the genus-one construction; AdicSpacesPartII R0 rational localization and finite-level affinoid charts; PerfectoidSpaces P2 for rational localization and P3.21 for almost acyclicity; AdicEtaleGeometry A1 inverse systems. The affinoid-perfectoid basis theorem and its period-sheaf descent are constructed here.

### 6.3 Relative filtered comparison adapter

Let `K` be a complete discretely valued field of characteristic zero with perfect residue field `k₀`, use the `θ̃`-augmented period diagram, crystalline envelope and fixed `O_K→B_dR,GR⁺` of Layer 2.18, and let `f:X→Y` be a proper smooth morphism of smooth formal `O_K`-schemes with `Y=Spf R` affine; write `R_K=R[1/p]`. Let `T` be a crystalline `ℤ_p`-lisse sheaf on the generic fibre `X_η` and `(E,φ_E)` its associated analytic prismatic F-crystal on `X`, with associated perfect crystalline coefficient `E′=perfectCrystallineRealization(analyticToPerfect E)` on `X_{p=0,crys}` and filtered vector bundle with integrable relative connection `(E,∇_{X_η/Y_η})` on `X_η`. Take a perfect prism `(A,I)` in the absolute prismatic site `Y_Δ`, p-completely flat over `(A_inf,([p]_q))` with `q=[ε]` for a compatible system `ε` of p-power roots of unity in `O_C^♭`. Put `Ā=A/I`, so its structural map is `α:R→Ā`. Choose an auxiliary lift `s:R→A⊗_{W(k₀)}O_K` whose composite with `a⊗b↦ā·α(b)` is `α`, using the GR coefficient inclusion on `W(k₀)`. The quotient augmentation `A→Ā`, this lift and the period scalar map are distinct. Put `B_dR⁺(A)=(A[1/p])^∧_I` and `B_dR(A)=B_dR⁺(A)[1/I]`; at `(A,I)=(A_inf,(ξ̃))` these are the GR period rings. Transport the entire diagram, scalar lifts, twists and crystalline maps by `F_GR` before comparison with §0.1. The lift and the compatible `O_K` period scalar structure give `R_K→B_dR(A)`. The geometric test object is `U=Spf(Ā)_η` over `Y_η`. Define its completed constant coefficient ring `C_p(U)=H⁰(U,Ẑ_p)=lim_m H⁰(U,ℤ/p^m)`, with its canonical map to `B_dR(A)`; here `Ẑ_p=lim_m ℤ/p^m` on the pro-étale site.

```text
relativeFilteredComparison :
  the base change to B_dR(A) of the étale–crystalline comparison of Guo–Reinecke Theorem 9.15 for T
  underlies a filtered isomorphism
      RΓ_dR(X_η/Y_η, E) ⊗_{R_K} B_dR(A)  ≃  RΓ(X_{Ā[1/p]}, ét, T) ⊗_{C_p(U)} B_dR(A)
  C_p(U)                  : lim_m H⁰(U,ℤ/p^m), the sections of the completed constant sheaf
  filtration on the right : induced by the `I`-adic filtration of B_dR⁺(A)
  filtration on the left  : the tensor product of the Hodge filtration of the relative de Rham cohomology
                            of (E, ∇_{X_η/Y_η}) with the `I`-adic filtration
relativeFilteredComparison_functorial :
  the isomorphism is functorial in (A, I) ∈ Y_Δ together with the section, hence an isomorphism of
  filtered sheaves  Rf_{dR,*}(E, ∇) ⊗_{O_{Y_η}} B_dR |_{Spf(Ā)_η}  ≃  Rf_{η,*}T ⊗̂_{ℤ_p} B_dR |_{Spf(Ā)_η}
relativeFilteredComparison_canonical :
  after tensoring with the structural de Rham period sheaf OB_dR,Y, the section disappears: a natural filtered
  isomorphism of complexes on Y_{η,proét}
      Rf_{dR,*}(E, ∇) ⊗_{O_{Y_η}} OB_dR,Y  ≃  Rf_{η,*}T ⊗̂_{ℤ_p,Y_η} OB_dR,Y
  in each degree i for which R^i f_{η,*}T is lisse, compatible with the connections
  (Gauss–Manin ⊗ 1 + 1 ⊗ ∇ on the left, 1 ⊗ ∇ on the right)
```

Prove the first statement by comparing, through explicit local Čech–Alexander and Koszul constructions, the étale–crystalline comparison with the de Rham comparison of the structural period sheaf, which is filtered: the comparison factors through `RΓ((X_Ā/A)_Δ,analyticToPerfect E)⊗_A B_dR(A)`, the crystalline cohomology of `E′` on `X_{Ā/p}` over `A_crys(Ā/p)`, and `RΓ(X_{Ā[1/p],proét},OB_dR⊗dR(E))`. The crystalline-to-infinitesimal base change of Layer 2.22 identifies the crystalline and infinitesimal sides with their connections. The canonical form uses the crystal condition of `Rf_{p=0,crys,*}E′` and Griffiths transversality of the relative Hodge filtration to identify the two filtered scalar extensions `RΓ_dR⊗_{R_K}B_dR(A)⊗_{B_dR(A)}OB_dR(A)` and `RΓ_dR⊗_{R_K}OB_dR(A)`, the second through the canonical map `R_K→OB_dR,Y(A)`. Keep the relative connection in the comparison, and keep the section as part of the functorial data before the `OB_dR` extension. Guo–Reinecke Remark 10.14 states the canonical form as a filtered isomorphism; its degreewise compatibility with the connections is an additional target here, assuming `R^if_{η,*}T` is lisse in every degree used. The general filtered isomorphism retains the full range of Theorem 10.13/Remark 10.14. Prove the additional connection assertion from their identification of the comparison with Scholze's relative de Rham comparison (Guo–Reinecke, p.100), for which the associated filtered module with integrable connection of `R^if_*T` is `R^if_{dR,*}(E)` (Scholze, p-adic Hodge theory for rigid-analytic varieties, Theorem 8.8(ii), p.52).

The analytic F-crystal input, its `analyticToPerfect` extension and `perfectCrystallineRealization` are constructed in §2.24: analytic prismatic F-crystals on smooth formal `O_K`-schemes, their equivalence with crystalline `ℤ_p`-lisse sheaves, and the relative étale–crystalline comparison of Guo–Reinecke Theorem 9.15 over a base `Y`. The equivalence for the single base `Spf O_K` alone is insufficient for these relative inputs.

**Checks.**

- For `Y=Spf O_K`, `X=Y`, `f` the identity and `T=ℤ_p`, both sides are `B_dR(A)` in degree zero and both filtrations are the `I`-adic filtration, so the isomorphism is the identity of `B_dR(A)`; a version that convolved with a nontrivial Hodge filtration on the trivial bundle would shift the filtration and fail.
- For `T=ℤ_p` and `f` a proper smooth curve of genus `g` over `Y=Spf O_K`, the left side has Hodge filtration with graded pieces of ranks `1,g,g,1` in degrees `0,1,1,2` (`H⁰`, then `H¹` split as `Fil¹` of rank `g` and `gr⁰` of rank `g`, then `H²`), and for `A=A_inf` with the canonical section the filtered isomorphism gives `H¹_ét` the Hodge–Tate weights 0 and `−1`, each with multiplicity `g`, in the convention of Layer 0.4 (as in Layer 4.12); an unfiltered isomorphism cannot see this.
- The lift `R→A⊗_{W(k₀)}O_K` is part of the data of the first two statements: two sections differing by a nonzero derivation give scalar extensions `R_K→B_dR(A)` that differ, and only the `OB_dR` form is independent of the section.
- For `K=ℚ_p(√p)`, `X=Y=Spf O_K` and `(A,I)=(A_inf,(ξ̃))`, `Ā=O_C` and the auxiliary lift exists. There is no `O_K→A_inf` over `ℤ_p`: `b²=p` would force `b=pz` by reduction in the domain `O_C^♭`, and then `pz²=1`. The geometric point is formed over `Ā[1/p]=C`.
- On `U=Spa(Cont(ℤ_p,C),Cont(ℤ_p,O_C))`, the function `s↦s` gives compatible sections modulo every `p^m`, hence a section of `Ẑ_p`. It is not locally constant. The coefficient ring must retain this section.

(Guo–Reinecke, Convention 10.12, Theorem 10.13 and Remark 10.14, pp.99–100; Construction 10.15, p.100; §6.1, p.55, for derived p-complete lisse coefficients; Theorem 9.15, p.92; Scholze, p-adic Hodge theory for rigid-analytic varieties, Theorem 8.8, pp.51–52.)

*Needs:* Layer 2.24 (Relative analytic prismatic F-crystals); Layer 2.18 (Relative `B_dR⁺` infinitesimal site); Layer 2.22 (Relative crystalline–infinitesimal base change); PadicHodgeTheory §§2.1–2.7; PadicHodgeTheory §§7.1–7.3.

### 6.4 Naturality, scalar extension and cup products

For smooth proper algebraic varieties over `K`, show the total de Rham comparison `c_dR` is a graded `B_dR`-algebra isomorphism. Prove its naturality for morphisms, compatibility with every finite extension `K′/K` inside `C`, and compatibility with the Künneth external product for `X×_K Y`. All maps refer to the comparison already identified with the canonical deformation construction.

On integral, crystalline and prismatic objects, require the corresponding enhanced product and completed Künneth theorems in the common source range before asserting the analogous diagram. Cup products in cohomological degrees `i,j` carry the usual `(−1)^{ij}` interchange sign. The result does not enlarge the product scope of the semistable `A_cris` map. Extend the smooth coherent comparison through the actual scalar functors, so naturality is a commutative square of morphisms, not an equality of ranks.

(Betts–Stix, Proposition 3.19, p.27.)

*Needs:* Layer 2.13 (Filtered de Rham comparison over `K`); Layer 2.17 (Agreement of integral and rational period maps); Layer 1.9 (Multiplication and Bockstein coherence); EnhancedDerivedSheaves `E4`; ClassicalAdicEtaleCohomology §§8.2, 9.5, 9.7, 11.1.

### 6.4a Algebraic de Rham trace, Gysin and cycle maps

For every smooth proper pure-dimensional `X/K` of dimension `d`, allowing disconnected and geometrically disconnected `X`, construct `algebraicDeRhamTrace : H_dR^{2d}(X/K)→K` and its perfect Poincaré pairing. After a finite splitting extension, sum the coherent traces on `H^d(X_j,Ω_{X_j}^d)` of the geometric components and descend; prove independence of the splitting extension. In dimension zero, the trace on `Spec L` for finite separable `L/K` is `Tr_{L/K}`. Normalize it by `tr(c₁(O(1)))=1` on `P¹`. Use SchemeAndStackFoundations Layer 2’s coherent duality and the de Rham differential's compatibility with its trace to obtain the trace on hypercohomology.

For proper maps between smooth proper pure-dimensional varieties, construct graded pushforward as the adjoint of pullback under these perfect pairings. Construct regular-immersion Gysin maps with purity and cycle classes by resolving the support and pushing forward its fundamental class. Prove independence of resolution, composition, base change in the transverse range, the projection formula and the self-intersection formula with the normal-bundle Euler class. Identify that Euler class with the top Chern class in §6.8. Construct the de Rham first class by dlog and prove its divisor/Gysin identification, so §§6.5–6.7 use the same maps. The range here is smooth proper characteristic-zero algebraic varieties; no nonproper trace is asserted.

**Checks.**

- On `P¹`, the trace of `c₁(O(1))` is 1.
- On `Spec K` in dimension zero the trace is the identity of `K`.
- A degree-`m` closed point `Spec L→P¹` has cycle class with trace `m`; for a quadratic extension the trace on `H⁰_dR(Spec L/K)=L` sends 1 to 2.
- For a rational point `i:Spec K→P¹`, `i_*1=c₁(O(1))`; pairing it with 1 has trace 1, fixing the Gysin normalization.

(Betts–Stix, Proposition 3.20(5)–(7), proof pp.27–28, using coherent duality and the resolution characterization of cycle classes.)

*Needs:* SchemeAndStackFoundations Layer 2 coherent duality and trace; AlgebraicModuliForArithmeticGeometry §§9.4–9.7 resolution; AdicSpacesPartIII §§R3.6–R3.7 proper GAGA; DerivedDeRhamCohomology proper smooth de Rham complexes and products. The de Rham trace, duality, pushforward, Gysin and cycle constructions are targets of this subsection.

### 6.5 Trace-normalized Tate period

For the Betts–Stix comparison `c_dR`, construct the unique `G_K`-equivariant filtered `B_dR`-linear isomorphism `a:B_dR(−1)≃B_dR⟨−1⟩` that makes the trace square on `P¹` commute. Define a filtration shift by `Fil^i(V⟨n⟩)=Fil^{i+n}V`. The degree-two trace generator on `P¹` determines `a`; this normalization is retained in all subsequent class comparisons.

For smooth proper geometrically connected `X/K` of dimension `d`, prove compatibility of the étale trace to `ℚ_p(−d)`, the de Rham trace to `K⟨−d⟩` and `a^{⊗d}`. Extend this trace compatibility to every smooth proper pure-dimensional `X` by finite scalar extension, summing geometric-component traces and descending as in §6.4a; this includes the trace on any finite separable `Spec L`. The `d=0` point case has no twist, and `d=1` recovers the defining `P¹` square. Equality of `a` with the canonical Fontaine period is not supplied by the source, whose Remark 3.21 leaves it unproved. None of the following conclusions needs that extra identification.

The scalar API `tracePeriod_spec` is the defining `P¹` trace equality, `tracePeriod_unique` identifies any unit satisfying that equality with the selected unit, and `tracePeriod_pow_zero` fixes the untwisted exponent. These scalar statements use the chosen generator; the filtered equivariant line statement remains the invariant formulation above.

**Checks.**

- For a zero-dimensional geometrically connected point the factor is `a⁰=1`, so no Tate-period correction appears.
- On `P¹`, for its degree-two generator with étale trace 1, the de Rham trace after comparison is the scalar `a`, by `tracePeriod_spec`.
- With scalar factor `a=2`, multiplying an untwisted degree-two class by `a` gives `2`, whereas multiplication by `a⁻¹` gives `1/2`. Their inequality detects reversal of the twisted-to-untwisted conversion; this is a normalization computation, not a claim that the actual period equals 2.

(Betts–Stix, Proposition 3.20(5) and proof; Remark 3.21, pp.27–28.)

*Needs:* Layer 6.4a (Algebraic de Rham trace, Gysin and cycle maps); Layer 6.4 (Naturality, scalar extension and cup products); EtaleCohomologyFoundations §§0.9–0.11, F.6; CrystallineCohomology §CR.3:duality.1; AlgebraicModuliForArithmeticGeometry §§9.4–9.7; SchemeAndStackFoundations §§5.4–5.6.

### 6.6 Duality, cycles and Gysin compatibility

For smooth proper geometrically connected `X/K` of dimension `d`, compare the perfect Poincaré pairings in degrees `i` and `2d−i` using `c_dR` and `a^{⊗d}`. For a codimension-`r` algebraic cycle `Z`, prove `(c_dR⊗a^{⊗−r})cl_ét(Z)=cl_dR(Z)` in `H_dR^{2r}(X)⟨r⟩⊗B_dR`. The inverse power of `a` changes the cycle twist in the direction fixed by the trace normalization.

Also prove compatibility with proper pushforward and regular-immersion Gysin in the supplied duality and purity range. This extension uses the named trace, purity and Gysin maps in the two theories; the source's pairing and cycle assertions alone do not state every pushforward square. No trace theorem for arbitrary nonproper spaces is introduced. In codimension zero the fundamental class tests the trace convention, and in codimension one the comparison feeds the first Chern class calculation.

(Betts–Stix, Proposition 3.20(6)–(7) and proof, pp.27–28.)

*Needs:* Layer 6.4a (Algebraic de Rham trace, Gysin and cycle maps); Layer 6.5 (Trace-normalized Tate period); Layer 6.4 (Naturality, scalar extension and cup products); EtaleCohomologyFoundations F.5–F.6; EtaleCohomologyFoundations F.6; EtaleDualityAndPerverseSheaves §§1.1–1.3; CrystallineCohomology §CR.3:duality.1; AlgebraicModuliForArithmeticGeometry §§9.4–9.7; SchemeAndStackFoundations §§5.4–5.6; EtaleCohomologyFoundations §§0.9, F.6.

### 6.7 First Chern class comparison

For a line bundle `L` on smooth proper `X/K`, compare its étale Kummer class `c₁(L)∈H²_ét(X_C,ℚ_p(1))` with its de Rham dlog class in `Fil¹H²_dR(X)`. The rational de Rham map uses `c_dR⊗a⁻¹`. In the common smooth proper formal/prismatic range, include the crystalline PD and prismatic logarithmic classes with their exact supplied twist lines and Frobenius-linearized maps.

Give a proper proof of the line-bundle comparison by compactifying its total space to `P(O⊕L)` and using the section Gysin class, self-intersection and projective-bundle formula. This avoids applying a proper cycle theorem directly to a nonproper total space. Establish the comparison on the section and descend its difference through the bundle formula to `c₁(L)` on `X`. Canonical-`t` normalization and unrestricted integral log-semistable products are separate assertions and are not used here.

(Betts–Stix, Proposition 3.20(8), final proof paragraph, p.28.)

*Needs:* the bundle-decomposition construction at the start of Layer 6.8; Layer 6.4a (Algebraic de Rham trace, Gysin and cycle maps); Layer 6.6 (Duality, cycles and Gysin compatibility); Layer 1.7 (Prismatic Frobenius pullback); Layer 1.8 (Crystalline–de Rham overlap square); EtaleCohomologyFoundations F.6; EtaleDualityAndPerverseSheaves §§1.1–1.3; EtaleDualityAndPerverseSheaves §4.4; SchemeAndStackFoundations §§5.4–5.6; Layer 1.11 (Syntomic coefficients and classes); PadicHodgeTheory §§2.1–2.7; EtaleCohomologyFoundations §0.9; EtaleCohomologyFoundations F.7.

### 6.8 Higher Chern and projective bundle comparison

Construct the crystalline projective-bundle decomposition for a rank-`n` vector bundle on a smooth proper special fibre over a perfect field, using CrystallineCohomology §CR.3.3’s first class, CR.3 proper base change and CR.3.5’s projective-space calculation. The powers of `h=c₁(O(1))` give the summands; check the isomorphism on geometric fibres by proper base change. Define higher crystalline `c_r(E)` by the quotient-line projective relation, and prove pullback, Whitney sum, duality and flag-pullback injectivity. Construct the corresponding algebraic de Rham bundle decomposition and higher classes from §6.4a’s first class, proper de Rham base change and the projective-space calculation. Identify the normal-bundle Euler class of §6.4a with its top Chern class. Using §1.11’s first syntomic/prismatic class and projective-bundle splitting, define higher prismatic Chern classes by the quotient-line projective relation in the specified Breuil–Kisin twists. Prove pullback, Whitney sum, duality and flag-pullback injectivity before the higher-class comparison. The syntomic-to-prismatic class map is `Prismatic.Syntomic.syntomicToFil` followed by `can`, with products transported through §1.11’s fibre-sign equivalence. These constructions precede the splitting comparison.

For a rank-`n` vector bundle `E` on smooth proper `X` in the common comparison range, prove compatibility of every `c_r(E)`, with twist `r`. Pull back to the complete flag bundle, write the Chern classes as elementary symmetric polynomials in the first classes of the line quotients, and use the iterated projective-bundle formula to prove pullback injective. The first-class comparison and multiplicativity then descend the higher-class identity to `X`.

Use the quotient-line convention: for `h=c₁(O(1))` the projective-bundle relation is `h^n−c₁(E)h^{n−1}+⋯+(−1)^n c_n(E)=0`. Transport a supplier using the sub-line convention explicitly before comparing its classes. In rank one this reads `h=c₁(E)`, and for the trivial rank-two bundle `h²=0` on its `P¹` fibre. These two cases fix the direction and signs independently of the splitting argument.

Write `projectiveBundleRelation n c` for the polynomial `Σ_{i=0}^{n}(−1)^i c_i h^{n−i}` in `h`, with `c₀=1` and `c_i` the classes supplied by the étale owner or constructed here; the theorem says it vanishes at `h=c₁(O(1))` in each theory, and the comparison maps send one relation to the other.

**Checks.**

- In rank one, `projectiveBundleRelation 1 c` is `h−c₁`, so `h=c₁(E)`; the sub-line convention would give `h+c₁` and fails.
- For the trivial rank-two bundle (all `c_i=0` for `i≥1`) the relation is `h²`, the relation of `P¹`.
- For `E=L⊕M` of rank two the relation is `h²−(c₁(L)+c₁(M))h+c₁(L)c₁(M)=(h−c₁(L))(h−c₁(M))`, whose roots are the first classes of the two line quotients, as the splitting argument requires.

(Betts–Stix, Proposition 3.20(8) and proof, p.28.)

*Needs:* for the bundle/class construction, Layer 6.4a (Algebraic de Rham trace, Gysin and cycle maps); for the subsequent class comparison, Layer 6.7 (First Chern class comparison) and Layer 6.4 (Naturality, scalar extension and cup products); EtaleDualityAndPerverseSheaves §4.4; SchemeAndStackFoundations §§5.4–5.6; Layer 1.11 (Syntomic coefficients and classes); CrystallineCohomology `CR.3`; CrystallineCohomology §§CR.3.3, CR.3.5 and CR.3 proper base change; DerivedDeRhamCohomology proper de Rham base change; EtaleDualityAndPerverseSheaves §§1.1–1.3; EtaleCohomologyFoundations F.7.

### 6.9 Geometric arithmetic export

Return the specified comparison maps, rather than only admissibility labels, to arithmetic consumers. A proper smooth good-reduction model supplies the crystalline realization with `φ` and filtered de Rham comparison. A proper semistable model supplies the semistable realization with `N`. A proper smooth rigid space descending to `K`, with countable perfect residue field and `C=widehat(K̄)`, supplies the potential realization with its `F^{nr}` and `G_K` data.

The returned interface includes scalar maps, filtration, duality, Tate/Breuil–Kisin twists and the map identities that identify cohomological classes. Small-weight integral applications retain the unramified base and interval restrictions, or the height/ramification assumptions of the Breuil–Kisin branch. A generic de Rham representation does not acquire a crystalline model from this export. Automorphic applications consume the appropriate realization only after verifying the geometric hypotheses.

(Colmez–Nizioł, Theorems 6.4, 6.8 and proof, pp.40–42.)

*Needs:* Layer 3.5 (Crystalline representation export); Layer 4.3 (Semistable period comparison); Layer 4.10 (Proper rigid `C_st` comparison over `K`); Layer 5.10 (Small-weight integral arithmetic interface); Layer 6.6 (Duality, cycles and Gysin compatibility).

### 6.10 Habiro and trace specialization export

Supply the coefficient dictionary and the commuting integral/class comparison maps to Habiro specialization and trace consumers. A specialization records the base prism or perfectoid ring, completion ideal, inversions, filtration and `BK/Tate` twist. Compare the `q=1`, p-adic and cyclotomic diagrams only after making the necessary scalar extensions and in the intersection of the source hypotheses.

The Habiro consumer proves its q-gluing and any analytic/algebraic comparison. The trace consumer constructs its own cyclotomic Chern character and trace-to-prismatic morphism; this roadmap provides the class-comparison diagram into which that morphism maps. No unconditional identification of cohomology theories before base change is part of the export. PrismaticCohomologyPartIII §7.0 supplies the graded Beilinson square; Layer 3 constructs its nearby-cycle corner identifications and transports the supplied homotopy, independently of the consumer’s character construction.

(Bhatt–Morrow–Scholze, Theorem 14.1, p.118; specialization picture §1.2, p.6.)

*Needs:* Layer 0.1 (Normalized specialization diagram); Layer 1.7 (Prismatic Frobenius pullback); Layer 6.7 (First Chern class comparison); Layer 6.8 (Higher Chern and projective bundle comparison).

### 6.11 Graded analytic vectors and decompletion

For `l>0`, let `χ̃_l:Z(U(gl₂(ℚ_p)))→ℚ_p` be the infinitesimal character of `Sym^(l−1)((ℚ_p²)∨)`. The centre acts through the differentiated `GL₂(ℚ_p)` action on locally analytic vectors; write `W^{χ̃_l}={w : z·w=χ̃_l(z)w for every z∈Z(U(gl₂(ℚ_p)))}` for its central eigenspace. For finite `K/ℚ_p`, let `K∞` be the maximal `ℤ_p`-extension of `K` inside `K(μ_{p∞})`, the fixed field of the kernel of the torsion-free cyclotomic projection. For each period representation `W`, the decompleted subspace is `(W^{G_{K∞}})^{G_K-an}`, imposing both conditions after taking the indicated level-analytic central eigenspace.

In Pan's fixed-tame-level modular-curve tower, take `U` in the basis `B` and a finite `K/ℚ_p` over which `G_K` acts on `O B_dR,k⁺(U)`. For `i≥0`, `k>i` and `l>0`, prove `gr^i` commutes with `GL₂(ℚ_p)`-locally analytic vectors, with the central `χ̃_l`-eigenspace, and with the decompleted subspace imposing both `G_{K∞}`-fixedness and `G_K` analyticity. The stabilized graded piece does not depend on the chosen truncation `k>i`.

Use the `i`-th symmetric power of the logarithmic Faltings extension to filter the decompleted piece. Its `j`-th graded term, for `j=0,…,i`, is `O_{K^p}^{la,χ̃_l}(U)_K(j)⊗_{O_{V₀}}Ω¹_{V₀}(C)^{⊗(i−j)}`. Prove locally analytic exactness and central `χ̃_l` decompletion for these period representations using the derived locally analytic operations of CompletedCohomologyPartII F.4, including the Galois-analytic condition. These are the representation-specific assertions of Pan II §§6.3.8–6.3.9, not consequences of ordinary fixed-vector exactness. Ordinary fixed vectors alone do not define this subspace. The logarithmic period sheaf, pro-Kummer projection and extension used here are the early modular-curve constructions of §6.1 over PrismaticCohomologyPartIV §8.60's shared log structures and Kummer-étale site.

**Checks.**

- At `l=1`, `χ̃₁` is the central character of the trivial algebraic representation; the condition is imposed on `Z(U(gl₂))` through differentiation.
- At `p=2`, `Gal(ℚ₂(μ_{2∞})/ℚ₂)` has a finite sign factor as well as its `ℤ₂` factor. The field `ℚ₂∞` is the `ℤ₂`-extension, so fixedness must not silently use the full cyclotomic field.
- At `k=i+1` the `i`-th graded piece is retained, while at `k=i` it is zero; taking graded pieces requires `k>i` even after the central and decompletion operations.

(Pan II, §1.2.2, p.6; §3.3.2, p.24; Proposition 6.3.9 and preceding paragraphs (§6.3.8), pp.100–101.)

*Needs:* Layer 6.1 (Logarithmic period construction on modular curves); CompletedCohomologyPartII §§8.4, 8.6–8.7.

### 6.11a Almost-integral modular comparison

**Compactification restriction at fixed exponent** (`panCompactificationRestriction`). For the full modular-curve tower of §6.2, write `X_{K^pK_p,C}` for the compactified curve and `Y_{K^pK_p,C}` for its open complement of the cusps. For every `m≥1` and `i≥0`, prove that restriction induces an isomorphism

```text
colim_{K_p} H^i_ét(X_{K^pK_p,C},ℤ/p^m) ≃ colim_{K_p} H^i_ét(Y_{K^pK_p,C},ℤ/p^m).
```

Use finite-level localization and the cusp Gysin maps, with their Tate twists. On a cusp chart `q=q′^e`, pullback multiplies the residue class by `e`; after sufficiently deep p-level its p-divisibility kills each boundary class at fixed exponent. The degree-two compactified colimit also vanishes, since cofinal transition degrees are divisible by arbitrarily large powers of `p` on every component. Prove compatibility with reduction in `m`, level and tame-level pullback, continuous Galois actions and tame Hecke correspondences. This identifies ordinary open completed cohomology with the compactified fixed-exponent colimits used by proper comparison.

(Pan I, §4.4.1, arXiv v3 p.47; finite-level localization and Gysin maps as in EtaleCohomologyFoundations §§F.5–F.7.)

**Checks.**

- In degree zero, restriction preserves the constant section on each geometric component.
- At finite level, a smooth compactified curve with `c>1` cusps has an extra residue subquotient of rank `c−1` in the open `H¹`; restriction is generally not an isomorphism there. For `q=q′^(p^r)` the transition on this residue is multiplication by `p^r`, hence zero modulo `p^m` once `r≥m`.
- Each compactified component has `H²=ℤ/p^m(−1)`; pullback through a covering of degree divisible by `p^m` is zero. Both degree-two colimits vanish, and all degrees above two vanish already at finite level.

For the geometric compactified perfectoid `C`-tower of §6.2, construct `panAlmostIntegralComparison`, natural in tame level and compatible with the commuting Galois, Hecke and level actions:

```text
H̃^i(K^p,O_C^a) ≃ H^i(X_{K^p},O_X^{+a}) ≃ lim_m H^i(X_{K^p},O_X^{+a}/p^m).
```

Retain the almost category, the p-adic topology and bounded p-primary torsion in each degree. First identify the open finite-coefficient realization supplied by CompletedCohomologyPartII §8.4 with the compactified colimit using `panCompactificationRestriction`. Compose with finite-level proper primitive comparison and infinite-level descent, using the supplied integral completed cochain model and coefficient interchange. Prove that the induced topology is the p-adic one and that the Tate-module obstruction in the inverse-limit universal-coefficient sequence vanishes by bounded-torsion control. Its API includes finite-coefficient reduction, compatibility in `m`, continuity and equivariance. This is the `k=1` input for the truncated-coefficient induction.

**Checks.**

- In degree zero the constant section 1 maps to 1 under both arrows and every finite-coefficient reduction.
- Since `A_inf,X/(ker θ)=O_X⁺`, at `k=1` the displayed theorem gives exactly the initial coefficient comparison of §6.12, before any truncated-period induction.
- On `H^{i+1}[p^m]` the inverse-system transition is multiplication by `p`; bounded torsion forces its inverse limit to vanish, rather than retaining an extra Tate-module term.

(Pan I, Corollary 4.4.3 and Lemma 4.4.4, published pp.43–45, arXiv v3 pp.47–48; Pan II, Lemma 7.2.5, p.119.)

*Needs:* Layer 6.2 (Affinoid-perfectoid flag basis for the modular-curve tower); ModularCurvesPartII §§3.15, 4.11 (cusp charts and level maps); EtaleCohomologyFoundations §§F.5–F.7 (localization, purity and Gysin maps); ClassicalAdicEtaleCohomology §§8.2, 9.7 (finite-coefficient comparison); PadicHodgeTheory §§2.1–2.7 finite-level proper primitive comparison; CompletedCohomologyPartII §§2.2–2.9, 4.3–4.5, 8.4, 8.6–8.7 completed cochains, torsion control and transported actions; EnhancedDerivedSheaves E2/E4 descent and completion; PerfectoidSpaces §P3.21 almost acyclicity.

<a id="cp6-pan-bounded-torsion-inverse-limit"></a>

### 6.12 Bounded torsion in truncated coefficients

Stable target identifier: `CP.6/pan-bounded-torsion-inverse-limit`.

For every fixed degree `i` and `k≥1`, prove `H^i(X_{K^p},A_inf,X^a/(ker θ)^k)` has p-primary torsion killed by a power `p^n`, and identify it with `lim_m H^i(X_{K^p},A_inf,X^a/((ker θ)^k,p^m))`. Keep the almost coefficient category and the p-adic completion in the statement.

The exponent `n` may depend on `i` and `k`. A bound uniform in all truncations or all degrees is not asserted. Prove the inverse-limit passage with the tower's torsion control, rather than an unjustified interchange of cohomology and an inverse limit. Work with the almost comparison before rationalization; an integral ordinary-module isomorphism is not obtained merely by omitting the superscript `a`.

(Pan II, Lemma 7.2.5 and proof, p.119.)

*Needs:* Layer 6.11a (`panAlmostIntegralComparison`); CompletedCohomologyPartII §§2.2–2.9; CompletedCohomologyPartII §§8.4, 8.6–8.7; AInfCohomology `AI.3`; PerfectoidSpaces `P3`; PerfectoidSpaces `P3/etale-almost-acyclicity`.

<a id="cp6-pan-completed-coefficient-and-flag-descent"></a>

### 6.13 Completed coefficient and flag descent

Stable target identifier: `CP.6/pan-completed-coefficient-and-flag-descent`.

At fixed tame level and `k≥1`, identify the completed `A_inf/(ker θ)^k` coefficient group with `lim_m H̃^i(K^p,Z/p^m)⊗_{ℤ_p}A_inf/((ker θ)^k,p^m)`. Apply CompletedCohomologyPartII §4.5’s coefficient interchange for complete p-torsion-free `ℤ_p`-modules to `M=A_inf/(ker θ)^k`, using its p-completeness and p-torsion-freeness and the supplied complete tower complex. The general coefficient theorem and complex are supplied there; the period specialization and flag descent are the targets here. The limit is over the finite coefficient quotients and retains the topology of the completed representation.

For the perfectoid modular curve and its Hodge–Tate map `π_HT` to the flag variety, prove `R^jπ_HT,*A_inf,X^a/(ker θ)^k=0` for `j>0`. This gives the resulting cohomology identification with `H^i(Fl,π_HT,*A_inf,X^a/(ker θ)^k)`. Use the affinoid-perfectoid inverse-image basis constructed for this tower, and the étale almost acyclicity theorem. Neither an arbitrary Shimura tower nor unrestricted ordinary integral pushforward is included.

(Pan II, Lemma 7.2.6 and proof, p.120.)

*Needs:* Layer 6.12 (Bounded torsion in truncated coefficients); CompletedCohomologyPartII §§4.3–4.5; CompletedCohomologyPartII §§8.4, 8.6–8.7; PerfectoidSpaces `P3`; PerfectoidSpaces `P3/etale-almost-acyclicity`; Layer 6.2 (Affinoid-perfectoid flag basis for the modular-curve tower); AInfCohomology `AI.3`.

### 6.14 Étale-site truncated period map

For `k≥1` construct the `G_Qp`-equivariant `B_dR,k⁺`-linear map `H̃^i(K^p,B_dR,k⁺)→H^i(Fl,B_dR,k⁺)` on the étale site. For each `k,m` choose a sufficiently long truncated Witt projection `φ_l:A_inf→W_l(O_C/p)` through which the quotient `A_inf→A_inf/((ker θ)^k,p^m)` factors. Use finite-level truncated Witt sheaves and the almost descent maps to construct compatible `g_{k,m}`.

Prove compatibility in both `k` and `m` before taking inverse p-adic limits and inverting `p`. The map modulo `t` is the `k=1` completed-`C` coefficient isomorphism of the tower. The required Witt truncation length `l` depends on the pair `(k,m)`; a single arbitrary short projection does not suffice. The target period sheaf on `Fl` is Pan's descended truncated sheaf with its specified Galois action.

(Pan II, Lemma 7.2.4 and proof, pp.118–120.)

*Needs:* Layer 6.11a (`panAlmostIntegralComparison`); Layer 6.12 (Bounded torsion in truncated coefficients); Layer 6.13 (Completed coefficient and flag descent); AInfCohomology `AI.3`; PerfectoidSpaces `P3`; Mathlib `WittVector`; PerfectoidSpaces `P3/etale-almost-acyclicity`; Layer 6.2 (Affinoid-perfectoid flag basis for the modular-curve tower); PadicHodgeTheory §§2.1–2.3; PadicHodgeTheory §§2.1–2.7.

### 6.15 Truncated period comparison

For every `k≥1` and every degree `i` in the modular-curve completed-cohomology setup, prove the map just constructed is an isomorphism of `B_dR,k⁺`-modules `H̃^i(K^p,B_dR,k⁺)≃H^i(Fl,B_dR,k⁺)`, natural and `G_Qp`-equivariant. Use the `k=1` comparison, the flat truncated period-sheaf filtration and the bounded-torsion/coefficient-limit results to propagate the comparison through the successive `t`-adic quotients.

Keep the truncation parameter `k` in the result. The theorem is the finite-period comparison of the specified tower and its flag sheaf; it does not by itself justify passage to unrestricted untruncated `B_dR⁺` cohomology. Locally analytic/decompleted refinements use the graded theorem above, with `k>i` when an `i`-th graded piece is taken. This distinction preserves the separate hypotheses of the two routed modular-curve results.

(Pan II, Proposition 7.2.3 and proof, p.118.)

*Needs:* Layer 6.11a (`panAlmostIntegralComparison`); Layer 6.14 (Étale-site truncated period map); CompletedCohomologyPartII §§8.4, 8.6–8.7; PadicHodgeTheory §§2.1–2.3; PadicHodgeTheory §§2.1–2.7.

### Examples

On `P¹` the trace of the hyperplane class is `1`. If its untwisted comparison image is `a` times the de Rham class, tensoring by `a⁻¹` gives equality; it does not make the untwisted image `a⁻¹` times the class. The scalar model `a=2` distinguishes `2` from `1/2`. At `r=0` the factor `a⁰` is `1`. The quotient-line projective relation in rank one is `h−c₁(E)=0`; on the fibre of the trivial rank-two bundle it is `h²=0`. In a cusp chart the logarithmic coordinate has residue 1 and the constant unit has residue 0. For truncated periods `gr^i(B_dR⁺/t^k)` is zero at `i≥k`, so the stabilization assertion must retain `k>i`.

### Dependencies

Layers 0–5; EtaleCohomologyFoundations F.5–F.7 and EtaleDualityAndPerverseSheaves §§1.1–1.3, 4.4 and AlgebraicModuliForArithmeticGeometry §§9.4–9.7 and SchemeAndStackFoundations §§5.4–5.6 for traces and cycles; the twist/class maps of §§1.7 and 1.11; EnhancedDerivedSheaves E4 for product and base-change coherence; CompletedCohomologyPartII §§2.2–2.9, 4.3–4.5, 8.4, 8.6–8.7; PrismaticCohomologyPartIV §8.60 for shared log adic structures and the Kummer-étale site; PerfectoidSpaces P3; AdicEtaleGeometry A1; AdicSpacesPartII R0; PadicHodgeTheory §§2.1–2.7. The pro-Kummer tower, logarithmic modular-curve periods and flag basis are local targets in this layer.

## Downstream consumers

HodgeTateAndCanonicalSubgroups may consume the modular-curve pro-Kummer projection and logarithmic Faltings extension of Layer 6, over PrismaticCohomologyPartIV §8.60's shared log adic structures and Kummer-étale site; its canonical-subgroup results do not enter this roadmap. PerfectoidShimuraVarieties may consume the genus-one flag-basis construction as its modular-curve case before constructing the higher-dimensional generalization. The comparison and gluing layer HQ.8 of HabiroCohomologyFoundations consumes the explicit `θ`, Witt and period maps and their commuting comparison squares; the q-deformed construction and gluing homotopies belong to that consumer. RefinedTraceMethods consumes the graded Beilinson square of Layer 3 and the specialization/Chern compatibility here, and constructs its cyclotomic trace square itself.

ArithmeticGaloisRepresentations, WeightsInEtaleCohomology and CompletedCohomologyPartII are built before this roadmap and do not depend on it; CompletedCohomologyPartII supplies its completed cohomology realizations and transported actions. The shared small-Hasse subgroup package, genus-one geometric tower and Hodge–Tate map, and Pan’s compactification restriction and almost-integral base comparison are constructed in §§6.2 and 6.11a. Geometric applications of those roadmaps use the realizations constructed here: the crystalline and potentially semistable realizations with their filtrations and Galois actions (the general representation theory stays in ArithmeticGaloisRepresentations), the proper finite-dimensional period realizations with the weight conventions fixed here, and Pan's finite-period and graded-decompletion comparisons for the completed cohomology of modular curves. Each export carries the source range: good reduction, vertical semistable, proper rigid over §4.8’s countable-residue base, or smooth proper algebraic, as stated in the relevant layer.

## References

Page locators use the particular public versions below, rather than a different journal pagination.

- Bhargav Bhatt, Matthew Morrow, Peter Scholze, *[Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3)*. arXiv:1602.03148v3 (2019), printed pagination.

- Kęstutis Česnavičius, Teruhisa Koshikawa, *[The `A_inf`-cohomology in the semistable case](https://arxiv.org/pdf/1710.06145v3)*. arXiv:1710.06145v3, printed pagination.

- Haoyang Guo, Emanuel Reinecke, *[A prismatic approach to crystalline local systems](https://arxiv.org/pdf/2203.09490v3)*. arXiv:2203.09490v3 (2023); source of published 2024 paper.

- Haoyang Guo, *[Crystalline cohomology of rigid analytic spaces](https://arxiv.org/pdf/2112.14304v1)*. arXiv:2112.14304v1 (2021).

- Pierre Colmez, Wiesława Nizioł, *[On the cohomology of p-adic analytic spaces, I: The basic comparison theorem](https://arxiv.org/pdf/2104.13448v3)*. arXiv:2104.13448v3; §2, Theorems 4.6 and 4.27 and Corollary 4.32.

- Lue Pan, *[On locally analytic vectors of the completed cohomology of modular curves](https://arxiv.org/pdf/2008.07099v3)*. arXiv:2008.07099v3; Corollary 4.4.3 and Lemma 4.4.4, pp.47–48 (published pp.43–45).

- Pierre Colmez, Wiesława Nizioł, *[On the cohomology of p-adic analytic spaces, II: The `C_st`-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf)*. Author manuscript CN5, 24 November 2024, published 2025.

- L. Alexander Betts, Jakob Stix, *[Galois sections and p-adic period mappings](https://www.math.uni-frankfurt.de/~stix/research/preprints/BETTS_STIX-GaloisSectionsPadicPeriods20220429.pdf)*. Author manuscript 29 April 2022, source of 2025 paper.

- Lue Pan, *[On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1)*. arXiv:2209.06366v1 (2022), source of published 2026 paper.

- Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, *[Cohomologie p-adique de la tour de Drinfeld : le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf)*. Author manuscript GPW5, source of 2020 paper.

- Bhargav Bhatt, Peter Scholze, *[Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4)*. arXiv:1905.08229v4, 12 January 2022, printed pagination.

- Peter Scholze, *[p-adic Hodge theory for rigid-analytic varieties](https://arxiv.org/pdf/1205.3463v2)*. Public arXiv:1205.3463 PDF, read together with official erratum.

- Peter Scholze, *[Erratum to p-adic Hodge theory for rigid-analytic varieties](https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeErratum.pdf)*. Official author PDF, 3 pages.

- Benjamin Antieau, Akhil Mathew, Matthew Morrow, Thomas Nikolaus, *[On the Beilinson fiber square](https://arxiv.org/pdf/2003.12541v2)*. arXiv:2003.12541v2 (29 September 2021), printed preprint pagination.

- Peter Scholze, *[On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf)*. Annals of Mathematics 182 (2015), pp.945–1066; Theorem 3.1.2, pp.971–972, used only for genus one.

- Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu, *[Logarithmic Riemann–Hilbert correspondences for rigid varieties](https://www.kwlan.org/articles/log-RH.pdf)*. Author preprint for the 2023 publication, internal pagination: Definition 2.2.10, p.13; Proposition 2.3.15, pp.18–19; Corollary 2.4.2, pp.20–21; Corollary 2.4.5, p.21.

- Bhargav Bhatt, Matthew Morrow, Peter Scholze, *[Topological Hochschild homology and integral p-adic Hodge theory](https://people.mpim-bonn.mpg.de/scholze/bms2.pdf)*. Author PDF; Theorem 1.12, Remark 1.14 and Theorem 1.15, §§7–10.

- Teruhisa Koshikawa, *[Logarithmic prismatic cohomology I](https://arxiv.org/pdf/2007.14037v3)*. arXiv:2007.14037v3, §§4–8.

- Teruhisa Koshikawa, Zijian Yao, *[Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364)*. Theorem 2, pp.2–4.
