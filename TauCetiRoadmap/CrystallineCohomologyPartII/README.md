# Roadmap: crystalline cohomology, de Rham–Witt complexes and logarithmic structures, Part II: Witt vector cohomology of singular varieties

**Summary.** Witt vector cohomology H^\*(X, WO_X) ⊗ ℚ of a smooth proper variety in characteristic p is the slope \< 1 part of its crystalline cohomology. Serre introduced it in 1958 as a candidate for a Weil cohomology; it fails to be one, but for singular varieties it keeps a striking topological content. Berthelot, Bloch and Esnault proved that, with compact supports, it computes the slope \< 1 part of rigid cohomology for every separated scheme of finite type over a perfect field, so that over a finite field it computes the slope \< 1 factor of the zeta function. Consequences are congruences modulo q for numbers of rational points: Ax–Katz modulo q, Serre's congruence between theta divisors, and — with the Witt-rational singularities of Chatzistamatiou and Rülling and the correspondence calculus behind them — Esnault's theorem that rationally chain connected varieties have a number of points congruent to 1 modulo q, in the singular form used by Gongyo–Nakamura–Tanaka for klt threefolds, whose WO-rationality input Hacon and Witaszek extend to Q-factorial klt fourfolds admitting a log resolution. Bhatt and Scholze showed that Frobenius-inverted Witt vector cohomology is even an h-sheaf.

This roadmap builds that theory: Witt vector sheaves and their rational and Frobenius-inverted cohomology (Layer 0), h-descent (Layer 1), compact supports (Layer 2), the comparison with rigid cohomology (Layer 3), Hodge–Witt cohomology with supports and the action of correspondences (Layer 4), Witt-rational singularities (Layer 5), and the point-count theorems (Layer 6).

## Scope and ownership

This roadmap is a Part II of Crystalline cohomology, de Rham–Witt complexes and logarithmic structures (`CrystallineCohomology`) and starts where it stops. The parent owns the de Rham–Witt complex of smooth schemes and its comparison with crystalline cohomology, and its Scope and ownership (“Not here”) names Witt cohomology under h-covers and rational Witt cohomology of singular schemes as the subject of this Part II. These are what it builds: Witt vector cohomology of singular and nonproper varieties uses only the degree-zero part W_rO of the de Rham–Witt complex, the slope spectral sequence of smooth proper schemes, and, in Layer 4, the full de Rham–Witt complex of smooth schemes for pushforwards and cycle classes.

Convergent-coefficient descent and Cartier transforms of periodic connections, which the same sentence of the parent lists beside them, are not part of this roadmap.

CrystallineCohomology §CR.4.6 owns Witt schemes for all schemes on which p is locally nilpotent, their affine description, functoriality and perfect-scheme comparison (its target *Witt schemes on locally p-nilpotent schemes*) and the affine Witt ideals W_r(I) = ker(W_r(A) → W_r(A/I)) (its target *Witt differential quotients and completion topologies*). Layer 0 constructs the ideal sheaves on those schemes, transfers morphism properties, compares higher direct images and proves the derived inverse-limit formula. CrystallineCohomology §CR.3:duality.1 owns the smooth Ekedahl top-form trace (its target *Proper smooth crystalline trace*); Layer 4 uses it for the singular canonical system and full product self-duality. CrystallineCohomology §CR.4.7 owns the canonical slope decomposition E = ⊕_λ E_λ of an isocrystal over a perfect field (its target *Slope decomposition on the existing isocrystal carrier*), and §CR.4.4 owns the Cartier–Dieudonné–Dwork map s_φ: A → W(A) of a p-torsion-free ring with a Frobenius lift (its target *Witt lifting from a torsion-free Frobenius lift*); Layer 3 adds the slope cutoffs and characteristic-polynomial factors of the former and the divided-power-envelope and tube application of the latter. MotivesAndAlgebraicCycles §0.6 owns integral fixed-support decomposition of the diagonal; Layer 5 retains its rational-coefficient extension. MotivesAndAlgebraicCycles §2.2 owns continuity of Chow groups over algebraic extensions and the torsion kernel of base change to an algebraic closure for smooth projective schemes; §6.10 keeps the zero-cycle case for every proper scheme, which is the generality of `UniversallyCH0Trivial`.

Rigid cohomology belongs to PadicDifferentialEquationsAndRigidCohomology. Scheme foundations, enhanced descent, Chow operations and abelian Riemann–Roch are imported through the contracts below. In particular EnhancedDerivedSheaves owns the derived fibre products of qcqs F_p-schemes and their iterates, with quasi-coherent pushforward and derived base change (§E2.8, `derivedSchemeBaseChange`), and the simplicial Witt vectors of a simplicial commutative F_p-algebra R, including the equivalence W(R)[1/F] ≅ W(π_0R)[1/F] and the annihilation by p of the fibre of W(R) → W(π_0R) (§E5:animation.2, `simplicialWitt` and `wittFrobeniusLocalization`); §1.2 only assembles them into the sheaf-cohomology comparison on derived fibre products, and §1.4 applies the base change. Serre’s Witt Bockstein vanishing and the perfect-field quotient-alteration variant are targets here, where their Witt and quasi-resolution consumers live.

Already in the library: Mathlib has Witt vectors with their Frobenius, Verschiebung and Teichmüller maps (`WittVector`, `TruncatedWittVector`), Serre quotients of abelian categories (`CategoryTheory.ObjectProperty.SerreClassLocalization.abelian`), isocrystals over perfect fields without the slope decomposition (`WittVector.Isocrystal`), and the Chevalley–Warning theorem `char_dvd_card_solutions_of_sum_lt`, which gives divisibility of the number of common zeros by the characteristic p. Tau Ceti has sheaf cohomology `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` of sheaves of modules on a scheme, functorial in the coefficient sheaf and with pullback along morphisms of schemes (`AlgebraicGeometry.Scheme.Hom.cohomologyPullback`), its module structure over the base ring of a scheme over a ring, abelian varieties (`TauCeti.AlgebraicGeometry.AbelianVariety`), ample line-bundle classes, the invertible ideal sheaf of an effective Cartier divisor and its dual, projectivity over a ring, universal homeomorphisms (`TauCeti.AlgebraicGeometry.IsUniversalHomeomorphism`), and zero-cycles modulo rational equivalence on locally Noetherian schemes (`TauCeti.AlgebraicGeometry.Chow.RatEquiv`); Mathlib has residue degrees of morphisms and geometric connectedness. This roadmap owns the strengthening of Chevalley–Warning from p to q (§6.6), the point-count congruences from structure-sheaf cohomology (§6.4 (ii) and (iv)), Serre's congruence for theta divisors (§6.9) and Esnault's point count for universally CH_0-trivial varieties (§6.14 (i)); its acceptance test states these on the carriers above.

## Conventions

1. p is a prime; k is a perfect field of characteristic p; W = W(k); K = W[1/p]; σ is the Frobenius of W and K. Over F_q, q = p^a, φ = F^a is the K-linear q-Frobenius.
2. Witt vectors are p-typical (Mathlib's `WittVector p`, `TruncatedWittVector p n`). R, F, V denote restriction, Frobenius and Verschiebung; FV = VF = p, and V(x·F(y)) = V(x)·y.
3. Witt sheaves: W_nO_X, WO_X = lim W_nO_X, and for an ideal I, W_nI = ker(W_nO_X → W_n(O_X/I)), WI = lim W_nI. Cohomology is sheaf cohomology of abelian groups on |X|; W_nO_X is not an O_X-module for n ≥ 2.
4. Two rationalizations, never confused. Tensor convention: WI_K = WI ⊗ ℚ, used for K-coefficients and compact supports. Isogeny convention: WI_ℚ is the image of WI in the Serre localization of sheaves of abelian groups at bounded-torsion sheaves; R^if_\*(WI_ℚ) = 0 means that a single power of p kills R^if_\*(WI). For proper schemes the two conventions give the same vanishing of cohomology (§0.8).
5. Frobenius-inverted Witt cohomology RΓ(X, WO_X)[1/F] is the colimit along F; inverting p afterwards gives RΓ(X, WO_X)[1/p].
6. Slopes of F are normalized by v_p(p) = 1; over F_q, slopes of φ by v_q(q) = 1, and the two agree. `E^{<ρ}` = `⊕_{λ<ρ}` E_λ; `P^{<ρ}` is the product of the Newton-polygon factors of slope \< ρ.
7. 'Connected fibres' means connected after every base change to a field-valued point. A universal homeomorphism is Tau Ceti's `TauCeti.AlgebraicGeometry.IsUniversalHomeomorphism` (every base change is a homeomorphism), equivalently integral, surjective and radicial; a finite universal homeomorphism is one that is moreover finite, which is automatic for morphisms locally of finite type.
8. A quasi-resolution of an integral scheme Y is a projective, surjective, generically finite morphism with purely inseparable function-field extension from an integral topological finite quotient (§5.2).
9. CH_0-triviality is with rational coefficients: deg: CH_0(X_L) ⊗ ℚ → ℚ is an isomorphism for every field extension L.
10. In Layer 4 and Layer 5, finite-type k-schemes, including bases and auxiliary schemes, are quasi-projective over k, as in CR12 §§2–4; a generic fibre or scalar extension is quasi-projective over its own ground field.
11. Point counts: for a scheme X over a finite field K, X(K) is the set of sections of the structure morphism X → Spec K. A point of projective space ℙⁿ(K) is tested against homogeneous equations on any representative in `K^{n+1}` ∖ {0}.
12. Names in backticks without a namespace and not attributed to a supplier are the declarations of [Suggested.lean](Suggested.lean), in the namespace `TauCetiRoadmap.CrystallineCohomologyPartII`.

**Checks.**

- At p = 2, W_2(F₂) = ℤ/4: F(V(1)) = V(F(1)) = 2, whereas [1] = 1; the operator conventions retain p and distinguish V from Teichmüller.
- Over F₄, on E = K ⊕ K with F = (σ, 2σ), φ = F² = (1, 4), so v₄(1) = 0 and v₄(4) = 1; `E^{<1}` is the first summand. This pins both Frobenius normalizations and the strict inequality.
- For P¹/F_q, degrees 0 and 2 give ζ(P¹,t) = (1−t)⁻¹(1−qt)⁻¹, while ζ^W(P¹,t) = (1−t)⁻¹. Both even degrees use exponent −1 in the alternating determinant convention.
- On a point, `⊕_{n≥1}` ℤ/p^n has tensor rationalization 0 but nonzero isogeny image; a uniform exponent is essential.
- For x² − ay² on ℙ¹ over F_q (q odd, a a nonsquare) the only zero in F_q² is the zero vector, which is not a point of ℙ¹, so the projective zero set has 0 points, while the affine zero set has 1 element. Projective counts exclude the zero vector, and the two counts are related by |affine zeros| = 1 + (q − 1)·|projective zeros| for homogeneous equations of positive degree.

## Exact supplier contracts

### From Mathlib

At the pinned Mathlib: `WittVector`, `TruncatedWittVector`, `WittVector.frobenius`, `WittVector.verschiebung`, `WittVector.teichmuller`; the three identities `WittVector.frobenius_verschiebung`, `WittVector.verschiebung_mul_frobenius`, `WittVector.verschiebung_frobenius` (the last assumes `CharP R p`) in `Mathlib/RingTheory/WittVector/Identities.lean`, lines 43, 102, 141; `WittVector.map_surjective` in `Mathlib/RingTheory/WittVector/Basic.lean`, line 263; and `WittVector.frobeniusEquiv` (perfect coefficients) in `Mathlib/RingTheory/WittVector/Frobenius.lean`, line 283. The scheme and morphism classes (`AlgebraicGeometry.Scheme`, `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.IsFinite`, `AlgebraicGeometry.IsSeparated`, `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.Surjective`), `AlgebraicGeometry.Scheme.Hom.appTop`, `SheafOfModules.unit` (the structure sheaf as a module over itself), `DerivedCategory`, `LinearMap.charpoly` and `PowerSeries.exp` are native inputs. `WittVector.Isocrystal` requires a perfect ring of characteristic p (no domain hypothesis) and supplies a semilinear automorphism, without finite dimensionality; finite dimensionality is imposed in Layer 3. For Serre localization use `CategoryTheory.ObjectProperty.IsSerreClass`, `CategoryTheory.ObjectProperty.SerreClassLocalization.abelian` and `CategoryTheory.ObjectProperty.SerreClassLocalization.isZero_obj_iff`, with the additive localization functor and its localization instance as required in `Mathlib/CategoryTheory/Abelian/SerreClass/Localization.lean`. For point counts: `Projectivization` and its representative map `Projectivization.rep`, `MvPolynomial.IsHomogeneous`, `MvPolynomial.totalDegree`, `MvPolynomial.eval`, and the Chevalley–Warning theorem `char_dvd_card_solutions_of_sum_lt` in `Mathlib/FieldTheory/ChevalleyWarning.lean`, line 110 (finite field K of characteristic p, finitely many variables, ∑ totalDegree < number of variables; conclusion p divides the number of common zeros). For the point-count statements of §§6.4, 6.9, 6.10 and 6.14: `AlgebraicGeometry.Scheme.Hom.residueDegree` in `Mathlib/AlgebraicGeometry/ResidueField.lean` (the degree of κ(x) over κ(f(x)), with value 0 when that degree is infinite), `AlgebraicGeometry.GeometricallyConnected` in `Mathlib/AlgebraicGeometry/Geometrically/Connected.lean` (the fibre over every field-valued point is a connected space, hence nonempty), `AlgebraicGeometry.LocallyOfFiniteType.isLocallyNoetherian` in `Mathlib/AlgebraicGeometry/Noetherian.lean`, `AlgebraicGeometry.Scheme.IdealSheafData.subscheme` and `AlgebraicGeometry.Scheme.Over`.

### From Tau Ceti

At the pinned Tau Ceti: `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` in `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean`, the group H^i(X, M) of a sheaf of modules M on a scheme X, defined as Mathlib's `CategoryTheory.Sheaf.H` (an Ext group from the constant sheaf ℤ) of the underlying abelian sheaf on the Zariski site; it is functorial in M. It is the sheaf cohomology of abelian groups of Conventions item 3, applied to the structure sheaf `SheafOfModules.unit` (the monoidal unit of the modules of X), and is the cohomology H^i(X, O_X) of §6.4. `AlgebraicGeometry.Scheme.Hom.cohomologyPullback` in `TauCeti/AlgebraicGeometry/Cohomology/Pullback.lean`, the pullback H^n(X, M) → H^n(Y, g^\*M) along a morphism of schemes g: Y → X, and `AlgebraicGeometry.Scheme.Modules.pullbackObjUnitIso` in `TauCeti/AlgebraicGeometry/Modules/Pullback/Basic.lean`, the canonical isomorphism g^\*O_X ≅ O_Y; their composite is the pullback H^i(Y, O_Y) → H^i(X, O_X) of §6.4 (ii). `AlgebraicGeometry.Scheme.Modules.cohomologyBaseModule` in `TauCeti/AlgebraicGeometry/Cohomology/Module/Base.lean`, the R-module structure on H^i(X, M) for X over Spec R, through which h^0 in §6.9 is `Module.finrank`. `TauCeti.AlgebraicGeometry.bijective_cohomologyBaseChange` in `TauCeti/AlgebraicGeometry/Cohomology/FlatBaseChange.lean`, line 185 (flat base change: for a flat ring map R → R′, X over Spec R quasi-compact with affine diagonal and M quasi-coherent, `R′ ⊗_R H^n(X, M) → H^n(X_{R′}, g^*M)` is bijective for every n), used in §6.4 (iv) for a finite field extension, a proper scheme over a field being quasi-compact and separated. `TauCeti.AlgebraicGeometry.AbelianVariety` in `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean`, a proper geometrically integral group scheme over Spec K, with underlying scheme `AbelianVariety.toScheme` and structure morphism the `hom` of `AbelianVariety.toOver`; `AlgebraicGeometry.Scheme.IdealSheafData.IsEffectiveCartier` and `IsEffectiveCartier.toInvertibleSheaf` in `TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Invertible.lean`, the ideal sheaf of an effective Cartier divisor as an invertible sheaf; `InvertibleSheaf.dual` in `TauCeti/AlgebraicGeometry/LineBundle/Dual.lean`; `TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple` in `TauCeti/AlgebraicGeometry/LineBundle/Ample.lean` (X quasi-compact and every point in an affine nonvanishing locus of a global section of a positive power of the class). These carry the theta divisors of §6.9. `AlgebraicGeometry.Scheme.IsProjectiveOver` in `TauCeti/AlgebraicGeometry/ProjectiveSpectrum/ProjectiveOver.lean` (a closed subscheme over R of the projective spectrum of the symmetric algebra of a finite R-module), with its instance `IsProjectiveOver.isProper`; `TauCeti.AlgebraicGeometry.Chow.cyclesOfDimension` (the k-cycles, as locally finite ℤ-valued functions `AlgebraicCycle X ℤ` supported on points of dimension k) and `TauCeti.AlgebraicGeometry.Chow.RatEquiv` (the k-cycles rationally equivalent to zero) in `TauCeti/AlgebraicGeometry/Chow/Basic.lean`, for locally Noetherian X. These carry the universal CH_0-triviality of §6.10 and Esnault's point count of §6.14 (i). For towers of modules: `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler` in `TauCeti/Algebra/Category/ModuleCat/Tower/MittagLeffler.lean`, line 191 (lim¹ of a Mittag-Leffler tower of modules over a ring vanishes), with `TauCeti.ModuleTower.isMittagLeffler_of_surjective` (line 104, towers with surjective transition maps) and `TauCeti.ModuleTower.isMittagLeffler_of_isArtinian` (line 113, towers of Artinian modules, here the finite-length W(k)-modules H^i(X, W_nI) of a proper X); §0.1 and §0.7 use them. For finite-group quotients: `TauCeti.AffineInvariantQuotient.quotient` in `TauCeti/AlgebraicGeometry/Quotient/Affine.lean` (Spec of the invariant subring A^G for a group G acting on a commutative ring A), with the projection Spec A → Spec A^G, which for a finite group G is integral and surjective, and finite when A is of finite type over A^G (`TauCeti.AffineInvariantQuotient.isFinite_projection` in `TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/Affine.lean`); §6.4 (iii) glues these. For universal homeomorphisms: `TauCeti.AlgebraicGeometry.IsUniversalHomeomorphism` in `TauCeti/AlgebraicGeometry/Morphisms/UniversalHomeomorphism.lean`, line 64 (every base change is a homeomorphism of underlying spaces), with the criterion `TauCeti.AlgebraicGeometry.isUniversalHomeomorphism_iff_isIntegralHom_universallyInjective_surjective` (line 162: integral, universally injective and surjective); Conventions item 7 and §§0.5, 1.3, 1.5, 5.1–5.6 use it.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

§A2.4, `ampleCohomologyAndDegree`; §A4.4, `exteriorCohomology` (for an abelian variety A over a field, cup product identifies H^\*(A, O_A) with the exterior algebra on H¹(A, O_A), squares of degree-one classes vanishing also in characteristic 2).

### From TauCetiRoadmap.AdicSpacesPartIII

§F0.6, the target *Finiteness and uniform Serre vanishing for graded coherent modules over a proper scheme* (graded-cohomology-finiteness): for A Noetherian, f: X → Spec A proper, an ideal I ⊂ A and a coherent F on X, ⊕_r H^p(X, I^rF) is a finite module over the Rees algebra ⊕_r I^r (EGA III, 3.3.1). §2.1 and §2.6 apply it on affine opens of the base of a proper morphism.

### From TauCetiRoadmap.ArcTopologyAndDescent

§1.1, universal descent for a scheme presheaf (for a functor F from qcqs schemes to an ∞-category with limits, the maps of universal F-descent, defined through the full Čech totalization; they are stable under base change and composition, a map with a section is one, and if g∘f is of universal descent then so is g); §1.3, the h-site and abstract blowup squares (over a qcqs base S, the h-topology on finitely presented S-schemes generated by finite families whose disjoint union is a v-cover); §1.6, affine approximation of v-covers, which applies on affine opens the finite-presentation refinement of PrismaticCohomology §2.0. The reduction of a proper surjection to a blowup uses generic flatness and flattening by blowing up (SchemeAndStackFoundations §4.12, with gap:reduced-flattening-by-blowup); the abstract-blowup criterion of its §1.4 is not consumed.

### From TauCetiRoadmap.ClassicalAdicEtaleCohomology

§5.4, the plurinodal alteration theorem: for f: X → S dominant and proper between integral excellent schemes there are alterations S_1 → S and X_d → X and a finite group N acting over X and S_1, with X_d → S_1 a composite of projective flat families of connected nodal curves and the invariant function field of X_d/N purely inseparable over that of the component of X ×_S S_1 dominated by X_d. §5.2 applies it over S = Spec k, k perfect.

### From TauCetiRoadmap.CrystallineCohomology

- §CR.3:duality.1, target *Proper smooth crystalline trace*: for X smooth of pure dimension d over a perfect field k, the isomorphism Tr^Ek: W_nΩ^d_X ≅ f_n^!W_n[−d], compatible with étale maps (part (1) of that target assumes only smoothness).
- §CR.4.4, target *Finite-length Witt operators and their identities* (the identities among F, V, R and Teichmüller lifts on truncated Witt vectors); target *Witt lifting from a torsion-free Frobenius lift*, which constructs, for a p-torsion-free ring A with a Frobenius lift φ, the Cartier–Dieudonné–Dwork ring map s_φ: A → W(A) whose n-th ghost coordinate is φⁿ, before composing with W(A) → W(S) for a reduced F_p-algebra S; the integrality of its Witt coordinates and its ring and Frobenius identities are part of that target; target *Canonical divided powers on the Verschiebung ideal of W_r(R)* (`γ_m(Vx) = (p^{m−1}/m!)V(x^m)`, compatible with the divided powers of p).
- §CR.4.6, target *Witt schemes on locally p-nilpotent schemes* (the Witt scheme W_rX with carrier (|X|, W_rO_X) for every scheme X on which p is locally nilpotent, with W_r(Spec R) = Spec W_r(R)); target *Witt localization and étale descent* (W_r of a localization or étale extension is the corresponding localization or étale extension of W_r, so W_rO_X is quasi-coherent on W_rX); target *Witt differential quotients and completion topologies* (the affine Witt ideals W_r(I) = ker(W_r(A) → W_r(A/I))); target *Classical de Rham–Witt complex as the initial V-pro-complex*.
- §CR.4.7, target *Finite and infinite crystalline de Rham–Witt comparison*; target *Degree filtration and the slope spectral sequence* (for X smooth proper over a perfect field, `H^b(X, WΩ^a_X) ⊗ K` is the part of `H^{a+b}_crys(X/W) ⊗ K` with slopes in [a, a+1)); target *Slope decomposition on the existing isocrystal carrier* (for k perfect and a finite-dimensional `WittVector.Isocrystal` V, the canonical finite decomposition V = ⊕_λ V_λ into isoclinic subisocrystals, Hom(V_λ, V′_μ) = 0 for λ ≠ μ, and over `F_{p^r}` the slopes are v_p of the eigenvalues of the linear F^r divided by r, with multiplicities).
- §CR.4.8, target *Logarithmic Hodge–Witt sheaves* (`W_rΩ^q_{X,log}`, generated étale locally by the symbols dlog[u_1] ∧ ⋯ ∧ dlog[u_q]).

### From TauCetiRoadmap.DerivedDeRhamCohomology

§PD.6, target *Universal base-compatible divided power envelope* (for a divided power ring (A, I, γ), an A-algebra B and any ideal J ⊂ B, the envelope `D_{B,γ}(J)` with its universal property among divided power rings over (A, I, γ)); target *Completed PD envelopes and the derived-completion comparison* (the p-adic completion of an envelope in which p is nilpotent modulo the divided power ideal carries the extended divided powers, and D^/p^n = D/p^n).

### From TauCetiRoadmap.EnhancedDerivedSheaves

- §E1.3, `enhancedDerived` (the enhanced derived category of a ringed site; RΓ, a right adjoint, preserves its limits, in particular derived limits of towers); §E1.4, tensor, internal Hom, pullback, pushforward and change of coefficients (derived tensor products of module complexes); §E2.6, `hypercoverDescent_boundedBelow` (for a hypercover of a topos, pullback is an equivalence D⁺(X) ≃ D⁺_cart(U_•), the lower bound uniform in the simplicial degree).
- §E2.8, `descendableCover_fppf` (fppf covers of qcqs schemes are descendable) and `derivedSchemeBaseChange` (derived fibre products of qcqs F_p-schemes and their iterates, glued from spectra of animated rings on affine charts, with their quasi-coherent module categories, pushforward along qcqs maps and the base-change equivalence Lg^\*Rf_\*K ≅ Rf′_\*Lg′^\*K on a derived cartesian square for unbounded quasi-coherent K).
- §E5:descent, `moduleDescent` (module categories satisfy descent along descendable maps).
- §E5:animation.1, animated commutative rings (for ordinary rings A, B, C, π_\* of B ⊗^L_A C is Tor_\*^A(B, C); π_0 is left adjoint to the inclusion of ordinary rings, so π_0 of an iterated derived tensor product is the ordinary one); §E5:animation.2, `simplicialWitt` and `wittFrobeniusLocalization` (degreewise Witt vectors W(R) of a simplicial commutative F_p-algebra R, with π_iW(R) = ∏_ℕ π_iR for i > 0; W(R) → W(π_0R) becomes an equivalence after inverting F, and its fibre is killed by p); §E5:animation.3, `tot_filteredColimit_of_bounded` (totalizations of cosimplicial spectra with a uniform bound on their homotopy commute with filtered colimits).

### From TauCetiRoadmap.EtaleCohomologyFoundations

§G.2, `nagataCompactification`: every separated finite-type morphism to a qcqs scheme has a compactification, which may be taken dense. §2.3 uses it over Spec k.

### From TauCetiRoadmap.JacobianChallenge

Layer C, coherent higher direct images under proper morphisms (for f: X → S proper with S locally Noetherian and F coherent on X, R^qf_\*F is coherent for every q, and over S = Spec A the groups H^q(X, F) are finite A-modules, with no flatness assumed). §0.1 and §0.8 use it over S = Spec k (finite length of H^i(X, W_nI) and finite dimension of H^i(X, O_X) for X proper), §1.3 for H^0 of a blowup, §2.1 and §2.6 for the coherence of higher direct images of the powers of an ideal along proper maps.

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

§0.1, graded Chow correspondences between smooth projective schemes with rational coefficients and their composition `Corr.comp`; §0.6, the decomposition of the diagonal NΔ_X = Γ_D + Γ_Y from a fixed support of integral CH_0 after algebraic closure of k(X); §2.2, continuity of Chow groups over algebraic extensions as a filtered colimit over finite subextensions, and torsion kernel of base change to an algebraic closure, for smooth projective schemes.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarietiesPartII

§1.1, Ferrand geometric pushouts (the pushout of a closed immersion along a finite morphism); it is compared with the ring B′ of §1.3 in a Check of §1.3 when the blowup is finite, and no proof route consumes it.

### From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

- Frames and tubes: §RD.3.1 (frames X ⊂ Y ⊂ P) and §RD.3.2 (the tube ]T[_P of a locally closed subscheme).
- Rigid cohomology and its structure: §RD.4.1 and §RD.4.24 (Monsky–Washnitzer cohomology; for smooth affine U, rigid cohomology is the de Rham cohomology of a dagger algebra of U); §RD.4.5 (Berthelot's functor j† and the overconvergent de Rham complex of a frame); §RD.4.12 (rigid cohomology with compact supports); §RD.4.17 (F-spaces: vector spaces with a semilinear Frobenius); §RD.4.18 (the Frobenius on rigid cohomology); §RD.4.19 (the excision long exact sequence for compact supports).
- Comparisons: §RD.4.36 (Berthelot's comparison morphism from the tube to the completed PD envelope); §RD.4.37 (it is a quasi-isomorphism for smooth X); §RD.4.38 (the rational rigid–crystalline comparison for smooth proper varieties).
- Descent and finiteness: §RD.5.67 (proper hypercoverings by smooth schemes); §RD.5.73 (proper surjections are universally of cohomological descent); §RD.5.74 (the descent spectral sequence for proper hypercoverings); §RD.5.77 (Frobenius is bijective on rigid cohomology); §RD.5.78 (compact-support rigid cohomology vanishes above twice the dimension); §RD.5.89 (Poincaré duality); §RD.5.90 (finite dimensionality of compact-support rigid cohomology).
- Zeta functions and slopes: §RD.6.22 (the zeta function of a variety over a finite field through its closed points); §RD.6.23 (the rigid Lefschetz trace formula); §RD.6.58 (p-adic slopes of Frobenius eigenvalues and slope intervals); §RD.7.4 (local Fatou: the coprime numerator and denominator of an integral rational power series are integral).

### From TauCetiRoadmap.PrismaticCohomology

§2.0, arc descent for the comparisons, for its finite-presentation refinement of v-covers (Rydh): a finitely presented v-cover Y → X of qcqs schemes has a refinement Z → Y over X that factors as Z → X′ → X with Z → X′ a quasi-compact open covering and X′ → X a proper finitely presented surjection; v-covers are stable under composition and base change. The refinement of a proper finitely presented surjection such as P¹_X → X is itself with the identity open covering, and that of a finite affine open covering is itself with the identity proper factor.

### From TauCetiRoadmap.SchemeAndStackFoundations

- Algebra and morphisms: §0.20 (Japanese and Nagata rings: normalization of a scheme of finite type over a field is finite); §0.23 (universal homeomorphisms, with the criterion `isUniversalHomeomorphism_iff_isIntegralHom_universallyInjective_surjective`: integral, universally injective and surjective); §0.26 (`frobenius_factors_through_universalHomeomorphism`, for schemes of finite type over F_p; its qcqs extension is gap:qcqs-frobenius-factorization below); §0.29 (scheme Frobenius and the relative Frobenius `F_{X/k}`).
- Quotients: §1.17, `finiteGroupQuotient_projective` (for f: Y → S projective over a Noetherian S and a finite group Γ acting by S-automorphisms, the quotient Y/Γ, projective over S, with q: Y → Y/Γ finite, surjective and Γ-invariant and `O_{Y/Γ}` = (q_\*O_Y)^Γ).
- Cohomology: §2.5, `noetherianSpace_vanishing` (Grothendieck vanishing: on a Noetherian space of Krull dimension ≤ d every abelian sheaf has H^p = 0 for p > d); §2.6, `qcoh_higherDirectImages`, `ample_serre_vanishing`, `projectiveSpace_cohomology` and `proper_fibreDimension_vanishing` (for f proper over a locally Noetherian base with fibres of dimension ≤ d, R^qf_\*F = 0 for q > d and F quasi-coherent); §2.7 (cohomology with supports); §2.18, `projectionFormula` (for a qcqs morphism g: X → S and quasi-coherent complexes E on X and K on S, Rg_\*(E ⊗^L Lg^\*K) ≅ Rg_\*E ⊗^L K).
- Duality: §2.19, `upperShriek_compactification_independence` (the functor f^! of a separated finite-type morphism of Noetherian schemes does not depend on the compactification); §2.20, `cm_serre_duality` and `sheafified_grothendieck_duality` (for f proper between Noetherian schemes, Rf_\*RHom(K, f^!L) ≅ RHom(Rf_\*K, L)); §2.21, `SchemeDualizing`, `coherent_duality` and the trace with `trace_finite` (for finite f the trace is evaluation at 1).
- Birational geometry: §4.9, `stein_factorization`; §4.12, `generic_flatness`, `flattening_by_blowup` and `modification_domination` (over Noetherian integral bases; the reduced case is gap:reduced-flattening-by-blowup below); §4.14, `hilbert_quot_schemes`; §4.16 (alterations and their generic degree); §4.19, `alteration_theorem` (de Jong's alteration theorem over a field).
- Intersection theory: §5.1 (cycles, rational equivalence and Chow groups, on Tau Ceti's carriers); §5.2 (proper pushforward with residue-degree weights, the degree deg: CH_0(X) → ℤ of a proper scheme over a field, flat pullback and the localization sequence `localization_exact`); §5.5 (normal cones and refined Gysin maps, with their functoriality and their compatibility with proper pushforward and flat pullback).

What SchemeAndStackFoundations must provide (gap:qcqs-frobenius-factorization): For every finite finitely presented universal homeomorphism f: X → Y of qcqs F_p-schemes, provide N ≥ 0 and g: Y → X with f ∘ g = F_Y^N and g ∘ f = F_X^N. Its §0.26 covers schemes finite type over F_p; the qcqs extension is required in Layer 0 and Layer 1.

What SchemeAndStackFoundations must provide (gap:reduced-flattening-by-blowup): For a reduced Noetherian scheme Y and a proper finitely presented surjection f: X → Y, provide a dense open U ⊂ Y over which f is flat and a U-admissible blowup Y_1 → Y such that the strict transform of X is flat over Y_1. Its §4.12 states generic flatness and flattening by blowing up over integral Noetherian bases; §1.5 applies them over reduced affine Noetherian bases with several irreducible components (BS17, proof of Lemma 2.6, p. 5, which cites Raynaud–Gruson for this step).

What SchemeAndStackFoundations must provide (gap:quasi-coherent-kunneth): For schemes X and Y over a field k that are quasi-compact with affine diagonal, and quasi-coherent modules F on X and G on Y, the external cup product `⊕_{a+b=n} H^a(X, F) ⊗_k H^b(Y, G) → H^n(X ×_k Y, F ⊠ G)` is an isomorphism for every n, where F ⊠ G is the tensor product of the pullbacks of F and G along the two projections. This is Stacks, Lemma 33.29.1 (tag 0BED). Its §2.6 has quasi-coherent cohomology and flat base change but no Künneth formula; §6.8 uses it for A ×_k A, A an abelian variety.

What SchemeAndStackFoundations must provide (gap:admissible-invariant-quotient-gluing): For a finite group G acting by automorphisms on a separated scheme X of finite type over a field such that every G-orbit lies in an affine open, glue the affine invariant quotients of the G-stable affine opens into a separated scheme X/G of finite type with q: X → X/G finite, surjective and G-invariant and `O_{X/G}` = (q_\*O_X)^G. Its §1.17 constructs the quotient for projective morphisms over a Noetherian base; §6.4 (iii) needs it for X proper over F_q with every orbit in an affine open, the generality of BBE07, Proposition 6.9 (ii) and Lemma 6.10, pp. 38–39.

## How to read the build

Layer 0 sets up the Witt vector sheaves W_nO_X, WO_X and their ideal sheaves, the two rationalizations (tensor and isogeny), Frobenius inversion, invariance under nilpotents and finite universal homeomorphisms, Mayer–Vietoris for closed covers, and finiteness with slopes in [0, 1) for proper schemes. Layer 1 proves that Frobenius-inverted Witt vector cohomology is an h-sheaf (fppf descent, its insensitivity to the derived structure of the supplied derived self-products, the finite pushout replacing a blowup square, excision), and hence that rational Witt vector cohomology is one. Layer 2 defines Witt vector cohomology with compact supports, proves its independence of the compactification through the vanishing of higher direct images of Witt ideal sheaves, its finiteness, and descent along proper hypercoverings by smooth schemes. Layer 3 constructs the morphism from compactly supported rigid cohomology and proves the Berthelot–Bloch–Esnault theorem that it is an isomorphism on slope \< 1 parts. Layer 4 provides the Witt canonical system, pushforwards, Gros cycle classes and the action of proper correspondences on relative Hodge–Witt cohomology. Layer 5 applies them to Witt-rational singularities: quasi-resolutions, the invariance theorem for topological finite quotients, the Witt singularity complexes, and the vanishing theorem for fibrations with CH_0-trivial generic fibre. Layer 6 turns all of this into point counts over finite fields: ζ^W = `ζ^{<1}`, Ax's criterion, congruences from isomorphisms on Witt or structure-sheaf cohomology, Ax–Katz modulo q, Serre's congruence for theta divisors, and Esnault's theorem. Each section lists, in its *Needs:* line, the inputs of its statement and proof route.

## Layer 0: Witt vector sheaves and rational Witt cohomology

Witt vector cohomology starts with sheaves: W_nO_X and WO_X are sheaves of rings on the Zariski space of a scheme in characteristic p, and W_nX = (|X|, W_nO_X) is a scheme over W_n(k). Integrally these sheaves remember nilpotents and are not topological; after inverting p (or only the Frobenius) they become insensitive to nilpotents and to finite universal homeomorphisms, and they satisfy Mayer–Vietoris for closed covers. Two rationalizations are needed and are kept apart: tensoring with ℚ, which is what Berthelot–Bloch–Esnault use for cohomology with K-coefficients, and the isogeny category of Chatzistamatiou–Rülling, in which a higher direct image vanishes only if a single power of p kills it. The layer ends with finiteness: for proper X, H^i(X, WO_X)_K is a finite-dimensional F-isocrystal with slopes in [0, 1).


### 0.1 Witt ideal sheaves and cohomology on Witt schemes

Let p be a prime and X a scheme with p·O_X = 0. For n ≥ 1, W_nO_X is the sheaf of rings U ↦ W_n(O_X(U)) (truncated p-typical Witt vectors of length n), and WO_X := lim_n W_nO_X is the sheaf U ↦ W(O_X(U)). For a quasi-coherent ideal I ⊂ O_X, W_nI := ker(W_nO_X → W_n(O_X/I)) is the subsheaf of Witt vectors all of whose components are sections of I, and WI := lim_n W_nI. These carry restriction R: `W_{n+1}` → W_n and Frobenius F: `W_{n+1}` → W_n (ring maps), Verschiebung V: W_n → `W_{n+1}` (additive) and the multiplicative Teichmüller map [−]: O_X → W_nO_X, with FV = p and V(x·F(y)) = V(x)·y, and exact sequences 0 → W_nI →(V) `W_{n+1}I` →(R^n) I → 0 of sheaves of abelian groups. Use the Witt scheme W_nX of CrystallineCohomology §CR.4.6; W_nO_X and W_nI are quasi-coherent on W_nX, and W_n(V(I)) is the closed subscheme of W_nX cut out by W_nI. For the induced morphism W_nf: W_nX → W_nY, if X, Y are of finite type over a perfect field k of characteristic p, then W_nX is of finite type over W_n(k), W_nf preserves being separated, of finite type and proper, and R^if_\*(W_nI) = R^i(W_nf)_\*(W_nI) as sheaves of abelian groups on |Y|. Finally RΓ(X, WI) ≅ Rlim_n RΓ(X, W_nI), and for X proper over k and I coherent, H^i(X, WI) = lim_n H^i(X, W_nI). (BBE07, §2, opening paragraphs, pp. 6–7; GNT19, §2.5, pp. 13–14; CR12, §1.1 (Witt schemes), pp. 8–9).

p is prime and p·O_X = 0; no reducedness or finiteness is assumed for the definitions. Quasi-coherence of W_nI on W_nX and the Rlim formula need I quasi-coherent; the inverse-limit formula on cohomology needs X proper over a perfect field and I coherent (the groups H^i(X, W_nI) are then of finite length over W_n(k), so the tower is Mittag-Leffler). W_nO_X is not an O_X-module for n ≥ 2: it is a sheaf of W_n(k)-algebras, and cohomology is sheaf cohomology of abelian groups on |X|.

*Needs:* Mathlib `WittVector`; Mathlib `TruncatedWittVector`; Mathlib `WittVector.frobenius`; Mathlib `WittVector.verschiebung`; Mathlib `WittVector.teichmuller`; Mathlib `AlgebraicGeometry.Scheme`; CrystallineCohomology §CR.4.4, *Finite-length Witt operators and their identities*; CrystallineCohomology §CR.4.6, *Classical de Rham–Witt complex as the initial V-pro-complex*; CrystallineCohomology §CR.4.6, *Witt localization and étale descent*; Tau Ceti `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler`, `TauCeti.ModuleTower.isMittagLeffler_of_surjective` and `TauCeti.ModuleTower.isMittagLeffler_of_isArtinian`; EnhancedDerivedSheaves §E1.3, `enhancedDerived`; CrystallineCohomology §CR.4.6, *Witt schemes on locally p-nilpotent schemes*; JacobianChallenge Layer C, coherent higher direct images under proper morphisms (finite length for X proper); Mathlib `WittVector.frobenius_verschiebung`; Mathlib `WittVector.verschiebung_mul_frobenius`; Mathlib `WittVector.verschiebung_frobenius`; Mathlib `WittVector.map_surjective`.

The construction has the following API.

- For a quasi-coherent ideal I ⊂ O_X, the ideal sheaf W_nI = ker(W_nO_X → W_n(O_X/I)) and WI = lim W_nI.
- 0 → W_nI →(V) `W_{n+1}I` →(R^n) I → 0 is exact.
- For I quasi-coherent, W_nI is a quasi-coherent ideal of `O_{W_nX}`.
- R^if_\*(W_nI) = R^i(W_nf)_\*(W_nI) as sheaves of abelian groups on |Y|.
- A tower of sheaves of abelian groups whose higher cohomology vanishes and whose transition maps are surjective on every open of a basis has R^i lim = 0 for i ≥ 1; the tower (W_nI)_n of a quasi-coherent I has both properties on affine opens.
- RΓ(X, WI) ≅ Rlim_n RΓ(X, W_nI) for I quasi-coherent on a quasi-compact separated X; for X proper over k, H^i(X, WI) = lim_n H^i(X, W_nI).
- For f between finite-type k-schemes with k perfect, W_nf is separated, finite type or proper when f is, and W_nX is finite type over W_n(k).

A proof route is the following.

1. Use the sheaf of rings `O_{W_nX}` = W_nO_X and the functorial Witt scheme of CrystallineCohomology §CR.4.6 (Witt schemes on locally p-nilpotent schemes). Define W_nI as the sheaf kernel for the closed subscheme V(I); its sections are precisely the vectors with all components in I. The affine Witt ideal W_n(I) = ker(W_n(A) → W_n(A/I)) itself is imported from that section (Witt differential quotients and completion topologies).
2. The section identities are Mathlib WittVector.frobenius_verschiebung and verschiebung_mul_frobenius, and verschiebung_frobenius in characteristic p. WittVector.map_surjective applied to A → A/I gives 0 → W(I) → W(A) → W(A/I) → 0 on affine opens. Shifting and truncating coordinates give the exact V-sequences for the ideal sheaves.
3. Apply CrystallineCohomology §CR.4.6, *Witt localization and étale descent*, on each Witt affine open. The kernel W_nI of `O_{W_nX}` → `O_{W_n(V(I))}` is a quasi-coherent ideal sheaf, whose closed subscheme is W_n(V(I)).
4. For a finite-type k-algebra A with k perfect, Frobenius on A is finite. Induction along the truncation sequence, whose kernel `V^{n−1}A` is finite through `F^{n−1}`, gives that W_n(A) is finite type over W_n(k). The reduced morphism underlying W_nf is f_red; separatedness and properness then transfer across the nilpotent thickenings, using finite type (GNT19 §2.5; CR12 §1.1).
5. Affine acyclicity and the surjective-tower criterion. On an affine open U = Spec A of X, W_nI|_U is the quasi-coherent sheaf on the affine Witt scheme W_nU attached to the W_n(A)-module W_n(I(U)) (step 3), so H^i(U, W_nI) = 0 for i ≥ 1, and the truncation `W_{n+1}(I(U))` → W_n(I(U)) is surjective. A tower of sheaves of abelian groups with these two properties on a basis of the topology has R^i lim_n = 0 for i ≥ 1 (CR12, Lemma 1.5.1, pp. 12–13): on a basis open the sections form a surjective tower in degree 0, which is Mittag-Leffler (Tau Ceti `TauCeti.ModuleTower.isMittagLeffler_of_surjective`), so its lim¹ vanishes (Tau Ceti `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler`). Hence Rlim_n W_nI = WI, and since RΓ(X, −) commutes with derived limits in the enhanced derived category of sheaves of abelian groups (EnhancedDerivedSheaves §E1.3, `enhancedDerived`), RΓ(X, WI) ≅ Rlim_n RΓ(X, W_nI). For X proper the H^i(X, W_nI) are W_n(k)-modules of finite length (by induction on n along the V-sequences, whose graded pieces are Frobenius twists of I, from the finiteness of H^i(X, I) over k for X proper and I coherent, JacobianChallenge Layer C, k being perfect), hence Artinian W(k)-modules, so the towers (H^i(X, W_nI))_n are Mittag-Leffler (Tau Ceti `TauCeti.ModuleTower.isMittagLeffler_of_isArtinian`), lim¹ vanishes (Tau Ceti `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler`) and H^i(X, WI) = lim_n H^i(X, W_nI). This step uses only the Witt scheme, the tower supplier and the enhanced derived category; §0.7 builds its higher direct images on it.

**Checks.**

- W_n(Spec F_p) ≅ Spec (ℤ/p^nℤ); Γ(Spec F_p, WO) = ℤ_p.
- W_1O_X = O_X and W_1I = I; W_n(0) = 0.
- For X = Spec A, Γ(X, W_nO_X) is Mathlib's TruncatedWittVector p n A and Γ(X, WO_X) is WittVector p A, with F, V, R the Mathlib operators.
- W_2O_X is not killed by p when X ≠ ∅ (p·1 = V(1) ≠ 0 in W_2(F_p) = ℤ/p²), so it is not an O_X-module.
- For X = Spec F_p and I = O_X, the tower W_n(F_p) = ℤ/p^n has surjective transition maps, its limit is ℤ_p and lim¹ = 0, and H^i(X, WO_X) = 0 for i ≥ 1; this is computed from the surjective-tower criterion alone, before any finiteness theorem for proper schemes.
- W_nI is not the ideal generated by Teichmüller lifts of I: for I = (t) ⊂ F_p[t] and n = 2, V(t) = (0, t) lies in W_2(I), but every element of the ideal [t]·W_2(F_p[t]) has second Witt component divisible by t^p.
- For X = Spec F_p[t] and n = 2, the open D(t) on the imported W_2X has sections W_2(F_p[t,t⁻¹]); Witt ideal sheaves restrict on this same open.
- For X of finite type over k and I = 0, W_nI = 0; for I = O_X, W_nI = W_nO_X.

These results apply to BBE07, §2, pp. 6–9: the sheaves WI_K = WI ⊗ ℚ define Witt vector cohomology with compact supports; BS17, Proposition 11.41, p. 51: RΓ(X, WO_X)[1/F] is the presheaf whose h-descent is proved; CR12, §4, p. 82: `WO_{X,ℚ}` and its higher direct images define WO-rational singularities; HW23, Corollary 4.6 and proof, p. 21 (arXiv v2): the exact sequence 0 → `WI_{S,ℚ}` → `WO_{Y,ℚ}` → `u_*WO_{S,ℚ}` → 0 for a divisor S; §2.3: RΓ(X, WI) for an ideal I of a compactification.


### 0.2 Rational Witt sheaves: tensor and isogeny conventions

Let X be a scheme with p·O_X = 0 and Sh(X) its abelian category of sheaves of abelian groups. (a) The tensor convention (Berthelot–Bloch–Esnault): WI_K := WI ⊗_ℤ ℚ (sheafified), with R^if_\*(WI_K) = R^if_\*(WI) ⊗ ℚ on noetherian spaces. (b) The isogeny convention (Chatzistamatiou–Rülling): let T(X) ⊂ Sh(X) be the full subcategory of sheaves killed by some nonzero integer; it is a Serre class, and Sh(X)_ℚ := Sh(X)/T(X) is the Serre localization, an abelian category with exact localization q: Sh(X) → Sh(X)_ℚ; write F_ℚ := q(F). Every left-exact f_\* with enough acyclics induces Rf_\*: D⁺(Sh(X)_ℚ) → D⁺(Sh(Y)_ℚ) with Rf_\* ∘ q = q ∘ Rf_\*. Thus R^if_\*(WI_ℚ) = 0 means that some p^N kills R^if_\*(WI), and an isomorphism F_ℚ ≅ G_ℚ induced by a map means that its kernel and cokernel are killed by a nonzero integer. For maps of Witt-module sheaves this is equivalent to killing them by a power of p. (CR12, §3.7, 3.7.1, Proposition 3.7.7, Notation 3.7.9, pp. 68–72; GNT19, §2.5 and Remark 2.17 (1)–(4), pp. 14–15; BBE07, §2, p. 7 (notation `WO_{X,K}`, WI_K)). The agreement of the two conventions on cohomology of proper schemes needs finiteness and is §0.8.

X is noetherian whenever the tensor convention is used for higher direct images (cohomology commutes with ⊗ℚ on noetherian spaces). Statements of WO-rationality (Layer 5) use the isogeny convention; statements with K = Frac W(k) coefficients (Layer 2, Layer 3, Layer 6) use the tensor convention; their comparison for proper schemes is proved in §0.8, after finiteness.

*Needs:* §0.1; Mathlib `CategoryTheory.ObjectProperty.IsSerreClass`; Mathlib `CategoryTheory.ObjectProperty.SerreClassLocalization.abelian`; Mathlib `CategoryTheory.ObjectProperty.SerreClassLocalization.isZero_obj_iff`; Mathlib `DerivedCategory`.

The construction has the following API.

- The Serre class T(X) of sheaves of abelian groups killed by some nonzero integer.
- T(X) is a Serre class.
- For an abelian group M: ∃ n > 0, n • M = 0 (the objectwise form of T(X)).
- Closed under subgroups (injective homomorphisms).
- Closed under quotients (surjective homomorphisms).
- Closed under extensions: for M₁ → M₂ → M₃ exact with M₁, M₃ bounded torsion, M₂ is bounded torsion.
- The Serre localization Sh(X)_ℚ = Sh(X)/T(X) with its abelian structure and exact localization functor q.
- q(F) = 0 iff ∃ N > 0, N • F = 0 (equivalently p^N • F = 0 for F a Witt sheaf).
- Rf_\* on the quotient categories satisfies Rf_\* ∘ q ≅ q ∘ Rf_\*, hence R^if_\*(F_ℚ) = (R^if_\*F)_ℚ.

A proof route is the following.

1. T(X) contains 0 and is closed under subobjects, quotients and extensions (if a nonzero integer a kills F′ and a nonzero integer b kills F″ then ab kills the extension F), so it is a Serre class (Mathlib's ObjectProperty.IsSerreClass), and the localization at the morphisms that are isomorphisms modulo T(X) is abelian (Mathlib's SerreClassLocalization.abelian), with q exact and q(F) = 0 iff F ∈ T(X) (SerreClassLocalization.isZero_obj_iff).
2. Derived functors: CR12 Proposition 3.7.7 shows that a left-exact functor with enough acyclic objects induces a left-exact functor on the quotients whose derived functor commutes with q; apply it to Γ, f_\* and lim.

**Checks.**

- On a point, F = `⊕_{n≥1}` ℤ/p^n satisfies F ⊗ ℚ = 0 but q(F) ≠ 0: no single power of p kills it.
- On X = Spec F_p, `End(WO_{X,ℚ})` ≅ ℚ_p (ℤ_p with p inverted).
- On the empty scheme Sh(X)_ℚ is the zero category.
- For f proper and I coherent, R^if_\*(WI)_ℚ ≅ (R^if_\*(WI))_ℚ (GNT Remark 2.17 (2)).
- At p = 2 the constant sheaf ℤ/3 is in T(X), although no power of 2 kills it. Thus the general Serre quotient uses nonzero integers; the power-of-p criterion requires Witt-module coefficients.

These results apply to CR12, Definition 4.4.4, p. 82: WO-rationality asks `Rf_*WO_{X,ℚ}` = `WO_{S,ℚ}` in the isogeny category; BBE07, Theorem 2.4, p. 9: higher direct images R^qf_\*(WI′_K) vanish in the tensor convention; GNT19, Proposition 2.23, p. 18: the bounded-torsion strengthening of BBE Theorem 2.4; §5.5: the definition is stated in the isogeny convention.


### 0.3 Frobenius-inverted Witt cohomology

Let X be a qcqs scheme with p·O_X = 0. The Witt Frobenius F: WO_X → WO_X is a ring endomorphism; W(O_X)[1/F] := colim(WO_X →F WO_X →F ⋯) is the sequential colimit sheaf, and the Frobenius-inverted Witt cohomology is RΓ(X, WO_X)[1/F] := colim(RΓ(X, WO_X) →F RΓ(X, WO_X) →F ⋯), which agrees with RΓ(X, W(O_X)[1/F]) for qcqs X. Since FV = VF = p, F becomes invertible after inverting p, so RΓ(X, WO_X)[1/p] = (RΓ(X, WO_X)[1/F])[1/p]. The construction is contravariant in X and takes values in coconnective ℤ-module spectra (complexes concentrated in degrees ≥ 0). (BS17, §11.5, Notation 11.42 and Proposition 11.41, pp. 51–52; BS17, proof of Theorem 11.40 from Proposition 11.41 (statement p. 51)).

X qcqs, so cohomology commutes with filtered colimits of sheaves. F here is the Witt-vector Frobenius on coefficients, induced by the absolute Frobenius of X.

*Needs:* §0.1; Mathlib `WittVector.frobenius`; CrystallineCohomology §CR.4.4, *Finite-length Witt operators and their identities*; Mathlib `WittVector.frobenius_verschiebung`; Mathlib `WittVector.verschiebung_frobenius`; Mathlib `WittVector.frobeniusEquiv` (Frobenius is a ring automorphism of W(A) for a perfect F_p-algebra A, `Mathlib/RingTheory/WittVector/Frobenius.lean`, line 283).

The construction has the following API.

- The sheaf W(O_X)[1/F] = colim(WO_X →F WO_X →F ⋯).
- RΓ(X, WO_X)[1/F], as a functor from qcqs F_p-schemes to coconnective spectra (or `D^{≥0}(ℤ)`).
- For X qcqs, RΓ(X, W(O_X)[1/F]) ≅ RΓ(X, WO_X)[1/F].
- RΓ(X, WO_X)[1/p] ≅ (RΓ(X, WO_X)[1/F])[1/p].
- For X perfect, WO_X → W(O_X)[1/F] is an isomorphism.

A proof route is the following.

1. The colimit is a sequential colimit of sheaves of rings; for qcqs X sheaf cohomology commutes with filtered colimits, giving RΓ(X, W(O_X)[1/F]) = RΓ(X, WO_X)[1/F].
2. F∘V = V∘F = p on W(O_X) (Mathlib WittVector.frobenius_verschiebung and verschiebung_frobenius, the latter under CharP) shows F is invertible on any object on which p is invertible, so inverting p factors through inverting F.

**Checks.**

- For A perfect, W(A) → W(A)[1/F] is an isomorphism (F is bijective on W(A)).
- For A = F_p[ε]/(ε²), W(A) ≠ ℤ_p but W(A)[1/F] = ℤ_p: inverting F kills the nilpotent Witt vectors.
- For X = ∅, RΓ(X, WO_X)[1/F] = 0.
- For X = Spec F_p, RΓ(X, WO_X)[1/F] = ℤ_p in degree 0, equal to Mathlib's WittVector p (ZMod p).

These results apply to BS17, Proposition 11.41, p. 51: the h-sheaf is X ↦ RΓ(X, WO_X)[1/F]; BS17, Lemma 11.43, p. 52: W(O_X)[1/F] is insensitive to derived structure; §1.6: inverting p after F gives BBE's rational descent.


### 0.4 Rational Witt sheaves are insensitive to nilpotents and radicals

Let X be a scheme of finite type over a perfect field k of characteristic p. (i) WO_X → `WO_{X_red}` induces isomorphisms `WO_{X,K}` ≅ `WO_{X_red,K}` and `WO_{X,ℚ}` ≅ `WO_{X_red,ℚ}`, compatibly with F and V, hence H^\*(X, `WO_{X,K}`) ≅ H^\*(X_red, `WO_{X_red,K}`). (ii) If I, J ⊂ O_X are coherent ideals with √I = √J, then WI_K = WJ_K and WI_ℚ = WJ_ℚ inside `WO_{X,K}` (resp. `WO_{X,ℚ}`); in particular W(I^a)_ℚ = WI_ℚ for all a ≥ 1. (iii) After inverting F instead, W(O_X)[1/F] → `W(O_{X_red})[1/F]` is an isomorphism for every scheme X with p = 0 whose nilradical is nilpotent (for instance X noetherian, as in Layer 1); for an unbounded nilradical it can fail. (BBE07, Proposition 2.1 and its proof, pp. 7–8; CR12, Lemma 4.6.2, p. 90; NT20, Remark 2.2, p. 6).

Finite type over a perfect field (for (i), (ii)); (iii) needs a nilpotent nilradical, not only a locally nilpotent one. The isogeny version of (i) and (ii) needs the nilradical to be nilpotent (true for noetherian X): a uniform power of F then kills W(N).

*Needs:* §0.1; §0.2; §0.3.

A proof route is the following.

1. Let N be the nilradical; on a noetherian X, `N^{p^c}` = 0 for some c. F acts on W(N) by raising every component to the p-th power, so F^c kills W(N) (a single power, uniformly).
2. Since FV = VF = p, p^c = V^cF^c kills W(N); so W(N) is bounded torsion, W(N)_K = 0 and W(N)_ℚ = 0. The exact sequence 0 → W(N) → WO_X → `WO_{X_red}` → 0 gives (i).
3. (ii): apply (i) to O_X/I and O_X/J and compare with O_X/(I+J) and O_X/(I∩J), whose reductions coincide; W(I^a) ⊂ W(I) with quotient W(I/I^a)-type subquotient killed by a power of F.
4. (iii): filtered colimits are exact, so 0 → W(N)[1/F] → W(O)[1/F] → W(O_red)[1/F] → 0 is exact; if N^m = 0 and p^c ≥ m then every section of N has vanishing p^c-th power, so F^c kills W(N) and W(N)[1/F] = 0.

**Checks.**

- For X = Spec k[ε]/(ε²), W(k[ε]/(ε²)) ≠ W(k) but H^0(X, `WO_{X,K}`) = K = H^0(Spec k, WO_K).
- For the double line X = Spec k[x, y]/(y²) ⊂ A², H^0(X, WO_X)_K = W(k[x])_K, the value for its reduction A¹.
- For A = `F_p[t_1, t_2, …]/(t_i^{p^i})`, the Witt vector (t_1, t_2, …) lies in W(N) but is not killed by any power of F, so W(A)[1/F] → W(A_red)[1/F] is not injective: (iii) needs a nilpotent nilradical.


### 0.5 Frobenius-inverted and rational Witt cohomology under finite universal homeomorphisms

(i) Let f: X → Y be a finite, finitely presented universal homeomorphism of qcqs F_p-schemes. Then f\* : RΓ(Y, WO_Y)[1/F] → RΓ(X, WO_X)[1/F] is an isomorphism; in particular (with p inverted) RΓ(Y, WO_Y)[1/p] ≅ RΓ(X, WO_X)[1/p]. (ii) For a proper surjective f: X → Y between separated finite type schemes over a perfect field k, whose fibres are connected after every base change to a field point (X ×_Y Spec L connected or empty for all Spec L → Y). Then `WO_{Y,ℚ}` → `f_*WO_{X,ℚ}` is an isomorphism; conversely, if `WO_{Y,ℚ}` → `f_*WO_{X,ℚ}` is an isomorphism, then the fibres of f are connected in this sense. (iii) In particular a finite universal homeomorphism f satisfies `WO_{Y,ℚ}` ≅ `f_*WO_{X,ℚ}` = `Rf_*WO_{X,ℚ}`. (BS17, proof of Proposition 11.41, first paragraph, p. 53; GNT19, Lemma 2.22 and proof, p. 17; NT20, Lemma 2.17 and proof, p. 13; Notation §2.1, p. 5; HW23, Corollary 4.6 and proof, p. 21 (arXiv v2)).

(i): finite and finitely presented; Y qcqs. (ii): 'connected fibres' means connected after base change to every field-valued point (Nakamura–Tanaka's convention); topological connectedness of fibres at points is not enough (the Spec `F_{q²}` → Spec F_q Check below). (iii): f finite, so R^if_\* = 0 for i > 0 on quasi-coherent W_n-sheaves.

*Needs:* §0.1; §0.2; §0.3; §0.4; SchemeAndStackFoundations §0.26, qcqs Frobenius factorization (gap:qcqs-frobenius-factorization); SchemeAndStackFoundations §0.23, universal homeomorphisms; SchemeAndStackFoundations §4.9, `stein_factorization`; Mathlib `AlgebraicGeometry.IsFinite`; Mathlib `AlgebraicGeometry.IsProper`.

A proof route is the following.

1. (i): By the qcqs Frobenius factorization required of SchemeAndStackFoundations §0.26 (gap:qcqs-frobenius-factorization) there are N and g: Y → X with f∘g = F_Y^N and g∘f = F_X^N; since F_X^N, F_Y^N act invertibly on Frobenius-inverted Witt cohomology, f\* is an isomorphism with inverse `(F^N)^{−1}∘g*`.
2. (ii) ⇒: Stein factorization (SchemeAndStackFoundations §4.9, `stein_factorization`) reduces to f finite with geometrically connected (one-point, purely inseparable residue field) fibres, i.e. a finite universal homeomorphism; by §0.4 reduce to X, Y reduced and affine, X = Spec B, Y = Spec A with A ⊂ B and `B^{p^e}` ⊂ A (GNT19 Lemma 2.22, proof); then p^e·W(B) ⊂ W(A), so W(A)_ℚ → W(B)_ℚ is an isomorphism.
3. (ii) ⇐: Stein factorization f = g ∘ h, with h_\*O_X = `O_{X′}` and g: X′ → Y finite, gives h_\*W_nO_X = `W_nO_{X′}`, so `WO_{Y,ℚ}` → `g_*WO_{X′,ℚ}` is an isomorphism, and the geometric fibres of h are connected; it remains to show that g is a universal homeomorphism. By §0.4 take X′ = Spec B, Y = Spec A reduced and affine, with W(A) → W(B) an isomorphism up to bounded torsion. If a ∈ A maps to 0 in B, then [a] lies in the kernel, so `p^N[a] = V^N[a^{p^N}]` = 0 for some N, hence `a^{p^N}` = 0 and a = 0: A → B is injective. For b ∈ B, some `p^N[b] = V^N[b^{p^N}]` lies in the image of W(A); the map W(A) → W(B) acts coordinatewise, so `b^{p^N}` ∈ A. Hence A → B is finite and injective, so Spec B → Spec A is integral and surjective, and two maps B → L to a field agreeing on A agree on every `b^{p^N}`, hence on b; so g is universally injective, hence a universal homeomorphism (SchemeAndStackFoundations §0.23, universal homeomorphisms). Its fibre over every point of Y, closed or not, and after every base change to a field, is a single point. The proof of NT20, Lemma 2.17, argues at maximal ideals only; the p-power argument covers all points at once.
4. (iii) is (ii) for finite f, together with the vanishing of R^if_\* for finite morphisms.

**Checks.**

- Spec `F_{q²}` → Spec F_q is finite surjective with connected fibre but W(F_q)_ℚ → `W(F_{q²})_ℚ` is not an isomorphism: its fibre is not geometrically connected.
- The converse of (ii) at a non-closed point: for p odd, A = k[t] ⊂ B = k[t, s]/(s² − t) is finite and generically étale of degree 2, so the generic fibre has two geometric points. Here `s^{p^N} = t^{(p^N−1)/2}·s` ∉ A for every N, so W(A)_ℚ → W(B)_ℚ is not onto, as the p-power argument of step 3 requires. For A = F_p[t] ⊂ B = `F_p[t^{1/p}]` instead, every b ∈ B has b^p ∈ A, and Spec B → Spec A is a universal homeomorphism.
- The normalization of a cuspidal cubic is a finite universal homeomorphism, so the cusp and P¹ have the same rational Witt cohomology.
- For F_p(t) ⊂ `F_p(t^{1/p})`, put A = F_p(t), B = `F_p(t^{1/p})` and g\*: B → A, b ↦ b^p. Both composites with A → B are Frobenius, so N = 1 works, although neither field is finite type over F_p.
- For the identity of the empty scheme and of Spec F_p, take g = id and N = 0; both required composites are id.


### 0.6 Mayer–Vietoris for rational Witt sheaves along closed covers

Let X be a scheme of finite type over a perfect field k and X_1, X_2 ⊂ X closed subschemes with X = X_1 ∪ X_2 set-theoretically, Z = X_1 ∩ X_2 the scheme-theoretic intersection. Then 0 → `WO_{X,K}` → `WO_{X_1,K}` ⊕ `WO_{X_2,K}` → `WO_{Z,K}` → 0 is exact, and so are its isogeny version and the version 0 → `WI_{X,ℚ}` → `WI_{X_1,ℚ}` ⊕ `WI_{X_2,ℚ}` → `WI_{Z,ℚ}` → 0 for the ideal sheaves inside an ambient V ⊃ X; this gives the long exact Mayer–Vietoris sequence of H^\*(−, WO_K). More generally, for a closed cover X = X_1 ∪ ⋯ ∪ X_r the Čech-type complex 0 → `WO_{X,K}` → ∏ `WO_{X_i,K}` → ∏ `WO_{X_{ij},K}` → ⋯ → `WO_{X_{1…r},K}` → 0 is exact. (BBE07, Proposition 2.2 and Corollary 2.3 with proofs, p. 8; NT20, Lemma 2.18 and proof, pp. 13–14).

Set-theoretic cover; intersections scheme-theoretic (any scheme structure gives the same rational sheaves by §0.4).

*Needs:* §0.4; §0.2.

A proof route is the following.

1. With I_1, I_2 the ideals of X_1, X_2, one has W(I_1 + I_2) = W(I_1) + W(I_2) and an exact sequence 0 → W(O/(I_1 ∩ I_2)) → W(O/I_1) ⊕ W(O/I_2) → W(O/(I_1+I_2)) → 0.
2. I_1 ∩ I_2 is nilpotent because X = X_1 ∪ X_2, so `WO_{X,K}` = W(O_X/(I_1 ∩ I_2))_K by §0.4.
3. The r-fold statement follows by induction on r, writing the complex as the cone of a map of the complexes for X_2 ∪ ⋯ ∪ X_r and for X_1 ∩ (X_2 ∪ ⋯ ∪ X_r) and using the case r = 2.

**Checks.**

- For two lines meeting at a point in A², H^0 of WO_K of the union is the fibre product of W(k[x])_K and W(k[y])_K over K.


### 0.7 Higher direct images of Witt ideal sheaves

For k perfect, f: X → Y a morphism between separated k-schemes of finite type, and a coherent ideal I ⊂ O_X: (1) R^i lim_n (f_\*W_nI) = 0 for i ≥ 1 and R^i lim_n (R^jf_\*W_nI) = 0 for i ≥ 2, j ≥ 0; hence there are short exact sequences 0 → R¹lim_n `R^{j−1}f_*(W_nI)` → R^jf_\*(WI) → lim_n R^jf_\*(W_nI) → 0. (2) If R^if_\*I = 0 for all i > 0 then R^if_\*(WI) = 0 for all i > 0. (3) If f is proper, R^if_\*(WI) = 0 for i > m := `max_{y∈Y}` dim `f^{−1}(y)`, with the empty-source case giving zero in every degree. Separately, for every separated finite-type X over k, H^i(X, WI) = 0 for i > dim X, without assuming X proper. (4) If R^if_\*(WI) = 0 then R^if_\*(WI_ℚ) = 0. (GNT19, Lemmas 2.18–2.21 with proofs, pp. 15–17; CR12, Lemma 1.5.1 (cited by GNT for the acyclicity criterion), §1.5, p. 12).

Finite type over a perfect field, so W_nI is a quasi-coherent sheaf on the noetherian scheme W_nX and its higher direct images are quasi-coherent on W_nY. The relative fibre-dimension bound (3) assumes f proper; the absolute dimension bound for Y = Spec k does not.

*Needs:* §0.1; §0.2; SchemeAndStackFoundations §2.6, `qcoh_higherDirectImages`; SchemeAndStackFoundations §2.6, `proper_fibreDimension_vanishing`; SchemeAndStackFoundations §2.5, `noetherianSpace_vanishing`; Tau Ceti `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler` and `TauCeti.ModuleTower.isMittagLeffler_of_surjective`.

A proof route is the following.

1. (1) A tower of sheaves with vanishing higher cohomology on affine opens and surjective transition maps on affine opens is lim-acyclic (the surjective-tower criterion of §0.1, from CR12 Lemma 1.5.1 and Tau Ceti `TauCeti.ModuleTower.isMittagLeffler_of_surjective` with `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler`); R^jf_\*(W_nI) = R^j(W_nf)_\*(W_nI) is quasi-coherent on W_nY, and Γ(U, `f_*W_{n+1}I`) → Γ(U, f_\*W_nI) is `W_{n+1}(I(f^{−1}U))` → `W_n(I(f^{−1}U))`, surjective.
2. (2) Induction on n with 0 → I →(V^n) `W_{n+1}I` → W_nI → 0 gives R^if_\*(W_nI) = 0 for all n; then Rf_\*(WI) = Rlim Rf_\*(W_nI) = lim f_\*(W_nI) by (1).
3. For proper f, W_nf is proper and its fibres have dimension at most m; apply SchemeAndStackFoundations §2.6, `proper_fibreDimension_vanishing`, to W_nI on the Noetherian W_nY. In degree m the transition maps are onto by the exact V-sequence and `R^{m+1}f_*I` = 0, so (1) also kills degree m+1. For Y = Spec k and arbitrary separated finite-type X, Grothendieck vanishing (SchemeAndStackFoundations §2.5, `noetherianSpace_vanishing`, on the Noetherian space |W_nX| = |X| of Krull dimension dim X) gives H^i(X, W_nI) = 0 above dim X; the same surjectivity argument in top degree gives H^i(X, WI) = 0 there.
4. (4) is §0.2 (R^if_\*(WI_ℚ) = (R^if_\*WI)_ℚ).

**Checks.**

- For a resolution f of a normal S with rational singularities, R^if_\*O_X = 0 for i > 0 gives R^if_\*WO_X = 0 and hence WO-rationality of the target (§5.9).
- For j: A² ∖ {0} → A² and I = O, fibres have dimension 0 but the Čech class [x⁻¹y⁻¹] on D(xy) has nonzero first component in H¹(D(x) ∪ D(y), O). Its compatible Teichmüller lifts give R¹j_\*WO ≠ 0; properness in (3) cannot be dropped.
- For X = A² ∖ {0}, dim X = 2 and H^i(X, WO) = 0 for i > 2; the nonzero H¹ above is consistent with the absolute dimension bound.


### 0.8 Finiteness and slopes of Witt vector cohomology of proper schemes

Let X be a proper scheme over a perfect field k of characteristic p, W = W(k), K = W[1/p]. For each i, M := H^i(X, WO_X) is a finitely generated module over the Dieudonné ring R = W_σ[[V]] (with aV = Vσ(a)), separated and complete for the V-adic topology, and H^i(X, WO_X)_K is a finite-dimensional K-vector space on which F (σ-semilinear) acts bijectively with all slopes in [0, 1). The torsion of H^i(X, WO_X) is killed by a single power of p. Consequently the two rationalizations of §0.2 agree on the cohomology of X: H^i(X, `WO_{X,ℚ}`) = 0 in the isogeny convention (some p^N kills H^i(X, WO_X)) if and only if H^i(X, WO_X) ⊗ ℚ = 0. (BBE07, Proposition 2.10 and its proof, pp. 16–17; GNT19, Remark 2.17 (5), p. 15).

X proper over a perfect field; no smoothness.

*Needs:* §0.1; §0.2 (the isogeny convention, for the comparison); JacobianChallenge Layer C, coherent higher direct images under proper morphisms (finiteness of H^i(X, O_X) for X proper); CrystallineCohomology §CR.4.7, *Slope decomposition on the existing isocrystal carrier*; CrystallineCohomology §CR.4.4, *Finite-length Witt operators and their identities*; Mathlib `WittVector.Isocrystal`.

A proof route is the following.

1. H^i(X, W_nO_X) are W_n(k)-modules of finite length, so H^i(X, WO_X) = lim_n H^i(X, W_nO_X) (§0.1); V makes M a V-adically separated complete R-module.
2. M/VM injects into H^i(X, O_X), which is finite-dimensional (JacobianChallenge Layer C); so M is finitely generated over R and torsion as an R-module: there are nonzero a_1(V), …, a_r(V) ∈ R with ⊕ R/Ra_i(V) ↠ M.
3. Factor each a_i(V), after inverting p, as a unit times a monic V-polynomial b_i(V) = `b_{i,0}` + ⋯ + V^ℓ with p | `b_{i,j}` (a Weierstrass-type factorization in the noncommutative ring, built p-adically); then R/Rb_i(V) ≅ W^ℓ, giving finiteness of M_K.
4. M_K is a quotient of a finite W-module after inverting p, so F has slopes ≥ 0 (slopes in the sense of the Dieudonné–Manin decomposition, CrystallineCohomology §CR.4.7, *Slope decomposition on the existing isocrystal carrier*); FV = VF = p gives slopes ≤ 1; topological nilpotence of V excludes slope 1.
5. Comparison of the rationalizations: by §0.2, H^i(X, `WO_{X,ℚ}`) is the image q(H^i(X, WO_X)) of the abelian group in the Serre quotient, which is zero iff a nonzero integer kills H^i(X, WO_X), iff (Witt-module coefficients) a power of p kills it. If H^i(X, WO_X) ⊗ ℚ = 0 the group is torsion, and its torsion is killed by a single power of p, so q of it is zero; the converse is immediate.

**Checks.**

- For X proper, the non-proper phenomenon of the Check in §0.2 (`⊕_{n≥1}` ℤ/p^n, zero after ⊗ℚ but not killed by one power of p) cannot occur: for X = P¹, H¹(P¹, WO) = 0 in both conventions; for a supersingular elliptic curve E, H¹(E, WO_E) ≅ W(k)² is torsion-free and nonzero in both.
- H^1(E, WO_E)_K is one-dimensional of slope 0 for an ordinary elliptic curve E and two-dimensional of slope 1/2 for a supersingular one (H^1(E, WO_E) is the Dieudonné module of the formal group of E, of height 1 resp. 2).
- For X smooth proper, H^i(X, WO_X)_K is the slope-[0,1) part of H^i_crys(X/W)_K (CrystallineCohomology §CR.4.7, *Degree filtration and the slope spectral sequence*).

### Examples

- W_n(Spec F_p) = Spec ℤ/p^n and WO(Spec F_p) has global sections ℤ_p.
- For the constant sheaf `⊕_{n≥1}` ℤ/p^n on a point, the tensor rationalization is 0 but the isogeny rationalization is not.
- For a perfect F_p-algebra A, W(A)[1/F] = W(A).
- For X = Spec k[ε]/(ε²), W(k[ε]/(ε²)) ≠ W(k) but H^0(X, `WO_{X,K}`) = K = H^0(Spec k, WO_K).
- Spec `F_{q²}` → Spec F_q is finite surjective with connected fibre but W(F_q)_ℚ → `W(F_{q²})_ℚ` is not an isomorphism: its fibre is not geometrically connected.
- For two lines meeting at a point in A², H^0 of WO_K of the union is the fibre product of W(k[x])_K and W(k[y])_K over K.
- For a resolution f of a normal S with rational singularities, R^if_\*O_X = 0 for i > 0 gives R^if_\*WO_X = 0 and hence WO-rationality of the target (§5.9).
- H^1(E, WO_E)_K is one-dimensional of slope 0 for an ordinary elliptic curve E and two-dimensional of slope 1/2 for a supersingular one (H^1(E, WO_E) is the Dieudonné module of the formal group of E, of height 1 resp. 2).

### Dependencies

CrystallineCohomology §CR.4.4, *Finite-length Witt operators and their identities*; CrystallineCohomology §CR.4.6, *Classical de Rham–Witt complex as the initial V-pro-complex*; CrystallineCohomology §CR.4.6, *Witt localization and étale descent*; Tau Ceti `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler`, `TauCeti.ModuleTower.isMittagLeffler_of_surjective` and `TauCeti.ModuleTower.isMittagLeffler_of_isArtinian`; EnhancedDerivedSheaves §E1.3, `enhancedDerived`; CrystallineCohomology §CR.4.6, *Witt schemes on locally p-nilpotent schemes*; §0.1; §0.8; §0.2; §0.3; §0.4; SchemeAndStackFoundations §0.26, qcqs Frobenius factorization (gap:qcqs-frobenius-factorization); SchemeAndStackFoundations §0.23, universal homeomorphisms; SchemeAndStackFoundations §4.9, `stein_factorization`; SchemeAndStackFoundations §2.6, `qcoh_higherDirectImages`; SchemeAndStackFoundations §2.6, `proper_fibreDimension_vanishing`; SchemeAndStackFoundations §2.5, `noetherianSpace_vanishing`; JacobianChallenge Layer C, coherent higher direct images under proper morphisms; CrystallineCohomology §CR.4.7, *Slope decomposition on the existing isocrystal carrier*.



## Layer 1: h-descent for Frobenius-inverted Witt vector cohomology

Bhatt and Scholze show that Frobenius-inverted Witt vector cohomology is a sheaf for the h-topology, which recovers and strengthens the descent statements of Berthelot–Bloch–Esnault. The proof checks the criterion of the h-topology — fppf descent plus excision along abstract blowup squares — but excision has to hold for all self-products of the blowup and all their base changes, and those are only well behaved as derived schemes; inverting Frobenius kills the derived structure. One step of the source, the replacement of the base by a pushout along the exceptional divisor, is not justified there (the pushout of a blowup square along a non-finite map need not exist); the layer constructs it as an explicit finite universal homeomorphism.


### 1.1 Fppf descent for Witt vector cohomology

On qcqs F_p-schemes, the presheaves X ↦ RΓ(X, W_nO_X) (n ≥ 1), X ↦ RΓ(X, WO_X) and X ↦ RΓ(X, WO_X)[1/F] satisfy fppf descent: for every fppf cover {U_i → X} with Čech nerve U_•, the map RΓ(X, −) → Tot RΓ(U_•, −) is an equivalence of coconnective spectra. In particular, for an fppf map A → B of F_p-algebras with Čech nerve B^•, W_n(A) → Tot W_n(B^•), W(A) → Tot W(B^•) and W(A)[1/F] → Tot W(B^•)[1/F] are equivalences. (BS17, proof of Proposition 11.41, second paragraph, p. 53).

qcqs F_p-schemes; values are coconnective (complexes in cohomological degrees ≥ 0).

*Needs:* §0.1; §0.3; EnhancedDerivedSheaves §E5:descent, `moduleDescent`; EnhancedDerivedSheaves §E5:animation.3, `tot_filteredColimit_of_bounded`; EnhancedDerivedSheaves §E2.8, `descendableCover_fppf`.

A proof route is the following.

1. For W_n: induction on n using 0 → `F^{n−1}_*O` `→(V^{n−1})` W_nO → `W_{n−1}O` → 0, where the kernel is O_X viewed through the (n−1)-st Frobenius, a quasi-coherent sheaf, so fpqc descent for quasi-coherent cohomology applies (EnhancedDerivedSheaves §E2.8, `descendableCover_fppf`; EnhancedDerivedSheaves §E5:descent, `moduleDescent`).
2. For W = lim W_n, exchange the limit over n with the totalization.
3. For [1/F]: the values are coconnective, so π_k of a totalization is computed by a finite partial totalization (EnhancedDerivedSheaves §E5:animation.3, `tot_filteredColimit_of_bounded`); hence totalization commutes with the sequential colimit inverting F, and it suffices to check descent on affines before inverting F.

**Checks.**

- For the fppf cover Spec `F_{p²}` → Spec F_p, W(F_p) = ℤ_p is the equalizer of the two maps `W(F_{p²})` ⇉ `W(F_{p²} ⊗ F_{p²})`.


### 1.2 Frobenius-inverted Witt cohomology of derived self-products

Let Y = Spec A be an affine F_p-scheme, let X_1, …, X_m (m ≥ 1) be qcqs Y-schemes, and let T = X_1 ×^L_Y ⋯ ×^L_Y X_m be their iterated derived fibre product (EnhancedDerivedSheaves §E2.8, `derivedSchemeBaseChange`), with classical truncation T_cl = X_1 ×_Y ⋯ ×_Y X_m and closed immersion i: T_cl → T, a homeomorphism. Let W(O_T)[1/F] be the sheaf on T obtained by applying the simplicial Witt vector functor (EnhancedDerivedSheaves §E5:animation.2, `simplicialWitt`) to the structure sheaf of animated rings of T and inverting the Witt Frobenius. Then pullback along i is an equivalence of sheaves W(O_T)[1/F] ≅ `i_*W(O_{T_cl})[1/F]`, and hence an equivalence RΓ(T, W(O_T)[1/F]) ≅ RΓ(T_cl, WO)[1/F], natural in the X_j over Y: Frobenius-inverted Witt cohomology does not see the derived structure. (BS17, Notation 11.42 and Lemma 11.43 with proof, p. 52; BS17, proof of Lemma 11.45, case n = 2, p. 53).

Y affine; X_1, …, X_m qcqs over Y, so T_cl is qcqs. For m = 1, T = X_1 is classical and the comparison is the identity.

*Needs:* §0.3; EnhancedDerivedSheaves §E2.8, `derivedSchemeBaseChange`; EnhancedDerivedSheaves §E5:animation.1, animated commutative rings; EnhancedDerivedSheaves §E5:animation.2, `simplicialWitt` and `wittFrobeniusLocalization`.

A proof route is the following.

1. The affine opens of T form a basis of its underlying space, which is that of T_cl. On a product of affine opens Spec B_j ⊂ X_j the chart is Spec R with R = B_1 ⊗^L_A ⋯ ⊗^L_A B_m, and π_0R = B_1 ⊗_A ⋯ ⊗_A B_m is the coordinate ring of the corresponding affine open of T_cl (EnhancedDerivedSheaves §E2.8, `derivedSchemeBaseChange`; EnhancedDerivedSheaves §E5:animation.1, π_0 of a derived tensor product is the ordinary one); the same holds for the basic opens of these charts.
2. On such a chart Spec R, pullback along i is W(R) → W(π_0R), which becomes an equivalence after inverting F (EnhancedDerivedSheaves §E5:animation.2, `wittFrobeniusLocalization`: π_0W(R) = W(π_0R), and F kills π_iW(R) = ∏_ℕ π_iR for i > 0). A map of sheaves that is an equivalence on a basis of opens is an equivalence. Apply RΓ, and identify the classical side with RΓ(T_cl, WO)[1/F] by §0.3, T_cl being qcqs.

**Checks.**

- For A = k[t] and X_1 = X_2 = Spec k (t ↦ 0), the chart ring `R = k ⊗^L_{k[t]} k` has π_0R = k and `π_1R = Tor_1^{k[t]}(k, k) = k`, so T is not classical. Here π_1W(R) = ∏_ℕ k, killed by F, and both sides of the comparison are W(k) in degree 0.
- Before inverting F the comparison fails on the same example: the fibre of W(R) → W(π_0R) has π_1 = ∏_ℕ k ≠ 0, so W(O_T) and `W(O_{T_cl})` differ. This group is killed by p, so it also dies when p alone is inverted.
- For m = 2 with X_1 → Y flat (for instance X_1 = A¹_Y), all positive Tor groups vanish, T = T_cl, and the comparison is the identity already before inverting F. For m = 3, flatness of X_1 alone does not suffice: with X_2 = X_3 = Spec k over k[t] as above, X_1 ×_Y (X_2 ×^L_Y X_3) still has π_1 ≠ 0.


### 1.3 The finite pushout replacing a blowup square

Let Y = Spec A be a noetherian affine F_p-scheme, J ⊂ A an ideal with Z = V(J), and π: X = Bl_J Y → Y the blowup with exceptional divisor E = V(JO_X), where JO_X = O_X(−E) is π-ample. After replacing J by a suitable power (thickening E and Z) one has H^i(X, O_X(−E)) = 0 for i > 0. Put B′ := H^0(X, O_X) `×_{H^0(E, O_E)}` A/J and Y′ := Spec B′, with the maps X → Y′ and Z → Y′ induced by the projections. Then: (i) B′ is a finite A-algebra and Y′ → Y is a finite universal homeomorphism; (ii) B′ → A/J is surjective with kernel K = H^0(X, JO_X), KO_X = JO_X, and E = X `×_{Y′}` Z; (iii) Y′ is the pushout X ⊔_E Z in ringed spaces; (iv) RΓ(Y′, O) → RΓ(X, O) ⊕ RΓ(Z, O) → RΓ(E, O) is a fibre sequence. (BS17, proof of Proposition 11.41, third paragraph, p. 53; BS17, proof of Proposition 11.41, last paragraph, pp. 53–54).

Y noetherian affine of characteristic p; J an ideal; the thickening is chosen with H^i(X, O_X(−E)) = 0 for i > 0 (Serre vanishing for the relatively ample O_X(−E)). E → Z is proper but in general not finite, so the pushout is not a Ferrand pinching; the explicit B′ supplies it.

*Needs:* SchemeAndStackFoundations §2.6, `ample_serre_vanishing`; SchemeAndStackFoundations §0.23, universal homeomorphisms; SchemeAndStackFoundations §4.12, `modification_domination`; JacobianChallenge Layer C, coherent higher direct images under proper morphisms; Mathlib `AlgebraicGeometry.IsFinite`.

The construction has the following API.

- Given Y = Spec A noetherian of characteristic p and J ⊂ A with `H^{>0}(Bl_J Y, JO)` = 0, the affine scheme Y′ = Spec(H^0(X, O_X) `×_{H^0(E, O_E)}` A/J).
- The map Y′ → Y is finite and a universal homeomorphism, an isomorphism over Y ∖ Z.
- E = X `×_{Y′}` Z: the square E → X, E → Z, X → Y′, Z → Y′ is Cartesian.
- Y′ is the pushout of X ← E → Z in locally ringed spaces.
- RΓ(Y′, O) → RΓ(X, O) ⊕ RΓ(Z, O) → RΓ(E, O) is a fibre sequence.
- There is n with H^i(Bl_J Y, J^nO) = 0 for all i > 0.

A proof route is the following.

1. X = Bl_J Y is the blowup (blowups and modifications: SchemeAndStackFoundations §4.12, `modification_domination`). Serre vanishing: O_X(−E) is π-ample, so H^i(X, O_X(−nE)) = 0 for i > 0 and n ≫ 0 (SchemeAndStackFoundations §2.6, `ample_serre_vanishing`); replace J by J^n.
2. (i) H^0(X, O_X) is finite over A (proper pushforward of coherent sheaves, JacobianChallenge Layer C), hence so is B′. B′ → A/J is surjective with kernel K = H^0(X, JO_X); for s ∈ K, s^m ∈ H^0(X, J^mO_X), the image of J^m for m ≫ 0 (X = Bl_J Y), so K ⊂ √(JB′); and B′_j = A_j for j ∈ J. Thus Y′ → Y is bijective on points with trivial residue extensions, finite, hence a universal homeomorphism (SchemeAndStackFoundations §0.23, universal homeomorphisms).
3. (ii) KO_X = JO_X because J ⊂ K ⊂ H^0(X, JO_X); hence E = X `×_{Y′}` Z.
4. (iii) and (iv): H^0 of the square is left exact by construction of B′ and right exact because H^0(X, O_X) → H^0(E, O_E) is surjective (H^1(X, O_X(−E)) = 0); in positive degrees H^i(X, O_X) ≅ H^i(E, O_E) and Y′, Z are affine.

**Checks.**

- If J = (f) with f a nonzerodivisor, the blowup is the identity, E = Z, and B′ = A `×_{A/J}` A/J = A, so Y′ = Y.
- If π is finite, Y′ agrees with the Ferrand pinching of X along E → Z (NeronModelsAndSemistableAbelianVarietiesPartII §1.1, Ferrand geometric pushouts).
- For Y = A²_k, J = (x, y): X = Bl_0 A², E ≅ P¹, H^0(X, O_X) = k[x, y], H^0(E, O_E) = k, and B′ = k[x, y] ×_k k = k[x, y], so Y′ = Y.
- The pushout of X ← E → Z in schemes is not given by Ferrand's theorem when E → Z is not finite (E = P¹ → Z = point above); B′ is defined directly instead.
- When Z is a point of a surface Y, the construction recovers a finite universal homeomorphism Y′ → Y that is an isomorphism away from Z.

These results apply to BS17, proof of Proposition 11.41, p. 53: replaces Y by Y′ so that Lemma 11.45 applies to a square whose structure-sheaf cohomology is a fibre sequence; §1.5: the inductive step on dim Y.


### 1.4 Excision for Frobenius-inverted Witt cohomology along abstract blowup squares

Let E → X, E → Z, X → Y, Z → Y be a Cartesian square of qcqs F_p-schemes with Y = Spec A affine and i: Z → Y a constructible closed immersion, and assume RΓ(Y, O_Y) → RΓ(X, O_X) ⊕ RΓ(Z, O_Z) → RΓ(E, O_E) is a fibre sequence. For n ≥ 1 let `X^{n/Y}` be the n-fold fibre product of X over Y and `E^{n/Y}` = `X^{n/Y}` ×_Y Z (the n-fold fibre product of E over Z). Then for every qcqs Y-scheme T and every n ≥ 1, RΓ(T, W(O)[1/F]) → RΓ(`X^{n/Y}` ×_Y T, W(O)[1/F]) ⊕ RΓ(Z ×_Y T, W(O)[1/F]) → RΓ(`E^{n/Y}` ×_Y T, W(O)[1/F]) is a fibre sequence; here `E^{n/Y}` ×_Y T is the n-fold fibre product of E ×_Y T over Z ×_Y T. For T = Y this is RΓ(Y, W(O)[1/F]) → `RΓ(X^{n/Y}, W(O)[1/F])` ⊕ RΓ(Z, W(O)[1/F]) → `RΓ(E^{n/Y}, W(O)[1/F])`, and for T = Y and n = 1 the sequence is already a fibre sequence before inverting F. (BS17, Lemma 11.45 and its proof, pp. 52–53, for T = Y; the base change to T is the same tensor argument with T as one more factor, route step 5.)

Y affine; Z → Y constructible closed immersion; T any qcqs Y-scheme. The structure-sheaf fibre sequence is a hypothesis on the square over Y only: its base change to T need not satisfy it, and T may have larger dimension than Y. Fibre products `X^{n/Y}` ×_Y T are classical; derived fibre products appear only in the proof.

*Needs:* §1.2; §0.1; §0.3; EnhancedDerivedSheaves §E1.4, tensor and derived functors; EnhancedDerivedSheaves §E2.8, `derivedSchemeBaseChange`; SchemeAndStackFoundations §2.18, `projectionFormula`.

A proof route is the following.

1. n = 1: W = Rlim W_m, and each W_m is an m-fold iterated extension of Frobenius-twisted copies of O, so the structure-sheaf fibre sequence gives the W-sequence.
2. Over the affine Y, coherent cohomology commutes with derived base change: for qcqs Y-schemes X_1, …, X_r, RΓ(X_1 ×^L_Y ⋯ ×^L_Y X_r, O) ≅ RΓ(X_1, O) ⊗^L_A ⋯ ⊗^L_A RΓ(X_r, O). By induction on r: with P the derived fibre product of the first r − 1 factors, f: P → Y and g: X_r → Y, derived base change (EnhancedDerivedSheaves §E2.8, `derivedSchemeBaseChange`) identifies the pushforward of O along P ×^L_Y X_r → X_r with Lg^\*Rf_\*O_P, where Rf_\*O_P is the quasi-coherent complex on Spec A attached to RΓ(P, O); the projection formula for g (SchemeAndStackFoundations §2.18, `projectionFormula`) gives RΓ(X_r, Lg^\*Rf_\*O_P) ≅ RΓ(P, O) ⊗^L_A RΓ(X_r, O).
3. n = 2: tensor the structure-sheaf sequence over A = RΓ(Y, O) with RΓ(X, O) (EnhancedDerivedSheaves §E1.4, tensor and derived functors); by step 2 this is the structure-sheaf sequence of X ← X ×^L_Y X, Z ×^L_Y X ← E ×^L_Y X; apply the n = 1 argument and then remove the derived structure after inverting F (§1.2), and compare with the n = 1 sequence.
4. n ≥ 3: induction on n. Tensoring the structure-sheaf sequence with `RΓ(X, O)^{⊗(n−1)}`, which is RΓ of the derived (n − 1)-fold self-product of X over Y by step 2, and arguing as for n = 2 gives the fibre sequence `RΓ(X^{n−1/Y})` → `RΓ(X^{n/Y})` ⊕ `RΓ(E^{n−1/Y})` → `RΓ(E^{n/Y})` of Frobenius-inverted Witt cohomology, since Z ×_Y `X^{n−1/Y}` = `E^{n−1/Y}`; paste it with the sequence for n − 1.
5. Base change to T. With the conventions `X^{0/Y}` = Y and `E^{0/Y}` = Z, tensor the structure-sheaf sequence over A with RΓ(T, O_T) ⊗^L_A `RΓ(X, O)^{⊗(n−1)}` for n ≥ 1. By step 2, with the factors T, X, …, X, this is the structure-sheaf sequence of the square of derived schemes whose corners are the derived fibre products over Y of T and n − 1 copies of X with Y, with X, with Z and with E; their classical truncations are `X^{n−1/Y}` ×_Y T, `X^{n/Y}` ×_Y T, `E^{n−1/Y}` ×_Y T and `E^{n/Y}` ×_Y T. Apply the n = 1 argument of step 1 to this derived square, remove the derived structure after inverting F (§1.2 over the affine Y, with the factors T, X, …, X and Z or E), and obtain, writing F(−) = RΓ(−, W(O)[1/F]) as in §1.5, the fibre sequence `F(X^{n−1/Y} ×_Y T)` → `F(X^{n/Y} ×_Y T)` ⊕ `F(E^{n−1/Y} ×_Y T)` → `F(E^{n/Y} ×_Y T)`. For n = 1 this is the assertion; for n ≥ 2 paste it with the assertion for n − 1, as in step 4.

**Checks.**

- For X → Y a closed cover Y = X ∪ Z (disjoint union X ⊔ Z → Y), the sequence is the Mayer–Vietoris sequence.
- For Y = A¹_k = Spec k[t] and X_1 = X_2 = Spec k at t = 0, step 2 gives `RΓ = k ⊗^L_{k[t]} k`, with cohomology k in degrees −1 and 0, whereas the classical fibre product Spec k has RΓ = k in degree 0. Tensoring a structure-sheaf sequence over A produces the derived self-products, which is why §1.2 is needed before comparing with the classical `X^{n/Y}`.
- For T = Z the base-changed sequence, with F(−) = RΓ(−, W(O)[1/F]), is F(Z) → `F(E^{n/Y})` ⊕ F(Z) → `F(E^{n/Y})`, whose second component of the first map is the identity of F(Z); it is a fibre sequence for every square, so the base change to T = Z carries no information, while T = Y recovers the case of BS17.
- For Y = A²_k, Z the origin, X = Bl_0 A² with E ≅ P¹, and T = X (here H¹(X, O_X(−E)) = 0 already, and the pushout of §1.3 is Y itself): X ×_Y T is reduced, given in a chart by k[x, v_1, v_2]/(x(v_1 − v_2)), the union of the diagonal copy of X and of E × E ≅ P¹ × P¹ meeting along the diagonal of E, while Z ×_Y T = E and E ×_Y T = E × E. It is not a blowup of the integral scheme T, being reducible, and dim T = dim Y. With K-coefficients, H^i(X, WO_K) = 0 for i > 0 (§0.7 (2), since H^i(X, O_X) = 0) and RΓ(E × E, WO_K) = RΓ(E, WO_K) = K in degree 0, so Mayer–Vietoris (§0.6) gives RΓ(X ×_Y T, WO_K) = fib(RΓ(X, WO_K) ⊕ K → K) ≅ RΓ(X, WO_K); the case n = 1 of the base-changed sequence reads RΓ(X, WO_K) → RΓ(X, WO_K) ⊕ K → K, with first component an isomorphism and K → K the identity, a fibre sequence, as the statement predicts after inverting p.


### 1.5 h-descent for Frobenius-inverted Witt vector cohomology

Let S be a noetherian F_p-scheme of finite Krull dimension. The functor X ↦ RΓ(X, WO_X)[1/F] on the category Sch^fp_S of finitely presented S-schemes is a sheaf of spectra for the h-topology: for every h-cover X → Y in Sch^fp_S with Čech nerve `X^{•/Y}`, RΓ(Y, WO)[1/F] ≅ Tot `RΓ(X^{•/Y}, WO)[1/F]`. (BS17, Proposition 11.41, p. 51, and its proof, pp. 53–54; BS17, §2, Definition 2.5, Lemma 2.6, Theorem 2.9, Lemma 2.10, pp. 5–8).

S noetherian of finite Krull dimension; the h-topology on Sch^fp_S is that of ArcTopologyAndDescent §1.3, generated by finite families whose disjoint union is a v-cover. The pushout Y′ used in the inductive step is the finite universal homeomorphism of §1.3.

*Needs:* §0.3; §0.5; §1.1; §1.3; §1.4; ArcTopologyAndDescent §1.1, universal descent for a scheme presheaf; ArcTopologyAndDescent §1.3, h-site and abstract blowup squares; ArcTopologyAndDescent §1.6, affine approximation of v-covers; PrismaticCohomology §2.0, finite-presentation refinement of v-covers; SchemeAndStackFoundations §4.12, `generic_flatness` and `flattening_by_blowup` (gap:reduced-flattening-by-blowup); SchemeAndStackFoundations §0.26, qcqs Frobenius factorization (gap:qcqs-frobenius-factorization).

A proof route is the following.

1. Write F(X) = RΓ(X, WO_X)[1/F]. F inverts finite universal homeomorphisms, in particular nilimmersions (§0.5), and is an fppf sheaf (§1.1).
2. The route follows the proof of BS17 Theorem 2.9 rather than applying an abstract-blowup criterion, because excision is needed for every self-product of the blowup and for every base change of it. By Rydh refinement (PrismaticCohomology §2.0, applied on affine opens as in ArcTopologyAndDescent §1.6) and the composition and cancellation laws of universal descent (ArcTopologyAndDescent §1.1; BS17 Lemma 2.10), it suffices that every proper surjective X → Y in Sch^fp_S with Y affine is of universal F-descent. Prove this by induction on d: every proper surjective X → Y in Sch^fp_S with Y affine of dimension ≤ d is of universal F-descent. Base change along the nilimmersion Y_red → Y does not change this property: for every T → Y in Sch^fp_S, the maps T ×_Y Y_red → T and `X^{n/Y}` ×_Y T ×_Y Y_red → `X^{n/Y}` ×_Y T are nilimmersions, which F inverts. So Y may be taken reduced; for d = 0 it is then a finite disjoint union of spectra of fields, over which X → Y is a proper fppf cover, of universal F-descent by §1.1, fppf covers being stable under base change.
3. In the inductive step (Y reduced, affine and Noetherian of dimension d ≥ 1), choose a dense open U ⊂ Y over which X → Y is flat and a U-admissible blowup Y_1 = Bl_J Y → Y, with V(J) ⊂ Y ∖ U, such that the strict transform X_1 of X is flat over Y_1 (generic flatness and flattening by blowing up, SchemeAndStackFoundations §4.12, over the reduced but possibly reducible Y: gap:reduced-flattening-by-blowup; BS17, proof of Lemma 2.6, p. 5). Since U is dense, V(J) contains no irreducible component of Y, so Z := V(J) has dim Z \< d. X_1 → Y_1 is proper and flat, and surjective because its image is closed and contains the dense preimage of U; so it is a proper fppf cover, of universal F-descent by §1.1. The composite X_1 → Y_1 → Y factors through X. By the composition and cancellation laws (ArcTopologyAndDescent §1.1) it suffices that the blowup b: Y_1 → Y is of universal F-descent: then X_1 → Y is, hence so is X → Y. Fix T → Y in Sch^fp_S; it remains to show that the base change b_T: Y_1 ×_Y T → T is of F-descent. Since `Bl_{J^m} Y` = Bl_J Y, J may be replaced by a power; after this thickening, with exceptional divisor E over Z = V(J), H^i(Y_1, O(−E)) = 0 for i > 0 and dim Z \< d still. Let Y′ → Y be the finite universal homeomorphism of §1.3 (with Y_1 in the role of its X) and T′ = T ×_Y Y′. Then T′ → T is a finite universal homeomorphism, `Y_1 ×_{Y′} T′` = Y_1 ×_Y T, and `Y_1^{n/Y′} ×_{Y′} T′` → `Y_1^{n/Y} ×_Y T` is a nilimmersion for every n (Y′ → Y is radicial and separated, so its diagonal is a surjective closed immersion). As F inverts both kinds of map (§0.5), b_T is of F-descent iff `Y_1 ×_{Y′} T′` → T′ is.
4. The square E → Y_1, E → Z, Y_1 → Y′, Z → Y′ is Cartesian, Y′ is affine and the structure-sheaf sequence of the square is a fibre sequence (§1.3 (ii), (iv)). By induction, E → Z (proper surjective, Z affine of dimension \< d) is of universal F-descent; its base change along `Z ×_{Y′} T′` → Z gives `F(Z ×_{Y′} T′)` ≅ Tot `F(E^{•/Y′} ×_{Y′} T′)`. §1.4 over Y′, applied to the Y′-scheme T′, gives fibre sequences F(T′) → `F(Y_1^{n/Y′} ×_{Y′} T′)` ⊕ `F(Z ×_{Y′} T′)` → `F(E^{n/Y′} ×_{Y′} T′)`, natural in n. As in the proof of BS17 Theorem 2.9, the limit over n is a pullback square whose lower map is the equivalence just obtained, so F(T′) ≅ Tot `F(Y_1^{•/Y′} ×_{Y′} T′)`. Hence b_T is of F-descent for every T, and b is of universal F-descent. The induction is applied only to E → Z, never to T, whose dimension may exceed d.

**Checks.**

- For a closed cover Y = Y_1 ∪ Y_2, descent along Y_1 ⊔ Y_2 → Y recovers the Mayer–Vietoris sequence of §0.6 after inverting p.
- For the normalization of a nodal curve, descent expresses F(Y) through the normalization and the preimage of the node: two k-points for a split node, one point with residue field the quadratic extension k′ of k for a nonsplit node.
- For Y = Spec k[x, y]/(xy), two lines meeting in a point, and X → Y the disjoint union of the two lines, X → Y is flat over the complement U of the point, and the U-admissible blowup of Y at the point is X itself, so step 3 applies with X_1 = Y_1 = X and Z the point. Y is reduced but not integral, which is why step 3 needs flattening over reducible bases.
- Negative control for an induction on plain descent: for Y = A²_k, b: Y_1 = Bl_0 A² → Y and T = Y_1, the base change b_T is not a blowup of T (Y_1 ×_Y T is reducible, with the component E × E ≅ P¹ × P¹ over E), and dim T = dim Y = 2, so neither §1.3 over T nor the inductive hypothesis reaches it. Step 3 instead uses §1.3 over Y and §1.4 over Y′ with T′ as base change; the last Check of §1.4 computes this instance.


### 1.6 Rational Witt vector cohomology is an h-sheaf

Let S be a noetherian F_p-scheme of finite Krull dimension. Then X ↦ RΓ(X, WO_X)[1/p] is an h-sheaf of spectra on Sch^fp_S. In particular, for a proper surjective map f: X → Y of finite type k-schemes (k perfect) whose Čech nerve is `X^{•/Y}`, there is a convergent descent spectral sequence `E_1^{a,b}` = `H^b(X^{a+1/Y}, WO)_K` ⇒ `H^{a+b}(Y, WO)_K`. (BS17, Theorem 11.40 and the sentence after Proposition 11.41, p. 51; BBE07, Theorem 2.4 and Proposition 3.2, pp. 9, 18).

S noetherian of finite Krull dimension.

*Needs:* §1.5; §0.3; EnhancedDerivedSheaves §E5:animation.3, `tot_filteredColimit_of_bounded`.

A proof route is the following.

1. F is invertible after inverting p (FV = VF = p), so RΓ(X, WO_X)[1/p] = (RΓ(X, WO_X)[1/F])[1/p] (§0.3).
2. Inverting p is a filtered colimit, which commutes with totalizations of uniformly coconnective cosimplicial spectra (EnhancedDerivedSheaves §E5:animation.3, `tot_filteredColimit_of_bounded`); apply §1.5.
3. For a k-scheme of finite type, cohomology commutes with ⊗ℚ (noetherian), giving the spectral sequence with K-coefficients.

**Checks.**

- For f: X ⊔ Z → Y with X, Z the two irreducible components of a nodal curve Y whose components are defined over k (for instance two lines meeting in a point), descent gives the Mayer–Vietoris sequence of §0.6.
- Agreement with Berthelot–Bloch–Esnault's descent for proper hypercoverings (§2.6) in the range where both apply.

### Examples

- For the fppf cover Spec `F_{p²}` → Spec F_p, W(F_p) = ℤ_p is the equalizer of the two maps `W(F_{p²})` ⇉ `W(F_{p²} ⊗ F_{p²})`.
- For A = k[t], B = B′ = A/(t), the derived tensor product has π_1 = k (Tor_1) but W(k[t]/(t) ⊗^L k[t]/(t))[1/F] = W(k)[1/F] = W(k).
- When Z is a point of a surface Y, the construction recovers a finite universal homeomorphism Y′ → Y that is an isomorphism away from Z.
- For X → Y a closed cover Y = X ∪ Z (disjoint union X ⊔ Z → Y), the sequence is the Mayer–Vietoris sequence.
- For a closed cover Y = Y_1 ∪ Y_2, descent along Y_1 ⊔ Y_2 → Y recovers the Mayer–Vietoris sequence of §0.6 after inverting p.
- For f: X ⊔ Z → Y with X, Z the two irreducible components of a nodal curve Y whose components are defined over k (for instance two lines meeting in a point), descent gives the Mayer–Vietoris sequence of §0.6.

### Dependencies

§0.1; §0.3; EnhancedDerivedSheaves §E5:descent, `moduleDescent`; EnhancedDerivedSheaves §E5:animation.3, `tot_filteredColimit_of_bounded`; EnhancedDerivedSheaves §E2.8, `descendableCover_fppf`; EnhancedDerivedSheaves §E5:animation.1, animated commutative rings; EnhancedDerivedSheaves §E5:animation.2, `simplicialWitt` and `wittFrobeniusLocalization`; EnhancedDerivedSheaves §E2.8, `derivedSchemeBaseChange`; EnhancedDerivedSheaves §E1.4, tensor and derived functors; SchemeAndStackFoundations §2.18, `projectionFormula`; SchemeAndStackFoundations §2.6, `ample_serre_vanishing`; SchemeAndStackFoundations §0.23, universal homeomorphisms; SchemeAndStackFoundations §4.12, `modification_domination`; JacobianChallenge Layer C, coherent higher direct images under proper morphisms; §1.2; §0.5; §1.1; §1.3; §1.4; ArcTopologyAndDescent §1.1, universal descent for a scheme presheaf; ArcTopologyAndDescent §1.3, h-site and abstract blowup squares; ArcTopologyAndDescent §1.6, affine approximation of v-covers; PrismaticCohomology §2.0, finite-presentation refinement of v-covers; SchemeAndStackFoundations §4.12, `generic_flatness` and `flattening_by_blowup` (gap:reduced-flattening-by-blowup); SchemeAndStackFoundations §0.26, qcqs Frobenius factorization (gap:qcqs-frobenius-factorization); §1.5.



## Layer 2: Witt vector cohomology with compact supports

Compactly supported Witt vector cohomology of a separated k-scheme of finite type U is the Witt cohomology of the ideal sheaf of the boundary in a compactification. It is independent of the compactification because of a vanishing theorem: higher direct images of Witt ideal sheaves along proper maps that are finite (or isomorphisms) away from the ideal are killed by a power of p. The same vanishing yields the reduction of higher direct images of WO to the exceptional locus, which is how the WO-rationality of singularities is checked in practice, and descent along proper hypercoverings that are étale over a dense open.


### 2.1 Vanishing of higher direct images of Witt ideal sheaves

Let f: X′ → X be a proper morphism of schemes of finite type over a perfect field k, I ⊂ O_X a coherent ideal, I′ = `IO_{X′}`, U = X ∖ V(I) and U′ = `f^{−1}(U)`. (i) If `R^qf_*O_{U′}` = 0 on U for all q ≥ 1 (for instance if U′ → U is finite, or an isomorphism), then there is c ≥ 0 such that p^c kills R^qf_\*(WI′) for every q ≥ 1; hence R^qf_\*(WI′_ℚ) = 0 and R^qf_\*(WI′_K) = 0 for q ≥ 1. (ii) If U′ → U is an isomorphism, then kernel and cokernel of WI → f_\*(WI′) are killed by a power of p, so WI_K ≅ f_\*(WI′_K) and RΓ(X, WI_K) ≅ RΓ(X′, WI′_K); the same holds in the isogeny convention. (iii) For every coherent ideal I_1 ⊂ `O_{X′}` with √I_1 = √I′, the conclusions of (i) hold for W(I_1). (BBE07, Theorem 2.4, Lemmas 2.5–2.7 and 2.8 (proof of Theorem 2.4), pp. 9–14; CR12, Proposition 4.6.1, Lemmas 4.6.2–4.6.3 and proof, pp. 89–90; GNT19, Proposition 2.23 and proof, p. 18).

f proper between finite type k-schemes; I coherent; only the vanishing of R^qf_\*O over U is needed in (i). In (i) the constant c is uniform in q: the isogeny-convention statement, which is stronger than ⊗ℚ-vanishing.

*Needs:* §0.1; §0.2; §0.7; §0.4; AdicSpacesPartIII §F0.6, graded-cohomology-finiteness; SchemeAndStackFoundations §2.6, `qcoh_higherDirectImages`; JacobianChallenge Layer C, coherent higher direct images under proper morphisms; Mathlib `AlgebraicGeometry.IsProper`.

A proof route is the following.

1. Ideals `W_n^{r,s}(I)` = {a ∈ W_n : a_0 ∈ I^r, a_i ∈ I^s (i ≥ 1)} for s ≤ pr, with exact sequences 0 → `W_{n−1}(I^s)` →(V) `W_n^{r,s}(I)` `→(R^{n−1})` I^r → 0 (BBE Lemma 2.5), because the Witt addition polynomials restricted to Teichmüller-type vectors are homogeneous of degree p^i.
2. Uniform killing (BBE Lemma 2.7; CR12 Lemma 4.6.3): the R^qf_\*(I′^r) are coherent (JacobianChallenge Layer C, coherent higher direct images under proper morphisms), and ⊕_r R^qf_\*(I′^r) is a finite graded module over ⊕_r I^r (EGAIII1, Proposition 3.3.1, pp. 117–118; AdicSpacesPartIII §F0.6, graded-cohomology-finiteness), supported on V(I) because R^qf_\*O vanishes over U; hence there is a with `R^qf_*(I′^{r+a})` → R^qf_\*(I′^r) zero, and induction on n with the sequences above and the diagram lemma (if two outer maps vanish the composite vanishes) gives the same for W_n(I′^r), uniformly in n.
3. Frobenius F maps W_n(I′^r) into `W_n(I′^{pr})`; choosing p^c > a, F^c acts by zero on R^qf_\*(W_n(I′^r)) for all n and r ≥ 1, hence on lim_n and R¹lim_n of these, hence `F^{2c}` kills R^qf_\*(WI′) by the sequences of §0.7; since FV = p, `p^{2c}` kills it.
4. (ii): the same argument applied to the kernels and cokernels K_n^r, C_n^r of W_n(I^r) → f_\*W_n(I′^r), which are supported on V(I) and form lim-acyclic towers; §0.4 identifies W(I^r)_ℚ with WI_ℚ.
5. (iii) is §0.4 (ii).

**Checks.**

- For the blowup of the vertex of the affine cone over a canonically embedded non-hyperelliptic smooth projective curve C of genus at least 3, with I the vertex ideal, R¹f_\*(WI′)_ℚ = 0 but R¹f_\*(I′) contains H¹(C, ω_C) = k. For Bl_0 A² instead, R¹f_\*(I′^r) = `⊕_{m≥0}` H¹(P¹, O(m+r)) = 0 for every r ≥ 0.
- For a proper non-finite f whose restriction U′ → U is finite of degree 2, R^qf_\*(WI′_ℚ) = 0 for q ≥ 1.


### 2.2 Higher direct images of WO through the exceptional locus

Over a perfect field k, let f: X → Y be proper with X, Y separated of finite type, Y_0 ⊂ Y a closed subset such that R^qf_\*O_X = 0 over Y ∖ Y_0 for q ≥ 1 (for instance f an isomorphism over Y ∖ Y_0), and E = `f^{−1}(Y_0)` with any closed subscheme structure, u: E → X. Then 0 → `WI_{E,ℚ}` → `WO_{X,ℚ}` → `u_*WO_{E,ℚ}` → 0 is exact and `R^qf_*WO_{X,ℚ}` ≅ `R^q(f|_E)_*WO_{E,ℚ}` for all q ≥ 1, compatibly with F and V. If moreover Y_0 = {s} is a closed point, then `R^qf_*WO_{X,ℚ}` is the skyscraper sheaf H^q(E, `WO_{E,ℚ}`) at s. (CR12, Corollary 4.6.4 and its proof, p. 90; HW23, Corollary 4.6 and proof, p. 21 (arXiv v2); GNT19, Lemma 2.25, p. 18).

Proper f; the vanishing over Y ∖ Y_0 is a hypothesis; E with any scheme structure (§0.4).

*Needs:* §2.1; §0.4; §0.2; §0.8.

A proof route is the following.

1. W(O_X) → W(O_E) is surjective with kernel W(I_E), giving the exact sequence; `R^qf_*(WI_{E,ℚ})` = 0 for q ≥ 1 by §2.1 applied to the ideal I_E, whose radical equals that of the pullback of the ideal of Y_0.
2. u is a closed immersion, so R^qf_\*(u_\*WO_E) = R^q(f|_E)_\*WO_E; the long exact sequence gives the isomorphisms for q ≥ 1.
3. For Y_0 a closed point, sheaves supported at a closed point with closed image have vanishing higher pushforwards (GNT Lemma 2.25), and R^q(f|_E)_\* computes H^q(E, −) at s.

**Checks.**

- For a normal surface singularity with minimal resolution whose exceptional curve is a tree of smooth rational curves, `R¹f_*WO_{X,ℚ}` = H¹(E, `WO_{E,ℚ}`) = 0.
- For the cone over an elliptic curve E, blown up at the vertex, `R¹f_*WO_{X,ℚ}` = H¹(E, `WO_{E,ℚ}`) is nonzero: one-dimensional of slope 0 if E is ordinary, two-dimensional of slope 1/2 if E is supersingular.


### 2.3 Witt vector cohomology with compact supports

Fix k perfect of characteristic p, W = W(k), K = W[1/p], and a separated k-scheme U of finite type. Choose an open immersion U ⊂ X into a proper k-scheme (Nagata) and a coherent ideal I ⊂ O_X with V(I) = X ∖ U. Define RΓ_c(U, `WO_{U,K}`) := RΓ(X, WI_K) = RΓ(X, WI) ⊗ K and H^i_c(U, `WO_{U,K}`) its cohomology. Up to canonical isomorphism this is independent of X and I, and it carries a σ-semilinear Frobenius F and a `σ^{−1}-semilinear` V with FV = VF = p. It is contravariant for proper morphisms U′ → U, covariant for open immersions V ⊂ U, and for V ⊂ U open with closed complement T there is a distinguished triangle RΓ_c(V, `WO_{V,K}`) → RΓ_c(U, `WO_{U,K}`) → RΓ_c(T, `WO_{T,K}`) `→^{+1}`. There is a natural map RΓ_c(U, `WO_{U,K}`) → RΓ(U, `WO_{U,K}`), an isomorphism when U is proper. (BBE07, 2.9, (2.12)–(2.14), pp. 14–16; BBE07, Theorem 1.1 and introduction, pp. 2–3).

U separated of finite type over a perfect field. Independence uses the closure of U in X_1 ×_k X_2 for two compactifications and §2.1 (ii); the ideal I may be replaced by any ideal with the same radical.

*Needs:* §0.1; §0.2; §0.4; §2.1; EtaleCohomologyFoundations §G.2, `nagataCompactification`; Mathlib `AlgebraicGeometry.IsProper`; Mathlib `AlgebraicGeometry.IsSeparated`.

The construction has the following API.

- RΓ_c(U, `WO_{U,K}`) ∈ D^b(K) for U separated of finite type over k, with H^i_c.
- For any compactification U ⊂ X and coherent I with V(I) = X ∖ U, RΓ_c(U, `WO_{U,K}`) ≅ RΓ(X, WI) ⊗ K canonically.
- σ-semilinear F and `σ^{−1}-semilinear` V on H^i_c with FV = VF = p.
- Proper f: U′ → U induces f\*: RΓ_c(U) → RΓ_c(U′), with id\* = id and (g∘f)\* = f\*∘g\*.
- An open immersion j: V → U induces j_!: RΓ_c(V) → RΓ_c(U), functorial in composites of open immersions.
- For V ⊂ U open with complement T, a distinguished triangle RΓ_c(V) → RΓ_c(U) → RΓ_c(T) → , natural in (U, V).
- A natural map RΓ_c(U, `WO_{U,K}`) → RΓ(U, `WO_{U,K}`), an isomorphism for U proper.
- RΓ_c(U, `WO_{U,K}`) ≅ RΓ_c(U_red, `WO_{U_red,K}`).

A proof route is the following.

1. Independence: for two compactifications X_1, X_2, the closure X of the diagonal image of U in X_1 × X_2 maps properly to both, isomorphically over U; §2.1 (ii) and §0.4 give isomorphisms RΓ(X_i, `WI_{i,K}`) ≅ RΓ(X, WI_K), and the induced identifications satisfy the cocycle condition for three compactifications.
2. Functoriality: a proper U′ → U extends, after replacing X′ by the closure of the graph, to g: X′ → X with U′ = `g^{−1}(U)`, and g\* : RΓ(X, WI_K) → RΓ(X′, `W(IO_{X′})_K`) defines f\*; an open immersion V ⊂ U gives W(J) ⊂ W(I) for the ideal J of X ∖ V.
3. The excision triangle is the cohomology of 0 → WJ → WI → W(I/J) → 0, where I/J is the ideal of Z ∖ T in the compactification Z = V(J) of T.
4. Existence of compactifications: Nagata (EtaleCohomologyFoundations §G.2, `nagataCompactification`).

**Checks.**

- H^i_c(A¹_k, WO_K) = 0 for all i: from P¹ = A¹ ∪ {∞}, H^0(P¹, WO_K) = K → H^0(∞, WO_K) = K is an isomorphism and H^1(P¹, WO_K) = 0.
- H^1_c(G_m, WO_K) = K (from K → K² for the two boundary points), H^0_c = H^2_c = 0.
- For U proper, RΓ_c(U, `WO_{U,K}`) = RΓ(U, `WO_{U,K}`); for U = ∅ it is 0.
- For U = A¹_k, H^0(U, `WO_{U,K}`) = W(k[t]) ⊗ ℚ is infinite-dimensional while H^0_c(U, WO_K) = 0: compact supports differ from ordinary Witt cohomology for nonproper U.
- For U = A¹ over F_q, det(1 − tφ | H^\*_c(A¹, WO_K)) gives ζ^W = 1, the slope \< 1 factor of ζ(A¹, t) = 1/(1 − qt).

These results apply to BBE07, Theorem 1.1, p. 2: the target of the comparison with the slope \< 1 part of rigid cohomology with compact supports; BBE07, Corollary 1.3 and (1.4), p. 5: defines the Witt zeta function ζ^W(X, t) through det(1 − tφ | H^i_c(X, `WO_{X,K}`)); BBE07, Corollary 1.2, p. 4: vanishing for affine smooth U outside degree dim U; §3.3: receives the morphism a_U from rigid cohomology with compact supports; §6.1: the characteristic polynomials P_i^W.


### 2.4 Finiteness and slopes of Witt cohomology with compact supports

For every separated k-scheme of finite type U, the spaces H^i_c(U, `WO_{U,K}`) are finite-dimensional over K = W(k)[1/p], vanish for i > dim U and i \< 0, and the Frobenius F is bijective on them with all slopes in [0, 1). (BBE07, Proposition 2.10, pp. 16–17; GNT19, Lemma 2.20 and proof, pp. 16–17).

k perfect; U separated of finite type.

*Needs:* §2.3; §0.8; §0.7.

A proof route is the following.

1. For U proper this is §0.8.
2. In general, induct on dim U with the excision triangle of §2.3 for U ⊂ X and X ∖ U: finite-dimensionality and the slope bound pass to cones of maps between F-isocrystals with slopes in [0, 1).
3. Vanishing above dim U: H^i(X, WI_K) for the compactification computes it, and R^i lim and the dimension bound for W_nI on W_nX (the separate absolute bound of §0.7 (3), with Y = Spec k) give vanishing for i > dim X; replace X by the closure of U.

**Checks.**

- H^1_c(G_m, WO_K) = K has slope 0; H^2_c(A², WO_K) = 0 although `H^4_{rig,c}(A²)` = K(−2) ≠ 0.


### 2.5 Proper hypercoverings and simplicial resolutions by smooth schemes

Let X be a reduced separated k-scheme of finite type and N ∈ ℕ ∪ {∞}. An (N-truncated) proper hypercovering of X is an augmented (N-truncated) simplicial k-scheme f_•: X_• → X such that each X_n → `(cosk_{n−1} sk_{n−1} X_•)_n` is proper and surjective (0 ≤ n ≤ N); an étale hypercovering is defined with étale surjective maps. An (N-truncated) simplicial resolution is a proper hypercovering such that, for each n ≤ N, there is a dense open U_n ⊂ X over which sk_n X_• is an n-truncated étale hypercovering, and each X_n is a smooth quasi-projective k-scheme. Every reduced separated k-scheme of finite type has simplicial resolutions (and N-truncated ones whose N-coskeleton is a proper hypercovering). (BBE07, Definition 3.1 and the following paragraphs and Remark, pp. 17–18).

k perfect (de Jong's alteration theorem is applied componentwise). Coskeleta are taken over X in the category of separated k-schemes of finite type.

*Needs:* SchemeAndStackFoundations §4.19, `alteration_theorem`; PadicDifferentialEquationsAndRigidCohomology §RD.5.67, proper hypercoverings by smooth schemes; Mathlib `AlgebraicGeometry.Smooth`; Mathlib `AlgebraicGeometry.IsProper`.

The construction has the following API.

- Augmented (truncated) simplicial schemes over X whose coskeleton comparison maps are proper surjective.
- A proper hypercovering, étale hypercovering over dense opens U_n, with smooth quasi-projective terms.
- Every reduced separated finite type k-scheme admits simplicial resolutions and N-truncated ones for each N.
- The N-coskeleton over X of an N-truncated simplicial resolution is a proper hypercovering with the same N-skeleton.
- Restriction of a resolution to an open U ⊂ X is a resolution of U.

A proof route is the following.

1. For each irreducible component, de Jong's theorem gives a smooth quasi-projective X′ with a projective surjective generically étale X′ → X (SchemeAndStackFoundations §4.19, `alteration_theorem`); apply it componentwise to obtain a map étale over a dense open.
2. Build the hypercovering inductively as in Deligne (Del74, (6.2.5)): at step n apply the alteration to `(cosk_{n−1} sk_{n−1} X_•)_n`; the class of proper surjective maps that are étale over a dense open of X satisfies the conditions for hypercoverings (Tsuzuki's condition (HC); Tsu03, cited by locator). The rigid-cohomology roadmap builds proper hypercoverings with smooth terms in the same way (PadicDifferentialEquationsAndRigidCohomology §RD.5.67, proper hypercoverings by smooth schemes); here the terms are moreover quasi-projective and the coverings étale over dense opens.

**Checks.**

- For X smooth quasi-projective, the constant simplicial scheme X_n = X is a simplicial resolution.
- For a split nodal cubic X (a rational node whose two branches are defined over k), the normalization P¹ → X is proper surjective and étale (an isomorphism) over the smooth locus, and its Čech nerve truncated at level 1 refines to a 1-truncated simplicial resolution with X_1 = P¹ ×_X P¹ = P¹ ⊔ two k-points. For a nonsplit rational node, whose branches are conjugate over the quadratic extension k′ of k, the off-diagonal part of P¹ ×_X P¹ is Spec k′, which becomes two points only after base change to k′; over k = F_q the split fibre product has q + 3 rational points and the nonsplit one q + 1.
- The Čech nerve of the identity of a singular X is a proper hypercovering but not a simplicial resolution, since its terms are not smooth.
- A simplicial resolution is a proper hypercovering in the sense of PadicDifferentialEquationsAndRigidCohomology §RD.5.74, the descent spectral sequence for proper hypercoverings, so rigid descent applies to it.

These results apply to BBE07, Proposition 3.2, p. 18: descent for Witt cohomology with compact supports along truncated resolutions; BBE07, Lemma 5.1, p. 28: the resolution is embedded in a simplicial smooth formal scheme with Frobenius lifts; §3.6: reduction of Theorem 1.1 to smooth projective schemes.


### 2.6 Descent for Witt cohomology with compact supports along proper hypercoverings

Let X be a reduced k-scheme of finite type, N ∈ ℕ, f_•: X_• → X an N-truncated proper hypercovering, I ⊂ O_X a coherent ideal with U = X ∖ V(I), and I_q = `IO_{X_q}`. Assume that the restriction U_• of X_• over U is an N-truncated étale hypercovering of U. Then the complex 0 → WI_K → `f_{0*}(WI_{0,K})` → ⋯ → `f_{N*}(WI_{N,K})`, with WI_K in degree −1, is acyclic in degrees ≠ N, and the canonical maps H^q(X, WI_K) → H^q(X_•, `WI_{•,K}`) are isomorphisms for q \< N. In particular, with X proper and U ⊂ X, H^q_c(U, `WO_{U,K}`) ≅ H^q_c(U_•, `WO_{U_•,K}`) for q \< N. (BBE07, Proposition 3.2 and its proof, pp. 18–21).

U_• → U an N-truncated étale hypercovering; the comparison holds below degree N.

*Needs:* §2.5; §2.1; §2.3; §0.7; AdicSpacesPartIII §F0.6, graded-cohomology-finiteness; JacobianChallenge Layer C, coherent higher direct images under proper morphisms; EnhancedDerivedSheaves §E2.6, `hypercoverDescent_boundedBelow`; EnhancedDerivedSheaves §E5:descent, `moduleDescent`.

A proof route is the following.

1. For the complexes `L_n^{•,r}`: 0 → W_n(I^r) → `f_{0*}W_n(I_0^r)` → ⋯, the direct sum over r of the n = 1 complexes is a complex of finite graded modules over ⊕ I^r (EGAIII1, Proposition 3.3.1, pp. 117–118); over U it is acyclic in degrees \< N by étale cohomological descent for quasi-coherent sheaves (bounded-below hypercover descent, EnhancedDerivedSheaves §E2.6, `hypercoverDescent_boundedBelow`, for the étale topology, on which quasi-coherent sheaves satisfy descent, EnhancedDerivedSheaves §E5:descent, `moduleDescent`), so a power of I kills the cohomology and the transition maps `H^{q,r+b}` → `H^{q,r}` vanish for some b.
2. Induction on n with the ideals `W_n^{r,r+b}` of BBE Lemma 2.5 and the diagram lemma shows `H^{q,r+2b}_n` → `H^{q,r}_n` is zero, so a power of F kills H^q_n for r ≥ 1, hence on Rlim and the limit complex WI_• → in degrees \< N; F becomes invertible after ⊗K, giving acyclicity.
3. Each f_q is proper and its restriction U_q → U is étale and proper, hence finite, so §2.1 (i) gives `R^if_{q*}(WI_{q,K})` = 0 for i ≥ 1; thus `f_{•*}WI_{•,K}` computes `Rf_{•*}WI_{•,K}`, and (i) gives the statement on H^q.

**Checks.**

- For the normalization P¹ → X of a nodal cubic (N = 2), H^0(X, WO_K) ≅ H^0 of the descent complex = K and H^1(X, WO_K) is read off from the preimage of the node: K²/K for a split node (two k-points) and W(k′)_K/K for a nonsplit one (one point with quadratic residue field k′), one-dimensional in both cases. Over k = F_q the q-Frobenius acts on this H¹ by 1 for a split node and by −1 for a nonsplit one, matching the point counts q ≡ 1 − 1 and q + 2 ≡ 1 − (−1) mod q (for y² = x²(x − 1) over F_3 the node is nonsplit and there are 5 points).
- For the split node, the 1-truncated unnormalized complex has C⁰ = K and C¹ = K³ with d⁰ = 0, so its H¹ is K³. At truncation N = 2, d¹ imposes a = 0 and b + c = 0, leaving H¹ = K; the comparison range q < N is essential.

### Examples

- For the blowup of the vertex of the affine cone over a canonically embedded non-hyperelliptic smooth projective curve C of genus at least 3, with I the vertex ideal, R¹f_\*(WI′)_ℚ = 0 but R¹f_\*(I′) contains H¹(C, ω_C) = k. For Bl_0 A² instead, R¹f_\*(I′^r) = `⊕_{m≥0}` H¹(P¹, O(m+r)) = 0 for every r ≥ 0.
- For a normal surface singularity with minimal resolution whose exceptional curve is a tree of smooth rational curves, `R¹f_*WO_{X,ℚ}` = H¹(E, `WO_{E,ℚ}`) = 0.
- H^\*_c(A¹_k, WO_K) = 0, while H^0(A¹_k, WO_K) = W(k[t])_K is infinite-dimensional.
- H^1_c(G_m, WO_K) = K has slope 0; H^2_c(A², WO_K) = 0 although `H^4_{rig,c}(A²)` = K(−2) ≠ 0.
- A smooth quasi-projective X is its own simplicial resolution (constant simplicial scheme).
- For the normalization P¹ → X of a nodal cubic (N = 2), H^0(X, WO_K) ≅ H^0 of the descent complex = K and H^1(X, WO_K) is read off from the preimage of the node: K²/K for a split node (two k-points) and W(k′)_K/K for a nonsplit one (one point with quadratic residue field k′), one-dimensional in both cases. Over k = F_q the q-Frobenius acts on this H¹ by 1 for a split node and by −1 for a nonsplit one, matching the point counts q ≡ 1 − 1 and q + 2 ≡ 1 − (−1) mod q (for y² = x²(x − 1) over F_3 the node is nonsplit and there are 5 points).

### Dependencies

§0.1; §0.2; §0.7; §0.4; AdicSpacesPartIII §F0.6, graded-cohomology-finiteness; SchemeAndStackFoundations §2.6, `qcoh_higherDirectImages`; JacobianChallenge Layer C, coherent higher direct images under proper morphisms; §2.1; §0.8; EtaleCohomologyFoundations §G.2, `nagataCompactification`; §2.3; SchemeAndStackFoundations §4.19, `alteration_theorem`; PadicDifferentialEquationsAndRigidCohomology §RD.5.67, proper hypercoverings by smooth schemes; §2.5; EnhancedDerivedSheaves §E2.6, `hypercoverDescent_boundedBelow`; EnhancedDerivedSheaves §E5:descent, `moduleDescent`.



## Layer 3: Comparison with rigid cohomology: the slope < 1 part

The main theorem of Berthelot, Bloch and Esnault identifies compactly supported Witt vector cohomology with the slope \< 1 part of rigid cohomology with compact supports, for every separated scheme of finite type over a perfect field. The comparison map comes from the analytic functions on a tube: a Frobenius lift on a smooth formal scheme gives, through divided power envelopes and the Cartier–Dieudonné–Dwork section, a ring map to Witt vectors. The proof reduces to smooth projective schemes, where the slope spectral sequence does the work, by excision, simplicial resolutions with Frobenius-lifted embeddings and proper descent on both sides.


### 3.1 Slope parts of F-isocrystals and of characteristic polynomials

Let k be a perfect field of characteristic p, K = W(k)[1/p] with Frobenius σ, and (E, F) an F-isocrystal: a finite-dimensional K-vector space with a σ-semilinear bijection F. Let E = ⊕_λ E_λ be its canonical decomposition into isoclinic subisocrystals, with Hom(E_λ, E′_μ) = 0 for λ ≠ μ, as supplied by CrystallineCohomology §CR.4.7 (*Slope decomposition on the existing isocrystal carrier*). For ρ ∈ ℝ, `E^{<ρ}` := `⊕_{λ<ρ}` E_λ. Then E ↦ `E^{<ρ}` is an exact functor. Over k = F_q (q = p^a) with φ = F^a linear, and v_q normalized by v_q(q) = 1, for P(t) ∈ 1 + tK[t] let P^λ be the product of the irreducible factors whose Newton polygon is a segment of slope λ (normalized P^λ(0) = 1) and `P^{<ρ}` = `∏_{λ<ρ}` P^λ, extended multiplicatively to rational functions R with R(0) = 1. Then `det(1 − tφ | E^{<ρ}) = det(1 − tφ | E)^{<ρ}`. (BBE07, 5.2, first paragraph, p. 30; BBE07, 6.1, pp. 33–34).

k perfect; E finite-dimensional with F bijective. Slopes are measured with v_p(p) = 1 for F and with v_q(q) = 1 for the linear φ = F^a; the two normalizations agree (slope of F = v_q of eigenvalues of φ).

*Needs:* CrystallineCohomology §CR.4.7, *Slope decomposition on the existing isocrystal carrier*; Mathlib `WittVector.Isocrystal`; PadicDifferentialEquationsAndRigidCohomology §RD.4.17, F-spaces; PadicDifferentialEquationsAndRigidCohomology §RD.6.58, slopes of Frobenius eigenvalues; Mathlib `LinearMap.charpoly`.

The construction has the following API.

- `E^{<ρ}` := `⊕_{λ<ρ}` E_λ, a subisocrystal, for the supplied slope parts E_λ.
- E ↦ `E^{<ρ}` is an exact functor on isocrystals; a morphism maps `E^{<ρ}` into `E′^{<ρ}`.
- E = `E^{<ρ}` ⊕ `E^{≥ρ}` with `E^{≥ρ}` := `⊕_{λ≥ρ}` E_λ, functorially in E.
- For P ∈ 1 + tK[t] (k finite), the slope \< ρ factor `P^{<ρ}` via the Newton polygon with v_q(q) = 1; multiplicative extension to rational functions.
- Over F_q, `det(1 − tφ | E^{<ρ}) = det(1 − tφ | E)^{<ρ}`.

A proof route is the following.

1. The decomposition E = ⊕_λ E_λ and the vanishing of Hom between different slopes are imported (CrystallineCohomology §CR.4.7, *Slope decomposition on the existing isocrystal carrier*). A morphism E → E′ therefore maps E_λ into E′_λ, so `E^{<ρ}` is functorial, and a short exact sequence 0 → E′ → E → E″ → 0 of isocrystals is the direct sum over λ of the complexes 0 → E′_λ → E_λ → E″_λ → 0; a direct sum of complexes is exact only if each summand is, so E ↦ E_λ and E ↦ `E^{<ρ}` are exact.
2. Over F_q, the slopes are v_q of the eigenvalues of φ (Manin), so the characteristic polynomial factors through the Newton polygon (PadicDifferentialEquationsAndRigidCohomology §RD.6.58, slopes of Frobenius eigenvalues).

**Checks.**

- For E = K with F = p^aσ (a ∈ ℤ), E_a = E; `E^{<1}` = E iff a ≤ 0.
- For E = 0, `E^{<ρ}` = 0; for ρ > all slopes, `E^{<ρ}` = E.
- For H²_rig(P¹/K) = K(−1) (F = pσ), `(H²)^{<1}` = 0: the top cohomology of P¹ is not in the slope \< 1 part.
- Over F_p, for P(t) = 1 − a_1t + pt² with p ∤ a_1 (ordinary elliptic curve), `P^{<1}(t)` = 1 − αt with α the p-adic unit root; for a_1 ≡ 0 mod p (supersingular), both reciprocal roots have slope 1/2, so `P^{<1}` = P.
- For an object of Mathlib's WittVector.Isocrystal over algebraically closed k that is a standard slope-λ block, its slope-λ part is everything and its slope-μ part is 0 for μ ≠ λ; for E = K with F = pσ (slope 1), `E^{<1}` = 0, and for F = σ (slope 0), `E^{<1}` = E.

These results apply to BBE07, Theorem 1.1, p. 2: the comparison isomorphism is on the slope \< 1 part of rigid cohomology with compact supports; BBE07, (6.2), p. 34: `P_i^{<1}` = P_i^W relates the slope \< 1 factor of the zeta function to Witt cohomology; §6.1: slope factors `ζ^{<ρ}`.


### 3.2 The Witt realization of overconvergent functions from a Frobenius lift

Let P be a smooth separated formal W-scheme with special fibre P_0, X ⊂ P_0 a closed subscheme with ideal J ⊂ O_P (containing p), `A_{X,P}` := `sp_*O_{]X[_P}` the sheaf of analytic functions on the tube, and F: P → P a σ-semilinear lift of the absolute Frobenius of P_0. Then there is a ring homomorphism `A_{X,P}` → `WO_{X,K}`, functorial in (X, P, F), obtained as the composite of Berthelot's map `A_{X,P}` → P̂(J)_K into the p-adically completed divided power envelope with a compatible system of ring maps P(J_n) → W_nO_X, J_n = `JO_{P_n}`. (BBE07, Proposition 4.4 (i) and the first part of its proof, pp. 23–25; BBE07, 4.1–4.2, pp. 21–22).

P smooth separated over W with a Frobenius lift F; X a closed subscheme of the special fibre. Divided powers on J are compatible with the canonical divided powers of p.

*Needs:* CrystallineCohomology §CR.4.4, *Witt lifting from a torsion-free Frobenius lift*; CrystallineCohomology §CR.4.4, *Canonical divided powers on the Verschiebung ideal of W_r(R)*; DerivedDeRhamCohomology §PD.6, *Universal base-compatible divided power envelope*; DerivedDeRhamCohomology §PD.6, *Completed PD envelopes and the derived-completion comparison*; PadicDifferentialEquationsAndRigidCohomology §RD.4.36, Berthelot's comparison morphism from the tube to the completed PD envelope; PadicDifferentialEquationsAndRigidCohomology §RD.3.2, tubes; §0.1.

The construction has the following API.

- Compatible ring maps P(J_n) → W_nO_X induced by the supplied Cartier–Dieudonné–Dwork map s_F and the divided powers on V `W_{n−1}O_X`.
- The ring homomorphism `A_{X,P}` → `WO_{X,K}`.
- For a morphism (X′, P′, F′) → (X, P, F) of Frobenius-lifted frames, the squares with `A_{X,P}` → `A_{X′,P′}` and `WO_{X,K}` → `WO_{X′,K}` commute.
- Integral compatibility with the augmentation: the composite of P(J_n) → W_nO_X with the projection W_nO_X → O_X to the first Witt component is the divided-power augmentation P(J_n) → `O_{P_n}`/J_n = O_X. There is no rational counterpart: O_X ⊗ ℚ = 0 since p·O_X = 0, so `A_{X,P}` → `WO_{X,K}` has no reduction to functions on X.

A proof route is the following.

1. Since O_P is p-torsion-free, F defines the Cartier–Dieudonné–Dwork map s_F: O_P → W(O_P), the ring map with ghost components w_i(s_F(x)) = F^i(x), unique because the ghost map of a p-torsion-free ring is injective; it is imported from CrystallineCohomology §CR.4.4 (*Witt lifting from a torsion-free Frobenius lift*, whose construction A → W(A) precedes its composition with W(A) → W(S) for reduced S).
2. Composing with W(O_P) → W_n(O_X) gives `O_{P_n}` → W_nO_X sending J_n into V `W_{n−1}O_X`, which carries divided powers γ_m(Vx) = `(p^{m−1}/m!)V(x^m)` compatible with those of p (CrystallineCohomology §CR.4.4, *Canonical divided powers on the Verschiebung ideal of W_r(R)*); the universal property of the PD envelope (DerivedDeRhamCohomology §PD.6, *Universal base-compatible divided power envelope*) gives P(J_n) → W_nO_X, compatible in n. Its composite with the first Witt component W_nO_X → O_X sends x ∈ `O_{P_n}` to the first component x mod J of s_F(x), and kills the divided-power ideal, since V `W_{n−1}O_X` and its divided powers have first component 0; so it is the augmentation P(J_n) → O_X.
3. P̂(J)/p^n = P(J_n), so the limit gives P̂(J) → WO_X; precompose with Berthelot's `A_{X,P}` → P̂(J)_K (PadicDifferentialEquationsAndRigidCohomology §RD.4.36, Berthelot's comparison morphism from the tube to the completed PD envelope) and invert p.

**Checks.**

- For X = Spec k, P = Spf W, F = σ: `A_{X,P}` = K and the map is the identity of K = W(k)[1/p].
- For X = ∅ both sides are 0.
- For X = Spec F_p, P = Spf ℤ_p and F = id: J = (p), P(J_n) = ℤ/p^n (the ideal (p) already carries the compatible divided powers), and P(J_n) → W_n(F_p) = ℤ/p^n is the identity; its composite with W_n(F_p) → F_p sends 1 to 1 and p to 0, the augmentation. After inverting p the tube map is the identity of ℚ_p, while the characteristic-p target O_X ⊗ ℚ = F_p ⊗ ℚ is 0: there is no unital map ℚ_p → F_p, so no rational specialization to O_X exists.
- For A = ℤ_p[t] with φ(t) = t^p, s_φ(t) = [t] (the Teichmüller lift), since its ghost components are `t^{p^i}`.
- The map `O_{P_n}` → W_nO_X does not kill J_n: it sends J_n into V `W_{n−1}O_X`, nonzero for n ≥ 2, so the divided powers of V are needed to factor through P(J_n).
- For X smooth with P a lift, composing with the augmentation recovers the map used for the crystalline–de Rham–Witt comparison.

These results apply to BBE07, Proposition 4.4 (ii)–(iii), p. 23: composition with the augmentation of the de Rham complex defines `a_{X,P,F}`; BBE07, 5.2, p. 32: on a simplicial frame with Frobenius lifts it gives the morphism of descent spectral sequences; §3.3: the local building block.


### 3.3 The morphism from rigid cohomology with compact supports to Witt vector cohomology with compact supports

Let k be perfect, U a separated k-scheme of finite type. There is a morphism a_U: `RΓ_{rig,c}(U/K)` → RΓ_c(U, `WO_{U,K}`) in D^b(K), functorial in U for proper morphisms, constructed as follows: for X ⊃ U proper, Y = X ∖ U with coherent ideal I, and a closed immersion X ⊂ P into a smooth formal W-scheme, there are morphisms `a_{X,P}`: `A_{X,P}` ⊗ Ω^•_P → `WO_{X,K}` and `a_{U,X,P}`: `(A_{X,P} ⊗ Ω^•_P → A_{Y,P} ⊗ Ω^•_P)_t` → WI_K in D^b(X, K), equal to the composite with §3.2 when P carries a Frobenius lift, independent of the lift, and compatible with the canonical isomorphisms for two embeddings; in general they are defined through Čech covers by affine opens with liftable embeddings. Applying RΓ(X, −) gives a_U. Properties: (i) for X smooth proper, a_X is the composite RΓ_rig(X/K) ≅ RΓ_crys(X/W)_K ≅ RΓ(X, WΩ^•_X)_K → RΓ(X, WO_X)_K; (ii) a_U is compatible with passing to U_red; (iii) for V ⊂ U open with complement T, a_V, a_U, a_T form a morphism of excision triangles; (iv) a_U commutes with Frobenius. (BBE07, Proposition 4.4 (ii)–(iii) and proof, pp. 23–26; BBE07, Theorem 4.5 and proof, pp. 26–28; BBE07, Proposition 4.6, p. 28).

U separated of finite type over a perfect field; embeddings of compactifications in smooth formal schemes exist locally (quasi-projective case globally, with Frobenius lift on an open of projective space).

*Needs:* §3.2; §2.3; §2.1; PadicDifferentialEquationsAndRigidCohomology §RD.4.12, rigid cohomology with compact supports; PadicDifferentialEquationsAndRigidCohomology §RD.4.5, the overconvergent de Rham complex; PadicDifferentialEquationsAndRigidCohomology §RD.4.19, the excision sequence; PadicDifferentialEquationsAndRigidCohomology §RD.4.18, the Frobenius on rigid cohomology; PadicDifferentialEquationsAndRigidCohomology §RD.4.37, Berthelot's comparison morphism is a quasi-isomorphism; PadicDifferentialEquationsAndRigidCohomology §RD.4.38, the rigid–crystalline comparison; CrystallineCohomology §CR.4.7, *Finite and infinite crystalline de Rham–Witt comparison*.

The construction has the following API.

- a_U: `RΓ_{rig,c}(U/K)` → RΓ_c(U, `WO_{U,K}`) in D^b(K).
- For proper f: U′ → U, f\* ∘ a_U = `a_{U′}` ∘ f\*.
- a_U commutes with the Frobenius endomorphisms on both sides.
- For X smooth proper, a_X = augmentation ∘ (crystalline–de Rham–Witt) ∘ (rigid–crystalline).
- For V ⊂ U open with complement T, (a_V, a_U, a_T) is a morphism of excision triangles.
- a_U and `a_{U_red}` agree under the canonical isomorphisms for U_red ⊂ U.
- `a_{X,P,F}` does not depend on the Frobenius lift F, and changes of embedding P → P′ commute with it.

A proof route is the following.

1. `A_{X,P}` ⊗ Ω^•_P = `sp_*Ω^•_{]X[_P}` computes rigid cohomology of proper X (PadicDifferentialEquationsAndRigidCohomology §RD.4.5, the overconvergent de Rham complex). With a Frobenius lift, the ring map of §3.2 composed with the augmentation `A_{X,P}` ⊗ Ω^•_P → `A_{X,P}` gives `a_{X,P,F}`; for two lifted embeddings, the diagonal embedding into P × P′ with F × F′ and functoriality show the induced map in D^b(X, K) is the canonical isomorphism (4.1), so `a_{X,P,F}` is independent of F.
2. Without global lifts, cover X by affine opens X_i ⊂ P_i with lifts and use the Čech double complexes (4.10) and (4.11) on both sides.
3. For U ⊂ X, apply the construction to X and Y = X ∖ U and use that `(WO_{X,K} → WO_{Y,K})` resolves WI_K; functoriality reduces, via §2.1 (ii), to U′ dense in X′.
4. (i): in the smooth lifted case the maps P(J_n) → W_nO_X are those of Illusie's crystalline–de Rham–Witt comparison, so the diagram with Berthelot's comparison (PadicDifferentialEquationsAndRigidCohomology §RD.4.37, Berthelot's comparison morphism is a quasi-isomorphism) and CrystallineCohomology §CR.4.7, *Finite and infinite crystalline de Rham–Witt comparison* commutes; (ii), (iii) by construction (BBE leaves them as exercises; the proof is the functoriality of the Čech construction).

**Checks.**

- For U = Spec k, a_U is the identity of K in degree 0.
- For U = ∅, a_U = 0 → 0.
- For X = P¹, H²(a_X): K(−1) → H²(P¹, WO_K) = 0 is not injective: a_U is not an isomorphism before passing to slope \< 1 parts.
- For an ordinary elliptic curve E over k, H¹(a_E) is surjective onto H¹(E, WO_K) = K with kernel the slope-1 line of H¹_rig(E).

These results apply to BBE07, 5.2, p. 30: induces b^q_X: `H^q_{rig,c}(X/K)^{<1}` → H^q_c(X, `WO_{X,K}`), the isomorphism of Theorem 1.1; §3.6: the map shown to be an isomorphism on slope \< 1 parts.


### 3.4 Simplicial embeddings with Frobenius lifts

Given a reduced separated finite type k-scheme X, a closed immersion X ⊂ P into a smooth formal W-scheme carrying a Frobenius lift F, and N ∈ ℕ: There are a proper hypercovering X_• → X, a P-augmented simplicial formal W-scheme P_• with a σ-semilinear Frobenius lift F_•, and a closed immersion of simplicial schemes X_• → P_• over X ⊂ P such that: (i) each X_n → P_n is a closed immersion and P_n → P commutes with the Frobenius lifts; (ii) sk_N X_• is an N-truncated simplicial resolution of X; (iii) X_• = cosk_N sk_N X_• and P_• = cosk_N sk_N P_•; (iv) each P_n is smooth over P and P_n → `(cosk_{n−1} sk_{n−1} P_•)_n` is smooth. (BBE07, Lemma 5.1 and proof, pp. 28–30).

X reduced, separated, finite type; X ⊂ P with a Frobenius lift (for projective X, P is an open of a projective formal space with a lifted Frobenius).

*Needs:* §2.5; PadicDifferentialEquationsAndRigidCohomology §RD.3.1, frames.

A proof route is the following.

1. Take an N-truncated simplicial resolution (§2.5) and its N-coskeleton X_•.
2. Embed each quasi-projective X_m (m ≤ N) in a smooth formal W_m with Frobenius lift F_m; form Γ_n(W_m) = `∏_{γ: [m] → [n]}` W_m with the induced simplicial structure and Frobenius ∏F_m, and P_• = P ×_W `∏_{m≤N}` Γ_•(W_m).
3. The product of the embeddings indexed by γ gives X_• → P_•, a closed immersion in degrees ≤ N because one factor is the given embedding, and in all degrees by the coskeleton property; smoothness of the comparison maps P_n → `(cosk_{n−1} sk_{n−1} P_•)_n` is Tsuzuki's computation for such coskeletal products of smooth formal schemes (Tsu04, §7.3.3, cited by locator; CT03, Corollary 11.2.6, p. 197, which rests on the coskeleton identity of CT03, Proposition 11.2.5, pp. 196–197), and the resulting (X_•, X_•, P_•) is a simplicial frame in the sense of PadicDifferentialEquationsAndRigidCohomology §RD.3.1, frames.

**Checks.**

- For X smooth projective with a lifted embedding, the constant simplicial objects satisfy the lemma.


### 3.5 Smooth proper case: slope < 1 rigid cohomology is Witt cohomology

Let X be a smooth proper k-scheme. For every q, a_X induces an isomorphism `H^q_rig(X/K)^{<1}` ≅ H^q(X, WO_X)_K compatible with Frobenius, and H^q(a_X) is zero on the slope ≥ 1 part. (BBE07, (1.1), p. 2, and 5.2, second paragraph, p. 31; BBE07, Theorem 4.5, (4.13), pp. 26–27).

X smooth and proper over a perfect field k.

*Needs:* §3.3; §3.1; PadicDifferentialEquationsAndRigidCohomology §RD.4.38, the rigid–crystalline comparison; CrystallineCohomology §CR.4.7, *Finite and infinite crystalline de Rham–Witt comparison*; CrystallineCohomology §CR.4.7, *Degree filtration and the slope spectral sequence*.

A proof route is the following.

1. By §3.3 (i), a_X is the composite of the rigid–crystalline comparison (PadicDifferentialEquationsAndRigidCohomology §RD.4.38, the rigid–crystalline comparison), the crystalline–de Rham–Witt comparison (CrystallineCohomology §CR.4.7, *Finite and infinite crystalline de Rham–Witt comparison*) and the augmentation WΩ^•_X → WO_X; all are Frobenius-compatible.
2. The slope spectral sequence degenerates after ⊗K and identifies H^q(X, WO_X)_K with the slope-[0, 1) part of H^q_crys(X/W)_K, the augmentation being the projection to the zeroth column (CrystallineCohomology §CR.4.7, *Degree filtration and the slope spectral sequence*).

**Checks.**

- For an abelian variety A of dimension g and p-rank f, H¹(A, WO_A)_K has dimension 2g − f: the slope-[0,1) part of H¹_crys, obtained by excluding the slope-1 part of dimension f.


### 3.6 Witt vector cohomology computes the slope < 1 part of rigid cohomology

Take k perfect of characteristic p, K = W(k)[1/p], and any separated k-scheme X of finite type. For every q the morphism a_X induces a Frobenius-equivariant isomorphism b^q_X: `H^q_{rig,c}(X/K)^{<1}` ≅ H^q_c(X, `WO_{X,K}`), functorial for proper maps and compatible with excision. In particular, for X proper, `H^q_rig(X/K)^{<1}` ≅ H^q(X, WO_X) ⊗ K. (BBE07, Theorem 1.1, p. 2; BBE07, 5.2 (proof of Theorem 1.1), pp. 30–33).

X separated of finite type over a perfect field; no smoothness or properness.

*Needs:* §3.3; §3.1; §3.5; §3.4; §2.6; §2.4; PadicDifferentialEquationsAndRigidCohomology §RD.5.90, finite dimensionality of compact-support rigid cohomology; PadicDifferentialEquationsAndRigidCohomology §RD.5.77, Frobenius is bijective on rigid cohomology; PadicDifferentialEquationsAndRigidCohomology §RD.5.74, the descent spectral sequence for proper hypercoverings; PadicDifferentialEquationsAndRigidCohomology §RD.5.73, proper cohomological descent; PadicDifferentialEquationsAndRigidCohomology §RD.5.78, vanishing of compact-support rigid cohomology above twice the dimension; PadicDifferentialEquationsAndRigidCohomology §RD.4.19, the excision sequence.

A proof route is the following.

1. `H^q_{rig,c}(X/K)` is finite-dimensional with bijective Frobenius (PadicDifferentialEquationsAndRigidCohomology §RD.5.90, finite dimensionality of compact-support rigid cohomology, PadicDifferentialEquationsAndRigidCohomology §RD.5.77, Frobenius is bijective on rigid cohomology), so the slope \< 1 part is defined and a_X induces b^q_X; the slope \< 1 functor is exact.
2. Induction on d = dim X. By the reduction compatibility assume X reduced; dimension 0 is the smooth proper case (§3.5). If the theorem holds below dimension d, excision triangles (§3.3 (iii)) and the five lemma show it for open subsets of smooth proper schemes of dimension d, and allow replacing X by any dense open neighbourhood of its generic points, hence by an irreducible affine U, hence by a projective compactification X̄.
3. For X̄ ⊂ P with Frobenius lift, take N ≥ 2d + 1 and the simplicial data of §3.4; on a dense open U the restriction U_• is an étale hypercovering. The Frobenius lift gives a morphism of descent spectral sequences `E_1^{i,j}` = `H^j_{rig,c}(U_i/K)^{<1}` ⇒ `H^{i+j}_{rig,c}(U_•/K)^{<1}` and `E_1^{i,j}` = H^j_c(U_i, WO_K) ⇒ `H^{i+j}_c(U_•, WO_K)`, which is an isomorphism on E_1 for i ≤ N because each U_i, being étale over U, has dimension d and is a dense open of the union of the connected components of the smooth projective X_i that meet U_i, a smooth projective scheme of dimension d, to which the case of opens of smooth proper schemes of dimension d applies (a d-dimensional component of X_i may lie over X̄ ∖ U: for X_0 the blowup of a surface at a point x, X_0 ×_X̄ X_0 contains E × E of dimension 2). An isomorphism on the columns i ≤ N gives an isomorphism on the abutments in degrees q \< N: the cone of the morphism of spectral sequences has E_1 terms only in columns i ≥ N + 1 and rows j ≥ −1, hence no cohomology in degrees ≤ N − 1.
4. The augmentations are isomorphisms in degrees \< N: on the rigid side by Tsuzuki's proper descent (PadicDifferentialEquationsAndRigidCohomology §RD.5.74 for the proper compactification X and its proper closed complement Y = X ∖ U, combined by excision §RD.4.19, PadicDifferentialEquationsAndRigidCohomology §RD.5.73, proper cohomological descent), on the Witt side by §2.6, whose range is q \< N; both sides vanish above 2d, and 2d \< N (PadicDifferentialEquationsAndRigidCohomology §RD.5.78, vanishing of compact-support rigid cohomology above twice the dimension, §2.4).
5. For the compact-support rigid descent step, the chosen X and Y = X ∖ U are proper. Apply ordinary proper-hypercover descent (PadicDifferentialEquationsAndRigidCohomology §RD.5.74) to X and Y separately and take the cone using excision §RD.4.19; no unprovided compact-support descent theorem is assumed.

**Checks.**

- X = P¹: H⁰_rig = K ↔ H⁰(P¹, WO_K) = K and H²_rig = K(−1) has no slope \< 1 part, matching H²(P¹, WO_K) = 0.
- X a nodal cubic over k: H¹_rig(X/K) = K of slope 0 ≅ H¹(X, WO_X)_K = K; over F_q the q-Frobenius acts on both by 1 if the node is split and by −1 if it is not, a unit in either case.
- X an elliptic curve: dim H¹(X, WO_X)_K = 1 if X is ordinary (H¹_rig has slopes 0, 1) and 2 if X is supersingular (slopes 1/2, 1/2), matching the slope \< 1 part of H¹_rig.


### 3.7 Vanishing of compactly supported Witt cohomology of smooth affine varieties

Suppose X is proper over a perfect field k and the complement U = X ∖ Y of the closed subscheme Y defined by a coherent ideal I is affine, smooth and equidimensional of dimension n. Then for every r ≥ 1 and every degree i ≠ n, the groups H^i(X, WI^r)_K — which coincide with H^i(X, WI)_K and with H^i_c(U, `WO_{U,K}`) — are zero. (BBE07, Corollary 1.2 and the paragraph after it, p. 4).

U affine, smooth, equidimensional of dimension n; X proper; I any coherent ideal with V(I) = Y.

*Needs:* §3.6; §2.4; §0.4; PadicDifferentialEquationsAndRigidCohomology §§RD.4.1 and RD.4.24, Monsky–Washnitzer cohomology; PadicDifferentialEquationsAndRigidCohomology §RD.5.89, Poincaré duality.

A proof route is the following.

1. For U smooth affine, H^i_rig(U/K) is Monsky–Washnitzer cohomology, the cohomology of the de Rham complex of a dagger algebra of dimension n, which has no terms above degree n, so it vanishes for i > n (PadicDifferentialEquationsAndRigidCohomology §§RD.4.1 and RD.4.24, Monsky–Washnitzer cohomology); Poincaré duality for smooth equidimensional U (PadicDifferentialEquationsAndRigidCohomology §RD.5.89, Poincaré duality) gives `H^i_{rig,c}(U/K)` = 0 for i \< n, so §3.6 gives H^i_c(U, WO_K) = 0 for i \< n.
2. For i > n: H^i_c(U, WO_K) does not change when X is replaced by the closure of U, of dimension n, and the cohomology of a scheme of dimension n vanishes above n (§2.4).
3. WI^r and WI have the same rationalization (§0.4).

**Checks.**

- For U = A¹ in X = P¹, H^i_c(A¹, WO_K) = 0 for all i (including i = 1).

### Examples

- For E = K with F = p^aσ (a ∈ ℤ), `E^{<1}` = E iff a ≤ 0.
- For X = P_0 = Spec k and P = Spf W with F = σ, the map is the identity K → W(k)[1/p].
- For U = Spec k, a_U is the identity of K.
- For X smooth projective with a lifted embedding, the constant simplicial objects satisfy the lemma.
- For an abelian variety A of dimension g and p-rank f, H¹(A, WO_A)_K has dimension 2g − f: the slope-[0,1) part of H¹_crys, obtained by excluding the slope-1 part of dimension f.
- X = P¹: H⁰_rig = K ↔ H⁰(P¹, WO_K) = K and H²_rig = K(−1) has no slope \< 1 part, matching H²(P¹, WO_K) = 0.
- For U = A¹ in X = P¹, H^i_c(A¹, WO_K) = 0 for all i (including i = 1).

### Dependencies

CrystallineCohomology §CR.4.7, *Slope decomposition on the existing isocrystal carrier*; PadicDifferentialEquationsAndRigidCohomology §RD.4.17, F-spaces; PadicDifferentialEquationsAndRigidCohomology §RD.6.58, slopes of Frobenius eigenvalues; CrystallineCohomology §CR.4.4, *Witt lifting from a torsion-free Frobenius lift*; CrystallineCohomology §CR.4.4, *Canonical divided powers on the Verschiebung ideal of W_r(R)*; DerivedDeRhamCohomology §PD.6, *Universal base-compatible divided power envelope*; DerivedDeRhamCohomology §PD.6, *Completed PD envelopes and the derived-completion comparison*; PadicDifferentialEquationsAndRigidCohomology §RD.4.36, Berthelot's comparison morphism from the tube to the completed PD envelope; PadicDifferentialEquationsAndRigidCohomology §RD.3.2, tubes; §0.1; §3.2; §2.3; §2.1; PadicDifferentialEquationsAndRigidCohomology §RD.4.12, rigid cohomology with compact supports; PadicDifferentialEquationsAndRigidCohomology §RD.4.5, the overconvergent de Rham complex; PadicDifferentialEquationsAndRigidCohomology §RD.4.19, the excision sequence; PadicDifferentialEquationsAndRigidCohomology §RD.4.18, the Frobenius on rigid cohomology; PadicDifferentialEquationsAndRigidCohomology §RD.4.37, Berthelot's comparison morphism is a quasi-isomorphism; PadicDifferentialEquationsAndRigidCohomology §RD.4.38, the rigid–crystalline comparison; CrystallineCohomology §CR.4.7, *Finite and infinite crystalline de Rham–Witt comparison*; §2.5; PadicDifferentialEquationsAndRigidCohomology §RD.3.1, frames; §3.3; §3.1; CrystallineCohomology §CR.4.7, *Degree filtration and the slope spectral sequence*; §3.5; §3.4; §2.6; §2.4; PadicDifferentialEquationsAndRigidCohomology §RD.5.90, finite dimensionality of compact-support rigid cohomology; PadicDifferentialEquationsAndRigidCohomology §RD.5.77, Frobenius is bijective on rigid cohomology; PadicDifferentialEquationsAndRigidCohomology §RD.5.74, the descent spectral sequence for proper hypercoverings; PadicDifferentialEquationsAndRigidCohomology §RD.5.73, proper cohomological descent; PadicDifferentialEquationsAndRigidCohomology §RD.5.78, vanishing of compact-support rigid cohomology above twice the dimension; §3.6; §0.4; PadicDifferentialEquationsAndRigidCohomology §§RD.4.1 and RD.4.24, Monsky–Washnitzer cohomology; PadicDifferentialEquationsAndRigidCohomology §RD.5.89, Poincaré duality.



## Layer 4: Hodge–Witt cohomology with supports and the action of correspondences

To compare the Witt cohomology of different resolutions of a singularity without resolution of singularities, Chatzistamatiou and Rülling let algebraic correspondences act on relative Hodge–Witt cohomology. This needs pushforwards along proper maps of smooth schemes, which come from Ekedahl's duality theory for the de Rham–Witt complex, and Gros's cycle classes; together they make Hodge–Witt cohomology with supports a weak cohomology theory with supports, and Chow groups with supports map to it uniquely. A degree-zero correspondence supported over a closed subset of positive codimension in its target (one containing no irreducible component of the target) acts by zero on the WO-part, and a correspondence supported over a closed subset of positive codimension in its source acts by zero on the Wω-part, up to a bounded integer coming from an alteration.

Finite-type k-schemes in this layer, including bases and auxiliary schemes, are quasi-projective over k, as in CR12 §§2–4. A generic fibre or scalar extension is quasi-projective over its own ground field. Point-count applications use projective schemes.


### 4.1 The Witt canonical system and Ekedahl duality

Let k be a perfect field and X a k-scheme of finite type of pure dimension d with structure map π: X → Spec k. For n ≥ 1 let `K_{X,n}` := W_n(π)^!(W_n(k)) be the dualizing complex of the W_n(k)-scheme W_nX (upper shriek of the finite type morphism W_nX → Spec W_n(k)); the `K_{X,n}` form a projective system (a Witt dualizing system) with Frobenius, Verschiebung and restriction. The Witt canonical system is W_nω_X := `H^{−d}(K_{X,n})` and Wω_X := lim_n W_nω_X. Properties: (1) W_1ω_X = `H^{−d}(π^!k)` is the canonical sheaf ω_X of X, defined for every such X as the (−d)-th cohomology sheaf of the dualizing complex π^!k (SchemeAndStackFoundations §2.21); when X is Cohen–Macaulay it is the dualizing module of SchemeAndStackFoundations §2.20, and when X is normal it is j_\*Ω^d_U for the inclusion j of the smooth locus U; (2) `K_{X,n}` is concentrated in degrees [−d, 0], and W_nω_X[d] → `K_{X,n}` is a quasi-isomorphism when X is Cohen–Macaulay; (3) W_nω_X is a coherent S2 sheaf on W_nX; (4) for X smooth, use W_•ω_X ≅ W_•Ω^d_X from CrystallineCohomology §CR.3:duality.1 (proper smooth crystalline trace: Tr^Ek is an isomorphism compatible with étale maps), and W_•Ω^•_X is self-dual: let E(−) be the Cousin complex for the codimension filtration on X and K_X = ((W_nπ)^Δ W_n(k))_n the Witt residual complex of X, the residual complex representing the dualizing system (`K_{X,n}`)_n, concentrated in de Rham–Witt degree 0; then K_X ≅ E(W_•ω_X)(d)[d], and the product pairing W_nΩ^i ⊗ `W_nΩ^{d−i}` → W_nΩ^d induces µ_X: E(W_•Ω_X) ≅ Hom(W_•Ω_X, K_X)(−d)[−d], where (m) shifts the de Rham–Witt grading and [m] the cohomological degree (Ekedahl); (5) for a proper morphism f: X → Y between k-schemes of the same pure dimension there is a trace f_\*: f_\*W_•ω_X → W_•ω_Y, compatible with composition and localization; (6) 0 → `W_{n−1}ω_X` →(p) W_nω_X `→(F^{n−1})` ω_X is exact, and right exact if X is CM. (CR12, Definition 4.1.2, Remark 4.1.3, Proposition 4.1.4 and proof, pp. 73–75; CR12, §1.6–1.10, in particular Corollaries 1.10.5–1.10.6, pp. 16–33; CR12, Introduction 0.3, p. 4; Eke84, Theorem 4.1 and (2.11), and EkeII, both cited by locator).

k perfect; X of finite type and pure dimension d; duality for the finite type W_n(k)-schemes W_nX. The smooth top-form trace identification is imported from CrystallineCohomology §CR.3:duality.1; full product self-duality uses CR12 §1.10.

*Needs:* §0.1; SchemeAndStackFoundations §2.21, `SchemeDualizing`; SchemeAndStackFoundations §2.19, `upperShriek_compactification_independence`; SchemeAndStackFoundations §2.20, `sheafified_grothendieck_duality`; CrystallineCohomology §CR.4.6, *Classical de Rham–Witt complex as the initial V-pro-complex*; CrystallineCohomology §CR.3:duality.1, *Proper smooth crystalline trace*.

The construction has the following API.

- `K_{X,n}` = W_n(π)^!W_n(k), as a projective system with F, V and restriction.
- W_nω_X := `H^{−d}(K_{X,n})` and Wω_X := lim_n W_nω_X for X of pure dimension d.
- W_1ω_X = `H^{−d}(π^!k)` =: ω_X, the canonical sheaf, for every X of finite type and pure dimension d (π^!k is a dualizing complex on X by SchemeAndStackFoundations §2.21, `coherent_duality`); for X Cohen–Macaulay, ω_X[d] ≅ π^!k and ω_X is the dualizing module of SchemeAndStackFoundations §2.20 (cm serre duality); for X normal with smooth locus j: U → X, ω_X ≅ j_\*Ω^d_U.
- If X is Cohen–Macaulay, W_nω_X[d] ≅ `K_{X,n}`.
- Proper f: X → Y of the same pure dimension gives f_\*: f_\*W_•ω_X → W_•ω_Y, with (g ∘ f)_\* = g_\* ∘ g_\*(f_\*) and compatibility with restriction to opens.
- 0 → `W_{n−1}ω_X` →(p) W_nω_X `→(F^{n−1})` ω_X is exact, and surjective on the right for X CM.
- For X smooth of pure dimension d, with E the Cousin complex for the codimension filtration and K_X the Witt residual complex representing (`K_{X,n}`)_n: K_X ≅ E(W_•ω_X)(d)[d], and the product pairing induces µ_X: E(W_•Ω_X) ≅ Hom(W_•Ω_X, K_X)(−d)[−d], compatibly with étale base change.

A proof route is the following.

1. W_nX is of finite type over the artinian ring W_n(k) (§0.1), so it has the dualizing complex W_n(π)^!W_n(k) of coherent duality (SchemeAndStackFoundations §2.21, `SchemeDualizing`, SchemeAndStackFoundations §2.19, `upperShriek_compactification_independence`).
2. Transition maps and F, V: duality for the finite morphisms i_n: `W_{n−1}X` → W_nX and the Frobenius-twisted closed immersion X → W_nX, applied to 0 → `F^{n−1}_*O_X` `→(V^{n−1})` W_nO_X → `W_{n−1}O_X` → 0, gives the triangle `i_{n*}K_{X,n−1}` → `K_{X,n}` → `(iF^{n−1})_*K_{X,1}` → and hence (2) and (6) by induction on n.
3. The trace f_\* is `H^{−d}` of the Grothendieck trace `Rf_*K_{X,n}` → `K_{Y,n}` for proper f (SchemeAndStackFoundations §2.20, `sheafified_grothendieck_duality`).
4. For smooth X import the proper smooth crystalline trace of CrystallineCohomology §CR.3:duality.1 (the isomorphism Tr^Ek: W_nΩ^d_X ≅ f_n^!W_n[−d] for X smooth of pure dimension d, compatible with étale maps) to identify the top Witt forms with the shifted dualizing object. The additional product self-duality on the full Cousin complex is CR12 Corollaries 1.10.5–1.10.6 (EkeII, cited by locator).

**Checks.**

- For X = Spec k (d = 0), W_nω_X = W_n(k) and Wω_X = W(k).
- For X a smooth curve, W_1ω_X = Ω¹_X and W_nω_X = W_nΩ¹_X; for X = P¹, H¹(P¹, Wω) = W(k) via the trace.
- n = 1 recovers the Grothendieck dualizing complex π^!k of X and its `H^{−d}`.
- For a non-CM X (e.g. two planes in A⁴ meeting in a point), `K_{X,1}` has cohomology outside degree −d, so W_1ω_X[d] → `K_{X,1}` is not a quasi-isomorphism.
- For the affine cone X over an abelian surface A in a projectively normal embedding, X is normal of dimension 3 but not Cohen–Macaulay (H¹(A, O_A) has dimension 2 ≠ 0), so the Cohen–Macaulay dualizing module of SchemeAndStackFoundations §2.20 is not defined on X; ω_X = `H^{−3}(π^!k)` still exists and equals j_\*Ω³_U on the smooth locus U = X minus the vertex, while π^!k has cohomology outside degree −3. A definition of W_1ω_X through the Cohen–Macaulay module would exclude this normal X.
- For X smooth of dimension d, W_1ω_X = Ω^d_X.
- For X = P¹, the point cycle has trace 1 and the product pairs H⁰(WO) = W(k) with H¹(WΩ¹) = W(k); this agrees with the parent’s top-form trace, whose dimension-one sign is (−1)^0 = 1.
- The shifts in µ_X are by the dimension d of X. For X = Spec k (d = 0) there is no shift: E(W_n(k)) = W_n(k) = `K_{X,n}` in degree 0 and µ_X is the identification W_n(k) ≅ Hom(W_n(k), W_n(k)). For X = P¹ (d = 1) and n = 1, `K_{X,1}` ≅ E(Ω¹)[1] has its cohomology Ω¹ in degree −1; in de Rham–Witt degree 0, µ_X identifies E(O_X), a resolution of O_X in degrees 0 and 1, with Hom(Ω¹, `K_{X,1}`)[−1] = Hom(Ω¹, E(Ω¹)), also in degrees 0 and 1. Without the shift [−1] the right side would sit in degrees −1 and 0.

These results apply to CR12, Definition 4.4.4 (3), p. 82: Witt-rational singularities ask `R^if_*Wω_{X,ℚ}` = 0 for quasi-resolutions; CR12, §2.3, (2.3.1)–(2.3.4), p. 39: Ekedahl's self-duality defines the pushforward on Hodge–Witt cohomology with supports; §4.2: the duality isomorphism µ_X.


### 4.2 Pushforward on Hodge–Witt cohomology with supports

Let S be a k-scheme. Let Sm\*/S be the category of pairs (X, Φ) with X an S-scheme smooth over k and Φ a family of supports on X, morphisms f: (X, Φ) → (Y, Ψ) being S-morphisms with f|_Φ proper and f(Φ) ⊂ Ψ. For f between pure-dimensional X, Y of relative dimension r = dim X − dim Y there is a pushforward f_\*: Ĥ((X, Φ)/S) → Ĥ((Y, Ψ)/S)(−r), where Ĥ((X, Φ)/S) = `⊕_{i,q}` R^i(a_X)_Φ W Ω^q_X (a_X: X → S), the twist (−r) shifting the bidegree (q, i) to (q − r, i − r). It is defined from Ekedahl duality and the trace for the compactly supported direct image, makes (X, Φ) ↦ Ĥ((X, Φ)/S) a functor, commutes with F, V and d, is compatible with restriction to opens of S, and for open immersions is the excision isomorphism. For a finite surjective morphism f: X → Y of connected smooth k-schemes (equivalently, f finite and dim X = dim Y, so r = 0), f_\* ∘ f^\* = deg(f) as an endomorphism of W_•Ω_Y (S = Y). (CR12, §2.3, Definition 2.3.1, Proposition 2.3.3, Proposition 2.3.4, pp. 39–40, whose statement omits the equal-dimension hypothesis; CR11, Theorem 1.2.3 (1), p. 13, which states it; CR12, Remark 2.3.2, p. 40).

X, Y smooth over k (not necessarily proper); f proper on the supports. The ˆ indicates the inverse limit over n of the de Rham–Witt systems.

*Needs:* §4.1; SchemeAndStackFoundations §2.7, cohomology with supports; SchemeAndStackFoundations §2.21, `trace_finite`; CrystallineCohomology §CR.4.6, *Classical de Rham–Witt complex as the initial V-pro-complex*; Mathlib `AlgebraicGeometry.Smooth`.

The construction has the following API.

- Ĥ((X, Φ)/S) = `⊕_{i,q}` R^i(a_X)_Φ WΩ^q_X as a de Rham–Witt module over S.
- f_\*: Ĥ((X, Φ)/S) → Ĥ((Y, Ψ)/S)(−r) for f in Sm\*/S of relative dimension r.
- (g ∘ f)_\* = g_\* ∘ f_\* and id_\* = id.
- f_\* commutes with F, V and d.
- For U ⊂ S open, (f_U)_\* = (f_\*)|_U.
- For an open immersion j: (U, Φ) → (X, Φ), j_\* is the excision isomorphism.
- For finite surjective f: X → Y of connected smooth k-schemes, f_\* ∘ f^\* = deg(f) · id on W_•Ω_Y.

A proof route is the following.

1. Let d_X = dim X and d_Y = dim Y, so r = d_X − d_Y (for X, Y not pure-dimensional, work on each pair of connected components). Write K_X ≅ E(W_•ω_X)(d_X)[d_X] for the Witt residual complex of §4.1 and D_X = Hom(−, K_X), and likewise for Y. For f in Sm\*/S, compose µ_X: E(W_•Ω_X) ≅ D_X(W_•Ω_X)(−d_X)[−d_X], the transformation θ_f: f_ΦD_X → Γ_ΨD_Y(f_\*−) from the trace, D(f^\*), and `µ_Y^{−1}`: D_Y(W_•Ω_Y)(−d_Y)[−d_Y] ≅ E(W_•Ω_Y); the shifts combine to (d_Y − d_X)[d_Y − d_X] = (−r)[−r], which gives Rf_ΦW_•Ω_X → RΓ_ΨW_•Ω_Y(−r)[−r] and, after Ra_\* and Rlim, f_\*.
2. Functoriality and the compatibilities follow from those of θ_f and µ_X (CR12 Proposition 2.3.3).
3. f_\*f^\* = deg f for finite surjective f: such an f is flat, X and Y being regular of the same dimension, and Gros's computation goes through the trace of finite flat morphisms (SchemeAndStackFoundations §2.21, `trace_finite`).

**Checks.**

- For π: P¹_k → Spec k, π_\*: H¹(P¹, WΩ¹) → W(k) is an isomorphism and π_\* vanishes on H⁰(P¹, WO) (bidegree shift (−1, −1)).
- id_\* = id.
- At level n = 1, f_\* is the pushforward on Hodge cohomology with supports of Chatzistamatiou–Rülling 2011 (Grothendieck duality trace).
- For the relative Frobenius F: A¹ → `A¹^{(1)}` (finite of degree p), F_\*F^\* = p ≠ 1 on W_•O: the pushforward is not an inverse of pullback for nontrivial finite maps.
- For X smooth and connected, the relative Frobenius `F_{X/k}`: X → `X^{(1)}` is finite of degree `p^{dim X}` and F_\* F^\* = `p^{dim X}`; on a disconnected X the degree formula holds component by component.
- Negative control for surjectivity: the inclusion f of a k-point x in P¹ is finite but not surjective (r = −1). Over S = Spec k, f_\*f^\* sends 1 ∈ H⁰(P¹, WO) to ĉl(x)|_P¹ ∈ H¹(P¹, WΩ¹), of bidegree (1, 1) and trace 1, not to a multiple of 1 in bidegree (0, 0); the degree formula is for finite surjective maps only.

These results apply to CR12, Proposition 3.5.6 (ii), p. 64: the graph of a proper morphism acts by the pushforward; CR12, Lemmas 3.6.1–3.6.2, pp. 67–68: pushforward along a smooth alteration of a closed subset shifts bidegree by its codimension; CR12, Lemma 4.2.4, p. 77: u_\*u^\* = deg u for universal homeomorphisms between normal schemes.


### 4.3 Cycle classes in Hodge–Witt cohomology with supports

For a smooth k-scheme T and a family Φ of supports on T, define the Chow group with supports CH(T, Φ) as the free abelian group on integral closed subsets in Φ modulo divisors of rational functions on integral closed subsets that also lie in Φ (CR11, Definition 1.1.14, p. 10); proper pushforward, flat and refined Gysin pullback and exterior products are those of SchemeAndStackFoundations §§5.1–5.5 restricted to supports. For X smooth over k and an integral closed subscheme Z ⊂ X of codimension c, Gros's cycle class ĉl(Z) ∈ H^c_Z(X, WΩ^c_X) is the image of the logarithmic cycle class cl_log(Z) ∈ H^c_Z(X_ét, `W_•Ω^c_{X,log}`) (the Gysin image of 1 on the smooth locus of Z, extended by purity). Extended linearly, these classes form the unique morphism of weak cohomology theories with supports from Chow groups with supports (CH_\*, CH^\*, ×, 1) to (PĤ_\*, PĤ^\*, T, e), where PĤ(X, Φ) = ⊕_p R^pΓ_Φ WΩ^p_X. In particular cycle classes are compatible with proper pushforward, flat and Gysin pullback, exterior products, and ĉl(X) = 1. The class ĉl(Z) lives in cohomology with supports in Z; write ĉl(Z)|_X for its image in H^c(X, WΩ^c_X) under the map forgetting supports. For an integral divisor D ⊂ X, ĉl(D)|_X = c_1(O(D)), the image of the class of O(D) in H¹(X, O_X^×) under d log[−] (CR12, 3.2.3 (3)); thus ĉl({0})|_P¹ = c_1(O(1)), while ĉl({0}) itself lies in H¹_Z(P¹, WΩ¹) for Z = {0}. (Gro85, II, Définition 4.1.7, p. 50; CR12, 3.2.1–3.2.3 (the cycle class of Gros), pp. 50–51; CR12, Theorem 3.3.10 and Proposition 3.4.3, pp. 56–58; CR11, §1.1–1.2, Definition 1.1.1 and Theorem 1.2.3, pp. 5–15).

X smooth over k; classes live in Hodge–Witt cohomology with supports in Z; uniqueness is among morphisms of weak cohomology theories with supports.

*Needs:* §4.2; SchemeAndStackFoundations §5.1, Chow groups; SchemeAndStackFoundations §5.5, refined Gysin maps; SchemeAndStackFoundations §5.2, proper pushforward; SchemeAndStackFoundations §5.2, flat pullback; CrystallineCohomology §CR.4.8, *Logarithmic Hodge–Witt sheaves*.

The construction has the following API.

- For T smooth and a family Φ of supports, the supported Chow group CH(T, Φ); a map of support families induces the natural map, and for Φ all closed subsets it is CH(T).
- ĉl(Z) ∈ H^c_Z(X, WΩ^c_X) for Z ⊂ X closed integral of codimension c, X smooth.
- The unique morphism of weak cohomology theories with supports CH → PĤ extending ĉl.
- ĉl(f_\*α) = f_\*ĉl(α) for f proper on supports.
- ĉl(f^!α) = f^\*ĉl(α) for refined Gysin pullback along morphisms of smooth schemes.
- ĉl(α × β) = ĉl(α) × ĉl(β).
- ĉl([X]) = 1.
- For an integral divisor D ⊂ X, the image ĉl(D)|_X of ĉl(D) ∈ H¹_D(X, WΩ¹) in H¹(X, WΩ¹) is c_1(O(D)).

A proof route is the following.

1. Define cl_log by the Gysin isomorphism for smooth pairs and the purity isomorphism H^c_Z(X_ét, W_nΩ^c_log) ≅ `H^c_{Z∖Z_sing}(X∖Z_sing, W_nΩ^c_log)` (Gros), then map W_nΩ_log → W_nΩ.
2. Hodge–Witt cohomology with supports, with pushforward (§4.2), pullback and exterior product, is a weak cohomology theory with supports (CR12 Theorem 3.3.10); the criteria of Chatzistamatiou–Rülling 2011 Theorem 1.2.3 (degree formula for finite morphisms between smooth connected schemes of equal dimension, equality of the images of ĉl({0}) and ĉl({∞}) in H¹(P¹, WΩ¹), both being c_1(O(1)), compatibility with transversal divisors) give the unique morphism from Chow groups with supports (SchemeAndStackFoundations §5.1, Chow groups, SchemeAndStackFoundations §5.5, refined Gysin maps, SchemeAndStackFoundations §5.2, proper pushforward).

**Checks.**

- ĉl([X]) = 1 ∈ H⁰(X, WO_X).
- For a k-point x of P¹, π_\*ĉl(x) = 1 ∈ W(k).
- Supported class versus Chern class: let X be smooth and affine and D = V(t) a smooth integral divisor cut out by a global function t. At each level n, H¹_D(X, W_nΩ¹) = W_nΩ¹(X ∖ D)/W_nΩ¹(X), and ĉl(D) = i_\*(1) is the class of −d[t]/[t] = −d log[t] (CR12, Proposition 2.4.1, formula (2.4.1) with c = 1, and 3.2.3 (1)). Its image ĉl(D)|_X is c_1(O(D)) = 0, because O(D) ≅ O_X. The supported class is not zero: for X = A¹ and D = {0}, at level 1 it is the class of −dt/t in k[t, t⁻¹]dt/k[t]dt. Identifying ĉl(D) with c_1(O(D)) before forgetting supports would make it zero.
- ĉl does not distinguish rationally equivalent cycles after forgetting supports: ĉl({0})|_P¹ = ĉl({∞})|_P¹ = c_1(O(1)) in H¹(P¹, WΩ¹), although {0} ≠ {∞} as cycles; with supports the two classes lie in the different groups H¹_Z(P¹, WΩ¹) for Z = {0} and for Z = {∞}.
- For Φ = {∅}, CH(T, Φ) = 0, whereas for all closed supports it is CH(T).
- For T = P¹ and support the point ∞, CH_0(T, {∞}) = ℤ; after forgetting supports its generator maps to the degree-one generator of CH_0(P¹).

These results apply to CR12, §3.5, p. 61: Cor_ĉl turns proper correspondences into maps of relative Hodge–Witt cohomology; CR12, Lemma 3.5.5 and §3.5.7, pp. 63–64: local cup product with ĉl(Z).


### 4.4 The category of proper correspondences over a base

Let S be a k-scheme and CH(T, Φ) the Chow group with supports of §4.3. The category C_S has objects k-morphisms f: X → S with X smooth and quasi-projective over k; `Hom_{C_S}(X, Y)` := CH(X ×_k Y, P(X ×_S Y)), the Chow group with supports in the family P(X ×_S Y) of closed subsets of X ×_S Y that are proper over Y; composition is β ∘ α := `p_{13*}(p_{12}^*α · p_{23}^*β)` computed with the refined intersection product inside X × Y × Z with supports proper over Z. The identity of X is the diagonal Δ_X. If X and Y are proper over S, `Hom_{C_S}(X, Y)` = CH(X ×_S Y). (CR12, 3.5.1–3.5.2, p. 62; CR11, §1.3 (Correspondences), p. 18).

X, Y, Z smooth quasi-projective over k; supports proper over the target; the supported Chow groups defined here from the ordinary cycle and rational-equivalence operations of SchemeAndStackFoundations §§5.1–5.2.

*Needs:* §4.3 (Chow groups with supports); SchemeAndStackFoundations §5.1, Chow groups; SchemeAndStackFoundations §5.5, refined Gysin maps; SchemeAndStackFoundations §5.5, functoriality of refined Gysin maps; SchemeAndStackFoundations §5.5, compatibility of refined Gysin maps with proper pushforward and flat pullback; SchemeAndStackFoundations §5.2, proper pushforward; MotivesAndAlgebraicCycles §0.1, Chow correspondences; MotivesAndAlgebraicCycles §0.1, composition of Chow correspondences.

The construction has the following API.

- The category C_S of smooth quasi-projective S-schemes and proper correspondences.
- Composition via refined intersection products; associative with identity Δ_X.
- An S-morphism h: X → Y gives [Γ_h^t] ∈ Hom(Y, X); a proper h gives [Γ_h] ∈ Hom(X, Y).
- `[Γ_{g∘h}]` = [Γ_g] ∘ [Γ_h] for proper h, g.
- If X, Y are proper over S then Hom(X, Y) = CH(X ×_S Y).
- Restriction to opens U ⊂ S defines a functor C_S → C_U.

A proof route is the following.

1. Composition is well defined because the refined intersection of supports proper over Y and over Z is proper over Z after projection (refined Gysin maps with supports, SchemeAndStackFoundations §5.5, refined Gysin maps); associativity and unit follow from the functoriality of refined Gysin maps (SchemeAndStackFoundations §5.5, functoriality of refined Gysin maps, SchemeAndStackFoundations §5.5, compatibility of refined Gysin maps with proper pushforward and flat pullback).
2. For proper X, Y over S every closed subset of X ×_S Y is proper over Y.

**Checks.**

- The identity of X is [Δ_X].
- For a finite flat h: X → Y of degree d between smooth integral schemes over S = Y, [Γ_h] ∘ [Γ_h^t] = d·[Δ_Y].
- For S = Spec k, the graph of the structure map A¹ → Spec k is not proper over the target, so it is not an element of `Hom_{C_k}(A¹, Spec k)`, while its transpose lies in `Hom_{C_k}(Spec k, A¹)`: pushforward correspondences exist only for proper maps.
- For S = Spec k and X, Y smooth projective, `Hom_{C_k}(X, Y)` ⊗ ℚ is the space of rational Chow correspondences of MotivesAndAlgebraicCycles §0.1, Chow correspondences (all degrees together), and the compositions agree; C_k refines that category integrally and to quasi-projective schemes with supports proper over the target.

These results apply to CR12, Proposition 3.5.4, p. 63: the source category of the functor Ĥ(?/S); CR12, proof of Theorem 4.3.3, pp. 79–80: cycles α, β, γ on products of finite covers and the relations (4.3.1)–(4.3.4); CR12, Lemma 4.8.3, pp. 96–97: the averaging correspondence ∑_g [Γ(g)] for a finite group action.


### 4.5 Action of proper correspondences on relative Hodge–Witt cohomology

Let S be a k-scheme. There is a functor Ĥ(?/S): C_S → (de Rham–Witt modules over S), sending f: X → S to `⊕_{p,q}` R^qf_\*WΩ^p_X and a ∈ `Hom_{C_S}(X, Y)` of degree i to the sheafification of the maps Cor_ĉl(a_U): `Ĥ(f^{−1}U)(−i)` → `Ĥ(g^{−1}U)` on opens U ⊂ S, given by α ↦ `pr_{2*}(pr_1^*α ∪ ĉl(a_U))`. It is compatible with F, V and d. If Z is the transpose of the graph of an S-morphism h, Ĥ([Z]/S) = h^\*; if Z is the graph of a proper h, Ĥ([Z]/S) = h_\*. For h: S → T and Z ⊂ X ×_S Y integral, finite and surjective over Y (X, Y integral, f, g affine), Ĥ([Z]/T) = ⊕_i R^ih_\* Ĥ([Z]/S). (CR12, Theorem 1 (introduction), p. 3; 3.5.2–3.5.3, Proposition 3.5.4, pp. 62–63; CR12, Proposition 3.5.6 and Proposition 3.5.10, pp. 64–66).

Objects smooth quasi-projective over k; the twist (−i) shifts bidegree by the degree i of the correspondence.

*Needs:* §4.4; §4.3; §4.2.

The construction has the following API.

- Ĥ(a/S): Ĥ(X/S)(−i) → Ĥ(Y/S) for a ∈ `Hom_{C_S}(X, Y)` of degree i.
- Ĥ(b ∘ a/S) = Ĥ(b/S) ∘ Ĥ(a/S) and Ĥ(Δ_X/S) = id.
- Ĥ(a/S) commutes with F, V and d.
- Ĥ([Γ_h^t]/S) = h^\*.
- Ĥ([Γ_h]/S) = h_\* for proper h.
- For h: S → T and Z finite surjective over Y, Ĥ([Z]/T) = ⊕_i R^ih_\*Ĥ([Z]/S).

A proof route is the following.

1. On each open U ⊂ S, Cor_ĉl(a_U) is defined by pullback, cup product with the cycle class with supports (§4.3) and pushforward with supports (§4.2); compatibility with restriction maps holds because restriction is induced by transposes of graphs of open immersions (CR12 Lemma 3.5.3).
2. Functoriality: composition of correspondences corresponds to composition of maps by the projection formula and compatibility of cycle classes with refined intersection products (CR12 Proposition 3.5.4, Lemma 3.5.5).
3. Graphs: CR12 Proposition 3.5.6 via Proposition 3.4.7; base change along h: CR12 Proposition 3.5.10.

**Checks.**

- Ĥ([Δ_X]/S) = id.
- For a finite flat degree-d S-morphism h between integral smooth schemes, Ĥ([Γ_h] ∘ [Γ_h^t]/S) = d·id on Ĥ(Y/S).
- For S = Spec k and h: X → Y, Ĥ([Γ_h^t]/k) is the pullback H^q(Y, WΩ^p) → H^q(X, WΩ^p).
- For S = Spec k, X = Y = P¹ and a k-point x: [P¹ × {x}] acts by 0 on H⁰(P¹, WO) and sends α ∈ H¹(P¹, WΩ¹) to (∫α)·ĉl(x)|_P¹, while [{x} × P¹] acts as the identity on H⁰(P¹, WO) = W(k) and by 0 on H¹(P¹, WΩ¹); neither is the identity, but their sum is, as [Δ] = [{x} × P¹] + [P¹ × {x}] in CH¹(P¹ × P¹).

These results apply to CR12, Theorem 4.3.3, p. 79: the correspondences α, β, γ between finite covers act on R^if_\*WO_ℚ and give inverse isomorphisms up to degree; CR12, Proposition 4.2.7, p. 78: a universal homeomorphism and a finite cover combine into a projector; CR12, Theorem 4.8.1, p. 96: a correspondence decomposing the diagonal of the generic fibre kills positive-degree WO cohomology.


### 4.6 Correspondences supported in positive codimension kill WO- and Wω-cohomology up to bounded torsion

Let S be a k-scheme, X → S and Y → S in C_S, Z ⊂ X ×_S Y a closed subset proper over Y, and r ≥ 0. (i) If every point of Z maps to a point of codimension ≥ r in Y, there is N ≥ 1 with N · image(Ĥ([Z]/S)) ⊂ `⊕_{p ≥ r, q ≥ r}` R^qg_\*WΩ^p_Y. (ii) If X is equidimensional of dimension d and every point of Z maps to a point of codimension ≥ r in X, there is N ≥ 1 with N · `⊕_{p > d−r or q > d−r}` R^qf_\*WΩ^p_X ⊂ ker Ĥ([Z]/S). Write i = (codimension of Z in X × Y) − dim X for the degree of [Z] (X, Y connected; on each pair of connected components otherwise); Ĥ([Z]/S) raises both p and q by i (§4.5). (iii) In particular, take r = 1. The hypothesis of (i) with r = 1 says that the projection of Z to Y contains no irreducible component of Y (positive codimension on every component); for connected Y this means that the projection is a proper closed subset, but for disconnected Y a whole connected component is a proper closed subset of codimension 0. If every point of Z maps to a point of codimension ≥ 1 in Y, the composite of Ĥ([Z]/S) with the projection onto the target WO-part ⊕_q R^qg_\*WO_Y is killed by N; if moreover [Z] has degree 0, then Ĥ([Z]/S) maps ⊕_q R^qf_\*WO_X into ⊕_q R^qg_\*WO_Y and N kills this restriction. If X is equidimensional of dimension d and every point of Z maps to a point of codimension ≥ 1 in X, N kills the restriction of Ĥ([Z]/S) to the source Wω-part ⊕_q R^qf_\*Wω_X = ⊕_q R^qf_\*WΩ^d_X, whatever the degree of [Z]. A correspondence of nonzero degree whose projection to Y has positive codimension need not act by a torsion map on the source WO-part (the point Check below). (CR12, Lemma 3.6.1 and Lemma 3.6.2 with proofs, Remark 3.6.3, pp. 67–68).

Z proper over Y; N is the degree of a field extension coming from an alteration (N = 1 under resolution of singularities). The degree-zero hypothesis in the WO-consequence of (iii) is what the consumers use: the error cycles in §5.4 and §5.12 have the dimension of the target.

*Needs:* §4.5; §4.2; SchemeAndStackFoundations §4.19, `alteration_theorem`.

A proof route is the following.

1. (i) Choose by an alteration (SchemeAndStackFoundations §4.19, `alteration_theorem`) a smooth equidimensional D of dimension dim Y − r with π: D → Y proper and π(D) ⊃ pr_2(Z), and Z_D ⊂ X ×_S D of the same dimension mapping onto Z; with N = [k(Z_D) : k(Z)], N·[Z] = [Γ_π] ∘ [Z_D] in C_S, so N·Ĥ([Z]/S) factors through π_\*, which raises both p and q by r (§4.2).
2. (ii) Symmetrically N·[Z] = [Z_D] ∘ [Γ_π^t] with D → X of dimension d − r, and pullback to D kills degrees above d − r.
3. (iii) With r = 1 the target WO-part p = 0 lies in the complement of `⊕_{p ≥ r, q ≥ r}`, so (i) kills its projection; a degree-zero correspondence preserves p, so the source WO-part p = 0 lands in the target WO-part. The source Wω-part p = d lies in `⊕_{p > d−r}`, so (ii) applies to it with no condition on the degree.

**Checks.**

- On P¹ ×_k P¹ over S = Spec k, the cycle P¹ × {x} (supported over a point of the target, r = 1) has image in H¹(P¹, WΩ¹), so it acts by zero into H⁰(P¹, WO) (N = 1).
- The cycle {x} × P¹ (supported over a point of the source) kills H¹(P¹, WO), H⁰(P¹, WΩ¹) and H¹(P¹, WΩ¹), but not H⁰(P¹, WO).
- Point inclusion, a correspondence of nonzero degree: X = Spec k, Y = P¹_k, S = Spec k and Z = {x} ⊂ X × Y = P¹ for a k-point x. Z lies over the codimension-one subset {x} of Y and [Z] has degree 1. Ĥ([Z]/k) sends 1 ∈ H⁰(Spec k, WO) = W(k) to ĉl(x)|_P¹ ∈ H¹(P¹, WΩ¹), whose trace is 1 (§4.3), so no nonzero integer kills the action on the source WO-part; its projection to H⁰(P¹, WO) ⊕ H¹(P¹, WO) is zero, as (i) with r = 1 asserts. Without the degree-zero hypothesis the WO-consequence of (iii) would be false.
- Negative control for the codimension hypothesis: X = Y = Spec k ⊔ Spec k over S = Spec k, with points x_1, x_2 and y_1, y_2, and Z = {(x_1, y_1)}. Z is proper over Y and its projections {x_1} ⊂ X and {y_1} ⊂ Y are proper closed subsets, but each is a whole component, of codimension 0, so (iii) does not apply. Indeed [Z] has degree 0 − 0 = 0 and acts on H⁰(X, WO) = W(k)² → H⁰(Y, WO) = W(k)² (and likewise on Wω, which equals WO on a point) by diag(1, 0), and N·diag(1, 0) ≠ 0 for every N ≥ 1; with “proper closed subset” in place of positive codimension, (iii) would be false. The empty Z satisfies the hypothesis vacuously and acts by 0.

### Examples

- For X = Spec k, W_nω_X = W_n(k).
- For π: P¹ → Spec k, π_\*: H¹(P¹, WΩ¹) → W(k) is the trace, an isomorphism.
- ĉl(X) = 1 ∈ H⁰(X, WO_X).
- For S = Spec k and X, Y smooth projective, `Hom_{C_k}(X, Y)` ⊗ ℚ is the space of rational Chow correspondences of MotivesAndAlgebraicCycles §0.1, Chow correspondences (all degrees together), and the compositions agree; C_k refines that category integrally and to quasi-projective schemes with supports proper over the target.
- The diagonal acts as the identity.
- On P¹ ×_k P¹ over S = Spec k, the cycle P¹ × {x} (supported over a point of the target, r = 1) has image in H¹(P¹, WΩ¹), so it acts by zero into H⁰(P¹, WO) (N = 1).

### Dependencies

§0.1; SchemeAndStackFoundations §2.21, `SchemeDualizing`; SchemeAndStackFoundations §2.19, `upperShriek_compactification_independence`; SchemeAndStackFoundations §2.20, `sheafified_grothendieck_duality`; CrystallineCohomology §CR.4.6, *Classical de Rham–Witt complex as the initial V-pro-complex*; CrystallineCohomology §CR.3:duality.1, *Proper smooth crystalline trace*; §4.1; SchemeAndStackFoundations §2.7, cohomology with supports; SchemeAndStackFoundations §2.21, `trace_finite`; §4.2; SchemeAndStackFoundations §5.1, Chow groups; SchemeAndStackFoundations §5.5, refined Gysin maps; SchemeAndStackFoundations §5.2, proper pushforward; SchemeAndStackFoundations §5.2, flat pullback; CrystallineCohomology §CR.4.8, *Logarithmic Hodge–Witt sheaves*; §4.4; SchemeAndStackFoundations §5.5, functoriality of refined Gysin maps; SchemeAndStackFoundations §5.5, compatibility of refined Gysin maps with proper pushforward and flat pullback; MotivesAndAlgebraicCycles §0.1, Chow correspondences; MotivesAndAlgebraicCycles §0.1, composition of Chow correspondences; §4.3; §4.5; SchemeAndStackFoundations §4.19, `alteration_theorem`.



## Layer 5: Witt-rational singularities

A singularity is WO-rational if the higher direct images of WO_ℚ along a quasi-resolution vanish; quasi-resolutions (topological finite quotients mapping generically purely inseparably onto the singularity) exist by de Jong, where resolutions are not known to. The central theorem is that a quasi-resolution of a topological finite quotient has no higher Witt direct images, proved by letting correspondences between finite covers act; it makes the definition independent of the quasi-resolution, shows that finite quotients are Witt-rational, and gives quasi-birational invariance of Witt cohomology. For fibrations whose generic fibre has trivial CH_0 universally, a decomposition of the diagonal kills the positive-degree Witt direct images.

Finite-type k-schemes in this layer, including bases and auxiliary schemes, are quasi-projective over k, as in CR12 §§2–4. A generic fibre or scalar extension is quasi-projective over its own ground field. Point-count applications use projective schemes.


### 5.1 Finite quotients and topological finite quotients

Let k be a perfect field of characteristic p. A normal equidimensional k-scheme of finite type X is a finite quotient if there is a finite surjective morphism Y → X from a smooth k-scheme Y; a tame finite quotient if Y → X can be chosen of degree prime to p (as a locally constant function on Y); a topological finite quotient if there is a universal homeomorphism u: X → X′ onto a finite quotient X′. Equivalently (for X normal equidimensional) there is a universal homeomorphism X′ → X from a finite quotient X′. A universal homeomorphism u: X → Y of integral schemes with Y normal has degree p^n and factors the n-th relative Frobenius: there is v: Y → `X^{(n)}` with v ∘ u = `F^n_{X/k}` and (u × id) ∘ v = `F^n_{Y/k}`. (CR12, 4.2.1–4.2.2, Lemma 4.2.3, Definition 4.2.5, Remark 4.2.6, pp. 76–77; CR12, Introduction 0.2, p. 3).

A universal homeomorphism is integral, surjective and radicial. The morphisms here are finite type, hence these universal homeomorphisms are finite; for integral schemes with normal target they are exactly finite surjective maps with purely inseparable function-field extension.

*Needs:* SchemeAndStackFoundations §0.23, universal homeomorphisms; SchemeAndStackFoundations §0.29, relative Frobenius; Mathlib `AlgebraicGeometry.IsFinite`; Mathlib `AlgebraicGeometry.Surjective`; Mathlib `AlgebraicGeometry.Smooth`.

The construction has the following API.

- X normal equidimensional with a finite surjective Y → X, Y smooth over k.
- As above with degree prime to p.
- X admits a universal homeomorphism to a finite quotient.
- Smooth integral schemes are finite quotients.
- For X normal equidimensional, X is a topological finite quotient iff some finite quotient admits a universal homeomorphism to X.
- A universal homeomorphism u: X → Y of integral schemes with Y normal has deg u = p^n and factors `F^n_{X/k}` and `F^n_{Y/k}` as stated.

A proof route is the following.

1. In this finite-type setting a universal homeomorphism is finite, surjective and radicial; for integral schemes with normal target this means finite surjective with purely inseparable function-field extension (SchemeAndStackFoundations §0.23, universal homeomorphisms). Factorization of Frobenius: for X = Spec B, Y = Spec A affine, A ⊂ B with k(B)/k(A) purely inseparable of degree p^n; `F^{n*}_{X/k}` sends b ⊗ λ to `b^{p^n}λ`, and `b^{p^n}` ∈ k(A) ∩ B = A by normality of Y, giving v (CR12 Lemma 4.2.3; SchemeAndStackFoundations §0.29, relative Frobenius).
2. The equivalence of the two directions: `X′^{(n)}` is a finite quotient when X′ is, and Frobenius twists are isomorphisms of F_p-schemes since k is perfect (CR12 Remark 4.2.6).

**Checks.**

- For p odd, the quadric cone Spec k[x², xy, y²] = A²/{±1} is a tame finite quotient (degree 2).
- The affine cone over a smooth plane cubic is normal but not a topological finite quotient: finite quotients are WO-rational (§5.6), while the cone is not (§5.10), since H¹(E, `WO_{E,ℚ}`) ≠ 0 for every elliptic curve E.
- If X is a finite quotient then `X^{(1)}` is one, and the relative Frobenius X → `X^{(1)}` is a universal homeomorphism of degree `p^{dim X}`.
- Every smooth equidimensional k-scheme of finite type is a finite quotient: it is normal, and its identity is a finite surjective cover of degree 1 by a smooth scheme.
- Negative control for equidimensionality: Spec k ⊔ A¹_k is smooth and normal, but its components have dimensions 0 and 1, so it is not equidimensional and is not a finite quotient in the sense above; each of its two components is one.
- A^n_k/G for a finite group G acting linearly is a finite quotient.

These results apply to CR12, Definition 4.3.1, p. 79: the source of a quasi-resolution is a topological finite quotient; CR12, Theorem 4.3.3, p. 79: Witt cohomology of a quasi-resolution of a topological finite quotient; CR12, Corollary 4.4.7, p. 83: topological finite quotients have Witt-rational singularities.


### 5.2 Quasi-resolutions

A morphism f: X → Y between integral k-schemes is a quasi-resolution if its source X is a topological finite quotient, f is projective and surjective and finite over a dense open of Y, and the function-field extension k(Y) ⊂ k(X) is purely inseparable. Every integral k-scheme of finite type Y admits a quasi-resolution of the form X″/G → Y′ → Y, with Y′ → Y finite surjective from a normal integral Y′ with k(Y′)/k(Y) purely inseparable, X″ smooth integral quasi-projective with a finite group G acting, and X″/G → Y′ projective birational. Any two quasi-resolutions of Y are dominated by a third. For X, Y integral normal, a projective surjective generically finite f factors as X → Y′ → Y through the normalization Y′ of Y in k(X), with X → Y′ birational and Y′ → Y finite, a universal homeomorphism when k(X)/k(Y) is purely inseparable. (CR12, Definition 4.3.1, the factorization remark and Remark 4.3.2, p. 79; CR12, proof of Proposition 4.4.6 and of Corollary 4.5.1, pp. 83, 86; GNT19, Remark 3.1 and the following paragraph, p. 19; dJ97, Corollary 5.15 and proof, p. 620; dJ96, Corollary 7.4, pp. 88–89).

k perfect; de Jong's alteration theorem in its equivariant form (Galois alterations) gives existence. In the existence assertion, purely inseparable refers to k(Y′)/k(Y); Y′ → Y is a universal homeomorphism when Y is normal, not for arbitrary nonnormal Y.

*Needs:* §5.1; SchemeAndStackFoundations §4.19, `alteration_theorem`; SchemeAndStackFoundations §4.16, alterations; SchemeAndStackFoundations §0.20, finiteness of normalization; SchemeAndStackFoundations §1.17, `finiteGroupQuotient_projective`; Mathlib `AlgebraicGeometry.IsProper`; ClassicalAdicEtaleCohomology §5.4, plurinodal alteration theorem.

The construction has the following API.

- f: X → Y between integral k-schemes with X a topological finite quotient, f projective surjective generically finite, k(Y) ⊂ k(X) purely inseparable.
- Every integral k-scheme of finite type admits a quasi-resolution of the form X″/G → Y′ → Y.
- Any two quasi-resolutions of Y are dominated by a third over Y.
- A projective birational morphism from a smooth integral scheme is a quasi-resolution.
- If f is a quasi-resolution and u: Y → Y′ a universal homeomorphism of integral schemes, u ∘ f is a quasi-resolution.
- For X, Y normal, f factors as a birational projective X → Y′ followed by a universal homeomorphism Y′ → Y.

A proof route is the following.

1. Existence over every perfect field k is a target here over the excellent base Spec k. Apply the plurinodal alteration theorem of ClassicalAdicEtaleCohomology §5.4 (for a dominant proper morphism between integral excellent schemes), and the quotient construction in dJ97, proof of Corollary 5.15, p. 620 (cf. dJ96 Corollary 7.4, p. 88), in the form of CR12 Remark 4.3.2, p. 79. Normalize Y in the purely inseparable invariant function field to get finite Y′ → Y. The alteration X″ → Y is projective and G-equivariant for the trivial action on Y, and G fixes the invariant function field, so G acts on X″ by Y′-automorphisms and X″ → Y′ is projective (Y′ → Y being separated); the quotient X″/G, projective over Y′, with X″ → X″/G finite and structure sheaf the G-invariants, is SchemeAndStackFoundations §1.17, `finiteGroupQuotient_projective`, over the Noetherian base Y′, and X″/G → Y′ is birational. The finite map Y′ → Y need not be radicial when Y is not normal.
2. Domination: given two quasi-resolutions, apply existence to the closure of the image of Spec L in X_1 ×_Y X_2, where L is the residue field of the local artinian algebra k(X_1) `⊗_{k(Y)}` k(X_2) (purely inseparable over k(Y)).
3. Factorization through the normalization in k(X) (finiteness of normalization: SchemeAndStackFoundations §0.20, finiteness of normalization).

**Checks.**

- The blowup of the quadric cone at its vertex (a smooth surface) is a quasi-resolution.
- For X smooth projective and integral, the relative Frobenius `F_{X/k}`: X → `X^{(1)}` is a quasi-resolution (finite, surjective, purely inseparable of degree `p^{dim X}`, with source a finite quotient through its identity).
- Negative control for integrality: X = P¹_k ⊔ P¹_k is smooth projective but not integral, so `F_{X/k}` is not a quasi-resolution, although its restriction to each component, of degree p, is one.
- The identity of a smooth integral scheme is a quasi-resolution.
- For p odd, a degree-2 map from an elliptic curve to P¹ is projective, surjective, generically finite, but not a quasi-resolution: k(P¹) ⊂ k(E) is separable.
- A resolution of singularities X → Y (projective birational with X smooth) is a quasi-resolution.
- For the affine cusp over F_p, normalization Y′ = A¹ → Y is a finite universal homeomorphism; X″ = A¹ and G = 1 give a quasi-resolution.
- For a split nodal cubic, normalization has purely inseparable function-field extension of degree 1 but two points above the node: the existence assertion must not call its finite factor a universal homeomorphism.

These results apply to CR12, Definition 4.4.4, p. 82: WO- and Witt-rationality are tested on quasi-resolutions; HW23, §2, p. 6: WO-rationality is defined through quasi-resolutions since resolutions are not known beyond dimension three; CR12, Definition 4.5.2, p. 87: `WS_{0,S}` := `Rf_*WO_{X,ℚ}` for any quasi-resolution f.


### 5.3 Finite covers and universal homeomorphisms realize Witt cohomology as a direct factor

(i) For a universal homeomorphism u: X → Y between integral normal schemes, u_\*u^\* = deg(u) on WO_Y ⊕ Wω_Y and u^\*u_\* = deg(u) on u_\*(WO_X ⊕ Wω_X); hence u^\* and u_\* are isomorphisms after passing to the isogeny category. (ii) Let f: X → Y be finite surjective with X smooth integral, Y, Z normal integral, u: Z → Y a universal homeomorphism and a: Y → S a morphism; put β = `pr_{13*}[X ×_Y Z ×_Y X]` ∈ `Hom_{C_S}(X, X)`. Then f^\* ∘ u_\* induces isomorphisms R^i(au)_\*(WO_Z ⊕ Wω_Z)_ℚ ≅ Ĥ(β/S)(R^i(af)_\*(WO_X ⊕ Wω_X)_ℚ) for all i. (CR12, Definition 4.1.5, Lemma 4.1.6, Lemma 4.2.4 and proof, pp. 75–77; CR12, Proposition 4.2.7 and proof, pp. 78–79).

X smooth integral; Y, Z normal integral; pullback and pushforward on WO ⊕ Wω of normal schemes as in CR12 Definition 4.1.5.

*Needs:* §4.5; §4.2; §4.1; §5.1; §0.2.

A proof route is the following.

1. (i) u_\*u^\* = deg u by the degree formula (§4.2); u^\*u_\* = deg u reduces, by Proposition 4.1.4 (4) (Witt canonical sheaves are determined in codimension one) to smooth X, Y, where u_\* = Ĥ([Γ]/Y), u^\* = Ĥ([Γ^t]/Y) and [Γ^t] ∘ [Γ] = [X ×_Y X] = deg u · [Δ_X] because u is flat and a homeomorphism.
2. (ii) Ĥ(β/Y) = f^\*u_\*u^\*f_\* as endomorphisms of f_\*(WO_X ⊕ Wω_X) (reduce to smooth X, Y, Z by localization); by Proposition 3.5.10 its image after R^i(a)_\* is the image of f^\*u_\*u^\*f_\*, and (u^\*f_\*)(f^\*u_\*) = deg f · deg u.

**Checks.**

- For the Frobenius twist u = `F_{X/k}` of a smooth integral X, u_\*u^\* = `p^{dim X}` on `WO_{X^{(1)}}`.
- For X = Spec k ⊔ A¹_k, which is smooth but neither integral nor equidimensional, (i) applies on each component: the degree of `F_{X/k}` is the locally constant function with values 1 on Spec k and p on A¹, so u_\*u^\* acts by (1, p) on `WO_{X^{(1)}}` = W(k) × `WO_{A^1}`, not by `p^{dim X}` = p.


### 5.4 Witt cohomology of a quasi-resolution of a topological finite quotient

For a quasi-resolution f: X → Y of a topological finite quotient Y, pullback and pushforward give isomorphisms in the derived category of de Rham–Witt modules over Y up to isogeny: f^\*: `WO_{Y,ℚ}` ≅ `Rf_*WO_{X,ℚ}` and `Rf_*Wω_{X,ℚ}` ≅ `f_*Wω_{X,ℚ}[0]` ≅ `Wω_{Y,ℚ}`. In particular `R^if_*WO_{X,ℚ}` = 0 and `R^if_*Wω_{X,ℚ}` = 0 for i ≥ 1: there is N with p^N R^if_\*WO_X = 0 for all i ≥ 1. (CR12, Theorem 2 (introduction), p. 3, and the paragraph after it, p. 4; CR12, Theorem 4.3.3 with proof, and Lemma 4.3.4, pp. 79–81).

Y a topological finite quotient (not just normal); f a quasi-resolution; isogeny convention.

*Needs:* §5.2; §5.3; §4.6; §4.5; §4.4; §4.1; SchemeAndStackFoundations §5.2, `localization_exact`.

A proof route is the following.

1. Reduce to X, Y integral of dimension d and (by §5.3 (i)) finite quotients, with finite surjective a: X′ → X, b: Y′ → Y from smooth integral schemes; factor f = u ∘ π with π projective birational onto a normal X_1 and u a universal homeomorphism; choose a dense smooth open U_0 ⊂ Y over which all maps are flat and π is an isomorphism.
2. With α = [X′ ×_X X′], β = [Y′ ×_Y Y′], γ = [X′ ×_Y Y′] in C_Y, the relations deg b·(γ∘α) − deg a·(β∘γ), deg a·(γ^t∘β) − deg b·(α∘γ^t), (γ^t∘γ∘α) − deg a·deg b·deg u·α and (γ∘γ^t∘β) − deg a·deg b·deg u·β hold up to cycles supported over Y ∖ U_0, by the localization sequence and [Γ_u]∘[Γ_u^t] = deg u·[Δ] over U_0 (SchemeAndStackFoundations §5.2, `localization_exact`).
3. The error cycles have degree 0 and lie over the proper closed subset Y ∖ U_0 of the integral Y. The sources and targets X′ and Y′ are integral and surject onto Y, so the preimage of Y ∖ U_0 in each contains no component: the error cycles lie over closed subsets of positive codimension of both source and target, and by §4.6 (iii) they act by bounded torsion on the WO- and the Wω-parts. Hence Ĥ(γ/Y) and Ĥ(γ^t/Y) are inverse isomorphisms up to the nonzero integer deg a·deg b·deg u between the images of the projectors Ĥ(α/Y) and Ĥ(β/Y); §5.3 (ii) identifies these images with R^if_\*(WO_X ⊕ Wω_X)_ℚ and (WO_Y ⊕ Wω_Y)_ℚ, so the higher direct images vanish.
4. In degree 0: π^\*: `WO_{X_1}` → π_\*WO_X is an isomorphism (X_1 normal, π birational), and u^\* is an isomorphism up to isogeny; for Wω, the pushforward is an isomorphism up to isogeny once f^\* is (CR12 Lemma 4.3.4, via duality for W_nY).

**Checks.**

- For the minimal resolution X → Y of the quadric cone A²/{±1} (p odd), `R¹f_*WO_{X,ℚ}` = 0; the exceptional curve is a P¹, consistent with §2.2 (H¹(P¹, WO_ℚ) = 0).
- For X smooth integral and f = `F_{X/k}` (a quasi-resolution of `X^{(1)}`, §5.2), the statement is the isogeny f_\*f^\* = `p^{dim X}`.


### 5.5 WO-rational and Witt-rational singularities

An integral k-scheme S has Witt-rational singularities if for every quasi-resolution f: X → S: (1) f^\*: `WO_{S,ℚ}` → `f_*WO_{X,ℚ}` is an isomorphism; (2) `R^if_*WO_{X,ℚ}` = 0 for all i ≥ 1; (3) `R^if_*Wω_{X,ℚ}` = 0 for all i ≥ 1. If only (1) and (2) hold, S has WO-rational singularities. Here the subscript ℚ is the isogeny convention: (2) means that a power of p kills R^if_\*WO_X. Equivalently, it suffices that one quasi-resolution satisfies the conditions (one quasi-resolution suffices), and for normal S condition (1) is automatic; in particular, if S is normal and has a resolution of singularities, S is WO-rational iff `R^if_*WO_{X,ℚ}` = 0 for i > 0 for that resolution. (CR12, Definition 4.4.4, Remark 4.4.5, Proposition 4.4.6 and the sentence after it, pp. 82–83; CR12, Corollary 4.5.1 and Definition 4.5.2, pp. 86–87; HW23, §2, p. 6; GNT19, §3 condition (a) and Remark 3.1, p. 19).

S integral of finite type over a perfect field k; the conditions are local on S. BE-Witt-rational singularities (Blickle–Esnault: a splitting of WO_S ⊗ ℚ → Rf_\*WO_X ⊗ ℚ for a generically étale alteration) are a weaker notion and are not used to define this one.

*Needs:* §5.2; §5.4; §5.3; §0.2; §4.1.

The construction has the following API.

- S integral; every quasi-resolution f satisfies (1) and (2).
- S integral; every quasi-resolution satisfies (1), (2) and (3).
- S is WO-rational iff some quasi-resolution satisfies (1) and (2) (one quasi-resolution suffices).
- If f: X → S is a resolution of singularities of a normal S, S is WO-rational iff `R^if_*WO_{X,ℚ}` = 0 for i > 0, iff some p^N kills every R^if_\*WO_X, i > 0.
- Witt-rational ⇒ WO-rational.
- For S normal, condition (1) holds for every quasi-resolution.

A proof route is the following.

1. One quasi-resolution suffices: any two quasi-resolutions are dominated by a third (§5.2), and the dominating map between them is a quasi-resolution of a topological finite quotient, so §5.4 and the Leray spectral sequence transfer the conditions (CR12 Proposition 4.4.6, with the analogue for WO).
2. For S normal, factor f = u ∘ π with π birational onto a normal X_1 and u a universal homeomorphism; π^\* is an isomorphism on WO and u^\* is one up to isogeny (§5.3 (i)), giving (1) (CR12 Remark 4.4.5).

**Checks.**

- For p odd, the quadric cone A²/{±1} has Witt-rational singularities; its minimal resolution has exceptional curve P¹ with H¹(P¹, WO_ℚ) = 0.
- The cone over an elliptic curve E is not WO-rational: R¹f_\*WO_ℚ = H¹(E, `WO_{E,ℚ}`) ≠ 0 at the vertex (dimension 1 of slope 0 if E is ordinary, dimension 2 of slope 1/2 if supersingular).
- WO-rational does not imply Cohen–Macaulay: for G = ℤ/p^n acting linearly on V with dim V > dim V^G + 2 over algebraically closed k, A(V)/G is a finite quotient (hence Witt-rational) but not CM, hence not a rational singularity.
- For a resolution with proper exceptional fibre E over an isolated singularity, the isogeny condition R¹f_\*WO_ℚ = 0 agrees with H¹(E, WO_E) ⊗ ℚ = 0 (§0.8, proper case).
- Smooth integral schemes and integral topological finite quotients are Witt-rational (§5.6); a disconnected one is not integral, and the definition applies to each of its connected components.

These results apply to HW23, Corollary 4.6 and proof, p. 21 (arXiv v2): Q-factorial klt fourfolds over a perfect field of characteristic p > 5 with a log resolution have WO-rational singularities; GNT19, Theorem 3.16, p. 26: klt threefolds (p > 5) have WO-rational singularities; CR12, Corollary 4.4.16, p. 85: point counts of quasi-birational WO-rational projective schemes agree mod q; §5.7: the intrinsic characterization, S is WO-rational iff `WO_{S,ℚ}` → `WS_{0,S}` is an isomorphism; §6.5: the point-count consequence.


### 5.6 Topological finite quotients are Witt-rational; invariance under universal homeomorphisms

(i) Every integral topological finite quotient over k has Witt-rational singularities; a topological finite quotient is normal, hence the disjoint union of its connected components, each of which is an integral topological finite quotient. (ii) If u: Y → Y′ is a universal homeomorphism between normal schemes, Y has Witt-rational (resp. WO-rational) singularities iff Y′ has. (CR12, Theorem 3 (introduction), p. 4; Corollary 4.4.7, Remark 4.4.8, Proposition 4.4.9 with proof, p. 83).

k perfect; Y, Y′ normal integral in (ii).

*Needs:* §5.4; §5.5; §5.1.

A proof route is the following.

1. (i) A topological finite quotient Y admits quasi-resolutions; §5.4 gives (1)–(3) of §5.5 for every quasi-resolution.
2. (ii) If f is a quasi-resolution of Y then u ∘ f is a quasi-resolution of Y′, and R^i(u∘f)_\* = u_\*R^if_\* since u is finite; one quasi-resolution suffices (§5.5).

**Checks.**

- The normalization of a smooth integral scheme in a purely inseparable extension of its function field is Witt-rational.


### 5.7 The Witt singularity complexes of an integral scheme

Let S be an integral k-scheme of dimension d. For quasi-resolutions f: X → S and g: Y → S, X and Y are quasi-birational over S, and every quasi-birational correspondence (Z, π_X, π_Y) induces the same isomorphisms `Rf_*WO_{X,ℚ}` ≅ `Rg_*WO_{Y,ℚ}` and `Rf_*Wω_{X,ℚ}` ≅ `Rg_*Wω_{Y,ℚ}` in the derived category of de Rham–Witt modules over S up to isogeny, compatibly with composition for three quasi-resolutions. Hence `WS_{0,S}` := `Rf_*WO_{X,ℚ}` and `WS_{d,S}` := `Rf_*Wω_{X,ℚ}` are well defined up to canonical isomorphism, with F and V, and S is WO-rational iff `WO_{S,ℚ}` → `WS_{0,S}` is an isomorphism, Witt-rational iff in addition `H^i(WS_{d,S})` = 0 for i ≥ 1. (CR12, Definition 4.4.10, Corollary 4.4.11 with proof, pp. 83–84; CR12, Corollary 4.5.1 with proof, Definition 4.5.2, pp. 86–87).

S integral of finite type over a perfect field. Two integral S-schemes are quasi-birational over S if they admit quasi-resolutions from a common Z.

*Needs:* §5.2; §5.4; §5.5.

The construction has the following API.

- `WS_{0,S}` ∈ D⁺(de Rham–Witt modules over S up to isogeny), with `WS_{0,S}` ≅ `Rf_*WO_{X,ℚ}` for any quasi-resolution f.
- `WS_{d,S}` ≅ `Rf_*Wω_{X,ℚ}`.
- For each quasi-resolution f an isomorphism ι_f: `WS_{0,S}` ≅ `Rf_*WO_{X,ℚ}`, with ι_g ∘ `ι_f^{−1}` induced by any quasi-birational correspondence.
- The natural map `WO_{S,ℚ}` → `WS_{0,S}`.
- S is WO-rational iff `WO_{S,ℚ}` → `WS_{0,S}` is an isomorphism.
- F and V act on `WS_{0,S}` and `WS_{d,S}` compatibly with the isomorphisms ι_f.

A proof route is the following.

1. Quasi-birationality: k(X) `⊗_{k(S)}` k(Y) is local artinian with residue field L purely inseparable over k(S); a quasi-resolution of the closure of Spec L in X ×_S Y is a quasi-birational correspondence.
2. A correspondence Z induces `Rf_*WO_{X,ℚ}` ≅ `Rf_*Rπ_{X*}WO_{Z,ℚ}` = `Rg_*Rπ_{Y*}WO_{Z,ℚ}` ≅ `Rg_*WO_{Y,ℚ}` by §5.4 (X, Y are topological finite quotients).
3. Independence: two correspondences V, V′ are dominated by a quasi-resolution of a component of V ×_S V′, and k(X), k(Y) have a unique embedding over k(S) into the purely inseparable residue field of k(V) `⊗_{k(S)}` k(V′) (CR12 Corollaries 4.4.11 and 4.5.1).

**Checks.**

- For S with an isolated singularity s and a resolution f that is an isomorphism over S ∖ {s} with exceptional fibre E, `H^i(WS_{0,S})` = H^i(E, `WO_{E,ℚ}`) at s for i > 0.
- For the cone S over an elliptic curve E, `H¹(WS_{0,S})` ≠ 0, so `WO_{S,ℚ}` → `WS_{0,S}` is not an isomorphism.
- For S smooth and the quasi-resolution `F_{S/k}`: S → `S^{(1)}`, ι agrees with the pullback along Frobenius up to the isogeny `p^{dim S}`.
- For S smooth, `WS_{0,S}` = `WO_{S,ℚ}` and `WS_{d,S}` = `Wω_{S,ℚ}`.

These results apply to CR12, Theorem 4.8.1, p. 96: the higher direct images along a fibration with CH_0-trivial generic fibre are `H^i(WS_{0,Y})`; CR12, Definition 4.5.2, p. 87: intrinsic characterization of WO- and Witt-rationality; §5.12: the target of the comparison.


### 5.8 Quasi-birational invariance of Witt cohomology for Witt-rational schemes

Over a k-scheme S, take integral S-schemes f: X → S and g: Y → S, both with WO-rational singularities and quasi-birational over S. A quasi-birational correspondence induces `Rf_*WO_{X,ℚ}` ≅ `Rg_*WO_{Y,ℚ}` (and `Rf_*Wω_{X,ℚ}` ≅ `Rg_*Wω_{Y,ℚ}` when X, Y are Witt-rational), compatible with F and V. In particular, for S = Spec k: H^i(X, `WO_{X,ℚ}`) ≅ H^i(Y, `WO_{Y,ℚ}`) for all i, and if X, Y are projective, `H^i_rig(X/K)^{<1}` ≅ `H^i_rig(Y/K)^{<1}` Frobenius-equivariantly. (CR12, Corollary 1 (introduction), p. 5; Corollary 4.4.11, Remark 4.4.14, Corollary 4.4.15 with proof, pp. 84–85).

X, Y integral with WO-rational singularities, quasi-birational over S.

*Needs:* §5.7; §5.5; §3.6; §0.2.

A proof route is the following.

1. Given a quasi-birational correspondence (Z, π_X, π_Y), π_X and π_Y are quasi-resolutions and X, Y are WO-rational, so `WO_{X,ℚ}` ≅ `Rπ_{X*}WO_{Z,ℚ}` and similarly for Y; compose (CR12 Corollary 4.4.11, Remark 4.4.14).
2. For S = Spec k take cohomology; for projective X, Y apply §3.6 (proper case).

**Checks.**

- A smooth projective integral X and its blowup along a smooth closed subscheme C ≠ X have the same H^i(−, WO_ℚ): both are smooth integral, hence Witt-rational, and the blowup is a quasi-resolution of X. For C = X the blowup is empty and H⁰ drops from H⁰(X, WO_ℚ) ≠ 0 to 0.


### 5.9 Rational singularities are Witt-rational

Let S be an integral k-scheme. (1) If S is normal and has rational singularities, that is, admits a resolution f: X → S (f projective and birational, X smooth) with R^if_\*O_X = 0 = R^if_\*ω_X for i > 0, then S is Witt-rational. (2) Witt-rational ⇒ WO-rational ⇒ BE-Witt-rational (WO_S ⊗ ℚ → Rg_\*WO_X ⊗ ℚ splits for every alteration g from a smooth scheme). The implication (1) is strict. (CR12, Definitions 4.4.1–4.4.2, Proposition 4.4.3, Proposition 4.4.17 with proof, pp. 81–86; GNT19, Lemma 2.19, p. 16).

S integral of finite type over a perfect field; in (1) S is normal and a resolution exists (both are part of the definition of rational singularities). Normality is needed: the normalization P¹ → S of a split nodal cubic is finite, so all its higher direct images vanish, yet S is not WO-rational.

*Needs:* §5.5; §5.6; §5.3; §0.7; §4.1; SchemeAndStackFoundations §2.20, `sheafified_grothendieck_duality`.

A proof route is the following.

1. Rational ⇒ Witt-rational: S is normal and f projective birational, so f_\*O_X = O_S; from 0 → `W_{n−1}O_X` →(V) W_nO_X → O_X → 0, R^if_\*O_X = 0 and induction on n, R^if_\*W_nO_X = 0 for i > 0 and W_nO_S ≅ f_\*W_nO_X; with 0 → `W_{n−1}ω_X` →(p) W_nω_X → ω_X → 0 (§4.1) and duality on the Cohen–Macaulay scheme S (S is Cohen–Macaulay: Rf_\*O_X = O_S and `R^{>0}f_*ω_X` = 0 give ω_S^• ≅ f_\*ω_X[d] by Grothendieck duality for the proper f, SchemeAndStackFoundations §2.20, `sheafified_grothendieck_duality`), the same for Wω; pass to the limit with §0.7.
2. WO-rational ⇒ BE: choose a quasi-resolution by a finite quotient X with a smooth finite cover X′ → X; the pushforward splits the pullback up to the degree (§5.3), a fortiori after ⊗ℚ.
3. Strictness: §5.6 with the non-CM finite quotients of Ellingsrud–Skjelbred.

**Checks.**

- A rational surface singularity (e.g. a du Val singularity in characteristic p with a rational resolution) is Witt-rational.
- Negative control for normality: for the split nodal cubic S and its normalization f: P¹ → S, f is finite, so `R^{>0}f_*O_{P¹}` = 0 = `R^{>0}f_*ω_{P¹}`; but `f_*O_{P¹}` ≠ O_S, and H¹(S, WO_S)_K = K while H¹(P¹, WO)_K = 0, so S is not WO-rational: the node has two points in its fibre and condition (1) of §5.5 fails.


### 5.10 WO-rationality of isolated singularities through the exceptional fibre

Let S be an integral normal k-scheme with an isolated singular point s and f: X → S a resolution of singularities that is an isomorphism over S ∖ {s}, with exceptional fibre E = `f^{−1}(s)`. Then S has WO-rational singularities iff H^i(E, `WO_{E,ℚ}`) = 0 for all i > 0 (equivalently H^i(E, WO_E) ⊗ ℚ = 0, E being proper). Separately, the cone over a smooth projective geometrically connected variety Z ⊂ P^N (with a resolution by the blowup of the vertex, E ≅ Z) is WO-rational iff H^i(Z, `WO_{Z,ℚ}`) = 0 for i > 0. (CR12, Corollary 4.6.4, p. 90; introduction, pp. 5–6; CR12, Theorem 4.7.4, p. 93).

S normal with an isolated singularity; a resolution that is an isomorphism away from s exists (an assumption).

*Needs:* §2.2; §5.5; §0.2; §0.8; §0.6; §0.5.

A proof route is the following.

1. §2.2 gives `R^if_*WO_{X,ℚ}` = H^i(E, `WO_{E,ℚ}`) as skyscraper sheaves at s for i > 0; the resolution is a quasi-resolution and one suffices (§5.5); S is normal so condition (1) holds.
2. For E proper, the isogeny and tensor conventions agree on H^i (§0.8).
3. For the cone corollary, the blowup of the vertex is smooth and has exceptional fibre Z; its other geometric fibres are points. Thus all geometric fibres are connected, even when the cone is not normal, so §0.5 (ii) proves condition (1). Apply the higher-direct-image criterion to this quasi-resolution. See CR12 Theorem 4.7.4, p. 93.

**Checks.**

- The cone over a smooth plane conic is WO-rational; the cone over a smooth plane curve of genus g ≥ 1 is not, since H¹(C, WO_C)_K, the slope-[0, 1) part of H¹_crys(C), has dimension ≥ g.
- A normal surface singularity whose minimal resolution has exceptional curves forming a tree of smooth rational curves has H¹(E, `WO_{E,ℚ}`) = 0, by Mayer–Vietoris (§0.6).
- For q odd and a nonsquare a, Z = V(x² − ay²) ⊂ P¹ is Spec `F_{q²}`. Its higher Witt cohomology is zero, but the cone is not WO-rational: at the vertex W(F_q)_ℚ → `W(F_{q²})_ℚ` is not onto (dimensions 1 and 2 over W(F_q)[1/p]). Geometric connectedness fails since Z splits into two geometric points.


### 5.11 Decomposition of the diagonal for CH_0-trivial varieties

This is the rational-coefficient extension of MotivesAndAlgebraicCycles §0.6, whose fixed-support input is integral. Let X be a smooth projective geometrically integral variety of dimension d over a field k, and suppose CH_0(X_Ω) ⊗ ℚ = ℚ via the degree, where Ω is an algebraic closure of k(X). Then there are N ≥ 1, a zero-cycle ξ on X, a divisor D ⊂ X and a d-dimensional cycle Γ supported on X × D such that N·[Δ_X] = [ξ × X] + Γ in CH^d(X × X). More generally, for a smooth projective family X′_η over the generic point of a base, with CH_0 trivial over every field extension, the same holds for the generic fibre with N, D, ξ over η, which spreads out over a dense open of the base up to cycles supported over a divisor of the base. (BS83, Proposition 1, cited by locator; ESN03, §1, (1.1) and the argument after it, p. 1; CR12, proof of Theorem 4.8.1, (4.8.5)–(4.8.7), pp. 98–99).

X smooth projective geometrically integral; the CH_0 hypothesis over an algebraic closure of k(X) (or over every extension of the base field).

*Needs:* SchemeAndStackFoundations §5.1, Chow groups; SchemeAndStackFoundations §5.2, `localization_exact`; SchemeAndStackFoundations §5.2, flat pullback; MotivesAndAlgebraicCycles §2.2, torsion kernel of base change to an algebraic closure; MotivesAndAlgebraicCycles §0.1, Chow correspondences; MotivesAndAlgebraicCycles §0.6, decomposition of the diagonal.

A proof route is the following.

1. For the rational CH_0 hypothesis choose a closed point ξ_0 of positive degree e. Over k(X), the class e[η_X] − [ξ_0] becomes zero after tensoring with ℚ over Ω; clear its denominator, then use the torsion-kernel statement of MotivesAndAlgebraicCycles §2.2 to descend after multiplication by a further nonzero integer. The resulting integral equality on the generic fibre is the input for the fixed-support diagonal argument in MotivesAndAlgebraicCycles §0.6, applied after transposing its factors; localization supplies Γ on X × D. Absorb all multipliers into N and ξ.
2. For families apply the same argument over the generic point and spread the resulting cycles and rational equivalences over a dense open, as in CR12 (4.8.5)–(4.8.7), pp. 98–99.

**Checks.**

- For X = P^d: [Δ] = [pt × P^d] + Γ with Γ supported on P^d × H for a hyperplane H (N = 1).
- For X an elliptic curve the hypothesis fails: CH_0(X_Ω) ⊗ ℚ ⊃ X(Ω) ⊗ ℚ is huge.


### 5.12 Vanishing of higher direct images of WO for fibrations with CH_0-trivial generic fibre

Let X be an integral k-scheme with Witt-rational singularities and f: X → Y a projective morphism to an integral normal scheme Y, with generic point η and smooth generic fibre X_η, such that, for each field L containing k(η), degree identifies CH_0(X_η `×_{k(η)}` L) with rational coefficients with ℚ. Put r := dim X − dim Y, the dimension of X_η. Then, in the isogeny category of de Rham–Witt modules over Y: (i) `⊕_{i>0}` `R^if_*WO_{X,ℚ}` ≅ `⊕_{i>0}` `H^i(WS_{0,Y})`, compatibly with F and V; (ii) for every i ≥ 0, `R^if_*Wω_{X,ℚ}` ≅ `H^{i−r}(WS_{dim Y,Y})`, where cohomology in negative degrees is 0, by an isomorphism compatible with F and V that raises the de Rham–Witt grading by r (the twist (−r) of §4.2). In particular `R^if_*Wω_{X,ℚ}` = 0 for i < r and `R^rf_*Wω_{X,ℚ}` ≅ `H^0(WS_{dim Y,Y})`. When Y is itself Witt-rational, `R^if_*WO_{X,ℚ}` = 0 for all i > 0 and `R^if_*Wω_{X,ℚ}` = 0 for all i ≠ r; for Y = Spec k: H^i(X, `WO_{X,ℚ}`) = 0 for i > 0, and H^i(X, `Wω_{X,ℚ}`) = 0 for i ≠ dim X. (CR12, Theorem 5 (introduction), p. 6; Theorem 4.8.1, 4.8.2, Lemma 4.8.3, Proposition 4.8.4 and the proof of Theorem 4.8.1, pp. 96–99; Definition 4.5.4 and Theorem 4.5.6 with proof, pp. 88–89. The WO-statement (i) is CR12's. CR12 prints the Wω-statement with `⊕_{i>0}` on both sides and no shift; that is false for P¹ → Spec k, and (ii) is the statement its argument proves once the bidegree shift by r of the pushforward along Ỹ → X′ in the proof of Proposition 4.8.4 is kept.)

X Witt-rational (e.g. smooth); f projective; Y normal integral; X_η smooth of dimension r; universal CH_0-triviality of X_η after ⊗ℚ. In (ii) the degree i = r on X corresponds to degree 0 on Y and cannot be discarded.

*Needs:* §5.11; §5.7; §5.2; §5.3; §4.6; §4.5; §4.2; §5.5.

A proof route is the following.

1. Choose X′ → X′/G → X″ → X as in §5.2 (X′ smooth, G finite acting, X″ → X a universal homeomorphism) and the Stein factorization Y″ → Y of X″ → Y, a universal homeomorphism; put f′: X′ → Y and n = dim X′ = dim X.
2. The averaging correspondence P = `∑_{g∈G}[Γ(g)]` on X′ ×_Y X′ has degree 0 and P² = |G|·P. Its image on `⊕_i R^if′_*(WO ⊕ Wω)_{X′,ℚ}` is `⊕_i R^if_*(WO ⊕ Wω)_{X,ℚ}`, degree by degree and including i = 0, because X is Witt-rational and X′/G → X is a quasi-resolution (CR12 Lemma 4.8.3 and its proof; §5.3, §5.5).
3. CH_0(X′_η ×_η L)^G ⊗ ℚ = ℚ for all L by push-pull along X′_η → X_η; §5.11 gives nonzero integers N_1, N_2, M_1, M_2 and a closed point α of X′_η such that N_1P + N_2[A_1] is supported over a divisor of the target X′ or over a divisor of Y, and M_1P + M_2[A_2] over a divisor of the source X′ or over a divisor of Y, with A_1, A_2 the closures of α × X′_η and X′_η × α in X′ ×_Y X′. All these cycles have dimension n, hence degree 0.
4. By §4.6 (iii), on `⊕_{i>0}` R^if′_\*WO_ℚ the operator Ĥ(P/Y) is a nonzero rational multiple of Ĥ([A_1]/Y) (degree-zero error cycles over a divisor of the target X′ or over the preimage of a divisor of Y, which has positive codimension in X′ because X′ is integral and dominates Y), and on all of `⊕_{i≥0}` R^if′_\*Wω_ℚ it is a nonzero rational multiple of Ĥ([A_2]/Y) (error cycles over closed subsets of positive codimension of the source X′, by the same argument); so the images of P and of A_1, resp. A_2, agree on these parts.
5. Let ı: Ỹ → X′ be an alteration of the closure of α with Ỹ smooth integral of dimension dim Y, so that f′ı is an alteration of Y. The graph of ı, the closure Z of X′_η ×_η Ỹ_η in X′ ×_Y Ỹ, and the closure Q of Ỹ_η ×_η Ỹ_η satisfy [Γ(ı)] ∘ [Z] = d·[A_2], [Z] ∘ [Γ(ı)] = [Q], [A_2] ∘ [A_2] = e·[A_2] and [Q] ∘ [Q] = g·[Q] with d, e, g nonzero, up to cycles over a proper closed subset of the integral Y; their projections to the sources X′ and Ỹ, which are integral and dominate Y, have positive codimension, so they act by bounded torsion on the source Wω-parts (§4.6 (iii)). Ĥ([Γ(ı)]/Y) is the pushforward ı_\*, which raises p and q by r = dim X′ − dim Ỹ (§4.2); so Ĥ([Z]/Y) and Ĥ([Γ(ı)]/Y) are inverse isomorphisms up to nonzero integers between the image of Ĥ([A_2]/Y) in `R^if′_*Wω_{X′,ℚ}` and the image of Ĥ([Q]/Y) in `R^{i−r}(f′ı)_*Wω_{Ỹ,ℚ}`, for every i. For WO the same argument with the transposes uses the pullback ı^\*, which preserves degrees, and gives the image of Ĥ([Q]/Y) in `R^i(f′ı)_*WO_{Ỹ,ℚ}` for i > 0 (CR12 Proposition 4.8.4).
6. For an alteration Ỹ → Y with smooth source, the projector given by Q divided by the degree has image `H^j(WS_{0,Y})` on `R^j(f′ı)_*WO_{Ỹ,ℚ}` for j > 0 and `H^j(WS_{dim Y,Y})` on `R^j(f′ı)_*Wω_{Ỹ,ℚ}` for every j ≥ 0: the proof of CR12 Theorem 4.5.6 factors the projector through `R^jg_*` of a quasi-resolution g in each degree j ≥ 0, and the comparison of two alterations (CR12 Proposition 4.5.3 (3)) consists of degree-zero correspondences, which preserve every degree. Combining steps 2–6 gives (i) and (ii); the vanishing for Witt-rational Y is §5.7 (`H^j(WS_{0,Y})` = 0 and `H^j(WS_{dim Y,Y})` = 0 for j ≥ 1).

**Checks.**

- For X = P^n_Y → Y with Y smooth integral, r = n: R^if_\*WO_ℚ = 0 for i > 0, and the projective-bundle formula `Rf_*W_mΩ_X` ≅ `⊕_{j=0}^{n}` `W_mΩ_Y(−j)[−j]` (CR12 Lemma 2.4.3 and (2.4.2)) gives `R^if_*Wω_X` = 0 for i ≠ n and `R^nf_*Wω_X` ≅ `Wω_Y(−n)`, as (ii) asserts with `WS_{dim Y,Y}` = `Wω_{Y,ℚ}`.
- For f: P¹_k → Spec k, r = 1: H⁰(P¹, `Wω_ℚ`) = 0 = `H^{−1}(WS_{0,k})`, H¹(P¹, `Wω_ℚ`) = W(k)_ℚ (the trace of §4.1) ≅ `H^0(WS_{0,k})` = W(k)_ℚ, and H^i = 0 for i ≥ 2. The unshifted formula `⊕_{i>0}` `R^if_*Wω_{X,ℚ}` ≅ `⊕_{i>0}` `H^i(WS_{0,k})` would give W(k)_ℚ ≅ 0.
- For the identity of a smooth integral Y, r = 0: `R^0id_*Wω_{Y,ℚ}` = `Wω_{Y,ℚ}` = `H^0(WS_{dim Y,Y})` and all higher terms vanish on both sides.
- For Y = Spec k and X a smooth projective rational (or rationally chain connected) variety of dimension n, H^i(X, `WO_{X,ℚ}`) = 0 for i > 0 and H^i(X, `Wω_{X,ℚ}`) = 0 for i ≠ n, while H^n(X, `Wω_{X,ℚ}`) ≅ W(k)_ℚ by the trace.

### Examples

- Every smooth equidimensional k-scheme of finite type is a finite quotient; Spec k ⊔ A¹_k, whose components have dimensions 0 and 1, is not.
- A resolution of singularities X → Y (projective birational with X smooth) is a quasi-resolution.
- For the Frobenius twist u = `F_{X/k}` of a smooth integral X, u_\*u^\* = `p^{dim X}` on `WO_{X^{(1)}}`; on Spec k ⊔ A¹_k it acts by (1, p) componentwise.
- For the minimal resolution X → Y of the quadric cone A²/{±1} (p odd), `R¹f_*WO_{X,ℚ}` = 0; the exceptional curve is a P¹, consistent with §2.2 (H¹(P¹, WO_ℚ) = 0).
- Smooth integral schemes and integral topological finite quotients are Witt-rational (§5.6).
- The normalization of a smooth integral scheme in a purely inseparable extension of its function field is Witt-rational.
- For S smooth integral of dimension d, `WS_{0,S}` = `WO_{S,ℚ}` and `WS_{d,S}` = `Wω_{S,ℚ}`.
- A smooth projective integral X and its blowup along a smooth closed subscheme C ≠ X have the same H^i(−, WO_ℚ).
- A rational surface singularity (e.g. a du Val singularity in characteristic p with a rational resolution) is Witt-rational.
- The cone over a smooth plane conic is WO-rational; the cone over a smooth plane curve of genus g ≥ 1 is not, since H¹(C, WO_C)_K, the slope-[0, 1) part of H¹_crys(C), has dimension ≥ g.
- For X = P^d: [Δ] = [pt × P^d] + Γ with Γ supported on P^d × H for a hyperplane H (N = 1).
- For X = P^n_Y → Y with Y smooth integral, R^if_\*WO_ℚ = 0 for i > 0, while `R^if_*Wω_X` vanishes for i ≠ n and `R^nf_*Wω_X` ≅ `Wω_Y(−n)`.
- For f: P¹_k → Spec k, H¹(P¹, `Wω_ℚ`) = W(k)_ℚ ≅ `H^0(WS_{0,k})`: the Wω-comparison is shifted by the relative dimension.

### Dependencies

SchemeAndStackFoundations §0.23, universal homeomorphisms; SchemeAndStackFoundations §0.29, relative Frobenius; §5.1; SchemeAndStackFoundations §4.19, `alteration_theorem`; SchemeAndStackFoundations §4.16, alterations; SchemeAndStackFoundations §0.20, finiteness of normalization; SchemeAndStackFoundations §1.17, `finiteGroupQuotient_projective`; ClassicalAdicEtaleCohomology §5.4, plurinodal alteration theorem; §4.5; §4.2; §4.1; §0.2; §5.2; §5.3; §4.6; §4.4; SchemeAndStackFoundations §5.2, `localization_exact`; §5.4; §5.5; §5.7; §3.6; §5.6; §0.7; SchemeAndStackFoundations §2.20, `sheafified_grothendieck_duality`; §2.2; §0.6; §0.5; SchemeAndStackFoundations §5.1, Chow groups; SchemeAndStackFoundations §5.2, flat pullback; MotivesAndAlgebraicCycles §2.2, torsion kernel of base change to an algebraic closure; MotivesAndAlgebraicCycles §0.1, Chow correspondences; MotivesAndAlgebraicCycles §0.6, decomposition of the diagonal; §5.11; §0.8.



## Layer 6: Point counts modulo q and Esnault's theorem

Over a finite field, Witt vector cohomology computes the slope \< 1 factor of the zeta function, so isomorphisms of Witt cohomology become congruences of point counts modulo q. This gives the Ax–Katz congruence modulo q for complete intersections of small degree, Serre's congruence for theta divisors, quasi-birational invariance of point counts modulo q for WO-rational singularities, and Esnault's theorem: a smooth projective variety with universally trivial CH_0 — in particular a rationally chain connected one — has a number of rational points congruent to 1 modulo q, and so does a projective scheme with WO-rational singularities having such a resolution.


### 6.1 The Witt zeta function and slope factors of the zeta function

Let k = F_q, q = p^a, K = W(k)[1/p], and X a separated k-scheme of finite type with q-Frobenius φ = F^a (K-linear). Define P^W_i(X, t) := det(1 − tφ | H^i_c(X, `WO_{X,K}`)) and ζ^W(X, t) := ∏_i P^W_i(X, `t)^{(−1)^{i+1}}`. With P_i(X, t) := det(1 − tφ | `H^i_{rig,c}(X/K)`), ζ(X, t) = ∏_i P_i(X, `t)^{(−1)^{i+1}}` (Lefschetz trace formula), and the slope \< ρ factor `ζ^{<ρ}(X, t)` is defined through Newton polygons (§3.1). The polynomials P^W_i(X, t) and the slope factors P^λ_i(X, t) lie in ℤ_p[t]. (BBE07, (1.4), p. 4, and 6.1, pp. 33–34; BBE07, Proposition 6.2 and proof, p. 34).

X separated of finite type over a finite field; v_q(q) = 1 for slopes.

*Needs:* §2.3; §2.4; §3.1; PadicDifferentialEquationsAndRigidCohomology §RD.6.23, the rigid Lefschetz trace formula; PadicDifferentialEquationsAndRigidCohomology §RD.6.22, the zeta function through closed points; Mathlib `LinearMap.charpoly`.

The construction has the following API.

- P^W_i(X, t) = det(1 − tφ | H^i_c(X, `WO_{X,K}`)) ∈ K[t].
- ζ^W(X, t) = ∏_i P^W_i(X, `t)^{(−1)^{i+1}}` ∈ K(t).
- `ζ^{<ρ}(X, t)`, the slope \< ρ factor of ζ(X, t).
- P^W_i(X, t) ∈ ℤ_p[t] and P^λ_i(X, t) ∈ ℤ_p[t].
- For a closed Z ⊂ X with complement U, ζ^W(X, t) = ζ^W(U, t)·ζ^W(Z, t).
- For k′/k of degree r, `P^W_i(X_{k′}, t^r)` = `∏_{ζ^r=1}` P^W_i(X, ζt) (Frobenius power).

A proof route is the following.

1. H^i_c(X, `WO_{X,K}`) is finite-dimensional with slopes in [0, 1) (§2.4), so P^W_i is a polynomial with P^W_i(0) = 1 whose reciprocal roots have v_q in [0, 1).
2. P_i is invariant under σ (pullback along the absolute Frobenius of Spec k, and the relative Frobenius X → X′ induces an isomorphism on rigid cohomology), hence lies in ℚ_p[t]; the Newton-polygon factors are defined over ℚ_p; slopes are ≥ 0, so the reciprocal roots are p-adic integers and the factors lie in ℤ_p[t]; the same argument applies to P^W_i (BBE Proposition 6.2).

**Checks.**

- ζ^W(Spec F_q, t) = 1/(1 − t) = ζ(Spec F_q, t).
- `ζ^W(P¹_{F_q}, t)` = 1/(1 − t), the slope \< 1 factor of ζ(P¹, t) = 1/((1 − t)(1 − qt)).
- ζ^W(A¹, t) = 1 although ζ(A¹, t) = 1/(1 − qt): Witt cohomology only sees slopes \< 1.
- ζ^W(∅, t) = 1.
- For an elliptic curve E/F_q with P_1(E, t) = 1 − a t + q t²: P^W_1(E, t) = 1 − αt with α the unit root if p ∤ a (ordinary), and P^W_1(E, t) = P_1(E, t) if p | a (supersingular, both slopes 1/2).

These results apply to BBE07, Corollary 1.3, p. 5: `ζ^{<1}(X, t)` = ζ^W(X, t); BBE07, Proposition 6.4, p. 35: `ζ^{<1}(X, t)` = `ζ^{<1}(D, t)` `P^{<1}_n(X, t)^{(−1)^{n+1}}` for a theta-type divisor; §6.3: congruences mod q^r are read off from `ζ^{<1}`.


### 6.2 The slope < 1 factor of the zeta function is the Witt zeta function

Let X be a separated scheme of finite type over F_q. For every i, `P^{<1}_i(X, t)` = P^W_i(X, t), and `ζ^{<1}(X, t)` = ζ^W(X, t). (BBE07, Corollary 1.3, p. 5; (6.2), p. 34).

X separated of finite type over a finite field.

*Needs:* §3.6; §3.1; §6.1; PadicDifferentialEquationsAndRigidCohomology §RD.6.23, the rigid Lefschetz trace formula.

A proof route is the following.

1. By §3.6, `H^i_{rig,c}(X/K)^{<1}` ≅ H^i_c(X, `WO_{X,K}`) compatibly with φ; by §3.1 (Manin) `det(1 − tφ | E^{<1}) = det(1 − tφ | E)^{<1}`; take the alternating product (PadicDifferentialEquationsAndRigidCohomology §RD.6.23, the rigid Lefschetz trace formula).

**Checks.**

- X = P¹: `ζ^{<1}` = 1/(1 − t).
- X = A¹: `ζ^{<1}(A¹, t)` = 1 = ζ^W(A¹, t).


### 6.3 Point counts modulo q^κ and slope factors (Ax)

Let `(N_r)_{r≥1}` be integers with Φ(t) = `exp(∑_{r≥1} N_r t^r/r)` ∈ 1 + tℤ[[t]] a rational function in ℚ(t). Then Φ(t) = ∏_i(1 − α_it)/∏_j(1 − β_jt) with algebraic integers α_i ≠ β_j, and for every integer κ ≥ 1 the following are equivalent: (i) N_r ≡ 0 mod `q^{κr}` for all r ≥ 1; (ii) all α_i, β_j are divisible by q^κ in the ring of algebraic integers; (iii) v_q(ι(α_i)) ≥ κ and v_q(ι(β_j)) ≥ κ for every embedding ι: ℚ̄ → ℚ̄_p; (iv) `Φ^{<κ}(t)` = 1. In particular, for X, Y separated of finite type over F_q, `ζ^{<1}(X, t)` = `ζ^{<1}(Y, t)` iff `|X(F_{q^r})|` ≡ `|Y(F_{q^r})|` mod q^r for all r ≥ 1. (BBE07, Proposition 6.3, p. 35).

Φ rational with integer coefficients and constant term 1.

*Needs:* §3.1; PadicDifferentialEquationsAndRigidCohomology §RD.7.4, local Fatou; PadicDifferentialEquationsAndRigidCohomology §RD.6.22, the zeta function through closed points; Mathlib `PowerSeries.exp`.

A proof route is the following.

1. Fatou: a rational power series in 1 + tℤ[[t]] is a quotient of polynomials in 1 + tℤ[t] (PadicDifferentialEquationsAndRigidCohomology §RD.7.4, local Fatou), so the reciprocal roots and poles are algebraic integers, closed under Galois conjugation.
2. N_r = ∑_j β_j^r − ∑_i α_i^r; (ii) ⇒ (i) directly; (i) ⇒ (iii) by applying the `q^{κr}-divisibility` to the power sums and a Newton-polygon argument on the logarithmic derivative; (iii) ⇔ (iv) by the definition of the slope \< κ factor; (iii) ⇒ (ii) since v_q ≥ κ at every embedding means divisibility by q^κ for algebraic integers.
3. The last assertion: apply to Φ = Z(X, t)/Z(Y, t) with N_r = `|X(F_{q^r})|` − `|Y(F_{q^r})|` and κ = 1 (PadicDifferentialEquationsAndRigidCohomology §RD.6.22, the zeta function through closed points).

**Checks.**

- Φ(t) = 1/(1 − qt) (N_r = q^r) satisfies (i)–(iv) with κ = 1.
- Φ(t) = 1/(1 − t) (N_r = 1) satisfies none of them.


### 6.4 Isomorphisms on Witt cohomology give point-count congruences

(i) Let f: X → Y be a proper morphism of separated F_q-schemes of finite type such that f^\*: H^i_c(Y, `WO_{Y,K}`) → H^i_c(X, `WO_{X,K}`) is an isomorphism for all i ≥ 0. Then `|X(F_{q^r})|` ≡ `|Y(F_{q^r})|` mod q^r for all r ≥ 1. (ii) If f: X → Y is a morphism of proper F_q-schemes such that, for every i ≥ 0, the pullback H^i(Y, O_Y) → H^i(X, f^\*O_Y) composed with the canonical identification f^\*O_Y ≅ O_X is bijective, then (i) applies: |X(F_q)| ≡ |Y(F_q)| mod q (`card_rationalPoints_modEq_of_cohomologyPullback_bijective`: K a finite field, X and Y proper over K, f a K-morphism, X(K) and Y(K) the sections of the structure morphisms). (iii) If X is proper over F_q and G is a finite group acting on X with every orbit in an affine open, then H^i(X/G, `WO_{X/G,K}`) ≅ H^i(X, `WO_{X,K}`)^G; if G acts trivially on H^i(X, `WO_{X,K}`) for all i (for instance, if |G| is prime to p and G acts trivially on H^i(X, O_X)), then |X(F_q)| ≡ |(X/G)(F_q)| mod q. (iv) Let K be a finite field and π: X → Spec K a proper morphism such that π^\*: K → Γ(X, O_X) is bijective and H^i(X, O_X) = 0 for every i ≥ 1. Then |X(K)| ≡ 1 mod |K|, where X(K) is the set of sections of π. Since both hypotheses are stable under base change to a finite extension K′ of K, also |X(K′)| ≡ 1 mod |K′|. (BBE07, Corollary 1.6, p. 5, and its proof, pp. 39–40; Proposition 6.9, Lemma 6.10, 6.11, Corollary 6.12 and Remarks 6.13, pp. 38–40).

(i) f proper; (ii) X, Y proper; (iii) X proper with orbits in affine opens (so X/G exists); (iv) π proper over a finite field, Γ(X, O_X) = K through π^\*, and H^i(X, O_X) the sheaf cohomology of Conventions item 3 vanishing for i ≥ 1. Part (iv) is (ii) for f = π and Y = Spec K, where H^0(Spec K, O) = K and the higher cohomology vanishes; bijectivity of π^\* on global sections is the case i = 0 of the hypothesis of (ii) and excludes, for example, X = ∅ and X = Spec of a nontrivial finite extension of K. The acceptance test states (ii); (iv) is its case Y = Spec K.

*Needs:* §6.2; §6.3; §6.1; §0.1; §2.3; Tau Ceti `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` (statements of (ii) and (iv)); Tau Ceti `AlgebraicGeometry.Scheme.Hom.cohomologyPullback` and `AlgebraicGeometry.Scheme.Modules.pullbackObjUnitIso` (the map in (ii)); Tau Ceti `TauCeti.AlgebraicGeometry.bijective_cohomologyBaseChange` (flat base change, for the finite extensions in (iv)); SchemeAndStackFoundations §1.17, `finiteGroupQuotient_projective`; SchemeAndStackFoundations §1.17, admissible invariant quotients (gap:admissible-invariant-quotient-gluing); Tau Ceti `TauCeti.AffineInvariantQuotient.quotient` (the last three for the quotient X/G in (iii)).

A proof route is the following.

1. (i) ζ^W(X) = ζ^W(Y) by the definition (§6.1, Frobenius-equivariance of f^\*), hence `ζ^{<1}(X)` = `ζ^{<1}(Y)` (§6.2), and §6.3 gives the congruences.
2. (ii) By induction on m with 0 → `W_{m−1}O` →(V) W_mO → O → 0 and the five lemma, H^i(Y, W_mO_Y) ≅ H^i(X, W_mO_X) for all m; for proper schemes H^i(−, WO) = lim_m H^i(−, W_mO) (§0.1), so the Witt cohomologies agree after ⊗K.
3. (iii) The quotient Y = X/G, with f: X → Y finite and surjective and O_Y = (f_\*O_X)^G, is SchemeAndStackFoundations §1.17, `finiteGroupQuotient_projective`, when X is projective over F_q; for X proper with every orbit in an affine open, X is covered by G-stable affine opens (the intersection of the G-translates of an affine open containing an orbit, X being separated), and the affine invariant quotients (Tau Ceti `TauCeti.AffineInvariantQuotient.quotient`) glue to X/G (gap:admissible-invariant-quotient-gluing; BBE07, Lemma 6.10, p. 39). For the finite quotient map f, R^if_\*(W_mO_X) = 0 for i ≥ 1, W_mO_Y ≅ (f_\*W_mO_X)^G; invariants commute with inverse limits and ⊗ℚ and, in characteristic 0, with cohomology (BBE Lemma 6.10). For |G| prime to p, invariants are exact on k[G]-modules, so H^i(Y, O_Y) = H^i(X, O_X)^G = H^i(X, O_X) and (ii) applies (BBE Corollary 6.12).
4. (iv) Apply (ii) to π: X → Spec K; the cohomology of Spec K is K in degree 0 and 0 above, so the hypotheses say exactly that π^\* is an isomorphism on all H^i(−, O). For a finite extension K′/K, flat base change along the flat ring map K → K′ (Tau Ceti `TauCeti.AlgebraicGeometry.bijective_cohomologyBaseChange`, for X quasi-compact with affine diagonal, which holds as X is proper, hence separated, over K) gives `H^i(X_{K′}, O)` = H^i(X, O) ⊗_K K′, so the hypotheses hold for `X_{K′}` → Spec K′.

**Checks.**

- For the Igusa surface Y = X/G, X = E_1 × E_2 over F_q with p = 2, E_1 having a rational point t of order 2, and G = ℤ/2 acting by (x, y) ↦ (x + t, −y), G acts trivially on H^i(X, O_X) but not on H²(X, WO_K) ≠ 0 = H²(Y, WO_K): the hypothesis of (iii) on Witt cohomology cannot be replaced by one on O_X when p divides |G|.
- The quotient of an abelian variety by a subgroup generated by a rational point of order p satisfies (iii) but not the hypothesis of (ii).
- For (iv): X = ℙ¹_K has Γ = K, H¹(ℙ¹, O) = 0 and q + 1 ≡ 1 mod q points; two copies of ℙ¹ meeting transversally in one rational point have Γ = K, H¹ = 0 and 2q + 1 ≡ 1 points.
- Negative controls for (iv): X = ∅ has Γ = 0, so π^\* is not injective, and has 0 points; X = Spec K′ for K′/K of degree 2 has Γ = K′ ≠ K and 0 points; an ordinary elliptic curve E over F_p has H¹(E, O_E) = F_p ≠ 0 and |E(F_p)| = p + 1 − a with p ∤ a, which is not ≡ 1 mod p. Each violates exactly one hypothesis of (iv), and each fails the conclusion.
- The split nodal cubic over F_q has Γ = F_q, H¹(O) = F_q ≠ 0, and q points (the normalization ℙ¹ has q + 1, the two points over the node become one), so q ≢ 1 mod q: the H¹-vanishing in (iv) cannot be dropped for singular X.
- For (ii): the blowup f: X̃ → X of a smooth projective surface X over F_q at a rational point satisfies f^\*: H^i(X, O_X) ≅ H^i(X̃, O_X̃) for all i (R^if_\*O_X̃ = 0 for i > 0 and f_\*O_X̃ = O_X), and |X̃(F_q)| = |X(F_q)| + q, the point being replaced by a P¹ with q + 1 points: the difference is exactly q.
- Negative controls for (ii): the fold map f: P¹ ⊔ P¹ → P¹ over F_q has H^0(P¹, O) = F_q → H^0(P¹ ⊔ P¹, O) = F_q ⊕ F_q injective but not surjective, and 2(q + 1) − (q + 1) = q + 1 ≢ 0 mod q; the constant map from an ordinary elliptic curve E to Spec F_p has H¹(E, O_E) ≠ 0 = H¹(Spec F_p, O) and |E(F_p)| = p + 1 − a ≢ 1 mod p. A morphism f that is not over K is excluded by the hypothesis f ∘ π_Y = π_X, without which f does not map X(K) to Y(K).


### 6.5 Point counts of schemes with WO-rational singularities

Let X, Y be integral projective F_q-schemes with WO-rational singularities that are quasi-birational over F_q (for instance, Y → X a projective birational morphism, or a quasi-resolution, with Y WO-rational). Then `|X(F_{q^r})|` ≡ `|Y(F_{q^r})|` mod q^r for all r ≥ 1. In particular, if X has WO-rational singularities and f: Y → X is a resolution of singularities with Y projective (necessarily WO-rational), then |X(F_q)| ≡ |Y(F_q)| mod q. (CR12, Corollary 2 (introduction), p. 5; Corollary 4.4.16 with proof, p. 85; GNT19, Remark 3.1, p. 19).

X, Y projective and integral over a finite field; WO-rational singularities.

*Needs:* §5.8; §5.5; §6.4; §6.3; §0.2; §0.8.

A proof route is the following.

1. §5.8 gives H^i(X, `WO_{X,ℚ}`) ≅ H^i(Y, `WO_{Y,ℚ}`) Frobenius-equivariantly; for proper schemes the isogeny and tensor conventions agree on cohomology (§0.8), so the Witt zeta functions agree; conclude with §6.2 and §6.3.
2. For a resolution f: Y → X with X WO-rational, `Rf_*WO_{Y,ℚ}` ≅ `WO_{X,ℚ}`, so f^\* is an isomorphism on H^i(−, WO_K) and §6.4 (i) applies directly.

**Checks.**

- The projective quadric cone X = V(xy − z²) ⊂ P³ over F_q, and its minimal resolution (a Hirzebruch surface F_2) have point counts congruent mod q: |X(F_q)| = q² + q + 1 and |F_2(F_q)| = (q + 1)², and both are ≡ 1 mod q.


### 6.6 Witt cohomology of complete intersections of small degree and the Ax–Katz congruence modulo q

Let k be a perfect field of characteristic p and D_1, …, D_r ⊂ P^n_k hypersurfaces of degrees d_1, …, d_r with ∑_j d_j ≤ n, and Z = D_1 ∩ ⋯ ∩ D_r. Then H^0(Z, `WO_{Z,K}`) = K and H^i(Z, `WO_{Z,K}`) = 0 for i ≥ 1. Consequently, over k = F_q, `ζ^{<1}(Z, t)` = 1/(1 − t) and `|Z(F_{q^s})|` ≡ 1 mod q^s for all s ≥ 1 (Ax, Katz). In elementary form (`card_projectiveZeroLocus_modEq_one`): for a finite field K and homogeneous F_1, …, F_r ∈ K[x_0, …, x_n] of degrees d_j ≥ 1 with ∑_j d_j ≤ n, the number of points of ℙⁿ(K) at which every F_j vanishes is congruent to 1 modulo |K|; for K = `F_{q^s}` and the equations of the D_j this is the congruence over `F_{q^s}`. Affine form (`card_dvd_card_solutions_of_sum_lt`): for a finite field K, finitely many variables x_σ (σ ∈ Σ) and polynomials f_i (i ∈ s, s finite) with `∑_{i∈s}` totalDegree(f_i) < |Σ|, the number of common zeros of the f_i in K^Σ is divisible by |K|. This strengthens Mathlib's Chevalley–Warning theorem `char_dvd_card_solutions_of_sum_lt`, which gives divisibility by p, to divisibility by q; Ax and Katz prove divisibility by higher powers of q, which slopes below 1 do not see. (BBE07, Corollary 1.5, p. 5; Proposition 6.8 with proof and proof of Corollary 1.5, pp. 37–38; Ax64, pp. 255–261, for the affine form).

Hypersurfaces arbitrary (singular, reducible, nonreduced allowed); ∑ d_j ≤ n. In the elementary form each degree d_j is at least 1: a nonzero constant is homogeneous of degree 0 and cuts out the empty set, with 0 points. A zero polynomial is homogeneous of every degree; it cuts out all of ℙⁿ, and dropping it keeps ∑ d_j ≤ n, so it is allowed. In the affine form constants are allowed: a nonzero constant gives no zeros, the zero polynomial has total degree 0 and imposes no condition.

*Needs:* §0.6; §0.1; §6.2; §6.3; SchemeAndStackFoundations §2.6, `projectiveSpace_cohomology`; Mathlib `Projectivization`, `MvPolynomial.IsHomogeneous` and `MvPolynomial.totalDegree` (statements of the elementary forms).

A proof route is the following.

1. r = 1: for D of degree d ≤ n, H^i(P^n, O(−d)) = 0 for 0 ≤ i ≤ n (SchemeAndStackFoundations §2.6, `projectiveSpace_cohomology`), so H^i(P^n, O) ≅ H^i(D, O_D) for all i; by induction on m with the V-sequences, H^0(D, W_mO_D) = W_m(k) and H^i(D, W_mO_D) = 0 for i ≥ 1, hence the claim after the limit and ⊗K.
2. General r: D = D_1 ∪ ⋯ ∪ D_r is a hypersurface of degree ∑ d_j ≤ n; the Mayer–Vietoris complex for the closed cover D = ∪ D_i (§0.6) resolves `WO_{Z,K}` by WO-sheaves of D and of partial intersections, which by induction on r have the cohomology of a point, and the resulting complex of K's is exact except in degree 0.
3. Point counts: ζ^W(Z, t) = 1/(1 − t), so `ζ^{<1}(Z, t)` = 1/(1 − t) (§6.2), and §6.3 with Φ = ζ(Z, t)(1 − t) gives the congruences. The elementary projective form is the case s = 1 over the finite field K, with D_j = V(F_j) for F_j ≠ 0 (zero polynomials are dropped).
4. Affine form: drop zero polynomials; if some f_i is a nonzero constant there are no zeros. Otherwise every d_i = totalDegree(f_i) ≥ 1, and with m = |Σ| the homogenizations F_i ∈ K[x_0, x_σ] cut out Z ⊂ ℙ^m with ∑ d_i ≤ m − 1 ≤ m, while Z ∩ {x_0 = 0} ⊂ `ℙ^{m−1}` is cut out by the top-degree parts of the f_i, nonzero of degrees d_i, with ∑ d_i ≤ m − 1. The affine zeros are Z(K) ∖ (Z ∩ {x_0 = 0})(K), so their number is ≡ 1 − 1 = 0 mod |K| by the projective form applied twice. If no polynomial remains, the count is |K|^m with m ≥ 1.

**Checks.**

- A smooth plane conic (n = 2, d = 2) has q + 1 ≡ 1 mod q points.
- A cubic surface in P³ (d = 3 ≤ 3) has |Z(F_q)| ≡ 1 mod q.
- Degenerate plane conics over F_q: the double line x² = 0 has q + 1 points, the line pair xy = 0 has 2q + 1, and x² − ay² = 0 with a a nonsquare (q odd) has the single point [0 : 0 : 1]; all are ≡ 1 mod q, as the statement allows singular, reducible and nonreduced hypersurfaces.
- Negative control for the degree condition: one cubic curve in ℙ² (d = 3 > 2 = n), an ordinary elliptic curve E over F_p, has p + 1 − a points with p ∤ a, which is not ≡ 1 mod p; for a degree-0 equation F = 1 the zero set is empty, 0 ≢ 1, which is why the elementary form requires d_j ≥ 1.
- Over F_9 (p = 3), a nondegenerate ternary quadratic form, total degree 2 < 3 variables, has exactly 81 = 9² zeros in F_9³: divisible by q = 9, while Chevalley–Warning only asserts divisibility by 3. For r = 0 the projective count is |ℙⁿ(K)| = 1 + q + ⋯ + qⁿ ≡ 1 and the affine count is qⁿ with n ≥ 1.


### 6.7 Slope < 1 zeta factor of an ample divisor with Witt-injective top cohomology

Let X be a smooth projective variety of pure dimension n over F_q and D ⊂ X an ample divisor with U = X ∖ D, such that (a) H^0(X, ω_X) → H^0(X, ω_X(D)) is an isomorphism and (b) for all i ≥ 1, V^i: H^n(X, O_X) → H^n(X, `W_{i+1}O_X`) is injective. Then the slope \< 1 part of `H^n_{rig,c}(U/K)` maps isomorphically onto the slope \< 1 part of H^n_rig(X/K), and the slope \< 1 zeta factor of X is that of D multiplied by `P^{<1}_n(X, t)^{(−1)^{n+1}}`. (BBE07, Proposition 6.4 with proof, pp. 35–36).

X smooth projective of pure dimension n over F_q; D ample (so U is affine); hypotheses (a), (b).

*Needs:* §3.7; §3.6; §6.2; §6.1; SchemeAndStackFoundations §2.20, `cm_serre_duality`; §0.1.

A proof route is the following.

1. With I = O_X(−D), (a) is equivalent by Serre duality (SchemeAndStackFoundations §2.20, `cm_serre_duality`) to H^n(X, I) ≅ H^n(X, O_X); with (b) the rows 0 → H^n(X, I) → H^n(X, `W_{i+1}I`) → H^n(X, W_iI) → 0 and the same for O_X are exact, so H^n(X, W_iI) ≅ H^n(X, W_iO_X) for all i, giving H^n_c(U, `WO_{U,K}`) ≅ H^n(X, `WO_{X,K}`) after the limit and ⊗K.
2. §3.6 transfers this to rigid cohomology; U is smooth affine of pure dimension n, so H^i_c(U, WO_K) = 0 for i ≠ n (§3.7); by §6.2, `ζ^{<1}(U, t)` = P^W_n(U, `t)^{(−1)^{n+1}}` = `P^{<1}_n(X, t)^{(−1)^{n+1}}`; multiplicativity ζ(X) = ζ(U)ζ(D) gives the formula.

**Checks.**

- For X = P¹ and D a k-point, (a) holds (both sides 0) and (b) is vacuous (H¹(P¹, O) = 0); the formula reads 1/(1 − t) = 1/(1 − t) · 1.


### 6.8 Serre’s Bockstein vanishing for abelian varieties

For an abelian variety A of dimension g over a perfect field k of characteristic p and every i ≥ 1, the map V^i: H^g(A, O_A) → H^g(A, `W_{i+1}O_A`) is injective. Equivalently, the boundary `H^{g−1}(A, W_iO_A)` → H^g(A, O_A) of 0 → O_A →(V^i) `W_{i+1}O_A` → W_iO_A → 0 is zero. This is the degree g − 1 case of the vanishing of all Bockstein operations of A: for every q ≥ 0 and all n ≥ j ≥ 1, the restriction H^q(A, W_nO_A) → H^q(A, W_jO_A) is surjective. (BBE07, §6.5, p. 36; Ser58, Théorème 2, pp. 715–739; Ser58Top, n° 3 (Opérations de Bockstein) of §1, pp. 27–29.)

k perfect of characteristic p; A an abelian variety of dimension g over k, with group law m: A ×_k A → A, projections p_1, p_2 and the maps i_1 = (id, 0), i_2 = (0, id): A → A ×_k A; i ≥ 1; the Witt sheaves, V and R are those of Layer 0. A class y ∈ H^1(A, W_nO_A) is primitive if m^\*y = p_1^\*y + p_2^\*y in H^1(A ×_k A, W_nO).

*Needs:* §0.1; AbelianSchemesAndArithmeticModuli §A4.4, `exteriorCohomology`; SchemeAndStackFoundations §2.6, Künneth formula for quasi-coherent cohomology over a field (gap:quasi-coherent-kunneth).

The target has the following API.

- Bockstein criterion, for every scheme X with p·O_X = 0 and every q ≥ 0: for n > m let `δ_{n,m}`: H^q(X, `W_{n−m}O_X`) → `H^{q+1}(X, W_mO_X)` be the boundary of 0 → W_mO_X `→(V^{n−m})` W_nO_X →(R^m) `W_{n−m}O_X` → 0. All `δ_{n,m}` vanish in degree q if and only if H^q(X, W_nO_X) → H^q(X, O_X) is surjective for every n ≥ 1 (Ser58Top, n° 3 of §1, p. 28).
- Degree one for abelian varieties: every class of H^1(A, O_A) is primitive and lifts, for every n ≥ 1, to a primitive class of H^1(A, W_nO_A); in particular H^1(A, W_nO_A) → H^1(A, O_A) is surjective.
- All degrees for abelian varieties: H^q(A, W_nO_A) → H^q(A, O_A) is surjective for all q ≥ 0 and n ≥ 1, so all Bockstein operations of A vanish.

A proof route is the following.

1. Bockstein criterion. The case m = n − 1 says that `δ_{n,n−1}` vanishes on H^q(X, O_X) exactly when H^q(X, W_nO_X) → H^q(X, O_X) is onto. Conversely, assume these maps onto and show H^q(X, W_nO_X) → H^q(X, W_jO_X) onto for n ≥ j by induction on j. For x ∈ H^q(X, W_jO_X), lift its image in H^q(X, O_X) to y ∈ H^q(X, W_nO_X); then `x − R^{n−j}y` lies in the kernel of `R^{j−1}`, which is the image V(z) of some z ∈ `H^q(X, W_{j−1}O_X)`; by induction `z = R^{n−j}w` with w ∈ `H^q(X, W_{n−1}O_X)`, and V commutes with R, so `x = R^{n−j}(y + V(w))`. Exactness of the long sequences then kills every `δ_{n,m}` in degree q.
2. Degree one. H^0(A, O_A) = k and H^0(A ×_k A, O) = k, so H^0(−, W_nO) = W_n(k) on both, the restrictions H^0(−, `W_{n+1}O`) → H^0(−, W_nO) are onto, and V^n: H^1(−, O) → H^1(−, `W_{n+1}O`) is injective on A and on A ×_k A. The Künneth formula (gap:quasi-coherent-kunneth) gives H^1(A ×_k A, O) = p_1^\*H^1(A, O_A) ⊕ p_2^\*H^1(A, O_A) and identifies the summand p_1^\*H^1(A, O_A) ∪ p_2^\*H^1(A, O_A) of H^2(A ×_k A, O) with H^1(A, O_A) ⊗_k H^1(A, O_A). Since m ∘ i_1 = m ∘ i_2 = id, p_1 ∘ i_1 = p_2 ∘ i_2 = id and p_2 ∘ i_1, p_1 ∘ i_2 factor through Spec k, every x ∈ H^1(A, O_A) is primitive. A primitive class of H^2(A, O_A) is zero: write it as ∑_l a_l ∪ b_l with a_l, b_l ∈ H^1(A, O_A) (AbelianSchemesAndArithmeticModuli §A4.4, `exteriorCohomology`); m^\* is a ring map, so the component of m^\*(∑_l a_l ∪ b_l) in that summand is the image of ∑_l a_l ∧ b_l under a ∧ b ↦ a ⊗ b − b ⊗ a (graded commutativity of the cup product), which is injective on ∧²H^1(A, O_A) in every characteristic, and primitivity makes it zero. Induct on n: if x_n ∈ H^1(A, W_nO_A) is a primitive lift of x, the obstruction to lifting x_n to `H^1(A, W_{n+1}O_A)` is its boundary in H^2(A, O_A) for 0 → O_A →(V^n) `W_{n+1}O_A` → W_nO_A → 0; the boundary is natural for m, p_1 and p_2, so the obstruction is primitive, hence zero. Every lift y is primitive: e = m^\*y − p_1^\*y − p_2^\*y maps to zero in H^1(A ×_k A, W_nO), so e = V^n(f) with f ∈ H^1(A ×_k A, O); moreover i_1^\*e = 0 = i_2^\*e, so V^n(i_1^\*f) = 0 = V^n(i_2^\*f), whence i_1^\*f = i_2^\*f = 0 and f = 0 by the degree-one Künneth decomposition.
3. All degrees. `R^{n−1}`: W_nO_A → O_A is a map of sheaves of rings, so a cup product of lifts of a_1, …, a_q ∈ H^1(A, O_A) lifts a_1 ∪ ⋯ ∪ a_q. These products span H^q(A, O_A) (§A4.4), and the image of H^q(A, W_nO_A) is a k-subspace because W_n(k) → k is onto; so H^q(A, W_nO_A) → H^q(A, O_A) is onto.
4. Step 1 with q = g − 1 makes `H^{g−1}(A, W_{i+1}O_A)` → `H^{g−1}(A, W_iO_A)` onto, so the boundary `H^{g−1}(A, W_iO_A)` → H^g(A, O_A) vanishes and V^i is injective on H^g(A, O_A).

**Checks.**

- For g = 0, V^i: k → `W_{i+1}(k)` sends a to the Witt vector with a in coordinate i and zero elsewhere, hence has zero kernel.
- For g = 1 and i = 1, W_2(k) → k is onto, so the boundary H^0(E, O_E) → H^1(E, O_E) is zero and V on H^1 is injective.
- For g = 1 and any i ≥ 1, H^0(E, `W_{i+1}O_E`) = `W_{i+1}(k)` → W_i(k) is onto, so the boundary is zero; this includes supersingular E and p = 2, where Frobenius on H^1(E, O_E) can be zero. For g = 1 the obstruction group H^2(E, O_E) of step 2 is already 0.
- For A = E_1 × E_2 (g = 2), H^1(A, O_A) has the basis a_1, a_2 pulled back from the factors and H^2(A, O_A) = k·(a_1 ∪ a_2); the component of m^\*(a_1 ∪ a_2) in the summand p_1^\*H^1 ∪ p_2^\*H^1 is a_1 ⊗ a_2 − a_2 ⊗ a_1 ≠ 0, so no nonzero class of H^2(A, O_A) is primitive and the obstruction of step 2 vanishes. In characteristic 2 the same component is a_1 ⊗ a_2 + a_2 ⊗ a_1, still nonzero.
- Every scheme X with p·O_X = 0 has vanishing Bocksteins in degree 0, since a section f of O_X lifts to the Witt vector (f, 0, …, 0); a Noetherian X of finite dimension also has none in degree dim X, since `H^{dim X + 1}` vanishes by Grothendieck vanishing (SchemeAndStackFoundations §2.5, `noetherianSpace_vanishing`; Ser58Top, n° 3 of §1, p. 28, for varieties). The abelian-variety hypothesis is needed in between: Igusa's surfaces have a nonzero Bockstein in degree 1 (Ser58Top, n° 3 of §1, p. 28), so for them H^1(X, W_nO_X) → H^1(X, O_X) is not onto for some n.


### 6.9 Theta divisors have congruent point counts modulo q

Let A be an abelian variety over F_q and Θ, Θ′ two theta divisors on A (effective divisors with O_A(Θ) ample defining a principal polarization). Then `|Θ(F_{q^r})|` ≡ `|Θ′(F_{q^r})|` mod q^r for all r ≥ 1; in particular |Θ(F_q)| ≡ |Θ′(F_q)| mod q. (BBE07, Theorem 1.4, p. 5; 6.5 (proof of Theorem 1.4) and Remarks 6.6, pp. 36–37).

A abelian variety over a finite field; Θ, Θ′ theta divisors (not necessarily algebraically equivalent translates). A theta divisor Θ is encoded by its ideal sheaf I = O_A(−Θ): an effective Cartier ideal sheaf whose dual line bundle O_A(Θ) = I^∨ is ample and has h^0(A, O_A(Θ)) = 1 (`IsThetaDivisor`). For an ample line bundle L on an abelian variety, h^0(A, L) = χ(L) and deg φ_L = χ(L)² (AbelianSchemesAndArithmeticModuli §A2.4, `ampleCohomologyAndDegree`), so h^0(A, L) = 1 says exactly that L defines a principal polarization. The case r = 1 is `card_thetaDivisor_modEq`, with Θ(F_q) the set of sections of the closed subscheme Θ over Spec F_q; the congruences for r > 1 follow by applying it over `F_{q^r}`, since effectivity, ampleness and h^0 are stable under base change to a field extension, so the base change of a theta divisor is a theta divisor.

*Needs:* §6.7; §6.3; AbelianSchemesAndArithmeticModuli §A2.4, `ampleCohomologyAndDegree`; §6.8; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`, `IsEffectiveCartier.toInvertibleSheaf`, `InvertibleSheaf.dual`, `TauCeti.AlgebraicGeometry.LineBundleClass.IsAmple` and `AlgebraicGeometry.Scheme.Modules.cohomologyBaseModule` (statement).

The definition `IsThetaDivisor` has the following API.

- An ideal sheaf I ⊂ O_A that is effective Cartier (locally generated by a nonzerodivisor) is the ideal O_A(−Θ) of an effective Cartier divisor Θ, the closed subscheme it cuts out; its dual I^∨ = Hom(I, O_A) is the invertible sheaf O_A(Θ), and the inclusion I → O_A dualizes to the canonical section s_Θ ∈ H^0(A, O_A(Θ)), which vanishes exactly on Θ.
- For I effective Cartier with O_A(Θ) ample, h^0(A, O_A(Θ)) = 1 holds if and only if the polarization φ: A → A^∨ attached to O_A(Θ) has degree 1, that is, is a principal polarization (h^0 = χ and deg φ = χ² for ample line bundles on abelian varieties, AbelianSchemesAndArithmeticModuli §A2.4); then H^0(A, O_A(Θ)) = K·s_Θ and Θ is the only effective divisor in its linear equivalence class.
- If I is a theta divisor on A over K and K′/K is a field extension, the pullback of I to `A_{K′}` is a theta divisor: base change along Spec K′ → Spec K is flat, so it keeps I effective Cartier and commutes with duals and with H^0, and ampleness is preserved.
- If I is a theta divisor and a ∈ A(K) is a rational point, the translate of I by the automorphism t_a of the scheme A is a theta divisor, and its closed subscheme Θ + a has the same number of rational points as Θ.

A proof route is the following.

1. Check the hypotheses of §6.7 for (A, Θ): ω_A ≅ O_A and h^0(A, O_A(Θ)) = 1 for a principal polarization (Riemann–Roch on abelian varieties, AbelianSchemesAndArithmeticModuli §A2.4, `ampleCohomologyAndDegree`), so H^0(A, O_A) → H^0(A, O_A(Θ)) is an isomorphism, giving (a).
2. Condition (b) is §6.8, applied with g = dim A and every i ≥ 1.
3. Hence `ζ^{<1}(Θ, t)` = `ζ^{<1}(A, t)·P^{<1}_g(A, t)^{(−1)^g}` = `ζ^{<1}(Θ′, t)`, and §6.3 gives the congruences.

**Checks.**

- For an elliptic curve E (g = 1) a theta divisor is a single rational point, and the statement is 1 ≡ 1.
- Two theta divisors differing by translation by a rational point have equal point counts; the theorem covers divisors that are not translates.
- On an elliptic curve E over F_q with distinct rational points P and Q, the divisors 2P and P + Q both have O_E(D) ample of degree 2 with h^0 = 2, so neither is a theta divisor; their point counts are 1 and 2, and 1 ≢ 2 mod q. The condition h^0(O_A(Θ)) = 1 cannot be weakened to ampleness. This is the analogue on an abelian variety of BBE07, Remarks 6.6 (ii), p. 36: on P¹ the divisors D = 2{0} and D′ = {0} + {∞} have h^0(O(D)) = h^0(O(D′)) = 3, but 1 and 2 rational points.
- The ideal sheaf I = O_A(−Θ) in place of its dual would be a wrong model: on E, O_E(−P) has h^0 = 0 and is not ample, so no divisor would qualify, and the g = 1 Check would have no instance.
- For dim A = 0, A = Spec F_q, the only effective Cartier ideal is the unit ideal (0 is a zero divisor), whose dual O is ample with h^0 = 1: the only theta divisor is empty and the statement reads 0 ≡ 0.


### 6.10 Universally CH_0-trivial varieties

A proper k-scheme X is universally CH_0-trivial (rationally) if for every field extension L ⊃ k the degree map deg: CH_0(X_L) ⊗ ℚ → ℚ is an isomorphism. It suffices to check algebraically closed L ⊃ k. For X smooth projective geometrically integral, universal CH_0-triviality gives a decomposition of the diagonal N[Δ_X] = [ξ × X] + Γ with Γ supported on X × D for a divisor D (§5.11). For a family f: X → Y, the condition is imposed on the generic fibre over k(η). Two elementary facts on zero-cycles under field extension are proved here for every proper k-scheme X: for an algebraic extension L̄/L, `CH_0(X_{L̄})` is the colimit of `CH_0(X_{L′})` over the finite subextensions L′/L (Stacks, Lemma 45.8.2, tag 0FH6); and for L′/L finite, the projection π: `X_{L′}` → X_L is finite locally free of degree [L′ : L] and π_\*π^\* is multiplication by [L′ : L] on cycles and on Chow groups (Stacks, Lemma 42.15.2, tag 02RH). (CR12, Theorem 4.8.1, p. 96; ESN03, §1, p. 1, and Theorem 1.1, p. 2).

Rational coefficients; X proper so that deg is defined. In the acceptance test, `zeroCycleDegree` of a zero-cycle z on a scheme X over Spec L is the sum ∑_x z(x)·[κ(x) : L] over the points of its support (the residue-degree-weighted sum of SchemeAndStackFoundations §5.2, the degree of zero-cycles; the support of a cycle is locally finite, hence finite on the quasi-compact X_L), and `UniversallyCH0Trivial` says that for every field extension L of k some zero-cycle on X_L has nonzero degree and every zero-cycle of degree 0 on X_L has a positive multiple rationally equivalent to zero (`TauCeti.AlgebraicGeometry.Chow.RatEquiv`). This is 'deg: CH_0(X_L) ⊗ ℚ → ℚ bijective': ℚ is flat, so deg ⊗ ℚ is injective iff the kernel of deg is torsion, and it is surjective iff some class has nonzero degree. Esnault's hypothesis (CH_0(X_Ω) = ℤ for Ω an algebraic closure of k(X) only) implies universal triviality through the decomposition of the diagonal and the moving lemma for zero-cycles; that implication is not used in this roadmap, whose theorems assume universal triviality.

*Needs:* §5.11; SchemeAndStackFoundations §5.2, the degree of zero-cycles; SchemeAndStackFoundations §5.1, Chow groups; SchemeAndStackFoundations §5.2, proper pushforward; SchemeAndStackFoundations §5.2, flat pullback; Tau Ceti `TauCeti.AlgebraicGeometry.Chow.cyclesOfDimension` and `TauCeti.AlgebraicGeometry.Chow.RatEquiv`, Mathlib `AlgebraicGeometry.Scheme.Hom.residueDegree` and `AlgebraicGeometry.LocallyOfFiniteType.isLocallyNoetherian` (statement).

The construction has the following API.

- ∀ L/k, deg: CH_0(X_L) ⊗ ℚ → ℚ is bijective; equivalently (`UniversallyCH0Trivial`), for every L/k some zero-cycle on X_L has nonzero degree and every zero-cycle of degree 0 is torsion modulo rational equivalence, the degree being the residue-degree-weighted coefficient sum (`zeroCycleDegree`).
- For an algebraic extension L̄/L, `CH_0(X_{L̄})` is the filtered colimit of `CH_0(X_{L′})` over the finite subextensions L′/L.
- For a finite extension L′/L and π: `X_{L′}` → X_L, π_\*π^\* = [L′ : L] on CH_0(X_L); hence the kernel of CH_0(X_L) → `CH_0(X_{L̄})` is torsion.
- X is universally CH_0-trivial iff deg: CH_0(X_L) ⊗ ℚ ≅ ℚ for every algebraically closed L ⊃ k.
- For X smooth projective geometrically integral and universally CH_0-trivial, the diagonal decomposes rationally (§5.11).
- Preserved by field extension k′/k.

A proof route is the following.

1. Field-extension lemmas: a zero-cycle on `X_{L̄}` and a rational equivalence between two such cycles involve finitely many closed points, curves and rational functions, each defined over a finite subextension, which gives the colimit description. For L′/L finite, π is the base change of Spec L′ → Spec L, hence finite locally free of degree [L′ : L]; for a closed point x of X_L, π^\*[x] is the cycle of Spec(κ(x) ⊗_L L′) and π_\*π^\*[x] = `dim_{κ(x)}(κ(x) ⊗_L L′)·[x]` = [L′ : L]·[x] by the residue-degree weights of proper pushforward; both operations respect rational equivalence (SchemeAndStackFoundations §5.2, proper pushforward and flat pullback).
2. Reduction to algebraically closed L: for any L, let L̄ be an algebraic closure; a class in the kernel of CH_0(X_L) → `CH_0(X_{L̄})` dies over a finite subextension L′/L by the colimit description, and applying π_\* shows that [L′ : L] kills it, so the kernel is torsion; deg is surjective after ⊗ℚ because X_L has a zero-cycle of positive degree.
3. The decomposition of the diagonal is §5.11 applied with Ω an algebraic closure of k(X), an algebraically closed extension of k.

**Checks.**

- P^n_k is universally CH_0-trivial (CH_0(P^n_L) = ℤ via degree).
- Spec k is universally CH_0-trivial.
- The empty scheme is not: CH_0(∅) = 0, so deg ⊗ ℚ is not surjective. The clause asking for a zero-cycle of nonzero degree excludes it; a definition asking only that the kernel of deg be torsion would wrongly admit it.
- On P¹ over F_q with a rational point x and a closed point y of degree 2, `zeroCycleDegree` gives [x] degree 1 and [y] degree 2, and [y] − 2[x] has degree 0 and is rationally equivalent to zero (the divisor of an irreducible quadratic form divided by the square of the linear form vanishing at x); an unweighted coefficient sum would give [y] − 2[x] the degree −1.
- A smooth projective curve C of genus g ≥ 1 is not: over an algebraic closure L of k(C), the generic point gives a point of the Jacobian J(L) of infinite order, so Pic⁰(C_L) ⊗ ℚ ≠ 0. Over F̄_p alone the test would fail to detect this (J(F̄_p) is torsion, so `CH_0(C_{F̄_p})` ⊗ ℚ = ℚ): the definition needs transcendental extensions.
- If X is smooth projective and universally CH_0-trivial over F_q then ζ^W(X, t) = 1/(1 − t) (§6.13).
- For X = `P¹_{F_q}` and L′ = `F_{q²}`, a rational point x pulls back to one rational point of `P¹_{F_{q²}}` with multiplicity one, whose pushforward is `[F_{q²} : F_q]·[x]` = 2[x]; a closed point y of degree 2 pulls back to two conjugate rational points, pushing forward to 2[y]. A pushforward without residue-degree weights would give [x] and 2[y], so π_\*π^\* would not be multiplication by the degree.

These results apply to CR12, Theorem 4.8.1, p. 96: hypothesis on the generic fibre for the vanishing of higher direct images of WO_ℚ; ESN03, Theorem 1.1, p. 2: hypothesis for the vanishing of the slope [0, 1) part of H^i, i > 0; §6.12: smooth projective geometrically connected rationally chain connected varieties satisfy it; §6.13: the hypothesis of the theorem.


### 6.11 Rationally chain connected varieties

A k-scheme X of finite type is rationally chain connected if there are a k-variety Y, a family g: U → Y of geometrically connected proper algebraic curves whose geometric fibres have only rational components, and a cycle morphism u: U → X such that `u^{(2)}`: U ×_Y U → X ×_k X is dominant. For X proper, geometrically normal and geometrically connected, this property is invariant under every field extension k′/k: X is rationally chain connected iff X ×_k k′ is (Tan18, Remark 5.3 (1), arXiv v3, p. 20, from Proposition A.4, p. 30). Over an uncountable algebraically closed field, X is rationally chain connected iff a pair of general closed points can be joined by a chain of rational curves. (GNT19, Definition 4.5 and Remark 4.6, p. 29; ESN03, §1, p. 2; Tan18, Proposition A.4, arXiv v3, p. 30; Kol96, IV.3.2.5; IV.3.6; V.2.13).

X of finite type over a field k; the family of curves is a 'cycle-theoretic' family in Kollár's sense. The field-extension equivalence assumes X proper, geometrically normal and geometrically connected; it applies to smooth projective geometrically connected consumers.

*Needs:* SchemeAndStackFoundations §4.14, `hilbert_quot_schemes`; Mathlib `AlgebraicGeometry.Scheme`.

The construction has the following API.

- Existence of (Y, g: U → Y, u: U → X) as in the definition.
- For X proper, geometrically normal and geometrically connected and every k′/k, X is RCC iff `X_{k′}` is RCC (Tan18 Proposition A.4, p. 30).
- Over an uncountable algebraically closed k: RCC iff a general pair of closed points is joined by a chain of rational curves.
- If X and X′ are RCC then X ×_k X′ is RCC (join (x, x′) to (y, x′) by a chain in X × {x′}, then to (y, y′)).
- A surjective image of an RCC proper scheme is RCC.

A proof route is the following.

1. Use the Hilbert-scheme families of SchemeAndStackFoundations §4.14 to express rational chains. For proper geometrically normal geometrically connected X, field-extension invariance is Tan18 Proposition A.4, p. 30; the general-pair chain criterion over uncountable algebraically closed fields is Kol96 IV.3.6. Kol96 IV.3.2.5 supplies the classical base-change formulation (cited by locator).

**Checks.**

- P^n_k is RCC: the family of lines through pairs of points, with `u^{(2)}` dominant.
- Spec k is RCC: take U = P¹_k over Y = Spec k and the constant morphism u.
- The projective cone over any projective variety Z is RCC (any two points are joined through the vertex by two lines), although it need not be WO-rational when `H^{>0}(Z, WO_ℚ)` ≠ 0: the singular point-count theorem needs WO-rationality as a separate hypothesis.
- A smooth cubic surface over F_q is proper, geometrically normal and geometrically connected; it remains RCC after each field extension, and CH_0 over every algebraically closed extension is ℤ.
- An elliptic curve is smooth projective geometrically connected but contains no nonconstant rational curve, so the base-change equivalence does not assert that all such varieties are RCC.

These results apply to ESN03, Corollary 1.3, p. 2: rationally chain connected smooth projective varieties over F_q have a rational point; §6.12: RCC implies universal CH_0-triviality.


### 6.12 Rationally chain connected smooth projective varieties are universally CH_0-trivial

Let X be a smooth projective geometrically connected variety over a field k that is rationally chain connected. Then X is universally CH_0-trivial: for every field extension L ⊃ k, deg: CH_0(X_L) ⊗ ℚ → ℚ is an isomorphism. (ESN03, §1, p. 2 (paragraph before Corollary 1.3); GNT19, Remark 4.6, p. 29; Kol96, IV.3.13.3; V.2.13).

X smooth projective geometrically connected and rationally chain connected.

*Needs:* §6.11; §6.10; SchemeAndStackFoundations §5.1, rational equivalence.

A proof route is the following.

1. By §6.10 it suffices to treat algebraically closed L ⊃ k; X_L is rationally chain connected by invariance under field extension (§6.11).
2. For a proper rationally chain connected scheme over an algebraically closed field, any two closed points are joined by a chain of rational curves, and two points of a rational curve are rationally equivalent (the normalization is P¹, SchemeAndStackFoundations §5.1, rational equivalence), so every closed point is rationally equivalent to a fixed one and deg: CH_0(X_L) → ℤ is an isomorphism (Kol96 IV.3.13.3, cited by locator; ESN03 §1, p. 2).

**Checks.**

- Smooth Fano varieties over algebraically closed fields are rationally chain connected (Kollár V.2.13), hence universally CH_0-trivial.


### 6.13 Vanishing of Witt vector cohomology of universally CH_0-trivial varieties

Let X be a smooth projective geometrically integral variety over a perfect field k of characteristic p that is universally CH_0-trivial (for instance, rationally chain connected). Then H^i(X, WO_X) ⊗ ℚ = 0 for all i > 0; equivalently, all Frobenius slopes of H^i_crys(X/W(k)) ⊗ ℚ (= H^i_rig(X/K)) are ≥ 1 for i > 0. (ESN03, Theorem 1.1, p. 2, and §2 (proof), pp. 3–4; CR12, Theorem 5 (introduction), p. 6; Theorem 4.8.1, p. 96).

X smooth projective geometrically integral over a perfect field; universal CH_0-triviality (rational coefficients).

*Needs:* §5.12; §5.6; §6.10; §0.2; §0.8; §3.5; CrystallineCohomology §CR.4.7, *Degree filtration and the slope spectral sequence*.

A proof route is the following.

1. X is smooth, hence Witt-rational (§5.6); apply §5.12 to f: X → Spec k (Y = Spec k smooth, so `WS_{0,k}` = W(k)_ℚ has no higher cohomology): H^i(X, `WO_{X,ℚ}`) = 0 for i > 0, and for proper X this is H^i(X, WO_X) ⊗ ℚ = 0 (§0.8).
2. Equivalence with the slope statement: H^i(X, WO_X)_K is the slope-[0, 1) part of H^i_crys(X/W)_K (CrystallineCohomology §CR.4.7, *Degree filtration and the slope spectral sequence*; §3.5).
3. Esnault's original route (cycle classes in rigid cohomology acting by correspondences, with Berthelot's lemma that cohomology with supports in a divisor has slopes ≥ 1) is an alternative; the route here is the correspondence action of Layer 4.

**Checks.**

- For X = P^n: H^i(P^n, WO) = 0 for i > 0 and `H^{2j}_crys` has slope j.
- For a smooth cubic surface: all slopes of H²_crys equal 1.


### 6.14 Rational points of universally CH_0-trivial varieties and of their WO-rational degenerations

(i) Let X be a smooth projective geometrically connected variety over F_q that is universally CH_0-trivial (for instance, rationally chain connected, or Fano). Then `|X(F_{q^r})|` ≡ 1 mod q^r for all r ≥ 1; in particular X has an F_q-rational point. The case r = 1, for X projective over F_q in the sense of `AlgebraicGeometry.Scheme.IsProjectiveOver`, smooth, geometrically connected and `UniversallyCH0Trivial` (§6.10), is `card_rationalPoints_modEq_one_of_universallyCH0Trivial`; the congruences for r > 1 follow by applying it over `F_{q^r}`, since all four hypotheses are stable under base change to a field extension. (ii) Let X be a projective geometrically connected F_q-scheme with WO-rational singularities that admits a resolution of singularities f: Y → X (or a quasi-resolution from a Witt-rational Y) with Y smooth projective, geometrically connected and universally CH_0-trivial. Then `|X(F_{q^r})|` ≡ 1 mod q^r for all r ≥ 1. (ESN03, Corollaries 1.2 and 1.3, p. 2; GNT19, Theorems 1.1–1.3, p. 2).

(i) X smooth projective geometrically connected; (ii) X with WO-rational singularities and such a resolution.

*Needs:* §6.13; §6.2; §6.3; §6.5; §6.1; §6.10; Tau Ceti `AlgebraicGeometry.Scheme.IsProjectiveOver`, Mathlib `AlgebraicGeometry.Smooth` and `AlgebraicGeometry.GeometricallyConnected` (statement of (i)).

A proof route is the following.

1. (i) H^0(X, `WO_{X,K}`) = K (geometric connectedness, X proper) and H^i(X, `WO_{X,K}`) = 0 for i > 0 (§6.13), so ζ^W(X, t) = 1/(1 − t) = `ζ^{<1}(X, t)` (§6.2); apply §6.3 to Φ = ζ(X, t)(1 − t).
2. (ii) §6.5 gives `|X(F_{q^r})|` ≡ `|Y(F_{q^r})|` mod q^r, and (i) for Y.

**Checks.**

- A smooth cubic surface over F_q has ≡ 1 mod q points.
- Projective space: |P^n(F_q)| = 1 + q + ⋯ + q^n ≡ 1 mod q.
- Negative controls for (i): an ordinary elliptic curve E over F_p is smooth, projective and geometrically connected but not universally CH_0-trivial (§6.10), and |E(F_p)| = p + 1 − a with p ∤ a, so |E(F_p)| ≢ 1 mod p; for instance E: y² = x³ + x + 1 over F_5 has 2, 0, 2, 2, 2 affine points above x = 0, 1, 2, 3, 4, hence 9 ≡ 4 mod 5 points. A supersingular curve does not serve: E: y² = x³ − x over F_3 has the three points (0, 0), (1, 0), (2, 0) and the point at infinity, 4 ≡ 1 mod 3, although E is not universally CH_0-trivial, so the congruence does not imply the hypothesis; Spec `F_{q²}` over F_q is smooth and projective but neither geometrically connected (two points over `F̄_q`) nor universally CH_0-trivial (the difference of the two geometric points has degree 0 and is not torsion, there being no curves to move along), and has 0 ≢ 1 rational points; the empty scheme is excluded by geometric connectedness (its fibres are not connected spaces, which are nonempty) and has 0 points.

### Examples

- ζ^W(Spec F_q, t) = 1/(1 − t).
- X = P¹: `ζ^{<1}` = 1/(1 − t).
- Φ(t) = 1/(1 − qt) (N_r = q^r) satisfies (i)–(iv) with κ = 1.
- For the Igusa surface Y = X/G, X = E_1 × E_2 over F_q with p = 2, E_1 having a rational point t of order 2, and G = ℤ/2 acting by (x, y) ↦ (x + t, −y), G acts trivially on H^i(X, O_X) but not on H²(X, WO_K) ≠ 0 = H²(Y, WO_K): the hypothesis of (iii) on Witt cohomology cannot be replaced by one on O_X when p divides |G|.
- The projective quadric cone X = V(xy − z²) ⊂ P³ over F_q, and its minimal resolution (a Hirzebruch surface F_2) have point counts congruent mod q: |X(F_q)| = q² + q + 1 and |F_2(F_q)| = (q + 1)², and both are ≡ 1 mod q.
- A smooth plane conic (n = 2, d = 2) has q + 1 ≡ 1 mod q points.
- For X = P¹ and D a k-point, (a) holds (both sides 0) and (b) is vacuous (H¹(P¹, O) = 0); the formula reads 1/(1 − t) = 1/(1 − t) · 1.
- For g = 0, V^i: k → `W_{i+1}(k)` sends a to the Witt vector with a in coordinate i and zero elsewhere, hence has zero kernel.
- For an elliptic curve E (g = 1) a theta divisor is a single rational point, and the statement is 1 ≡ 1.
- P^n is universally CH_0-trivial.
- P^n and smooth cubic surfaces are rationally chain connected.
- Smooth Fano varieties over algebraically closed fields are rationally chain connected (Kollár V.2.13), hence universally CH_0-trivial.
- For X = P^n: H^i(P^n, WO) = 0 for i > 0 and `H^{2j}_crys` has slope j.
- A smooth cubic surface over F_q has ≡ 1 mod q points.

### Dependencies

§2.3; §2.4; §3.1; SchemeAndStackFoundations §1.17, `finiteGroupQuotient_projective`; SchemeAndStackFoundations §1.17, admissible invariant quotients (gap:admissible-invariant-quotient-gluing); PadicDifferentialEquationsAndRigidCohomology §RD.6.23, the rigid Lefschetz trace formula; PadicDifferentialEquationsAndRigidCohomology §RD.6.22, the zeta function through closed points; §3.6; §6.1; PadicDifferentialEquationsAndRigidCohomology §RD.7.4, local Fatou; §6.2; §6.3; §0.1; §5.8; §5.5; §6.4; §0.2; §0.6; SchemeAndStackFoundations §2.6, `projectiveSpace_cohomology`; §3.7; SchemeAndStackFoundations §2.20, `cm_serre_duality`; §6.7; AbelianSchemesAndArithmeticModuli §A2.4, `ampleCohomologyAndDegree`; AbelianSchemesAndArithmeticModuli §A4.4, `exteriorCohomology`; SchemeAndStackFoundations §2.6, Künneth formula for quasi-coherent cohomology over a field (gap:quasi-coherent-kunneth); §6.8; §5.11; SchemeAndStackFoundations §5.2, the degree of zero-cycles; SchemeAndStackFoundations §5.1, Chow groups; SchemeAndStackFoundations §5.2, proper pushforward; SchemeAndStackFoundations §5.2, flat pullback; SchemeAndStackFoundations §4.14, `hilbert_quot_schemes`; §6.11; §6.10; SchemeAndStackFoundations §5.1, rational equivalence; §5.12; §5.6; §3.5; CrystallineCohomology §CR.4.7, *Degree filtration and the slope spectral sequence*; §6.13; §6.5; §0.8.

## Downstream consumers

The WO-rationality criteria and the point-count congruences are stated for consumption by a roadmap on the minimal model program in positive characteristic, whose klt singularity theorems in dimensions three and four use the connected-fibre criterion, Witt ideal vanishing, exceptional-fibre reduction, the rigid comparison, the one-quasi-resolution criterion and the congruences modulo q, as in GNT19 and HW23. The minimal model program itself belongs to that consumer.

## References

- BBE07: Pierre Berthelot, Spencer Bloch, Hélène Esnault, *On Witt vector cohomology for singular varieties*, 2005. Theorem 1.1; Propositions 2.1–2.10, 3.2, 6.2–6.9; §6.5. arXiv v1
- BS17: Bhargav Bhatt, Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*, 2015. Theorem 11.40; Proposition 11.41; Lemmas 11.43, 11.45. arXiv v3
- CR12: Andre Chatzistamatiou, Kay Rülling, *Hodge-Witt cohomology and Witt-rational singularities*, 2011. §§1.1, 1.5–1.10, 2.3–2.4, 3.2–3.7, 4.1–4.8. arXiv v1
- CR11: Andre Chatzistamatiou, Kay Rülling, *Higher direct images of the structure sheaf in positive characteristic*, 2009. Definitions 1.1.1, 1.1.14; Theorem 1.2.3; §1.3. arXiv v2
- GNT19: Yoshinori Gongyo, Yusuke Nakamura, Hiromu Tanaka, *Rational points on log Fano threefolds over a finite field*, 2015. §2.5; Lemmas 2.18–2.25; Definition 4.5; Remark 4.6. arXiv v3
- NT20: Yusuke Nakamura, Hiromu Tanaka, *A Witt Nadel vanishing theorem for threefolds*, 2017. §2.1; Remark 2.2; Lemmas 2.17–2.18. arXiv v2
- ESN03: Hélène Esnault, *Varieties over a finite field with trivial Chow group of 0-cycles have a rational point*, 2002. Theorem 1.1; Corollaries 1.2–1.3; §1 p. 2. arXiv v2
- HW23: Christopher Hacon, Jakub Witaszek, *On the relative Minimal Model Program for fourfolds in positive and mixed characteristic*, 2020. §2; Corollary 4.6 and proof, p. 21. arXiv v2; locators use its numbering.
- Tan18: Hiromu Tanaka, *Behavior of canonical divisors under purely inseparable base changes*, 2018. Remark 5.3 (1), p. 20; Proposition A.4, p. 30. arXiv:1502.01381v3, Proposition A.4, p. 30; published J. Reine Angew. Math. 744 (2018), 237–264. Locators use arXiv v3.
- dJ97: A. J. de Jong, *Families of curves and alterations*, 1997. Theorem 5.9; Corollaries 5.10, 5.15, p. 620.
- dJ96: A. J. de Jong, *Smoothness, semi-stability and alterations*, 1996. Corollary 7.4, p. 88.
- Gro85: Michel Gros, *Classes de Chern et classes de cycles en cohomologie de Hodge–Witt logarithmique*, 1985. II, Définition 4.1.7, p. 50.
- Eke84: Torsten Ekedahl, *On the multiplicative properties of the de Rham–Witt complex. I*, 1984. Theorem 4.1 and (2.11); CR12 Theorem 1.10.3. Cited by its locator without the text.
- Kol96: János Kollár, *Rational Curves on Algebraic Varieties*, 1996. IV.3.2.5; IV.3.6; IV.3.13.3; V.2.13. Cited by its locator without the text.
- EkeII: Torsten Ekedahl, *On the multiplicative properties of the de Rham–Witt complex. II*, 1985. CR12 Corollaries 1.10.5–1.10.6. Cited by its locator without the text.
- Ser58Top: Jean-Pierre Serre, *Sur la topologie des variétés algébriques en caractéristique p*, 1958. §1, n° 3 (Opérations de Bockstein), pp. 27–29.
- CT03: Bruno Chiarellotto; Nobuo Tsuzuki, *Cohomological descent of rigid cohomology for étale coverings*, 2003. Theorem 7.3.1; Proposition 11.2.5, pp. 196–197; Corollary 11.2.6, p. 197; §11.
- Tsu03: Nobuo Tsuzuki, *Cohomological descent of rigid cohomology for proper coverings*, 2003. Proper hypercover descent, pp. 101–133. Cited by its locator without the text.
- Del74: Pierre Deligne, *Théorie de Hodge III*, 1974. (6.2.5), pp. 5–77.
- Ser58: Jean-Pierre Serre, *Quelques propriétés des variétés abéliennes en caractéristique p*, 1958. Théorème 2, Amer. J. Math. 80, pp. 715–739. Cited by its locator without the text.
- Ax64: James Ax, *Zeroes of polynomials over finite fields*, 1964. pp. 255–261; BBE07 Proposition 6.3, p. 35. Cited by its locator without the text.
- BS83: Spencer Bloch; V. Srinivas, *Remarks on correspondences and algebraic cycles*, 1983. Proposition 1, pp. 1235–1253. Cited by its locator without the text.
- Tsu04: Nobuo Tsuzuki, *Cohomological descent in rigid cohomology*, 2004. §7.3.3, pp. 931–981. Cited by its locator without the text.
- EGAIII1: Alexander Grothendieck; Jean Dieudonné, *Éléments de géométrie algébrique III, première partie*, 1961. Proposition 3.3.1 and Corollary 3.3.2, pp. 117–118.
- Stacks: The Stacks project authors, *The Stacks project*. Lemma 45.8.2 (tag 0FH6); Lemma 42.15.2 (tag 02RH); Lemma 33.29.1 (tag 0BED).
