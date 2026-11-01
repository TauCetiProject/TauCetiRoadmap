# Roadmap: isocrystals, vector bundles and Banach–Colmez spaces

**Summary.** The Fargues–Fontaine curve turns Frobenius modules into vector bundles and turns their sections and first cohomology into geometric objects. This roadmap develops that passage for a nonarchimedean local coefficient field: finite isocrystals and their slope blocks, analytic bundles and geometric Harder–Narasimhan theory, algebraization and classification, Banach–Colmez spaces, and variation over perfectoid bases. Its main exports are the classification of bundles at a geometric point, relative slope filtrations and local-system comparisons, and the properness and smoothness results for Banach–Colmez constructions used in the geometry of `Bun_G`.

The geometric classification is a bijection on isomorphism classes of finite isocrystals and bundles after choosing the constant-field embedding. It does not identify all morphisms: a map between different slopes can exist on the curve when the corresponding isocrystal map is zero. Families retain their descent data and need separate theorems; their bundles are not classified by one global direct sum of standard blocks.

## Scope and ownership

This roadmap owns the finite-isocrystal comparison with the supplied mixed-characteristic classification, the equal-characteristic blocks and classification, and the curve-specific endomorphism invariant comparison (Layer 1), the relative coefficient and analytic curve extensions in Layer 0, general-coefficient annular descent and geometric slope theory (Layer 2), positive generation and relative GAGA (Layer 3), geometric classification and its consequences (Layer 4), Banach–Colmez geometry and its classical category (Layer 5), and variation, pure models and local systems (Layer 6). The absolute `ℚ_p` schematic curve, coherent and bundle GAGA, and geometric Robba comparison are supplied by PrismaticCohomologyPartIII §7.0 in its stated domain. The construction order below separates the early geometry from the properness and smoothness applications.

The following are suppliers, with their exact contracts recorded below.

- CrystallineCohomology §CR.4.7 supplies all-rank ordinary Witt blocks, classification and perfect-field slope descent. PadicDifferentialEquationsAndRigidCohomology §§RD.1.27 and RD.1.32 supplies the ramified mixed-characteristic and q-Frobenius blocks and classification. Layer 1 transports these through the finite-isocrystal comparisons and proves the equal-characteristic extension.
- AdicSpaces §6 supplies the fixed-field `E = ℚ_p` annuli and analytic quotient. The corresponding `spaY`, Frobenius windows and topological `spaX` are supplied in Tau Ceti. PadicHodgeTheory §§7.5–7.6 supplies the p-typical relative rings, chartwise curves, untilt completions and derived comparisons. Layer 0 reuses these carriers and maps and constructs their general-`E` and equal-characteristic extensions; Layers 2–6 supply the additional global curve geometry. FarguesFontaineDiamonds Layer F4 supplies the fixed-field analytic Cartier comparison.
- PrismaticCohomologyPartIII §7.0, `layer-7-absolute-ff`, supplies the absolute homogeneous section ring and Proj curve, coherent and bundle GAGA, extended-Robba comparison and untilt completion. The exact contracts below identify its carriers and maps with the absolute specializations of Layers 0–3. Its filtered prismatic modification has a separate role in Part III.
- PerfectoidSpaces P1–P3 supplies tilting, marked untilts, affinoid approximation and finite étale comparison. DiamondsAndVStacks D2–D6 supplies the v/pro-étale sites, ordinary bundle descent, locally profinite torsors, relative representability and analytic diamondification. DiamondEtaleCohomology C4 and DiamondSixOperations S4–S5 supply the cohomological geometry used by Layer 5.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.25–R07.2.28 supplies universal covers and crystalline Dieudonné full faithfulness with its actual base hypotheses. The Lubin–Tate `𝒪_E` normalization and the comparison with the explicit eigenfunction series are proved in Layer 5. PadicPeriodRings §1.5 and PadicHodgeTheory §§0.2–0.5 and 7.5–7.6 supply the field-valued and p-typical relative period rings and completions; the general-coefficient extensions and sympathetic-algebra realizations are targets here. PadicHodgeTheory §3.5 supplies the semistable admissibility input.
- SchemeAndStackFoundations §§0.3–0.4, 1.1, 1.24, 2.2, 2.5, 2.18 and 3.3–3.4 supplies Proj, coherent extensions, effective descent, site cohomology, derived coherent categories and the generic degree/Picard vocabulary. The curve-specific coherent heart, torsion pair and tilt are targets in Layer 5. AdicSpacesPartIII §§R3.1–R3.5 supplies coherent sheaves, acyclicity and Kiehl gluing; §R3.8 supplies trace pairings. DiamondsAndVStacks D6.9 supplies `Rigid.diamond_hom_bijective` in mixed characteristic. The equal-characteristic affine-line comparison uses PerfectoidSpaces P1 perfected Tate algebras and Yoneda; the additive-series calculation is part of key-extension-lemma. PadicDifferentialEquationsAndRigidCohomology §§RD.2.3–RD.2.4 supplies the special/generic polygon comparisons over perfect analytic residue fields.
- AlgebraicVectorBundles L0A–L0C and the pinned Tau Ceti modules supply the schematic category of finite locally free sheaves, its tensor, dual, rank, determinant and pullback infrastructure. The analytic carrier and its comparison with that category remain Layer 2 and Layer 3 work. LocalFieldsRamification Layer 2 supplies unramified coefficient extensions and arithmetic Frobenius; ReductiveGroupsPartII §RG2.0.4 supplies their completed maximal unramified extension with extended Frobenius and fixed field. Tau Ceti’s crossed-product modules supply algebraic cyclic algebras and the Brauer comparison; ClassFieldTheory Layer 5 supplies the arithmetic local invariant, and RepresentationTheory/SemisimpleAlgebras supplies semisimple endomorphism algebra infrastructure.
- PhiGammaModulesAndIwasawaCohomology §1.0b supplies twisted rational local systems, scheme-side isogeny local systems, their Frobenius, iteration equation, pullback and denominator reindexing. Layer 6 owns the comparisons with the relative curve and pure coefficient sheaves beyond those supplier interfaces.
- ReductiveGroups Layer 1 supplies the field-valued representation/comodule dictionary; ReductiveGroupsPartII §§RG2.3.1 and RG2.3.7 supplies smooth affine integral models and Lang's theorem. Layer 6 includes the stronger integral tensor-fibre-functor reconstruction, using SW Theorems 19.5.1–19.5.2, pp. 178–180.

The bundle classification, relative local-system comparisons and Banach–Colmez results feed `Bun_G`, local shtukas and geometric Langlands. The finite étale curve-algebra theorem and degree-one section/divisor identification are exports to divisor/Weil-map and v-stack sheaf theory. The arithmetic reciprocity map is ClassFieldTheory Layers 8–9's, with its stated finite-extension-of-`ℚ_p` scope; extending that arithmetic input to equal characteristic is separate from the geometric divisor identity. The period-valued functor `W ↦ Hom_VS(W,B_dR)`, its Ext correction and rank/height theorem belong to VectorBundlesAndIsocrystalsPartII. None of these consumers is a prerequisite here.

## Conventions

Fix a nonarchimedean local field E with residue field `𝔽_q`, uniformizer `π` and algebraic closure k of `𝔽_q`. Write `L=Ĕ`. In mixed characteristic `L=W_{O_E}(k)[1/π]`; in equal characteristic `L=k((π))`. The specified automorphism `σ` is arithmetic q-Frobenius and fixes E and `π`. Objects of `Isoc_E` are finite-dimensional L-vector spaces with bijective `σ`-semilinear Frobenius. Their morphisms are L-linear intertwining maps, with E-linear Hom spaces. Arbitrary L-scalar multiplication need not preserve the intertwining equation.

The block `D(s,r)`, for `r>0`, cycles through a basis and multiplies the wrap by `π^s`. Its isocrystal slope is `s/r`. For coprime `d,h` with `h>0`, the standard bundle `O(d/h)` is the image of `D(−d,h)`; its rank is h and its degree is d. The functor reverses slopes. The corresponding division algebra `D_{d/h}` has arithmetic invariant `d/h` modulo `ℤ` and E-dimension `h²`. An isocrystal of slope a therefore has endomorphism invariant `−a`. Standard rational bundles can be defined over an `𝔽_q-base`, while the functor on arbitrary isocrystals requires a specified k-structure on the base.

A bundle is a structure-sheaf module with one local-generator family that is both finite and free. It is not an arbitrary locally free sheaf. On a connected geometric curve, degree is the integer Picard degree of its determinant; slope is degree divided by positive rank. The zero bundle has rank and degree zero, the empty HN filtration and no slope. HN polygons use ranks as horizontal lengths and decreasing slopes: they are concave upper polygons. For the p-typical `φ^a` comparison, the KL lower polygon reverses the order and rescales ordinates: on a rank-n component, `P_KL(x)=(deg_FS(V)−P_FS(n−x))/a`, where `deg_FS` is integer Picard degree. Thus `O(1)` has KL slope `1/a`; at `a=1` only reversal remains. Every geometric slope threshold `λ` becomes `λ/a` in this Robba normalization, and a twist by `O(m)` adds `m/a`. The KL slope attached to a `φ^a` eigenvalue `p^b` is `−b/a`; the untilt line has slope `1/a` in that normalization.

A geometric base field C is complete, algebraically closed and perfectoid of characteristic p. A closed point x of the curve determines its own untilt `C_x^♯`; the completed local ring is its period DVR, and for `E=ℚ_p` it is `B_dR⁺(C_x^♯)`. A chosen parameter `t_x` need not be the parameter at another point. For a general perfectoid S, rank and geometric degree are locally constant on appropriate components; statements about slopes mean statements about every geometric fibre unless a single point is explicitly specified.

Cohomological degrees are used throughout. The complex `[E₁→E₀]` places `E₁` in degree `−1` and `E₀` in degree 0. Its Banach–Colmez object is `H⁰` of derived global sections, not the cokernel of a map on ordinary sections. Frobenius cohomology is E-linear, even though the underlying coefficient module is over L. Underline E is the v-sheaf associated to the locally profinite topological field E: `underline E(S)=C(|S|,E)`, the continuous E-valued functions. Thus `H⁰(X_S,O)=C(|S|,E)`; on two geometric points this is `E²`.

Projectivization means the v-sheaf quotient of the complement of the zero section by underline `E×`. The `π^ℤ` quotient is an intermediate construction. Absolute spatiality and a morphism's representability in spatial diamonds are separate properties: the intermediate absolute quotient can fail quasiseparatedness while its structure morphism is relatively representable in spatial diamonds.

For the classical sympathetic-algebra category, take `E=ℚ_p`, choose C as the completion of an algebraic closure of a complete discretely valued characteristic-zero K with countable perfect residue field, and fix the point `∞` with residue field C and parameter t. Sympathetic algebras are connected spectral C-Banach algebras with p-divisible unit neighbourhood, faithful evaluation on C-valued spectral points, and a dense C-linear subspace with countable basis. These separability assumptions are retained in all targets below involving the CN sympathetic-algebra realization. The abstract pro-étale category and SW diamond realization have their own stated scope for arbitrary algebraically closed complete `C/ℚ_p`.

## Exact supplier contracts

Use Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following infrastructure supplies the carriers and generic operations; the additional curve-specific results are the targets of this roadmap.

The supplied absolute specialization means `E=ℚ_p`, `π=p`, `S=Spa(F,𝒪_F)` with `F=C₀^♭`, where `C₀` is the completion of an algebraic closure of a characteristic-zero complete discretely valued field with perfect residue field, as in PrismaticCohomologyPartIII's Conventions. Use the following interfaces from its [§7.0 absolute package](../PrismaticCohomologyPartIII/README.md#layer-7-absolute-ff), independently of its filtered modification. The general coefficient fields, arbitrary geometric perfectoid fields and relative bases specified below remain in scope here.

| Supplier target | Used in | Required interface |
| --- | --- | --- |
| PrismaticCohomologyPartIII §7.0, `layer-7-absolute-ff`, `FilteredBundle.schemeCurve` | Layer 0, Layer 2, Layer 3 | The graded ring `⊕ B^{φ=p^n}`, its identification with `⊕ H⁰(X_F,𝒪(n))`, homogeneous localizations and the regular noetherian one-dimensional Proj curve. Extend this same construction to the coefficients and bases of Layer 0. |
| PrismaticCohomologyPartIII §7.0, `layer-7-absolute-ff`, `FilteredBundle.analyticEquivalence` | Layer 2, Layer 3 | Coherent GAGA and its restriction to finite locally free sheaves, with the same chart maps, twists, tensor products and duals. The relative extension below concerns bundles. |
| PrismaticCohomologyPartIII §7.0, `layer-7-absolute-ff`, `FilteredBundle.robbaEquivalence` | Layer 2, Layer 3 | Annular restriction and Frobenius gluing on AInfCohomology §AI.2.3's extended Robba coefficients; finitely presented Frobenius modules for coherent sheaves and finite projective ones for bundles. Retain the annular coordinate and topology comparison. |
| PrismaticCohomologyPartIII §7.0, `layer-7-absolute-ff`, `FilteredBundle.untiltCompletion` | Layer 0, Layer 2 | The completion at the marked untilt is `B_dR⁺(C₀)`, compatible with the schematic and analytic local maps and Cartier thickenings. |

- [`WittVector.FractionRing.frobenius`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/WittVector/Isocrystal.lean), [`WittVector.Isocrystal`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/WittVector/Isocrystal.lean), [`WittVector.IsocrystalHom`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/WittVector/Isocrystal.lean) and [`WittVector.IsocrystalEquiv`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/WittVector/Isocrystal.lean) supply the p-Frobenius coefficient automorphism and intertwining maps over Witt fraction fields. `WittVector.Isocrystal` itself imposes no finite-dimensionality condition. [`WittVector.StandardOneDimIsocrystal`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/WittVector/Isocrystal.lean) has Frobenius `p^mσ`, and [`WittVector.isocrystal_classification`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/WittVector/Isocrystal.lean) assumes `finrank=1` over an algebraically closed characteristic-p field. CrystallineCohomology §CR.4.7, “Slope decomposition on the existing isocrystal carrier”, supplies the higher-rank Witt blocks, classification, distinct-slope Hom vanishing and perfect-field descent. Transport them through the forgetful Witt comparison and the finite Witt bundling comparison. PadicDifferentialEquationsAndRigidCohomology §§RD.1.27 and RD.1.32 supplies the mixed-characteristic ramified-coefficient and q-Frobenius blocks, classification, slope decomposition and distinct-slope Hom vanishing. The [mixed-characteristic supplier comparison](#mixed-characteristic-supplier-comparison) identifies its coefficient field and finite Frobenius-module category with those here, preserving cyclic bases, tensor products, duals and slopes normalized by `v(π)=1`. Layer 1 proves the equal-characteristic extension and the curve-specific endomorphism invariant comparison.
- [`AlgebraicGeometry.Scheme.Modules`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/AlgebraicGeometry/Modules/Sheaf.lean) and [`SheafOfModules.LocalGeneratorsData.IsLocallyFreeData`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean) supply module sheaves and local free presentations. [`SheafOfModules.LocalGeneratorsData.IsFiniteType`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Category/ModuleCat/Sheaf/Generators.lean) makes each generator index finite. Tau Ceti's [`SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/Category/ModuleCat/Sheaf/FinitePresentation.lean) uses both conditions on the same family. [`TauCeti.AlgebraicGeometry.InvertibleSheaf`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/LineBundle/Basic.lean) is the invertible-sheaf category; [`TauCeti.AlgebraicGeometry.LineBundleClass`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/LineBundle/Class.lean) has a tensor-product commutative group of isomorphism classes, with inverse induced by duality (`LineBundleClass.inv_mk`). [`CommRing.Pic`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/PicardGroup.lean) is the Picard group of a ring, not the Picard computation for this curve.
- [`TauCeti.CSA.of`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/BrauerGroup/Basic.lean) bundles an algebra already known to be finite-dimensional, central and simple. [`TauCeti.BrauerGroup.mk_end`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/BrauerGroup/Group.lean) gives the split class of `End_K(V)` for nonzero finite-dimensional V, and [`TauCeti.BrauerGroup.baseChange_mk`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/BrauerGroup/BaseChange.lean) identifies scalar extension of classes. Use `TauCeti.CrossedProduct` from `TauCeti.Algebra.CrossedProduct.Basic` and `TauCeti.BrauerGroup.crossedProductClass` from `TauCeti.Algebra.CrossedProduct.BrauerClass` for the algebraic cyclic construction. `TauCeti.brauerCohomologyEquiv` and `TauCeti.brauerCohomologyEquiv_crossedProductClass` in `TauCeti.Algebra.CrossedProduct.Comparison` identify its class with the inflated continuous-cohomology cocycle. ClassFieldTheory Layer 5 supplies `TauCeti.ClassFieldTheory.invMap` and its arithmetic normalization.
- [`CategoryTheory.Sheaf`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/CategoryTheory/Sites/Sheaf.lean), [`ModuleCat`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Category/ModuleCat/Basic.lean), [`CategoryTheory.Abelian`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/CategoryTheory/Abelian/Basic.lean), [`CategoryTheory.Equivalence`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/CategoryTheory/Equivalence.lean), [`DerivedCategory`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean), [`CategoryTheory.ShortComplex.ShortExact`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Homology/ShortComplex/ShortExact.lean) and [`CategoryTheory.ShortComplex.homology`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Homology/ShortComplex/Homology.lean) supply sheaf categories, module-valued functors, equivalences, exactness and genuine categorical homology. The derived category localizes integer cochain complexes at quasi-isomorphisms; it does not provide the curve's derived sections or the tilted coherent heart by itself. [`Submodule`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Module/Submodule/Defs.lean), [`NormedAlgebra`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Analysis/Normed/Module/Basic.lean) and [`Module.finrank`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Dimension/Finrank.lean) supply lattice inclusions, normed algebra carriers and dimensions under the finite hypotheses.
- [`SpectralSpace`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Topology/Spectral/Basic.lean) and [`Specializes`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Topology/Defs/Filter.lean) supply spectral topology and the neighbourhood-filter specialization relation. [`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.lean) proves spectrality of Spa for a topological coefficient ring with a specified pair of definition and subring of integral elements. Tautness, ordered generalizations and the contraction assumptions in the quotient theorem remain substantive hypotheses.

The pinned Tau Ceti library additionally supplies [`FiniteLocallyFreeSheaf`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean), its free sheaves and pullbacks, and [`pullbackId` and `pullbackComp`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/VectorBundle/Functoriality.lean). [`SheafOfModules.isFiniteLocallyFree_iff_exists_isLocallyFreeData_isFiniteType`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/Category/ModuleCat/Sheaf/FiniteLocallyFree.lean) identifies the finite local-basis witness with the native property. These interfaces supply the schematic bundle category and its generic operations, as specified by AlgebraicVectorBundles L0A–L0C.

The fixed-field topological curve uses `TauCeti.FarguesFontaine.spaY` and `frobeniusHomeomorph` in `TauCeti.AlgebraicGeometry.AdicSpace.FarguesFontaine.Y`, and `spaX`, `quotientMap`, `quotientMap_eq_iff` and `isOpenQuotientMap_quotientMap` in `TauCeti.AlgebraicGeometry.AdicSpace.FarguesFontaine.Quotient`. These give the orbit topology, not a relative or ramified-coefficient structure sheaf. AdicSpaces §6.4 supplies the fixed-field adic quotient sheaf and charts. Generic projectivization and scalar orbits use Mathlib's `Projectivization` and `MulAction.orbitRel`; fixed points use `Function.fixedPoints`. Rational block labels use Mathlib's `Rat.num`, `Rat.den`, `Rat.den_pos` and `Rat.reduced`. The fixed coefficient embedding is the existing `algebraMap E L`, together with the hypothesis `∀ a, σ (algebraMap E L a) = algebraMap E L a`. Layer 5 owns their v-sheaf quotient, representability and properness comparisons.

SchemeAndStackFoundations §0.3 supplies relative Proj and homogeneous localizations; §§0.4 and 1.1 supply coherent extension and effective descent of quasi-coherent modules; §1.24 supplies finite Galois descent with semilinear actions. Sections 2.2 and 2.5 supply Čech-to-derived comparison and sheaf cohomology; §2.18 supplies the derived coherent category. Sections 3.3–3.4 supply degree and Picard operations, while the integer Picard classification for this curve is Layer 2's. AdicSpacesPartIII §§R3.1–R3.5 supplies the finite-projective/analytic-bundle equivalence on the stated sheafy affinoids, rational acyclicity, quasi-Stein sections and Kiehl gluing; §R3.8 supplies finite locally free trace pairings and their base change. Use its actual finite-projective hypotheses on relative annuli.

PerfectoidSpaces P1 supplies the primitive-untilt correspondence, P2 the perfectoid chart comparisons and P3 finite étale tilting. DiamondsAndVStacks D2 supplies v-descent and acyclicity of functions and finite locally free sheaves; D3 supplies ordinary effective descent and locally profinite torsors; D4–D5 supplies quotients, proper maps and relative representability in locally spatial diamonds; D6 supplies diamondification and its analytic étale-site comparison. FarguesFontaineDiamonds F4 supplies the fixed-field `ℚ_p` analytic Cartier divisor with its all-affinoids closedness criterion. Layer 0 extends that construction to relative and general-coefficient curves. DiamondsAndVStacks D3.10 supplies locally profinite torsors and their associated finite-rank topological E-local systems. DiamondEtaleCohomology C4 supplies properness, partial properness, compactification and tautness, and DiamondSixOperations S4–S5 the cohomological smoothness and proper-base-change interfaces, with the hypotheses on locally spatial diamonds and coefficients stated there.

FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.25–R07.2.28 supplies the universal-cover and crystalline Dieudonné Hom interfaces. In the `f`-semiperfect case retain surjective Frobenius and the finitely generated ideal-of-definition condition on the inverse perfection; the integral case uses a quotient of a perfect ring by a regular ideal. Layer 5 constructs the `𝒪_E`-linear Lubin–Tate normalization, including the crystalline eigenspace comparison. PadicPeriodRings §1.5 supplies the finite-`K` topological de Rham rings; PadicHodgeTheory §§0.2–0.5 supplies their filtrations and semistable field-valued counterparts, §2.2 their horizontal local de Rham sheaves, and §3.5 semistable admissibility. PadicHodgeTheory §§7.5–7.6 supplies the p-typical relative interval/Robba rings with rational descent, chartwise curves and untilt completions, pure and étale loci, integral/rational local-system comparisons and derived Frobenius cohomology. Reuse its carriers, maps and chain-level comparisons in their stated domains. Layer 0 constructs the general-`E` and equal-characteristic extensions; Layers 2–6 construct the additional global geometry and the sympathetic-algebra period functors. Its normalized analytic degree uses the valuation sign, so curve degree is `−a` times that degree for `φ^a`; the KL Robba slope convention here is its negative, namely curve slope divided by `a`. PadicDifferentialEquationsAndRigidCohomology §§RD.2.3–RD.2.4 supplies the special/generic polygon inequality and the common filtration for coincident polygons; Layer 6 transports them through its specified annular coefficient comparisons.

From PhiGammaModulesAndIwasawaCohomology §1.0b, consume `TwistedLocalSystem`, `TwistedLocalSystem.frobenius`, `TwistedLocalSystem.iterate`, `TwistedLocalSystem.pullback` and `TwistedLocalSystem.reindex`, together with `isogenyLocalSystem` and its coefficient-descent comparison. For `c∈ℤ` and `d>0`, the rational carrier is a finite-rank étale `ℚ_{p^d}` local system with arithmetic-Frobenius-semilinear τ satisfying `p^cτ^d=1`; the scheme-side carrier retains an integral lattice up to isogeny. Simultaneous positive rescaling of `(c,d)` gives equivalent categories by unramified coefficient extension and descent, without identifying the coefficient fields. The rational carrier does not require a global integral lattice. (KL Definition 8.5.7 and Theorems 8.5.6–8.5.8, pp. 170–172.)

LocalFieldsRamification Layer 2 supplies the local-field unramified tower. ReductiveGroupsPartII §RG2.0.4 supplies its completion `L`, arithmetic Frobenius `σ` and `L^σ = E`; §§RG2.3.1 and RG2.3.7 supplies the smooth integral models and Lang input. ReductiveGroups Layer 1 supplies the field-valued tensor dictionary. The pinned crossed-product modules supply the algebraic cyclic algebra and algebraic-to-cohomological comparison; ClassFieldTheory Layer 5 supplies `invMap` with arithmetic Frobenius, and Layers 8–9 supplies local reciprocity in its finite-`K/ℚ_p` domain. RepresentationTheory/SemisimpleAlgebras' “What Mathlib already has” and central-simple-algebra layer supplies the endomorphism and matrix-algebra conventions, with the opposite ring in the Wedderburn block dictionary. The curve-slope invariant sign and integral tensor reconstruction are the targets here.

[Suggested.lean](Suggested.lean) states the equal-characteristic Dieudonné–Manin classification in Layer 1 on Mathlib's Laurent-series carrier. Its declarations are `coefficientFrobenius`, `CyclicSlopeDecomposition`, `CyclicSlopeDecomposition.slopes` and `dieudonneManinEqualChar`, in the namespace `TauCetiRoadmap.VectorBundlesAndIsocrystals`. The module docstring identifies the objects needed to state the geometric headline theorems against the pins. The API lists and Checks below specify mathematical requirements in prose.

## How to read the build

The displayed layers organize the exports. Within them, the dependency order is finer:

1. Consume Part III's absolute curve and Robba package. Extend the relative and general-coefficient foundations of Layer 0, and construct finite isocrystals, the analytic bundle carrier, the additional annular descent comparisons, the Frobenius cohomology complex and v-descent.
2. Construct the basic Lubin–Tate cover, the degree-one untilt sequence and the section/divisor identification in Layer 5. Use them for standard twist cohomology and the independent geometric chart-cover argument in Layer 2. The divisor/Weil reciprocity comparison consumes this geometric identification and ClassFieldTheory's arithmetic map.
3. Extend the supplied regular geometric curve and its bundle comparison to the stated generality, and establish Picard degree and geometric HN theory. Prove positive generation and extend the global Proj map and bundle GAGA to relative bases, then prove geometric classification. The general-coefficient geometric chart-cover proof precedes relative GAGA; ordinary Banach–Colmez properness uses positive generation without classification.
4. Prove ordinary projectivized properness, then family HN semicontinuity and pro-étale splitting in Layer 6. These supply the positive presentations and relative cohomology needed for general two-term Banach–Colmez geometry in Layer 5.
5. Develop integral/pure model comparisons, relative ampleness and the classical Banach–Colmez category with its coherent-heart equivalence and curvature calculus.

Each target gives its mathematical specification, its required API or examples where applicable, and its source and prerequisites. All API statements inherit the target's hypotheses and the conventions above. The examples include degenerate cases and counterexamples so that definitions can be checked against their intended meaning.

## Layer 0: relative coefficient and curve foundations

This layer reuses the p-typical relative geometry of PadicHodgeTheory §7.5 and extends it to an arbitrary nonarchimedean local coefficient field `E` over a perfectoid `𝔽_q`-base. The fixed-field specialization is AdicSpaces §6. Its constructions precede the arbitrary-rank bundle functor. The analytic quotient and the partial homogeneous charts do not presuppose GAGA, geometric classification or Banach–Colmez properness.

### Ramified coefficient rings and coefficient changes

For `E` of characteristic zero with residue field `𝔽_q`, uniformizer `π` and any `𝒪_E`-algebra `A`, construct `W_𝒪_E(A)` with underlying sequences and ghost polynomials `w_n(x) = Σ_{i=0}^n π^i x_i^(q^(n−i))`. Its ring operations are the universal integral polynomial operations, including when the ghost map is not injective. On perfect `𝔽_q`-algebras give the `π`-adically complete, separated, `π`-torsion-free strict lift with residue algebra `A`, Teichmüller expansion `Σ_{n≥0} π^n [a_n]`, Frobenius `φ([a]) = [a^q]`, `φ(π) = π` and Verschiebung. In equal characteristic use `A[[π]]`, with Frobenius on coefficients and `π` fixed. Construct the continuous `𝒪_E` action, comparison under change of uniformizer and under finite coefficient-field extensions; compare the perfect-residue fraction field with the completed maximal unramified field of ReductiveGroupsPartII §RG2.0.4. For `E = ℚ_p` consume Mathlib's Witt vectors and their Frobenius directly. (FF §1.2, especially Lemma 1.2.1, Definition 1.2.2 and Lemma 1.2.3, printed pp. 5–7; Teichmüller variants pp. 8–10; FS §II.1, pp. 47–49.)

Prove the universal strict-lift uniqueness, functoriality on coefficient algebras, residue and reduction formulas, expansion uniqueness, Frobenius–Verschiebung relations and compatibility of coefficient changes with reduction, Teichmüller representatives, topology and Frobenius. These are the API of the ramified Witt coefficient rings; the choice of coefficient embedding is retained in every comparison.

**Checks.**

- The first two ghost coordinates are `x₀` and `x₀^q + πx₁`; for `E = ℚ_p`, `q = p`, these agree with Mathlib's `WittVector.ghostComponent`.
- In equal characteristic, `φ(Σ a_n π^n) = Σ a_n^q π^n`; the uniformizer is fixed rather than raised to its `q`th power.
- For perfect `A`, reduction modulo `π` is `A`, while over an algebra with `π`-torsion the ghost map need not be injective. Universal operations cannot be defined by an unjustified inversion of the ghost map.

*Needs:* LocalFieldsRamification Layer 2; ReductiveGroupsPartII §RG2.0.4; Mathlib Witt vectors; AdicSpacesPartII §§R0.1 and R0.3 for coefficient completions.

### Relative annuli and their section rings

For affinoid perfectoid `S = Spa(R,R⁺)` over `𝔽_q`, with topologically nilpotent unit `ϖ ∈ R`, construct the ramified Witt period annuli and their plus rings. On an expansion `x = Σ π^n[x_n]` use the Gauss norms `|x|_ρ = sup_n |π|^n |x_n|^ρ` and the maximum of the two endpoint norms on a compact interval `I ⊂ (0,∞)`. Complete the subring where these norms are finite, and take the integral closure of the image of the integral chart ring for the plus ring. Keep the valuation inequalities defining the radius at higher-rank points; these do not assign every point a real-valued radius. Prove `φ` carries radius `ρ` to `qρ` in this normalization, and give the reciprocal conversion to AdicSpaces §6's `κ`-windows. (FS §II.1, pp. 47–50; CS §3.3, Definition 3.3.1 and Theorem 3.3.4, pp. 682–683; KL §§5.1–5.3 and §6.1.)

The relative annuli API consists of complete Hausdorff Huber pairs, the restriction maps for nested compact intervals, their rational-localization identifications, sheafiness, rational-base-change and overlap compatibility, coefficient-compatible Frobenius isomorphisms, and independence of `ϖ`. Prove that the increasing union of compact annuli is quasi-Stein with the stated dense restriction maps; for finite projective annular modules prove the inverse-limit section comparison and higher acyclicity, including the vanishing needed for the Čech-to-derived comparison. The relative rings need not be noetherian; use the perfectoid and sheafy Tate hypotheses of the suppliers. Absolute strongly noetherian interval results remain those of AdicSpaces §6.3.

**Checks.**

- For `E = ℚ_p` and a perfectoid field base, the annuli and their topology agree with AdicSpaces §6.3, including its reciprocal-radius dictionary.
- Restriction from `I` to `I` is the identity; restriction through two nested subintervals is their composite. Endpoints `0` and `∞` are not compact intervals inside `(0,∞)`.
- Applying Frobenius to a Teichmüller element multiplies its radius exponent by `q`, while the norm of `π` remains fixed. This distinguishes coefficient Frobenius from a map raising `π` to `π^q`.

*Needs:* PadicHodgeTheory §7.5 for the p-typical relative carriers and comparison maps; the preceding coefficient target; AdicSpacesPartIII §§R3.1–R3.5; AdicSpacesPartII §§R0.3–R0.5; PerfectoidSpaces Layers P1–P3; SchemeAndStackFoundations §§2.2 and 2.5.

### Integral period domain

Construct the integral relative domain `Y_[0,∞)(S)` and its analytic generic part by gluing the completed ramified Witt charts with their actual plus rings and valuation maps. Retain the crystalline end at `π = 0`; deleting it gives the generic annular domain. Define Frobenius and its pullback on finite locally free sheaves on both domains. Prove functoriality in perfectoid `S`, compatibility of integral and generic restriction, and the identifications of compact charts and their overlaps with the preceding annuli. The integral Frobenius-module and local-system comparisons are the targets in Layer 6, rather than part of the construction of this carrier. (SW §12.3, pp. 103–104, and §§22.3, 22.6, pp. 208–213; FS §II.1, pp. 47–50.)

The integral period domain API includes rational restriction, base change, the crystalline closed end, its generic complement and the Frobenius pullback functor. Prove the ordinary descent of finite locally free sheaves used on these charts, by split perfectoid root charts and effective descent, with ordinary isomorphisms of modules. Almost descent of functions alone does not establish this assertion.

**Checks.**

- The crystalline end survives in the integral domain and is absent from its generic complement.
- With `S` a geometric point and `E = ℚ_p`, the generic domain agrees with the imported `spaY` charts and valuations.
- The zero finite locally free sheaf descends to zero, and the rank-one trivial sheaf with its identity descent maps descends to the structure sheaf, with ordinary rather than almost inverse maps.

*Needs:* PadicHodgeTheory §7.5 for the p-typical relative carriers and comparison maps; the preceding annuli; AdicSpaces Layers 0–4; AdicSpacesPartIII §R3.5; PerfectoidSpaces P3; DiamondsAndVStacks D2–D3.

### Relative period domain and analytic quotient

Glue the generic annuli to `Y_S` and construct `X_S = Y_S/φ^ℤ` as a locally valued ringed adic space, with invariant structure sheaf on inverse images of opens. The specified `φ` acts by valuation precomposition, with the radius normalization above. Prove the free properly discontinuous action, wandering-window presentations and quotient charts, functoriality for perfectoid base changes, independence of the pseudouniformizer, and the local comparison with the fixed-field quotient of AdicSpaces §6. The relative analytic quotient API includes the quotient map, its local isomorphisms, compatible structure sheaves and valuations, and the morphisms on annular presentations. (FS §II.1, pp. 47–50; CS Theorem 3.3.4, p. 683; KL §6.3.)

**Checks.**

- At a perfectoid field with `E = ℚ_p`, the underlying quotient is the imported `TauCeti.FarguesFontaine.spaX`, with the same orbit projection.
- On a wandering window the quotient map is an open immersion of locally valued ringed spaces; a homeomorphism without a sheaf comparison does not pass this check.
- The empty base gives the empty domain and curve. On a disjoint union the construction restricts to each component, rather than identifying their constant sections.

*Needs:* PadicHodgeTheory §7.5 for the p-typical relative carriers and comparison maps; the preceding period domains and annuli; AdicSpaces §6; DiamondsAndVStacks D3–D4 for effective quotient descent.

### Marked untilt Cartier divisors and Cartier descent

For a marked untilt `S^♯` of `S` over `E`, construct the continuous ramified theta map on the appropriate completed Witt chart. Its primitive kernel is invertible and generated locally by a non-zero-divisor `ξ`; the quotient Huber pair has the untilt topology and the integral closure of the image as plus ring. Prove the closed Cartier criterion on every rational chart, including closedness of multiplication by `ξ`, and descend its Frobenius orbit to a closed Cartier divisor on `X_S`. In the fixed-field `ℚ_p` case consume FarguesFontaineDiamonds Layer F4's analytic Cartier and marked-untilt comparison, and PerfectoidSpaces P1's primitive-untilt dictionary. Reuse PadicHodgeTheory §7.5 for the p-typical relative construction; this target constructs the general-`E` and equal-characteristic extensions. (SW Propositions 5.3.8 and 11.3.1, and §§12.1–12.2; FS §II.1, pp. 50–56.)

Construct the v-descent, pullback and addition of ordinary closed relative Cartier ideals with their regular inclusions, and their disjoint-support locus. Define `Div¹=Spd(E)/φ^ℤ` from marked untilts modulo Frobenius, with its Cartier realization. Here “degree one” names this untilt construction and does not use Picard degree. Geometric-degree-d moduli the relative effective divisors and agreement of their degree-one component with this `Div¹` are constructed in [Effective divisors and projective sections](#effective-divisors-and-projective-sections), after geometric degree and relative HN trivialization. (FS Definition II.1.19 and Proposition II.1.21, p. 56.)

**Checks.**

- Replacing `ξ` by `uξ`, for a unit `u`, gives the same Cartier ideal and the same divisor. A unit equation itself gives the empty divisor, not an untilt.
- A primitive equation gives a regular closed Cartier divisor on each rational chart; an arbitrary vanishing function with a nontrivial annihilator does not qualify.
- Frobenius translates of a marked untilt give the same `Div¹` object; this comparison uses no Picard classification.
- Multiplying two Cartier ideals retains multiplicity at coincident supports. An arbitrary torsion sheaf without a regular Cartier inclusion is not a divisor.

*Needs:* PadicHodgeTheory §7.5 for the p-typical relative carriers and comparison maps; the preceding relative curve; PerfectoidSpaces P1; FarguesFontaineDiamonds Layer F4; AdicSpacesPartII §R0.8; DiamondsAndVStacks D2–D4.

### Completed local period rings

For each marked untilt divisor complete the local chart ring along its regular ideal, retaining the quotient topology at every finite thickening. Define the completed local period ring and its localization by the Cartier parameter, prove independence of its local equation, and identify restrictions, finite thickenings and changes of coefficient field. For a geometric point `C` and a point `x` with untilt `C_x^♯`, prove that the completion is a complete discrete valuation ring with residue field `C_x^♯`; for `E = ℚ_p` identify it with `B_dR⁺(C_x^♯)`. In equal characteristic the construction is the intrinsic Cartier completion. In ramified mixed characteristic retain the specified embedding or factor of the coefficient tensor product. The filtration is by powers of the Cartier ideal, with associated graded its symmetric powers. (SW §12.2; CN arXiv §3.2.1, p. 14; PadicHodgeTheory §§0.2–0.3 for the p-typical comparison.)

The API includes completion maps, quotient identifications, filtered coefficient comparison, flat restriction where proved on the actual charts, and parameter-change isomorphisms. The finite-`K` topological period rings are supplied by PadicPeriodRings §1.5. PadicHodgeTheory §7.5 supplies the p-typical relative chart completion; in the supplied absolute specialization consume PrismaticCohomologyPartIII §7.0's `FilteredBundle.untiltCompletion`. This target constructs the general-`E` and equal-characteristic extensions and their compatible completion maps.

**Checks.**

- At a geometric point the quotient by the maximal ideal is the point's own untilt field; two points need not have the same marked untilt or the same parameter.
- Multiplying a parameter by a unit leaves the filtration unchanged and transports each finite thickening isomorphically.
- The length of `B_dR⁺/t^m` is `m`, including zero for `m = 0`. The localized ring has `t` invertible and cannot be used as the integral DVR.

*Needs:* PrismaticCohomologyPartIII §7.0 / layer-7-absolute-ff for the supplied absolute specialization; PadicHodgeTheory §7.5 for the p-typical relative carriers and comparison maps; the preceding Cartier divisors; AdicSpacesPartII §R0.1a for completion; PadicPeriodRings §1.5; PadicHodgeTheory §§0.2–0.3.

### Rank-one Frobenius twists

For each integer `n`, descend the free rank-one module on `Y_S` with Frobenius `π^(−n)φ` to the analytic line `𝒪(n)` on `X_S`. Its sections are the functions satisfying `φ(f) = π^n f`. Prove naturality, `𝒪(0) = 𝒪`, the tensor isomorphisms `𝒪(n) ⊗ 𝒪(m) ≅ 𝒪(n+m)`, duality `𝒪(n)∨ ≅ 𝒪(−n)` and compatibility with annular restrictions and Frobenius descent. This is the rank-one twist infrastructure; the arbitrary-rank isocrystal functor and its tensor compatibility are Layer 2 targets. (FS §II.2 preamble, pp. 57–58; FF Proposition 8.2.6, p. 237.)

**Checks.**

- A section of `𝒪(1)` has coefficient eigenvalue `π`, although its defining isocrystal multiplier is `π⁻¹`.
- The zero twist descends to the structure sheaf, and `𝒪(1) ⊗ 𝒪(−1)` is the trivial line.
- Pulling the line back along a map of bases preserves the same coefficient uniformizer and the twist integer.

*Needs:* the relative quotient and annular descent; AdicSpacesPartIII §R3.5; the coefficient normalization above.

### Homogeneous section ring and partial schematic charts

Use PrismaticCohomologyPartIII §7.0's homogeneous ring, Proj curve and chart maps in the supplied absolute specialization. Extend them to affinoid perfectoid `S/𝔽_q` and arbitrary E: `P_S = ⊕_{n≥0} H⁰(X_S,𝒪(n))`, with multiplication from the preceding tensor isomorphisms, and `X_S^alg = Proj P_S`. On a homogeneous section `f` of positive degree use degree-zero localization for its partial schematic chart and the comparison on its analytic nonvanishing locus. Prove compatibility on overlaps, with powers of `f`, rational restriction on the base and the twists. For these extensions, covering is the geometric chart-cover target in Layer 2 and the relative global-map target in Layer 3. (FS Proposition II.2.7 and its proof, pp. 66–67; KL §6.3 and §8.7.)

The homogeneous section ring API comprises its grading, unit and multiplication, the Frobenius-eigenfunction description of each graded piece, homogeneous localization and overlap maps. In the supplied absolute specialization identify these with `FilteredBundle.schemeCurve`'s defining graded ring and charts, preserving their maps. Use SchemeAndStackFoundations §0.3's relative Proj.

**Checks.**

- Degree-zero multiplication agrees with multiplication of Frobenius-fixed functions; degree `n` times degree `m` has eigenvalue `π^(n+m)`.
- The charts from `f` and from a positive power `f^a` have the same nonvanishing locus and canonically identified degree-zero localizations.
- A single partial chart is not an isomorphism from the entire analytic curve to an affine scheme. The empty nonvanishing locus contributes no point to a chart cover.

*Needs:* PrismaticCohomologyPartIII §7.0 / layer-7-absolute-ff for the supplied absolute specialization; PadicHodgeTheory §7.5 for the p-typical relative carriers and comparison maps; the preceding twists and annular cohomology; SchemeAndStackFoundations §0.3; AdicSpacesPartIII §§R3.1–R3.5.

### Examples

For `E = ℚ_p` and a geometric perfectoid field, all fixed-field annular and topological quotient operations are the supplied ones. For `E = 𝔽_q((π))`, the coefficient ring uses power series and the `q`-power automorphism of their coefficients. In both cases the twist `𝒪(1)` is governed by eigenvalue `π`, and the positive twist direction agrees with the degree-one untilt divisor. Repeated untilt divisors give the successive Cartier thickenings, with length two for a double point.

### Dependencies

*Needs:* PrismaticCohomologyPartIII §7.0 / layer-7-absolute-ff; AdicSpaces §6; AdicSpacesPartII R0; AdicSpacesPartIII R3; PerfectoidSpaces P1–P3; DiamondsAndVStacks D2–D4; FarguesFontaineDiamonds F4; LocalFieldsRamification Layer 2; ReductiveGroupsPartII §RG2.0.4; PadicPeriodRings §1.5; PadicHodgeTheory §§0.2–0.3; SchemeAndStackFoundations §§0.3, 2.2 and 2.5.

## Layer 1: Finite isocrystals and division algebras

### Coefficient category and rational blocks

#### Finite isocrystals over the completed maximal unramified coefficient field

Fix a nonarchimedean local field E, residue field `𝔽_q`, uniformizer `π` and `L=Ĕ`. In mixed characteristic `L=W_{O_E}(𝔽̄_q)[1/π]`; in equal characteristic `L=𝔽̄_q((π))`. Let `σ` be the lift of q-power arithmetic Frobenius fixing E and `π`. An E-isocrystal is a finite-dimensional L-vector space D with a bijective `σ`-semilinear `Φ`. Morphisms are L-linear maps f with `fΦ_D=Φ_D′f`. This category retains E, `σ` and the coefficient embedding; the coefficient field alone does not determine it.

**API.**

- A finite isocrystal is a finite L-module with a `σ`-semilinear equivalence.
- Its morphism space is the E-vector subspace of L-linear maps intertwining the two Frobenius equivalences; scalars are restricted through the specified `σ`-fixed E embedding, not arbitrary L-scalars.
- Intertwining morphisms agree iff their underlying functions agree.
- Identity and composition are inherited from linear maps; the category is E-linear abelian.
- For `E=ℚ_p` and `σ=p`-Frobenius, forget finiteness to the existing WittVector.Isocrystal class; arrows and isomorphisms agree.

Construct the zero object, direct sums and tensor products with their genuine semilinear Frobenius. In the Witt specialization the finite Witt bundling comparison bundles an existing `WittVector.Isocrystal` together with `Module.Finite`; it is inverse to the finite specialization of the forgetful Witt comparison. For a finite list of objects the direct-sum carrier is the product of their coordinate spaces; tensor Frobenius sends `x ⊗ y` to `Φ(x) ⊗ Φ(y)`. Define the endomorphism ring as the subring of `Module.End L D.V` consisting of Frobenius intertwiners, with multiplication by composition and the `E`-algebra structure from the fixed embedding. Its identity, composition, additivity and scalar action satisfy the ordinary linear-map equations. The direct-sum operation takes a finite list of isocrystals to an isocrystal, the tensor product takes two isocrystals to an isocrystal, and the endomorphism construction takes an isocrystal to its E-algebra of intertwiners, with the category and finiteness hypotheses above. They include the compatibility with arrows and isomorphisms, not just with underlying vector spaces. (FF Definition 8.2.5 and Proposition 8.2.6, pp. 236–237.)

**Checks.**

- The zero module has rank 0 and an invertible semilinear zero-to-zero map.
- For `ℚ_p` the finite subcategory embeds fully faithfully into WittVector.IsocrystalHom and IsocrystalEquiv.
- The zero Frobenius map on nonzero L is not an isocrystal.
- For the unramified degree-two E′, the coefficient automorphism is `σ²`, not `σ`.

([FF][FF], 8.2.3, Definition 8.2.5, printed p. 236.)

*Needs:* LocalFieldsRamification / layer 2 unramified extensions and frobenius; ReductiveGroupsPartII §RG2.0.4 for the completion and extended arithmetic Frobenius; [Ramified coefficient rings](#ramified-coefficient-rings-and-coefficient-changes); `WittVector.FractionRing.frobenius`; `WittVector.Isocrystal`; `WittVector.IsocrystalHom`; `WittVector.IsocrystalEquiv`.

#### Mixed-characteristic supplier comparison

Let E be a finite extension of `ℚ_p` with residue field `𝔽_q`, `q=p^f`, and fix its uniformizer `π` and the embedding `W(𝔽_q)→𝒪_E`. Set `k=𝔽̄_q`, `R=W(k)⊗_{W(𝔽_q)}𝒪_E` and `F=R[1/π]`. The finite free `W(k)`-algebra R is already a complete DVR with residue field k and uniformizer `π`. Construct the continuous `𝒪_E`-algebra isomorphism `R≅W_𝒪_E(k)` sending `[a]⊗1` to `[a]`, and its extension `F≅L=Ĕ`. It intertwines `σ_R=φ_p^f⊗1` with the specified arithmetic q-Frobenius. Both valuations are normalized by `v(π)=1`.

Restriction and extension along `F≅L` give inverse exact E-linear tensor equivalences between the finite Frobenius-module category of PadicDifferentialEquationsAndRigidCohomology §RD.1.32, specialized to `O=𝒪_E`, and the category of finite isocrystals over L with coefficient Frobenius σ. Their composites are naturally isomorphic to the respective identities through intertwining maps. Identify the equivariant Hom spaces, ranks, direct sums, tensor Frobenius and dual Frobenius. The §RD.1.27 input is its cyclic block definition; the tensor and dual compatibility here follows from coefficient transport and does not use its Robba-ring tensor theorem with additional hypotheses on O. The supplier's coprime `M_{s,r}` goes to `D(s,r)` with its cyclic basis and wrap `π^s`; the equivalence preserves the slope `s/r`, canonical isoclinic summands and block multiplicities. For `E=ℚ_p` it agrees with the forgetful Witt comparison and the finite Witt bundling comparison and the ordinary Witt equivalence in §RD.1.32. This comparison transports the mixed-characteristic classification; the coefficient field `k((π))` and its classification in equal characteristic are constructed here.

**Checks.**

- For `E=ℚ_p`, `π=p`, the rank-one block with wrap `p^(−2)` is `WittVector.StandardOneDimIsocrystal p k (−2)` under either Witt comparison.
- For ramification index `e>1`, the transported `M_{1,2}` has slope `1/2` with `v(π)=1`, whereas the valuation with `v_p(p)=1` gives `1/(2e)`. Duality gives `D(−1,2)` and its tensor square is `D(−1,1)^{⊕4}`; the bundle associated to `D(−1,2)` has slope `+1/2`.
- If `f>1`, `φ_p⊗1` is not well-defined over `W(𝔽_q)` with the identity action on `𝒪_E`; `φ_p^f⊗1` respects the tensor relations. No p-Frobenius root is part of the comparison.
- The zero object has the empty decomposition under both comparison composites; `M_{1,2}⊕M_{0,1}` retains the slope multiset `{1/2,1/2,0}` and the distinct-slope Hom spaces vanish.

([FF][FF], §1.2.1, Lemma 1.2.3 and the following coefficient comparison, pp. 7–8; §8.2.3, Definition 8.2.5, pp. 236–237; [Ked][Ked], Definition 2.1.3, p. 451, Remark 2.1.11, p. 453, Definition 4.1.1 and Lemma 4.1.2, p. 487, Theorem 4.5.7 and Remark 4.5.8, pp. 498–499.)

*Needs:* PadicDifferentialEquationsAndRigidCohomology §§RD.1.27 and RD.1.32 for mixed-characteristic standard modules and classification; CrystallineCohomology §CR.4.7 for the ordinary Witt comparison; [Ramified coefficient rings](#ramified-coefficient-rings-and-coefficient-changes); [Finite isocrystals over the completed maximal unramified coefficient field](#finite-isocrystals-over-the-completed-maximal-unramified-coefficient-field); ReductiveGroupsPartII §RG2.0.4 for `Ĕ` and arithmetic Frobenius.

#### Rational standard Frobenius blocks

For `E=ℚ_p` transport CrystallineCohomology §CR.4.7’s cyclic blocks through the finite Witt comparison. For mixed-characteristic E transport the coprime blocks of PadicDifferentialEquationsAndRigidCohomology §RD.1.27 through the mixed-characteristic supplier comparison. In equal characteristic construct the blocks over `k((π))`. In all cases, for `s∈ℤ` and `r>0`, define `D(s,r)=L^r` with `Φ(e_i)=e_{i+1}` for `i<r−1` and `Φ(e_{r−1})=π^s e_0`, applying `σ` to coefficients. Then `Φ^r=π^sσ^r` and its isocrystal slope is `s/r`. The coprime pair gives the simple block. FF `M(d,h)` is `D(−d,h)`; its bundle is `O(d/h)`, rank h and degree d.

**API.**

- The standard block is `D(s,r)`, with `r>0` and `π≠0`.
- Evaluate `Φ` on the cyclic basis, including the `π^s` wraparound.
- `Φ^r=π^sσ^r`, with `σ^r` acting coefficientwise.
- The L-rank is r.
- The rational isocrystal slope is `s/r`.
- At `E=ℚ_p`, `r=1`, `D(s,1)` identifies with StandardOneDimIsocrystal s.

**Checks.**

- `D(1,2)` has rank 2 and isocrystal slope 1/2.
- On `D(−1,2)`, `Φ²(e_0)=π⁻¹e_0` fixes the wrap sign. Choose `a∈L` with `σ²(a)≠a`; then `Φ²(ae_0)=π⁻¹σ²(a)e_0≠π⁻¹ae_0`, which excludes coefficient linearity. A Teichmüller lift from `𝔽_{q³}∖𝔽_q` supplies such an a.
- `D(−2,1)` is the pinned rank-one block with exponent `−2`.
- `D(2,2)` has slope 1 and is not simple: it is two copies of `D(1,1)`.

([FF][FF], 8.2.3 before Proposition 8.2.6, p. 237; [Ked][Ked], Definition 4.1.1, printed p. 487.)

*Needs:* CrystallineCohomology §CR.4.7 for Witt blocks; PadicDifferentialEquationsAndRigidCohomology §RD.1.27 for mixed-characteristic coprime blocks; [Mixed-characteristic supplier comparison](#mixed-characteristic-supplier-comparison); [Finite isocrystals over the completed maximal unramified coefficient field](#finite-isocrystals-over-the-completed-maximal-unramified-coefficient-field); `WittVector.StandardOneDimIsocrystal`.

#### Dieudonné–Manin classification of finite isocrystals

Over L with algebraically closed residue field `𝔽̄_q`, every finite E-isocrystal is a finite direct sum of coprime `D(s,r)`; the multiset of rational slopes with block multiplicities is unique. The coprime blocks are simple, Hom between distinct slopes is zero, and every isocrystal short exact sequence splits. This asserts no analogous classification over an arbitrary perfect residue field without descent data. For `E=ℚ_p`, import CrystallineCohomology §CR.4.7’s classification and Hom vanishing and transport them through the forgetful Witt comparison and the finite Witt bundling comparison. For mixed-characteristic E, transport PadicDifferentialEquationsAndRigidCohomology §RD.1.32’s classification, slope decomposition and Hom vanishing through the mixed-characteristic supplier comparison. Its §RD.1.27 supplies the coprime blocks; the classification proof, including the mixed-characteristic eigenvector input, belongs to that supplier. Layer 1 proves the equal-characteristic classification over `k((π))` with coefficient q-Frobenius.

`dieudonneManinEqualChar` in Suggested.lean states existence of a coprime cyclic decomposition and uniqueness of its block-slope multiset in every finite rank and for `q=p^f`, `f>0`. The coefficient automorphism `coefficientFrobenius` acts on Mathlib's `LaurentSeries k` coefficientwise and fixes `π`. `CyclicSlopeDecomposition` records a basis partitioned into positive-rank cyclic blocks with wrap `π^s` and coprime `(s,r)`; its `CyclicSlopeDecomposition.slopes` is the multiset of `s/r`, one entry per simple block. The residue field is algebraically closed; no descent data are discarded over a nonclosed field.

**Checks.**

- The Witt comparison preserves the Frobenius and finite rank, and the two comparison composites have intertwining isomorphisms with the respective identities.
- The supplied rank-two block `D(1,2)` retains slope `1/2`; the finite-field descent does not assert semisimplicity of a slope-zero Jordan block over `𝔽_p`.
- In equal characteristic `D(−1,2)` uses coefficient q-Frobenius and wrap `π⁻¹`, with the same coprime classification.

([Ked][Ked], 4.5.3–4.5.8, pp. 497–499; [Lurie][Lurie], Theorem 6, p. 2; [FF][FF], §8.2.3 before Proposition 8.2.6, pp. 236–237, for the coefficient conventions in both characteristics.)

*Needs:* CrystallineCohomology §CR.4.7 for Witt classification, Hom vanishing and descent; PadicDifferentialEquationsAndRigidCohomology §§RD.1.27 and RD.1.32 for the mixed-characteristic blocks and classification; [Mixed-characteristic supplier comparison](#mixed-characteristic-supplier-comparison); [Rational standard Frobenius blocks](#rational-standard-frobenius-blocks); `WittVector.isocrystal_classification`.

#### Tensor and dual calculus for isocrystals

Finite isocrystals form a rigid exact E-linear tensor category. Tensor Frobenius is `Φ_D⊗Φ_D′` and dual Frobenius is `ℓ↦σ∘ℓ∘Φ_D⁻¹`. Tensor slopes are pairwise sums, dual slopes are negatives. If `a,b` have reduced denominators `h_a,h_b,h_{a+b}`, then `D_a⊗D_b≅D_{a+b}^{⊕h_a h_b/h_{a+b}}`.

([Ked][Ked], Definition 3.1.5 and Lemma 4.1.2, pp. 478, 487; [FF][FF], Proposition 8.2.6, p. 237.)

*Needs:* [Finite isocrystals over the completed maximal unramified coefficient field](#finite-isocrystals-over-the-completed-maximal-unramified-coefficient-field); [Rational standard Frobenius blocks](#rational-standard-frobenius-blocks); [Dieudonné–Manin classification of finite isocrystals](#dieudonnémanin-classification-of-finite-isocrystals).

### Endomorphisms and arithmetic invariants

#### Division endomorphisms of a simple isocrystal

For a field `L`, automorphism `σ`, nonzero finite `L`-space `D` and invertible `σ`-semilinear Frobenius, assume every Frobenius-stable subspace is zero or the whole space. Every nonzero intertwining endomorphism then has a two-sided intertwining inverse. The geometric coefficient hypotheses and standard-block identification in the following assertion give its arithmetic content. (FF Proposition 8.2.8, pp. 237–238.)

For coprime `(s,r)`, `End_Φ(D(s,r))` is a central division algebra over E of dimension `r²`. With `E_r/E` unramified degree r and arithmetic `σ`, it has presentation `⊕_{i=0}^{r−1}E_r Π^i`, `Π^r=π^{−s}`, `Πx=σ(x)Π`. The arithmetic Brauer invariant is determined by the sign comparison below; the stable-bundle endomorphism identification belongs to the classification layer.

([FF][FF], Definition 8.2.7 and Proposition 8.2.8, pp. 237–238.)

*Needs:* [Rational standard Frobenius blocks](#rational-standard-frobenius-blocks); [Dieudonné–Manin classification of finite isocrystals](#dieudonnémanin-classification-of-finite-isocrystals); LocalFieldsRamification / layer 2 unramified extensions and frobenius.

#### Slope-labelled cyclic algebra

For bundle slope `λ=d/h` in lowest terms, `h>0`, set `D_λ=Cyc(E_h/E, σ, π^d)` (arithmetic `σ`), a central division algebra with `Π^h=π^d` and `Πx=σ(x)Π`. Specialize `TauCeti.CrossedProduct` and `TauCeti.BrauerGroup.crossedProductClass` to these slope parameters and identify it with `End_Φ(D(−d,h))`.

**API.**

- Use the cyclic algebra `D_λ` for the reduced pair of `λ`.
- Distinguish the element `Π` with `Π^h=π^d`.
- `Πx=σ(x)Π` for `x∈E_h`; specify arithmetic Frobenius.
- Give an E-basis obtained from an E-basis of `E_h` times `Π^i`, `0≤i<h`.
- Construct an E-algebra equivalence with `End_Φ(D(−d,h))`.

**Checks.**

- `D_3≅E` because the reduced denominator is one.
- `D_{1/2}` has dimension 4 and `Π²=π`.
- `D_{−1/3}` uses `Π³=π^{−1}`, not `π`, and has invariant `−1/3`.
- `D_{1/3}≅End_Φ(D(−1,3))`, not `End_Φ(D(1,3))`.

([FF][FF], Definition 8.2.7, p. 237.)

*Needs:* `TauCeti.CrossedProduct`; `TauCeti.BrauerGroup.crossedProductClass`; `TauCeti.brauerCohomologyEquiv_crossedProductClass`; [Division endomorphisms of a simple isocrystal](#division-endomorphisms-of-a-simple-isocrystal); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality; `TauCeti.CSA.of`.

#### Arithmetic Brauer invariant and slope normalization

Under `TauCeti.brauerCohomologyEquiv_crossedProductClass` and the arithmetic local invariant `inv_E:Br(E)≃ℚ/ℤ`, `inv_E[D_λ]=λ` mod `ℤ`. Restriction to finite `E′/E` multiplies this invariant by `[E′:E]`; the opposite algebra negates it. This fixes the choice `Πx=σ(x)Π` with arithmetic, not geometric, Frobenius.

([FF][FF], Definition 8.2.7, p. 237.)

*Needs:* `TauCeti.brauerCohomologyEquiv`; `TauCeti.brauerCohomologyEquiv_crossedProductClass`; `TauCeti.ClassFieldTheory.invMap`; [Slope-labelled cyclic algebra](#slope-labelled-cyclic-algebra); ClassFieldTheory / layer 5 local coefficients the brauer group the local invariant and duality; `TauCeti.BrauerGroup.baseChange_mk`; `TauCeti.BrauerGroup.mk_end`.

### Coefficient extension and descent

Finite separable coefficient extension needs both tensor–restriction adjunctions. The perfect trace pairing supplies the reverse adjunction without dividing by the extension degree; the same trace formalism will transfer classification maps on the finite coefficient cover.

#### Coefficient extension and induction adjunction

For finite separable `E′/E` of residue degree f, ramification degree e and total degree `n=ef`, identify the coefficient fields compatibly. Pull D to `D⊗_{L_E}L_E′` with Frobenius `Φ^f⊗σ_E′`; induction is the f cyclic conjugate copies of restriction of scalars, with wraparound given by `Φ′`. Pull and induction are adjoint in both directions: `Hom(Pull D,D′)≅Hom(D,Ind D′)` and `Hom(Ind D′,D)≅Hom(D′,Pull D)`. The reverse adjunction uses the perfect separable trace pairing and the identification of finite cyclic induction with coinduction; no division by n is required. Pull preserves rank and scales slopes by n; induction multiplies rank by n and divides isoclinic slopes by n. At the bundle stage they compare to pullback/pushforward along the finite étale coefficient curve map, with its two trace adjunctions.

**Checks.**

- For `E′=E`, Pull and induction are naturally isomorphic to the identity functor, including on the zero object.
- For an unramified degree-two extension, with the same uniformizer, `Pull D_E(−1,1)≅D_E′(−2,1)` has rank one and `Ind D_E′(−1,1)≅D_E(−1,2)` has rank two. Their slopes are respectively `−2` and `−1/2`.
- In equal characteristic, an unramified extension of degree p has `Tr_{E′/E}(1)=0` but a nondegenerate separable trace pairing. Both adjunctions hold without division by p.

([FF][FF], 8.2.3 after Proposition 8.2.8, p. 238; [SW][SW], Theorem 13.5.7, proof, printed p. 114 (PDF p. 124).)

*Needs:* [Finite isocrystals over the completed maximal unramified coefficient field](#finite-isocrystals-over-the-completed-maximal-unramified-coefficient-field); [Dieudonné–Manin classification of finite isocrystals](#dieudonnémanin-classification-of-finite-isocrystals); LocalFieldsRamification / layer 2 unramified extensions and frobenius; SchemeAndStackFoundations §§1.1 and 1.24.

#### Finite Galois descent of isocrystals

Let `L′/L` be finite Galois and let `σ′` be a coefficient automorphism extending `σ`. Finite L-vector spaces with bijective `σ`-semilinear `Φ` are equivalent to finite L′-vector spaces with bijective `σ′`-semilinear `Φ′` and a semilinear Galois descent action `ρ` satisfying `Φ′ρ_g=ρ_{σ′gσ′⁻¹}Φ′` for every `g∈Gal(L′/L)`. The descended module is the invariant module and `Φ′` restricts to a bijective `σ`-semilinear `Φ`. Ordinary commutation with each `ρ_g` is sufficient only when `σ′` centralizes the Galois group. This is module descent with Frobenius, not classification over arbitrary perfect residue fields.

([FF][FF], 8.2.3, Definition 8.2.5, printed p. 236; [Ked][Ked], 4.5.7–4.5.8, pp. 498–499.)

*Needs:* [Finite isocrystals over the completed maximal unramified coefficient field](#finite-isocrystals-over-the-completed-maximal-unramified-coefficient-field); SchemeAndStackFoundations §§1.1 and 1.24.

### Examples

The rank-one Witt object uses Mathlib's Frobenius convention. The block `D(2,2)` splits as two copies of `D(1,1)` over the algebraically closed residue field; coprimality is required for simplicity. The block with slope `−1/2` has endomorphism invariant `1/2` in the conventions above.

### Dependencies

*Needs:* Layer 0 coefficients; CrystallineCohomology §CR.4.7; PadicDifferentialEquationsAndRigidCohomology §§RD.1.27 and RD.1.32; LocalFieldsRamification Layer 2; ReductiveGroupsPartII §RG2.0.4; ClassFieldTheory Layer 5; SchemeAndStackFoundations §§1.1 and 1.24; RepresentationTheory/SemisimpleAlgebras' central-simple-algebra layer.

## Layer 2: Analytic bundles and geometric slope theory

### Bundles, annuli and derived cohomology

Use the supplied absolute annular and schematic comparisons. Extend the analytic equivalence by finite local trivializations and Frobenius descent before relative Proj; a global étale integral model is stronger than purity at every geometric point.

#### Finite locally free bundles on the curve

For `X_S` constructed in Layer 0, `Bun(X_S)` is the category of structure-sheaf modules admitting a covering with finite free trivializations. The same local generator data must be finite and locally free. Schematic bundles specialize Tau Ceti's `FiniteLocallyFreeSheaf` to the schematic curve; the native finite local-basis characterization supplies the paired witness. Analytic bundles use the R3 coherent-sheaf carrier. Pullback, tensor, dual, determinants and exact sequences are transported from these suppliers. Finite rank is required even though the locally free predicate alone allows infinite ranks. Use PrismaticCohomologyPartIII §7.0's bundle restriction of `FilteredBundle.analyticEquivalence` in the supplied absolute specialization; the additional obligations here are the general-coefficient and relative analytic carriers and their schematic comparisons.

**API.**

- A curve bundle is a structure-sheaf module with a single finite locally free local generator witness.
- Construct the free sheaf of finite rank n.
- Bundle morphisms are equal iff the underlying sheaf morphisms are equal.
- Construct pullback along curve-base change, with identity and composition isomorphisms.
- Give tensor, unit, dual and evaluation from the structure-sheaf module category.
- Apply the pinned finite-presentation theorem to the same finite locally free witness.

**Checks.**

- The free sheaf on the empty family is a bundle of rank 0.
- `O_X⊕O_X` is a bundle of rank 2.
- On a nonempty geometric curve, a free sheaf on an infinite constant basis is not finite locally free; test its nonzero residue-field stalk. The nonempty hypothesis excludes the empty scheme, where the zero sheaf admits every vacuous presentation.
- For a scheme, forgetting CurveBundle returns its Scheme.Modules object with the pinned finite locally free data.

([FS][FS], II.2 preamble and Proposition II.2.1, pp. 57–58.)

*Needs:* PrismaticCohomologyPartIII §7.0 / layer-7-absolute-ff for the supplied absolute specialization; [Relative analytic quotient](#relative-period-domain-and-analytic-quotient); AdicSpacesPartIII §R3.5; AdicSpacesPartIII §§R3.1–R3.4; SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4; AlgebraicVectorBundles L0A–L0C and the supplied `FiniteLocallyFreeSheaf` interface; `AlgebraicGeometry.Scheme.Modules`; `SheafOfModules.LocalGeneratorsData.IsLocallyFreeData`; `SheafOfModules.LocalGeneratorsData.IsFiniteType`; `SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation`.

#### Annular Frobenius descent for bundles

For affinoid perfectoid S of characteristic p over `𝔽_q`, finite locally free bundles on `X_S` are equivalent, exactly and tensorially, to finite projective bundles on the Layer 0 closed annuli with compatible overlap identifications and bijective Frobenius identification under radius rescaling. In the supplied absolute specialization use the annular restriction and gluing of PrismaticCohomologyPartIII §7.0, `FilteredBundle.robbaEquivalence`. Extend these maps to general E and S; restriction to a fundamental annular range and Frobenius translates gives the inverse. Cohomology on `Y_S` is acyclic in positive degrees by sousperfectoid annular acyclicity and dense restriction maps.

([FS][FS], II.2 preamble, p. 57; [CS][CS], 3.3.4, p. 683.)

*Needs:* PrismaticCohomologyPartIII §7.0 / layer-7-absolute-ff for the supplied absolute specialization; PadicHodgeTheory §7.5 for the p-typical relative interfaces; [Finite locally free bundles on the curve](#finite-locally-free-bundles-on-the-curve); [Ramified coefficient rings](#ramified-coefficient-rings-and-coefficient-changes); [Relative annuli](#relative-annuli-and-their-section-rings); [Relative analytic quotient](#relative-period-domain-and-analytic-quotient); AdicSpacesPartIII §R3.5; AdicSpacesPartIII §§R3.1–R3.4; SchemeAndStackFoundations §§2.2 and 2.5; [Annular quasi-Stein cohomology](#relative-annuli-and-their-section-rings).

#### Relative tilted Robba ring from curve annuli

Use the absolute extended Robba coefficients in PrismaticCohomologyPartIII §7.0's `FilteredBundle.robbaEquivalence` and the p-typical relative carrier of PadicHodgeTheory §7.5. Extend them through the coefficient-compatible annuli of Layer 0 to general E and perfectoid affinoid `S=Spa(R,R⁺)` in characteristic p. The resulting `R̃_R` has the presentation `colim_{r>0} lim_{s→0} Γ(Y_{S,[s,r]},O)`. At fixed r the inverse limit has its Fréchet seminorms, and the union carries the corresponding LF topology. Frobenius rescales radii by q. In the supplied absolute specialization identify this presentation, its topology and Frobenius with Part III's coefficients and CS17 3.2.10. Absolute field R gives a Bézout ring; no such assertion is made for every affinoid R.

For `E=ℚ_p`, a positive exponent η in the Layer 0 norm corresponds to Part III's geometric norm parameter `ρ=p^(−1/η)`: the geometric norm is the `1/η` power of the Layer 0 norm. Thus `η→0` gives `ρ→0`, or `−log_pρ→∞`. This identifies the Robba end and the cofinal annular seminorms, including the reciprocal conversion to the supplied `κ`-windows. (SW Definition 13.4.3, pp. 111–112; Part III §7.0's annulus dictionary.)

**API.**

- Use the annular inverse-limit/filtered-union ring.
- Give cofinal radius restriction maps, compatible with composition.
- Give a coefficient-semilinear ring automorphism with radius rescaling q.
- Give the family of annular seminorms on fixed-radius Fréchet pieces.
- For `E=ℚ_p` identify the ring, Frobenius and topology with CS17 3.2.10, and in the supplied absolute specialization with Part III's extended Robba coefficients.

**Checks.**

- Using `s_j→0` in a fixed r inverse limit produces the same ring and topology.
- The zero compatible annular family has all seminorms zero.
- At `ℚ_p`, Frobenius moves the outer radius r to `r/p` in the CS convention.
- Replacing the fixed-r inverse limit by an algebraic union loses compatible sections defined on all sufficiently small inner radii.

([CS][CS], Definition 3.2.10 and Theorems 3.2.13, 3.3.4, pp. 681–683.)

*Needs:* PrismaticCohomologyPartIII §7.0 / layer-7-absolute-ff for the supplied absolute specialization; PadicHodgeTheory §7.5 for the p-typical relative carriers and comparison maps; [Ramified coefficient rings](#ramified-coefficient-rings-and-coefficient-changes); [Relative annuli](#relative-annuli-and-their-section-rings); [Annular Frobenius descent for bundles](#annular-frobenius-descent-for-bundles).

#### Finite projective Frobenius modules and integral models

A Robba Frobenius module is a finite projective `R̃_R`-module M with a semilinear Frobenius whose linearization `φ*M→M` is an isomorphism. In the supplied absolute specialization use the finite projective source category of PrismaticCohomologyPartIII §7.0, `FilteredBundle.robbaEquivalence`; the interface here also carries general coefficients, relative bases and integral models. A globally étale model is a finite locally free module over the integral Robba ring whose linearized Frobenius is invertible and whose scalar extension is M. This defines the global model predicate needed in KL 8.8.7; equivalence with pointwise purity or local systems is not included here and remains Layer 6-owned.

**API.**

- A Frobenius module consists of finite projective M with invertible Frobenius linearization.
- Its morphisms are R̃-linear maps commuting with Frobenius.
- Construct base change of modules and linearizations under coefficient-compatible perfectoid maps.
- A global étale model is an integral finite locally free model and Frobenius identification.
- Global étaleness means existence of such a global model; independent of presentation.

For a coefficient map `A → R` with compatible automorphisms `φ_A, φ_R` and finite projective `N/A`, construct scalar-extension Frobenius on `R ⊗_A N` with `r ⊗ n ↦ φ_R(r) ⊗ Φ_N(n)`. Prove that its semilinearity is with respect to `φ_R`, and that its inverse uses both inverse Frobenius maps. A global étale model retains the finite projective integral module, its invertible semilinear Frobenius and an `R`-linear scalar-extension equivalence intertwining this map with the given module Frobenius. Base change uses this same construction. The trivial rank-one module has Frobenius `φ_R`; for a unit `a`, the rank-one unit module has `x ↦ aφ_R(x)`. Invertibility of `a` is required, and an integral unit gives the specified integral model. (CS Theorem 3.3.4, p. 683; KL Definitions 7.3.1 and 7.3.4, pp. 147–149.)

**Checks.**

- The rank-one ring with its own Frobenius has its evident integral étale model.
- Zero linearization on a nonzero free module is excluded.
- Over an absolute field the module is free by the field Bézout theorem, while its definition remains finite projective.
- A rank-one Frobenius multiplier that is an integral unit preserves an invertible rank-one integral model.

([CS][CS], Definition before Theorem 3.3.4, p. 683 (absolute case before 3.2.13, p. 681); [KL][KL], 7.3.4–7.3.5, pp. 148–149.)

*Needs:* PrismaticCohomologyPartIII §7.0 / layer-7-absolute-ff for the supplied absolute specialization; [Relative tilted Robba ring from curve annuli](#relative-tilted-robba-ring-from-curve-annuli); AdicSpacesPartIII §R3.5; AdicSpacesPartIII §§R3.1–R3.4.

#### Exact tensor equivalence of Robba modules and curve bundles

For affinoid perfectoid characteristic-p S, the equivalence between finite projective Frobenius modules over R̃_S and bundles on X_S is an exact tensor equivalence, commuting with base change and duals. Its supplied absolute specialization is PrismaticCohomologyPartIII §7.0's `FilteredBundle.robbaEquivalence`, followed by `FilteredBundle.analyticEquivalence` on bundles. For p-typical relative S reuse PadicHodgeTheory §7.5's equivalence and maps (CS17 3.3.4), identifying their absolute specialization with those supplied maps. Extend to general E by spreading a finite presentation to sufficiently small annuli, extending across Frobenius translates and descending to `X_S`; the inverse takes compatible annular sections. This extension uses the normalized Layer 0 coefficient interface and precedes relative Proj/GAGA.

**Checks.**

- The zero module and unit module give the zero bundle and structure sheaf under both supplied and extended comparisons.
- At `E=ℚ_p`, the rank-one multiplier `p⁻¹` gives `𝒪(1)` and section equation `φ(f)=pf`.
- Restricting to a different Frobenius-covering annular window gives canonically the same bundle and comparison on morphisms.

([CS][CS], Theorem 3.3.4, p. 683; [KL][KL], 6.3.12, p. 141.)

*Needs:* PrismaticCohomologyPartIII §7.0 / layer-7-absolute-ff for the supplied absolute specialization; PadicHodgeTheory §7.5 for the p-typical relative carriers and comparison maps; [Finite projective Frobenius modules and integral models](#finite-projective-frobenius-modules-and-integral-models); [Annular Frobenius descent for bundles](#annular-frobenius-descent-for-bundles).

#### Two-term Frobenius complex for curve cohomology

For a bundle V descended from M on `Y_S`, derived global sections on `X_S` identify with the homotopy fiber of `φ−1` on `RΓ(Y_S,M)`. When S is affinoid perfectoid, annular Stein acyclicity reduces this to `[Γ(Y_S,M) →^{φ−1} Γ(Y_S,M)]` in degrees 0 and 1. `H⁰` is the kernel, `H¹` the cokernel and `H^i=0` for `i>1`. The differential is E-linear, not L-linear; negative shifted complexes are interpreted by hypercohomology, never by a bare cokernel definition of Banach–Colmez spaces.

**API.**

- Use the E-linear two-term complex in degrees 0 and 1.
- The differential sends x to `φ(x)−x`.
- `H⁰=ker(φ−1)`.
- `H¹=coker(φ−1)`.
- A Frobenius-equivariant bundle morphism induces a cochain map.
- An E-linear intertwiner induces maps on the actual kernel and quotient, sending a fixed vector to its image and a coinvariant class to the class of its image.
- For affinoid perfectoid S, the two-term ordinary-section complex is canonically quasi-isomorphic to `RΓ(X_S,V)`, compatible with affinoid perfectoid pullback. For arbitrary S use the derived homotopy fibre above.

Identify degrees zero and one of the complex with the section module and every other degree with zero. Prove that its categorical cohomology in degrees zero and one is isomorphic to the actual kernel and quotient by the image of `φ − 1`, respectively. Intertwiners induce cochain maps, respecting identity, composition and both cohomology identifications. These are isomorphisms of `E`-modules; scalar extension to an `L`-linear statement requires a separate fixed-scalar hypothesis. (FS §II.2 preamble, p. 57.)

**Checks.**

- For the zero module both terms and both cohomology groups vanish.
- For `φ=id` on a nonzero E-vector space the differential is zero, so `H⁰` and `H¹` both equal that space.
- On a nonzero E-space, `φ=2·id` has `φ−id=id`, so `H⁰=0` and `H¹=0`; in particular this holds in rank one, including characteristic two.
- On a nonaffinoid perfectoid S, higher cohomology of `RΓ(Y_S,M)` must be retained; for the completed perfection of an ordinary abelian surface over an algebraically closed characteristic-p perfectoid field, `H²_proét(S,ℚ_p)≠0` and hence `H²(X_S,O)≠0`.
- `H⁰` consists precisely of `φ`-fixed vectors, not all vectors.
- The cokernel occupies degree 1, and cannot represent `H⁰(V)` for an arbitrary V.

([FS][FS], II.2 preamble, p. 57.)

*Needs:* PadicHodgeTheory §7.6 for p-typical derived Frobenius comparison; [Annular Frobenius descent for bundles](#annular-frobenius-descent-for-bundles); SchemeAndStackFoundations §§2.2 and 2.5; [Annular quasi-Stein cohomology](#relative-annuli-and-their-section-rings).

#### V-descent of bundles and their derived cohomology

On `Perf/𝔽_q`, `S↦Bun(X_S)` is a v-stack. For any perfectoid S and `V∈Bun(X_S)`, `T↦RΓ(X_T,V_T)` on Perf/S is a derived v-sheaf. In the affinoid case this follows after completed tensoring with the perfectoid completed coefficient extension `E_∞`, where closed annuli become affinoid perfectoid, and descending the finite projective module data. Both arrows and effective objects descend.

([FS][FS], Proposition II.2.1, pp. 57–58.)

*Needs:* [Annular Frobenius descent for bundles](#annular-frobenius-descent-for-bundles); [Two-term Frobenius complex for curve cohomology](#two-term-frobenius-complex-for-curve-cohomology); DiamondsAndVStacks D2 / higher-v-acyclicity; DiamondsAndVStacks D2 / v-descent-of-functions; SchemeAndStackFoundations §§1.1 and 1.24.

#### The exact tensor isocrystal-to-bundle functor

Fix `k=𝔽̄_q` and its coefficient inclusion in `L=Ĕ`. For perfectoid `S/k` with the specified k-structure, define `E_S(D)` by descending `D⊗_L O_{Y_S}` along `Φ_D⊗φ_Y`. It is an exact tensor functor from finite E-isocrystals to `Bun(X_S)`, compatible with duals, k-compatible base change and finite coefficient pull/induction. For any perfectoid `S/𝔽_q`, define the standard `O_{X_S}(d/h)` directly by descending the cyclic rank-h Frobenius matrix with wrap coefficient `π^{−d}`; this needs no chosen k-embedding. After base change to k it agrees with `E_S(D(−d,h))`. Its rank is h, `O(n)` agrees with Layer 0 rank-one twists, and `O(λ)∨=O(−λ)`. Geometric degree d is a later consequence of degree-rank-slope-and-HN-formalism, not an input to this construction. No relative classification is asserted.

For the general finite-isocrystal functor, S is over the fixed `k=𝔽̄_q` so that L embeds in `O_{Y_S}`. The standard cyclic bundles alone are defined over `𝔽_q`.

**API.**

- For S over the fixed `k=𝔽̄_q`, construct the analytic Frobenius-descended bundle `E_S(D)`, retaining the coefficient embedding.
- Descend an intertwining linear map; preserve identity and composition.
- Give the functor an exact tensor structure and dual compatibility.
- For `S/𝔽_q`, descend the cyclic matrix for `(−d,h)`; over k compare with `E_S(D(−d,h))`.
- `O(n)` identifies with Layer 0 rank-one twists, with their tensor laws.
- Perfectoid pullback preserves the cyclic standard bundle; general `E_S(D)` pullback retains the chosen k-embedding. At a geometric point, coefficient pullback multiplies `λ` by `[E′:E]`, as proved with degree and scalar extension.

**Checks.**

- `O(0)` is the tensor unit of rank 1, rather than the rank-zero bundle.
- Over geometric `C/k`, `D(1,2)` maps to `O(−1/2)`, rank 2; the degree `−1` check belongs after geometric degree is constructed.
- `D(−2,1)` maps to the Layer 0 twist `O(2)`.
- Over geometric `C/k`, `O(1/2)⊗O(1/2)≅O(1)^{⊕4}`; rank 4 detects omission of the tensor multiplicity.

([FS][FS], II.2 preamble, p. 58; [FF][FF], Proposition 8.2.6 and Remark 8.2.9, pp. 237–238.)

*Needs:* [Finite isocrystals over the completed maximal unramified coefficient field](#finite-isocrystals-over-the-completed-maximal-unramified-coefficient-field); [Rational standard Frobenius blocks](#rational-standard-frobenius-blocks); [Tensor and dual calculus for isocrystals](#tensor-and-dual-calculus-for-isocrystals); [Coefficient extension and induction adjunction](#coefficient-extension-and-induction-adjunction); [Annular Frobenius descent for bundles](#annular-frobenius-descent-for-bundles); [V-descent of bundles and their derived cohomology](#v-descent-of-bundles-and-their-derived-cohomology); [Rank-one Frobenius twists](#rank-one-frobenius-twists).

### Standard twist cohomology

This target uses the early Lubin–Tate and fundamental-sequence targets of Layer 5 together with Frobenius cohomology. Its early basic construction excludes the later divisor-to-Weil comparison, family HN splitting and general two-term representability.

#### Slope-sensitive cohomology of standard bundles

For `λ<0`, `H⁰(X_S,O(λ))=0` and the v-sheaf `H¹(O(λ))` is locally spatial, partially proper and cohomologically smooth. For `λ=0`, the degree-zero v-sheaf is topological underline E and the pro-étale sheafification of degree-one cohomology is zero; `RΓ_proét(S,E)≃RΓ(X_S,O)`. For `λ>0` and affinoid S, `H¹(X_S,O(λ))=0`; its `H⁰` v-sheaf is locally spatial, partially proper and cohomologically smooth. On `Perf_k`, for `0<λ=d/h≤[E:ℚ_p]` in mixed characteristic, and for every positive λ in equal characteristic, the absolute `H⁰` v-sheaf is `Spd k[[x₁^{1/p∞},…,x_d^{1/p∞}]]`. After pullback to a perfectoid base this is the relative d-dimensional perfectoid open ball. The absolute formal object itself is not asserted to be a perfectoid space; the displayed range is sufficient. Nonaffinoid global `H¹` vanishing is not asserted. The negative `λ=−1` presentation is `(A¹_{S♯})^diamond/E` on an untilt cover.

**Checks.**

- At `λ=1`, the absolute formal object includes its zero section `Spd k`; removing it gives the punctured Lubin–Tate perfectoid space.
- Pullback of the formal object to a perfectoid base is the relative open ball, preserving its zero section.
- At `λ=0`, sections on two geometric points are `E²`, and at `λ=−1` sections vanish while degree-one cohomology is nonzero.

([FS][FS], Proposition II.2.5 and proof, pp. 62–64.)

*Needs:* [The exact tensor isocrystal-to-bundle functor](#the-exact-tensor-isocrystal-to-bundle-functor); [Two-term Frobenius complex for curve cohomology](#two-term-frobenius-complex-for-curve-cohomology); [V-descent of bundles and their derived cohomology](#v-descent-of-bundles-and-their-derived-cohomology); [Lubin–Tate universal cover and sections of O(1)](#lubintate-universal-cover-and-sections-of-o1); [The fundamental untilt sequence and degree-one divisors](#the-fundamental-untilt-sequence-and-degree-one-divisors); [Coefficient extension and induction adjunction](#coefficient-extension-and-induction-adjunction).

### The geometric curve and its local rings

At a geometric point, use Part III's absolute curve and bundle comparison in its supplied specialization. Extend them to the arbitrary E and geometric C of this roadmap: classical points are untilts, and degree-one Lubin–Tate sections produce the divisors giving homogeneous chart coverage. Use two distinct divisor points to cover the curve. This extension precedes general relative GAGA.

#### Classical points and annular Dedekind rings

For complete algebraically closed perfectoid `C/𝔽_q` and a connected affinoid `U=Spa(B,B⁺)` in `Y_C`, `Spm(B)` identifies with the classical points of U, whose residue fields are untilts of C over E. B is a PID. On `X_C`, classical points are Frobenius orbits and affinoid chart rings are Dedekind domains; their PID upgrade is obtained from geometric Picard degree, rather than assumed as an early analytic input.

**Checks.**

- At an untilt point the residue field is its own untilt of C, with the chosen E embedding.
- Every nonzero finitely generated ideal of a connected annular chart ring is principal.
- Passing from `Y_C` to `X_C` identifies Frobenius translates of a classical point; it does not identify distinct untilt orbits.

([FS][FS], Proposition II.1.11, Corollary II.1.12 and Definition/Proposition II.1.22, pp. 53–57.)

*Needs:* Layer 0 coefficient and annular constructions; AdicSpacesPartIII §§R3.1–R3.5; [Ramified coefficient rings](#ramified-coefficient-rings-and-coefficient-changes); [Relative annuli](#relative-annuli-and-their-section-rings); [Relative analytic quotient](#relative-period-domain-and-analytic-quotient); PerfectoidSpaces P1–P3; AdicSpacesPartIII §R3.5; AdicSpacesPartIII §§R3.1–R3.4.

#### Elementary algebraization at a geometric point

For complete algebraically closed perfectoid C, Layer 0 supplies `P_C=⊕_{n≥0}Γ(X_C,O(n))` and chart maps on nonvanishing loci. In the supplied absolute specialization use PrismaticCohomologyPartIII §7.0's `FilteredBundle.schemeCurve` and the bundle restriction of `FilteredBundle.analyticEquivalence`. Extend their map `α_C:X_C→Proj(P_C)` and exact tensor bundle comparison to arbitrary E and C by the classical-point description, Lubin–Tate degree-one divisor sections and chartwise finite-projective comparison. Identify the extended map and equivalence with the supplied ones on every homogeneous chart. The extension precedes the general-S ampleness/GAGA theorem.

**API.**

- Use the supplied absolute global map `α_C` and its general-coefficient geometric extension.
- On `D(f)`, the map is the Layer 0 map to `D_+(f)`.
- The chart maps agree on `D(fg)` under homogeneous localization.
- Construct an exact tensor equivalence of analytic and schematic finite locally free bundles at C.
- Classical points map bijectively to schematic closed points.

**Checks.**

- A nonzero divisor section is nonvanishing at every nonclassical point.
- The section vanishing at x cannot alone define a chart containing x; use a section with a distinct zero divisor.
- The maps for f and g agree on `D(fg)`.

([FS][FS], Proof of Proposition II.2.9, p. 68; [FS][FS], Proposition II.2.7, pp. 66–67.)

*Needs:* PrismaticCohomologyPartIII §7.0 / layer-7-absolute-ff for the supplied absolute specialization; [Classical points and annular Dedekind rings](#classical-points-and-annular-dedekind-rings); [Rank-one Frobenius twists](#rank-one-frobenius-twists); [Homogeneous section ring](#homogeneous-section-ring-and-partial-schematic-charts); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [Lubin–Tate universal cover and sections of O(1)](#lubintate-universal-cover-and-sections-of-o1); AdicSpacesPartIII §R3.5; AdicSpacesPartIII §§R3.1–R3.4; SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4.

#### Regular noetherian geometric curve and PID complements

For complete algebraically closed perfectoid C, `X_C^alg=Proj(P_C)` is connected, regular, noetherian and one-dimensional. Consume PrismaticCohomologyPartIII §7.0's `FilteredBundle.schemeCurve` for the supplied absolute specialization and extend these properties to arbitrary E and C. Classical points correspond bijectively to its closed points; for every classical x the complement of x in `X_C^alg` is affine with PID coordinate ring. Degree-one untilt divisor sections cut out `Spec(C♯)` and their nonvanishing complements give these charts.

([FS][FS], Proposition II.2.9 and proof, p. 68.)

*Needs:* PrismaticCohomologyPartIII §7.0 / layer-7-absolute-ff for the supplied absolute specialization; [Elementary algebraization at a geometric point](#elementary-algebraization-at-a-geometric-point); [Classical points and annular Dedekind rings](#classical-points-and-annular-dedekind-rings); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4.

#### Untilts and completed local rings

At a classical point x of the geometric curve, identify the completed local ring with the Layer 0 untilt period DVR, whose residue field is `C_x♯`. Use PrismaticCohomologyPartIII §7.0's `FilteredBundle.untiltCompletion` at its marked absolute untilt and extend the comparison to arbitrary E, C and x. At `E=ℚ_p` the ring is `B_dR⁺(C_x♯)`. A uniformizer `t_x` depends on a choice of generator; neither its equality with a global t nor the equality of every untilt with a fixed `C♯` is asserted.

([CN (arXiv)][CN-arXiv], §3.2.1, p. 14.)

*Needs:* PrismaticCohomologyPartIII §7.0 / layer-7-absolute-ff for the supplied absolute specialization; [Regular noetherian geometric curve and PID complements](#regular-noetherian-geometric-curve-and-pid-complements); [Completed local period rings](#completed-local-period-rings).

#### Picard group of the geometric curve

At complete algebraically closed C, the map `Z→Pic(X_C)`, `n↦[O(n)]`, is an isomorphism of groups. Every classical point has divisor class `[O(1)]`. Use the existing invertible-sheaf category and the commutative group `LineBundleClass`, whose inverse is induced by duality. The curve-specific integer classification is this target.

([FS][FS], Proposition II.2.10 and proof, p. 68.)

*Needs:* [Regular noetherian geometric curve and PID complements](#regular-noetherian-geometric-curve-and-pid-complements); [Elementary algebraization at a geometric point](#elementary-algebraization-at-a-geometric-point); [The exact tensor isocrystal-to-bundle functor](#the-exact-tensor-isocrystal-to-bundle-functor); `TauCeti.AlgebraicGeometry.InvertibleSheaf`; `TauCeti.AlgebraicGeometry.LineBundleClass`; `CommRing.Pic`.

### Degree, saturation and Harder–Narasimhan theory

Degree bounds for subbundles of each rank and the saturation axioms establish HN existence before classification. Construct meromorphic trivializations with bounded finite divisor poles, and derive the degree upper bounds by exterior powers; this argument must not assume general relative positive generation. Filtration pieces are saturated, slopes decrease strictly, and rank lengths determine the concave polygon.

#### Rank, determinant degree and rational slope

For `V∈Bun(X_C)`, `rank(V)` is its finite locally constant rank, constant on connected `X_C`. Set `deg(V)=PicDegree(det V)∈ℤ` and `μ(V)=deg(V)/rank(V)∈ℚ` only for `V≠0`. Rank and degree are additive in bundle short exact sequences; `deg(V⊗W)=rank(W)deg(V)+rank(V)deg(W)`, `deg(V∨)=−deg(V)`. For `O(d/h)` in reduced form, `rank=h` and `degree=d`. No global degree function on arbitrary perfectoid S is asserted; Layer 6 uses geometric fibers.

**API.**

- Rank is constant and finite on `X_C`.
- Degree is the integer Picard degree of the determinant.
- Slope is the rational degree/rank for a nonzero bundle.
- Degree and rank add in short exact sequences.
- Prove the tensor determinant formula and dual sign.
- For `λ=d/h` reduced, rank `O(λ)=h` and degree `O(λ)=d`.

**Checks.**

- Rank and degree of the zero bundle are both zero; slope is undefined.
- `O(1/2)` has `(rank,degree,slope)=(2,1,1/2)`.
- `O(1/2)∨` has rank 2, degree `−1` and slope `−1/2`.
- `O(1)⊕O(−1)` has rank 2 and degree 0, although its HN slopes are 1 and `−1`.

([FS][FS], After Proposition II.2.10, pp. 68–69; [FF][FF], 5.5.1, pp. 162–163 (rank/degree axioms p. 162; Definition 5.5.1 p. 163).)

*Needs:* [Finite locally free bundles on the curve](#finite-locally-free-bundles-on-the-curve); [Picard group of the geometric curve](#picard-group-of-the-geometric-curve); [Tensor and dual calculus for isocrystals](#tensor-and-dual-calculus-for-isocrystals); [The exact tensor isocrystal-to-bundle functor](#the-exact-tensor-isocrystal-to-bundle-functor); SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4.

#### Saturation and torsion degree on the geometric curve

For a coherent subsheaf F of a geometric bundle V, its saturation `F^sat` is the inverse image of the torsion subsheaf of `V/F`, so `V/F^sat` is torsion free and locally free on the regular one-dimensional curve. A torsion coherent sheaf T has degree `∑_x length_{O_x}(T_x)deg(x)`, with `deg(x)=1` at a classical point. A generic-fiber isomorphism `F→G` of bundles satisfies `deg(F)≤deg(G)`, with equality iff it is an isomorphism. This gives the strict-subobject and degree-monotonicity HN axioms.

**API.**

- Saturation is the saturated inverse image inside V.
- It is the smallest saturated subsheaf containing F; its quotient is torsion free.
- Saturating an already saturated subsheaf does nothing.
- Torsion degree is the finite sum of local DVR lengths times point degree.
- Torsion degree is additive in short exact sequences.
- Generic bundle injection has nonnegative degree defect, zero precisely for an isomorphism.

**Checks.**

- The zero subbundle of a torsion-free bundle is saturated.
- The image `O(−1)⊂O` cut out by one classical point saturates to O, with torsion degree 1.
- `O_x/(t_x²)` has degree 2, not degree 1.
- Equal generic rank does not make `O(−1)→O` an isomorphism; its degree defect is positive.

([FF][FF], 5.5.2.1, printed p. 164; generic-isomorphism axioms in 5.5.1, p. 162.)

*Needs:* [Regular noetherian geometric curve and PID complements](#regular-noetherian-geometric-curve-and-pid-complements); [Untilts and completed local rings](#untilts-and-completed-local-rings); [Rank, determinant degree and rational slope](#rank-determinant-degree-and-rational-slope); SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4.

#### Stable and semistable geometric bundles

A nonzero bundle V on `X_C` is semistable if every proper nonzero saturated subbundle F has `μ(F)≤μ(V)`, and stable if the inequality is strict. Checking all coherent subsheaves of smaller positive rank is equivalent after saturation. The zero bundle is admitted into each fixed-slope subcategory separately, but has no slope and is not called stable.

**API.**

- Semistability requires nonzero V and the weak inequalities for proper saturated subbundles.
- Stability requires nonzero V and the strict inequalities.
- Stable implies semistable.
- Stability and semistability are invariant under bundle isomorphisms.
- Give an equivalent test using coherent subsheaves of smaller positive rank.

**Checks.**

- Every line bundle is stable: there is no proper positive-rank saturated subbundle.
- `O⊕O` is semistable of slope 0 but is not stable.
- `O(1)⊕O(−1)` is not semistable: `O(1)` has slope `1>0`.
- The zero bundle is not stable and is never assigned a finite slope.

([FS][FS], Before Example II.2.11, p. 69; [FF][FF], Definition 5.5.5 and Proposition 5.5.6, p. 164.)

*Needs:* [Rank, determinant degree and rational slope](#rank-determinant-degree-and-rational-slope); [Saturation and torsion degree on the geometric curve](#saturation-and-torsion-degree-on-the-geometric-curve).

#### Harder–Narasimhan filtration of geometric bundles

Every bundle V on `X_C` has a unique finite exhaustive filtration by saturated subbundles with nonzero semistable graded pieces of strictly decreasing rational slopes. Write `V^{≥λ}` for the decreasing threshold filtration; it is functorial and invariant under isomorphism. The zero bundle has the empty filtration. Existence uses the HN axioms, including boundedness of degrees of subbundles of each rank; it does not use the geometric classification theorem.

**API.**

- Construct the unique saturated finite decreasing-slope filtration.
- Define the subbundle `V^{≥λ}` for a rational threshold `λ`.
- The graded bundles are semistable; specify their ranks and degrees.
- Every filtration satisfying these properties equals the canonical one.
- Every bundle morphism preserves each threshold piece.
- A nonzero bundle is semistable iff it has one HN slope.

**Checks.**

- The zero bundle has no nonzero HN graded pieces.
- `O(1)⊕O(−1)` has descending HN slopes `1,−1` and rank-one pieces.
- `O⊕O` has one slope-zero piece of rank 2, rather than two strictly decreasing equal slopes.
- For `O(1)⊕O(−1)`, the threshold `≥0` is `O(1)`.

([FS][FS], Proposition II.2.12, p. 69; [FF][FF], 5.5.1–5.5.4, pp. 162–164.)

*Needs:* [Stable and semistable geometric bundles](#stable-and-semistable-geometric-bundles); [Saturation and torsion degree on the geometric curve](#saturation-and-torsion-degree-on-the-geometric-curve); [Rank, determinant degree and rational slope](#rank-determinant-degree-and-rational-slope); [Regular noetherian geometric curve and PID complements](#regular-noetherian-geometric-curve-and-pid-complements); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles).

#### Rank-normalized Harder–Narasimhan polygon

For HN graded pieces with ranks `r_i` and slopes `λ_1>…>λ_m`, the HN polygon is the concave piecewise-linear function on [0,rank V] starting at (0,0), with segment length `r_i` and slope `λ_i`. It ends at (rank V,deg V). For `V=0` it is the single point (0,0). Use rank lengths, not one unit per simple block.

**API.**

- Use the rational piecewise-linear polygon from HN graded data.
- The vertices are the cumulative rank and degree pairs.
- The endpoint is (rank V,deg V).
- The polygon has decreasing segment slopes.
- Direct sum merges the descending slope multisets, weighted by ranks.

On ranked degree data write each piece as `(r_i,d_i)`, with `r_i > 0` and strictly decreasing `d_i/r_i`. These pieces determine the polygon and its numerical invariants. Define total rank as `Σ r_i`, total degree as `Σ d_i` and the rank-weighted multiplicity of a slope s as `Σ_{d_i/r_i=s} r_i`; vertices are cumulative rank and degree sums starting at `(0,0)`. Construct polygon evaluation by piecewise-linear interpolation, and extend constantly beyond the two endpoints. The vertex evaluation identity identifies every listed vertex with the function value; concavity is asserted only on `[0,Σ r_i]`. The direct-sum construction sorts and coalesces equal slopes, and the direct-sum multiplicity identity adds the rank-weighted multiplicities. The zero polygon is the empty polygon. The empty list, `(2,1)`, and `(1,1),(1,−1)` give the zero, half-slope and split test polygons, respectively. (FF Theorem 5.5.3, p. 163.)

**Checks.**

- The zero polygon has only (0,0).
- For `O(1/2)` the endpoint is (2,1), not (1,1/2).
- For `O(1)⊕O(−1)`, vertices are (0,0),(1,1),(2,0).
- The polygon of `O(1)⊕O(−1)` is not the horizontal rank-two degree-zero segment.

([FF][FF], Theorem 5.5.3, p. 163.)

*Needs:* [Harder–Narasimhan filtration of geometric bundles](#hardernarasimhan-filtration-of-geometric-bundles).

### Examples

The zero bundle has the empty filtration and polygon endpoint `(0,0)`. The bundle `𝒪(1/2)` has rank two and degree one; `𝒪(1) ⊕ 𝒪(−1)` has the intermediate vertex `(1,1)`, although its degree is zero. At each closed point use its own untilt field in the completed local-ring comparison.

### Dependencies

*Needs:* PrismaticCohomologyPartIII §7.0 / layer-7-absolute-ff; Layer 0 relative geometry and Layer 1; AdicSpacesPartIII §§R3.1–R3.5; SchemeAndStackFoundations §§0.3–0.4, 2.2, 2.5 and 3.3–3.4; PerfectoidSpaces P1–P3; DiamondsAndVStacks D2–D3; the Lubin–Tate and untilt-sequence targets in Layer 5, in the construction order stated above.

## Layer 3: Positive generation and algebraization

### Positive twists and the global schematic comparison

Use Part III's absolute Proj and GAGA maps. For their relative and general-coefficient extensions, the generation proof separates the two half-annuli and uses the corrected contraction bounds of KL §§6.2.2–6.2.4. A general-E proof transports these bounds through the normalized `π/q` coefficient comparison. Construct invertible large-degree shifts first, then recover the degree-one line from consecutive powers. These inputs extend the global map and bundle GAGA equivalence.

#### Global generation and vanishing after positive twists

For affinoid perfectoid `S/𝔽_q` and `V∈Bun(X_S)`, there is `n_0` such that for every `n≥n_0`, `V(n)` is generated by finitely many global sections and `H^i(X_S,V(n))=0` for all `i>0`. The bound depends on V and the chosen affinoid S. On a general perfectoid base the assertion is local on S; no uniform global bound is asserted. Prove the finite-presentation and matrix-factorization steps using the two half-annulus contraction estimates of KL 6.2.2–6.2.4 and Remark 6.2.5; these are part of the generation theorem, with the stated annular norms.

([FS][FS], Theorem II.2.6 and proof, pp. 64–66; [KL][KL], Propositions 6.2.2–6.2.4 and Remark 6.2.5, pp. 136–137.)

*Needs:* [Exact tensor equivalence of Robba modules and curve bundles](#exact-tensor-equivalence-of-robba-modules-and-curve-bundles); [Two-term Frobenius complex for curve cohomology](#two-term-frobenius-complex-for-curve-cohomology); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [Rank-one Frobenius twists](#rank-one-frobenius-twists); [Homogeneous section ring](#homogeneous-section-ring-and-partial-schematic-charts); AdicSpacesPartIII §R3.5; AdicSpacesPartIII §§R3.1–R3.4.

#### Global Proj map and compatible schematic twists

For affinoid perfectoid S, set `X_S^alg=Proj(P_S)` using the Layer 0 graded ring. Extend the global map and twists of PrismaticCohomologyPartIII §7.0's `FilteredBundle.schemeCurve` and `FilteredBundle.analyticEquivalence` from the supplied absolute specialization to general E and S. Apply GG to prove the homogeneous nonvanishing loci cover `X_S`, then glue the Layer 0 chart maps to `α_S:X_S→X_S^alg`, with the supplied absolute map on specialization. For sufficiently large positive m, construct invertible `O_alg(m)` with pullback `O(m)` and compatible multiplication; use consecutive large powers to define `O_alg(1)` and all integer tensor powers. Do not assume the naive Proj shift sheaf in degree one is already invertible for an arbitrary graded ring.

**API.**

- Construct the global map `α_S` after homogeneous chart coverage.
- Its restriction is the Layer 0 homogeneous localization chart map.
- Construct the invertible sheaf `O_alg(n)`, obtained from compatible sufficiently large shifts.
- `α_S*O_alg(n)≅O(n)`.
- `O_alg(n+m)≅O_alg(n)⊗O_alg(m)`, coherently.
- For large n it agrees with the Proj graded shift sheaf.

**Checks.**

- `O_alg(0)` is the structure-sheaf tensor unit.
- `O_alg(a+1)⊗O_alg(a)∨` pulls back to `O(1)`.
- `O_alg(−1)` is the dual of `O_alg(1)`.
- A map on the union of `D(f)` is not called curveProjMap before the union is proved to be `X_S`.

([FS][FS], Proposition II.2.7, pp. 66–67.)

*Needs:* PrismaticCohomologyPartIII §7.0 / layer-7-absolute-ff for the supplied absolute specialization; [Global generation and vanishing after positive twists](#global-generation-and-vanishing-after-positive-twists); [Rank-one Frobenius twists](#rank-one-frobenius-twists); [Homogeneous section ring](#homogeneous-section-ring-and-partial-schematic-charts); SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4; [Finite locally free bundles on the curve](#finite-locally-free-bundles-on-the-curve).

#### GAGA for the relative schematic curve

Consume PrismaticCohomologyPartIII §7.0's `FilteredBundle.analyticEquivalence` in the supplied absolute specialization. Extend its bundle restriction by the following general criterion. Let X be a locally ringed spectral space with line bundle `O(1)` such that every finite locally free V has `V(n)` globally generated and `H^i(X,V(n))=0` for all `i>0` and all sufficiently large n. The homogeneous chart maps define a global `α:X→Proj⊕Γ(X,O(n))`; pullback gives an exact tensor equivalence of finite locally free bundles and comparison isomorphisms on all bundle cohomology. Apply this to `X_S` for affinoid perfectoid S and arbitrary E via GG and GMap, identifying the absolute specialization with the supplied pullback functor on objects and morphisms. No coherent-sheaf equivalence on arbitrary nonnoetherian S is inferred from this bundle statement.

([FS][FS], Proposition II.2.7 and proof, pp. 66–67.)

*Needs:* PrismaticCohomologyPartIII §7.0 / layer-7-absolute-ff for the supplied absolute specialization; [Global generation and vanishing after positive twists](#global-generation-and-vanishing-after-positive-twists); [Global Proj map and compatible schematic twists](#global-proj-map-and-compatible-schematic-twists); [Finite locally free bundles on the curve](#finite-locally-free-bundles-on-the-curve); SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4; SchemeAndStackFoundations §§2.2 and 2.5.

#### Independence of the ample line bundle

Two line bundles satisfying the axiomatic generation/vanishing hypotheses on the same X yield canonically isomorphic Proj schemes, with the same locally ringed map from X and the same finite locally free equivalence. The identification is functorial and obeys the cocycle law for three choices. No arbitrary choice of line bundle without these hypotheses is included.

([FS][FS], Remark II.2.8, p. 67; [KL][KL], 8.8.8–8.8.9, p. 182.)

*Needs:* [GAGA for the relative schematic curve](#gaga-for-the-relative-schematic-curve); [Global Proj map and compatible schematic twists](#global-proj-map-and-compatible-schematic-twists); SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4; [Affine nonvanishing loci of ample line sections](#affine-nonvanishing-loci-of-ample-line-sections).

### Robba topology, coherent modules and group actions

#### Prüfer charts and coherent Frobenius correspondence

For an absolute analytic characteristic-p field F in the KL setting and every nonzero homogeneous `f∈P_d` with `d>0`, the chart ring `P_F[f⁻¹]_0` is a Prüfer domain. The zero section gives the empty chart and the zero ring, to which the domain assertion does not apply. In the supplied absolute specialization consume the coherent comparisons of PrismaticCohomologyPartIII §7.0, `FilteredBundle.analyticEquivalence` and `FilteredBundle.robbaEquivalence`, including torsion objects. Extend the correspondence to the analytic fields of the KL setting: coherent sheaves on `Proj(P_F)` correspond to finitely presented `R̃_F`-modules with invertible Frobenius linearization, and finite locally free objects correspond to finite projective Frobenius modules. The claim is absolute; Prüfer or Bézout hypotheses are not silently imposed on arbitrary relative bases.

**Checks.**

- A nonzero homogeneous f gives an integral domain satisfying the finitely generated torsion-free projectivity criterion.
- Replacing f by a positive power preserves the chart ring and its Prüfer property.
- At `f=0`, localization is the zero ring and the chart is empty; it is not a Prüfer domain.
- At the marked absolute untilt, the skyscraper with completed stalk `B_dR⁺/t` stays nonzero under the supplied coherent comparison and is excluded from its bundle restriction.

([KL][KL], Definition 6.3.5, Lemma 6.3.6 and Theorem 6.3.14, pp. 138–142 (Theorem 6.3.14 printed p. 142).)

*Needs:* PrismaticCohomologyPartIII §7.0 / layer-7-absolute-ff for the supplied absolute specialization; [Relative tilted Robba ring from curve annuli](#relative-tilted-robba-ring-from-curve-annuli); [Finite projective Frobenius modules and integral models](#finite-projective-frobenius-modules-and-integral-models); [GAGA for the relative schematic curve](#gaga-for-the-relative-schematic-curve); [Ramified coefficient rings](#ramified-coefficient-rings-and-coefficient-changes); [Relative annuli](#relative-annuli-and-their-section-rings); SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4.

#### Norm topology on twisted Frobenius invariants

For a finite projective tilted Robba Frobenius module M and each fixed integer n, the space `Γ_n(M)=ker(φ−π^n)` has a canonical Banach topology from a sufficiently small annular radius. Its induced norms at admissible radii and from finite projective presentations are equivalent. This is a separate assertion for each n; no uniform norm-equivalence constant over all n is asserted.

**API.**

- Use the kernel of `φ−π^n` as an E-vector space.
- Give the Banach topology at a fixed n from any admissible annular norm.
- Different sufficiently small radii induce equivalent norms.
- Intertwining module maps act continuously on `Γ_n`.
- The topological vector space is independent of projective presentation.

**Checks.**

- For `M=0` the invariant Banach space is zero.
- At `n=0` the space is `ker(φ−1)`.
- Two admissible radii induce the same open subsets of `Γ_n`.
- Rescaling the chosen module norm changes its numeric values but leaves the invariant topology unchanged.
- Over a nonzero Robba ring R, on the free rank-one module `M=Re` with `Φ(ae)=πφ_R(a)e`, the basis vector satisfies `Φ(e)=πe`, so `e∈Γ_1(M)`.
- For this module, `(Φ−π⁻¹)e=(π−π⁻¹)e≠0`, since the coefficient uniformizer has `0<|π|<1`. This fixes the eigenvalue sign without asserting that the entire inverse-eigenvalue kernel vanishes.
- If `φ_R(a)≠a`, then `(Φ−π)(ae)=π(φ_R(a)−a)e≠0`, so `ae∉Γ_1(M)`. In fact `Γ_1(M)=R^{φ_R=1}e`; it is not all of M when coefficient Frobenius is nontrivial.

([KL][KL], Lemma 6.3.17, p. 142.)

*Needs:* [Finite projective Frobenius modules and integral models](#finite-projective-frobenius-modules-and-integral-models); [Relative tilted Robba ring from curve annuli](#relative-tilted-robba-ring-from-curve-annuli); [Exact tensor equivalence of Robba modules and curve bundles](#exact-tensor-equivalence-of-robba-modules-and-curve-bundles).

#### Continuous profinite actions on Frobenius modules

Let a profinite group G act by continuous E-algebra automorphisms on every fixed-radius Fréchet piece of `R̃_R` and commute with Frobenius; in particular it fixes E and `π`. A semilinear G-action on M is LF-continuous if its action map is continuous for the annular LF topology. This is equivalent to continuity of G on every `Γ_n(M)` with its fixed-n Banach topology. Actions commute with Frobenius and preserve the specified ring action, hence act E-linearly on each invariant space.

**API.**

- An action consists of a Frobenius-commuting semilinear G-action, whose coefficient action fixes E, with a jointly LF-continuous action map.
- It induces a continuous E-linear action on `Γ_n` for each n.
- LF continuity iff every twisted-invariant action is continuous.
- Continuous scalar extension along an E-algebra map compatible with the coefficient actions and Frobenius preserves the action.

Construct the trivial action, and the action from a finite discrete group when each specified semilinear automorphism is continuous and the Frobenius-commutation equations hold. The induced action on every `Γ_n` must agree on underlying vectors with the original action; its continuity in the induced topology is a purely algebraic-topological component. Comparing that topology with the canonical annular Banach topology uses the preceding norm theorem, and the converse LF criterion uses global generation. (KL Definition 6.3.18, p. 143.)

**Checks.**

- The trivial group action is continuous and commutes with `φ`.
- The criterion quantifies over all integers n, including negative and zero twists.
- A finite discrete group acting by continuous semilinear automorphisms yields a continuous action.
- A continuous module action that does not commute with `φ` does not restrict to the invariant spaces and is excluded.

([KL][KL], Definition 6.3.18, printed p. 143.)

*Needs:* [Norm topology on twisted Frobenius invariants](#norm-topology-on-twisted-frobenius-invariants); [Finite projective Frobenius modules and integral models](#finite-projective-frobenius-modules-and-integral-models); [Relative tilted Robba ring from curve annuli](#relative-tilted-robba-ring-from-curve-annuli); [Global generation and vanishing after positive twists](#global-generation-and-vanishing-after-positive-twists).

### Tensor ampleness and its criteria

Tensor global ampleness tests every finite-type quasi-coherent sheaf. Rational-local ampleness is local on the perfectoid base. The cohomological criterion must produce a power independent of the integer test twist before applying the power criterion; thresholds for an arbitrary test sheaf can still depend on that sheaf.

#### Two affine charts and cohomological dimension one

In the relative KL setting choose a fixed analytic coefficient field L and two homogeneous sections `f_1,f_2` of the same positive degree whose images generate the unit ideal in the tilted Robba ring. Their `D_+(f_i)` cover `Proj(P_R)`, each is affine and their intersection is affine. Every quasi-coherent sheaf G has `H^i=0` for `i>1`; Čech cohomology on this two-open cover computes `H⁰` and `H¹`. The degree-one normalization is the one used by KL 8.8.

([KL][KL], Remark 8.7.6 and Theorem 8.7.7, printed p. 178.)

*Needs:* [Global generation and vanishing after positive twists](#global-generation-and-vanishing-after-positive-twists); [Global Proj map and compatible schematic twists](#global-proj-map-and-compatible-schematic-twists); SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4; SchemeAndStackFoundations §§2.2 and 2.5; [Relative tilted Robba ring from curve annuli](#relative-tilted-robba-ring-from-curve-annuli).

#### Tensor global ampleness and rational-local ampleness

For a finite locally free F on `X_S^alg`, `GloballyAmple(F)` means: for every finite-type quasi-coherent G, there exists `N(G)` such that `F^{⊗n}⊗G` is globally generated by finitely many sections for all `n≥N(G)`. `Ample(F)` means this on a strong rational covering of the perfectoid base. This is KL’s tensor-power bundle notion, not an unproved equivalence with projective-bundle ampleness or with pointwise positive slopes.

**API.**

- Global ampleness means that for every finite-type G, eventually every `F^{⊗n}⊗G` is finitely globally generated.
- Ampleness means global ampleness after a strong rational cover of S.
- The predicates are invariant under bundle isomorphism.
- Positive powers preserve and detect the predicate.
- A refinement of the witnessing strong rational cover is also a witness.

**Checks.**

- `O(1)` is globally ample.
- O is not globally ample: tensor with `O(−1)` has no global sections on the geometric curve.
- Under the tensor-power definition the zero bundle is globally ample: for `n≥1` its tensor power times every G is zero, generated by the empty finite family. No positive-rank hypothesis is added.
- For `O(1)` tested against `O(−m)`, a generation bound grows with m; a common threshold for all m is not required.

([KL][KL], Definition 8.8.2, printed p. 180.)

*Needs:* [Finite locally free bundles on the curve](#finite-locally-free-bundles-on-the-curve); [Global Proj map and compatible schematic twists](#global-proj-map-and-compatible-schematic-twists); SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4; [Two affine charts and cohomological dimension one](#two-affine-charts-and-cohomological-dimension-one).

#### Power criterion for tensor global ampleness

For every positive integer m, F is globally ample iff `F^{⊗m}` is globally ample, with the same statement for rational-local ampleness. The test sheaf remains every finite-type quasi-coherent G.

([KL][KL], Lemma 8.8.3, printed p. 180.)

*Needs:* [Tensor global ampleness and rational-local ampleness](#tensor-global-ampleness-and-rational-local-ampleness).

#### Positive line ampleness and finite-type presentations

For every integer `e>0`, `O_alg(e)` is globally ample. Every finite-type quasi-coherent G on `X_S^alg` is a quotient of a finite sum of integer twists `O_alg(e_i)`. On each of the two affine charts take finitely many local generators and multiply by sufficiently high powers of its homogeneous section to extend them globally; use both charts and a common maximum exponent.

([KL][KL], Lemma 8.8.4 (statement p. 180, proof p. 181) and Corollary 8.8.5, p. 181.)

*Needs:* [Global generation and vanishing after positive twists](#global-generation-and-vanishing-after-positive-twists); [Two affine charts and cohomological dimension one](#two-affine-charts-and-cohomological-dimension-one); [Global Proj map and compatible schematic twists](#global-proj-map-and-compatible-schematic-twists); [Tensor global ampleness and rational-local ampleness](#tensor-global-ampleness-and-rational-local-ampleness); SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4; [Power criterion for tensor global ampleness](#power-criterion-for-tensor-global-ampleness).

#### Cohomological criterion for tensor global ampleness

For a bundle F on `X_S^alg` the following are equivalent: (a) F is globally ample; (b) for every finite-type quasi-coherent G, `H¹(F^{⊗n}⊗G)=0` for all sufficiently large n; (c) for every `e∈ℤ`, `H¹(F^{⊗n}(e))=0` for all sufficiently large n. Thresholds may depend on G or e. The implication `(c)⇒(a)` must produce one positive power independently of e, then apply the power criterion.

([KL][KL], Proposition 8.8.6 and proof, pp. 181–182.)

*Needs:* [Tensor global ampleness and rational-local ampleness](#tensor-global-ampleness-and-rational-local-ampleness); [Power criterion for tensor global ampleness](#power-criterion-for-tensor-global-ampleness); [Positive line ampleness and finite-type presentations](#positive-line-ampleness-and-finite-type-presentations); [Two affine charts and cohomological dimension one](#two-affine-charts-and-cohomological-dimension-one); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [GAGA for the relative schematic curve](#gaga-for-the-relative-schematic-curve).

#### Positive twists of globally étale bundles

In the KL coefficient setting, if F corresponds to a Robba Frobenius module with a global finite locally free étale integral model, then for every integer `n>0`, `H¹(F(n))=0` and `F(n)` is globally ample. The global model hypothesis is stronger than pointwise purity. General-E specialization requires the normalized Layer 0 comparison; no converse to this theorem is asserted.

([KL][KL], Corollary 8.8.7, p. 182.)

*Needs:* [Finite projective Frobenius modules and integral models](#finite-projective-frobenius-modules-and-integral-models); [Exact tensor equivalence of Robba modules and curve bundles](#exact-tensor-equivalence-of-robba-modules-and-curve-bundles); [Cohomological criterion for tensor global ampleness](#cohomological-criterion-for-tensor-global-ampleness); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [GAGA for the relative schematic curve](#gaga-for-the-relative-schematic-curve).

#### Affine nonvanishing loci of ample line sections

If L is a globally ample line bundle on `X_S^alg` and `s∈Γ(L)`, the open nonvanishing locus `D(s)` is affine, including the empty case. Its coordinate ring is the degree-zero localization of `⊕_{n≥0}Γ(L^{⊗n})` at s. This yields intrinsic Proj reconstruction and the canonical independence comparison for ample choices.

([KL][KL], Lemma 8.8.8 and Corollary 8.8.9, p. 182.)

*Needs:* [Tensor global ampleness and rational-local ampleness](#tensor-global-ampleness-and-rational-local-ampleness); [Cohomological criterion for tensor global ampleness](#cohomological-criterion-for-tensor-global-ampleness); [Two affine charts and cohomological dimension one](#two-affine-charts-and-cohomological-dimension-one); SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4.

### Examples

Twisting by `𝒪(1)` changes Frobenius invariants to eigenvalue `π`; reversing that sign fails the rank-one check. The tensor product of `𝒪(1)` with `𝒪(−1)` is trivial, so positivity of each factor is essential in positive-tensor assertions. Large positive twists give global generation over an affinoid base, with the bound depending on the bundle and that base.

### Dependencies

*Needs:* Layer 0 and Layer 2; AdicSpacesPartIII R3; SchemeAndStackFoundations §§0.3–0.4, 2.2 and 2.5.

## Layer 4: Geometric classification and its consequences

### Stable blocks, fixed-slope categories and base change

#### Stability of rational standard bundles

For every `λ=d/h` in lowest terms, `O_{X_C}(λ)` is stable of rank h, degree d and slope `λ`. If a saturated subbundle F has rank `r<h` and degree s, then `s/r≤λ` by the `wedge/H⁰` argument; equality would force `h|r` and is impossible.

([FS][FS], Example II.2.11 and proof, p. 69.)

*Needs:* [The exact tensor isocrystal-to-bundle functor](#the-exact-tensor-isocrystal-to-bundle-functor); [Rank, determinant degree and rational slope](#rank-determinant-degree-and-rational-slope); [Stable and semistable geometric bundles](#stable-and-semistable-geometric-bundles); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [Tensor and dual calculus for isocrystals](#tensor-and-dual-calculus-for-isocrystals).

#### Fixed-slope abelian finite-length category

For each `λ∈ℚ`, semistable bundles of slope `λ` together with the zero bundle form an E-linear abelian finite-length category. Its simple objects are the stable bundles. Kernels and cokernels inside this category are saturated bundle kernels and quotients; a nonzero map between stable equal-slope objects is an isomorphism. This statement precedes classification and does not yet identify all simple objects with `O(λ)`.

([FF][FF], Theorem 5.5.4 and Proposition 5.5.6, pp. 163–164.)

*Needs:* [Stable and semistable geometric bundles](#stable-and-semistable-geometric-bundles); [Harder–Narasimhan filtration of geometric bundles](#hardernarasimhan-filtration-of-geometric-bundles); [Saturation and torsion degree on the geometric curve](#saturation-and-torsion-degree-on-the-geometric-curve).

#### Base change of the geometric HN filtration

For an extension of complete algebraically closed perfectoid fields `C⊂C′`, the pullback of every threshold HN piece is the corresponding threshold piece on `X_C′`. For finite separable `E′/E` of degree n, the finite coefficient curve map f satisfies `(f*V)^{≥λ}=f*(V^{≥λ/n})`; ranks are preserved and degrees/slopes multiply by n. In particular `f*O(1)=O(n)`. These are geometric-field and coefficient changes with different normalizations.

([FS][FS], Proposition II.2.13 and proof, pp. 69–70.)

*Needs:* [Harder–Narasimhan filtration of geometric bundles](#hardernarasimhan-filtration-of-geometric-bundles); [V-descent of bundles and their derived cohomology](#v-descent-of-bundles-and-their-derived-cohomology); [Coefficient extension and induction adjunction](#coefficient-extension-and-induction-adjunction); [Rank, determinant degree and rational slope](#rank-determinant-degree-and-rational-slope); [Fixed-slope abelian finite-length category](#fixed-slope-abelian-finite-length-category); [The exact tensor isocrystal-to-bundle functor](#the-exact-tensor-isocrystal-to-bundle-functor).

### Classification and Hom/Ext calculations

The key extension lemma supplies a nonzero section after a geometric field extension. For general E it uses the affine-line diamond comparison: in equal characteristic use the perfected analytic line and convergent additive series. The equation `g(πX)=πg(X)` eliminates all exponents except one. To descend a classification map across a finite coefficient cover, use the reverse finite étale trace adjunction `Hom(O(s),f*V)≃Hom(f*O(s),V)`, then the standard-block induction formula. The endomorphism theorem on a single simple block does not assert full faithfulness between distinct slopes.

#### Nonzero sections of the key rank-one extension

Let C be complete algebraically closed and let `0→O(−1)→V→O(1/n)→0` be a bundle extension on `X_C`, `n≥1`. After an extension `C′/C` of complete algebraically closed perfectoid fields, `H⁰(X_C′,V)≠0`. The proof applies in both mixed and equal characteristic and does not require a prior claim that the negative Banach–Colmez quotient is nonperfectoid in equal characteristic. In mixed characteristic use DiamondsAndVStacks D6.9, `Rigid.diamond_hom_bijective`, for the seminormal analytic affine line (SW Proposition 10.2.3). In equal characteristic identify its diamond with the represented completed perfection using PerfectoidSpaces P1 perfected Tate algebras and Yoneda. Prove here that its additive morphisms are convergent additive series, allowing fractional p-power exponents, and that `g(πX)=πg(X)` kills every exponent except one. Thus every E-linear endomorphism is scalar.

**Checks.**

- The zero series gives the zero map; a nonzero scalar gives an automorphism.
- In equal characteristic `X^q` is additive but fails `g(πX)=πg(X)`; additivity alone is insufficient.
- A nonzero map factoring through the quotient by E has nontrivial kernel, contradicting the scalar classification.

([FS][FS], Lemma II.2.15 and proof, pp. 71–72.)

*Needs:* [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [Two-term Frobenius complex for curve cohomology](#two-term-frobenius-complex-for-curve-cohomology); [V-descent of bundles and their derived cohomology](#v-descent-of-bundles-and-their-derived-cohomology); [The fundamental untilt sequence and degree-one divisors](#the-fundamental-untilt-sequence-and-degree-one-divisors); DiamondsAndVStacks D6.9; PerfectoidSpaces P1 for perfected Tate algebras.

#### Geometric classification of vector bundles

For complete algebraically closed perfectoid `C/𝔽_q`, every bundle on `X_C` is a finite direct sum of `O(λ)`, uniquely up to permutation of reduced rational slopes and multiplicities. The HN filtration splits, and every semistable `slope-λ` bundle is `O(λ)^{⊕m}`. After choosing the embedding `k=𝔽̄_q→C`, the finite-isocrystal functor induces a bijection on isomorphism classes in this geometric setting, but is not fully faithful on all morphisms and is not asserted to classify relative bundles on arbitrary S.

([FS][FS], Theorem II.2.14 and proof, pp. 70–72; [FF][FF], Theorem 8.2.10, pp. 238–239.)

*Needs:* [Dieudonné–Manin classification of finite isocrystals](#dieudonnémanin-classification-of-finite-isocrystals); [The exact tensor isocrystal-to-bundle functor](#the-exact-tensor-isocrystal-to-bundle-functor); [Stability of rational standard bundles](#stability-of-rational-standard-bundles); [Fixed-slope abelian finite-length category](#fixed-slope-abelian-finite-length-category); [Harder–Narasimhan filtration of geometric bundles](#hardernarasimhan-filtration-of-geometric-bundles); [Base change of the geometric HN filtration](#base-change-of-the-geometric-hn-filtration); [Nonzero sections of the key rank-one extension](#nonzero-sections-of-the-key-rank-one-extension); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [Coefficient extension and induction adjunction](#coefficient-extension-and-induction-adjunction); DiamondsAndVStacks D3 / locally-profinite-torsors; [Global generation and vanishing after positive twists](#global-generation-and-vanishing-after-positive-twists).

#### Hom and extension calculus for geometric bundles

For geometric standard bundles on `X_C^alg`, compute Ext in the abelian category of structure-sheaf modules (equivalently QCoh for these finite locally free inputs), with `Ext¹` also classifying bundle extensions. `Hom(O(λ),O(μ))=H⁰(O(λ)∨⊗O(μ))` vanishes for `λ>μ`, and `Ext¹(O(λ),O(μ))=H¹(O(λ)∨⊗O(μ))` vanishes for `λ≤μ`. The tensor decomposes into `h_λh_μ/h_{μ−λ}` copies of `O(μ−λ)`. `Ext^i` between these bundles vanishes for `i>1`. Equal-slope `End(O(λ))` need not be E when its denominator exceeds one.

([FF][FF], Proposition 5.6.23(4)–(5), statement p. 181; proof p. 183.)

*Needs:* [Geometric classification of vector bundles](#geometric-classification-of-vector-bundles); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [Tensor and dual calculus for isocrystals](#tensor-and-dual-calculus-for-isocrystals); [Two-term Frobenius complex for curve cohomology](#two-term-frobenius-complex-for-curve-cohomology); SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4; [GAGA for the relative schematic curve](#gaga-for-the-relative-schematic-curve); [Two affine charts and cohomological dimension one](#two-affine-charts-and-cohomological-dimension-one).

#### Stable-bundle division endomorphism comparison

The natural E-algebra map `End_Φ(D(−d,h))→End_{X_C}(O(d/h))` is an isomorphism for each reduced rational slope. Both identify with `D_{d/h}`, of dimension `h²` and invariant `d/h` mod `ℤ`. This full endomorphism comparison on one simple block coexists with the failure of full faithfulness between different slopes.

([FF][FF], Proposition 8.2.8 and proof, pp. 237–238.)

*Needs:* [Division endomorphisms of a simple isocrystal](#division-endomorphisms-of-a-simple-isocrystal); [Slope-labelled cyclic algebra](#slope-labelled-cyclic-algebra); [Arithmetic Brauer invariant and slope normalization](#arithmetic-brauer-invariant-and-slope-normalization); [The exact tensor isocrystal-to-bundle functor](#the-exact-tensor-isocrystal-to-bundle-functor); [Hom and extension calculus for geometric bundles](#hom-and-extension-calculus-for-geometric-bundles).

### Coherent sheaves and finite étale algebras

The torsion decomposition uses the DVRs at closed points and a noncanonical splitting. The finite étale algebra theorem exports coefficient-field covers to divisor and Weil-map constructions; their arithmetic reciprocity uses ClassFieldTheory Layers 8–9 in its stated domain.

#### Coherent sheaves on the geometric curve

Every coherent sheaf F on `X_C^alg` is, noncanonically, a direct sum `T⊕V` with T its torsion subsheaf and V a finite sum of `O(λ)`. T has finite support at closed untilt points and each local piece is a finite sum of `O_x/(t_x^{n_j})`, `n_j>0`. The torsion-free quotient is locally free because the curve is regular and one-dimensional; the split is not claimed canonical. This specializes CN Theorem 3.9(iii) at `E=ℚ_p` and applies to the general-E geometric curve using its DVR charts.

([CN (arXiv)][CN-arXiv], §3.2.3, Theorem 3.9(iii), pp. 14–15.)

*Needs:* [Regular noetherian geometric curve and PID complements](#regular-noetherian-geometric-curve-and-pid-complements); [Untilts and completed local rings](#untilts-and-completed-local-rings); [Saturation and torsion degree on the geometric curve](#saturation-and-torsion-degree-on-the-geometric-curve); [Geometric classification of vector bundles](#geometric-classification-of-vector-bundles); [Hom and extension calculus for geometric bundles](#hom-and-extension-calculus-for-geometric-bundles); SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4.

#### Geometric simple connectivity via finite étale algebras

For complete algebraically closed perfectoid C, every finite étale `O_{X_C}`-algebra B is canonically `O_{X_C}⊗_E` A with `A=H⁰(X_C,B)` a finite étale E-algebra. Thus finite étale covers of `X_C` are exactly coefficient-field covers; after base change to an algebraic closure of E they split. The statement is not that `X_C` has no nontrivial covers over nonalgebraically closed E. Export this theorem to divisor and Weil-map constructions in v-stack sheaf theory.

([FF][FF], Theorem 8.6.1 and proof, pp. 248–249; [SW][SW], Theorem 13.5.7 and proof, printed p. 114 (PDF p. 124).)

*Needs:* [Geometric classification of vector bundles](#geometric-classification-of-vector-bundles); [Hom and extension calculus for geometric bundles](#hom-and-extension-calculus-for-geometric-bundles); [Rank, determinant degree and rational slope](#rank-determinant-degree-and-rational-slope); [GAGA for the relative schematic curve](#gaga-for-the-relative-schematic-curve); SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4; AdicSpacesPartIII §R3.8.

### Examples

`𝒪(1/2)` is the image of `D(−1,2)`, and has endomorphism algebra of invariant `1/2`. A morphism `𝒪 → 𝒪(1)` can be a nonconstant section, whereas the corresponding different-slope isocrystal Hom is zero; the classification is an isomorphism-class bijection. A finite étale algebra from a nontrivial finite extension of `E` gives a nontrivial coefficient-field cover, so the finite étale classification does not assert geometric simple connectedness over `E` itself.

### Dependencies

*Needs:* PrismaticCohomologyPartIII §7.0 / layer-7-absolute-ff; Layer 1, Layer 2 and Layer 3 positive generation/relative GAGA; the geometric cohomology of twists and the Picard-degree convention.

## Layer 5: Banach–Colmez spaces

### Basic section sheaves, Lubin–Tate geometry and projectivization

These are the early geometric constructions used in Layer 2. The crystalline `φ=π` Hom comparison is an explicit input from R07.2; the full-faithfulness statement of SW13 alone does not prove that comparison. Separate the degree-one sequence and section/divisor quotient from its later arithmetic torsor comparison.

#### Banach–Colmez section and hypercohomology sheaves

For a perfectoid `S/𝔽_q` and a bundle E on `X_S`, `BC(E)(T)=H⁰(X_T,E_T)`. If E has only negative geometric slopes, `BCneg(E)(T)=H¹(X_T,E_T)`. For a complex `[E₁→E₀]` in COHOMOLOGICAL degrees `−1,0` with `H⁰(X_T,E₁,T)=0` for EVERY `T/S`, `BCcomplex(T)=H⁰ RΓ(X_T,[E₁→E₀]_T)`, the degree-zero hypercohomology v-sheaf. No representability is assumed. FS calls these homological degrees [0,1].

S belongs to `Perf_Fq`; coefficients are the fixed local field E with uniformizer `π`. Derived v-descent is imported from the bundle and cohomology theory of Layers 2–3; the universal `H⁰` vanishing prevents negative cohomology of the section complex.

**API.**

- The section construction is the v-sheaf `T↦H⁰(X_T,E_T)`.
- For universally negative slopes, the negative construction is `T↦H¹(X_T,E_T)`.
- The two-term construction is degree-zero hypercohomology of `[E₁→E₀]` in degrees `−1,0`, with universal `H⁰(E₁)` vanishing.
- `BC(E)`, `BCneg(E)` and BCcomplex are sheaves of E-modules on `Perf_S`, E acting through `O_{X_T}`, and the induced map is E-linear. Scalar projectivization divides out this action.
- A bundle or complex map induces the corresponding E-linear map of v-sheaves; identity and composition are preserved.
- A short exact sequence `0→E′→E→E″→0` of bundles gives an exact sequence of E-module v-sheaves `0→BC(E′)→BC(E)→BC(E″)→H¹(E′)→H¹(E)→H¹(E″)→0` (Prop. II.2.1 and the two-term complex); for `[E₁→E₀]` with `E₁` universally negative it gives `0→BC(E₀)→BCcomplex→BCneg(E₁)→H¹(E₀)`.
- For `U→S`, restriction of BCcomplex on `Perf_U` is BCcomplex of the pulled-back complex.
- `BCcomplex(K⊕L)≅BCcomplex(K)⊕BCcomplex(L)` in the abelian category of E-module v-sheaves.

**Checks.**

- The zero complex has zero BC v-sheaf.
- `BCcomplex([0→E])=BC(E)` and `BCcomplex([E→0])=BCneg(E)` when E is negative.
- For S the disjoint union of two geometric points, `BC(O)(S)=E²`, not E; `BC(O)` is topological underline E. On `S=Spa(C(T,C),C(T,𝒪_C))` for `T=ℤ_p` and `E=ℚ_p`, the coordinate function is continuous and not locally constant.
- For `[O(−1)→0]` over a geometric point, `BCcomplex=H¹(O(−1))≠0` although the cokernel of the map of `H⁰` groups is zero.

([FS][FS], Definition I.3.5, p. 19; two-term definition after II.2.1, p. 58; [FS][FS], Two-term definition after Proposition II.2.1, p. 58.)

*Needs:* [Finite locally free bundles on the curve](#finite-locally-free-bundles-on-the-curve); [Two-term Frobenius complex for curve cohomology](#two-term-frobenius-complex-for-curve-cohomology); [V-descent of bundles and their derived cohomology](#v-descent-of-bundles-and-their-derived-cohomology); `CategoryTheory.Sheaf`; `CategoryTheory.ShortComplex.homology`.

#### Lubin–Tate universal cover and sections of O(1)

Let `S = Spa(R,R⁺)` be affinoid perfectoid over `𝔽_q` with untilt `S^♯` over E, and let `O_{X_S}(1)` correspond to `D(−1,1)`, with Frobenius `π⁻¹σ` after extending coefficients to L. For `x` in `R°°`, the series `Σ_{i∈ℤ} π^i [x^{q^(−i)}]` defines a natural isomorphism `G̃(R^{♯+}) = R°° → H⁰(X_S,O(1)) = H⁰(Y_S,O_{Y_S})^{φ = π}`, and the evaluation map `H⁰(X_S,O(1)) → R^♯` at `S^♯` is the logarithm map `log_G` : `G̃(R^{♯+}) → G(R^{♯+}) → R^♯`.

`G = G_LT` is the Lubin-Tate formal `O_E`-module over `O_Ĕ`, normalized by `M = W_{O_E}(k)` with `F = σ/π` in Dieudonne theory (with the SW20 renormalisation dividing F by p and base changing along `W(k) ⊗_{ℤ_p} O_E → W_{O_E}(k)`); under this normalisation G is already defined over `O_E`. `G̃ =` inverse limit of G along multiplication by `π`, isomorphic to Spf `O_E[[X̃^{1/p^∞}]]`; for `π`-adically complete A one has `G̃(A) = G̃(A/π) = Hom_{O_E}(E/O_E,G(A/π))[1/π] =` the topologically nilpotent elements of `A^♭`. The equal-characteristic case is a direct power-series computation with the condition `r_i = r_{i+1}^q`. In mixed characteristic, construct the normalized crystalline comparison `B^{φ=π}_{R,[1,∞]}≃Hom_{O_E}(E/O_E,G(R^{♯+}/π))[1/π]` using R07.2. The SW13 full-faithfulness input applies after isogenies to f-semiperfect rings: Frobenius is surjective and its inverse limit has a finitely generated ideal of definition. Its integral version requires a quotient `S/J` with S perfect and J regular. Full faithfulness alone does not identify this Hom space with the displayed eigenspace. For compatibility with the explicit formula, SW13 Lemma 3.5.1 identifies the map `G̃(R) → M(G)(S)[1/p]` coming from Dieudonne theory agrees with `q log`, proved by functoriality reduction to `G = ℚ_p/ℤ_p`. For the universal-cover shape use SW13 Proposition 3.1.3(iii): if R is perfect of characteristic p, G connected and Lie G free of dimension d, then `G̃ = Spf R[[X₁^{1/p^∞}, …, X_d^{1/p^∞}]]`.

([FS][FS], Proposition II.2.2, p. 60; [SW13][SW13], Theorem A, p. 3; [SW13][SW13], Proposition 3.1.3(iii), p. 22; [SW13][SW13], Lemma 3.5.1, p. 29.)

*Needs:* [Banach–Colmez section and hypercohomology sheaves](#banachcolmez-section-and-hypercohomology-sheaves); [Annular Frobenius descent for bundles](#annular-frobenius-descent-for-bundles); [Two-term Frobenius complex for curve cohomology](#two-term-frobenius-complex-for-curve-cohomology); [V-descent of bundles and their derived cohomology](#v-descent-of-bundles-and-their-derived-cohomology); [Marked untilt Cartier divisors](#marked-untilt-cartier-divisors-and-cartier-descent); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.25; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.25–R07.2.28; ClassFieldTheory / layer 8 separate arithmetic local existence and the local class field correspondence.

#### The fundamental untilt sequence and degree-one divisors

For any perfectoid S with untilt `S^♯` over `E_∞`, the above construction gives an exact sequence `0 → O_{X_S} → O_{X_S}(1) → O_{S^♯} → 0` of `O_{X_S}`-modules. Consequently there is a well-defined map `BC(O(1))∖{0} → Div¹` sending a nonzero section `f` to `V(f)`, and it descends to an isomorphism `(BC(O(1))∖{0})/E× = Div¹`. The scalar `E×`-torsor is the Lubin–Tate Tate-module torsor. Export it for the divisor-to-Weil-group comparison; the geometric section/divisor identity uses the stated Lubin–Tate and Cartier inputs.

For II.2.3 the untilt `S^♯` must be over `E_∞` (the completion of the union of the Lubin-Tate level fields `E_n`), not merely over E; this is what supplies the canonical nonzero section. The check that the map `O_{X_S} → I(1)` is an isomorphism is done on geometric points. The vanishing locus computation identifies the zeroes of the logarithm on `G̃^ad_E∖{0}` with a disjoint union of copies of Spa `E_∞`, each a simple zero. Corollary II.2.4 uses `BC(O(1)) = Spd 𝔽_q[[X^{1/p^∞}]]`, so `BC(O(1))∖{0} = Spa 𝔽_q((X^{1/p^∞})) = Spd E_∞`, and the map to `Div¹` is `Spd E_∞ → Spd E → Spd E/φ^ℤ`, a quotient first by `O_E×` and then by `π^ℤ`.

**Checks.**

- Every logarithm zero on the punctured universal cover has residue field `E_∞` and multiplicity one; finite-level fields `E_n` do not give this universal-cover zero locus.
- The canonical section over an `E_∞` untilt has Cartier zero locus exactly that untilt divisor.
- The punctured section quotient first removes `𝒪_E×` and then `π^ℤ`, recovering the early marked-untilt `Div¹`.

([FS][FS], Propositions II.2.3–II.2.4, pp. 60–61.)

*Needs:* [Lubin–Tate universal cover and sections of O(1)](#lubintate-universal-cover-and-sections-of-o1); [Finite locally free bundles on the curve](#finite-locally-free-bundles-on-the-curve); [Closed Cartier norm criterion](#marked-untilt-cartier-divisors-and-cartier-descent); [Marked-untilt Div¹](#marked-untilt-cartier-divisors-and-cartier-descent).

#### Scalar projectivization

For an E-module BC v-sheaf W over S, define `W×` as the complement of its zero section and `PBC(W)=W×/underline E×`, the v-sheaf quotient of the scalar action. The quotient map is an `E×-torsor` on this punctured locus. Representability and properness are separate theorems. Apply to both section and two-term hypercohomology objects.

W is an E-module v-sheaf; the zero section is closed in the locally spatial cases where complement is used.

**API.**

- Scalar projectivization is the v-sheaf quotient of punctured W by scalar `E×`.
- `W×→PBC(W)` is an underline `E×` torsor.
- An `E×-invariant` map `W×→Z` descends uniquely to `PBC(W)`.
- Perfectoid base change commutes with scalar projectivization.

**Checks.**

- `PBC(0)` is empty.
- `PBC(underline E)=S`.
- `PBC(BC(O(1)))≅Div¹`, with the fundamental scalar torsor.
- For every integer `d≥1` on `Perf_k`, punctured `BC(O(d))` is spatial while its `π^ℤ-quotient` is not quasiseparated; at `d=−1` the punctured space and quotient are empty and quasiseparated. Ordinary properness does not imply total absolute spatiality.

([FS][FS], Propositions II.2.16 and II.3.5, pp. 72,80.)

*Needs:* [Banach–Colmez section and hypercohomology sheaves](#banachcolmez-section-and-hypercohomology-sheaves); DiamondsAndVStacks D0 / groupoid-quotients-and-two-fibre-products; DiamondsAndVStacks D5 / relative-representability.

### Ordinary projectivized properness

Ordinary section-sheaf properness uses positive generation and the contracting-action criterion. The application must show that a finite collection of untilt evaluations jointly detects vanishing and gives common contraction and negative-orbit escape bounds on each quasicompact open. It precedes and supplies family HN semicontinuity; it does not consume geometric bundle classification. Dualizing a presentation of the dual bundle produces `E→O(n)^m` with `n>0`, retaining the sign needed for positive twist geometry.

#### Quotients by contracting automorphisms

Suppose X is locally spectral and taut, and the generalizations of each point are linearly ordered by specialization. An automorphism `γ` has a spectral fixed locus `X₀`. Assume that for every `x∈X` and every open neighborhood U of `X₀`, `γⁿ(x)` lies in U for all sufficiently large n, and that the negative orbit of every point outside `X₀` eventually avoids each quasicompact open of X. Then `X₀` is closed. On its complement, the `γ^ℤ`-action is free, and each point has an open neighborhood V whose translates `γⁿ(V)`, for `n∈ℤ`, are pairwise disjoint. The quotient map `X∖X₀→(X∖X₀)/γ^ℤ` is a local homeomorphism, and the orbit space is spectral.

Tautness means quasiseparatedness together with compact closure of each quasicompact open; both hypotheses are required in the quotient theorem. X is locally spectral; generalization sets totally ordered chains (automatic for locally spatial diamonds by ECD Prop. 11.19, and tautness holds if X is partially proper over a spatial diamond by ECD Prop. 18.10). `X_0` must be a spectral space, and both convergence conditions (i) and (ii) are needed. Here total discontinuity means the disjoint-translate neighborhood property. The local-homeomorphism and spectrality conclusions use the proof of FS Lemma II.2.17, pp. 73–74; they do not require the action relation to be closed in the ordinary product topology.

**Checks.**

- If γ is the identity and X is spectral, the moved locus and its quotient are empty.
- An empty fixed locus forces X to be empty by forward contraction applied to the empty open neighborhood.
- Gluing two convergent-sequence compacta along their common infinite discrete open part gives a compact locally spectral space with compact closures of quasicompact opens but without quasiseparatedness. It fails the tautness hypothesis.
- Let T be the Sierpiński space with η specializing to s. For `X=T×ℚ₂` and `γ(t,x)=(t,2x)`, the fixed locus is `T×{0}`. For `x≠0`, the forward norm is `2^(−n)|x|₂→0` and the backward norm is `2^n|x|₂→∞`; compact opens have bounded second coordinate. Every neighborhood of the fixed locus contains `T×2ᴺℤ₂` for some N.
- On this space the neighborhoods `T×2ᵏℤ₂×` and `{η}×2ᵏℤ₂×` have disjoint translates: their nonzero coordinates have valuations `k+n`. The quotient is `T×ℤ₂×`, which is spectral, and each such neighborhood maps homeomorphically onto its image.
- The pair `((η,1),(s,1))` is in the closure of the diagonal, hence of the action relation, but is not in the relation because γ preserves the T-coordinate. Thus the hypotheses do not imply a closed action relation in the ordinary product topology.

([FS][FS], Lemma II.2.17, pp. 72–74.)

*Needs:* AdicSpacesPartII R0.0, `IsLocallySpectralSpace` and its spectral-space comparison; Mathlib `SpectralSpace` and `Specializes`; DiamondsAndVStacks D0.1 for perfectoid specializations; `TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`; DiamondEtaleCohomology C4.

#### Ordinary Banach–Colmez properness

For a bundle E on `X_S` with S perfectoid over `𝔽_q`, its section v-sheaf `BC(E)(T)=H⁰(X_T,E_T)` is a locally spatial diamond and is partially proper over S. Removing its zero section and taking the `E^×-quotient` yields a locally spatial diamond proper over S. Ampleness in II.2.6 and positive-twist geometry in II.2.5(iii) supply the proof without the bundle classification theorem.

S may be assumed qcqs for the second part. The presentation `0 → E → O_{X_S}(n)^m → O_{X_S}(n′)^{m′}` is obtained by applying Thm. II.2.6 to `E∨` and dualising, with `n, n′ > 0` - the positivity of `n, n′` is what lets II.2.5(iii) apply. It suffices to treat `(BC(E)∖{0})/π^ℤ` because the `O_E×`-action is free, so ECD Proposition 11.24 (last part) applies. The contracting-action criterion is checked by formally reducing to `BC(O_{X_S}(n)^m)` and then to `A¹_{S^♯}` by evaluating sections at a collection of untilts. The disjoint-translate charts give the local quotient, and the spectral quotient gives quasicompactness over a qcqs base. Establish partial properness and separatedness using the diamond quotient and valuative interfaces of DiamondEtaleCohomology C4, with fibre products of diamonds.

([FS][FS], Proposition II.2.16, p. 72.)

*Needs:* [Banach–Colmez section and hypercohomology sheaves](#banachcolmez-section-and-hypercohomology-sheaves); [Global generation and vanishing after positive twists](#global-generation-and-vanishing-after-positive-twists); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [Quotients by contracting automorphisms](#quotients-by-contracting-automorphisms); DiamondsAndVStacks D5 / relative-representability; DiamondEtaleCohomology C4; [Scalar projectivization](#scalar-projectivization).

### Positive presentations and general two-term geometry

For these targets first use the family results of Layer 6: constant-polygon splitting, the local-system comparison and relative cohomology vanishings. Small-slope middle bundles and kernels must be fibrewise semistable; average degree/rank alone does not meet the hypothesis.

#### Small-slope resolutions of positive bundles

If all geometric slopes of a bundle E are `≥1/r`, `r≥1`, then analytically locally on S there is `0→O^m→F→E→0` with F fibrewise semistable of SLOPE 1/r. On a constant-rank n, degree d component, `rank(F)=dr` and `m=dr−n`. This extends FS II.3.1’s geometric construction via II.3.3(i). Rank-zero E is treated separately.

r is a positive integer; standard `O(1/r)` has rank r and degree 1. Analytic-local existence is distinguished from the strict-positive étale-local presentation in the next target.

([FS][FS], Proposition II.3.1, pp. 75–76; Corollary II.3.3(i), p. 78.)

*Needs:* [Relative HN filtration and pro-étale splitting](#relative-hn-filtration-and-pro-étale-splitting); [Hom and extension calculus for geometric bundles](#hom-and-extension-calculus-for-geometric-bundles); [Geometric classification of vector bundles](#geometric-classification-of-vector-bundles); [Global generation and vanishing after positive twists](#global-generation-and-vanishing-after-positive-twists); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [The fundamental untilt sequence and degree-one divisors](#the-fundamental-untilt-sequence-and-degree-one-divisors); [Upper semicontinuity of geometric HN polygons](#upper-semicontinuity-of-geometric-hn-polygons).

#### Étale positive-slope presentations

Let `S∈Perf_Fq`, E a bundle on `X_S` and `r≥1`. (a) If all HN slopes of E at all geometric points are `>1/r`, then étale locally on S, for some `m≥0`, there is `0→G→O(1/r)^m→E→0` with G fibrewise SEMISTABLE of slope 0 (FS II.3.2, II.3.3(iii)). (b) If all slopes are `≥1/r`, then locally on S there is `0→O(1/(2r))^m→F→E′→0` with F fibrewise semistable of slope 1/r and E a direct summand of E′ (II.3.3(ii)). (c) If all slopes are `>1/r`, then étale locally on S there is `0→G→O(1/r)^m→E′→0` with G fibrewise semistable of slope 1/(2r) and E a direct summand of E′ (II.3.3(iv)). Claims (b) and (c) retain E′. On a component where E has constant degree d, the sequence in (a) forces `m=d`, since `O(1/r)` has rank r and degree 1 (the degree normalization corrects the printed `m=dr`). Fibrewise semistability, not merely degree zero, is what the subsequent separatedness and pro-étale trivialization arguments use.

`r≥1`; finite constant ranks and degrees after passing to components. The analytic and étale topologies in the three assertions are distinct.

([FS][FS], Corollary II.3.3(i)–(iv), pp. 78–79; II.3.2 proof, pp. 76–78.)

*Needs:* [Small-slope resolutions of positive bundles](#small-slope-resolutions-of-positive-bundles); [Relative HN filtration and pro-étale splitting](#relative-hn-filtration-and-pro-étale-splitting); [Annular Frobenius descent for bundles](#annular-frobenius-descent-for-bundles); [Base change of the geometric HN filtration](#base-change-of-the-geometric-hn-filtration); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [Ordinary Banach–Colmez properness](#ordinary-banachcolmez-properness); [Geometric classification of vector bundles](#geometric-classification-of-vector-bundles); [Upper semicontinuity of geometric HN polygons](#upper-semicontinuity-of-geometric-hn-polygons).

#### Two-term Banach–Colmez geometry

For `[E₁→E₀]` in degrees `−1,0`, with `E₁` negative at every geometric point of S, BCcomplex is a locally spatial diamond partially proper over S; its punctured `E×-quotient` is locally spatial and proper over S. If `E₀` is everywhere strictly positive, `BCcomplex→S` is cohomologically smooth. In this positive range, `0→BC(E₀)→BCcomplex→BCneg(E₁)→0` is exact as E-module v-sheaves. Neither unpunctured absolute spatiality nor perfectoid representability is asserted.

`E_1` must have only NEGATIVE slopes at all geometric points; this is what makes `H⁰(X_T,E₁) = 0` (Prop. II.3.4(i)) so that the two-term complex has a well-defined `H_0`. Part (iii) additionally requires all slopes of `E_0` to be POSITIVE. All assertions are etale-local, in fact v-local, on S. The reduction replaces `[E_1 → E_0]` by a quasi-isomorphic `[E'_1 → O_{X_S}(-d)^m]` obtained from a surjection `O_{X_S}(-d)^m → E_0` with `d > 0` given by Thm. II.2.6; `E'_1` still has only negative slopes. Separatedness of `BC(O_{X_S}(-d)^m[1])` from Prop. II.2.5(i) is used to reduce (i) and (ii) to `BC(E'_1[1])`.

([FS][FS], Proposition II.3.5, pp. 79–81.)

*Needs:* [Banach–Colmez section and hypercohomology sheaves](#banachcolmez-section-and-hypercohomology-sheaves); [Small-slope resolutions of positive bundles](#small-slope-resolutions-of-positive-bundles); [Relative HN filtration and pro-étale splitting](#relative-hn-filtration-and-pro-étale-splitting); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [Global generation and vanishing after positive twists](#global-generation-and-vanishing-after-positive-twists); [Quotients by contracting automorphisms](#quotients-by-contracting-automorphisms); DiamondSixOperations S4; DiamondSixOperations S5; DiamondsAndVStacks D5 / relative-representability; [Étale positive-slope presentations](#étale-positive-slope-presentations); [Slope-dependent cohomology vanishing](#slope-dependent-cohomology-vanishing); [Scalar projectivization](#scalar-projectivization).

#### Dimension in the positive range

For bundles `E₀,E₁` with `E₀` everywhere positive and `E₁` everywhere negative, the cohomologically smooth relative `BCcomplex([E₁→E₀])` has locally constant dimension `deg(E₀)−deg(E₁)`, componentwise. In particular a positive bundle E has BC dimension `deg(E)`; a negative bundle has shifted BC dimension `−deg(E)`. Geometrically these are the first entries of the BC Dimension; height is `rank(E₀)−rank(E₁)`. Slope-zero section sheaves are locally profinite of dimension zero via the E-local-system equivalence.

Use the canonical geometric degree and fixed coefficient field E. Diamond relative dimension is the cohomologically smooth dimension, not the rank or height; the numeric Dimension comparison is classical `ℚ_p` over fixed C.

([FS][FS], Definition I.3.5 and examples, p. 19; II.3.5, pp. 79–81; [CN (author copy)][CN-author], Example 3.3 and §3.2.5, pp. 13,16.)

*Needs:* [Two-term Banach–Colmez geometry](#two-term-banachcolmez-geometry); [Small-slope resolutions of positive bundles](#small-slope-resolutions-of-positive-bundles); [Étale positive-slope presentations](#étale-positive-slope-presentations); [Slope-zero bundles and E-local systems](#slope-zero-bundles-and-e-local-systems); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [Dimensions of standard Banach–Colmez spaces](#dimensions-of-standard-banachcolmez-spaces); DiamondSixOperations S5.

### Absolute spaces, divisors and negative examples

Work on `Perf_k` and distinguish punctured absolute spatiality from relative spatial representability. The spatiality arguments use two precise diamond inputs: a surjective qcqs cohomologically smooth map from a spatial diamond to a small v-sheaf makes the target spatial; a covering family of locally closed generalizing spatial-diamond sub-v-sheaves makes a spatial v-sheaf a spatial diamond. Both the covering and generalizing hypotheses belong to the input. Determinant trivializations in the negative examples determine `SL₁(D)` and `SL₂(E)`, rather than the larger full automorphism groups.

#### Absolute Banach–Colmez spaces of isocrystals of one sign

On the absolute site `Perf_k`, with k an algebraic closure of `𝔽_q`, take a nonzero isocrystal D whose slopes all have the same strict sign. If they are negative, put `W=BC(E(D))`; if positive, put `W=BC(E(D)[1])`. These choices reflect the reversal of slopes under E. The open punctured sheaf `W∖{0}` is a spatial diamond and is cohomologically smooth over the absolute base. The map `(W∖{0})/E^×→∗` is proper, cohomologically smooth, and representable in spatial diamonds. This relative representability condition does not make every absolute total quotient spatial: for positive d the `π^ℤ-quotient` of punctured `BC(O(d))` fails quasiseparatedness.

D has slopes of a single sign; mixed-sign isocrystals are not covered by this statement. One works on `Perf_k` with k algebraically closed. The proof of (i) chooses, by Dieudonne-Manin, a basis in which `φ` is E-rational and `U = φ^N` is diagonal with entries powers of `π` for some `N > 0` - i.e. D is DECENT in the sense of Rapoport-Zink Definition 1.8. Since `U = φ^N` and `BC(D)` (resp. `BC(D[1])`) is already defined on `Perf_Fq`, the action of U agrees with that of `Frob^N`. The hypotheses of Lemma II.2.17 are checked for `U⁻¹` (resp. U) after base change to Spa `𝔽_q((t^{1/p^∞}))`, because that lemma needs a spatial base; the quotient statement is translated back using that the absolute Frobenius acts trivially on topological spaces. Surjectivity of the sum map is checked on geometric points using Prop. II.2.9 (every element of `P_d` is a product of elements of `P_1`).

([FS][FS], Proposition II.3.7, pp. 82–83.)

*Needs:* [Two-term Banach–Colmez geometry](#two-term-banachcolmez-geometry); [Dieudonné–Manin classification of finite isocrystals](#dieudonnémanin-classification-of-finite-isocrystals); DiamondsAndVStacks D5 / spatial-v-sheaf-criterion; DiamondsAndVStacks D5 / relative-representability; DiamondSixOperations S4; DiamondSixOperations S5; [Effective divisors and projective sections](#effective-divisors-and-projective-sections); DiamondsAndVStacks D5; [Quotients by contracting automorphisms](#quotients-by-contracting-automorphisms); [Relative HN filtration and pro-étale splitting](#relative-hn-filtration-and-pro-étale-splitting); DiamondsAndVStacks D3 / locally-profinite-torsors.

#### Effective divisors and projective sections

After geometric degree and relative HN trivialization, construct the relative effective divisors as the v-sheaf of effective relative Cartier divisors of geometric degree `d≥0`, with pullback, addition, disjoint supports, degree additivity and v-descent. Identify its `d=1` component with the early marked-untilt `Div¹`. For `d≥1`, its absolute restriction `Div^d` is `(BC(O(d))∖{0})/E^×`. It is proper over `∗`, representable in spatial diamonds and cohomologically smooth. The sum map `(Div¹)^d→Div^d` is a quasi-pro-étale cover identifying `Div^d=(Div¹)^d/Σ_d` as v-sheaves; in particular `Div^d` is a diamond (ECD Propositions 11.4, 11.6).

Absolute curve over `k=𝔽̄_q`; coefficient field E as in FS.

**Checks.**

- Degree zero gives the empty divisor, hence a one-point moduli sheaf.
- Degree one recovers the early untilt quotient and its fundamental section torsor.
- Adding two degree-one divisors gives degree two, including at coincident supports where multiplicities are retained.
- Pullback along a base isomorphism preserves the Cartier ideal and geometric degree.

([FS][FS], Proposition II.3.6, pp. 81–82.)

*Needs:* [The fundamental untilt sequence and degree-one divisors](#the-fundamental-untilt-sequence-and-degree-one-divisors); [Ordinary Banach–Colmez properness](#ordinary-banachcolmez-properness); [Marked-untilt Div¹](#marked-untilt-cartier-divisors-and-cartier-descent); [Rank, determinant degree and rational slope](#rank-determinant-degree-and-rational-slope); DiamondsAndVStacks D5 / spatial-v-sheaf-criterion; DiamondsAndVStacks D5; DiamondSixOperations S5; [Relative HN filtration and pro-étale splitting](#relative-hn-filtration-and-pro-étale-splitting); [Regular noetherian geometric curve and PID complements](#regular-noetherian-geometric-curve-and-pid-complements); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); DiamondsAndVStacks D3 / locally-profinite-torsors.

#### Punctured absolute spaces and scalar quotients

For `d≥1` on `Perf_k`, punctured `BC(O(d))` is a spatial diamond. Write `Q=(BC(O(d))∖{0})/π^ℤ`. Although Q is not quasiseparated, `Q→∗` is representable in spatial diamonds. The full scalar quotient identifies with `Div^d`, and `Div^d→∗` is both proper and representable in spatial diamonds. For equal-characteristic E, punctured positive absolute spaces, corresponding to negative isocrystal slopes, are perfectoid; the negative absolute spaces are spatial diamonds. For p-adic E the relative space `BC(O_{X_C}(−1)[1])` cannot be perfectoid, by the argument of FS II.2.15. The corresponding equal-characteristic assertion is left unresolved in footnote 5 of that source.

Use punctured spaces throughout; absolute spatiality and relative spatial representability are different assertions.

([FS][FS], Remarks II.3.10–II.3.11, pp. 83–84; [FS][FS], Proof of Lemma II.2.15 and footnote 5, p. 71.)

*Needs:* [Absolute Banach–Colmez spaces of isocrystals of one sign](#absolute-banachcolmez-spaces-of-isocrystals-of-one-sign); [Effective divisors and projective sections](#effective-divisors-and-projective-sections); DiamondsAndVStacks D5 / relative-representability; DiamondsAndVStacks D5; [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles).

#### Quaternion presentation of negative Banach–Colmez space

Over `Perf_k`, the absolute punctured `BC(O(−1)[1])∖{0}` classifies extensions `0→O(−1)→E→O→0` that are non-split fiberwise; geometrically `E≅O(−1/2)`. It identifies with `(BC(O(1/2))∖{0})/SL₁(D)`, where D is the quaternion division algebra over E (invariant 1/2) and `SL₁(D)` its reduced-norm-one group. After base change to Spa C with a chosen untilt `C♯/E`, `BC(O(−1)[1])×_k Spa C≅(A¹_{C♯})^♢/E` and the punctured space becomes `(Ω_{C♯})^♢/E` with `Ω = A¹_E∖E = P¹_E∖P¹(E)`. The latter description uses the untilt and is not an identification with a perfectoid quotient space.

The nonzero extension has fixed determinant; the acting group is `SL₁(D)`, not `D×`.

([FS][FS], Example II.3.12, p. 84.)

*Needs:* [Geometric classification of vector bundles](#geometric-classification-of-vector-bundles); [Hom and extension calculus for geometric bundles](#hom-and-extension-calculus-for-geometric-bundles); [Stable-bundle division endomorphism comparison](#stable-bundle-division-endomorphism-comparison); [Arithmetic Brauer invariant and slope normalization](#arithmetic-brauer-invariant-and-slope-normalization); [The fundamental untilt sequence and degree-one divisors](#the-fundamental-untilt-sequence-and-degree-one-divisors); [Absolute Banach–Colmez spaces of isocrystals of one sign](#absolute-banachcolmez-spaces-of-isocrystals-of-one-sign); [Relative HN filtration and pro-étale splitting](#relative-hn-filtration-and-pro-étale-splitting); DiamondsAndVStacks D3 / locally-profinite-torsors.

#### SL₂ presentation of negative Banach–Colmez space

Over `Perf_k`, the absolute punctured `BC(O(−2)[1])∖{0}≅U/SL₂(E)`, where `U⊂(BC(O(1))∖{0})²` is the open locus of pairs of sections that are fiberwise nonzero and E-linearly independent, `U=(BC(O(1))∖{0})²∖(E^××1).Δ`. The corresponding extension `0→O(−1)→O²→O(1)→0` is specified by a surjection and its determinant trivialization; changing the determinant-preserving basis gives `SL₂(E)`, not `GL₂(E)`.

Nonzero extension class; determinant fixed.

([FS][FS], Example II.3.13, p. 85.)

*Needs:* [Lubin–Tate universal cover and sections of O(1)](#lubintate-universal-cover-and-sections-of-o1); [The fundamental untilt sequence and degree-one divisors](#the-fundamental-untilt-sequence-and-degree-one-divisors); [Geometric classification of vector bundles](#geometric-classification-of-vector-bundles); [Hom and extension calculus for geometric bundles](#hom-and-extension-calculus-for-geometric-bundles); [Absolute Banach–Colmez spaces of isocrystals of one sign](#absolute-banachcolmez-spaces-of-isocrystals-of-one-sign); [Relative HN filtration and pro-étale splitting](#relative-hn-filtration-and-pro-étale-splitting); DiamondsAndVStacks D3 / locally-profinite-torsors.

### Sympathetic algebras and the classical category

The sympathetic-algebra targets in this subsection use the fixed-C, countable-residue-field hypotheses in the conventions. The abstract pro-étale category has the separately stated arbitrary-complete-algebraically-closed-C scope.

#### Sympathetic Vector Spaces

Use the category of connected spectral C-Banach algebras whose p-power map is onto the open unit neighborhood of 1. CN further require faithful evaluation on C-valued spectral points and a dense C-linear subspace with a countable basis. Write `O_Λ` for the unit ball. These extra requirements exclude the spherical-closure example in footnote 6 and permit the Hahn–Banach arguments under the standing countability assumption. A sympathetic Vector Space is a covariant functor from this category to `ℚ_p`-vector spaces. Exactness means exactness after evaluation at each algebra `Λ`.

**API.**

- A sympathetic Vector Space is a covariant functor from the stated sympathetic C-Banach algebras to ModuleCat `ℚ_p`.
- Include the constant functor of a finite-dimensional `ℚ_p` vector space.
- `V_d` evaluates to `Λ^d` and maps by the C-algebra homomorphism in every coordinate.
- A short complex is short exact iff its evaluated ModuleCat complex is short exact at every `Λ`.
- Construct the functorial period objects `B_dR⁺(Λ)`, `B_dR(Λ)` and `B_m(Λ)` on sympathetic algebras using the theta-kernel completion; compare them with PadicHodgeTheory §§0.2–0.3 and 2.2 on its field and perfectoid-chart domains. Prove compatibility with algebra maps, quotient by the Cartier parameter, finite direct sums and the stated evaluations at `C`. This is the sympathetic-algebra extension beyond the supplier domain.

**Checks.**

- The constant `ℚ_p` functor evaluates to `ℚ_p` at C, whereas `V₁` evaluates to C.
- `V₀` is the zero functor.
- `V_{d+e}≅V_d⊕V_e` coordinatewise.
- The C-valued spectrum-injectivity condition excludes the spherical-closure example singled out by footnote 6; p-root surjectivity alone is insufficient.

([CN (author copy)][CN-author], §3.1.1 with footnote 6, p. 12.)

*Needs:* `NormedAlgebra`; `ModuleCat`.

#### Finite-Dimensional Banach–Colmez presentations

A sympathetic Vector Space W admits a finite Banach–Colmez presentation when some Y fits into `0→V₁→Y→V_d→0` and `0→V₂→Y→W→0`, where `V_d(Λ)=Λ^d` and `V₁,V₂` are constant finite-dimensional `ℚ_p` spaces. Such W is a BC object. The presentation assigns `dim(W)=d` and `ht(W)=dim_Qp(V₁)−dim_Qp(V₂)`, so Dimension is the pair (dim,ht). Independence of these integers from Y and the two sequences is the separate Dimension theorem.

**API.**

- A presentation consists of Y and exact `0→V₁→Y→V_d→0`, `0→V₂→Y→W→0` with finite `ℚ_p` spaces `V₁,V₂`.
- Its dimension is the natural number d.
- Its height is the integer `finrank_Qp(V₁)−finrank_Qp(V₂)`.
- The pair `(d,height)` is independent of the presentation by the dimension and abelianness theorem below.
- Adding the same finite `ℚ_p` vector space to `Y,V₁,V₂` gives another presentation of W and the same dimension and height.

**Checks.**

- The tautological presentation of `V_d` has Dimension (d,0). An additive constant functor supplies the zero finite endpoints, giving a presentation with `dim=d` and height zero for every d.
- A finite `ℚ_p` vector space of dimension h has Dimension (0,h).
- The cokernel `V₁/ℚ_p` of a nonzero `ℚ_p→V₁` map has Dimension `(1,−1)`.
- Increasing both finite `ℚ_p` dimensions by one leaves height unchanged.

([CN (author copy)][CN-author], §3.1.1, pp. 12–13.)

*Needs:* [Sympathetic Vector Spaces](#sympathetic-vector-spaces); `CategoryTheory.ShortComplex.ShortExact`; `Module.finrank`.

#### Exact faithful Banach realization

Evaluation at C is faithful on BC objects. Evaluation at any sympathetic algebra `Λ` gives a `ℚ_p-Banach` space; BC morphisms evaluate to continuous strict linear maps, and BC short exact sequences evaluate to strict short exact sequences. Nonetheless, the topology of `W(C)` alone cannot recover Dimension: C and `C⊕ℚ_p` have isomorphic topological `ℚ_p`-vector spaces but different BC Dimensions.

([CN (author copy)][CN-author], Remark 3.1, p. 13; [FF][FF], §8.4.1, main text pp. 245–247.)

*Needs:* [Finite-Dimensional Banach–Colmez presentations](#finite-dimensional-banachcolmez-presentations); [Dimension and the abelian BC category](#dimension-and-the-abelian-bc-category).

#### Dimension and the abelian BC category

BC is an abelian category. The presentation invariant `Dim=(dim,ht)` is well defined and additive in short exact sequences. In particular, any BC map f has BC kernel, image and cokernel, with `Dim(W₁)=Dim(ker f)+Dim(im f)` and `Dim(W₂)=Dim(im f)+Dim(coker f)`. A zero-dimensional object has nonnegative height. If W is built from an increasing filtration with `V₁` as every successive quotient, each BC subobject of W also has nonnegative height.

([CN (author copy)][CN-author], Proposition 3.2, p. 13; [FF][FF], Preface, Theorem 2.12(i)–(ii), printed pp. 16–17.)

*Needs:* [Le Bras equivalence](#le-bras-equivalence); [Finite-Dimensional Banach–Colmez presentations](#finite-dimensional-banachcolmez-presentations); `CategoryTheory.Abelian`.

#### Dimensions of standard Banach–Colmez spaces

For integers `h≥1`, `d∈ℤ` and `m≥1`, the period objects `B_m=B⁺_dR/t^m` and `U_{h,d}` belong to BC. Their Dimensions are `Dim(B_m)=(m,0)`, `Dim(U_{h,d})=(d,h)` for `d≥0`, and `Dim(U_{h,d})=(−d,−h)` for `d<0`. In particular `U_{1,0}=ℚ_p` has Dimension (0,1); the zero-slope case is retained in the nonnegative branch.

([CN (author copy)][CN-author], Example 3.3, p. 13.)

*Needs:* [Dimension and the abelian BC category](#dimension-and-the-abelian-bc-category); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [The fundamental untilt sequence and degree-one divisors](#the-fundamental-untilt-sequence-and-degree-one-divisors); [Completed local period rings](#completed-local-period-rings).

#### Abstract Banach–Colmez category

For fixed `C/ℚ_p` algebraically closed and complete, BC is the smallest strictly full abelian subcategory of sheaves of `ℚ_p`-modules on `Perf_C,proét`, stable under extensions and containing underline `ℚ_p` and the additive untilt sheaf `G_a`. Equivalently close these generators under finite biproducts, kernels and cokernels of morphisms BETWEEN BC objects, extensions and isomorphisms. Do not require closure under every ambient subobject.

The untilt additive sheaf is over `Perf_C`; Frobenius coefficients are `ℚ_p` here.

**API.**

- Use the generated abelian extension-closed strictly full subcategory of `ℚ_p`-module sheaves containing `ℚ_p` and `G_a`.
- The constant sheaf `ℚ_p` is a member.
- The untilt additive sheaf `G_a` is a member.
- Kernels and cokernels of maps between member objects remain members, computed in the ambient abelian sheaf category.
- A short exact extension of two members is a member.
- Degree-zero hypercohomology induces the exact equivalence with the tilted coherent heart; sympathetic values agree with the presentation realization.

**Checks.**

- The two generators are `ℚ_p` and `G_a`, with Dimensions (0,1) and (1,0).
- The zero sheaf is in AbstractBC.
- The cokernel `G_a/ℚ_p` belongs and is `BC(O(−1)[1])` after choosing `∞`.
- C and `C⊕ℚ_p` are isomorphic as topological `ℚ_p`-vector spaces but their BC Dimensions (1,0) and (1,1) differ.

([SW][SW], Definition 15.2.1, book p. 133; [SW][SW], Theorem 15.2.12, book p. 139.)

*Needs:* `CategoryTheory.Sheaf`; `CategoryTheory.Abelian`; DiamondsAndVStacks D6 / etale-site-comparison; DiamondsAndVStacks D3.

### Curvature, the tilted coherent heart and HN invariants

For the sympathetic-algebra realizations, retain the fixed-C/countability hypotheses in the conventions. Use SchemeAndStackFoundations §2.18's derived coherent category. Construct the torsion pair determined by the curve slopes and its tilted heart here, proving the torsion decomposition, Hom orthogonality and the heart's abelian structure. The Le Bras equivalence requires a construction of hypercohomology full faithfulness and the comparison with sympathetic evaluation; supplying an abstract equivalence parameter does not prove these comparisons. The HN slope of a nonzero standard BC block is `−1/λ`; `U₀=ℚ_p` has slope `−∞`. Curvature also remembers whether torsion is supported at the chosen point `∞`, so it is not determined just by the numerical BC slope zero.

#### Curvature

Use five curvature classes for `W∈BC`. Positive curvature means `Hom(W,V₁)=0`; nonnegative curvature means `Hom(W,BdR⁺)=0`. Curvature zero, also called affine, means a finite successive extension of `V₁`. Negative curvature means that W embeds in `BdR^d` for some d, equivalently in `(BdR⁺)^d`. Nonpositive curvature means an embedding into a `B⁺_dR-Module`, interpreted as a period Vector Space with a `B⁺_dR` action. The distinctions between strict and weak signs are part of the definition.

**API.**

- Positive curvature means `Hom_VS(W,V₁)=0`.
- Nonnegative curvature means `Hom_VS(W,BdR⁺)=0`.
- Affine curvature means having a finite filtration with `V₁` quotients.
- Negative curvature means admitting an injection into `(BdR⁺)^d` for some finite d, equivalently `BdR^d`.
- Nonpositive curvature means admitting an injection into a VS carrying a `B_dR⁺`-Module structure.
- Every curvature predicate is invariant under BC isomorphism.

Affine curvature is the closure of zero and `V₁` under isomorphisms and successive short exact extensions with quotient `V₁`. It is a finite-filtration condition, rather than a condition on one numerical height. All five curvature predicates use the distinguished additive and period objects in the sympathetic Vector Space category, including the finite powers and the restriction-of-scalars functor for period modules. (CN author copy Definition 3.5, p. 13.)

**Checks.**

- `ℚ_p` has strict negative curvature and height one.
- `V₁` has curvature zero and height zero. The additive generator has the one-step filtration with quotient `V₁`.
- `H¹(O(−1))` has positive curvature and height `−1`.
- At `x≠∞`, `U₁/ℚ_p t_x` has height zero and positive curvature but not curvature zero.
- The zero object satisfies all five predicates; strict height inequalities require nonzero objects.

([CN (author copy)][CN-author], Definition 3.5, p. 13.)

*Needs:* [Sympathetic Vector Spaces](#sympathetic-vector-spaces); [Finite-Dimensional Banach–Colmez presentations](#finite-dimensional-banachcolmez-presentations); [Completed local period rings](#completed-local-period-rings); PadicHodgeTheory §§0.2–0.5 and 2.2, with the period-functor extension specified in [Sympathetic Vector Spaces](#sympathetic-vector-spaces).

#### Curvature orthogonality

`Hom_BC(W,W′)` vanishes for either of the following curvature pairs: `(>0,≤0)` or `(≥0,<0)`. The classes of nonpositive and of strictly negative curvature are each preserved under VS subobjects. Dually, nonnegative and strictly positive curvature are each preserved under VS quotients.

([CN (author copy)][CN-author], Remark 3.6, p. 13.)

*Needs:* [Curvature](#curvature); [Curvature and HN support](#curvature-and-hn-support).

#### The tilted coherent heart

`Coh⁻_X` is the full subcategory of `Dᵇ(Coh_X)` with cohomology only in degrees `−1` and 0, `H^{−1}` of negative slopes and `H⁰` of nonnegative slopes INCLUDING torsion sheaves. It is the torsion-pair tilt heart, hence abelian. Objects split noncanonically as `H⁰⊕H^{−1}[1]` because the curve has cohomological dimension one. For such a zero-differential representative `BC(F)=H⁰(X,H⁰F)⊕H¹(X,H^{−1}F)`, noncanonically; general morphisms include `Ext¹(H⁰F,H^{−1}G)`.

**API.**

- The tilted heart consists of objects `K∈Dᵇ(Coh_X)` with `HⁱK=0` except `i=−1,0`, `H⁻¹` negative and `H⁰` nonnegative including torsion.
- A coherent sheaf of nonnegative slopes enters in degree zero.
- A negative bundle enters with shift [1].
- K is isomorphic to `H⁰K⊕H⁻¹K[1]`, noncanonically, using `Ext²=0` on the curve.
- Morphisms between these decompositions have diagonal Hom and off-diagonal `Ext¹(E₀,F₋₁)`.

**Checks.**

- `O(1)` in degree zero belongs to the heart.
- `O(−1)[1]` belongs, while `O(−1)` in degree zero does not.
- The torsion skyscraper at any untilt point belongs in degree zero.
- O[1] is excluded, since its `H⁻¹` has slope zero rather than negative.

([CN (author copy)][CN-author], §3.2.4, p. 15.)

*Needs:* `DerivedCategory`; SchemeAndStackFoundations §§0.3–0.4, 2.18 and 3.3–3.4; [Rank, determinant degree and rational slope](#rank-determinant-degree-and-rational-slope); [Coherent sheaves on the geometric curve](#coherent-sheaves-on-the-geometric-curve); [Two affine charts and cohomological dimension one](#two-affine-charts-and-cohomological-dimension-one).

#### Le Bras equivalence

The functor BC realises an equivalence of categories `Coh^-_X ≃` BC. In its pro-étale sheaf realization every BC object is a diamond (SW Theorem 15.2.12); no perfectoid representability is inferred.

([CN (author copy)][CN-author], Theorem 3.12, p. 15.)

*Needs:* [Banach–Colmez section and hypercohomology sheaves](#banachcolmez-section-and-hypercohomology-sheaves); [The tilted coherent heart](#the-tilted-coherent-heart); [Hom and extension calculus for geometric bundles](#hom-and-extension-calculus-for-geometric-bundles); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [Finite-Dimensional Banach–Colmez presentations](#finite-dimensional-banachcolmez-presentations); DiamondsAndVStacks D3; [Abstract Banach–Colmez category](#abstract-banachcolmez-category); [Two-term Banach–Colmez geometry](#two-term-banachcolmez-geometry); `CategoryTheory.Equivalence`.

#### Banach–Colmez HN invariants

On the tilted coherent heart, assign `rk⁻([E₋₁→E₀])=deg(E₀)−deg(E₋₁)` and `deg⁻([E₋₁→E₀])=rk(E₋₁)−rk(E₀)`. Under Le Bras these become dim and `−ht`, defining the BC HN structure. A nonzero torsion object has slope zero. Write `W_{≥λ},W_{>λ}` for the HN pieces and `W_{>−∞}=∪_λW_{≥λ}`. For reduced `λ=d/h` with `h>0`, let `U_λ=U_{h,d}`; scaling the pair by `e≥1` gives e copies. For `λ≥0` use `H⁰(O(λ))`, and for `λ<0` use `H¹(O(λ))`, equivalently `BC(O(λ)[1])`. For `λ≠0` the standard block has `rk⁻=sign(λ)d`, `deg⁻=−sign(λ)h` and `µ⁻=−1/λ`. The boundary `U₀=ℚ_p` instead has `rk⁻=0`, `deg⁻=−1` and `µ⁻=−∞`; the zero object has no HN slopes. The reciprocal-slope formula requires `λ≠0`; `U₀` is handled separately.

**API.**

- Set BC `rank=dim`, BC `degree=−ht`, with the zero object assigned no slope.
- For `E₋₁[1]⊕E₀`, `rank=deg E₀−deg E₋₁` and `degree=rank E₋₁−rank E₀`.
- For positive dimension use `−ht/dim`; a nonzero dimension-zero object has slope `−∞`.
- For a nonzero standard curve slope `λ`, BC slope of `U_λ` is `−1/λ`.
- Rank and degree add in a BC short exact sequence; slope does not simply add.

**Checks.**

- `ℚ_p` has rank zero, degree `−1` and slope `−∞`.
- `V₁` has rank one, degree zero and slope zero.
- `U_{2,1}` has BC rank one, degree `−2` and slope `−2`, while `O(1/2)` has curve rank two and degree one.
- `U_{1,−1}=H¹(O(−1))` has BC rank one, degree one and slope one.
- The zero object has BC rank and degree zero and no slope; it is not assigned the slope `−∞` of a nonzero finite `ℚ_p` space.

([CN (author copy)][CN-author], §3.2.5, p. 16.)

*Needs:* [Dimension and the abelian BC category](#dimension-and-the-abelian-bc-category); [Le Bras equivalence](#le-bras-equivalence); [Rank, determinant degree and rational slope](#rank-determinant-degree-and-rational-slope).

#### HN decomposition and connected components

The object `U₀=ℚ_p` has BC slope `−∞`. The diamond realization of W identifies its identity component with `W_{>−∞}` and its component quotient `W_{−∞}` with the maximal étale quotient, a finite-dimensional `ℚ_p-space`. The BC HN filtration admits a noncanonical splitting. Consequently `W≅(⊕_i U_{−1/λ_i})⊕(⊕_x H⁰(X,F_x))`, where `λ_i∈ℚ∪{−∞}` are nonzero and the torsion sheaves `F_x` have finite support. Each `U_{−1/λ_i}` has BC slope `λ_i`; each nonzero torsion summand has BC slope 0. These are precisely the slopes of W. For a zero-differential representative `E_{−1}[1]⊕E₀`, with `E_{−1}` negative and `E₀` nonnegative, `H¹(X,E_{−1})` is the positive-slope HN subobject. For an arbitrary differential use the cohomology sheaves `H^{−1}K` and `H⁰K` in the canonical truncation sequence `0→H¹(X,H^{−1}K)→BC(K)→H⁰(X,H⁰K)→0`.

**Checks.**

- The zero differential on `[O(−1)→O]` gives positive HN subobject `H¹(O(−1))`.
- The nonzero untilt-divisor inclusion `[O(−1)→O]` has BC object the affine skyscraper C and no positive HN part, although `H¹(O(−1))≠0`.
- For `[0→O]` the positive part is zero and the whole object has BC slope `−∞`.

([CN (author copy)][CN-author], §3.2.4 and footnote 7, p. 15; Remark 3.13(iv) and (3.14), p. 16.)

*Needs:* [Banach–Colmez HN invariants](#banachcolmez-hn-invariants); [Coherent sheaves on the geometric curve](#coherent-sheaves-on-the-geometric-curve); [Le Bras equivalence](#le-bras-equivalence); DiamondsAndVStacks D5 / relative-representability.

#### Canonical curvature filtration

The canonical curvature filtration of a BC object W is uniquely specified by `W_{>0}⊂W_{≥0}⊂W`: the subobject has curvature `>0`, the middle quotient has curvature 0, and the final quotient has curvature `<0`. Define `W_{>0}=∩_{m≥1, f:W→B_m}ker f` and `W_{≥0}=∩_{f:W→B_dR}ker f`. The HN description verifies the middle quotient condition. Set `W_{≤0}=W/W_{>0}` and `W_{=0}=W_{≥0}/W_{>0}`; they are respectively the maximal nonpositive-curvature quotient and its maximal affine subobject. In the decomposition (3.14), `W_{>0}` consists of the `U_{−1/λ_i}` with `λ_i>0` together with all `H⁰(X,F_x)` for `x≠∞`; `W_{≤0}` consists of the `U_{−1/λ_i}` with `λ_i<0` and `H⁰(X,F_∞)`. Thus `W_{<0}=⊕_{λ_i<0}U_{−1/λ_i}` and `W_{=0}=H⁰(X,F_∞)`. Strictly negative curvature is equivalent to strictly negative BC HN slopes; strictly positive BC HN slopes imply positive curvature. This is Plût’s filtration, described through Le Bras’s HN equivalence.

**API.**

- Construct subobjects `W_{>0}≤W_{≥0}≤W` with positive, affine and negative graded pieces.
- `W_{>0}` is the intersection of kernels of all `W→B_m`.
- `W_{≥0}` is the intersection of kernels of all `W→BdR`.
- Every BC map preserves these subobjects.
- Every map from W to a nonpositive-curvature BC factors uniquely through `W/W_{>0}`.
- `W_{≥0}/W_{>0}` is the maximal affine subobject of `W/W_{>0}`.

For a specified module-valued functor `W`, the component of the positive part is the intersection of the kernels of the components of all natural maps `W → B_m`, indexed with `m ≥ 1`; the middle part uses all natural maps `W → B_dR`. These components are nested submodules of `W(Λ)`, and the two displayed intersections use the actual period target functors. Prove their naturality and nesting for the actual period functors, and prove that the quotient `W_{≥0}/W_{>0}` is the affine graded object. The canonical curvature properties and maximality concern those actual subfunctors. (CN author copy Proposition 3.7 and Remark 3.8, pp. 13–14.)

**Checks.**

- For `ℚ_p`, `W_{>0}=W_{≥0}=0`.
- For `V₁`, `W_{>0}=0` and `W_{≥0}=W`.
- For `H¹(O(−1))`, `W_{>0}=W_{≥0}=W`.
- For torsion at `x≠∞`, `W_{>0}=W` despite BC HN slope zero; HN cut at zero alone is insufficient.

([CN (author copy)][CN-author], Proposition 3.7 and Remark 3.8, pp. 13–14; [CN (author copy)][CN-author], §3.2.8, p. 18.)

*Needs:* [Curvature](#curvature); [HN decomposition and connected components](#hn-decomposition-and-connected-components); [Artinian property of BC](#artinian-property-of-bc); [VS Hom vanishing from torsion period modules](#vs-hom-vanishing-from-torsion-period-modules).

#### Euler–Poincaré height formula

For every coherent sheaf F on the geometric curve, `ht(H⁰(X,F))−ht(H¹(X,F))=rk(F)`. For a standard block `O(λ)`, where `λ=d/h` is reduced with `h>0`, the difference is h. Additivity and coherent-sheaf classification extend this calculation from standard blocks to all F; torsion has rank and Euler height zero.

([CN (author copy)][CN-author], Remark 3.11, p. 15.)

*Needs:* [Dimensions of standard Banach–Colmez spaces](#dimensions-of-standard-banachcolmez-spaces); [Coherent sheaves on the geometric curve](#coherent-sheaves-on-the-geometric-curve).

#### Artinian property of BC

Every descending chain `W₀ ⊇ W₁ ⊇ ⋯` of BC subobjects stabilizes. In the dimension-height argument, `dim(W_n)` first becomes constant; the quotients `W_N/W_n` then have dimension zero and come from the maximal finite `ℚ_p` quotient of `W_N`, so their heights are bounded and eventually constant. A second argument reduces via a presentation to `V_d` and inducts on d: a proper subobject of `V₁` is finite-dimensional over `ℚ_p`.

([CN (author copy)][CN-author], Remark 3.15, p. 16.)

*Needs:* [HN decomposition and connected components](#hn-decomposition-and-connected-components); [Dimension and the abelian BC category](#dimension-and-the-abelian-bc-category).

#### Height bound for non-affine additive subobjects

For a NONZERO sub-BC `W⊂V_N` which contains no subobject isomorphic to `V₁`, `dim(W)<ht(W)`; all its BC HN slopes are `<−1`. The zero object has no slopes but does not satisfy the strict numerical inequality. Include finite `ℚ_p` summands (slope `−∞`) in the proof.

([CN (author copy)][CN-author], Lemma 3.16, pp. 16–17.)

*Needs:* [HN decomposition and connected components](#hn-decomposition-and-connected-components); [Dimension and the abelian BC category](#dimension-and-the-abelian-bc-category); [Banach–Colmez morphism calculus](#banachcolmez-morphism-calculus).

#### Banach–Colmez morphism calculus

For zero-map tilted-heart representatives `E₋₁[1]⊕E₀` and `F₋₁[1]⊕F₀`, BC morphisms are triangular matrices with diagonal `Hom(E₋₁,F₋₁)`, `Hom(E₀,F₀)` and off-diagonal `Ext¹(E₀,F₋₁)`. `End_BC(U_λ)=End(O(λ))=D_λ`. For `λ=d/h≥0` in lowest terms `Hom_BC(U_λ,V₁)` has C-dimension h with basis `θ∘φ^i`, `0≤i<h`. Tensor multiplicities and Brauer signs are those of the standard-bundle tensor and endomorphism calculations above; the Hom formula retains the denominator multiplicity.

([CN (author copy)][CN-author], §3.2.4 and §3.2.6, pp. 15,17.)

*Needs:* [Le Bras equivalence](#le-bras-equivalence); [Stable-bundle division endomorphism comparison](#stable-bundle-division-endomorphism-comparison); [Arithmetic Brauer invariant and slope normalization](#arithmetic-brauer-invariant-and-slope-normalization); [Hom and extension calculus for geometric bundles](#hom-and-extension-calculus-for-geometric-bundles); [Completed local period rings](#completed-local-period-rings).

### Period modules and curvature calculus

These targets use the same fixed-C/countability hypotheses. Period modules are functors on sympathetic algebras: `Λ↦M⊗_{B_dR⁺}B_dR⁺(Λ)`. The Hom-vanishing theorem concerns arbitrary VS natural maps, so its proof must establish a uniform t-denominator bound on their images; period-linearity is not a hypothesis.

#### Torsion at an untilt point

At a closed untilt point x, torsion coherent sheaves supported at x are equivalent to finite-length `B⁺_dR(C_x)`-modules via global sections. The indecomposable modules are `B_m(C_x)=B⁺_dR(C_x)/t_x^m`, `m≥1`. The divisor sequence `0→O→O(m)→i_{x,*}B_m(C_x)→0` has first map `t_x^m`; `H¹(O)=0` therefore identifies the BC realization with `U_m/ℚ_p t_x^m`. Its endomorphism ring is `B_m(C_x)`, giving `C_x` when `m=1`. For `x≠∞` its Hom to `V₁` vanishes because the supports are disjoint. At the chosen point `∞`, write `t_x=t`; a finite-length module M is realized by the functor `Λ↦M⊗_{B⁺_dR}B⁺_dR(Λ)`, rather than an extension of scalars from a ring to itself.

([CN (author copy)][CN-author], §3.2.7, pp. 17–18.)

*Needs:* [Le Bras equivalence](#le-bras-equivalence); [The fundamental untilt sequence and degree-one divisors](#the-fundamental-untilt-sequence-and-degree-one-divisors); [Untilts and completed local rings](#untilts-and-completed-local-rings); [Coherent sheaves on the geometric curve](#coherent-sheaves-on-the-geometric-curve).

#### Curvature-zero finite-length modules

Finite-length modules over the ring `B⁺_dR` form a category equivalent to the curvature-zero full subcategory of BC. The realization of M is the period Vector Space `Λ↦M⊗_{B⁺_dR}B⁺_dR(Λ)`, using the period-ring functor on sympathetic algebras; this is not a scalar extension of the ring to itself.

([CN (author copy)][CN-author], Proposition 3.17, p. 18.)

*Needs:* [Torsion at an untilt point](#torsion-at-an-untilt-point); [Curvature](#curvature).

#### VS Hom vanishing from torsion period modules

The curvature-zero BC category is closed under kernels and cokernels of its morphisms. Let W be a BC object carrying a `B⁺_dR-Module` structure with `t^rW=0` for some `r≥1`. Then every VS natural map `W→B⁺_dR` or `W→B_dR` is zero. The BC hypothesis permits the finite-length realization used in Corollary 3.18. For `B⁺_dR`, compare maps to all `B⁺_dR/t^k` and take their inverse limit, obtaining Hom into a torsion-free module. For `B_dR`, the remaining bounded-image argument must place each arbitrary VS map inside `t^{-N}B⁺_dR` for some N; this requires a bounded-image lemma for arbitrary natural maps. The maps are not assumed period-linear.

([CN (author copy)][CN-author], Corollary 3.18, p. 18.)

*Needs:* [Curvature-zero finite-length modules](#curvature-zero-finite-length-modules); [Banach–Colmez morphism calculus](#banachcolmez-morphism-calculus); PadicHodgeTheory §§0.2–0.5 and 2.2, with the period-functor extension specified in [Sympathetic Vector Spaces](#sympathetic-vector-spaces).

#### Curvature and HN support

A BC object has curvature `<0` exactly when it is `H⁰(X,E)` for a vector bundle E with nonnegative curve slopes. Curvature `≤0` permits, in addition, a torsion coherent summand supported at `∞` in E. Both curvature classes are stable under extensions within BC.

([CN (author copy)][CN-author], §3.2.8 and Corollary 3.19, p. 18.)

*Needs:* [Curvature](#curvature); [HN decomposition and connected components](#hn-decomposition-and-connected-components); [Torsion at an untilt point](#torsion-at-an-untilt-point); [VS Hom vanishing from torsion period modules](#vs-hom-vanishing-from-torsion-period-modules).

#### Height signs from curvature

Curvature zero implies height zero; NONZERO strictly negative-curvature BC objects have strictly positive height; positive-curvature objects have height `≤0`. A nonzero torsion object at `x≠∞` has height zero and strictly positive curvature, so `≤` cannot be strengthened to `<`.

([CN (author copy)][CN-author], Corollary 3.20 and footnote 9, p. 18.)

*Needs:* [Curvature and HN support](#curvature-and-hn-support); [Dimensions of standard Banach–Colmez spaces](#dimensions-of-standard-banachcolmez-spaces).

#### Curvature subobjects and quotients

Negative/nonpositive curvature is preserved by sub-BCs; positive/nonnegative curvature is preserved by quotients. A height-zero subobject of a nonpositive-curvature object has curvature zero. The printed dual quotient assertion is false: a height-zero quotient of a nonnegative-curvature BC has HN slope zero (torsion support), and has curvature zero if and only if its support is at `∞`.

([CN (author copy)][CN-author], Corollary 3.21, p. 18; corrected (iv).)

*Needs:* [Curvature and HN support](#curvature-and-hn-support); [Dimension and the abelian BC category](#dimension-and-the-abelian-bc-category).

#### Height of torsion period subobjects

For any BC inclusion `U⊂W` with W a torsion `B⁺_dR-Module`, `ht(U)` is nonnegative. Equality holds precisely when U is itself a torsion `B⁺_dR-Module`. An alternative to HN theory is induction on the length of W: subobjects of `V₁` are `V₁` or finite-dimensional `ℚ_p-spaces`, and the period-module class is extension closed.

([CN (author copy)][CN-author], Remark 3.22, p. 19.)

*Needs:* [Curvature subobjects and quotients](#curvature-subobjects-and-quotients); [Curvature-zero finite-length modules](#curvature-zero-finite-length-modules).

#### Cokernel of a generating period-module image

Suppose f : `W₁ → W₂` is a BC morphism, `W₂` is a finite-length `B_dR⁺`-module, and the `B_dR⁺`-span of `im(f)` equals `W₂`. Any nonzero BC cokernel of f has positive curvature and negative height. After quotienting `W₁` by `ker(f)`, represent f by a coherent map `F₁ → F₂` on X with `H¹(F_i)=0` and `F₂` supported at `∞`. Generation implies surjectivity of this coherent map, while injectivity on BC sections gives `H⁰(ker(F₁ → F₂))=0`. Its cohomology sequence identifies the BC cokernel with `H¹` of that kernel. A nonzero cokernel excludes the torsion case, where the `B_dR⁺`-linear map would already be surjective on sections; the kernel is therefore a nonzero bundle with strictly negative slopes. Its `H¹` has the asserted curvature and height.

([CN (author copy)][CN-author], Proposition 3.23, p. 19.)

*Needs:* [Curvature and HN support](#curvature-and-hn-support); [Euler–Poincaré height formula](#eulerpoincaré-height-formula); [Le Bras equivalence](#le-bras-equivalence).

#### Nonpositive curvature extension criterion

A BC object W has curvature `≤0` exactly when it admits a BC short exact sequence `0→V→W→M→0` with V finite-dimensional over `ℚ_p` and M affine (curvature 0). For existence, decompose W into torsion at `∞` and `U_{d_i/h_i}` with `d_i/h_i≥0`; their fundamental sequences `0→ℚ_p^{h_i}→U_{d_i/h_i}→B_{d_i}→0` give `V=⊕_i ℚ_p^{h_i}`. The reverse implication follows from extension stability in CN Corollary 3.19(ii).

([CN (author copy)][CN-author], Lemma 3.24, p. 19.)

*Needs:* [Curvature and HN support](#curvature-and-hn-support); [The fundamental untilt sequence and degree-one divisors](#the-fundamental-untilt-sequence-and-degree-one-divisors); [Dimensions of standard Banach–Colmez spaces](#dimensions-of-standard-banachcolmez-spaces).

### A semistable period-space example

This application retains the supercuspidal representation hypotheses and the L-action. A dimension calculation alone does not establish the one-dimensional multiplicity statement.

#### Dimension of the semistable period space

For the supercuspidal rank-two slope-1/2 `L-(φ,N,G_F)`-module M of CDN §2.1.2, `X_st⁺(M)=(B_cris⁺⊗M)^{φ=p}` is a positive Banach–Colmez space of L-Dimension `([L:ℚ_p],2)`. The one-dimensional multiplicity conclusion of Lemma 2.7 also uses the admissibility/p-adic Hodge representation input; it is not deduced from Dimension for an arbitrary rank-two module.

Retain the paper’s supercuspidal hypothesis, coefficient action, and normalization of L-Dimension. No extension to arbitrary rank-two M or a new local-Langlands theorem is claimed.

([CDN][CDN], §2.1.2, Proposition 2.5 and Lemma 2.7, author preprint pp. 21–23.)

*Needs:* [Dimensions of standard Banach–Colmez spaces](#dimensions-of-standard-banachcolmez-spaces); [Dimension and the abelian BC category](#dimension-and-the-abelian-bc-category); [Two-term Banach–Colmez geometry](#two-term-banachcolmez-geometry); PadicHodgeTheory §3.5.

### Examples

The constant sheaf on two connected components has sections `E²`. The complex `[𝒪(−1) → 0]` contributes nonzero `H¹`, despite having zero raw degree-zero sections. Classical presentation dimensions are `(1,0)` for the additive object, `(0,1)` for `ℚ_p`, and `(1,−1)` for its nonzero additive quotient. The reciprocal BC slope of `𝒪(1/2)` is `−2`; the rational object has slope `−∞`, and zero has no slope.

### Dependencies

*Needs:* Layers 1–3; the family HN and cohomology targets of Layer 6 for general two-term geometry; PerfectoidSpaces; DiamondsAndVStacks D3–D6; DiamondEtaleCohomology C4; DiamondSixOperations S4–S5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.25–R07.2.28; PadicHodgeTheory §§0.2–0.5, 2.2 and 3.5; AdicEtaleGeometry Layer A1; SchemeAndStackFoundations §2.18.

## Layer 6: Families, pure models and local systems

### Geometric family filtrations and cohomology

The upper polygon convention is the one of Layer 2. Proper projectivized ordinary BC spaces detect the closed loci where an exterior-power section exists. The relative HN filtration descends globally on a constant-polygon locus; its splitting and block trivializations require a pro-étale cover.

#### Upper semicontinuity of geometric HN polygons

For a constant-rank n bundle E on `X_S`, the concave HN polygon, horizontal coordinate rank and decreasing slopes repeated with their ranks, is upper semicontinuous on `|S|`: for every `x∈[0,n]` its ordinate is upper semicontinuous. Rank and total degree are locally constant. This is FS II.2.19(i), including equal-characteristic coefficient fields. The polygon is the UPPER boundary of the convex hull of the exterior-power section points; do not replace it by KL’s convex lower polygon.

S is perfectoid over `𝔽_q`; rank n is constant on the component considered. Geometric-point values are invariant under extension of the complete algebraically closed field.

([FS][FS], Theorem II.2.19(i) and proof, p. 74.)

*Needs:* [Ordinary Banach–Colmez properness](#ordinary-banachcolmez-properness); [Rank-normalized Harder–Narasimhan polygon](#rank-normalized-hardernarasimhan-polygon); [Rank, determinant degree and rational slope](#rank-determinant-degree-and-rational-slope); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [Geometric classification of vector bundles](#geometric-classification-of-vector-bundles); [Base change of the geometric HN filtration](#base-change-of-the-geometric-hn-filtration).

#### Relative HN filtration and pro-étale splitting

Assume the HN polygon of E is constant on S. Then there exists a global separated exhaustive decreasing Harder-Narasimhan filtration `E^{≥λ}` in E specialising to the HN filtration at each point; and after replacing S by a PRO-ETALE cover the filtration can be split, with isomorphisms `E^λ = O_{X_S}(λ)^{n_λ}` for integers `n_λ ≥ 0`.

S is perfectoid over `𝔽_q`, the bundle has constant rank and constant geometric HN polygon. Splitting is PRO-ÉTALE local; it is not asserted étale local or globally split.

([FS][FS], Theorem II.2.19(ii) and proof, pp. 74–75.)

*Needs:* [Upper semicontinuity of geometric HN polygons](#upper-semicontinuity-of-geometric-hn-polygons); [Ordinary Banach–Colmez properness](#ordinary-banachcolmez-properness); [Geometric classification of vector bundles](#geometric-classification-of-vector-bundles); [Hom and extension calculus for geometric bundles](#hom-and-extension-calculus-for-geometric-bundles); DiamondsAndVStacks D3.10 / locally-profinite-torsors; [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [V-descent of bundles and their derived cohomology](#v-descent-of-bundles-and-their-derived-cohomology).

#### Slope-zero bundles and E-local systems

There is an exact tensor equivalence between finite-rank pro-étale E-local systems on S and vector bundles on `X_S` whose EVERY geometric HN slope is zero, via `L↦L⊗_E O_X`. The quasi-inverse is `T↦H⁰(X_T,E_T)`; it commutes with perfectoid base change and coefficient extension with its normalized Frobenius. Locally constant rank is handled componentwise. Total degree zero alone does not suffice.

Every geometric fibre is semistable of slope zero. On each component of locally constant rank its HN polygon is therefore the fixed zero polygon. Fibrewise triviality does not trivialize the descent datum globally. Full faithfulness is proved by pro-étale descent, reducing to L trivial, and then by Prop. II.2.5(ii): `H⁰(X_S,O)=underline E(S)`, the continuous E-valued functions on `|S|`, and `RΓ(X_S,O)=RΓ_proét(S,E)`. Essential surjectivity is Thm. II.2.19(ii) applied with a single slope 0. A local system is not the same as a globally trivial bundle: the descent datum is the content.

([FS][FS], Corollary II.2.20, p. 75.)

*Needs:* [Relative HN filtration and pro-étale splitting](#relative-hn-filtration-and-pro-étale-splitting); [Two-term Frobenius complex for curve cohomology](#two-term-frobenius-complex-for-curve-cohomology); DiamondsAndVStacks D3 / locally-profinite-torsors; `CategoryTheory.Equivalence`; [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles).

#### Slope-dependent cohomology vanishing

For a bundle E on `X_S`: everywhere negative slopes imply `H⁰(X_S,E)=0`, universally after perfectoid base change; everywhere nonnegative slopes imply `H¹(X_S,E)=0` after some pro-étale cover of S; everywhere positive slopes imply an étale cover `S′→S` such that `H¹(X_T,E_T)=0` for EVERY affinoid perfectoid `T/S′`. The second assertion is local vanishing of cohomology, not vanishing on every original S.

`S∈Perf_Fq`; slope assertions hold at all geometric points.

([FS][FS], Proposition II.3.4(i)–(iii), p. 79.)

*Needs:* [Banach–Colmez section and hypercohomology sheaves](#banachcolmez-section-and-hypercohomology-sheaves); [Relative HN filtration and pro-étale splitting](#relative-hn-filtration-and-pro-étale-splitting); [Small-slope resolutions of positive bundles](#small-slope-resolutions-of-positive-bundles); [Étale positive-slope presentations](#étale-positive-slope-presentations); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [V-descent of bundles and their derived cohomology](#v-descent-of-bundles-and-their-derived-cohomology).

### Pure models and annular approximation

KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach `𝔽_p`-algebra over an analytic field; `a≥1` and `q=p^a`. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct. All targets in this and the next three subsections use these hypotheses.

#### Annular basis approximation

For a `φ^a`-module M over `ℛ̃_R`, write `M_r` for its radius-r model. A basis of the annular restriction `M_[r/q,r]` extends as a basis of `M_r` if its Frobenius matrix is invertible over `ℛ̃_R^{r/q}` (Lemma 7.1.1). For the quantitative version (Lemma 7.1.2), fix `h≥0` and `D=diag(p^{d₁},…,p^{d_n})`, with integer exponents satisfying `|d_i−d_j|≤h`. Suppose the annular basis `e_i` has Frobenius matrix F over `ℛ̃_R^{[r/q,r/q]}` and `λ(α^{r/q})(FD−I)<p^{−h}`. There is a change-of-basis matrix U with `v_j=Σ_i U_ij e_i` giving a basis of `M_r`; its Frobenius matrix F′ satisfies `F′D−I∈p Mat_n(ℛ̃_R^{int,r/q})`. The bounds on this change are `λ(α^{r/q})(U−I)<p^{−h}` and `λ(α^r)(D⁻¹UD−I)<p^{−h}`.

([KL][KL], §7.1, Lemmas 7.1.1–7.1.2, pp. 145–146.)

*Needs:* [Annular Frobenius descent for bundles](#annular-frobenius-descent-for-bundles); [Relative tilted Robba ring from curve annuli](#relative-tilted-robba-ring-from-curve-annuli).

#### Pure models and purity loci

Choose integers `c,d` with `d>0` and `a|d`. For a `φ^a`-module M, let `A₀=W(R)` when M has `ℰ̃_R` coefficients, and `A₀=ℛ̃^int_R` for bounded or full Robba coefficients. A `(c,d)`-pure model is an `A₀-submodule M₀⊂M` satisfying three conditions: there exist a finitely generated `A₀-submodule N₀⊂M` and `n≥0` with `p^nM₀⊂N₀` and `p^nN₀⊂M₀`; extension from `A₀` to the coefficient ring identifies `M₀` with M; and the Frobenius on M restricts to an isomorphism `(p^cφ^d)^*M₀≅M₀`. Thus boundedness means commensurability with a finitely generated submodule, and the required stability is under `φ^d` after inverting p, without imposing `φ^a-stability` at this point (Remark 7.3.2). Such a model implies pointwise slope `c/d`. The adjectives free and locally free refer to finite free and finite locally free `A₀`-modules; finite presentation implies local freeness. A local model at `β` is a model after rational localization `R→R′` through a neighborhood of `β`. Lemma 7.3.3 equates existence of free and locally free local models, and for bounded Robba coefficients allows this existence test after extension to `ℰ̃_R`. Define purity of slope s at `β` by existence of a locally free local model with `c/d=s`; for nonzero rank `s=μ(M,β)`, while rank zero is pure of every slope. Purity means this condition at every `β`; compactness then gives finitely many local models. Étaleness is slope-zero purity, and an étale model has `c=0`. Global purity requires a locally free model over the original base. Distinguish five properties: (a) global purity; (b) existence of a pure model; (c) purity; (d) existence of local pure models; (e) pointwise purity. The comparison of (a)–(e) fixes one rational slope s on every nonzero fibre: all models, local or global, use parameters with `c/d=s`. For `ℰ̃_R` and `ℛ̃^bd_R`, properties (b),(c),(d),(e) are equivalent, whereas (a) is stronger. For `ℛ̃_R`, the equivalent properties are (c),(d),(e), with (b) stronger and (a) stronger still. KL Corollaries 7.3.9 and 8.5.14 supply the equivalences. Examples 8.5.17 and 8.5.18 distinguish the global conditions, with the stronger bounded-ring interpretation of the nodal example requiring its own patching argument. Extension from `ℛ̃^bd_R` to `ℛ̃_R` does not detect purity over the bounded coefficient ring. For unqualified purity with varying slopes, apply the comparison separately on the finite clopen slope partition of the nonzero-rank locus; the rank-zero locus is clopen and pure of every slope. Finiteness follows from compactness and local constancy of rank and degree (KL Lemma 7.2.2 and Definition 7.2.3).

**API.**

- A pure model is a bounded integral submodule generating the ambient Frobenius module, with `p^cφ^d` linearization invertible.
- The integral lattice is a Submodule of the restricted-scalars module, with its actual inclusion.
- Rational localization transports the pure model, its boundedness and its Frobenius isomorphism.
- A `(0,d)`-pure model is an étale model; globally pure means a globally finite locally free such model.
- On a nonzero fibre a `(c,d)`-pure model forces the Robba slope `c/d`, with `p^cφ^d=1` on a trivializing basis.

For the lattice obstruction, let `R` be a commutative ring, `Kp` a normed field with an `R`-algebra structure, and `V` a nontrivial normed `Kp`-space whose restricted `R`-module structure satisfies the scalar-tower equation. If `p ∈ Kp` is nonzero with `‖p‖ ≠ 1`, there is no bounded `R`-submodule `N ⊂ V` with `Kp`-span equal to `V` on which multiplication by `p` is bijective. A nonzero vector in `N` would have all its positive and negative scalar iterates in a bounded set, while one direction has unbounded norm. This is the normed linear obstruction used by the monodromy check, distinct from identifying the period-ring lattice itself. (KL Examples 8.5.17–8.5.18, pp. 174–175.)

**Checks.**

- The trivial `φ`-module with unit integral lattice is `(0,a)`-pure.
- The zero module is pure of every slope; it has no distinguished numeric slope.
- A rank-one action `φ^d=p^{−c}` with standard lattice is `(c,d)`-pure, detecting the sign of `p^c`.
- The perfected Tate-curve local system with p monodromy is locally étale but has no global integral étale model.
- For `a=1`, `R=F×F` with F a characteristic-p perfectoid field, and the rank-one module with `Φ(e)=(1,p⁻¹)e`, the two fibres are pure of slopes 0 and 1. The module is locally and pointwise pure, but no single `(c,d)`-pure model generates it over both components.

([KL][KL], §7.3, Definitions 7.3.1 and 7.3.4, Lemma 7.3.3 and Remarks 7.3.2, 7.3.5, 7.3.11, pp. 147–152.)

*Needs:* PadicHodgeTheory §7.5 for the p-typical relative interfaces; [Finite projective Frobenius modules and integral models](#finite-projective-frobenius-modules-and-integral-models); [Relative tilted Robba ring from curve annuli](#relative-tilted-robba-ring-from-curve-annuli); `Submodule`.

#### Pro-étale trivialization of pure models

If a `φ^a`-module M over `ℰ̃_R` (resp. `ℛ̃^bd_R`, `ℛ̃_R`) has a free `(c,d)`-pure model `M₀`, there is an R-algebra S, the completed direct limit of faithfully finite étale R-subalgebras, such that `M₀ ⊗ W(S)` (resp. `M₀ ⊗ ℛ̃^int_S`) has a basis fixed by `p^cφ^d`.

([KL][KL], §7.3, Proposition 7.3.6, p. 149.)

*Needs:* [Pure models and purity loci](#pure-models-and-purity-loci).

#### Openness and pointwise detection of purity

Take a `φ^a`-module M over `ℛ̃_R` with nonzero rank at every point, and `β` in its pure locus. For integers `c,d` with `d>0` divisible by a and `c/d=μ(M,β)`, a `(c,d)`-pure model of the fibre over `ℛ̃_{ℋ(β)}` spreads to a free pure model on a rational neighborhood of `β` with the same parameters. For arbitrary rank, this implies openness of both purity and étaleness on `ℳ(R)`, equivalence of pointwise and local purity (and of pointwise and local étaleness), and detection of purity at `β` by the existence of a local pure model without a local-freeness assumption.

([KL][KL], §7.3, Theorem 7.3.7 and Corollaries 7.3.8–7.3.10, pp. 150–151.)

*Needs:* PadicHodgeTheory §7.5 for the p-typical relative interfaces; [Annular basis approximation](#annular-basis-approximation); [Pure models and purity loci](#pure-models-and-purity-loci).

#### Diagonal Frobenius gauge normal form

For a `φ^a`-module over `ℛ̃^bd_R`, suppose its chosen Frobenius matrix is `AD`, with D diagonal, `D_ii∈p^ℤ`, and `A−I∈p Mat(ℛ̃^int_R)`. One can find an R-algebra S formed as a union of faithfully finite étale R-subalgebras and `U∈GL_n(W(S))`, `U≡I mod p`, satisfying `U⁻¹ADφ^a(U)=D`. Completion of this union is unnecessary. At every `β`, the generic slope multiset is `{−v_p(D_ii)/a}_i`.

([KL][KL], §7.4, Lemma 7.4.4, pp. 152–153.)

*Needs:* [Annular basis approximation](#annular-basis-approximation).

### Robba polygons and constant vertices

Use the same KL hypotheses as above. The lower convex Robba polygon is related to the upper geometric HN polygon by the convention stated earlier. The special/generic polygon input is over perfect analytic residue fields; it is supplied by RD.2 with that generality.

#### Robba slope-polygon semicontinuity

For any `φ^a`-module M over `ℛ̃_R`, `β ↦` the slope polygon of `M ⊗ ℛ̃_{ℋ(β)}` is lower semicontinuous on `ℳ(R)`: where the rank is constant, for each `x ∈ [0, rank M]` the y-coordinate of the polygon at x is a lower semicontinuous function of `β`, and it is locally constant at `x = rank M`.

([KL][KL], §7.4, Theorem 7.4.5, p. 153.)

*Needs:* [Annular basis approximation](#annular-basis-approximation); [Diagonal Frobenius gauge normal form](#diagonal-frobenius-gauge-normal-form); [Pure models and purity loci](#pure-models-and-purity-loci); PadicDifferentialEquationsAndRigidCohomology §RD.2.3; [Geometric classification of vector bundles](#geometric-classification-of-vector-bundles); [Exact tensor equivalence of Robba modules and curve bundles](#exact-tensor-equivalence-of-robba-modules-and-curve-bundles); [Base change of the geometric HN filtration](#base-change-of-the-geometric-hn-filtration).

#### Bounded polygons and dense constant loci

For any `φ^a`-module M over `ℛ̃_R`, the slope polygons of M at the points of `ℳ(R)` are bounded above and below (all slopes are at least `−N/a` for N as in Proposition 6.2.4, and the sum of the slopes is continuous). Hence the polygon takes finitely many values locally, and there is an open dense `U ⊆ ℳ(R)` on which it is locally constant.

([KL][KL], §7.4, Proposition 7.4.6 and Corollary 7.4.7, pp. 153–154.)

*Needs:* [Global generation and vanishing after positive twists](#global-generation-and-vanishing-after-positive-twists); [Robba slope-polygon semicontinuity](#robba-slope-polygon-semicontinuity).

#### Submodule at a constant polygon vertex

(7.4.8) Let A be an `n × n` matrix over `ℛ̃^int_R` invertible over `ℛ̃^bd_R`, `x₁, …, x_n ∈ ℛ̃^bd_R`, and `y₁, …, y_n ∈ ℰ̃_R` with `y_i − x_i = Σ_j A_{ij}φ^a(y_j)`. Then all `y_i` lie in `ℛ̃^bd_R` iff their images lie in `ℛ̃^bd_{ℋ(β)}` for every `β ∈ ℳ(R)`. (7.4.9) Let M over `ℛ̃_R` have constant rank n and slopes `μ₁(M,β) ≥ ⋯ ≥ μ_n(M,β)` at `β`. If for some `m ∈ {1, …, n−1}` and all `β` we have `μ_m(M,β) > μ_{m+1}(M,β)` and `μ₁ + ⋯ + μ_m` constant, there is a unique `φ^a`-submodule N of rank m with `M/N` a `φ^a`-module such that at every `β` the slopes of N are `μ₁, …, μ_m` and those of `M/N` are `μ_{m+1}, …, μ_n`.

([KL][KL], §7.4, Lemma 7.4.8 and Theorem 7.4.9, pp. 154–155.)

*Needs:* [Robba slope-polygon semicontinuity](#robba-slope-polygon-semicontinuity); [Pure models and purity loci](#pure-models-and-purity-loci); PadicDifferentialEquationsAndRigidCohomology §RD.2.4; [Diagonal Frobenius gauge normal form](#diagonal-frobenius-gauge-normal-form).

#### Robba filtration on a constant-polygon locus

If the slope polygon of a `φ^a`-module M over `ℛ̃_R` is constant on `ℳ(R)`, there is a unique filtration `0 = M₀ ⊂ ⋯ ⊂ M_l = M` by `φ^a-submodules` whose quotients are `φ^a`-modules pure of constant slope with `μ(M₁/M₀) > ⋯ > μ(M_l/M_{l−1})`.

([KL][KL], §7.4, Corollary 7.4.10, p. 155.)

*Needs:* [Submodule at a constant polygon vertex](#submodule-at-a-constant-polygon-vertex); [Openness and pointwise detection of purity](#openness-and-pointwise-detection-of-purity).

#### Pointwise detection of negative Frobenius cohomology

If M over `ℛ̃_R` has everywhere negative slopes, then `H⁰_{φ^a}(M) = 0`, `H⁰_{φ^a}(M ⊗ ℛ̃_{ℋ(β)}) = 0` for all `β ∈ ℳ(R)`, and `H¹_{φ^a}(M) → ∏_β H¹_{φ^a}(M ⊗ ℛ̃_{ℋ(β)})` is injective. For any M this applies to `M(n)` for n small enough (by Proposition 7.4.6); the injectivity also holds for n large, since then `H¹_{φ^a}(M(n)) = 0` by Proposition 6.2.2.

([KL][KL], §7.4, Corollary 7.4.11 and Remark 7.4.12, pp. 155–156.)

*Needs:* [Two-term Frobenius complex for curve cohomology](#two-term-frobenius-complex-for-curve-cohomology); [Robba filtration on a constant-polygon locus](#robba-filtration-on-a-constant-polygon-locus); [Submodule at a constant polygon vertex](#submodule-at-a-constant-polygon-vertex); [Exact tensor equivalence of Robba modules and curve bundles](#exact-tensor-equivalence-of-robba-modules-and-curve-bundles); [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles).

### Ring/sheaf comparisons and local purity

Use the same KL hypotheses. For the two-out-of-three theorem add KL Hypothesis 8.6.1. Global lattices, arbitrary bounded models, local models and pointwise purity remain separate notions. The Tate-curve p-monodromy example separates them. The stronger bounded-ring interpretation of the separate nodal example requires a patching argument and is not inferred just from the sheaf example.

#### Ring and sheaf Frobenius-module comparison

Let `(R,R⁺)` be a perfect uniform adic Banach algebra over `𝔽_p` and `X = Spa(R,R⁺)`. For `∗ ∈ {ℰ̃, ℛ̃^bd, ℛ̃}`, the natural functor from `φ^d`-modules over `∗_R` to `φ^d`-modules over the sheaf `∗_X` (called local `φ^d`-modules over `∗_R`) is fully faithful (Theorem 5.3.3). For `∗ = ℛ̃` it is an equivalence of categories (Corollary 6.3.13); for `∗ = ℰ̃` and `∗ = ℛ̃^bd` it is not (Example 8.5.17). A `φ^d`-module over `∗_R` is pure (resp. étale) if and only if the corresponding `φ^d`-module over `∗_X` is.

([KL][KL], §8.5, Remark 8.5.10, p. 172 (arXiv 1301.0792v5).)

*Needs:* PadicHodgeTheory §7.5 for the p-typical relative carriers and comparison maps; [Exact tensor equivalence of Robba modules and curve bundles](#exact-tensor-equivalence-of-robba-modules-and-curve-bundles); [Pure models and purity loci](#pure-models-and-purity-loci).

#### Adic pure and étale loci

For a `φ^d`-module M on `ℛ̃_X`, where X is perfect uniform over `𝔽_{p^d}`, purity and étaleness define open subspaces of X. If X lies over an analytic field, these opens are partially proper in the sense of KL Definition 8.2.11. When X is taut, both subspaces are taut as well, by Lemma 8.2.12. The loci concern the module M, rather than its coefficient sheaf.

([KL][KL], §8.5, Lemma 8.5.11, p. 173 (arXiv 1301.0792v5).)

*Needs:* PadicHodgeTheory §7.5 for the p-typical relative carriers and comparison maps; [Openness and pointwise detection of purity](#openness-and-pointwise-detection-of-purity).

#### Local purity without global pure models

KL constructs a rational local system with p-monodromy by identifying the two boundary circles of a punctured annulus over `K=𝔽_p((q))`, `|q|=ω<1`. Its affinoid algebra is `B=K{ω²/T,T,U/ω^{−2}}/(U(T−q)−1)`; the boundaries have algebras `B₁=K{ω²/T,T/ω²}` and `B₂=K{1/T,T}`. Substitution `T↦q²T` identifies `B₁` with `B₂`, in that direction, and gives an affinoid chart in the Tate curve of parameter `q²` over K. Identify one boundary generator with p times the other and pass to completed perfections `R,S,S₁,S₂` of `A,B,B₁,B₂`. The resulting `ℚ_p` local system cannot come from an étale module over `ℰ̃_R` or `ℛ̃^bd_R`: a putative invariant section would satisfy `x₂=pσ_q(x₁)`, hence belong to every `p^mW(S)` and vanish. It does come from an étale full Robba module and from étale `ℰ̃_X` and `ℛ̃^bd_X` sheaves on `X=Spa(R,R°)`. Thus sheaf descent does not imply descent to the bounded coefficient rings, and the full Robba module has no étale model. The separate nodal example 8.5.18 gives locally étale sheaves without a global étale lattice. A bounded-ring realization of the separate nodal example additionally requires a patching theorem; the sheaf example alone does not give that realization.

([KL][KL], §8.5, Examples 8.5.17–8.5.18, pp. 174–175 (arXiv 1301.0792v5).)

*Needs:* [Ring and sheaf Frobenius-module comparison](#ring-and-sheaf-frobenius-module-comparison); [Pure modules and twisted local systems](#pure-modules-and-twisted-local-systems).

#### Pure modules in short exact sequences

Under KL Hypothesis 8.6.1, `(c,d)`-purity has the two-out-of-three property for `0→M₁→M→M₂→0` in `φ`-modules over `ℛ̃_R`: purity of any pair among `M₁,M,M₂` forces purity of the remaining term.

([KL][KL], §8.6, Lemma 8.6.3, p. 176 (arXiv 1301.0792v5).)

*Needs:* [Pointwise purity over all three coefficient rings](#pointwise-purity-over-all-three-coefficient-rings).

### Twisted and integral local systems

Use the KL hypotheses for pure-module statements. Use the twisted local systems of PhiGammaModulesAndIwasawaCohomology §1.0b with arithmetic Frobenius and the unramified coefficient extension. Integral comparisons involve actual lattices; after taking isogenies they give globally pure models, while rational local systems may have no global integral lattice.

#### Integral Frobenius and local-system comparison

For a perfect uniform adic Banach pair over `𝔽_{p^d}`, étale `ℤ_{p^d}` local systems on `Spec(R)`, on its inverse-perfecting complete subring, and on the corresponding untilt agree with `φ^d`-modules over `W(R)` and the integral relative Robba ring; the ring functor is scalar extension. The equivalence globalizes to perfectoid X and its tilt/inverse perfection. Over an algebraically closed complete `C/ℚ_p`, `φ`-modules over the integral Robba ring and `W(C♭)` agree with finite free `ℤ_p` modules (SW12.3.4). Taking isogenies yields globally pure models, not all rational étale local systems.

KL Theorems 8.5.3–8.5.6, with integral finite projective modules. The absolute SW12.3.4 is restricted to `E=ℚ_p` and C algebraically closed.

([KL][KL], Theorems 8.5.3–8.5.6, pp. 169–171; [SW][SW], Theorem 12.3.4, book p. 104.)

*Needs:* PadicHodgeTheory §7.5 for the p-typical relative carriers and comparison maps; [Pro-étale trivialization of pure models](#pro-étale-trivialization-of-pure-models); PhiGammaModulesAndIwasawaCohomology §1.0b for twisted rational local systems; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.25–R07.2.28; PerfectoidSpaces P3.

#### Pure modules and twisted local systems

Fix `c∈ℤ` and a perfectoid space X over `ℚ_{p^d}`, with characteristic-p partner X′ over `𝔽_{p^d}`. Twisted étale `(c,d)-ℚ_p-local` systems on X, on X′, and on any adic `X₀′` with inverse perfection X′ give equivalent categories. Each is also equivalent to the category of `(c,d)`-pure `φ`-modules for any of the three coefficient sheaves `ℰ̃_{X′}`, `ℛ̃^bd_{X′}`, or `ℛ̃_{X′}`. These are sheaf-coefficient equivalences; they do not assert descent to the corresponding global coefficient rings.

**Checks.**

- At `(c,d)=(0,1)`, the supplier equation is `τ=1`, so the comparison takes ordinary `ℚ_p` local systems to slope-zero coefficient sheaves.
- For `(c,d)=(1,2)`, a cyclic rank-two example with `τ(e₀)=e₁` and `τ(e₁)=p⁻¹e₀` satisfies `pτ²=1`, and its pure-module slope is `1/2`. For `d=1` and `c≠0`, the identity on a nonzero line fails `p^cτ=1`.
- Reindexing `(1,2)` to `(2,4)` changes the equation to `p²τ⁴=(pτ²)²=1` and keeps the pure slope `2/4=1/2`; the coefficient fields are distinct. Conversely, descent uses the supplier equivalence, not a converse inference from squaring this equation.

([KL][KL], §8.5, Theorem 8.5.12, p. 173 (arXiv 1301.0792v5).)

*Needs:* PadicHodgeTheory §7.5 for the p-typical relative carriers and comparison maps; [Pure models and purity loci](#pure-models-and-purity-loci); [Pro-étale trivialization of pure models](#pro-étale-trivialization-of-pure-models); [Ring and sheaf Frobenius-module comparison](#ring-and-sheaf-frobenius-module-comparison); PhiGammaModulesAndIwasawaCohomology §1.0b for twisted rational local systems; [Integral Frobenius and local-system comparison](#integral-frobenius-and-local-system-comparison); `CategoryTheory.Equivalence`.

#### Independence of purity denominator

Let X be perfect uniform over `𝔽_{p^d}`, and use any of the coefficient sheaves `ℰ̃_X`, `ℛ̃^bd_X`, `ℛ̃_X` for a `φ^d`-module M. At a fixed point x, purity with slope s is independent of the presentation of s: it is equivalent to `(c′,d′)`-purity at x for all integers `c′,d′` satisfying `d′>0`, `d|d′`, and `c′/d′=s`.

([KL][KL], §8.5, Corollary 8.5.13, p. 173 (arXiv 1301.0792v5).)

*Needs:* [Pure modules and twisted local systems](#pure-modules-and-twisted-local-systems).

#### Pointwise purity over all three coefficient rings

Let `(R,R⁺)` be as in Hypothesis 5.0.1 (a perfect uniform adic Banach algebra over `𝔽_p` that is a Banach algebra over an analytic field) and M a `φ^d`-module over `ℰ̃_R`, `ℛ̃^bd_R` or `ℛ̃_R`. If M is pointwise pure (`M⊗_{∗_R}∗_{ℋ(β)}` is pure for every `β∈ℳ(R)`, using the same construction `∗∈{ℰ̃,ℛ̃^bd,ℛ̃}` on both sides), then M is pure (it admits a locally free local pure model at every `β ∈ ℳ(R)`).

**Checks.**

- The trivial module specializes to the trivial module over the corresponding residue-field period ring.
- For a field base, its unique Berkovich fibre recovers that field’s period module and its slopes.
- In mixed characteristic no unital map from a period ring with p invertible to the characteristic-p field `ℋ(β)` exists; tensoring directly with that field is not a fibre construction.

([KL][KL], §8.5, Corollary 8.5.14, p. 173 (arXiv 1301.0792v5).)

*Needs:* [Openness and pointwise detection of purity](#openness-and-pointwise-detection-of-purity); [Pure modules and twisted local systems](#pure-modules-and-twisted-local-systems).

#### Surjective descent and detection of purity

Consider a bounded map `(R,R⁺)→(S,S⁺)` between perfect uniform adic Banach `𝔽_{p^d}`-algebras, with surjective induced map of adic spectra. For a local `φ^d`-module M, purity is equivalent to purity after scalar extension from R to S, for each of `ℰ̃`, bounded Robba, and full Robba coefficients. For full Robba sheaves, KL Corollary 8.5.16 gives the analogous equivalence under any surjective map of perfectoid adic spaces.

([KL][KL], §8.5, Corollaries 8.5.15–8.5.16, p. 174 (arXiv 1301.0792v5).)

*Needs:* [Pointwise purity over all three coefficient rings](#pointwise-purity-over-all-three-coefficient-rings).

### Pointwise and relative ampleness

KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over `ℚ_p`, `q=p^a`. All targets in this subsection additionally use the KL perfect-uniform analytic-base hypotheses above. The KL pair/space comparisons are Theorems 3.6.5 and 8.3.5; thus these ampleness results do not automatically extend to every general-E curve.

#### Pointwise ampleness

In the setting of KL Hypothesis 8.7.1, take an integer `a≥1` and `q=p^a`, a perfectoid adic Banach pair `(A,A⁺)` over `ℚ_p` with associated perfect uniform characteristic-p pair `(R,R⁺)`, and a perfectoid space `X/ℚ_p` with its corresponding characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and 8.3.5. For F on `Proj(P_R)`, use the fibrewise HN polygon as its slope-polygon function on `ℳ(R)`; compose with the retraction for its interpretation on `Spa(R,R⁺)`. Via Theorem 6.3.12 and Remark 4.2.18, convert this upper geometric polygon to the lower Robba `φ^a`-polygon by `P_KL(x)=(deg_FS(F)−P_FS(n−x))/a`; every geometric threshold is divided by a. Strict positivity is unchanged by this conversion. Define the pointwise ample locus by strict positivity of every fibre slope. Theorem 7.4.5 makes this locus open. Call F pointwise ample when the locus is all of `ℳ(R)`.

**API.**

- Pointwise ampleness at `β` is the predicate that all slopes of the fibre polygon are strictly positive.
- The set of `β∈ℳ(R)` at which F is pointwise ample is open (KL Theorem 7.4.5), and so is its preimage in `Spa(R,R⁺)` under the retraction.
- The predicate is preserved under residue-field extension and perfectoid pullback.
- Tensor products of positive fibres are positive, with slopes added with their multiplicities.
- The predicate agrees for a Proj bundle and its full Robba module under the Robba–bundle equivalence.

**Checks.**

- `O(1)` is pointwise ample, with KL slope `1/a`. At `a=2`, the rank-one module `φ²(v)=p⁻¹v` gives FS degree 1 and KL slope `1/2`.
- On a nonempty base O is not pointwise ample: every rank-one fibre has slope zero.
- On the empty base, including the zero Banach ring, the every-fibre predicate holds vacuously for O.
- On a nonempty base `O(2)⊕O(−1)` has positive total degree but is not pointwise ample.
- The zero bundle satisfies the every-slope predicate vacuously; it has no positive rank or numerical slope.

([KL][KL], §8.8, Definition 8.8.10, pp. 182–183 (arXiv 1301.0792v5).)

*Needs:* [Rank-normalized Harder–Narasimhan polygon](#rank-normalized-hardernarasimhan-polygon); [Tensor global ampleness and rational-local ampleness](#tensor-global-ampleness-and-rational-local-ampleness); [Robba slope-polygon semicontinuity](#robba-slope-polygon-semicontinuity).

#### Positive tensor powers dominate a bundle

In the setting of KL Hypothesis 8.7.1, take an integer `a≥1` and `q=p^a`, a perfectoid adic Banach pair `(A,A⁺)` over `ℚ_p` with associated perfect uniform characteristic-p pair `(R,R⁺)`, and a perfectoid space `X/ℚ_p` with its corresponding characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and 8.3.5. Suppose F on `Proj(P_R)` is pointwise ample and G is any bundle there. Tensor powers of F eventually dominate G: some integer `n₀` has `F^{⊗n}⊗G` pointwise ample for every `n≥n₀`.

([KL][KL], §8.8, Lemma 8.8.11 and its proof, p. 183 (arXiv 1301.0792v5).)

*Needs:* [Bounded polygons and dense constant loci](#bounded-polygons-and-dense-constant-loci); [Pointwise ampleness](#pointwise-ampleness).

#### Positive bundles on the geometric Proj curve

In the setting of KL Hypothesis 8.7.1, take an integer `a≥1` and `q=p^a`, a perfectoid adic Banach pair `(A,A⁺)` over `ℚ_p` with associated perfect uniform characteristic-p pair `(R,R⁺)`, and a perfectoid space `X/ℚ_p` with its corresponding characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and 8.3.5. If `R=L` is an analytic field and F on `Proj(P_L)` is ample, then `H¹(Proj(P_L),F)=0` and the evaluation map from its global sections generates F. Both claims use the analytic-field hypothesis of KL Lemma 8.8.12.

([KL][KL], §8.8, Lemma 8.8.12(a)–(b) and its proof, p. 183 (arXiv 1301.0792v5).)

*Needs:* [Slope-sensitive cohomology of standard bundles](#slope-sensitive-cohomology-of-standard-bundles); [GAGA for the relative schematic curve](#gaga-for-the-relative-schematic-curve); [Pointwise ampleness](#pointwise-ampleness); [Tensor global ampleness and rational-local ampleness](#tensor-global-ampleness-and-rational-local-ampleness); [Positive twists of globally étale bundles](#positive-twists-of-globally-étale-bundles); [Global generation and vanishing after positive twists](#global-generation-and-vanishing-after-positive-twists); [Geometric classification of vector bundles](#geometric-classification-of-vector-bundles).

#### Nonnegative extension by a negative twist

In the setting of KL Hypothesis 8.7.1, take an integer `a≥1` and `q=p^a`, a perfectoid adic Banach pair `(A,A⁺)` over `ℚ_p` with associated perfect uniform characteristic-p pair `(R,R⁺)`, and a perfectoid space `X/ℚ_p` with its corresponding characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and 8.3.5. Suppose that at a chosen `β∈ℳ(R)`, the slopes of F on `Proj(P_R)` are nonnegative and at least one is positive. F admits a vector-bundle extension `0→O(−1)→G→F→0` for which every slope of G at `β` remains nonnegative.

([KL][KL], §8.8, Lemma 8.8.13 and its proof, pp. 183–185 (arXiv 1301.0792v5).)

*Needs:* [Robba slope-polygon semicontinuity](#robba-slope-polygon-semicontinuity); [Positive bundles on the geometric Proj curve](#positive-bundles-on-the-geometric-proj-curve).

#### Resolution by an étale-at-a-point bundle

In the setting of KL Hypothesis 8.7.1, take an integer `a≥1` and `q=p^a`, a perfectoid adic Banach pair `(A,A⁺)` over `ℚ_p` with associated perfect uniform characteristic-p pair `(R,R⁺)`, and a perfectoid space `X/ℚ_p` with its corresponding characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and 8.3.5. When the slopes of F on `Proj(P_R)` at a chosen `β∈ℳ(R)` are nonnegative, there are bundles `H,G` and an exact sequence `0→H→G→F→0` with G étale at `β`.

([KL][KL], §8.8, Corollary 8.8.14, p. 185 (arXiv 1301.0792v5).)

*Needs:* [Nonnegative extension by a negative twist](#nonnegative-extension-by-a-negative-twist); [Openness and pointwise detection of purity](#openness-and-pointwise-detection-of-purity).

#### Ampleness and positive fibre slopes

Under Hypothesis 8.7.1 (`a ≥ 1` an integer, `q = p^a`; `(A,A⁺)` a perfectoid adic Banach algebra over `ℚ_p` and `(R,R⁺)` the perfect uniform adic Banach algebra over `𝔽_p` corresponding to it by Theorem 3.6.5; X a perfectoid adic space over `ℚ_p` and X′ the perfect uniform adic space over `𝔽_p` corresponding to it by Theorem 8.3.5), a vector bundle F on `Proj(P_R)` is ample if and only if it is pointwise ample (all its slopes at every `β ∈ ℳ(R)` are positive).

([KL][KL], §8.8, Theorem 8.8.15 and Remark 8.8.16, p. 185 (arXiv 1301.0792v5).)

*Needs:* [Tensor global ampleness and rational-local ampleness](#tensor-global-ampleness-and-rational-local-ampleness); [Positive tensor powers dominate a bundle](#positive-tensor-powers-dominate-a-bundle); [Resolution by an étale-at-a-point bundle](#resolution-by-an-étale-at-a-point-bundle); [Pointwise ampleness](#pointwise-ampleness); [Positive twists of globally étale bundles](#positive-twists-of-globally-étale-bundles); [Power criterion for tensor global ampleness](#power-criterion-for-tensor-global-ampleness); [Openness and pointwise detection of purity](#openness-and-pointwise-detection-of-purity).

#### Ampleness on the relative curve

In the setting of KL Hypothesis 8.7.1, take an integer `a≥1` and `q=p^a`, a perfectoid adic Banach pair `(A,A⁺)` over `ℚ_p` with associated perfect uniform characteristic-p pair `(R,R⁺)`, and a perfectoid space `X/ℚ_p` with its corresponding characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and 8.3.5. For a bundle F on `FF_X`, define ampleness by testing every affinoid map `f:Spa(A,A⁺)→X`: under the comparison of Theorem 8.7.7, the pullback bundle on `FF_R` must yield an ample bundle on `Proj(P_R)`. This is equivalent to positivity of all slopes at every point of X. In particular, on an affinoid base the Proj and analytic-curve notions agree. Ampleness descends under surjective maps of perfectoid bases and is local on the base. Its locus is open, including on the real quotient: an ample fibre over `ℋ(x)` extends over a partially proper open neighborhood of x.

**API.**

- A bundle on `FF_X` is ample if all perfectoid affinoid pullbacks are ample in the already owned Proj sense.
- Relative ampleness is equivalent to every geometric fibre slope being strictly positive.
- Perfectoid pullback preserves ampleness.
- A bundle is ample iff its pullback along a surjective perfectoid map is ample.
- The ample locus is a partially proper open subset on a base over an analytic field.

**Checks.**

- On an affinoid perfectoid untilt, relative ampleness agrees with the Proj ampleness of Layer 3.
- The untilt divisor line `L_X` is relatively ample; in KL normalization its slope is `1/a`.
- The unit bundle is not relatively ample on a nonempty base.

([KL][KL], §8.8, Definition 8.8.17, pp. 185–186 (arXiv 1301.0792v5).)

*Needs:* [Relative analytic quotient](#relative-period-domain-and-analytic-quotient); [Tensor global ampleness and rational-local ampleness](#tensor-global-ampleness-and-rational-local-ampleness); [Ampleness and positive fibre slopes](#ampleness-and-positive-fibre-slopes).

#### The positive line of an untilt

Under Hypothesis 8.7.1 (`a ≥ 1` an integer, `q = p^a`; `(A,A⁺)` a perfectoid adic Banach algebra over `ℚ_p` and `(R,R⁺)` the perfect uniform adic Banach algebra over `𝔽_p` corresponding to it by Theorem 3.6.5; X a perfectoid adic space over `ℚ_p` and X′ the perfect uniform adic space over `𝔽_p` corresponding to it by Theorem 8.3.5) with `X = Spa(A,A⁺)`, let `D_X` be the corresponding untilt Cartier divisor and define `L_X=O(D_X)` with its canonical section, as in KL Definition 8.8.18 and the [marked untilt Cartier construction](#marked-untilt-cartier-divisors-and-cartier-descent). Choose `z∈W(R⁺)` primitive of degree one generating `ker(θ:W(R⁺)→A⁺)`, as in KL Remark 8.7.2, and write `z=[z̄]+pz₁`; then `z₁` is a unit. Let M be the `φ^a`-module over `ℛ̃_R` free on one generator v with `φ^a(v) = z₁⁻¹ z v`; it is globally étale. The convergent product `u = ∏_{n≥0} φ^{an}(1 + p⁻¹ z₁⁻¹[z̄]) ∈ ℛ̃⁺_R` satisfies `φ^a(u) = p z₁ z⁻¹ u` in `ℛ̃_R`, so `uv` defines an inclusion `ℛ̃_R → M(1)` of `φ^a`-modules, and `M(1)` is the `φ^a`-module corresponding to `L_X`. Hence the `φ^a`-module corresponding to `L_X` is globally pure of slope `1/a`, i.e. globally `(1,a)`-pure (with the `φ^a-normalized` slope rather than the printed unnormalized slope 1).

**Checks.**

- The canonical section of `L_X` cuts out `D_X`; changing the primitive generator by a unit preserves the divisor and line bundle.
- On a nonempty geometric base, `z=p` has `z̄=0` and `z₁=1` but does not generate the untilt theta kernel. Its displayed module has slope `−1/a` and `M(1)` is trivial, so the decomposition alone does not give the untilt line.
- For `a=2`, the untilt line has integer Picard degree one and KL slope `1/2`; the globally étale module M has slope zero before the twist.

([KL][KL], Remark 8.7.2, p. 177; §8.8, Definition 8.8.18 and Lemma 8.8.19 with its proof, p. 186 (arXiv 1301.0792v5).)

*Needs:* [Closed Cartier norm criterion](#marked-untilt-cartier-divisors-and-cartier-descent); [Pure models and purity loci](#pure-models-and-purity-loci); [Ampleness on the relative curve](#ampleness-on-the-relative-curve).

### The integral boundary and group torsors

Fix an affinoid characteristic-p perfectoid `S=Spa(R,R⁺)`, a pseudouniformizer `ϖ` and `r>0`. Keep the characteristic-p boundary in `Y_[0,r](S)`, and use the SW inverse-Frobenius pullback convention. The group theorem needs a smooth affine `ℤ_p-model` with connected fibres and the integral tensor-functor dictionary.

#### Integral boundary realization

For `S∈Perf`, finite free `ℤ_p` local systems on `S_proét` are equivalent to `φ⁻¹`-modules on `Y_[0,r](S)`, including the characteristic-p boundary. Restriction to `Y_(0,r]` realizes the rationalized local system `L[1/p]`, which has all Newton slopes zero. This distinguishes integral lattices at the boundary from a slope-zero bundle on the open curve.

Use an affinoid characteristic-p perfectoid base `S=Spa(R,R⁺)`. Choose and fix a pseudouniformizer `ϖ∈R` for the construction of the SW space `Y_[0,r](S)`. `r>0`; the integral period space and `φ⁻¹` pullback conventions are those of SW Lecture 22. Finite rank is locally constant; no boundary deletion in the integral comparison.

([SW][SW], Proposition 22.3.2, book p. 209.)

*Needs:* [Integral Frobenius and local-system comparison](#integral-frobenius-and-local-system-comparison); [Slope-zero bundles and E-local systems](#slope-zero-bundles-and-e-local-systems); [Integral period domain](#integral-period-domain); DiamondsAndVStacks D3 / locally-profinite-torsors.

#### Integral group torsors and Frobenius

For a smooth affine group scheme `G/ℤ_p` with connected fibres, pro-étale `G(ℤ_p)-torsors` on S are equivalent to `φ⁻¹-G-torsors` on `Y_[0,r](S)`. For `G=GL_n` this is the integral local-system equivalence. Connectedness of fibres and the integral boundary are retained; extensions requiring a parahoric model are not inferred from this theorem.

Use an affinoid characteristic-p perfectoid base `S=Spa(R,R⁺)`. Choose and fix a pseudouniformizer `ϖ∈R` for the construction of the SW space `Y_[0,r](S)`. S perfectoid; `r>0`; smooth affine integral model with connected fibres.

For the reduction from G to `GL_n`, construct the exact tensor category `Rep_{ℤ_p}(G)` of algebraic representations on finite free `ℤ_p`-modules. Prove that G-torsors on a `ℤ_p-scheme` are equivalent to exact tensor functors from this category to vector bundles; for a smooth G over an analytic sousperfectoid `ℤ_p-space`, prove the corresponding étale equivalence. The reconstruction extends the functor to the coordinate Hopf algebra by filtered colimits and recovers the torsor from its faithfully flat algebra. Apply this to the integral local-system equivalence, then use connected fibres and Lang's lemma to identify the fibre functor pro-étale locally with the forgetful functor. These are ingredients of the integral torsor target, rather than consequences of the field-valued dictionary.

([SW][SW], Proposition 22.6.1, book p. 213; Theorems 19.5.1–19.5.2, book pp. 178–180.)

*Needs:* [Integral boundary realization](#integral-boundary-realization); ReductiveGroups / layer 1 representations  comodules; ReductiveGroupsPartII §RG2.3.1 for smooth affine integral models and ReductiveGroupsPartII §RG2.3.7 for Lang's theorem; [Integral period domain](#integral-period-domain); DiamondsAndVStacks D3 / locally-profinite-torsors.

### Examples

The trivial bundle has slope zero and a global integral étale model. Local purity on a perfected Tate curve need not give a global pure lattice. A scalar of nonunit norm cannot preserve a bounded spanning lattice; its forward or backward iterates contradict boundedness. An untilt line has positive normalized slope `1/a`, retaining the Frobenius-exponent denominator.

### Dependencies

*Needs:* Layers 0–5, with the construction order above; PadicDifferentialEquationsAndRigidCohomology §§RD.2.3–RD.2.4; DiamondsAndVStacks D3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.25–R07.2.28; ReductiveGroups Layers 0–1; ReductiveGroupsPartII §§RG2.3.1 and RG2.3.7.

## Downstream consumers

The bundle classification, relative HN filtration, integral boundary comparisons and Banach–Colmez geometry supply vector-bundle and local-system foundations for `Bun_G`, local shtukas, period maps and geometric Langlands. The tensor isocrystal category supplies the underlying objects of filtered `G`-isocrystals in [GLX][GLX], §5.1, pp. 31–32. The sympathetic category and curvature results supply VectorBundlesAndIsocrystalsPartII's period-valued functor and rank/height theorem. Divisor and Weil-map constructions consume the degree-one section quotient and the finite étale curve-algebra theorem, with their arithmetic input from ClassFieldTheory.

## References

All statements above are mathematical targets expressed in the conventions of this roadmap. Source references identify the result being used or the argument supporting it; a derived generalization still requires the additional prerequisites stated with the target. Page numbers refer to the editions below, not to a publisher version with different pagination.

- **FS** — Laurent Fargues; Peter Scholze, [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). Author-hosted 356-page PDF; printed page equals PDF page.
- **FF** — Laurent Fargues; Jean-Marc Fontaine; preface Pierre Colmez, [Courbes et fibrés vectoriels en théorie de Hodge p-adique](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf). Author-hosted 404-page version of Astérisque 406 (2018). Main-text pagination restarts after the preface; citations use printed main-text pages.
- **KL** — Kiran S. Kedlaya; Ruochuan Liu, [Relative p-adic Hodge theory: Foundations](https://arxiv.org/pdf/1301.0792v5). arXiv:1301.0792v5, 210 PDF pages; locators use the printed preprint pagination.
- **CS** — Ana Caraiani; Peter Scholze, [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Publisher PDF, Annals of Mathematics 186 (2017), pp. 649–766; citations use printed pages.
- **CN (arXiv)** — Pierre Colmez; Wiesława Nizioł, [On the cohomology of p-adic analytic spaces, II: the C_st-conjecture](https://arxiv.org/pdf/2108.12785v4). arXiv:2108.12785v4, 25 November 2024; used for the coherent-sheaf citation.
- **SW** — Peter Scholze; Jared Weinstein, [Berkeley Lectures on p-adic Geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf). Author-hosted 260-page PDF; PDF page `=` printed page `+` 10 (Theorem 13.5.7 printed p. 114 is PDF p. 124).
- **Ked** — Kiran S. Kedlaya, [Slope filtrations revisited](https://ems.press/content/serial-article-files/25974). Documenta Mathematica 10 (2005), 447–525; citations use journal pagination.
- **Lurie** — Jacob Lurie, [Lecture 26: Isocrystals](https://www.math.ias.edu/~lurie/205notes/Lecture26-Isocrystals.pdf). Three-page lecture note; statement source, not a full proof of Dieudonné–Manin.
- **GLX** — Ian Gleason; Dong Gyu Lim; Yujie Xu, [The connected components of affine Deligne–Lusztig varieties](https://arxiv.org/pdf/2208.07195v3). arXiv:2208.07195v3, 10 November 2025, 56 pages.
- **CN (author copy)** — Colmez and Nizioł, [On the cohomology of p-adic analytic spaces, II: the C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf). Public author preprint CN5.pdf; used for the sympathetic-algebra and curvature targets. These locators refer to this author copy.
- **CDN** — Colmez, Dospinescu and Nizioł, [Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf). Author preprint GPW5.pdf; its pagination differs from the published paper.
- **SW13** — Scholze and Weinstein, [Moduli of p-divisible groups](https://arxiv.org/pdf/1211.6357v2). arXiv:1211.6357v2; Theorem A is used only with its full-faithfulness hypotheses.

[FF]: https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf
[Ked]: https://ems.press/content/serial-article-files/25974
[Lurie]: https://www.math.ias.edu/~lurie/205notes/Lecture26-Isocrystals.pdf
[GLX]: https://arxiv.org/pdf/2208.07195v3
[SW]: https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf
[FS]: https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf
[CS]: https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf
[KL]: https://arxiv.org/pdf/1301.0792v5
[CN-arXiv]: https://arxiv.org/pdf/2108.12785v4
[SW13]: https://arxiv.org/pdf/1211.6357v2
[CN-author]: https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf
[CDN]: https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf
